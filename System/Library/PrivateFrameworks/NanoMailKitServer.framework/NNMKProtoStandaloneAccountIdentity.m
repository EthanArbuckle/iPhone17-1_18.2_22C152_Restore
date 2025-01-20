@interface NNMKProtoStandaloneAccountIdentity
- (BOOL)hasAccountIdentifier;
- (BOOL)hasDisplayName;
- (BOOL)hasIdentityType;
- (BOOL)hasRefreshToken;
- (BOOL)hasToken;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accountIdentifier;
- (NSString)displayName;
- (NSString)refreshToken;
- (NSString)token;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)identityType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasIdentityType:(BOOL)a3;
- (void)setIdentityType:(unsigned int)a3;
- (void)setRefreshToken:(id)a3;
- (void)setToken:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoStandaloneAccountIdentity

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasRefreshToken
{
  return self->_refreshToken != 0;
}

- (void)setIdentityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_identityType = a3;
}

- (void)setHasIdentityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdentityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoStandaloneAccountIdentity;
  v4 = [(NNMKProtoStandaloneAccountIdentity *)&v8 description];
  v5 = [(NNMKProtoStandaloneAccountIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  username = self->_username;
  if (username) {
    [v3 setObject:username forKey:@"username"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  token = self->_token;
  if (token) {
    [v4 setObject:token forKey:@"token"];
  }
  refreshToken = self->_refreshToken;
  if (refreshToken) {
    [v4 setObject:refreshToken forKey:@"refreshToken"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_identityType];
    [v4 setObject:v9 forKey:@"identityType"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoStandaloneAccountIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_refreshToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    id v4 = v5;
  }
  if (self->_refreshToken)
  {
    objc_msgSend(v5, "setRefreshToken:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_identityType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v5, "setAccountIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_username copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_token copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_refreshToken copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_identityType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  username = self->_username;
  if ((unint64_t)username | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](username, "isEqual:")) {
      goto LABEL_17;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](token, "isEqual:")) {
      goto LABEL_17;
    }
  }
  refreshToken = self->_refreshToken;
  if ((unint64_t)refreshToken | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](refreshToken, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_identityType != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 1)) {
    char v10 = -[NSString isEqual:](accountIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_username hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash];
  NSUInteger v5 = [(NSString *)self->_token hash];
  NSUInteger v6 = [(NSString *)self->_refreshToken hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_identityType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_accountIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 6))
  {
    -[NNMKProtoStandaloneAccountIdentity setUsername:](self, "setUsername:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoStandaloneAccountIdentity setDisplayName:](self, "setDisplayName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NNMKProtoStandaloneAccountIdentity setToken:](self, "setToken:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NNMKProtoStandaloneAccountIdentity setRefreshToken:](self, "setRefreshToken:");
    NSUInteger v4 = v5;
  }
  if (v4[14])
  {
    self->_identityType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoStandaloneAccountIdentity setAccountIdentifier:](self, "setAccountIdentifier:");
    NSUInteger v4 = v5;
  }
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
}

- (unsigned)identityType
{
  return self->_identityType;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end