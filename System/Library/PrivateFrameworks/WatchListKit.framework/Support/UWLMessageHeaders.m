@interface UWLMessageHeaders
+ (Class)cookiesType;
- (BOOL)hasClientVersion;
- (BOOL)hasPfm;
- (BOOL)hasXGuid;
- (BOOL)hasXUseridKey;
- (BOOL)hasXUseridKeyspace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cookies;
- (NSString)pfm;
- (NSString)userAgent;
- (NSString)xAppleStorefront;
- (NSString)xDsid;
- (NSString)xGuid;
- (NSString)xUseridKey;
- (NSString)xUseridKeyspace;
- (id)cookiesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clientVersion;
- (unint64_t)cookiesCount;
- (unint64_t)hash;
- (void)addCookies:(id)a3;
- (void)clearCookies;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientVersion:(int)a3;
- (void)setCookies:(id)a3;
- (void)setHasClientVersion:(BOOL)a3;
- (void)setPfm:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setXAppleStorefront:(id)a3;
- (void)setXDsid:(id)a3;
- (void)setXGuid:(id)a3;
- (void)setXUseridKey:(id)a3;
- (void)setXUseridKeyspace:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLMessageHeaders

- (BOOL)hasXGuid
{
  return self->_xGuid != 0;
}

- (BOOL)hasXUseridKeyspace
{
  return self->_xUseridKeyspace != 0;
}

- (BOOL)hasXUseridKey
{
  return self->_xUseridKey != 0;
}

- (void)clearCookies
{
}

- (void)addCookies:(id)a3
{
  id v4 = a3;
  cookies = self->_cookies;
  id v8 = v4;
  if (!cookies)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_cookies;
    self->_cookies = v6;

    id v4 = v8;
    cookies = self->_cookies;
  }
  [(NSMutableArray *)cookies addObject:v4];
}

- (unint64_t)cookiesCount
{
  return (unint64_t)[(NSMutableArray *)self->_cookies count];
}

- (id)cookiesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cookies objectAtIndex:a3];
}

+ (Class)cookiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPfm
{
  return self->_pfm != 0;
}

- (void)setClientVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientVersion = a3;
}

