@interface SDAutoUnlockAuthPromptRequest
- (BOOL)hasAppName;
- (BOOL)hasIconHash;
- (BOOL)hasNavBarTitle;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iconHash;
- (NSString)appName;
- (NSString)navBarTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIconHash:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAuthPromptRequest

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIconHash
{
  return self->_iconHash != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasNavBarTitle
{
  return self->_navBarTitle != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockAuthPromptRequest;
  v3 = [(SDAutoUnlockAuthPromptRequest *)&v7 description];
  v4 = [(SDAutoUnlockAuthPromptRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  iconHash = self->_iconHash;
  if (iconHash) {
    [v3 setObject:iconHash forKey:@"iconHash"];
  }
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  navBarTitle = self->_navBarTitle;
  if (navBarTitle) {
    [v3 setObject:navBarTitle forKey:@"navBarTitle"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_iconHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_appName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_navBarTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v5 = v4;
  if (self->_iconHash)
  {
    [v4 setIconHash:];
    id v4 = v5;
  }
  if (self->_appName)
  {
    [v5 setAppName:];
    id v4 = v5;
  }
  if (self->_navBarTitle)
  {
    [v5 setNavBarTitle:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v7 = [(NSData *)self->_iconHash copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSString *)self->_appName copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(NSString *)self->_navBarTitle copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  iconHash = self->_iconHash;
  if ((unint64_t)iconHash | *((void *)v4 + 2) && !-[NSData isEqual:](iconHash, "isEqual:")) {
    goto LABEL_13;
  }
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appName, "isEqual:")) {
      goto LABEL_13;
    }
  }
  navBarTitle = self->_navBarTitle;
  if ((unint64_t)navBarTitle | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSString isEqual:](navBarTitle, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_iconHash hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_appName hash];
  return v4 ^ v5 ^ [(NSString *)self->_navBarTitle hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[9])
  {
    self->_version = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockAuthPromptRequest setIconHash:](self, "setIconHash:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SDAutoUnlockAuthPromptRequest setAppName:](self, "setAppName:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockAuthPromptRequest setNavBarTitle:](self, "setNavBarTitle:");
    unint64_t v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)iconHash
{
  return self->_iconHash;
}

- (void)setIconHash:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_iconHash, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end