@interface NNMKProtoMessageContentSync
+ (Class)attachmentType;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasHtmlContentData;
- (BOOL)hasMailboxId;
- (BOOL)hasMainAlternativeValid;
- (BOOL)hasMessageId;
- (BOOL)hasNotificationMessage;
- (BOOL)hasPartiallyLoaded;
- (BOOL)hasPreview;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)mainAlternativeValid;
- (BOOL)partiallyLoaded;
- (BOOL)readFrom:(id)a3;
- (NNMKProtoMessage)notificationMessage;
- (NSData)dateSynced;
- (NSData)htmlContentData;
- (NSData)preview;
- (NSData)text;
- (NSMutableArray)attachments;
- (NSString)mailboxId;
- (NSString)messageId;
- (id)attachmentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attachmentsCount;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (void)addAttachment:(id)a3;
- (void)clearAttachments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasMainAlternativeValid:(BOOL)a3;
- (void)setHasPartiallyLoaded:(BOOL)a3;
- (void)setHtmlContentData:(id)a3;
- (void)setMailboxId:(id)a3;
- (void)setMainAlternativeValid:(BOOL)a3;
- (void)setMessageId:(id)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setPartiallyLoaded:(BOOL)a3;
- (void)setPreview:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoMessageContentSync

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDateSynced
{
  return self->_dateSynced != 0;
}

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (void)setMainAlternativeValid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mainAlternativeValid = a3;
}

- (void)setHasMainAlternativeValid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMainAlternativeValid
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasPreview
{
  return self->_preview != 0;
}

- (void)setPartiallyLoaded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_partiallyLoaded = a3;
}

- (void)setHasPartiallyLoaded:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPartiallyLoaded
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearAttachments
{
}

- (void)addAttachment:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  id v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_attachments;
    self->_attachments = v6;

    id v4 = v8;
    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v4];
}

- (unint64_t)attachmentsCount
{
  return [(NSMutableArray *)self->_attachments count];
}

- (id)attachmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attachments objectAtIndex:a3];
}

+ (Class)attachmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationMessage
{
  return self->_notificationMessage != 0;
}

- (BOOL)hasHtmlContentData
{
  return self->_htmlContentData != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoMessageContentSync;
  id v4 = [(NNMKProtoMessageContentSync *)&v8 description];
  v5 = [(NNMKProtoMessageContentSync *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v4 forKey:@"fullSyncVersion"];
  }
  dateSynced = self->_dateSynced;
  if (dateSynced) {
    [v3 setObject:dateSynced forKey:@"dateSynced"];
  }
  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKey:@"messageId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_mainAlternativeValid];
    [v3 setObject:v7 forKey:@"mainAlternativeValid"];
  }
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  preview = self->_preview;
  if (preview) {
    [v3 setObject:preview forKey:@"preview"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_partiallyLoaded];
    [v3 setObject:v10 forKey:@"partiallyLoaded"];
  }
  if ([(NSMutableArray *)self->_attachments count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = self->_attachments;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"attachment"];
  }
  notificationMessage = self->_notificationMessage;
  if (notificationMessage)
  {
    v19 = [(NNMKProtoMessage *)notificationMessage dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"notificationMessage"];
  }
  htmlContentData = self->_htmlContentData;
  if (htmlContentData) {
    [v3 setObject:htmlContentData forKey:@"htmlContentData"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoMessageContentSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_dateSynced) {
    PBDataWriterWriteDataField();
  }
  if (self->_messageId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_text) {
    PBDataWriterWriteDataField();
  }
  if (self->_preview) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_attachments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_notificationMessage) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_htmlContentData) {
    PBDataWriterWriteDataField();
  }
  if (self->_mailboxId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  long long v10 = v4;
  if (self->_dateSynced)
  {
    objc_msgSend(v4, "setDateSynced:");
    id v4 = v10;
  }
  if (self->_messageId)
  {
    objc_msgSend(v10, "setMessageId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_mainAlternativeValid;
    *((unsigned char *)v4 + 84) |= 2u;
  }
  if (self->_text)
  {
    objc_msgSend(v10, "setText:");
    id v4 = v10;
  }
  if (self->_preview)
  {
    objc_msgSend(v10, "setPreview:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 81) = self->_partiallyLoaded;
    *((unsigned char *)v4 + 84) |= 4u;
  }
  if ([(NNMKProtoMessageContentSync *)self attachmentsCount])
  {
    [v10 clearAttachments];
    unint64_t v5 = [(NNMKProtoMessageContentSync *)self attachmentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoMessageContentSync *)self attachmentAtIndex:i];
        [v10 addAttachment:v8];
      }
    }
  }
  if (self->_notificationMessage) {
    objc_msgSend(v10, "setNotificationMessage:");
  }
  uint64_t v9 = v10;
  if (self->_htmlContentData)
  {
    objc_msgSend(v10, "setHtmlContentData:");
    uint64_t v9 = v10;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v10, "setMailboxId:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_messageId copyWithZone:a3];
  long long v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_mainAlternativeValid;
    *(unsigned char *)(v6 + 84) |= 2u;
  }
  uint64_t v11 = [(NSData *)self->_text copyWithZone:a3];
  long long v12 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v11;

  uint64_t v13 = [(NSData *)self->_preview copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 81) = self->_partiallyLoaded;
    *(unsigned char *)(v6 + 84) |= 4u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v15 = self->_attachments;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v19), "copyWithZone:", a3, (void)v28);
        [(id)v6 addAttachment:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  id v21 = [(NNMKProtoMessage *)self->_notificationMessage copyWithZone:a3];
  v22 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v21;

  uint64_t v23 = [(NSData *)self->_htmlContentData copyWithZone:a3];
  long long v24 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v23;

  uint64_t v25 = [(NSString *)self->_mailboxId copyWithZone:a3];
  long long v26 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_39;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 2) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_39;
  }
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0) {
      goto LABEL_39;
    }
    if (self->_mainAlternativeValid)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_39;
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 9) && !-[NSData isEqual:](text, "isEqual:")) {
    goto LABEL_39;
  }
  preview = self->_preview;
  if ((unint64_t)preview | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](preview, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) != 0)
    {
      if (self->_partiallyLoaded)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_39;
        }
        goto LABEL_31;
      }
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_31;
      }
    }
