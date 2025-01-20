@interface AuthCredential
- (BOOL)hasAuthCredentialOneof;
- (BOOL)hasSharedOwnershipAuth;
- (BOOL)hasSimpleJwt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)simpleJwt;
- (SharedOwnershipAuth)sharedOwnershipAuth;
- (id)authCredentialOneofAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAuthCredentialOneof:(id)a3;
- (int)authCredentialOneof;
- (unint64_t)hash;
- (void)clearOneofValuesForAuthCredentialOneof;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthCredentialOneof:(int)a3;
- (void)setHasAuthCredentialOneof:(BOOL)a3;
- (void)setSharedOwnershipAuth:(id)a3;
- (void)setSimpleJwt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AuthCredential

- (BOOL)hasSimpleJwt
{
  return self->_simpleJwt != 0;
}

- (void)setSimpleJwt:(id)a3
{
  v4 = (NSString *)a3;
  [(AuthCredential *)self clearOneofValuesForAuthCredentialOneof];
  *(unsigned char *)&self->_has |= 1u;
  self->_authCredentialOneof = 1;
  simpleJwt = self->_simpleJwt;
  self->_simpleJwt = v4;
}

- (BOOL)hasSharedOwnershipAuth
{
  return self->_sharedOwnershipAuth != 0;
}

- (void)setSharedOwnershipAuth:(id)a3
{
  v4 = (SharedOwnershipAuth *)a3;
  [(AuthCredential *)self clearOneofValuesForAuthCredentialOneof];
  *(unsigned char *)&self->_has |= 1u;
  self->_authCredentialOneof = 2;
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  self->_sharedOwnershipAuth = v4;
}

- (int)authCredentialOneof
{
  if (*(unsigned char *)&self->_has) {
    return self->_authCredentialOneof;
  }
  else {
    return 0;
  }
}

- (void)setAuthCredentialOneof:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authCredentialOneof = a3;
}

- (void)setHasAuthCredentialOneof:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthCredentialOneof
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)authCredentialOneofAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646E1DB8[a3];
  }
  return v3;
}

- (int)StringAsAuthCredentialOneof:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"simple_jwt"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"shared_ownership_auth"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForAuthCredentialOneof
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_authCredentialOneof = 0;
  simpleJwt = self->_simpleJwt;
  self->_simpleJwt = 0;

  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  self->_sharedOwnershipAuth = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AuthCredential;
  int v4 = [(AuthCredential *)&v8 description];
  v5 = [(AuthCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  simpleJwt = self->_simpleJwt;
  if (simpleJwt) {
    [v3 setObject:simpleJwt forKey:@"simple_jwt"];
  }
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  if (sharedOwnershipAuth)
  {
    v7 = [(SharedOwnershipAuth *)sharedOwnershipAuth dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"shared_ownership_auth"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t authCredentialOneof = self->_authCredentialOneof;
    if (authCredentialOneof >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_authCredentialOneof);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_2646E1DB8[authCredentialOneof];
    }
    [v4 setObject:v9 forKey:@"auth_credential_oneof"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AuthCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_simpleJwt)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sharedOwnershipAuth)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_authCredentialOneof;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_simpleJwt)
  {
    objc_msgSend(v4, "setSimpleJwt:");
    id v4 = v5;
  }
  if (self->_sharedOwnershipAuth)
  {
    objc_msgSend(v5, "setSharedOwnershipAuth:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_authCredentialOneof;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_simpleJwt copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(SharedOwnershipAuth *)self->_sharedOwnershipAuth copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_authCredentialOneof != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  simpleJwt = self->_simpleJwt;
  if ((unint64_t)simpleJwt | *((void *)v4 + 3) && !-[NSString isEqual:](simpleJwt, "isEqual:")) {
    goto LABEL_11;
  }
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  if ((unint64_t)sharedOwnershipAuth | *((void *)v4 + 2)) {
    char v7 = -[SharedOwnershipAuth isEqual:](sharedOwnershipAuth, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_authCredentialOneof;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_simpleJwt hash] ^ v3;
  return v4 ^ [(SharedOwnershipAuth *)self->_sharedOwnershipAuth hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (v4[8])
  {
    self->_uint64_t authCredentialOneof = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  objc_super v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[AuthCredential setSimpleJwt:](self, "setSimpleJwt:");
    uint64_t v5 = v8;
  }
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  uint64_t v7 = *((void *)v5 + 2);
  if (sharedOwnershipAuth)
  {
    if (v7) {
      -[SharedOwnershipAuth mergeFrom:](sharedOwnershipAuth, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AuthCredential setSharedOwnershipAuth:](self, "setSharedOwnershipAuth:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)simpleJwt
{
  return self->_simpleJwt;
}

- (SharedOwnershipAuth)sharedOwnershipAuth
{
  return self->_sharedOwnershipAuth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleJwt, 0);
  objc_storeStrong((id *)&self->_sharedOwnershipAuth, 0);
}

@end