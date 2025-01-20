@interface NTPBArticleFeedback
- (BOOL)hasArticleId;
- (BOOL)hasFeedback;
- (BOOL)hasLanguage;
- (BOOL)hasSourceChannelId;
- (BOOL)hasTopicId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)language;
- (NSString)sourceChannelId;
- (NSString)topicId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)feedback;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setFeedback:(int)a3;
- (void)setHasFeedback:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setTopicId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleFeedback

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasTopicId
{
  return self->_topicId != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (int)feedback
{
  if (*(unsigned char *)&self->_has) {
    return self->_feedback;
  }
  else {
    return 0;
  }
}

- (void)setFeedback:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedback = a3;
}

- (void)setHasFeedback:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedback
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleFeedback;
  v4 = [(NTPBArticleFeedback *)&v8 description];
  v5 = [(NTPBArticleFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  topicId = self->_topicId;
  if (topicId) {
    [v4 setObject:topicId forKey:@"topic_id"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithInt:self->_feedback];
    [v4 setObject:v9 forKey:@"feedback"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_topicId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_topicId copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_language copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_feedback;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  topicId = self->_topicId;
  if ((unint64_t)topicId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](topicId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_feedback == *((_DWORD *)v4 + 4))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v5 = [(NSString *)self->_topicId hash];
  NSUInteger v6 = [(NSString *)self->_language hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_feedback;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NTPBArticleFeedback setSourceChannelId:](self, "setSourceChannelId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBArticleFeedback setArticleId:](self, "setArticleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBArticleFeedback setTopicId:](self, "setTopicId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBArticleFeedback setLanguage:](self, "setLanguage:");
    NSUInteger v4 = v5;
  }
  if (v4[12])
  {
    self->_feedback = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setTopicId:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end