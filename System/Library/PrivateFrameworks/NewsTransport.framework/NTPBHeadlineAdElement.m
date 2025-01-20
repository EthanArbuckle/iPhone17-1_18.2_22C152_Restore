@interface NTPBHeadlineAdElement
+ (Class)articleIAdCategoriesType;
+ (Class)articleIAdKeywordsType;
+ (Class)articleIAdSectionIDsType;
+ (Class)channelIAdCategoriesType;
+ (Class)channelIAdKeywordsType;
- (BOOL)draftArticle;
- (BOOL)hasArticleID;
- (BOOL)hasArticleRating;
- (BOOL)hasChannelContentProviderID;
- (BOOL)hasChannelID;
- (BOOL)hasChannelRating;
- (BOOL)hasDraftArticle;
- (BOOL)hasPaidArticle;
- (BOOL)hasSponsoredArticle;
- (BOOL)isEqual:(id)a3;
- (BOOL)paidArticle;
- (BOOL)readFrom:(id)a3;
- (BOOL)sponsoredArticle;
- (NSMutableArray)articleIAdCategories;
- (NSMutableArray)articleIAdKeywords;
- (NSMutableArray)articleIAdSectionIDs;
- (NSMutableArray)channelIAdCategories;
- (NSMutableArray)channelIAdKeywords;
- (NSString)articleID;
- (NSString)articleRating;
- (NSString)channelID;
- (NSString)channelRating;
- (id)articleIAdCategoriesAtIndex:(unint64_t)a3;
- (id)articleIAdKeywordsAtIndex:(unint64_t)a3;
- (id)articleIAdSectionIDsAtIndex:(unint64_t)a3;
- (id)channelIAdCategoriesAtIndex:(unint64_t)a3;
- (id)channelIAdKeywordsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)channelContentProviderID;
- (unint64_t)articleIAdCategoriesCount;
- (unint64_t)articleIAdKeywordsCount;
- (unint64_t)articleIAdSectionIDsCount;
- (unint64_t)channelIAdCategoriesCount;
- (unint64_t)channelIAdKeywordsCount;
- (unint64_t)hash;
- (void)addArticleIAdCategories:(id)a3;
- (void)addArticleIAdKeywords:(id)a3;
- (void)addArticleIAdSectionIDs:(id)a3;
- (void)addChannelIAdCategories:(id)a3;
- (void)addChannelIAdKeywords:(id)a3;
- (void)clearArticleIAdCategories;
- (void)clearArticleIAdKeywords;
- (void)clearArticleIAdSectionIDs;
- (void)clearChannelIAdCategories;
- (void)clearChannelIAdKeywords;
- (void)mergeFrom:(id)a3;
- (void)setArticleIAdCategories:(id)a3;
- (void)setArticleIAdKeywords:(id)a3;
- (void)setArticleIAdSectionIDs:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticleRating:(id)a3;
- (void)setChannelContentProviderID:(int64_t)a3;
- (void)setChannelIAdCategories:(id)a3;
- (void)setChannelIAdKeywords:(id)a3;
- (void)setChannelID:(id)a3;
- (void)setChannelRating:(id)a3;
- (void)setDraftArticle:(BOOL)a3;
- (void)setHasChannelContentProviderID:(BOOL)a3;
- (void)setHasDraftArticle:(BOOL)a3;
- (void)setHasPaidArticle:(BOOL)a3;
- (void)setHasSponsoredArticle:(BOOL)a3;
- (void)setPaidArticle:(BOOL)a3;
- (void)setSponsoredArticle:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBHeadlineAdElement

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasArticleRating
{
  return self->_articleRating != 0;
}

- (void)clearArticleIAdCategories
{
}

- (void)addArticleIAdCategories:(id)a3
{
  id v4 = a3;
  articleIAdCategories = self->_articleIAdCategories;
  id v8 = v4;
  if (!articleIAdCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleIAdCategories;
    self->_articleIAdCategories = v6;

    id v4 = v8;
    articleIAdCategories = self->_articleIAdCategories;
  }
  [(NSMutableArray *)articleIAdCategories addObject:v4];
}

- (unint64_t)articleIAdCategoriesCount
{
  return [(NSMutableArray *)self->_articleIAdCategories count];
}

- (id)articleIAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleIAdCategories objectAtIndex:a3];
}

+ (Class)articleIAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setPaidArticle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_paidArticle = a3;
}

