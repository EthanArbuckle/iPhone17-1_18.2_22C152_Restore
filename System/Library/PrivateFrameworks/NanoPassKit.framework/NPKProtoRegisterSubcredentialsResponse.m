@interface NPKProtoRegisterSubcredentialsResponse
+ (Class)errorsDataType;
+ (Class)passesDataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)errorsDatas;
- (NSMutableArray)passesDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorsDataAtIndex:(unint64_t)a3;
- (id)passesDataAtIndex:(unint64_t)a3;
- (unint64_t)errorsDatasCount;
- (unint64_t)hash;
- (unint64_t)passesDatasCount;
- (void)addErrorsData:(id)a3;
- (void)addPassesData:(id)a3;
- (void)clearErrorsDatas;
- (void)clearPassesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorsDatas:(id)a3;
- (void)setPassesDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRegisterSubcredentialsResponse

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

- (void)clearErrorsDatas
{
}

- (void)addErrorsData:(id)a3
{
  id v4 = a3;
  errorsDatas = self->_errorsDatas;
  id v8 = v4;
  if (!errorsDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_errorsDatas;
    self->_errorsDatas = v6;

    id v4 = v8;
    errorsDatas = self->_errorsDatas;
  }
  [(NSMutableArray *)errorsDatas addObject:v4];
}

- (unint64_t)errorsDatasCount
{
  return [(NSMutableArray *)self->_errorsDatas count];
}

- (id)errorsDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_errorsDatas objectAtIndex:a3];
}

+ (Class)errorsDataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRegisterSubcredentialsResponse;
  id v4 = [(NPKProtoRegisterSubcredentialsResponse *)&v8 description];
  v5 = [(NPKProtoRegisterSubcredentialsResponse *)self dictionaryRepresentation];
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
  errorsDatas = self->_errorsDatas;
  if (errorsDatas) {
    [v4 setObject:errorsDatas forKey:@"errorsData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRegisterSubcredentialsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_passesDatas;
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
  v10 = self->_errorsDatas;
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
        PBDataWriterWriteDataField();
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
  if ([(NPKProtoRegisterSubcredentialsResponse *)self passesDatasCount])
  {
    [v12 clearPassesDatas];
    unint64_t v4 = [(NPKProtoRegisterSubcredentialsResponse *)self passesDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoRegisterSubcredentialsResponse *)self passesDataAtIndex:i];
        [v12 addPassesData:v7];
      }
    }
  }
  if ([(NPKProtoRegisterSubcredentialsResponse *)self errorsDatasCount])
  {
    [v12 clearErrorsDatas];
    unint64_t v8 = [(NPKProtoRegisterSubcredentialsResponse *)self errorsDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoRegisterSubcredentialsResponse *)self errorsDataAtIndex:j];
        [v12 addErrorsData:v11];
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
  uint64_t v6 = self->_passesDatas;
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
        [v5 addPassesData:v11];

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
  id v12 = self->_errorsDatas;
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
        [v5 addErrorsData:v17];

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
    && ((passesDatas = self->_passesDatas, !((unint64_t)passesDatas | v4[2]))
     || -[NSMutableArray isEqual:](passesDatas, "isEqual:")))
  {
    errorsDatas = self->_errorsDatas;
    if ((unint64_t)errorsDatas | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](errorsDatas, "isEqual:");
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
  return [(NSMutableArray *)self->_errorsDatas hash] ^ v3;
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
        [(NPKProtoRegisterSubcredentialsResponse *)self addPassesData:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
        -[NPKProtoRegisterSubcredentialsResponse addErrorsData:](self, "addErrorsData:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)passesDatas
{
  return self->_passesDatas;
}

- (void)setPassesDatas:(id)a3
{
}

- (NSMutableArray)errorsDatas
{
  return self->_errorsDatas;
}

- (void)setErrorsDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passesDatas, 0);
  objc_storeStrong((id *)&self->_errorsDatas, 0);
}

@end