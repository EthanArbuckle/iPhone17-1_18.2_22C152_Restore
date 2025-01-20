@interface NPKProtoHandleBalanceChangeRequest
+ (Class)balanceBytesType;
- (BOOL)hasPassID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)balanceBytes;
- (NSString)passID;
- (id)balanceBytesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)balanceBytesCount;
- (unint64_t)hash;
- (void)addBalanceBytes:(id)a3;
- (void)clearBalanceBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBalanceBytes:(id)a3;
- (void)setPassID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHandleBalanceChangeRequest

- (BOOL)hasPassID
{
  return self->_passID != 0;
}

- (void)clearBalanceBytes
{
}

- (void)addBalanceBytes:(id)a3
{
  id v4 = a3;
  balanceBytes = self->_balanceBytes;
  id v8 = v4;
  if (!balanceBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_balanceBytes;
    self->_balanceBytes = v6;

    id v4 = v8;
    balanceBytes = self->_balanceBytes;
  }
  [(NSMutableArray *)balanceBytes addObject:v4];
}

- (unint64_t)balanceBytesCount
{
  return [(NSMutableArray *)self->_balanceBytes count];
}

- (id)balanceBytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_balanceBytes objectAtIndex:a3];
}

+ (Class)balanceBytesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoHandleBalanceChangeRequest;
  id v4 = [(NPKProtoHandleBalanceChangeRequest *)&v8 description];
  v5 = [(NPKProtoHandleBalanceChangeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  balanceBytes = self->_balanceBytes;
  if (balanceBytes) {
    [v4 setObject:balanceBytes forKey:@"balanceBytes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandleBalanceChangeRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_passID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_balanceBytes;
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
        PBDataWriterWriteDataField();
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
  if (self->_passID) {
    objc_msgSend(v8, "setPassID:");
  }
  if ([(NPKProtoHandleBalanceChangeRequest *)self balanceBytesCount])
  {
    [v8 clearBalanceBytes];
    unint64_t v4 = [(NPKProtoHandleBalanceChangeRequest *)self balanceBytesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoHandleBalanceChangeRequest *)self balanceBytesAtIndex:i];
        [v8 addBalanceBytes:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_balanceBytes;
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
        [v5 addBalanceBytes:v13];

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
    && ((passID = self->_passID, !((unint64_t)passID | v4[2]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    balanceBytes = self->_balanceBytes;
    if ((unint64_t)balanceBytes | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](balanceBytes, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_passID hash];
  return [(NSMutableArray *)self->_balanceBytes hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoHandleBalanceChangeRequest setPassID:](self, "setPassID:");
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
        -[NPKProtoHandleBalanceChangeRequest addBalanceBytes:](self, "addBalanceBytes:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSMutableArray)balanceBytes
{
  return self->_balanceBytes;
}

- (void)setBalanceBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_balanceBytes, 0);
}

@end