- (void)setHasPaidArticle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPaidArticle
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSponsoredArticle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sponsoredArticle = a3;
}

- (void)setHasSponsoredArticle:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSponsoredArticle
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDraftArticle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_draftArticle = a3;
}

- (void)setHasDraftArticle:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDraftArticle
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearArticleIAdSectionIDs
{
}

- (void)addArticleIAdSectionIDs:(id)a3
{
  id v4 = a3;
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  id v8 = v4;
  if (!articleIAdSectionIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleIAdSectionIDs;
    self->_articleIAdSectionIDs = v6;

    id v4 = v8;
    articleIAdSectionIDs = self->_articleIAdSectionIDs;
  }
  [(NSMutableArray *)articleIAdSectionIDs addObject:v4];
}

- (unint64_t)articleIAdSectionIDsCount
{
  return [(NSMutableArray *)self->_articleIAdSectionIDs count];
}

- (id)articleIAdSectionIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleIAdSectionIDs objectAtIndex:a3];
}

+ (Class)articleIAdSectionIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelIAdKeywords
{
}

- (void)addChannelIAdKeywords:(id)a3
{
  id v4 = a3;
  channelIAdKeywords = self->_channelIAdKeywords;
  id v8 = v4;
  if (!channelIAdKeywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelIAdKeywords;
    self->_channelIAdKeywords = v6;

    id v4 = v8;
    channelIAdKeywords = self->_channelIAdKeywords;
  }
  [(NSMutableArray *)channelIAdKeywords addObject:v4];
}

- (unint64_t)channelIAdKeywordsCount
{
  return [(NSMutableArray *)self->_channelIAdKeywords count];
}

- (id)channelIAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelIAdKeywords objectAtIndex:a3];
}

+ (Class)channelIAdKeywordsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (BOOL)hasChannelRating
{
  return self->_channelRating != 0;
}

- (void)clearChannelIAdCategories
{
}

- (void)addChannelIAdCategories:(id)a3
{
  id v4 = a3;
  channelIAdCategories = self->_channelIAdCategories;
  id v8 = v4;
  if (!channelIAdCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelIAdCategories;
    self->_channelIAdCategories = v6;

    id v4 = v8;
    channelIAdCategories = self->_channelIAdCategories;
  }
  [(NSMutableArray *)channelIAdCategories addObject:v4];
}

- (unint64_t)channelIAdCategoriesCount
{
  return [(NSMutableArray *)self->_channelIAdCategories count];
}

- (id)channelIAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelIAdCategories objectAtIndex:a3];
}

+ (Class)channelIAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setChannelContentProviderID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelContentProviderID = a3;
}

- (void)setHasChannelContentProviderID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelContentProviderID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearArticleIAdKeywords
{
}

- (void)addArticleIAdKeywords:(id)a3
{
  id v4 = a3;
  articleIAdKeywords = self->_articleIAdKeywords;
  id v8 = v4;
  if (!articleIAdKeywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_articleIAdKeywords;
    self->_articleIAdKeywords = v6;

    id v4 = v8;
    articleIAdKeywords = self->_articleIAdKeywords;
  }
  [(NSMutableArray *)articleIAdKeywords addObject:v4];
}

- (unint64_t)articleIAdKeywordsCount
{
  return [(NSMutableArray *)self->_articleIAdKeywords count];
}

- (id)articleIAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleIAdKeywords objectAtIndex:a3];
}

