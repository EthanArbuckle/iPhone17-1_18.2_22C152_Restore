@interface NTPBArticleViewNotw
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewType;
- (BOOL)hasMaxScrollDepth;
- (BOOL)hasReferringSite;
- (BOOL)hasReferringUrl;
- (BOOL)hasSourceChannelId;
- (BOOL)hasWindowId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)referringSite;
- (NSString)referringUrl;
- (NSString)sourceChannelId;
- (NSString)windowId;
- (float)maxScrollDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)articleViewType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewType:(int)a3;
- (void)setHasArticleViewType:(BOOL)a3;
- (void)setHasMaxScrollDepth:(BOOL)a3;
- (void)setMaxScrollDepth:(float)a3;
- (void)setReferringSite:(id)a3;
- (void)setReferringUrl:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setWindowId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleViewNotw

- (int)articleViewType
{
  if (*(unsigned char *)&self->_has) {
    return self->_articleViewType;
  }
  else {
    return 0;
  }
}

- (void)setArticleViewType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleViewType = a3;
}

- (void)setHasArticleViewType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleViewType
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

- (void)setMaxScrollDepth:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxScrollDepth = a3;
}

- (void)setHasMaxScrollDepth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxScrollDepth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasReferringSite
{
  return self->_referringSite != 0;
}

- (BOOL)hasWindowId
{
  return self->_windowId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleViewNotw;
  v4 = [(NTPBArticleViewNotw *)&v8 description];
  v5 = [(NTPBArticleViewNotw *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithInt:self->_articleViewType];
    [v3 setObject:v5 forKey:@"article_view_type"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)&double v4 = self->_maxScrollDepth;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"max_scroll_depth"];
  }
  referringUrl = self->_referringUrl;
  if (referringUrl) {
    [v3 setObject:referringUrl forKey:@"referring_url"];
  }
  referringSite = self->_referringSite;
  if (referringSite) {
    [v3 setObject:referringSite forKey:@"referring_site"];
  }
  windowId = self->_windowId;
  if (windowId) {
    [v3 setObject:windowId forKey:@"window_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleViewNotwReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_referringUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referringSite)
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
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_articleViewType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)(v6 + 20) = self->_maxScrollDepth;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_referringUrl copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_referringSite copyWithZone:a3];
  v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_windowId copyWithZone:a3];
  v16 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_articleViewType != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_22;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_maxScrollDepth != *((float *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_22;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((void *)v4 + 4)
    && !-[NSString isEqual:](referringUrl, "isEqual:"))
  {
    goto LABEL_22;
  }
  referringSite = self->_referringSite;
  if ((unint64_t)referringSite | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](referringSite, "isEqual:")) {
      goto LABEL_22;
    }
  }
  windowId = self->_windowId;
  if ((unint64_t)windowId | *((void *)v4 + 6)) {
    char v10 = -[NSString isEqual:](windowId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_articleViewType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v5 = [(NSString *)self->_sourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float maxScrollDepth = self->_maxScrollDepth;
    float v8 = -maxScrollDepth;
    if (maxScrollDepth >= 0.0) {
      float v8 = self->_maxScrollDepth;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v12 = [(NSString *)self->_referringUrl hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_referringSite hash];
  return v11 ^ v13 ^ [(NSString *)self->_windowId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 56))
  {
    self->_articleViewType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBArticleViewNotw setArticleId:](self, "setArticleId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBArticleViewNotw setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_float maxScrollDepth = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBArticleViewNotw setReferringUrl:](self, "setReferringUrl:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBArticleViewNotw setReferringSite:](self, "setReferringSite:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBArticleViewNotw setWindowId:](self, "setWindowId:");
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (float)maxScrollDepth
{
  return self->_maxScrollDepth;
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
}

- (NSString)referringSite
{
  return self->_referringSite;
}

- (void)setReferringSite:(id)a3
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
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSite, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end