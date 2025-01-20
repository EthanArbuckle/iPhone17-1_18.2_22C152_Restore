@interface NPKProtoRetrievePaymentTransactionsResponse
+ (Class)transactionPassIDsType;
+ (Class)transactionsBytesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)transactionPassIDs;
- (NSMutableArray)transactionsBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)transactionPassIDsAtIndex:(unint64_t)a3;
- (id)transactionsBytesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)transactionPassIDsCount;
- (unint64_t)transactionsBytesCount;
- (void)addTransactionPassIDs:(id)a3;
- (void)addTransactionsBytes:(id)a3;
- (void)clearTransactionPassIDs;
- (void)clearTransactionsBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTransactionPassIDs:(id)a3;
- (void)setTransactionsBytes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRetrievePaymentTransactionsResponse

- (void)clearTransactionsBytes
{
}

- (void)addTransactionsBytes:(id)a3
{
  id v4 = a3;
  transactionsBytes = self->_transactionsBytes;
  id v8 = v4;
  if (!transactionsBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_transactionsBytes;
    self->_transactionsBytes = v6;

    id v4 = v8;
    transactionsBytes = self->_transactionsBytes;
  }
  [(NSMutableArray *)transactionsBytes addObject:v4];
}

- (unint64_t)transactionsBytesCount
{
  return [(NSMutableArray *)self->_transactionsBytes count];
}

- (id)transactionsBytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transactionsBytes objectAtIndex:a3];
}

+ (Class)transactionsBytesType
{
  return (Class)objc_opt_class();
}

- (void)clearTransactionPassIDs
{
}

- (void)addTransactionPassIDs:(id)a3
{
  id v4 = a3;
  transactionPassIDs = self->_transactionPassIDs;
  id v8 = v4;
  if (!transactionPassIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_transactionPassIDs;
    self->_transactionPassIDs = v6;

    id v4 = v8;
    transactionPassIDs = self->_transactionPassIDs;
  }
  [(NSMutableArray *)transactionPassIDs addObject:v4];
}

- (unint64_t)transactionPassIDsCount
{
  return [(NSMutableArray *)self->_transactionPassIDs count];
}

- (id)transactionPassIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transactionPassIDs objectAtIndex:a3];
}

+ (Class)transactionPassIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRetrievePaymentTransactionsResponse;
  id v4 = [(NPKProtoRetrievePaymentTransactionsResponse *)&v8 description];
  v5 = [(NPKProtoRetrievePaymentTransactionsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  transactionsBytes = self->_transactionsBytes;
  if (transactionsBytes) {
    [v3 setObject:transactionsBytes forKey:@"transactionsBytes"];
  }
  transactionPassIDs = self->_transactionPassIDs;
  if (transactionPassIDs) {
    [v4 setObject:transactionPassIDs forKey:@"transactionPassIDs"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRetrievePaymentTransactionsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_transactionsBytes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_transactionPassIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(NPKProtoRetrievePaymentTransactionsResponse *)self transactionsBytesCount])
  {
    [v12 clearTransactionsBytes];
    unint64_t v4 = [(NPKProtoRetrievePaymentTransactionsResponse *)self transactionsBytesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoRetrievePaymentTransactionsResponse *)self transactionsBytesAtIndex:i];
        [v12 addTransactionsBytes:v7];
      }
    }
  }
  if ([(NPKProtoRetrievePaymentTransactionsResponse *)self transactionPassIDsCount])
  {
    [v12 clearTransactionPassIDs];
    unint64_t v8 = [(NPKProtoRetrievePaymentTransactionsResponse *)self transactionPassIDsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoRetrievePaymentTransactionsResponse *)self transactionPassIDsAtIndex:j];
        [v12 addTransactionPassIDs:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_transactionsBytes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTransactionsBytes:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_transactionPassIDs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addTransactionPassIDs:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transactionsBytes = self->_transactionsBytes, !((unint64_t)transactionsBytes | v4[2]))
     || -[NSMutableArray isEqual:](transactionsBytes, "isEqual:")))
  {
    transactionPassIDs = self->_transactionPassIDs;
    if ((unint64_t)transactionPassIDs | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](transactionPassIDs, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_transactionsBytes hash];
  return [(NSMutableArray *)self->_transactionPassIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoRetrievePaymentTransactionsResponse *)self addTransactionsBytes:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPKProtoRetrievePaymentTransactionsResponse addTransactionPassIDs:](self, "addTransactionPassIDs:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)transactionsBytes
{
  return self->_transactionsBytes;
}

- (void)setTransactionsBytes:(id)a3
{
}

- (NSMutableArray)transactionPassIDs
{
  return self->_transactionPassIDs;
}

- (void)setTransactionPassIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsBytes, 0);
  objc_storeStrong((id *)&self->_transactionPassIDs, 0);
}

@end