@interface NTPBWrappingKeyRequest
+ (Class)wrappingKeyIdsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)wrappingKeyIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)wrappingKeyIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)wrappingKeyIdsCount;
- (void)addWrappingKeyIds:(id)a3;
- (void)clearWrappingKeyIds;
- (void)mergeFrom:(id)a3;
- (void)setWrappingKeyIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWrappingKeyRequest

- (void)clearWrappingKeyIds
{
}

- (void)addWrappingKeyIds:(id)a3
{
  id v4 = a3;
  wrappingKeyIds = self->_wrappingKeyIds;
  id v8 = v4;
  if (!wrappingKeyIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_wrappingKeyIds;
    self->_wrappingKeyIds = v6;

    id v4 = v8;
    wrappingKeyIds = self->_wrappingKeyIds;
  }
  [(NSMutableArray *)wrappingKeyIds addObject:v4];
}

- (unint64_t)wrappingKeyIdsCount
{
  return [(NSMutableArray *)self->_wrappingKeyIds count];
}

- (id)wrappingKeyIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_wrappingKeyIds objectAtIndex:a3];
}

+ (Class)wrappingKeyIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBWrappingKeyRequest;
  id v4 = [(NTPBWrappingKeyRequest *)&v8 description];
  v5 = [(NTPBWrappingKeyRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  wrappingKeyIds = self->_wrappingKeyIds;
  if (wrappingKeyIds) {
    [v3 setObject:wrappingKeyIds forKey:@"wrapping_key_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWrappingKeyRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_wrappingKeyIds;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_wrappingKeyIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addWrappingKeyIds:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    wrappingKeyIds = self->_wrappingKeyIds;
    if ((unint64_t)wrappingKeyIds | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](wrappingKeyIds, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_wrappingKeyIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NTPBWrappingKeyRequest addWrappingKeyIds:](self, "addWrappingKeyIds:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)wrappingKeyIds
{
  return self->_wrappingKeyIds;
}

- (void)setWrappingKeyIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end