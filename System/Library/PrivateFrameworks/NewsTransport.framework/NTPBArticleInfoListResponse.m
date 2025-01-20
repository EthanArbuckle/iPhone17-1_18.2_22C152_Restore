@interface NTPBArticleInfoListResponse
+ (Class)articleInfoListType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidBucketGroup;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)articleInfoLists;
- (id)articleInfoListAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)articleInfoListsCount;
- (unint64_t)hash;
- (void)addArticleInfoList:(id)a3;
- (void)clearArticleInfoLists;
- (void)mergeFrom:(id)a3;
- (void)setArticleInfoLists:(id)a3;
- (void)setIsValidBucketGroup:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleInfoListResponse

- (void)clearArticleInfoLists
{
}

- (void)addArticleInfoList:(id)a3
{
  id v4 = a3;
  articleInfoLists = self->_articleInfoLists;
  id v8 = v4;
  if (!articleInfoLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleInfoLists;
    self->_articleInfoLists = v6;

    id v4 = v8;
    articleInfoLists = self->_articleInfoLists;
  }
  [(NSMutableArray *)articleInfoLists addObject:v4];
}

- (unint64_t)articleInfoListsCount
{
  return [(NSMutableArray *)self->_articleInfoLists count];
}

- (id)articleInfoListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleInfoLists objectAtIndex:a3];
}

+ (Class)articleInfoListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleInfoListResponse;
  id v4 = [(NTPBArticleInfoListResponse *)&v8 description];
  v5 = [(NTPBArticleInfoListResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:self->_isValidBucketGroup];
  [v3 setObject:v4 forKey:@"is_valid_bucket_group"];

  if ([(NSMutableArray *)self->_articleInfoLists count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_articleInfoLists, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_articleInfoLists;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"articleInfoList"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleInfoListResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_articleInfoLists;
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
        PBDataWriterWriteSubmessage();
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
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[16] = self->_isValidBucketGroup;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_articleInfoLists;
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
        [v5 addArticleInfoList:v11];

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
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  if (self->_isValidBucketGroup)
  {
    if (*((unsigned char *)v4 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  if (*((unsigned char *)v4 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  articleInfoLists = self->_articleInfoLists;
  if ((unint64_t)articleInfoLists | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](articleInfoLists, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_isValidBucketGroup;
  return [(NSMutableArray *)self->_articleInfoLists hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_isValidBucketGroup = *((unsigned char *)v4 + 16);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[NTPBArticleInfoListResponse addArticleInfoList:](self, "addArticleInfoList:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isValidBucketGroup
{
  return self->_isValidBucketGroup;
}

- (void)setIsValidBucketGroup:(BOOL)a3
{
  self->_isValidBucketGroup = a3;
}

- (NSMutableArray)articleInfoLists
{
  return self->_articleInfoLists;
}

- (void)setArticleInfoLists:(id)a3
{
}

- (void).cxx_destruct
{
}

@end