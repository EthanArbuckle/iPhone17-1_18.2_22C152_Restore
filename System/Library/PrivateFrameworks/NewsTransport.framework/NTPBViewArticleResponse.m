@interface NTPBViewArticleResponse
- (BOOL)hasArticleId;
- (BOOL)hasChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBViewArticleResponse

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBViewArticleResponse;
  v4 = [(NTPBViewArticleResponse *)&v8 description];
  v5 = [(NTPBViewArticleResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBViewArticleResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_channelId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((channelId = self->_channelId, !((unint64_t)channelId | v4[2]))
     || -[NSString isEqual:](channelId, "isEqual:")))
  {
    articleId = self->_articleId;
    if ((unint64_t)articleId | v4[1]) {
      char v7 = -[NSString isEqual:](articleId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_channelId hash];
  return [(NSString *)self->_articleId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NTPBViewArticleResponse setChannelId:](self, "setChannelId:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NTPBViewArticleResponse setArticleId:](self, "setArticleId:");
    id v4 = v5;
  }
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end