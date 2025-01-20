@interface NNMKProtoAttachmentSync
- (BOOL)hasAttachmentData;
- (BOOL)hasContentId;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasMailboxId;
- (BOOL)hasMessageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)attachmentData;
- (NSData)dateSynced;
- (NSString)contentId;
- (NSString)mailboxId;
- (NSString)messageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fullSyncVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentData:(id)a3;
- (void)setContentId:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setMailboxId:(id)a3;
- (void)setMessageId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoAttachmentSync

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

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasAttachmentData
{
  return self->_attachmentData != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoAttachmentSync;
  v4 = [(NNMKProtoAttachmentSync *)&v8 description];
  v5 = [(NNMKProtoAttachmentSync *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
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
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"contentId"];
  }
  attachmentData = self->_attachmentData;
  if (attachmentData) {
    [v3 setObject:attachmentData forKey:@"attachmentData"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v3 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAttachmentSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_dateSynced)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_attachmentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_mailboxId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_fullSyncVersion;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v5 = v4;
  if (self->_dateSynced)
  {
    objc_msgSend(v4, "setDateSynced:");
    id v4 = v5;
  }
  if (self->_messageId)
  {
    objc_msgSend(v5, "setMessageId:");
    id v4 = v5;
  }
  if (self->_contentId)
  {
    objc_msgSend(v5, "setContentId:");
    id v4 = v5;
  }
  if (self->_attachmentData)
  {
    objc_msgSend(v5, "setAttachmentData:");
    id v4 = v5;
  }
  if (self->_mailboxId)
  {
    objc_msgSend(v5, "setMailboxId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dateSynced copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_messageId copyWithZone:a3];
  v10 = (void *)v6[6];
  v6[6] = v9;

  uint64_t v11 = [(NSString *)self->_contentId copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  uint64_t v13 = [(NSData *)self->_attachmentData copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  uint64_t v15 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 3) && !-[NSData isEqual:](dateSynced, "isEqual:")) {
    goto LABEL_17;
  }
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  attachmentData = self->_attachmentData;
  if ((unint64_t)attachmentData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](attachmentData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  mailboxId = self->_mailboxId;
  if ((unint64_t)mailboxId | *((void *)v4 + 5)) {
    char v10 = -[NSString isEqual:](mailboxId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_dateSynced hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_messageId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_contentId hash];
  uint64_t v7 = [(NSData *)self->_attachmentData hash];
  return v6 ^ v7 ^ [(NSString *)self->_mailboxId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[14])
  {
    self->_fullSyncVersion = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NNMKProtoAttachmentSync setDateSynced:](self, "setDateSynced:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NNMKProtoAttachmentSync setMessageId:](self, "setMessageId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoAttachmentSync setContentId:](self, "setContentId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoAttachmentSync setAttachmentData:](self, "setAttachmentData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NNMKProtoAttachmentSync setMailboxId:](self, "setMailboxId:");
    uint64_t v4 = v5;
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

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSData)attachmentData
{
  return self->_attachmentData;
}

- (void)setAttachmentData:(id)a3
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
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_attachmentData, 0);
}

@end