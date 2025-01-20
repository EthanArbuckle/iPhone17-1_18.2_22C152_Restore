@interface NPKProtoDisplayableSharesForPassIdentifierResponse
+ (Class)sharesDataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sharesDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sharesDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sharesDatasCount;
- (void)addSharesData:(id)a3;
- (void)clearSharesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSharesDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoDisplayableSharesForPassIdentifierResponse

- (void)clearSharesDatas
{
}

- (void)addSharesData:(id)a3
{
  id v4 = a3;
  sharesDatas = self->_sharesDatas;
  id v8 = v4;
  if (!sharesDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sharesDatas;
    self->_sharesDatas = v6;

    id v4 = v8;
    sharesDatas = self->_sharesDatas;
  }
  [(NSMutableArray *)sharesDatas addObject:v4];
}

- (unint64_t)sharesDatasCount
{
  return [(NSMutableArray *)self->_sharesDatas count];
}

- (id)sharesDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sharesDatas objectAtIndex:a3];
}

+ (Class)sharesDataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoDisplayableSharesForPassIdentifierResponse;
  id v4 = [(NPKProtoDisplayableSharesForPassIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoDisplayableSharesForPassIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  sharesDatas = self->_sharesDatas;
  if (sharesDatas) {
    [v3 setObject:sharesDatas forKey:@"sharesData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDisplayableSharesForPassIdentifierResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sharesDatas;
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
  if ([(NPKProtoDisplayableSharesForPassIdentifierResponse *)self sharesDatasCount])
  {
    [v8 clearSharesDatas];
    unint64_t v4 = [(NPKProtoDisplayableSharesForPassIdentifierResponse *)self sharesDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoDisplayableSharesForPassIdentifierResponse *)self sharesDataAtIndex:i];
        [v8 addSharesData:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_sharesDatas;
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
        [v5 addSharesData:v11];

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
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sharesDatas = self->_sharesDatas;
    if ((unint64_t)sharesDatas | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](sharesDatas, "isEqual:");
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
  return [(NSMutableArray *)self->_sharesDatas hash];
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
        -[NPKProtoDisplayableSharesForPassIdentifierResponse addSharesData:](self, "addSharesData:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)sharesDatas
{
  return self->_sharesDatas;
}

- (void)setSharesDatas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end