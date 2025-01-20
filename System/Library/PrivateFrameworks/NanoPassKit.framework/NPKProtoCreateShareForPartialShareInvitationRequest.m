@interface NPKProtoCreateShareForPartialShareInvitationRequest
- (BOOL)hasAuthorizationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authorizationData;
- (NSData)inviteData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationData:(id)a3;
- (void)setInviteData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCreateShareForPartialShareInvitationRequest

- (BOOL)hasAuthorizationData
{
  return self->_authorizationData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCreateShareForPartialShareInvitationRequest;
  v4 = [(NPKProtoCreateShareForPartialShareInvitationRequest *)&v8 description];
  v5 = [(NPKProtoCreateShareForPartialShareInvitationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  inviteData = self->_inviteData;
  if (inviteData) {
    [v3 setObject:inviteData forKey:@"inviteData"];
  }
  authorizationData = self->_authorizationData;
  if (authorizationData) {
    [v4 setObject:authorizationData forKey:@"authorizationData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateShareForPartialShareInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_inviteData) {
    -[NPKProtoCreateShareForPartialShareInvitationRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_authorizationData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setInviteData:self->_inviteData];
  if (self->_authorizationData) {
    objc_msgSend(v4, "setAuthorizationData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_inviteData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_authorizationData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((inviteData = self->_inviteData, !((unint64_t)inviteData | v4[2]))
     || -[NSData isEqual:](inviteData, "isEqual:")))
  {
    authorizationData = self->_authorizationData;
    if ((unint64_t)authorizationData | v4[1]) {
      char v7 = -[NSData isEqual:](authorizationData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_inviteData hash];
  return [(NSData *)self->_authorizationData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCreateShareForPartialShareInvitationRequest setInviteData:](self, "setInviteData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCreateShareForPartialShareInvitationRequest setAuthorizationData:](self, "setAuthorizationData:");
    id v4 = v5;
  }
}

- (NSData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setAuthorizationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteData, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCreateShareForPartialShareInvitationRequest writeTo:]", "NPKProtoCreateShareForPartialShareInvitationRequest.m", 87, "nil != self->_inviteData");
}

@end