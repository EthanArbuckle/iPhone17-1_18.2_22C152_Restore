@interface NPKProtoStatusForShareableCredentialsResponse
+ (Class)updatedCredentialsDataType;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)updatedCredentialsDatas;
- (id)aggregateStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)updatedCredentialsDataAtIndex:(unint64_t)a3;
- (int)StringAsAggregateStatus:(id)a3;
- (int)aggregateStatus;
- (unint64_t)hash;
- (unint64_t)updatedCredentialsDatasCount;
- (void)addUpdatedCredentialsData:(id)a3;
- (void)clearUpdatedCredentialsDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAggregateStatus:(int)a3;
- (void)setErrorData:(id)a3;
- (void)setUpdatedCredentialsDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStatusForShareableCredentialsResponse

- (id)aggregateStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D2F30[a3];
  }
  return v3;
}

- (int)StringAsAggregateStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Available"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Consumed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Revoked"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Expired"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearUpdatedCredentialsDatas
{
}

- (void)addUpdatedCredentialsData:(id)a3
{
  id v4 = a3;
  updatedCredentialsDatas = self->_updatedCredentialsDatas;
  id v8 = v4;
  if (!updatedCredentialsDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_updatedCredentialsDatas;
    self->_updatedCredentialsDatas = v6;

    id v4 = v8;
    updatedCredentialsDatas = self->_updatedCredentialsDatas;
  }
  [(NSMutableArray *)updatedCredentialsDatas addObject:v4];
}

- (unint64_t)updatedCredentialsDatasCount
{
  return [(NSMutableArray *)self->_updatedCredentialsDatas count];
}

- (id)updatedCredentialsDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_updatedCredentialsDatas objectAtIndex:a3];
}

+ (Class)updatedCredentialsDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStatusForShareableCredentialsResponse;
  id v4 = [(NPKProtoStatusForShareableCredentialsResponse *)&v8 description];
  v5 = [(NPKProtoStatusForShareableCredentialsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t aggregateStatus = self->_aggregateStatus;
  if (aggregateStatus >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_aggregateStatus);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2644D2F30[aggregateStatus];
  }
  [v3 setObject:v5 forKey:@"aggregateStatus"];

  updatedCredentialsDatas = self->_updatedCredentialsDatas;
  if (updatedCredentialsDatas) {
    [v3 setObject:updatedCredentialsDatas forKey:@"updatedCredentialsData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStatusForShareableCredentialsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_updatedCredentialsDatas;
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
  uint64_t v8 = a3;
  v8[2] = self->_aggregateStatus;
  if ([(NPKProtoStatusForShareableCredentialsResponse *)self updatedCredentialsDatasCount])
  {
    [v8 clearUpdatedCredentialsDatas];
    unint64_t v4 = [(NPKProtoStatusForShareableCredentialsResponse *)self updatedCredentialsDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStatusForShareableCredentialsResponse *)self updatedCredentialsDataAtIndex:i];
        [v8 addUpdatedCredentialsData:v7];
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
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_aggregateStatus;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_updatedCredentialsDatas;
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
        [(id)v5 addUpdatedCredentialsData:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_errorData copyWithZone:a3];
  long long v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_aggregateStatus == *((_DWORD *)v4 + 2)
    && ((updatedCredentialsDatas = self->_updatedCredentialsDatas, !((unint64_t)updatedCredentialsDatas | v4[3]))
     || -[NSMutableArray isEqual:](updatedCredentialsDatas, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2]) {
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
  uint64_t v3 = 2654435761 * self->_aggregateStatus;
  uint64_t v4 = [(NSMutableArray *)self->_updatedCredentialsDatas hash];
  return v4 ^ [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_uint64_t aggregateStatus = *((_DWORD *)v4 + 2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[NPKProtoStatusForShareableCredentialsResponse addUpdatedCredentialsData:](self, "addUpdatedCredentialsData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[NPKProtoStatusForShareableCredentialsResponse setErrorData:](self, "setErrorData:");
  }
}

- (int)aggregateStatus
{
  return self->_aggregateStatus;
}

- (void)setAggregateStatus:(int)a3
{
  self->_uint64_t aggregateStatus = a3;
}

- (NSMutableArray)updatedCredentialsDatas
{
  return self->_updatedCredentialsDatas;
}

- (void)setUpdatedCredentialsDatas:(id)a3
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
  objc_storeStrong((id *)&self->_updatedCredentialsDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end