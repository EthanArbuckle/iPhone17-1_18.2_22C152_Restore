@interface NPKProtoCarKeyAcceptInvitationRequest
- (BOOL)hasActivationCode;
- (BOOL)hasInvitationIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activationCode;
- (NSString)invitationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationCode:(id)a3;
- (void)setInvitationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyAcceptInvitationRequest

- (BOOL)hasInvitationIdentifier
{
  return self->_invitationIdentifier != 0;
}

- (BOOL)hasActivationCode
{
  return self->_activationCode != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyAcceptInvitationRequest;
  v4 = [(NPKProtoCarKeyAcceptInvitationRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyAcceptInvitationRequest *)self dictionaryRepresentation];
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
  activationCode = self->_activationCode;
  if (activationCode) {
    [v4 setObject:activationCode forKey:@"activationCode"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyAcceptInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invitationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activationCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invitationIdentifier)
  {
    objc_msgSend(v4, "setInvitationIdentifier:");
    id v4 = v5;
  }
  if (self->_activationCode)
  {
    objc_msgSend(v5, "setActivationCode:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_invitationIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_activationCode copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((invitationIdentifier = self->_invitationIdentifier, !((unint64_t)invitationIdentifier | v4[2]))
     || -[NSString isEqual:](invitationIdentifier, "isEqual:")))
  {
    activationCode = self->_activationCode;
    if ((unint64_t)activationCode | v4[1]) {
      char v7 = -[NSString isEqual:](activationCode, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_invitationIdentifier hash];
  return [(NSString *)self->_activationCode hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCarKeyAcceptInvitationRequest setInvitationIdentifier:](self, "setInvitationIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCarKeyAcceptInvitationRequest setActivationCode:](self, "setActivationCode:");
    id v4 = v5;
  }
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end