@interface NTPBArticleScrollNotw
- (BOOL)hasArticleId;
- (BOOL)hasMaxScrollDepth;
- (BOOL)hasSourceChannelId;
- (BOOL)hasWindowId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)sourceChannelId;
- (NSString)windowId;
- (float)maxScrollDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setHasMaxScrollDepth:(BOOL)a3;
- (void)setMaxScrollDepth:(float)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setWindowId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleScrollNotw

- (void)setMaxScrollDepth:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxScrollDepth = a3;
}

- (void)setHasMaxScrollDepth:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxScrollDepth
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

- (BOOL)hasWindowId
{
  return self->_windowId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleScrollNotw;
  v4 = [(NTPBArticleScrollNotw *)&v8 description];
  v5 = [(NTPBArticleScrollNotw *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_maxScrollDepth;
    v5 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKey:@"max_scroll_depth"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  windowId = self->_windowId;
  if (windowId) {
    [v3 setObject:windowId forKey:@"window_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleScrollNotwReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
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
  if (self->_windowId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 16) = self->_maxScrollDepth;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_windowId copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_maxScrollDepth != *((float *)v4 + 4)) {
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
  if ((unint64_t)sourceChannelId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  windowId = self->_windowId;
  if ((unint64_t)windowId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](windowId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    float maxScrollDepth = self->_maxScrollDepth;
    float v5 = -maxScrollDepth;
    if (maxScrollDepth >= 0.0) {
      float v5 = self->_maxScrollDepth;
    }
    float v6 = floorf(v5 + 0.5);
    float v7 = (float)(v5 - v6) * 1.8447e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabsf(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_articleId hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_sourceChannelId hash];
  return v8 ^ v9 ^ [(NSString *)self->_windowId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if ((_BYTE)v4[10])
  {
    self->_float maxScrollDepth = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  float v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBArticleScrollNotw setArticleId:](self, "setArticleId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBArticleScrollNotw setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBArticleScrollNotw setWindowId:](self, "setWindowId:");
    id v4 = v5;
  }
}

- (float)maxScrollDepth
{
  return self->_maxScrollDepth;
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

- (NSString)windowId
{
  return self->_windowId;
}

- (void)setWindowId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end