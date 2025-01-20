@interface NSPPrivacyProxyTokenAttester
+ (Class)associatedIssuersType;
- (BOOL)hasAuthType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)associatedIssuers;
- (NSString)attesterURL;
- (id)associatedIssuersAtIndex:(unint64_t)a3;
- (id)authTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAuthType:(id)a3;
- (int)authType;
- (unint64_t)associatedIssuersCount;
- (unint64_t)hash;
- (void)addAssociatedIssuers:(id)a3;
- (void)clearAssociatedIssuers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedIssuers:(id)a3;
- (void)setAttesterURL:(id)a3;
- (void)setAuthType:(int)a3;
- (void)setHasAuthType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenAttester

- (int)authType
{
  if (*(unsigned char *)&self->_has) {
    return self->_authType;
  }
  else {
    return 0;
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
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5A3BFF0[a3];
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

- (void)clearAssociatedIssuers
{
}

- (void)addAssociatedIssuers:(id)a3
{
  id v4 = a3;
  associatedIssuers = self->_associatedIssuers;
  id v8 = v4;
  if (!associatedIssuers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_associatedIssuers;
    self->_associatedIssuers = v6;

    id v4 = v8;
    associatedIssuers = self->_associatedIssuers;
  }
  [(NSMutableArray *)associatedIssuers addObject:v4];
}

- (unint64_t)associatedIssuersCount
{
  return [(NSMutableArray *)self->_associatedIssuers count];
}

- (id)associatedIssuersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associatedIssuers objectAtIndex:a3];
}

+ (Class)associatedIssuersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenAttester;
  id v4 = [(NSPPrivacyProxyTokenAttester *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenAttester *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
      v5 = off_1E5A3BFF0[authType];
    }
    [v3 setObject:v5 forKey:@"authType"];
  }
  attesterURL = self->_attesterURL;
  if (attesterURL) {
    [v3 setObject:attesterURL forKey:@"attesterURL"];
  }
  if ([(NSMutableArray *)self->_associatedIssuers count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_associatedIssuers, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_associatedIssuers;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"associatedIssuers"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenAttesterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_attesterURL) {
    __assert_rtn("-[NSPPrivacyProxyTokenAttester writeTo:]", "NSPPrivacyProxyTokenAttester.m", 184, "nil != self->_attesterURL");
  }
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_associatedIssuers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_authType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v9 = v4;
  [v4 setAttesterURL:self->_attesterURL];
  if ([(NSPPrivacyProxyTokenAttester *)self associatedIssuersCount])
  {
    [v9 clearAssociatedIssuers];
    unint64_t v5 = [(NSPPrivacyProxyTokenAttester *)self associatedIssuersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyTokenAttester *)self associatedIssuersAtIndex:i];
        [v9 addAssociatedIssuers:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_authType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_attesterURL copyWithZone:a3];
  uint64_t v8 = (void *)v6[2];
  v6[2] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_associatedIssuers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v6 addAssociatedIssuers:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_authType != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  attesterURL = self->_attesterURL;
  if ((unint64_t)attesterURL | *((void *)v4 + 2)
    && !-[NSString isEqual:](attesterURL, "isEqual:"))
  {
    goto LABEL_11;
  }
  associatedIssuers = self->_associatedIssuers;
  if ((unint64_t)associatedIssuers | *((void *)v4 + 1)) {
    char v7 = -[NSMutableArray isEqual:](associatedIssuers, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_authType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_attesterURL hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_associatedIssuers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_uint64_t authType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NSPPrivacyProxyTokenAttester setAttesterURL:](self, "setAttesterURL:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5[1];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSPPrivacyProxyTokenAttester addAssociatedIssuers:](self, "addAssociatedIssuers:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)attesterURL
{
  return self->_attesterURL;
}

- (void)setAttesterURL:(id)a3
{
}

- (NSMutableArray)associatedIssuers
{
  return self->_associatedIssuers;
}

- (void)setAssociatedIssuers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attesterURL, 0);
  objc_storeStrong((id *)&self->_associatedIssuers, 0);
}

@end