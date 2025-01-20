@interface NNMKProtoErrorDownloadingContentForMessageWarning
- (BOOL)hasMailboxId;
- (BOOL)hasMessageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mailboxId;
- (NSString)messageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMailboxId:(id)a3;
- (void)setMessageId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoErrorDownloadingContentForMessageWarning

- (BOOL)hasMessageId
{
  return self->_messageId != 0;
}

- (BOOL)hasMailboxId
{
  return self->_mailboxId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoErrorDownloadingContentForMessageWarning;
  v4 = [(NNMKProtoErrorDownloadingContentForMessageWarning *)&v8 description];
  v5 = [(NNMKProtoErrorDownloadingContentForMessageWarning *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  messageId = self->_messageId;
  if (messageId) {
    [v3 setObject:messageId forKey:@"messageId"];
  }
  mailboxId = self->_mailboxId;
  if (mailboxId) {
    [v4 setObject:mailboxId forKey:@"mailboxId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoErrorDownloadingContentForMessageWarningReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
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
  id v5 = v4;
  if (self->_messageId)
  {
    objc_msgSend(v4, "setMessageId:");
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
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_messageId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_mailboxId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((messageId = self->_messageId, !((unint64_t)messageId | v4[2]))
     || -[NSString isEqual:](messageId, "isEqual:")))
  {
    mailboxId = self->_mailboxId;
    if ((unint64_t)mailboxId | v4[1]) {
      char v7 = -[NSString isEqual:](mailboxId, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_messageId hash];
  return [(NSString *)self->_mailboxId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NNMKProtoErrorDownloadingContentForMessageWarning setMessageId:](self, "setMessageId:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NNMKProtoErrorDownloadingContentForMessageWarning setMailboxId:](self, "setMailboxId:");
    id v4 = v5;
  }
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
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
}

@end