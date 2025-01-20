@interface NPKProtoAddISO18013BlobsRequest
+ (Class)isoblobsType;
+ (Class)subcredentialDataType;
- (BOOL)hasCardType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)isoblobs;
- (NSMutableArray)subcredentialDatas;
- (id)cardTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)isoblobsAtIndex:(unint64_t)a3;
- (id)subcredentialDataAtIndex:(unint64_t)a3;
- (int)StringAsCardType:(id)a3;
- (int)cardType;
- (unint64_t)hash;
- (unint64_t)isoblobsCount;
- (unint64_t)subcredentialDatasCount;
- (void)addIsoblobs:(id)a3;
- (void)addSubcredentialData:(id)a3;
- (void)clearIsoblobs;
- (void)clearSubcredentialDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCardType:(int)a3;
- (void)setHasCardType:(BOOL)a3;
- (void)setIsoblobs:(id)a3;
- (void)setSubcredentialDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAddISO18013BlobsRequest

- (void)clearSubcredentialDatas
{
}

- (void)addSubcredentialData:(id)a3
{
  id v4 = a3;
  subcredentialDatas = self->_subcredentialDatas;
  id v8 = v4;
  if (!subcredentialDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subcredentialDatas;
    self->_subcredentialDatas = v6;

    id v4 = v8;
    subcredentialDatas = self->_subcredentialDatas;
  }
  [(NSMutableArray *)subcredentialDatas addObject:v4];
}

- (unint64_t)subcredentialDatasCount
{
  return [(NSMutableArray *)self->_subcredentialDatas count];
}

- (id)subcredentialDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subcredentialDatas objectAtIndex:a3];
}

+ (Class)subcredentialDataType
{
  return (Class)objc_opt_class();
}

- (void)clearIsoblobs
{
}

- (void)addIsoblobs:(id)a3
{
  id v4 = a3;
  isoblobs = self->_isoblobs;
  id v8 = v4;
  if (!isoblobs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_isoblobs;
    self->_isoblobs = v6;

    id v4 = v8;
    isoblobs = self->_isoblobs;
  }
  [(NSMutableArray *)isoblobs addObject:v4];
}

- (unint64_t)isoblobsCount
{
  return [(NSMutableArray *)self->_isoblobs count];
}

- (id)isoblobsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_isoblobs objectAtIndex:a3];
}

+ (Class)isoblobsType
{
  return (Class)objc_opt_class();
}

- (int)cardType
{
  if (*(unsigned char *)&self->_has) {
    return self->_cardType;
  }
  else {
    return 0;
  }
}

- (void)setCardType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cardType = a3;
}

- (void)setHasCardType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cardTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D2E78[a3];
  }
  return v3;
}

- (int)StringAsCardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Payment"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Access"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Identity"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAddISO18013BlobsRequest;
  int v4 = [(NPKProtoAddISO18013BlobsRequest *)&v8 description];
  v5 = [(NPKProtoAddISO18013BlobsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  subcredentialDatas = self->_subcredentialDatas;
  if (subcredentialDatas) {
    [v3 setObject:subcredentialDatas forKey:@"subcredentialData"];
  }
  isoblobs = self->_isoblobs;
  if (isoblobs) {
    [v4 setObject:isoblobs forKey:@"isoblobs"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t cardType = self->_cardType;
    if (cardType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cardType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_2644D2E78[cardType];
    }
    [v4 setObject:v8 forKey:@"cardType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAddISO18013BlobsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_subcredentialDatas;
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
  v10 = self->_isoblobs;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(NPKProtoAddISO18013BlobsRequest *)self subcredentialDatasCount])
  {
    [v12 clearSubcredentialDatas];
    unint64_t v4 = [(NPKProtoAddISO18013BlobsRequest *)self subcredentialDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoAddISO18013BlobsRequest *)self subcredentialDataAtIndex:i];
        [v12 addSubcredentialData:v7];
      }
    }
  }
  if ([(NPKProtoAddISO18013BlobsRequest *)self isoblobsCount])
  {
    [v12 clearIsoblobs];
    unint64_t v8 = [(NPKProtoAddISO18013BlobsRequest *)self isoblobsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoAddISO18013BlobsRequest *)self isoblobsAtIndex:j];
        [v12 addIsoblobs:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v12 + 2) = self->_cardType;
    *((unsigned char *)v12 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_subcredentialDatas;
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
        [(id)v5 addSubcredentialData:v11];

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
  id v12 = self->_isoblobs;
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
        [(id)v5 addIsoblobs:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_cardType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  subcredentialDatas = self->_subcredentialDatas;
  if ((unint64_t)subcredentialDatas | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](subcredentialDatas, "isEqual:")) {
      goto LABEL_10;
    }
  }
  isoblobs = self->_isoblobs;
  if ((unint64_t)isoblobs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](isoblobs, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_cardType == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_subcredentialDatas hash];
  uint64_t v4 = [(NSMutableArray *)self->_isoblobs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_cardType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 3);
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
        [(NPKProtoAddISO18013BlobsRequest *)self addSubcredentialData:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
  id v10 = *((id *)v4 + 2);
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
        -[NPKProtoAddISO18013BlobsRequest addIsoblobs:](self, "addIsoblobs:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 32))
  {
    self->_uint64_t cardType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)subcredentialDatas
{
  return self->_subcredentialDatas;
}

- (void)setSubcredentialDatas:(id)a3
{
}

- (NSMutableArray)isoblobs
{
  return self->_isoblobs;
}

- (void)setIsoblobs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialDatas, 0);
  objc_storeStrong((id *)&self->_isoblobs, 0);
}

@end