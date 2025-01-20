@interface NTPBTodayWidgetExposure
+ (Class)widgetPersonalizationFeatureCTRPairType;
+ (Class)widgetSectionsArticleCountPairType;
- (BOOL)hasBannerIdentifier;
- (BOOL)hasContentFetchDate;
- (BOOL)hasContentId;
- (BOOL)hasEntryId;
- (BOOL)hasWidgetAppearanceType;
- (BOOL)hasWidgetArticleCount;
- (BOOL)hasWidgetExposureStackLocation;
- (BOOL)hasWidgetHeadlineExposureCount;
- (BOOL)hasWidgetIdentifier;
- (BOOL)hasWidgetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)widgetPersonalizationFeatureCTRPairs;
- (NSMutableArray)widgetSectionsArticleCountPairs;
- (NSString)bannerIdentifier;
- (NSString)contentId;
- (NSString)entryId;
- (NSString)widgetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)widgetExposureStackLocationAsString:(int)a3;
- (id)widgetPersonalizationFeatureCTRPairAtIndex:(unint64_t)a3;
- (id)widgetSectionsArticleCountPairAtIndex:(unint64_t)a3;
- (id)widgetTypeAsString:(int)a3;
- (int)StringAsWidgetExposureStackLocation:(id)a3;
- (int)StringAsWidgetType:(id)a3;
- (int)widgetAppearanceType;
- (int)widgetArticleCount;
- (int)widgetExposureStackLocation;
- (int)widgetHeadlineExposureCount;
- (int)widgetType;
- (int64_t)contentFetchDate;
- (unint64_t)hash;
- (unint64_t)widgetPersonalizationFeatureCTRPairsCount;
- (unint64_t)widgetSectionsArticleCountPairsCount;
- (void)addWidgetPersonalizationFeatureCTRPair:(id)a3;
- (void)addWidgetSectionsArticleCountPair:(id)a3;
- (void)clearWidgetPersonalizationFeatureCTRPairs;
- (void)clearWidgetSectionsArticleCountPairs;
- (void)mergeFrom:(id)a3;
- (void)setBannerIdentifier:(id)a3;
- (void)setContentFetchDate:(int64_t)a3;
- (void)setContentId:(id)a3;
- (void)setEntryId:(id)a3;
- (void)setHasContentFetchDate:(BOOL)a3;
- (void)setHasWidgetAppearanceType:(BOOL)a3;
- (void)setHasWidgetArticleCount:(BOOL)a3;
- (void)setHasWidgetExposureStackLocation:(BOOL)a3;
- (void)setHasWidgetHeadlineExposureCount:(BOOL)a3;
- (void)setHasWidgetType:(BOOL)a3;
- (void)setWidgetAppearanceType:(int)a3;
- (void)setWidgetArticleCount:(int)a3;
- (void)setWidgetExposureStackLocation:(int)a3;
- (void)setWidgetHeadlineExposureCount:(int)a3;
- (void)setWidgetIdentifier:(id)a3;
- (void)setWidgetPersonalizationFeatureCTRPairs:(id)a3;
- (void)setWidgetSectionsArticleCountPairs:(id)a3;
- (void)setWidgetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayWidgetExposure

- (void)setWidgetArticleCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetArticleCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWidgetHeadlineExposureCount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_widgetHeadlineExposureCount = a3;
}

- (void)setHasWidgetHeadlineExposureCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidgetHeadlineExposureCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearWidgetSectionsArticleCountPairs
{
}

- (void)addWidgetSectionsArticleCountPair:(id)a3
{
  id v4 = a3;
  widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  id v8 = v4;
  if (!widgetSectionsArticleCountPairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_widgetSectionsArticleCountPairs;
    self->_widgetSectionsArticleCountPairs = v6;

    id v4 = v8;
    widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  }
  [(NSMutableArray *)widgetSectionsArticleCountPairs addObject:v4];
}

- (unint64_t)widgetSectionsArticleCountPairsCount
{
  return [(NSMutableArray *)self->_widgetSectionsArticleCountPairs count];
}

- (id)widgetSectionsArticleCountPairAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_widgetSectionsArticleCountPairs objectAtIndex:a3];
}

+ (Class)widgetSectionsArticleCountPairType
{
  return (Class)objc_opt_class();
}

- (void)clearWidgetPersonalizationFeatureCTRPairs
{
}

- (void)addWidgetPersonalizationFeatureCTRPair:(id)a3
{
  id v4 = a3;
  widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  id v8 = v4;
  if (!widgetPersonalizationFeatureCTRPairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_widgetPersonalizationFeatureCTRPairs;
    self->_widgetPersonalizationFeatureCTRPairs = v6;

    id v4 = v8;
    widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  }
  [(NSMutableArray *)widgetPersonalizationFeatureCTRPairs addObject:v4];
}

