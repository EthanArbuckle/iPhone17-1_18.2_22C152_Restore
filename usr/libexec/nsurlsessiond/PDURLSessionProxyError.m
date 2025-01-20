@interface PDURLSessionProxyError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasUserInfo;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userInfo;
- (NSString)domain;
- (id)_actualError;
- (id)_initWithActualError:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)code;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyError

- (id)_actualError
{
  v3 = [(PDURLSessionProxyError *)self domain];
  unint64_t v4 = [(PDURLSessionProxyError *)self code];
  uint64_t v5 = objc_opt_class();
  v6 = [(PDURLSessionProxyError *)self userInfo];
  v7 = +[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:v5 withData:v6];
  v8 = +[NSError errorWithDomain:v3 code:v4 userInfo:v7];

  return v8;
}

- (id)_initWithActualError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PDURLSessionProxyError *)self init];
  if (v5)
  {
    v6 = [v4 domain];
    [(PDURLSessionProxyError *)v5 setDomain:v6];

    -[PDURLSessionProxyError setCode:](v5, "setCode:", [v4 code]);
    id v7 = [v4 userInfo];
    id v8 = [v7 mutableCopy];
    [v8 removeObjectForKey:@"NSErrorPeerCertificateChainKey"];
    [v8 removeObjectForKey:@"NSErrorClientCertificateChainKey"];
    [v8 removeObjectForKey:NSURLErrorFailingURLPeerTrustErrorKey];
    [v8 removeObjectForKey:NSUnderlyingErrorKey];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000425DC;
    v12[3] = &unk_1000B5828;
    id v9 = v8;
    id v13 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];

    v10 = +[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:v9];
    [(PDURLSessionProxyError *)v5 setUserInfo:v10];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (unsigned)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PDURLSessionProxyError setDomain:](self, "setDomain:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_code = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PDURLSessionProxyError setUserInfo:](self, "setUserInfo:");
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_code;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSData *)self->_userInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
    {
LABEL_17:
      unsigned __int8 v9 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_code != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    goto LABEL_17;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 3)) {
    unsigned __int8 v9 = -[NSData isEqual:](userInfo, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_18:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  id v7 = [(NSString *)self->_domain copyWithZone:a3];
  id v8 = (void *)v6[2];
  v6[2] = v7;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_code;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  id v9 = [(NSData *)self->_userInfo copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  unint64_t v5 = v4;
  if (self->_domain)
  {
    [v4 setDomain:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_code;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_userInfo)
  {
    [v5 setUserInfo:];
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_userInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005DCA4((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v6 = +[NSNumber numberWithUnsignedLongLong:self->_code];
    [v3 setObject:v6 forKey:@"code"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v3 setObject:userInfo forKey:@"userInfo"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyError;
  uint64_t v3 = [(PDURLSessionProxyError *)&v7 description];
  id v4 = [(PDURLSessionProxyError *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCode:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

@end