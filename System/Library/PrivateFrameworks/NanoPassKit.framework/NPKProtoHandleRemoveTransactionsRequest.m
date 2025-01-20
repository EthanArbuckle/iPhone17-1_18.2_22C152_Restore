@interface NPKProtoHandleRemoveTransactionsRequest
+ (Class)identifiersType;
+ (Class)passIDsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)identifiers;
- (NSMutableArray)passIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifiersAtIndex:(unint64_t)a3;
- (id)passIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (unint64_t)passIDsCount;
- (void)addIdentifiers:(id)a3;
- (void)addPassIDs:(id)a3;
- (void)clearIdentifiers;
- (void)clearPassIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setPassIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHandleRemoveTransactionsRequest

- (void)clearIdentifiers
{
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  id v8 = v4;
  if (!identifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_identifiers;
    self->_identifiers = v6;

    id v4 = v8;
    identifiers = self->_identifiers;
  }
  [(NSMutableArray *)identifiers addObject:v4];
}

- (unint64_t)identifiersCount
{
  return [(NSMutableArray *)self->_identifiers count];
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifiers objectAtIndex:a3];
}

+ (Class)identifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearPassIDs
{
}

- (void)addPassIDs:(id)a3
{
  id v4 = a3;
  passIDs = self->_passIDs;
  id v8 = v4;
  if (!passIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_passIDs;
    self->_passIDs = v6;

    id v4 = v8;
    passIDs = self->_passIDs;
  }
  [(NSMutableArray *)passIDs addObject:v4];
}

- (unint64_t)passIDsCount
{
  return [(NSMutableArray *)self->_passIDs count];
}

- (id)passIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_passIDs objectAtIndex:a3];
}

+ (Class)passIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoHandleRemoveTransactionsRequest;
  id v4 = [(NPKProtoHandleRemoveTransactionsRequest *)&v8 description];
  v5 = [(NPKProtoHandleRemoveTransactionsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  identifiers = self->_identifiers;
  if (identifiers) {
    [v3 setObject:identifiers forKey:@"identifiers"];
  }
  passIDs = self->_passIDs;
  if (passIDs) {
    [v4 setObject:passIDs forKey:@"passIDs"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandleRemoveTransactionsRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_identifiers;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_passIDs;
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
  if ([(NPKProtoHandleRemoveTransactionsRequest *)self identifiersCount])
  {
    [v12 clearIdentifiers];
    unint64_t v4 = [(NPKProtoHandleRemoveTransactionsRequest *)self identifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoHandleRemoveTransactionsRequest *)self identifiersAtIndex:i];
        [v12 addIdentifiers:v7];
      }
    }
  }
  if ([(NPKProtoHandleRemoveTransactionsRequest *)self passIDsCount])
  {
    [v12 clearPassIDs];
    unint64_t v8 = [(NPKProtoHandleRemoveTransactionsRequest *)self passIDsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoHandleRemoveTransactionsRequest *)self passIDsAtIndex:j];
        [v12 addPassIDs:v11];
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
  uint64_t v6 = self->_identifiers;
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
        [v5 addIdentifiers:v11];

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
  id v12 = self->_passIDs;
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
        [v5 addPassIDs:v17];

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
    && ((identifiers = self->_identifiers, !((unint64_t)identifiers | v4[1]))
     || -[NSMutableArray isEqual:](identifiers, "isEqual:")))
  {
    passIDs = self->_passIDs;
    if ((unint64_t)passIDs | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](passIDs, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_identifiers hash];
  return [(NSMutableArray *)self->_passIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
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
        [(NPKProtoHandleRemoveTransactionsRequest *)self addIdentifiers:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
  id v10 = v4[2];
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
        -[NPKProtoHandleRemoveTransactionsRequest addPassIDs:](self, "addPassIDs:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSMutableArray)passIDs
{
  return self->_passIDs;
}

- (void)setPassIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIDs, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end