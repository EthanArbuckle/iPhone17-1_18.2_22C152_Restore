@interface NTPBKeyValueStore
+ (Class)keyValuePairsType;
- (BOOL)hasClientVersion;
- (BOOL)hasPlistSidecar;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plistSidecar;
- (NSMutableArray)keyValuePairs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyValuePairsAtIndex:(unint64_t)a3;
- (int64_t)clientVersion;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)keyValuePairsCount;
- (void)addKeyValuePairs:(id)a3;
- (void)clearKeyValuePairs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientVersion:(int64_t)a3;
- (void)setHasClientVersion:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)setPlistSidecar:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBKeyValueStore

- (void)dealloc
{
  [(NTPBKeyValueStore *)self setKeyValuePairs:0];
  [(NTPBKeyValueStore *)self setPlistSidecar:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValueStore;
  [(NTPBKeyValueStore *)&v3 dealloc];
}

- (void)setPlistSidecar:(id)a3
{
}

- (void)setKeyValuePairs:(id)a3
{
}

- (NSData)plistSidecar
{
  return self->_plistSidecar;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBKeyValueStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addKeyValuePairs:(id)a3
{
  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    keyValuePairs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_keyValuePairs = keyValuePairs;
  }

  [(NSMutableArray *)keyValuePairs addObject:a3];
}

- (int64_t)clientVersion
{
  return self->_clientVersion;
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setClientVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientVersion = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasClientVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearKeyValuePairs
{
}

- (unint64_t)keyValuePairsCount
{
  return [(NSMutableArray *)self->_keyValuePairs count];
}

- (id)keyValuePairsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyValuePairs objectAtIndex:a3];
}

+ (Class)keyValuePairsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPlistSidecar
{
  return self->_plistSidecar != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValueStore;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBKeyValueStore description](&v3, sel_description), -[NTPBKeyValueStore dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_version), @"version");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_clientVersion), @"client_version");
  }
  if ([(NSMutableArray *)self->_keyValuePairs count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyValuePairs, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    keyValuePairs = self->_keyValuePairs;
    uint64_t v7 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(keyValuePairs);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v8 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"key_value_pairs"];
  }
  plistSidecar = self->_plistSidecar;
  if (plistSidecar) {
    [v3 setObject:plistSidecar forKey:@"plist_sidecar"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  keyValuePairs = self->_keyValuePairs;
  uint64_t v6 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(keyValuePairs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (self->_plistSidecar) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (id *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_version;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_clientVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  keyValuePairs = self->_keyValuePairs;
  uint64_t v9 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(keyValuePairs);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addKeyValuePairs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)keyValuePairs countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v6[4] = (id)[(NSData *)self->_plistSidecar copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_version != *((void *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_clientVersion != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_16;
    }
    keyValuePairs = self->_keyValuePairs;
    if (!((unint64_t)keyValuePairs | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](keyValuePairs, "isEqual:")) != 0)
    {
      plistSidecar = self->_plistSidecar;
      if ((unint64_t)plistSidecar | *((void *)a3 + 4))
      {
        LOBYTE(v5) = -[NSData isEqual:](plistSidecar, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_clientVersion;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_keyValuePairs hash];
  return v5 ^ [(NSData *)self->_plistSidecar hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_version = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if (v5)
  {
    self->_clientVersion = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 3);
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
        [(NTPBKeyValueStore *)self addKeyValuePairs:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if (*((void *)a3 + 4)) {
    -[NTPBKeyValueStore setPlistSidecar:](self, "setPlistSidecar:");
  }
}

@end