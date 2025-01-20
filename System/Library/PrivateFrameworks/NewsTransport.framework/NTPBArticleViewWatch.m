@interface NTPBArticleViewWatch
- (BOOL)didScroll;
- (BOOL)hasArticleHostViewTypeWatch;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionIdWatch;
- (BOOL)hasDidScroll;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)articleViewingSessionIdWatch;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)articleHostViewTypeWatch;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleHostViewTypeWatch:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionIdWatch:(id)a3;
- (void)setDidScroll:(BOOL)a3;
- (void)setHasArticleHostViewTypeWatch:(BOOL)a3;
- (void)setHasDidScroll:(BOOL)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleViewWatch

- (int)articleHostViewTypeWatch
{
  if (*(unsigned char *)&self->_has) {
    return self->_articleHostViewTypeWatch;
  }
  else {
    return 0;
  }
}

- (void)setArticleHostViewTypeWatch:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleHostViewTypeWatch = a3;
}

- (void)setHasArticleHostViewTypeWatch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleHostViewTypeWatch
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasArticleViewingSessionIdWatch
{
  return self->_articleViewingSessionIdWatch != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setDidScroll:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didScroll = a3;
}

- (void)setHasDidScroll:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidScroll
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleViewWatch;
  v4 = [(NTPBArticleViewWatch *)&v8 description];
  v5 = [(NTPBArticleViewWatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_articleHostViewTypeWatch];
    [v3 setObject:v4 forKey:@"article_host_view_type_watch"];
  }
  articleViewingSessionIdWatch = self->_articleViewingSessionIdWatch;
  if (articleViewingSessionIdWatch) {
    [v3 setObject:articleViewingSessionIdWatch forKey:@"article_viewing_session_id_watch"];
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
    objc_super v8 = [NSNumber numberWithBool:self->_didScroll];
    [v3 setObject:v8 forKey:@"did_scroll"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleViewWatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleViewingSessionIdWatch) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_articleHostViewTypeWatch;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_articleViewingSessionIdWatch copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_articleId copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_didScroll;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_articleHostViewTypeWatch != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_15;
  }
  articleViewingSessionIdWatch = self->_articleViewingSessionIdWatch;
  if ((unint64_t)articleViewingSessionIdWatch | *((void *)v4 + 3)
    && !-[NSString isEqual:](articleViewingSessionIdWatch, "isEqual:"))
  {
    goto LABEL_15;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    if (self->_didScroll)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_articleHostViewTypeWatch;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_articleViewingSessionIdWatch hash];
  NSUInteger v5 = [(NSString *)self->_articleId hash];
  NSUInteger v6 = [(NSString *)self->_sourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_didScroll;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 44))
  {
    self->_articleHostViewTypeWatch = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBArticleViewWatch setArticleViewingSessionIdWatch:](self, "setArticleViewingSessionIdWatch:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBArticleViewWatch setArticleId:](self, "setArticleId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBArticleViewWatch setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_didScroll = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)articleViewingSessionIdWatch
{
  return self->_articleViewingSessionIdWatch;
}

- (void)setArticleViewingSessionIdWatch:(id)a3
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

- (BOOL)didScroll
{
  return self->_didScroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionIdWatch, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end