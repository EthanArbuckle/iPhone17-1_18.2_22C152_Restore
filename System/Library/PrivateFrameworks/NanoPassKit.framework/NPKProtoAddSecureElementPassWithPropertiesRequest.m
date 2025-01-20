@interface NPKProtoAddSecureElementPassWithPropertiesRequest
+ (Class)payloadDataType;
- (BOOL)hasPassUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)payloadDatas;
- (NSString)passUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)payloadDatasCount;
- (void)addPayloadData:(id)a3;
- (void)clearPayloadDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setPayloadDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAddSecureElementPassWithPropertiesRequest

- (BOOL)hasPassUniqueID
{
  return self->_passUniqueID != 0;
}

- (void)clearPayloadDatas
{
}

- (void)addPayloadData:(id)a3
{
  id v4 = a3;
  payloadDatas = self->_payloadDatas;
  id v8 = v4;
  if (!payloadDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_payloadDatas;
    self->_payloadDatas = v6;

    id v4 = v8;
    payloadDatas = self->_payloadDatas;
  }
  [(NSMutableArray *)payloadDatas addObject:v4];
}

- (unint64_t)payloadDatasCount
{
  return [(NSMutableArray *)self->_payloadDatas count];
}

- (id)payloadDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_payloadDatas objectAtIndex:a3];
}

+ (Class)payloadDataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAddSecureElementPassWithPropertiesRequest;
  id v4 = [(NPKProtoAddSecureElementPassWithPropertiesRequest *)&v8 description];
  v5 = [(NPKProtoAddSecureElementPassWithPropertiesRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passUniqueID = self->_passUniqueID;
  if (passUniqueID) {
    [v3 setObject:passUniqueID forKey:@"passUniqueID"];
  }
  payloadDatas = self->_payloadDatas;
  if (payloadDatas) {
    [v4 setObject:payloadDatas forKey:@"payloadData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAddSecureElementPassWithPropertiesRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_passUniqueID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_payloadDatas;
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
  if (self->_passUniqueID) {
    objc_msgSend(v8, "setPassUniqueID:");
  }
  if ([(NPKProtoAddSecureElementPassWithPropertiesRequest *)self payloadDatasCount])
  {
    [v8 clearPayloadDatas];
    unint64_t v4 = [(NPKProtoAddSecureElementPassWithPropertiesRequest *)self payloadDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoAddSecureElementPassWithPropertiesRequest *)self payloadDataAtIndex:i];
        [v8 addPayloadData:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passUniqueID copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_payloadDatas;
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
        [v5 addPayloadData:v13];

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
    && ((passUniqueID = self->_passUniqueID, !((unint64_t)passUniqueID | v4[1]))
     || -[NSString isEqual:](passUniqueID, "isEqual:")))
  {
    payloadDatas = self->_payloadDatas;
    if ((unint64_t)payloadDatas | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](payloadDatas, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_passUniqueID hash];
  return [(NSMutableArray *)self->_payloadDatas hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NPKProtoAddSecureElementPassWithPropertiesRequest setPassUniqueID:](self, "setPassUniqueID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[NPKProtoAddSecureElementPassWithPropertiesRequest addPayloadData:](self, "addPayloadData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSMutableArray)payloadDatas
{
  return self->_payloadDatas;
}

- (void)setPayloadDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDatas, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

@end