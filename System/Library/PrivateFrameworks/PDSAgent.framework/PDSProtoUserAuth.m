@interface PDSProtoUserAuth
- (BOOL)hasGsAuthToken;
- (BOOL)hasUserauthOneof;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDSProtoGSTokenAuth)gsAuthToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userauthOneofAsString:(int)a3;
- (int)StringAsUserauthOneof:(id)a3;
- (int)userauthOneof;
- (unint64_t)hash;
- (void)clearOneofValuesForUserauthOneof;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGsAuthToken:(id)a3;
- (void)setHasUserauthOneof:(BOOL)a3;
- (void)setUserauthOneof:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoUserAuth

- (BOOL)hasGsAuthToken
{
  return self->_gsAuthToken != 0;
}

- (void)setGsAuthToken:(id)a3
{
  v4 = (PDSProtoGSTokenAuth *)a3;
  [(PDSProtoUserAuth *)self clearOneofValuesForUserauthOneof];
  *(unsigned char *)&self->_has |= 1u;
  self->_userauthOneof = 1;
  gsAuthToken = self->_gsAuthToken;
  self->_gsAuthToken = v4;
}

- (int)userauthOneof
{
  if (*(unsigned char *)&self->_has) {
    return self->_userauthOneof;
  }
  else {
    return 0;
  }
}

- (void)setUserauthOneof:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_userauthOneof = a3;
}

- (void)setHasUserauthOneof:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserauthOneof
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)userauthOneofAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"gsAuthToken";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"PBUNSET";
  }
  return v4;
}

- (int)StringAsUserauthOneof:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"gsAuthToken"];
  }

  return v4;
}

- (void)clearOneofValuesForUserauthOneof
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_userauthOneof = 0;
  self->_gsAuthToken = 0;
  MEMORY[0x270F9A758]();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoUserAuth;
  int v4 = [(PDSProtoUserAuth *)&v8 description];
  v5 = [(PDSProtoUserAuth *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  gsAuthToken = self->_gsAuthToken;
  if (gsAuthToken)
  {
    v5 = [(PDSProtoGSTokenAuth *)gsAuthToken dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"gsAuthToken"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int userauthOneof = self->_userauthOneof;
    if (userauthOneof)
    {
      if (userauthOneof == 1)
      {
        v7 = @"gsAuthToken";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userauthOneof);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"PBUNSET";
    }
    [v3 setObject:v7 forKey:@"userauth_oneof"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_gsAuthToken) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_userauthOneof;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_gsAuthToken)
  {
    v5 = v4;
    objc_msgSend(v4, "setGsAuthToken:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_userauthOneof;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(PDSProtoGSTokenAuth *)self->_gsAuthToken copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_userauthOneof != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  gsAuthToken = self->_gsAuthToken;
  if ((unint64_t)gsAuthToken | *((void *)v4 + 1)) {
    char v6 = -[PDSProtoGSTokenAuth isEqual:](gsAuthToken, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_userauthOneof;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(PDSProtoGSTokenAuth *)self->_gsAuthToken hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[5])
  {
    self->_int userauthOneof = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  gsAuthToken = self->_gsAuthToken;
  uint64_t v7 = *((void *)v5 + 1);
  if (gsAuthToken)
  {
    if (v7) {
      -[PDSProtoGSTokenAuth mergeFrom:](gsAuthToken, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDSProtoUserAuth setGsAuthToken:](self, "setGsAuthToken:");
  }
  MEMORY[0x270F9A758]();
}

- (PDSProtoGSTokenAuth)gsAuthToken
{
  return self->_gsAuthToken;
}

- (void).cxx_destruct
{
}

@end