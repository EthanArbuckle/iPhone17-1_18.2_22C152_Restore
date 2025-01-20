@interface NPKProtoHandlePaymentTransactionsRequest
+ (Class)passAppletStatesType;
+ (Class)transactionPassIDsType;
+ (Class)transactionsBytesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)passAppletStates;
- (NSMutableArray)transactionPassIDs;
- (NSMutableArray)transactionsBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)passAppletStatesAtIndex:(unint64_t)a3;
- (id)transactionPassIDsAtIndex:(unint64_t)a3;
- (id)transactionsBytesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)passAppletStatesCount;
- (unint64_t)transactionPassIDsCount;
- (unint64_t)transactionsBytesCount;
- (void)addPassAppletStates:(id)a3;
- (void)addTransactionPassIDs:(id)a3;
- (void)addTransactionsBytes:(id)a3;
- (void)clearPassAppletStates;
- (void)clearTransactionPassIDs;
- (void)clearTransactionsBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassAppletStates:(id)a3;
- (void)setTransactionPassIDs:(id)a3;
- (void)setTransactionsBytes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHandlePaymentTransactionsRequest

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

- (void)clearPassAppletStates
{
}

- (void)addPassAppletStates:(id)a3
{
  id v4 = a3;
  passAppletStates = self->_passAppletStates;
  id v8 = v4;
  if (!passAppletStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_passAppletStates;
    self->_passAppletStates = v6;

    id v4 = v8;
    passAppletStates = self->_passAppletStates;
  }
  [(NSMutableArray *)passAppletStates addObject:v4];
}

- (unint64_t)passAppletStatesCount
{
  return [(NSMutableArray *)self->_passAppletStates count];
}

- (id)passAppletStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_passAppletStates objectAtIndex:a3];
}

+ (Class)passAppletStatesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoHandlePaymentTransactionsRequest;
  id v4 = [(NPKProtoHandlePaymentTransactionsRequest *)&v8 description];
  v5 = [(NPKProtoHandlePaymentTransactionsRequest *)self dictionaryRepresentation];
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
  passAppletStates = self->_passAppletStates;
  if (passAppletStates) {
    [v4 setObject:passAppletStates forKey:@"passAppletStates"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandlePaymentTransactionsRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_transactionsBytes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_transactionPassIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_passAppletStates;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteDataField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(NPKProtoHandlePaymentTransactionsRequest *)self transactionsBytesCount])
  {
    [v16 clearTransactionsBytes];
    unint64_t v4 = [(NPKProtoHandlePaymentTransactionsRequest *)self transactionsBytesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoHandlePaymentTransactionsRequest *)self transactionsBytesAtIndex:i];
        [v16 addTransactionsBytes:v7];
      }
    }
  }
  if ([(NPKProtoHandlePaymentTransactionsRequest *)self transactionPassIDsCount])
  {
    [v16 clearTransactionPassIDs];
    unint64_t v8 = [(NPKProtoHandlePaymentTransactionsRequest *)self transactionPassIDsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoHandlePaymentTransactionsRequest *)self transactionPassIDsAtIndex:j];
        [v16 addTransactionPassIDs:v11];
      }
    }
  }
  if ([(NPKProtoHandlePaymentTransactionsRequest *)self passAppletStatesCount])
  {
    [v16 clearPassAppletStates];
    unint64_t v12 = [(NPKProtoHandlePaymentTransactionsRequest *)self passAppletStatesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NPKProtoHandlePaymentTransactionsRequest *)self passAppletStatesAtIndex:k];
        [v16 addPassAppletStates:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_transactionsBytes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTransactionsBytes:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v12 = self->_transactionPassIDs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addTransactionPassIDs:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_passAppletStates;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addPassAppletStates:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transactionsBytes = self->_transactionsBytes, !((unint64_t)transactionsBytes | v4[3]))
     || -[NSMutableArray isEqual:](transactionsBytes, "isEqual:"))
    && ((transactionPassIDs = self->_transactionPassIDs, !((unint64_t)transactionPassIDs | v4[2]))
     || -[NSMutableArray isEqual:](transactionPassIDs, "isEqual:")))
  {
    passAppletStates = self->_passAppletStates;
    if ((unint64_t)passAppletStates | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](passAppletStates, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_transactionsBytes hash];
  uint64_t v4 = [(NSMutableArray *)self->_transactionPassIDs hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_passAppletStates hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoHandlePaymentTransactionsRequest *)self addTransactionsBytes:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NPKProtoHandlePaymentTransactionsRequest *)self addTransactionPassIDs:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NPKProtoHandlePaymentTransactionsRequest addPassAppletStates:](self, "addPassAppletStates:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
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

- (NSMutableArray)passAppletStates
{
  return self->_passAppletStates;
}

- (void)setPassAppletStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsBytes, 0);
  objc_storeStrong((id *)&self->_transactionPassIDs, 0);
  objc_storeStrong((id *)&self->_passAppletStates, 0);
}

@end