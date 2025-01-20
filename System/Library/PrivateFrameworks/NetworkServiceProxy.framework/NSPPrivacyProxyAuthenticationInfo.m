@interface NSPPrivacyProxyAuthenticationInfo
+ (Class)accessTokenBlockedIssuersType;
+ (Class)accessTokenKnownOriginsType;
+ (Class)nonDefaultAttestersType;
- (BOOL)hasAccessTokenURL;
- (BOOL)hasAuthType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)accessTokenBlockedIssuers;
- (NSMutableArray)accessTokenKnownOrigins;
- (NSMutableArray)nonDefaultAttesters;
- (NSString)accessTokenURL;
- (NSString)authURL;
- (id)accessTokenBlockedIssuersAtIndex:(unint64_t)a3;
- (id)accessTokenKnownOriginsAtIndex:(unint64_t)a3;
- (id)authTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nonDefaultAttestersAtIndex:(unint64_t)a3;
- (int)StringAsAuthType:(id)a3;
- (int)authType;
- (unint64_t)accessTokenBlockedIssuersCount;
- (unint64_t)accessTokenKnownOriginsCount;
- (unint64_t)accessTokenTypesCount;
- (unint64_t)hash;
- (unint64_t)nonDefaultAttestersCount;
- (unsigned)accessTokenTypes;
- (unsigned)accessTokenTypesAtIndex:(unint64_t)a3;
- (void)addAccessTokenBlockedIssuers:(id)a3;
- (void)addAccessTokenKnownOrigins:(id)a3;
- (void)addAccessTokenTypes:(unsigned int)a3;
- (void)addNonDefaultAttesters:(id)a3;
- (void)clearAccessTokenBlockedIssuers;
- (void)clearAccessTokenKnownOrigins;
- (void)clearAccessTokenTypes;
- (void)clearNonDefaultAttesters;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessTokenBlockedIssuers:(id)a3;
- (void)setAccessTokenKnownOrigins:(id)a3;
- (void)setAccessTokenTypes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAccessTokenURL:(id)a3;
- (void)setAuthType:(int)a3;
- (void)setAuthURL:(id)a3;
- (void)setHasAuthType:(BOOL)a3;
- (void)setNonDefaultAttesters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyAuthenticationInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyAuthenticationInfo;
  [(NSPPrivacyProxyAuthenticationInfo *)&v3 dealloc];
}

- (int)authType
{
  if (*(unsigned char *)&self->_has) {
    return self->_authType;
  }
  else {
    return 3;
  }
}

- (void)setAuthType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authType = a3;
}

- (void)setHasAuthType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)authTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E5A3B558[a3];
  }
  return v3;
}

- (int)StringAsAuthType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BAA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANISETTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BAA_ANISETTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOKEN"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAccessTokenURL
{
  return self->_accessTokenURL != 0;
}

- (unint64_t)accessTokenTypesCount
{
  return self->_accessTokenTypes.count;
}

- (unsigned)accessTokenTypes
{
  return self->_accessTokenTypes.list;
}

- (void)clearAccessTokenTypes
{
}

- (void)addAccessTokenTypes:(unsigned int)a3
{
}

- (unsigned)accessTokenTypesAtIndex:(unint64_t)a3
{
  p_accessTokenTypes = &self->_accessTokenTypes;
  unint64_t count = self->_accessTokenTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_accessTokenTypes->list[a3];
}

- (void)setAccessTokenTypes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearAccessTokenKnownOrigins
{
}

- (void)addAccessTokenKnownOrigins:(id)a3
{
  id v4 = a3;
  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  id v8 = v4;
  if (!accessTokenKnownOrigins)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_accessTokenKnownOrigins;
    self->_accessTokenKnownOrigins = v6;

    id v4 = v8;
    accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  }
  [(NSMutableArray *)accessTokenKnownOrigins addObject:v4];
}

- (unint64_t)accessTokenKnownOriginsCount
{
  return [(NSMutableArray *)self->_accessTokenKnownOrigins count];
}

- (id)accessTokenKnownOriginsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessTokenKnownOrigins objectAtIndex:a3];
}

+ (Class)accessTokenKnownOriginsType
{
  return (Class)objc_opt_class();
}

- (void)clearAccessTokenBlockedIssuers
{
}

- (void)addAccessTokenBlockedIssuers:(id)a3
{
  id v4 = a3;
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  id v8 = v4;
  if (!accessTokenBlockedIssuers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_accessTokenBlockedIssuers;
    self->_accessTokenBlockedIssuers = v6;

    id v4 = v8;
    accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  }
  [(NSMutableArray *)accessTokenBlockedIssuers addObject:v4];
}

