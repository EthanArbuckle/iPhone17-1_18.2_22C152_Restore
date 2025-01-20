@interface NTPBArticleInfo
- (BOOL)hasStoreFrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)storeFrontId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleInfo

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleInfo;
  v4 = [(NTPBArticleInfo *)&v8 description];
  v5 = [(NTPBArticleInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    [v4 setObject:storeFrontId forKey:@"store_front_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  if (self->_storeFrontId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_storeFrontId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((articleId = self->_articleId, !((unint64_t)articleId | v4[1]))
     || -[NSString isEqual:](articleId, "isEqual:")))
  {
    storeFrontId = self->_storeFrontId;
    if ((unint64_t)storeFrontId | v4[2]) {
      char v7 = -[NSString isEqual:](storeFrontId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_articleId hash];
  return [(NSString *)self->_storeFrontId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NTPBArticleInfo setArticleId:](self, "setArticleId:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NTPBArticleInfo setStoreFrontId:](self, "setStoreFrontId:");
    id v4 = v5;
  }
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end