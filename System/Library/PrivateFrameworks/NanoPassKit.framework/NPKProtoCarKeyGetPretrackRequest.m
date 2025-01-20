@interface NPKProtoCarKeyGetPretrackRequest
- (BOOL)hasInvitationIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)invitationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyGetPretrackRequest

- (BOOL)hasInvitationIdentifier
{
  return self->_invitationIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyGetPretrackRequest;
  v4 = [(NPKProtoCarKeyGetPretrackRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyGetPretrackRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier) {
    [v3 setObject:invitationIdentifier forKey:@"invitationIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyGetPretrackRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_invitationIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier) {
    [a3 setInvitationIdentifier:invitationIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_invitationIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    invitationIdentifier = self->_invitationIdentifier;
    if ((unint64_t)invitationIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](invitationIdentifier, "isEqual:");
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
  return [(NSString *)self->_invitationIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoCarKeyGetPretrackRequest setInvitationIdentifier:](self, "setInvitationIdentifier:");
  }
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
}

@end