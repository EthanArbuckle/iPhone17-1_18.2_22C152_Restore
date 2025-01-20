@interface PBBProtoDemoWirelessCredentials
- (BOOL)hasCompanionDemoConfig;
- (BOOL)hasPassword;
- (BOOL)hasSsid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)password;
- (NSString)ssid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)companionDemoConfig;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompanionDemoConfig:(unsigned int)a3;
- (void)setHasCompanionDemoConfig:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setSsid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoDemoWirelessCredentials

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (void)setCompanionDemoConfig:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_companionDemoConfig = a3;
}

- (void)setHasCompanionDemoConfig:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompanionDemoConfig
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoDemoWirelessCredentials;
  v4 = [(PBBProtoDemoWirelessCredentials *)&v8 description];
  v5 = [(PBBProtoDemoWirelessCredentials *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  ssid = self->_ssid;
  if (ssid) {
    [v3 setObject:ssid forKey:@"ssid"];
  }
  password = self->_password;
  if (password) {
    [v4 setObject:password forKey:@"password"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_companionDemoConfig];
    [v4 setObject:v7 forKey:@"companionDemoConfig"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoDemoWirelessCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ssid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ssid)
  {
    objc_msgSend(v4, "setSsid:");
    id v4 = v5;
  }
  if (self->_password)
  {
    objc_msgSend(v5, "setPassword:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_companionDemoConfig;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_ssid copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_password copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_companionDemoConfig;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  ssid = self->_ssid;
  if ((unint64_t)ssid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](ssid, "isEqual:")) {
      goto LABEL_10;
    }
  }
  password = self->_password;
  if ((unint64_t)password | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](password, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_companionDemoConfig == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ssid hash];
  NSUInteger v4 = [(NSString *)self->_password hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_companionDemoConfig;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PBBProtoDemoWirelessCredentials setSsid:](self, "setSsid:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PBBProtoDemoWirelessCredentials setPassword:](self, "setPassword:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_companionDemoConfig = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (unsigned)companionDemoConfig
{
  return self->_companionDemoConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end