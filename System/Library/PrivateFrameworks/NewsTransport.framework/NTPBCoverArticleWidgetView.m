@interface NTPBCoverArticleWidgetView
- (BOOL)hasCoverArticleWidgetArticleCount;
- (BOOL)hasCoverArticleWidgetViewingSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)coverArticleWidgetViewingSessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)coverArticleWidgetArticleCount;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCoverArticleWidgetArticleCount:(int)a3;
- (void)setCoverArticleWidgetViewingSessionId:(id)a3;
- (void)setHasCoverArticleWidgetArticleCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCoverArticleWidgetView

- (BOOL)hasCoverArticleWidgetViewingSessionId
{
  return self->_coverArticleWidgetViewingSessionId != 0;
}

- (void)setCoverArticleWidgetArticleCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coverArticleWidgetArticleCount = a3;
}

- (void)setHasCoverArticleWidgetArticleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverArticleWidgetArticleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBCoverArticleWidgetView;
  v4 = [(NTPBCoverArticleWidgetView *)&v8 description];
  v5 = [(NTPBCoverArticleWidgetView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  coverArticleWidgetViewingSessionId = self->_coverArticleWidgetViewingSessionId;
  if (coverArticleWidgetViewingSessionId) {
    [v3 setObject:coverArticleWidgetViewingSessionId forKey:@"cover_article_widget_viewing_session_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_coverArticleWidgetArticleCount];
    [v4 setObject:v6 forKey:@"cover_article_widget_article_count"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoverArticleWidgetViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_coverArticleWidgetViewingSessionId)
  {
    PBDataWriterWriteDataField();
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
  uint64_t v6 = [(NSData *)self->_coverArticleWidgetViewingSessionId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_coverArticleWidgetArticleCount;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  coverArticleWidgetViewingSessionId = self->_coverArticleWidgetViewingSessionId;
  if ((unint64_t)coverArticleWidgetViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](coverArticleWidgetViewingSessionId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_coverArticleWidgetArticleCount == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_coverArticleWidgetViewingSessionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_coverArticleWidgetArticleCount;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NTPBCoverArticleWidgetView setCoverArticleWidgetViewingSessionId:](self, "setCoverArticleWidgetViewingSessionId:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_coverArticleWidgetArticleCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)coverArticleWidgetViewingSessionId
{
  return self->_coverArticleWidgetViewingSessionId;
}

- (void)setCoverArticleWidgetViewingSessionId:(id)a3
{
}

- (int)coverArticleWidgetArticleCount
{
  return self->_coverArticleWidgetArticleCount;
}

- (void).cxx_destruct
{
}

@end