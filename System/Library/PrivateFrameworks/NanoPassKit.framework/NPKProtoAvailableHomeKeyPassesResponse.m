@interface NPKProtoAvailableHomeKeyPassesResponse
+ (Class)passesDataType;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)passesDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)passesDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)passesDatasCount;
- (void)addPassesData:(id)a3;
- (void)clearPassesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setPassesDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAvailableHomeKeyPassesResponse

- (void)clearPassesDatas
{
}

- (void)addPassesData:(id)a3
{
  id v4 = a3;
  passesDatas = self->_passesDatas;
  id v8 = v4;
  if (!passesDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_passesDatas;
    self->_passesDatas = v6;

    id v4 = v8;
    passesDatas = self->_passesDatas;
  }
  [(NSMutableArray *)passesDatas addObject:v4];
}

- (unint64_t)passesDatasCount
{
  return [(NSMutableArray *)self->_passesDatas count];
}

- (id)passesDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_passesDatas objectAtIndex:a3];
}

+ (Class)passesDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAvailableHomeKeyPassesResponse;
  id v4 = [(NPKProtoAvailableHomeKeyPassesResponse *)&v8 description];
  v5 = [(NPKProtoAvailableHomeKeyPassesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passesDatas = self->_passesDatas;
  if (passesDatas) {
    [v3 setObject:passesDatas forKey:@"passesData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAvailableHomeKeyPassesResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_passesDatas;
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

  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NPKProtoAvailableHomeKeyPassesResponse *)self passesDatasCount])
  {
    [v8 clearPassesDatas];
    unint64_t v4 = [(NPKProtoAvailableHomeKeyPassesResponse *)self passesDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoAvailableHomeKeyPassesResponse *)self passesDataAtIndex:i];
        [v8 addPassesData:v7];
      }
    }
  }
  if (self->_errorData) {
    objc_msgSend(v8, "setErrorData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_passesDatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addPassesData:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_errorData copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passesDatas = self->_passesDatas, !((unint64_t)passesDatas | v4[2]))
     || -[NSMutableArray isEqual:](passesDatas, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v7 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_passesDatas hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
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
        -[NPKProtoAvailableHomeKeyPassesResponse addPassesData:](self, "addPassesData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[NPKProtoAvailableHomeKeyPassesResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSMutableArray)passesDatas
{
  return self->_passesDatas;
}

- (void)setPassesDatas:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passesDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end