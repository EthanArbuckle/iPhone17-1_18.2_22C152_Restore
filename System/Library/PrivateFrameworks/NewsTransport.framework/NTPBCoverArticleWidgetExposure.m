@interface NTPBCoverArticleWidgetExposure
- (BOOL)hasCoverArticleWidgetArticleCount;
- (BOOL)hasCoverArticleWidgetExposureSessionId;
- (BOOL)hasFeedViewExposureId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)coverArticleWidgetExposureSessionId;
- (NSData)feedViewExposureId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)coverArticleWidgetArticleCount;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCoverArticleWidgetArticleCount:(int)a3;
- (void)setCoverArticleWidgetExposureSessionId:(id)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasCoverArticleWidgetArticleCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCoverArticleWidgetExposure

- (BOOL)hasCoverArticleWidgetExposureSessionId
{
  return self->_coverArticleWidgetExposureSessionId != 0;
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBCoverArticleWidgetExposure;
  v4 = [(NTPBCoverArticleWidgetExposure *)&v8 description];
  v5 = [(NTPBCoverArticleWidgetExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  coverArticleWidgetExposureSessionId = self->_coverArticleWidgetExposureSessionId;
  if (coverArticleWidgetExposureSessionId) {
    [v3 setObject:coverArticleWidgetExposureSessionId forKey:@"cover_article_widget_exposure_session_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_coverArticleWidgetArticleCount];
    [v4 setObject:v6 forKey:@"cover_article_widget_article_count"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v4 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCoverArticleWidgetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_coverArticleWidgetExposureSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_coverArticleWidgetExposureSessionId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_coverArticleWidgetArticleCount;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  coverArticleWidgetExposureSessionId = self->_coverArticleWidgetExposureSessionId;
  if ((unint64_t)coverArticleWidgetExposureSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](coverArticleWidgetExposureSessionId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_coverArticleWidgetArticleCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_coverArticleWidgetExposureSessionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_coverArticleWidgetArticleCount;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSData *)self->_feedViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBCoverArticleWidgetExposure setCoverArticleWidgetExposureSessionId:](self, "setCoverArticleWidgetExposureSessionId:");
    uint64_t v4 = v5;
  }
  if (v4[8])
  {
    self->_coverArticleWidgetArticleCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBCoverArticleWidgetExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    uint64_t v4 = v5;
  }
}

- (NSData)coverArticleWidgetExposureSessionId
{
  return self->_coverArticleWidgetExposureSessionId;
}

- (void)setCoverArticleWidgetExposureSessionId:(id)a3
{
}

- (int)coverArticleWidgetArticleCount
{
  return self->_coverArticleWidgetArticleCount;
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);

  objc_storeStrong((id *)&self->_coverArticleWidgetExposureSessionId, 0);
}

@end