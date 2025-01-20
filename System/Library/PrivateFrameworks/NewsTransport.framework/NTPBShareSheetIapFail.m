@interface NTPBShareSheetIapFail
- (BOOL)hasArticleId;
- (BOOL)hasFailedIapId;
- (BOOL)hasFailureReason;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)failedIapId;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)failureReason;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setFailedIapId:(id)a3;
- (void)setFailureReason:(int)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBShareSheetIapFail

- (BOOL)hasFailedIapId
{
  return self->_failedIapId != 0;
}

- (int)failureReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_failureReason;
  }
  else {
    return 0;
  }
}

- (void)setFailureReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFailureReason
{
  return *(unsigned char *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBShareSheetIapFail;
  v4 = [(NTPBShareSheetIapFail *)&v8 description];
  v5 = [(NTPBShareSheetIapFail *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_failureReason];
    [v4 setObject:v6 forKey:@"failure_reason"];
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
  return NTPBShareSheetIapFailReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
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
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_failedIapId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_failureReason;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  failedIapId = self->_failedIapId;
  if ((unint64_t)failedIapId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](failedIapId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_failureReason != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_13;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_failedIapId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_failureReason;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_articleId hash];
  return v5 ^ v6 ^ [(NSString *)self->_sourceChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBShareSheetIapFail setFailedIapId:](self, "setFailedIapId:");
    uint64_t v4 = v5;
  }
  if (v4[10])
  {
    self->_failureReason = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBShareSheetIapFail setArticleId:](self, "setArticleId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBShareSheetIapFail setSourceChannelId:](self, "setSourceChannelId:");
    uint64_t v4 = v5;
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