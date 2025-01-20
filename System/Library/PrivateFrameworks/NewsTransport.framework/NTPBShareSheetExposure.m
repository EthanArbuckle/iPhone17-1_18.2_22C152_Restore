@interface NTPBShareSheetExposure
- (BOOL)hasContentId;
- (BOOL)hasContentType;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasShareSheetExposureLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentId;
- (NSString)referencedArticleId;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContentType:(id)a3;
- (int)contentType;
- (int)shareSheetExposureLocation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setContentId:(id)a3;
- (void)setContentType:(int)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasShareSheetExposureLocation:(BOOL)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setShareSheetExposureLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBShareSheetExposure

- (int)contentType
{
  if (*(unsigned char *)&self->_has) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (void)setContentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444C380[a3];
  }

  return v3;
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONTENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTICLE_CONTENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEED_CONTENT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PDF_CONTENT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ISSUE_CONTENT_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (int)shareSheetExposureLocation
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_shareSheetExposureLocation;
  }
  else {
    return 0;
  }
}

- (void)setShareSheetExposureLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shareSheetExposureLocation = a3;
}

- (void)setHasShareSheetExposureLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShareSheetExposureLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBShareSheetExposure;
  int v4 = [(NTPBShareSheetExposure *)&v8 description];
  v5 = [(NTPBShareSheetExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444C380[contentType];
    }
    [v3 setObject:v5 forKey:@"content_type"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"content_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v3 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_shareSheetExposureLocation];
    [v3 setObject:v8 forKey:@"share_sheet_exposure_location"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareSheetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_contentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referencedArticleId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_contentType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_contentId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_shareSheetExposureLocation;
    *(unsigned char *)(v6 + 36) |= 2u;
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
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 1) && !-[NSString isEqual:](contentId, "isEqual:")) {
    goto LABEL_15;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_shareSheetExposureLocation != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_contentId hash];
  NSUInteger v5 = [(NSString *)self->_referencedArticleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_shareSheetExposureLocation;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[9])
  {
    self->_uint64_t contentType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBShareSheetExposure setContentId:](self, "setContentId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBShareSheetExposure setReferencedArticleId:](self, "setReferencedArticleId:");
    NSUInteger v4 = v5;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_shareSheetExposureLocation = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedArticleId, 0);

  objc_storeStrong((id *)&self->_contentId, 0);
}

@end