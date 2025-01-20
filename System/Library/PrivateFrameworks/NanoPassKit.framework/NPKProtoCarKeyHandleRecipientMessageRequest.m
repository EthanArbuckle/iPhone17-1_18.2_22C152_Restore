@interface NPKProtoCarKeyHandleRecipientMessageRequest
- (BOOL)hasInvitationIdentifier;
- (BOOL)hasMessageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageData;
- (NSString)invitationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationIdentifier:(id)a3;
- (void)setMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyHandleRecipientMessageRequest

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (BOOL)hasInvitationIdentifier
{
  return self->_invitationIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyHandleRecipientMessageRequest;
  v4 = [(NPKProtoCarKeyHandleRecipientMessageRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyHandleRecipientMessageRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier) {
    [v4 setObject:invitationIdentifier forKey:@"invitationIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyHandleRecipientMessageRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_invitationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_messageData)
  {
    objc_msgSend(v4, "setMessageData:");
    id v4 = v5;
  }
  if (self->_invitationIdentifier)
  {
    objc_msgSend(v5, "setInvitationIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_messageData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_invitationIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((messageData = self->_messageData, !((unint64_t)messageData | v4[2]))
     || -[NSData isEqual:](messageData, "isEqual:")))
  {
    invitationIdentifier = self->_invitationIdentifier;
    if ((unint64_t)invitationIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](invitationIdentifier, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_messageData hash];
  return [(NSString *)self->_invitationIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCarKeyHandleRecipientMessageRequest setMessageData:](self, "setMessageData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCarKeyHandleRecipientMessageRequest setInvitationIdentifier:](self, "setInvitationIdentifier:");
    id v4 = v5;
  }
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end