- (unint64_t)widgetPersonalizationFeatureCTRPairsCount
{
  return [(NSMutableArray *)self->_widgetPersonalizationFeatureCTRPairs count];
}

- (id)widgetPersonalizationFeatureCTRPairAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_widgetPersonalizationFeatureCTRPairs objectAtIndex:a3];
}

+ (Class)widgetPersonalizationFeatureCTRPairType
{
  return (Class)objc_opt_class();
}

- (int)widgetAppearanceType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_widgetAppearanceType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetAppearanceType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widgetAppearanceType = a3;
}

- (void)setHasWidgetAppearanceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetAppearanceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (void)setContentFetchDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentFetchDate = a3;
}

- (void)setHasContentFetchDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentFetchDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_widgetExposureStackLocation;
  }
  else {
    return 0;
  }
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C2B0[a3];
  }

  return v3;
}

- (int)StringAsWidgetExposureStackLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TODAY_PAGE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_ONE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_TWO_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_PAGE_THREE_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOME_SCREEN_OTHER_PAGES_WIDGET_EXPOSURE_STACK_LOCATION"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)widgetType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_widgetType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWidgetType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C2E0[a3];
  }

  return v3;
}

- (int)StringAsWidgetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PINNED_WIDGET_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SMART_STACK_WIDGET_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NON_SMART_STACK_WIDGET_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasEntryId
{
  return self->_entryId != 0;
}

