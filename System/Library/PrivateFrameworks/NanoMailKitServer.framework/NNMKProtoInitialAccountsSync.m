@interface NNMKProtoInitialAccountsSync
+ (Class)initialAccountType;
- (BOOL)hasDateSynced;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasInitialSyncVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dateSynced;
- (NSMutableArray)initialAccounts;
- (NSString)initialSyncVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initialAccountAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)initialAccountsCount;
- (unsigned)fullSyncVersion;
- (void)addInitialAccount:(id)a3;
- (void)clearInitialAccounts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateSynced:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setInitialAccounts:(id)a3;
- (void)setInitialSyncVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoInitialAccountsSync

- (void)clearInitialAccounts
{
}

- (void)addInitialAccount:(id)a3
{
  id v4 = a3;
  initialAccounts = self->_initialAccounts;
  id v8 = v4;
  if (!initialAccounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_initialAccounts;
    self->_initialAccounts = v6;

    id v4 = v8;
    initialAccounts = self->_initialAccounts;
  }
  [(NSMutableArray *)initialAccounts addObject:v4];
}

- (unint64_t)initialAccountsCount
{
  return [(NSMutableArray *)self->_initialAccounts count];
}

- (id)initialAccountAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_initialAccounts objectAtIndex:a3];
}

+ (Class)initialAccountType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInitialSyncVersion
{
  return self->_initialSyncVersion != 0;
}

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDateSynced
{
  return self->_dateSynced != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoInitialAccountsSync;
  id v4 = [(NNMKProtoInitialAccountsSync *)&v8 description];
  v5 = [(NNMKProtoInitialAccountsSync *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_initialAccounts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_initialAccounts, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_initialAccounts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"initialAccount"];
  }
  initialSyncVersion = self->_initialSyncVersion;
  if (initialSyncVersion) {
    [v3 setObject:initialSyncVersion forKey:@"initialSyncVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v3 setObject:v12 forKey:@"fullSyncVersion"];
  }
  dateSynced = self->_dateSynced;
  if (dateSynced) {
    [v3 setObject:dateSynced forKey:@"dateSynced"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoInitialAccountsSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_initialAccounts;
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

  if (self->_initialSyncVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_dateSynced) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(NNMKProtoInitialAccountsSync *)self initialAccountsCount])
  {
    [v9 clearInitialAccounts];
    unint64_t v4 = [(NNMKProtoInitialAccountsSync *)self initialAccountsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NNMKProtoInitialAccountsSync *)self initialAccountAtIndex:i];
        [v9 addInitialAccount:v7];
      }
    }
  }
  if (self->_initialSyncVersion) {
    objc_msgSend(v9, "setInitialSyncVersion:");
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 4) = self->_fullSyncVersion;
    *((unsigned char *)v9 + 40) |= 1u;
  }
  if (self->_dateSynced)
  {
    objc_msgSend(v9, "setDateSynced:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_initialAccounts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [(id)v5 addInitialAccount:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_initialSyncVersion copyWithZone:a3];
  long long v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v14 = -[NSData copyWithZone:](self->_dateSynced, "copyWithZone:", a3, (void)v17);
  uint64_t v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  initialAccounts = self->_initialAccounts;
  if ((unint64_t)initialAccounts | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](initialAccounts, "isEqual:")) {
      goto LABEL_13;
    }
  }
  initialSyncVersion = self->_initialSyncVersion;
  if ((unint64_t)initialSyncVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](initialSyncVersion, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  dateSynced = self->_dateSynced;
  if ((unint64_t)dateSynced | *((void *)v4 + 1)) {
    char v8 = -[NSData isEqual:](dateSynced, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_initialAccounts hash];
  NSUInteger v4 = [(NSString *)self->_initialSyncVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSData *)self->_dateSynced hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
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
        -[NNMKProtoInitialAccountsSync addInitialAccount:](self, "addInitialAccount:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[NNMKProtoInitialAccountsSync setInitialSyncVersion:](self, "setInitialSyncVersion:");
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[NNMKProtoInitialAccountsSync setDateSynced:](self, "setDateSynced:");
  }
}

- (NSMutableArray)initialAccounts
{
  return self->_initialAccounts;
}

- (void)setInitialAccounts:(id)a3
{
}

- (NSString)initialSyncVersion
{
  return self->_initialSyncVersion;
}

- (void)setInitialSyncVersion:(id)a3
{
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSData)dateSynced
{
  return self->_dateSynced;
}

- (void)setDateSynced:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncVersion, 0);
  objc_storeStrong((id *)&self->_initialAccounts, 0);
  objc_storeStrong((id *)&self->_dateSynced, 0);
}

@end