+ (Class)articleIAdKeywordsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBHeadlineAdElement;
  id v4 = [(NTPBHeadlineAdElement *)&v8 description];
  v5 = [(NTPBHeadlineAdElement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  articleID = self->_articleID;
  if (articleID) {
    [v3 setObject:articleID forKey:@"article_ID"];
  }
  articleRating = self->_articleRating;
  if (articleRating) {
    [v4 setObject:articleRating forKey:@"article_rating"];
  }
  articleIAdCategories = self->_articleIAdCategories;
  if (articleIAdCategories) {
    [v4 setObject:articleIAdCategories forKey:@"article_iAd_categories"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_paidArticle];
    [v4 setObject:v18 forKey:@"paid_article"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v19 = [NSNumber numberWithBool:self->_sponsoredArticle];
  [v4 setObject:v19 forKey:@"sponsored_article"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    v9 = [NSNumber numberWithBool:self->_draftArticle];
    [v4 setObject:v9 forKey:@"draft_article"];
  }
LABEL_11:
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  if (articleIAdSectionIDs) {
    [v4 setObject:articleIAdSectionIDs forKey:@"article_iAd_section_IDs"];
  }
  channelIAdKeywords = self->_channelIAdKeywords;
  if (channelIAdKeywords) {
    [v4 setObject:channelIAdKeywords forKey:@"channel_iAd_keywords"];
  }
  channelID = self->_channelID;
  if (channelID) {
    [v4 setObject:channelID forKey:@"channel_ID"];
  }
  channelRating = self->_channelRating;
  if (channelRating) {
    [v4 setObject:channelRating forKey:@"channel_rating"];
  }
  channelIAdCategories = self->_channelIAdCategories;
  if (channelIAdCategories) {
    [v4 setObject:channelIAdCategories forKey:@"channel_iAd_categories"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = [NSNumber numberWithLongLong:self->_channelContentProviderID];
    [v4 setObject:v15 forKey:@"channel_content_provider_ID"];
  }
  articleIAdKeywords = self->_articleIAdKeywords;
  if (articleIAdKeywords) {
    [v4 setObject:articleIAdKeywords forKey:@"article_iAd_keywords"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineAdElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleRating) {
    PBDataWriterWriteStringField();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v5 = self->_articleIAdCategories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v11 = self->_articleIAdSectionIDs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v16 = self->_channelIAdKeywords;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v18);
  }

  if (self->_channelID) {
    PBDataWriterWriteStringField();
  }
  if (self->_channelRating) {
    PBDataWriterWriteStringField();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v21 = self->_channelIAdCategories;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = self->_articleIAdKeywords;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_articleRating copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v10 = self->_articleIAdCategories;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addArticleIAdCategories:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 89) = self->_paidArticle;
    *(unsigned char *)(v5 + 92) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 90) = self->_sponsoredArticle;
  *(unsigned char *)(v5 + 92) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    *(unsigned char *)(v5 + 88) = self->_draftArticle;
    *(unsigned char *)(v5 + 92) |= 2u;
  }
LABEL_12:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v17 = self->_articleIAdSectionIDs;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addArticleIAdSectionIDs:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v19);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v23 = self->_channelIAdKeywords;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v55 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addChannelIAdKeywords:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [(NSString *)self->_channelID copyWithZone:a3];
  v30 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v29;

  uint64_t v31 = [(NSString *)self->_channelRating copyWithZone:a3];
  long long v32 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v31;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v33 = self->_channelIAdCategories;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addChannelIAdCategories:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v35);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_channelContentProviderID;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v39 = self->_articleIAdKeywords;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v47;
    do
    {
      for (uint64_t n = 0; n != v41; ++n)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * n), "copyWithZone:", a3, (void)v46);
        [(id)v5 addArticleIAdKeywords:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v46 objects:v66 count:16];
    }
    while (v41);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  articleID = self->_articleID;
  if ((unint64_t)articleID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleID, "isEqual:")) {
      goto LABEL_49;
    }
  }
  articleRating = self->_articleRating;
  if ((unint64_t)articleRating | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleRating, "isEqual:")) {
      goto LABEL_49;
    }
  }
  articleIAdCategories = self->_articleIAdCategories;
  if ((unint64_t)articleIAdCategories | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](articleIAdCategories, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_paidArticle)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0) {
      goto LABEL_49;
    }
    if (self->_sponsoredArticle)
    {
      if (!*((unsigned char *)v4 + 90)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 90))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) != 0)
    {
      if (self->_draftArticle)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_49;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_32;
      }
    }
LABEL_49:
    char v14 = 0;
    goto LABEL_50;
  }
  if ((*((unsigned char *)v4 + 92) & 2) != 0) {
    goto LABEL_49;
  }