- (BOOL)hasBannerIdentifier
{
  return self->_bannerIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayWidgetExposure;
  int v4 = [(NTPBTodayWidgetExposure *)&v8 description];
  v5 = [(NTPBTodayWidgetExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_widgetArticleCount];
    [v3 setObject:v5 forKey:@"widget_article_count"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_widgetHeadlineExposureCount];
    [v3 setObject:v6 forKey:@"widget_headline_exposure_count"];
  }
  if ([(NSMutableArray *)self->_widgetSectionsArticleCountPairs count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_widgetSectionsArticleCountPairs, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    objc_super v8 = self->_widgetSectionsArticleCountPairs;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"widget_sections_article_count_pair"];
  }
  if ([(NSMutableArray *)self->_widgetPersonalizationFeatureCTRPairs count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_widgetPersonalizationFeatureCTRPairs, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v15 = self->_widgetPersonalizationFeatureCTRPairs;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"widget_personalization_feature_CTR_pair"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_widgetAppearanceType];
    [v3 setObject:v21 forKey:@"widget_appearance_type"];
  }
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier) {
    [v3 setObject:widgetIdentifier forKey:@"widget_identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v23 = [NSNumber numberWithLongLong:self->_contentFetchDate];
    [v3 setObject:v23 forKey:@"content_fetch_date"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"content_id"];
  }
  char v25 = (char)self->_has;
  if ((v25 & 8) != 0)
  {
    uint64_t widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetExposureStackLocation);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_26444C2B0[widgetExposureStackLocation];
    }
    [v3 setObject:v27 forKey:@"widget_exposure_stack_location"];

    char v25 = (char)self->_has;
  }
  if ((v25 & 0x20) != 0)
  {
    uint64_t widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_26444C2E0[widgetType];
    }
    [v3 setObject:v29 forKey:@"widget_type"];
  }
  entryId = self->_entryId;
  if (entryId) {
    [v3 setObject:entryId forKey:@"entry_id"];
  }
  bannerIdentifier = self->_bannerIdentifier;
  if (bannerIdentifier) {
    [v3 setObject:bannerIdentifier forKey:@"banner_identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_widgetSectionsArticleCountPairs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_widgetPersonalizationFeatureCTRPairs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_widgetIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_contentId) {
    PBDataWriterWriteStringField();
  }
  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_entryId) {
    PBDataWriterWriteStringField();
  }
  if (self->_bannerIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_widgetArticleCount;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_widgetHeadlineExposureCount;
    *(unsigned char *)(v5 + 84) |= 0x10u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = self->_widgetSectionsArticleCountPairs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addWidgetSectionsArticleCountPair:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = self->_widgetPersonalizationFeatureCTRPairs;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "copyWithZone:", a3, (void)v30);
        [(id)v6 addWidgetPersonalizationFeatureCTRPair:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v16);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_widgetAppearanceType;
    *(unsigned char *)(v6 + 84) |= 2u;
  }
  uint64_t v20 = -[NSString copyWithZone:](self->_widgetIdentifier, "copyWithZone:", a3, (void)v30);
  long long v21 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_contentFetchDate;
    *(unsigned char *)(v6 + 84) |= 1u;
  }
  uint64_t v22 = [(NSString *)self->_contentId copyWithZone:a3];
  long long v23 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v22;

  char v24 = (char)self->_has;
  if ((v24 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_widgetExposureStackLocation;
    *(unsigned char *)(v6 + 84) |= 8u;
    char v24 = (char)self->_has;
  }
  if ((v24 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_widgetType;
    *(unsigned char *)(v6 + 84) |= 0x20u;
  }
  uint64_t v25 = [(NSString *)self->_entryId copyWithZone:a3];
  v26 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v25;

  uint64_t v27 = [(NSString *)self->_bannerIdentifier copyWithZone:a3];
  v28 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v27;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x10) == 0 || self->_widgetHeadlineExposureCount != *((_DWORD *)v4 + 13)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  if ((unint64_t)widgetSectionsArticleCountPairs | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](widgetSectionsArticleCountPairs, "isEqual:"))
  {
    goto LABEL_46;
  }
  widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  if ((unint64_t)widgetPersonalizationFeatureCTRPairs | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](widgetPersonalizationFeatureCTRPairs, "isEqual:")) {
      goto LABEL_46;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_widgetAppearanceType != *((_DWORD *)v4 + 10)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_46;
  }
  widgetIdentifier = self->_widgetIdentifier;
  if ((unint64_t)widgetIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](widgetIdentifier, "isEqual:")) {
      goto LABEL_46;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_contentFetchDate != *((void *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_46;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 3))
  {
    if (-[NSString isEqual:](contentId, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_32;
    }
LABEL_46:
    char v12 = 0;
    goto LABEL_47;
  }
LABEL_32:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x20) == 0 || self->_widgetType != *((_DWORD *)v4 + 20)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  entryId = self->_entryId;
  if ((unint64_t)entryId | *((void *)v4 + 4) && !-[NSString isEqual:](entryId, "isEqual:")) {
    goto LABEL_46;
  }
  bannerIdentifier = self->_bannerIdentifier;
  if ((unint64_t)bannerIdentifier | *((void *)v4 + 2)) {
    char v12 = -[NSString isEqual:](bannerIdentifier, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_47:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_widgetArticleCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_widgetHeadlineExposureCount;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_widgetSectionsArticleCountPairs hash];
  uint64_t v6 = [(NSMutableArray *)self->_widgetPersonalizationFeatureCTRPairs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_widgetAppearanceType;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_widgetIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_contentFetchDate;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_contentId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_widgetExposureStackLocation;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_widgetType;
LABEL_17:
  NSUInteger v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v14 = v11 ^ v12 ^ [(NSString *)self->_entryId hash];
  return v13 ^ v14 ^ [(NSString *)self->_bannerIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 84);
  if ((v6 & 4) != 0)
  {
    self->_widgetArticleCount = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 84);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_widgetHeadlineExposureCount = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 9);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBTodayWidgetExposure *)self addWidgetSectionsArticleCountPair:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v5 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NTPBTodayWidgetExposure addWidgetPersonalizationFeatureCTRPair:](self, "addWidgetPersonalizationFeatureCTRPair:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  if ((*((unsigned char *)v5 + 84) & 2) != 0)
  {
    self->_widgetAppearanceType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 7)) {
    -[NTPBTodayWidgetExposure setWidgetIdentifier:](self, "setWidgetIdentifier:");
  }
  if (*((unsigned char *)v5 + 84))
  {
    self->_contentFetchDate = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 3)) {
    -[NTPBTodayWidgetExposure setContentId:](self, "setContentId:");
  }
  char v17 = *((unsigned char *)v5 + 84);
  if ((v17 & 8) != 0)
  {
    self->_uint64_t widgetExposureStackLocation = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v17 = *((unsigned char *)v5 + 84);
  }
  if ((v17 & 0x20) != 0)
  {
    self->_uint64_t widgetType = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 4)) {
    -[NTPBTodayWidgetExposure setEntryId:](self, "setEntryId:");
  }
  if (*((void *)v5 + 2)) {
    -[NTPBTodayWidgetExposure setBannerIdentifier:](self, "setBannerIdentifier:");
  }
}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (int)widgetHeadlineExposureCount
{
  return self->_widgetHeadlineExposureCount;
}

- (NSMutableArray)widgetSectionsArticleCountPairs
{
  return self->_widgetSectionsArticleCountPairs;
}

- (void)setWidgetSectionsArticleCountPairs:(id)a3
{
}

- (NSMutableArray)widgetPersonalizationFeatureCTRPairs
{
  return self->_widgetPersonalizationFeatureCTRPairs;
}

- (void)setWidgetPersonalizationFeatureCTRPairs:(id)a3
{
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (int64_t)contentFetchDate
{
  return self->_contentFetchDate;
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)entryId
{
  return self->_entryId;
}

- (void)setEntryId:(id)a3
{
}

- (NSString)bannerIdentifier
{
  return self->_bannerIdentifier;
}

- (void)setBannerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionsArticleCountPairs, 0);
  objc_storeStrong((id *)&self->_widgetPersonalizationFeatureCTRPairs, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_entryId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);

  objc_storeStrong((id *)&self->_bannerIdentifier, 0);
}

@end