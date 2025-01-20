@interface _MRAVAirPlaySecuritySettingsProtobuf
- (BOOL)hasPassword;
- (BOOL)hasSecurityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)password;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)securityTypeAsString:(int)a3;
- (int)StringAsSecurityType:(id)a3;
- (int)securityType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setSecurityType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAVAirPlaySecuritySettingsProtobuf

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (int)securityType
{
  if (*(unsigned char *)&self->_has) {
    return self->_securityType;
  }
  else {
    return 0;
  }
}

- (void)setSecurityType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecurityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)securityTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D2C98[a3];
  }

  return v3;
}

- (int)StringAsSecurityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NoneForInfraWiFi"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PINFirstTime"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PINEveryTime"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Password"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAVAirPlaySecuritySettingsProtobuf;
  int v4 = [(_MRAVAirPlaySecuritySettingsProtobuf *)&v8 description];
  v5 = [(_MRAVAirPlaySecuritySettingsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  password = self->_password;
  if (password) {
    [v3 setObject:password forKey:@"password"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t securityType = self->_securityType;
    if (securityType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_securityType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57D2C98[securityType];
    }
    [v4 setObject:v7 forKey:@"securityType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVAirPlaySecuritySettingsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_password)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPassword:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_securityType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_password copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_securityType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  password = self->_password;
  if ((unint64_t)password | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](password, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_securityType == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_password hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_securityType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[_MRAVAirPlaySecuritySettingsProtobuf setPassword:](self, "setPassword:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_uint64_t securityType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
}

@end