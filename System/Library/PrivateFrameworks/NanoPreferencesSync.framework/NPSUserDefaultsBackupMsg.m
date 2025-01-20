@interface NPSUserDefaultsBackupMsg
+ (Class)keyType;
- (BOOL)hasContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keys;
- (NSString)container;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysCount;
- (void)addKey:(id)a3;
- (void)clearKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDomain:(id)a3;
- (void)setKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPSUserDefaultsBackupMsg

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (void)clearKeys
{
}

- (void)addKey:(id)a3
{
  id v4 = a3;
  keys = self->_keys;
  id v8 = v4;
  if (!keys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_keys;
    self->_keys = v6;

    id v4 = v8;
    keys = self->_keys;
  }
  [(NSMutableArray *)keys addObject:v4];
}

- (unint64_t)keysCount
{
  return (unint64_t)[(NSMutableArray *)self->_keys count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_keys objectAtIndex:a3];
}

+ (Class)keyType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPSUserDefaultsBackupMsg;
  v3 = [(NPSUserDefaultsBackupMsg *)&v7 description];
  id v4 = [(NPSUserDefaultsBackupMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  container = self->_container;
  if (container) {
    [v3 setObject:container forKey:@"container"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  if ([(NSMutableArray *)self->_keys count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_keys, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = self->_keys;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"key"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100004F90((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_container) {
    PBDataWriterWriteStringField();
  }
  if (!self->_domain) {
    sub_10002882C();
  }
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keys;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_container)
  {
    objc_msgSend(v4, "setContainer:");
    id v4 = v9;
  }
  [v4 setDomain:self->_domain];
  if ([(NPSUserDefaultsBackupMsg *)self keysCount])
  {
    [v9 clearKeys];
    unint64_t v5 = [(NPSUserDefaultsBackupMsg *)self keysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPSUserDefaultsBackupMsg *)self keyAtIndex:i];
        [v9 addKey:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_container copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_domain copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_keys;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "copyWithZone:", a3, (void)v17);
        [v5 addKey:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((container = self->_container, !((unint64_t)container | v4[1]))
     || -[NSString isEqual:](container, "isEqual:"))
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:")))
  {
    keys = self->_keys;
    if ((unint64_t)keys | v4[3]) {
      unsigned __int8 v8 = -[NSMutableArray isEqual:](keys, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_container hash];
  unint64_t v4 = [(NSString *)self->_domain hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_keys hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NPSUserDefaultsBackupMsg setContainer:](self, "setContainer:");
  }
  if (*((void *)v4 + 2)) {
    -[NPSUserDefaultsBackupMsg setDomain:](self, "setDomain:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[NPSUserDefaultsBackupMsg addKey:](self, "addKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end