@interface NPKProtoCancelAutoTopUpRequest
+ (Class)balanceIdentifiersType;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)balanceIdentifiers;
- (NSString)uniqueID;
- (id)balanceIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)balanceIdentifiersCount;
- (unint64_t)hash;
- (void)addBalanceIdentifiers:(id)a3;
- (void)clearBalanceIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBalanceIdentifiers:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCancelAutoTopUpRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)clearBalanceIdentifiers
{
}

- (void)addBalanceIdentifiers:(id)a3
{
  id v4 = a3;
  balanceIdentifiers = self->_balanceIdentifiers;
  id v8 = v4;
  if (!balanceIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_balanceIdentifiers;
    self->_balanceIdentifiers = v6;

    id v4 = v8;
    balanceIdentifiers = self->_balanceIdentifiers;
  }
  [(NSMutableArray *)balanceIdentifiers addObject:v4];
}

- (unint64_t)balanceIdentifiersCount
{
  return [(NSMutableArray *)self->_balanceIdentifiers count];
}

- (id)balanceIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_balanceIdentifiers objectAtIndex:a3];
}

+ (Class)balanceIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCancelAutoTopUpRequest;
  id v4 = [(NPKProtoCancelAutoTopUpRequest *)&v8 description];
  v5 = [(NPKProtoCancelAutoTopUpRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  balanceIdentifiers = self->_balanceIdentifiers;
  if (balanceIdentifiers) {
    [v4 setObject:balanceIdentifiers forKey:@"balanceIdentifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCancelAutoTopUpRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_balanceIdentifiers;
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
        PBDataWriterWriteStringField();
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
  id v8 = a3;
  if (self->_uniqueID) {
    objc_msgSend(v8, "setUniqueID:");
  }
  if ([(NPKProtoCancelAutoTopUpRequest *)self balanceIdentifiersCount])
  {
    [v8 clearBalanceIdentifiers];
    unint64_t v4 = [(NPKProtoCancelAutoTopUpRequest *)self balanceIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoCancelAutoTopUpRequest *)self balanceIdentifiersAtIndex:i];
        [v8 addBalanceIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_balanceIdentifiers;
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
        [v5 addBalanceIdentifiers:v13];

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
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[2]))
     || -[NSString isEqual:](uniqueID, "isEqual:")))
  {
    balanceIdentifiers = self->_balanceIdentifiers;
    if ((unint64_t)balanceIdentifiers | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](balanceIdentifiers, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  return [(NSMutableArray *)self->_balanceIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoCancelAutoTopUpRequest setUniqueID:](self, "setUniqueID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[NPKProtoCancelAutoTopUpRequest addBalanceIdentifiers:](self, "addBalanceIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSMutableArray)balanceIdentifiers
{
  return self->_balanceIdentifiers;
}

- (void)setBalanceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_balanceIdentifiers, 0);
}

@end