LABEL_32:
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  if ((unint64_t)articleIAdSectionIDs | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](articleIAdSectionIDs, "isEqual:"))
  {
    goto LABEL_49;
  }
  channelIAdKeywords = self->_channelIAdKeywords;
  if ((unint64_t)channelIAdKeywords | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](channelIAdKeywords, "isEqual:")) {
      goto LABEL_49;
    }
  }
  channelID = self->_channelID;
  if ((unint64_t)channelID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](channelID, "isEqual:")) {
      goto LABEL_49;
    }
  }
  channelRating = self->_channelRating;
  if ((unint64_t)channelRating | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](channelRating, "isEqual:")) {
      goto LABEL_49;
    }
  }
  channelIAdCategories = self->_channelIAdCategories;
  if ((unint64_t)channelIAdCategories | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](channelIAdCategories, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_channelContentProviderID != *((void *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_49;
  }
  articleIAdKeywords = self->_articleIAdKeywords;
  if ((unint64_t)articleIAdKeywords | *((void *)v4 + 3)) {
    char v14 = -[NSMutableArray isEqual:](articleIAdKeywords, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_50:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v15 = [(NSString *)self->_articleID hash];
  NSUInteger v14 = [(NSString *)self->_articleRating hash];
  uint64_t v13 = [(NSMutableArray *)self->_articleIAdCategories hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_paidArticle;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_sponsoredArticle;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_draftArticle;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSMutableArray *)self->_articleIAdSectionIDs hash];
  uint64_t v7 = [(NSMutableArray *)self->_channelIAdKeywords hash];
  NSUInteger v8 = [(NSString *)self->_channelID hash];
  NSUInteger v9 = [(NSString *)self->_channelRating hash];
  uint64_t v10 = [(NSMutableArray *)self->_channelIAdCategories hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_channelContentProviderID;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_articleIAdKeywords hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[NTPBHeadlineAdElement setArticleID:](self, "setArticleID:");
  }
  if (*((void *)v4 + 6)) {
    -[NTPBHeadlineAdElement setArticleRating:](self, "setArticleRating:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBHeadlineAdElement *)self addArticleIAdCategories:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 92);
  if ((v10 & 4) != 0)
  {
    self->_paidArticle = *((unsigned char *)v4 + 89);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v4 + 92);
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_sponsoredArticle = *((unsigned char *)v4 + 90);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
LABEL_15:
    self->_draftArticle = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_16:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NTPBHeadlineAdElement *)self addArticleIAdSectionIDs:*(void *)(*((void *)&v43 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = *((id *)v4 + 8);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NTPBHeadlineAdElement *)self addChannelIAdKeywords:*(void *)(*((void *)&v39 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 9)) {
    -[NTPBHeadlineAdElement setChannelID:](self, "setChannelID:");
  }
  if (*((void *)v4 + 10)) {
    -[NTPBHeadlineAdElement setChannelRating:](self, "setChannelRating:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = *((id *)v4 + 7);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        [(NTPBHeadlineAdElement *)self addChannelIAdCategories:*(void *)(*((void *)&v35 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }

  if (*((unsigned char *)v4 + 92))
  {
    self->_channelContentProviderID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = *((id *)v4 + 3);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        -[NTPBHeadlineAdElement addArticleIAdKeywords:](self, "addArticleIAdKeywords:", *(void *)(*((void *)&v31 + 1) + 8 * n), (void)v31);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NSString)articleRating
{
  return self->_articleRating;
}

- (void)setArticleRating:(id)a3
{
}

- (NSMutableArray)articleIAdCategories
{
  return self->_articleIAdCategories;
}

- (void)setArticleIAdCategories:(id)a3
{
}

- (BOOL)paidArticle
{
  return self->_paidArticle;
}

- (BOOL)sponsoredArticle
{
  return self->_sponsoredArticle;
}

- (BOOL)draftArticle
{
  return self->_draftArticle;
}

- (NSMutableArray)articleIAdSectionIDs
{
  return self->_articleIAdSectionIDs;
}

- (void)setArticleIAdSectionIDs:(id)a3
{
}

- (NSMutableArray)channelIAdKeywords
{
  return self->_channelIAdKeywords;
}

- (void)setChannelIAdKeywords:(id)a3
{
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)channelRating
{
  return self->_channelRating;
}

- (void)setChannelRating:(id)a3
{
}

- (NSMutableArray)channelIAdCategories
{
  return self->_channelIAdCategories;
}

- (void)setChannelIAdCategories:(id)a3
{
}

- (int64_t)channelContentProviderID
{
  return self->_channelContentProviderID;
}

- (NSMutableArray)articleIAdKeywords
{
  return self->_articleIAdKeywords;
}

- (void)setArticleIAdKeywords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelRating, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_channelIAdKeywords, 0);
  objc_storeStrong((id *)&self->_channelIAdCategories, 0);
  objc_storeStrong((id *)&self->_articleRating, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_articleIAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_articleIAdKeywords, 0);

  objc_storeStrong((id *)&self->_articleIAdCategories, 0);
}

@end