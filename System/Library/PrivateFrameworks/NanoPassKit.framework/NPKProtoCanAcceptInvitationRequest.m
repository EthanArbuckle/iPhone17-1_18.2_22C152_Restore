@interface NPKProtoCanAcceptInvitationRequest
- (BOOL)hasInvitationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCanAcceptInvitationRequest

- (BOOL)hasInvitationData
{
  return self->_invitationData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCanAcceptInvitationRequest;
  v4 = [(NPKProtoCanAcceptInvitationRequest *)&v8 description];
  v5 = [(NPKProtoCanAcceptInvitationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData) {
    [v3 setObject:invitationData forKey:@"invitationData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCanAcceptInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_invitationData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  invitationData = self->_invitationData;
  if (invitationData) {
    [a3 setInvitationData:invitationData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_invitationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    invitationData = self->_invitationData;
    if ((unint64_t)invitationData | v4[1]) {
      char v6 = -[NSData isEqual:](invitationData, "isEqual:");
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
  return [(NSData *)self->_invitationData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoCanAcceptInvitationRequest setInvitationData:](self, "setInvitationData:");
  }
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end