- (void)setHasClientVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLMessageHeaders;
  v3 = [(UWLMessageHeaders *)&v7 description];
  id v4 = [(UWLMessageHeaders *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"user_agent"];
  }
  xDsid = self->_xDsid;
  if (xDsid) {
    [v4 setObject:xDsid forKey:@"x_dsid"];
  }
  xAppleStorefront = self->_xAppleStorefront;
  if (xAppleStorefront) {
    [v4 setObject:xAppleStorefront forKey:@"x_apple_storefront"];
  }
  xGuid = self->_xGuid;
  if (xGuid) {
    [v4 setObject:xGuid forKey:@"x_guid"];
  }
  xUseridKeyspace = self->_xUseridKeyspace;
  if (xUseridKeyspace) {
    [v4 setObject:xUseridKeyspace forKey:@"x_userid_keyspace"];
  }
  xUseridKey = self->_xUseridKey;
  if (xUseridKey) {
    [v4 setObject:xUseridKey forKey:@"x_userid_key"];
  }
  if ([(NSMutableArray *)self->_cookies count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cookies, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = self->_cookies;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"cookies"];
  }
  pfm = self->_pfm;
  if (pfm) {
    [v4 setObject:pfm forKey:@"pfm"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v19 = +[NSNumber numberWithInt:self->_clientVersion];
    [v4 setObject:v19 forKey:@"client_version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLMessageHeadersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_xGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_xUseridKeyspace) {
    PBDataWriterWriteStringField();
  }
  if (self->_xUseridKey) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_cookies;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_pfm) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setUserAgent:self->_userAgent];
  [v8 setXDsid:self->_xDsid];
  [v8 setXAppleStorefront:self->_xAppleStorefront];
  if (self->_xGuid) {
    objc_msgSend(v8, "setXGuid:");
  }
  if (self->_xUseridKeyspace) {
    objc_msgSend(v8, "setXUseridKeyspace:");
  }
  if (self->_xUseridKey) {
    objc_msgSend(v8, "setXUseridKey:");
  }
  if ([(UWLMessageHeaders *)self cookiesCount])
  {
    [v8 clearCookies];
    unint64_t v4 = [(UWLMessageHeaders *)self cookiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(UWLMessageHeaders *)self cookiesAtIndex:i];
        [v8 addCookies:v7];
      }
    }
  }
  if (self->_pfm) {
    objc_msgSend(v8, "setPfm:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 2) = self->_clientVersion;
    *((unsigned char *)v8 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_userAgent copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_xDsid copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(NSString *)self->_xAppleStorefront copyWithZone:a3];
  long long v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSString *)self->_xGuid copyWithZone:a3];
  long long v13 = (void *)v5[7];
  v5[7] = v12;

  id v14 = [(NSString *)self->_xUseridKeyspace copyWithZone:a3];
  uint64_t v15 = (void *)v5[9];
  v5[9] = v14;

  id v16 = [(NSString *)self->_xUseridKey copyWithZone:a3];
  v17 = (void *)v5[8];
  v5[8] = v16;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v18 = self->_cookies;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v22), "copyWithZone:", a3, (void)v27);
        [v5 addCookies:v23];

        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  id v24 = [(NSString *)self->_pfm copyWithZone:a3];
  v25 = (void *)v5[3];
  v5[3] = v24;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_clientVersion;
    *((unsigned char *)v5 + 80) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:")) {
      goto LABEL_22;
    }
  }
  xDsid = self->_xDsid;
  if ((unint64_t)xDsid | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](xDsid, "isEqual:")) {
      goto LABEL_22;
    }
  }
  xAppleStorefront = self->_xAppleStorefront;
  if ((unint64_t)xAppleStorefront | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](xAppleStorefront, "isEqual:")) {
      goto LABEL_22;
    }
  }
  xGuid = self->_xGuid;
  if ((unint64_t)xGuid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](xGuid, "isEqual:")) {
      goto LABEL_22;
    }
  }
  xUseridKeyspace = self->_xUseridKeyspace;
  if ((unint64_t)xUseridKeyspace | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](xUseridKeyspace, "isEqual:")) {
      goto LABEL_22;
    }
  }
  xUseridKey = self->_xUseridKey;
  if ((unint64_t)xUseridKey | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](xUseridKey, "isEqual:")) {
      goto LABEL_22;
    }
  }
  cookies = self->_cookies;
  if ((unint64_t)cookies | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](cookies, "isEqual:")) {
      goto LABEL_22;
    }
  }
  pfm = self->_pfm;
  if ((unint64_t)pfm | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](pfm, "isEqual:")) {
      goto LABEL_22;
    }
  }
  BOOL v13 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) != 0 && self->_clientVersion == *((_DWORD *)v4 + 2))
    {
      BOOL v13 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v13 = 0;
  }
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_userAgent hash];
  NSUInteger v4 = [(NSString *)self->_xDsid hash];
  NSUInteger v5 = [(NSString *)self->_xAppleStorefront hash];
  NSUInteger v6 = [(NSString *)self->_xGuid hash];
  NSUInteger v7 = [(NSString *)self->_xUseridKeyspace hash];
  NSUInteger v8 = [(NSString *)self->_xUseridKey hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_cookies hash];
  NSUInteger v10 = [(NSString *)self->_pfm hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_clientVersion;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[UWLMessageHeaders setUserAgent:](self, "setUserAgent:");
  }
  if (*((void *)v4 + 6)) {
    -[UWLMessageHeaders setXDsid:](self, "setXDsid:");
  }
  if (*((void *)v4 + 5)) {
    -[UWLMessageHeaders setXAppleStorefront:](self, "setXAppleStorefront:");
  }
  if (*((void *)v4 + 7)) {
    -[UWLMessageHeaders setXGuid:](self, "setXGuid:");
  }
  if (*((void *)v4 + 9)) {
    -[UWLMessageHeaders setXUseridKeyspace:](self, "setXUseridKeyspace:");
  }
  if (*((void *)v4 + 8)) {
    -[UWLMessageHeaders setXUseridKey:](self, "setXUseridKey:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UWLMessageHeaders addCookies:](self, "addCookies:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[UWLMessageHeaders setPfm:](self, "setPfm:");
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_clientVersion = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)xDsid
{
  return self->_xDsid;
}

- (void)setXDsid:(id)a3
{
}

- (NSString)xAppleStorefront
{
  return self->_xAppleStorefront;
}

- (void)setXAppleStorefront:(id)a3
{
}

- (NSString)xGuid
{
  return self->_xGuid;
}

- (void)setXGuid:(id)a3
{
}

- (NSString)xUseridKeyspace
{
  return self->_xUseridKeyspace;
}

- (void)setXUseridKeyspace:(id)a3
{
}

- (NSString)xUseridKey
{
  return self->_xUseridKey;
}

- (void)setXUseridKey:(id)a3
{
}

- (NSMutableArray)cookies
{
  return self->_cookies;
}

- (void)setCookies:(id)a3
{
}

- (NSString)pfm
{
  return self->_pfm;
}

- (void)setPfm:(id)a3
{
}

- (int)clientVersion
{
  return self->_clientVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xUseridKeyspace, 0);
  objc_storeStrong((id *)&self->_xUseridKey, 0);
  objc_storeStrong((id *)&self->_xGuid, 0);
  objc_storeStrong((id *)&self->_xDsid, 0);
  objc_storeStrong((id *)&self->_xAppleStorefront, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_pfm, 0);

  objc_storeStrong((id *)&self->_cookies, 0);
}

@end