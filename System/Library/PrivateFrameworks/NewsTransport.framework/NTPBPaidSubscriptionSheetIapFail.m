@interface NTPBPaidSubscriptionSheetIapFail
- (BOOL)hasArticleId;
- (BOOL)hasFailedIapId;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)failedIapId;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setFailedIapId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaidSubscriptionSheetIapFail

- (BOOL)hasFailedIapId
{
  return self->_failedIapId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPaidSubscriptionSheetIapFail;
  v4 = [(NTPBPaidSubscriptionSheetIapFail *)&v8 description];
  v5 = [(NTPBPaidSubscriptionSheetIapFail *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  failedIapId = self->_failedIapId;
  if (failedIapId) {
    [v3 setObject:failedIapId forKey:@"failed_iap_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionSheetIapFailReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_failedIapId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_failedIapId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((failedIapId = self->_failedIapId, !((unint64_t)failedIapId | v4[2]))
     || -[NSString isEqual:](failedIapId, "isEqual:"))
    && ((articleId = self->_articleId, !((unint64_t)articleId | v4[1]))
     || -[NSString isEqual:](articleId, "isEqual:")))
  {
    sourceChannelId = self->_sourceChannelId;
    if ((unint64_t)sourceChannelId | v4[3]) {
      char v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_failedIapId hash];
  NSUInteger v4 = [(NSString *)self->_articleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_sourceChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[NTPBPaidSubscriptionSheetIapFail setFailedIapId:](self, "setFailedIapId:");
  }
  if (v4[1]) {
    -[NTPBPaidSubscriptionSheetIapFail setArticleId:](self, "setArticleId:");
  }
  if (v4[3]) {
    -[NTPBPaidSubscriptionSheetIapFail setSourceChannelId:](self, "setSourceChannelId:");
  }
}

- (NSString)failedIapId
{
  return self->_failedIapId;
}

- (void)setFailedIapId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failedIapId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end