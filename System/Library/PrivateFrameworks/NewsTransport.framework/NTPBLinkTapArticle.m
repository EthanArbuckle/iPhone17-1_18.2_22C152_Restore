@interface NTPBLinkTapArticle
- (BOOL)hasArticleId;
- (BOOL)hasArticleType;
- (BOOL)hasLinkUrl;
- (BOOL)hasReferencedArticleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)linkUrl;
- (NSString)referencedArticleId;
- (id)articleTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsArticleType:(id)a3;
- (int)articleType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setLinkUrl:(id)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLinkTapArticle

- (BOOL)hasLinkUrl
{
  return self->_linkUrl != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (int)articleType
{
  if (*(unsigned char *)&self->_has) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444A0E8[a3];
  }

  return v3;
}

- (int)StringAsArticleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ARTICLE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WEBVIEW_ARTICLE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLINT_ARTICLE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO_ARTICLE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AD_ARTICLE_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_WEBLINK_ARTICLE_TYPE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBLinkTapArticle;
  int v4 = [(NTPBLinkTapArticle *)&v8 description];
  v5 = [(NTPBLinkTapArticle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  linkUrl = self->_linkUrl;
  if (linkUrl) {
    [v3 setObject:linkUrl forKey:@"link_url"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v4 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_26444A0E8[articleType];
    }
    [v4 setObject:v9 forKey:@"article_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLinkTapArticleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_linkUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referencedArticleId)
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
  uint64_t v6 = [(NSString *)self->_linkUrl copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_articleType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  linkUrl = self->_linkUrl;
  if ((unint64_t)linkUrl | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](linkUrl, "isEqual:")) {
      goto LABEL_12;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_articleType == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_linkUrl hash];
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v5 = [(NSString *)self->_referencedArticleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_articleType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBLinkTapArticle setLinkUrl:](self, "setLinkUrl:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBLinkTapArticle setArticleId:](self, "setArticleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBLinkTapArticle setReferencedArticleId:](self, "setReferencedArticleId:");
    NSUInteger v4 = v5;
  }
  if (v4[10])
  {
    self->_uint64_t articleType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)linkUrl
{
  return self->_linkUrl;
}

- (void)setLinkUrl:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
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
  objc_storeStrong((id *)&self->_linkUrl, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end