@interface NPKProtoCarKeyRejectInvitationRequest
- (BOOL)hasMessageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyRejectInvitationRequest

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyRejectInvitationRequest;
  v4 = [(NPKProtoCarKeyRejectInvitationRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyRejectInvitationRequest *)self dictionaryRepresentation];
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
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyRejectInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_messageData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  messageData = self->_messageData;
  if (messageData) {
    [a3 setMessageData:messageData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_messageData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    messageData = self->_messageData;
    if ((unint64_t)messageData | v4[1]) {
      char v6 = -[NSData isEqual:](messageData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_messageData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoCarKeyRejectInvitationRequest setMessageData:](self, "setMessageData:");
  }
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end