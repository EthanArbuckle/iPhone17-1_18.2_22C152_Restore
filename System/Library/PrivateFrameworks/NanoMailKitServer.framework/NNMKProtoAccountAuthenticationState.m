@interface NNMKProtoAccountAuthenticationState
- (BOOL)hasAccountId;
- (BOOL)hasDisplayName;
- (BOOL)hasEmailAddressToken;
- (BOOL)hasPccEmailAddress;
- (BOOL)hasStandaloneState;
- (BOOL)hasSubsectionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accountId;
- (NSString)displayName;
- (NSString)emailAddressToken;
- (NSString)pccEmailAddress;
- (NSString)subsectionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)standaloneState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressToken:(id)a3;
- (void)setHasStandaloneState:(BOOL)a3;
- (void)setPccEmailAddress:(id)a3;
- (void)setStandaloneState:(unsigned int)a3;
- (void)setSubsectionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoAccountAuthenticationState

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (void)setStandaloneState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_standaloneState = a3;
}

- (void)setHasStandaloneState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStandaloneState
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSubsectionId
{
  return self->_subsectionId != 0;
}

- (BOOL)hasEmailAddressToken
{
  return self->_emailAddressToken != 0;
}

- (BOOL)hasPccEmailAddress
{
  return self->_pccEmailAddress != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoAccountAuthenticationState;
  v4 = [(NNMKProtoAccountAuthenticationState *)&v8 description];
  v5 = [(NNMKProtoAccountAuthenticationState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  accountId = self->_accountId;
  if (accountId) {
    [v3 setObject:accountId forKey:@"accountId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_standaloneState];
    [v4 setObject:v6 forKey:@"standaloneState"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  subsectionId = self->_subsectionId;
  if (subsectionId) {
    [v4 setObject:subsectionId forKey:@"subsectionId"];
  }
  emailAddressToken = self->_emailAddressToken;
  if (emailAddressToken) {
    [v4 setObject:emailAddressToken forKey:@"emailAddressToken"];
  }
  pccEmailAddress = self->_pccEmailAddress;
  if (pccEmailAddress) {
    [v4 setObject:pccEmailAddress forKey:@"pccEmailAddress"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAccountAuthenticationStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subsectionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_emailAddressToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pccEmailAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_standaloneState;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_subsectionId)
  {
    objc_msgSend(v5, "setSubsectionId:");
    id v4 = v5;
  }
  if (self->_emailAddressToken)
  {
    objc_msgSend(v5, "setEmailAddressToken:");
    id v4 = v5;
  }
  if (self->_pccEmailAddress)
  {
    objc_msgSend(v5, "setPccEmailAddress:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_standaloneState;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_subsectionId copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_emailAddressToken copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_pccEmailAddress copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_standaloneState != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2)
    && !-[NSString isEqual:](displayName, "isEqual:"))
  {
    goto LABEL_17;
  }
  subsectionId = self->_subsectionId;
  if ((unint64_t)subsectionId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](subsectionId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  emailAddressToken = self->_emailAddressToken;
  if ((unint64_t)emailAddressToken | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](emailAddressToken, "isEqual:")) {
      goto LABEL_17;
    }
  }
  pccEmailAddress = self->_pccEmailAddress;
  if ((unint64_t)pccEmailAddress | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](pccEmailAddress, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_standaloneState;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_displayName hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_subsectionId hash];
  NSUInteger v8 = [(NSString *)self->_emailAddressToken hash];
  return v7 ^ v8 ^ [(NSString *)self->_pccEmailAddress hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NNMKProtoAccountAuthenticationState setAccountId:](self, "setAccountId:");
    uint64_t v4 = v5;
  }
  if (v4[14])
  {
    self->_standaloneState = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NNMKProtoAccountAuthenticationState setDisplayName:](self, "setDisplayName:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NNMKProtoAccountAuthenticationState setSubsectionId:](self, "setSubsectionId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NNMKProtoAccountAuthenticationState setEmailAddressToken:](self, "setEmailAddressToken:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NNMKProtoAccountAuthenticationState setPccEmailAddress:](self, "setPccEmailAddress:");
    uint64_t v4 = v5;
  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (unsigned)standaloneState
{
  return self->_standaloneState;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)subsectionId
{
  return self->_subsectionId;
}

- (void)setSubsectionId:(id)a3
{
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsectionId, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end