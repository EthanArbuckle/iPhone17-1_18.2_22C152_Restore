@interface NPKProtoProvisionHomeKeyPassForSerialNumbersResponse
+ (Class)provisionedPassesDataType;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)provisionedPassesDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)provisionedPassesDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)provisionedPassesDatasCount;
- (void)addProvisionedPassesData:(id)a3;
- (void)clearProvisionedPassesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setProvisionedPassesDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoProvisionHomeKeyPassForSerialNumbersResponse

- (void)clearProvisionedPassesDatas
{
}

- (void)addProvisionedPassesData:(id)a3
{
  id v4 = a3;
  provisionedPassesDatas = self->_provisionedPassesDatas;
  id v8 = v4;
  if (!provisionedPassesDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_provisionedPassesDatas;
    self->_provisionedPassesDatas = v6;

    id v4 = v8;
    provisionedPassesDatas = self->_provisionedPassesDatas;
  }
  [(NSMutableArray *)provisionedPassesDatas addObject:v4];
}

- (unint64_t)provisionedPassesDatasCount
{
  return [(NSMutableArray *)self->_provisionedPassesDatas count];
}

- (id)provisionedPassesDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_provisionedPassesDatas objectAtIndex:a3];
}

+ (Class)provisionedPassesDataType
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
  v8.super_class = (Class)NPKProtoProvisionHomeKeyPassForSerialNumbersResponse;
  id v4 = [(NPKProtoProvisionHomeKeyPassForSerialNumbersResponse *)&v8 description];
  v5 = [(NPKProtoProvisionHomeKeyPassForSerialNumbersResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  provisionedPassesDatas = self->_provisionedPassesDatas;
  if (provisionedPassesDatas) {
    [v3 setObject:provisionedPassesDatas forKey:@"provisionedPassesData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoProvisionHomeKeyPassForSerialNumbersResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_provisionedPassesDatas;
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
  if ([(NPKProtoProvisionHomeKeyPassForSerialNumbersResponse *)self provisionedPassesDatasCount])
  {
    [v8 clearProvisionedPassesDatas];
    unint64_t v4 = [(NPKProtoProvisionHomeKeyPassForSerialNumbersResponse *)self provisionedPassesDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoProvisionHomeKeyPassForSerialNumbersResponse *)self provisionedPassesDataAtIndex:i];
        [v8 addProvisionedPassesData:v7];
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
  uint64_t v6 = self->_provisionedPassesDatas;
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
        [v5 addProvisionedPassesData:v11];

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
    && ((provisionedPassesDatas = self->_provisionedPassesDatas, !((unint64_t)provisionedPassesDatas | v4[2]))
     || -[NSMutableArray isEqual:](provisionedPassesDatas, "isEqual:")))
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
  uint64_t v3 = [(NSMutableArray *)self->_provisionedPassesDatas hash];
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
        -[NPKProtoProvisionHomeKeyPassForSerialNumbersResponse addProvisionedPassesData:](self, "addProvisionedPassesData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[NPKProtoProvisionHomeKeyPassForSerialNumbersResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSMutableArray)provisionedPassesDatas
{
  return self->_provisionedPassesDatas;
}

- (void)setProvisionedPassesDatas:(id)a3
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
  objc_storeStrong((id *)&self->_provisionedPassesDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end