- (unint64_t)accessTokenBlockedIssuersCount
{
  return [(NSMutableArray *)self->_accessTokenBlockedIssuers count];
}

- (id)accessTokenBlockedIssuersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessTokenBlockedIssuers objectAtIndex:a3];
}

+ (Class)accessTokenBlockedIssuersType
{
  return (Class)objc_opt_class();
}

- (void)clearNonDefaultAttesters
{
}

- (void)addNonDefaultAttesters:(id)a3
{
  id v4 = a3;
  nonDefaultAttesters = self->_nonDefaultAttesters;
  id v8 = v4;
  if (!nonDefaultAttesters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nonDefaultAttesters;
    self->_nonDefaultAttesters = v6;

    id v4 = v8;
    nonDefaultAttesters = self->_nonDefaultAttesters;
  }
  [(NSMutableArray *)nonDefaultAttesters addObject:v4];
}

- (unint64_t)nonDefaultAttestersCount
{
  return [(NSMutableArray *)self->_nonDefaultAttesters count];
}

- (id)nonDefaultAttestersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nonDefaultAttesters objectAtIndex:a3];
}

+ (Class)nonDefaultAttestersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyAuthenticationInfo;
  id v4 = [(NSPPrivacyProxyAuthenticationInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyAuthenticationInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t authType = self->_authType;
    if (authType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_authType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A3B558[authType];
    }
    [v3 setObject:v5 forKey:@"authType"];
  }
  authURL = self->_authURL;
  if (authURL) {
    [v3 setObject:authURL forKey:@"authURL"];
  }
  accessTokenURL = self->_accessTokenURL;
  if (accessTokenURL) {
    [v3 setObject:accessTokenURL forKey:@"accessTokenURL"];
  }
  objc_super v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"accessTokenTypes"];

  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  if (accessTokenKnownOrigins) {
    [v3 setObject:accessTokenKnownOrigins forKey:@"accessTokenKnownOrigins"];
  }
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  if (accessTokenBlockedIssuers) {
    [v3 setObject:accessTokenBlockedIssuers forKey:@"accessTokenBlockedIssuers"];
  }
  if ([(NSMutableArray *)self->_nonDefaultAttesters count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nonDefaultAttesters, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_nonDefaultAttesters;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"nonDefaultAttesters"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyAuthenticationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_authURL) {
    __assert_rtn("-[NSPPrivacyProxyAuthenticationInfo writeTo:]", "NSPPrivacyProxyAuthenticationInfo.m", 341, "nil != self->_authURL");
  }
  PBDataWriterWriteStringField();
  if (self->_accessTokenURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessTokenTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_accessTokenTypes.count);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_accessTokenKnownOrigins;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_accessTokenBlockedIssuers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = self->_nonDefaultAttesters;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_authType;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  id v20 = v4;
  [v4 setAuthURL:self->_authURL];
  if (self->_accessTokenURL) {
    objc_msgSend(v20, "setAccessTokenURL:");
  }
  if ([(NSPPrivacyProxyAuthenticationInfo *)self accessTokenTypesCount])
  {
    [v20 clearAccessTokenTypes];
    unint64_t v5 = [(NSPPrivacyProxyAuthenticationInfo *)self accessTokenTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v20, "addAccessTokenTypes:", -[NSPPrivacyProxyAuthenticationInfo accessTokenTypesAtIndex:](self, "accessTokenTypesAtIndex:", i));
    }
  }
  if ([(NSPPrivacyProxyAuthenticationInfo *)self accessTokenKnownOriginsCount])
  {
    [v20 clearAccessTokenKnownOrigins];
    unint64_t v8 = [(NSPPrivacyProxyAuthenticationInfo *)self accessTokenKnownOriginsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(NSPPrivacyProxyAuthenticationInfo *)self accessTokenKnownOriginsAtIndex:j];
        [v20 addAccessTokenKnownOrigins:v11];
      }
    }
  }
  if ([(NSPPrivacyProxyAuthenticationInfo *)self accessTokenBlockedIssuersCount])
  {
    [v20 clearAccessTokenBlockedIssuers];
    unint64_t v12 = [(NSPPrivacyProxyAuthenticationInfo *)self accessTokenBlockedIssuersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(NSPPrivacyProxyAuthenticationInfo *)self accessTokenBlockedIssuersAtIndex:k];
        [v20 addAccessTokenBlockedIssuers:v15];
      }
    }
  }
  if ([(NSPPrivacyProxyAuthenticationInfo *)self nonDefaultAttestersCount])
  {
    [v20 clearNonDefaultAttesters];
    unint64_t v16 = [(NSPPrivacyProxyAuthenticationInfo *)self nonDefaultAttestersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(NSPPrivacyProxyAuthenticationInfo *)self nonDefaultAttestersAtIndex:m];
        [v20 addNonDefaultAttesters:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_authType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_authURL copyWithZone:a3];
  unint64_t v8 = (void *)v6[8];
  v6[8] = v7;

  uint64_t v9 = [(NSString *)self->_accessTokenURL copyWithZone:a3];
  uint64_t v10 = (void *)v6[6];
  v6[6] = v9;

  PBRepeatedUInt32Copy();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v11 = self->_accessTokenKnownOrigins;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
        [v6 addAccessTokenKnownOrigins:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v17 = self->_accessTokenBlockedIssuers;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * j) copyWithZone:a3];
        [v6 addAccessTokenBlockedIssuers:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v19);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v23 = self->_nonDefaultAttesters;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (void)v30);
        [v6 addNonDefaultAttesters:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v25);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_authType != *((_DWORD *)v4 + 14)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_18:
    char v10 = 0;
    goto LABEL_19;
  }
  authURL = self->_authURL;
  if ((unint64_t)authURL | *((void *)v4 + 8) && !-[NSString isEqual:](authURL, "isEqual:")) {
    goto LABEL_18;
  }
  accessTokenURL = self->_accessTokenURL;
  if ((unint64_t)accessTokenURL | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](accessTokenURL, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_18;
  }
  accessTokenKnownOrigins = self->_accessTokenKnownOrigins;
  if ((unint64_t)accessTokenKnownOrigins | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](accessTokenKnownOrigins, "isEqual:")) {
      goto LABEL_18;
    }
  }
  accessTokenBlockedIssuers = self->_accessTokenBlockedIssuers;
  if ((unint64_t)accessTokenBlockedIssuers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](accessTokenBlockedIssuers, "isEqual:")) {
      goto LABEL_18;
    }
  }
  nonDefaultAttesters = self->_nonDefaultAttesters;
  if ((unint64_t)nonDefaultAttesters | *((void *)v4 + 9)) {
    char v10 = -[NSMutableArray isEqual:](nonDefaultAttesters, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_authType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_authURL hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_accessTokenURL hash];
  uint64_t v6 = v4 ^ v5 ^ PBRepeatedUInt32Hash();
  uint64_t v7 = [(NSMutableArray *)self->_accessTokenKnownOrigins hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_accessTokenBlockedIssuers hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_nonDefaultAttesters hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[20])
  {
    self->_uint64_t authType = v4[14];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8)) {
    -[NSPPrivacyProxyAuthenticationInfo setAuthURL:](self, "setAuthURL:");
  }
  if (*((void *)v5 + 6)) {
    -[NSPPrivacyProxyAuthenticationInfo setAccessTokenURL:](self, "setAccessTokenURL:");
  }
  uint64_t v6 = [v5 accessTokenTypesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[NSPPrivacyProxyAuthenticationInfo addAccessTokenTypes:](self, "addAccessTokenTypes:", [v5 accessTokenTypesAtIndex:i]);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = *((id *)v5 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSPPrivacyProxyAuthenticationInfo *)self addAccessTokenKnownOrigins:*(void *)(*((void *)&v32 + 1) + 8 * j)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = *((id *)v5 + 4);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NSPPrivacyProxyAuthenticationInfo *)self addAccessTokenBlockedIssuers:*(void *)(*((void *)&v28 + 1) + 8 * k)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = *((id *)v5 + 9);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[NSPPrivacyProxyAuthenticationInfo addNonDefaultAttesters:](self, "addNonDefaultAttesters:", *(void *)(*((void *)&v24 + 1) + 8 * m), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
}

- (NSString)accessTokenURL
{
  return self->_accessTokenURL;
}

- (void)setAccessTokenURL:(id)a3
{
}

- (NSMutableArray)accessTokenKnownOrigins
{
  return self->_accessTokenKnownOrigins;
}

- (void)setAccessTokenKnownOrigins:(id)a3
{
}

- (NSMutableArray)accessTokenBlockedIssuers
{
  return self->_accessTokenBlockedIssuers;
}

- (void)setAccessTokenBlockedIssuers:(id)a3
{
}

- (NSMutableArray)nonDefaultAttesters
{
  return self->_nonDefaultAttesters;
}

- (void)setNonDefaultAttesters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDefaultAttesters, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_storeStrong((id *)&self->_accessTokenURL, 0);
  objc_storeStrong((id *)&self->_accessTokenKnownOrigins, 0);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, 0);
}

@end