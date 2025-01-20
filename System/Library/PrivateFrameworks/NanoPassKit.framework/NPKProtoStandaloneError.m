@interface NPKProtoStandaloneError
+ (Class)userInfosType;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userInfos;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userInfosAtIndex:(unint64_t)a3;
- (int64_t)code;
- (unint64_t)hash;
- (unint64_t)userInfosCount;
- (void)addUserInfos:(id)a3;
- (void)clearUserInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setUserInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneError

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)clearUserInfos
{
}

- (void)addUserInfos:(id)a3
{
  id v4 = a3;
  userInfos = self->_userInfos;
  id v8 = v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    id v4 = v8;
    userInfos = self->_userInfos;
  }
  [(NSMutableArray *)userInfos addObject:v4];
}

- (unint64_t)userInfosCount
{
  return [(NSMutableArray *)self->_userInfos count];
}

- (id)userInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userInfos objectAtIndex:a3];
}

+ (Class)userInfosType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneError;
  id v4 = [(NPKProtoStandaloneError *)&v8 description];
  v5 = [(NPKProtoStandaloneError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  v6 = [NSNumber numberWithLongLong:self->_code];
  [v4 setObject:v6 forKey:@"code"];

  if ([(NSMutableArray *)self->_userInfos count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_userInfos, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_userInfos;
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
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"userInfos"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt64Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_userInfos;
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
  uint64_t v9 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v9;
  }
  v4[1] = self->_code;
  if ([(NPKProtoStandaloneError *)self userInfosCount])
  {
    [v9 clearUserInfos];
    unint64_t v5 = [(NPKProtoStandaloneError *)self userInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoStandaloneError *)self userInfosAtIndex:i];
        [v9 addUserInfos:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_code;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_userInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addUserInfos:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == v4[1])
  {
    userInfos = self->_userInfos;
    if ((unint64_t)userInfos | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](userInfos, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  uint64_t v4 = 2654435761 * self->_code;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_userInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoStandaloneError setDomain:](self, "setDomain:");
  }
  self->_code = *((void *)v4 + 1);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoStandaloneError addUserInfos:](self, "addUserInfos:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end