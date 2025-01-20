@interface NTPBViewArticleRequest
- (BOOL)hasFeedUri;
- (BOOL)hasStoreFrontId;
- (BOOL)hasWebPageUri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)feedUri;
- (NSString)storeFrontId;
- (NSString)webPageUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setFeedUri:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setWebPageUri:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBViewArticleRequest

- (BOOL)hasWebPageUri
{
  return self->_webPageUri != 0;
}

- (BOOL)hasFeedUri
{
  return self->_feedUri != 0;
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBViewArticleRequest;
  v4 = [(NTPBViewArticleRequest *)&v8 description];
  v5 = [(NTPBViewArticleRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  webPageUri = self->_webPageUri;
  if (webPageUri) {
    [v3 setObject:webPageUri forKey:@"web_page_uri"];
  }
  feedUri = self->_feedUri;
  if (feedUri) {
    [v4 setObject:feedUri forKey:@"feed_uri"];
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    [v4 setObject:storeFrontId forKey:@"store_front_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBViewArticleRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_webPageUri)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_feedUri)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_storeFrontId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_webPageUri copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_feedUri copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_storeFrontId copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((webPageUri = self->_webPageUri, !((unint64_t)webPageUri | v4[3]))
     || -[NSString isEqual:](webPageUri, "isEqual:"))
    && ((feedUri = self->_feedUri, !((unint64_t)feedUri | v4[1]))
     || -[NSString isEqual:](feedUri, "isEqual:")))
  {
    storeFrontId = self->_storeFrontId;
    if ((unint64_t)storeFrontId | v4[2]) {
      char v8 = -[NSString isEqual:](storeFrontId, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_webPageUri hash];
  NSUInteger v4 = [(NSString *)self->_feedUri hash] ^ v3;
  return v4 ^ [(NSString *)self->_storeFrontId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[NTPBViewArticleRequest setWebPageUri:](self, "setWebPageUri:");
  }
  if (v4[1]) {
    -[NTPBViewArticleRequest setFeedUri:](self, "setFeedUri:");
  }
  if (v4[2]) {
    -[NTPBViewArticleRequest setStoreFrontId:](self, "setStoreFrontId:");
  }
}

- (NSString)webPageUri
{
  return self->_webPageUri;
}

- (void)setWebPageUri:(id)a3
{
}

- (NSString)feedUri
{
  return self->_feedUri;
}

- (void)setFeedUri:(id)a3
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
  objc_storeStrong((id *)&self->_webPageUri, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);

  objc_storeStrong((id *)&self->_feedUri, 0);
}

@end