LABEL_39:
    char v13 = 0;
    goto LABEL_40;
  }
  if ((*((unsigned char *)v4 + 84) & 4) != 0) {
    goto LABEL_39;
  }
LABEL_31:
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](attachments, "isEqual:"))
  {
    goto LABEL_39;
  }
  notificationMessage = self->_notificationMessage;
  if ((unint64_t)notificationMessage | *((void *)v4 + 7))
  {
    if (!-[NNMKProtoMessage isEqual:](notificationMessage, "isEqual:")) {
      goto LABEL_39;
    }
  }
  htmlContentData = self->_htmlContentData;
  if ((unint64_t)htmlContentData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](htmlContentData, "isEqual:")) {
      goto LABEL_39;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 5)) {
    char v13 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_40:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_dateSynced hash];
  NSUInteger v5 = [(NSString *)self->_messageId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_mainAlternativeValid;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSData *)self->_text hash];
  uint64_t v8 = [(NSData *)self->_preview hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_partiallyLoaded;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  uint64_t v11 = [(NSMutableArray *)self->_attachments hash];
  unint64_t v12 = v11 ^ [(NNMKProtoMessage *)self->_notificationMessage hash];
  uint64_t v13 = v12 ^ [(NSData *)self->_htmlContentData hash];
  return v10 ^ v13 ^ [(NSString *)self->_mailboxId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[21])
  {
    self->_fullSyncVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoMessageContentSync setDateSynced:](self, "setDateSynced:");
  }
  if (*((void *)v5 + 6)) {
    -[NNMKProtoMessageContentSync setMessageId:](self, "setMessageId:");
  }
  if ((*((unsigned char *)v5 + 84) & 2) != 0)
  {
    self->_mainAlternativeValid = *((unsigned char *)v5 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 9)) {
    -[NNMKProtoMessageContentSync setText:](self, "setText:");
  }
  if (*((void *)v5 + 8)) {
    -[NNMKProtoMessageContentSync setPreview:](self, "setPreview:");
  }
  if ((*((unsigned char *)v5 + 84) & 4) != 0)
  {
    self->_partiallyLoaded = *((unsigned char *)v5 + 81);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v5 + 1);
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
        -[NNMKProtoMessageContentSync addAttachment:](self, "addAttachment:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  notificationMessage = self->_notificationMessage;
  uint64_t v12 = *((void *)v5 + 7);
  if (notificationMessage)
  {
    if (v12) {
      -[NNMKProtoMessage mergeFrom:](notificationMessage, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NNMKProtoMessageContentSync setNotificationMessage:](self, "setNotificationMessage:");
  }
  if (*((void *)v5 + 4)) {
    -[NNMKProtoMessageContentSync setHtmlContentData:](self, "setHtmlContentData:");
  }
  if (*((void *)v5 + 5)) {
    -[NNMKProtoMessageContentSync setMailboxId:](self, "setMailboxId:");
  }
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSData)dateSynced
{
  return self->_dateSynced;
}

- (void)setDateSynced:(id)a3
{
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (BOOL)mainAlternativeValid
{
  return self->_mainAlternativeValid;
}

- (NSData)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSData)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (BOOL)partiallyLoaded
{
  return self->_partiallyLoaded;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NNMKProtoMessage)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (void)setMailboxId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end