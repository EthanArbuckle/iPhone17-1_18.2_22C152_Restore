@interface NTPBPuzzleTypeRecord
+ (Class)allowedStorefrontIDsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)latestPuzzleIDsType;
+ (Class)promotedPuzzleIDsType;
- (BOOL)hasBase;
- (BOOL)hasBehaviorFlags;
- (BOOL)hasCoverImageURL;
- (BOOL)hasEngineResourceID;
- (BOOL)hasExploreTileImageURL;
- (BOOL)hasFeedNavImageURL;
- (BOOL)hasImagesResourceID;
- (BOOL)hasIsPublic;
- (BOOL)hasKind;
- (BOOL)hasLanguage;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasName;
- (BOOL)hasNameCompact;
- (BOOL)hasNameImageCompactURL;
- (BOOL)hasNameImageForDarkBackgroundURL;
- (BOOL)hasNameImageMaskURL;
- (BOOL)hasNameImageURL;
- (BOOL)hasNavigationChromeBackgroundDarkModeImageCompactURL;
- (BOOL)hasNavigationChromeBackgroundDarkModeImageLargeURL;
- (BOOL)hasNavigationChromeBackgroundDarkModeImageURL;
- (BOOL)hasNavigationChromeBackgroundImageCompactURL;
- (BOOL)hasNavigationChromeBackgroundImageLargeURL;
- (BOOL)hasNavigationChromeBackgroundImageURL;
- (BOOL)hasSuperfeedConfigResourceID;
- (BOOL)hasThemeConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPublic;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)latestPuzzleIDs;
- (NSMutableArray)promotedPuzzleIDs;
- (NSString)coverImageURL;
- (NSString)engineResourceID;
- (NSString)exploreTileImageURL;
- (NSString)feedNavImageURL;
- (NSString)imagesResourceID;
- (NSString)kind;
- (NSString)language;
- (NSString)name;
- (NSString)nameCompact;
- (NSString)nameImageCompactURL;
- (NSString)nameImageForDarkBackgroundURL;
- (NSString)nameImageMaskURL;
- (NSString)nameImageURL;
- (NSString)navigationChromeBackgroundDarkModeImageCompactURL;
- (NSString)navigationChromeBackgroundDarkModeImageLargeURL;
- (NSString)navigationChromeBackgroundDarkModeImageURL;
- (NSString)navigationChromeBackgroundImageCompactURL;
- (NSString)navigationChromeBackgroundImageLargeURL;
- (NSString)navigationChromeBackgroundImageURL;
- (NSString)superfeedConfigResourceID;
- (NSString)themeConfiguration;
- (NTPBRecordBase)base;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)latestPuzzleIDsAtIndex:(unint64_t)a3;
- (id)promotedPuzzleIDsAtIndex:(unint64_t)a3;
- (int64_t)behaviorFlags;
- (int64_t)minimumNewsVersion;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)hash;
- (unint64_t)latestPuzzleIDsCount;
- (unint64_t)promotedPuzzleIDsCount;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addLatestPuzzleIDs:(id)a3;
- (void)addPromotedPuzzleIDs:(id)a3;
- (void)clearAllowedStorefrontIDs;
- (void)clearBlockedStorefrontIDs;
- (void)clearLatestPuzzleIDs;
- (void)clearPromotedPuzzleIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setBase:(id)a3;
- (void)setBehaviorFlags:(int64_t)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setCoverImageURL:(id)a3;
- (void)setEngineResourceID:(id)a3;
- (void)setExploreTileImageURL:(id)a3;
- (void)setFeedNavImageURL:(id)a3;
- (void)setHasBehaviorFlags:(BOOL)a3;
- (void)setHasIsPublic:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setImagesResourceID:(id)a3;
- (void)setIsPublic:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLatestPuzzleIDs:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNameCompact:(id)a3;
- (void)setNameImageCompactURL:(id)a3;
- (void)setNameImageForDarkBackgroundURL:(id)a3;
- (void)setNameImageMaskURL:(id)a3;
- (void)setNameImageURL:(id)a3;
- (void)setNavigationChromeBackgroundDarkModeImageCompactURL:(id)a3;
- (void)setNavigationChromeBackgroundDarkModeImageLargeURL:(id)a3;
- (void)setNavigationChromeBackgroundDarkModeImageURL:(id)a3;
- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3;
- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3;
- (void)setNavigationChromeBackgroundImageURL:(id)a3;
- (void)setPromotedPuzzleIDs:(id)a3;
- (void)setSuperfeedConfigResourceID:(id)a3;
- (void)setThemeConfiguration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPuzzleTypeRecord

- (void)dealloc
{
  [(NTPBPuzzleTypeRecord *)self setBase:0];
  [(NTPBPuzzleTypeRecord *)self setName:0];
  [(NTPBPuzzleTypeRecord *)self setEngineResourceID:0];
  [(NTPBPuzzleTypeRecord *)self setSuperfeedConfigResourceID:0];
  [(NTPBPuzzleTypeRecord *)self setLatestPuzzleIDs:0];
  [(NTPBPuzzleTypeRecord *)self setPromotedPuzzleIDs:0];
  [(NTPBPuzzleTypeRecord *)self setLanguage:0];
  [(NTPBPuzzleTypeRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBPuzzleTypeRecord *)self setAllowedStorefrontIDs:0];
  [(NTPBPuzzleTypeRecord *)self setNameImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setNameImageCompactURL:0];
  [(NTPBPuzzleTypeRecord *)self setNameImageForDarkBackgroundURL:0];
  [(NTPBPuzzleTypeRecord *)self setNameImageMaskURL:0];
  [(NTPBPuzzleTypeRecord *)self setCoverImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setFeedNavImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setExploreTileImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setThemeConfiguration:0];
  [(NTPBPuzzleTypeRecord *)self setImagesResourceID:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundImageCompactURL:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundImageLargeURL:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundDarkModeImageURL:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundDarkModeImageCompactURL:0];
  [(NTPBPuzzleTypeRecord *)self setNavigationChromeBackgroundDarkModeImageLargeURL:0];
  [(NTPBPuzzleTypeRecord *)self setKind:0];
  [(NTPBPuzzleTypeRecord *)self setNameCompact:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleTypeRecord;
  [(NTPBPuzzleTypeRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasEngineResourceID
{
  return self->_engineResourceID != 0;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)clearLatestPuzzleIDs
{
}

- (void)addLatestPuzzleIDs:(id)a3
{
  latestPuzzleIDs = self->_latestPuzzleIDs;
  if (!latestPuzzleIDs)
  {
    latestPuzzleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_latestPuzzleIDs = latestPuzzleIDs;
  }

  [(NSMutableArray *)latestPuzzleIDs addObject:a3];
}

- (unint64_t)latestPuzzleIDsCount
{
  return [(NSMutableArray *)self->_latestPuzzleIDs count];
}

- (id)latestPuzzleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_latestPuzzleIDs objectAtIndex:a3];
}

+ (Class)latestPuzzleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPromotedPuzzleIDs
{
}

- (void)addPromotedPuzzleIDs:(id)a3
{
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  if (!promotedPuzzleIDs)
  {
    promotedPuzzleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_promotedPuzzleIDs = promotedPuzzleIDs;
  }

  [(NSMutableArray *)promotedPuzzleIDs addObject:a3];
}

- (unint64_t)promotedPuzzleIDsCount
{
  return [(NSMutableArray *)self->_promotedPuzzleIDs count];
}

- (id)promotedPuzzleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_promotedPuzzleIDs objectAtIndex:a3];
}

+ (Class)promotedPuzzleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)clearBlockedStorefrontIDs
{
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }

  [(NSMutableArray *)blockedStorefrontIDs addObject:a3];
}

- (unint64_t)blockedStorefrontIDsCount
{
  return [(NSMutableArray *)self->_blockedStorefrontIDs count];
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blockedStorefrontIDs objectAtIndex:a3];
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }

  [(NSMutableArray *)allowedStorefrontIDs addObject:a3];
}

- (unint64_t)allowedStorefrontIDsCount
{
  return [(NSMutableArray *)self->_allowedStorefrontIDs count];
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allowedStorefrontIDs objectAtIndex:a3];
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasNameImageURL
{
  return self->_nameImageURL != 0;
}

- (BOOL)hasNameImageCompactURL
{
  return self->_nameImageCompactURL != 0;
}

- (BOOL)hasNameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL != 0;
}

- (BOOL)hasNameImageMaskURL
{
  return self->_nameImageMaskURL != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (BOOL)hasFeedNavImageURL
{
  return self->_feedNavImageURL != 0;
}

- (BOOL)hasExploreTileImageURL
{
  return self->_exploreTileImageURL != 0;
}

- (BOOL)hasThemeConfiguration
{
  return self->_themeConfiguration != 0;
}

- (BOOL)hasImagesResourceID
{
  return self->_imagesResourceID != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageURL
{
  return self->_navigationChromeBackgroundDarkModeImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageCompactURL
{
  return self->_navigationChromeBackgroundDarkModeImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageLargeURL
{
  return self->_navigationChromeBackgroundDarkModeImageLargeURL != 0;
}

- (BOOL)hasKind
{
  return self->_kind != 0;
}

- (BOOL)hasNameCompact
{
  return self->_nameCompact != 0;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_behaviorFlags = a3;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBehaviorFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsPublic:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isPublic = a3;
}

- (void)setHasIsPublic:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsPublic
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleTypeRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPuzzleTypeRecord description](&v3, sel_description), -[NTPBPuzzleTypeRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  engineResourceID = self->_engineResourceID;
  if (engineResourceID) {
    [v3 setObject:engineResourceID forKey:@"engine_resource_ID"];
  }
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID) {
    [v3 setObject:superfeedConfigResourceID forKey:@"superfeed_config_resource_ID"];
  }
  latestPuzzleIDs = self->_latestPuzzleIDs;
  if (latestPuzzleIDs) {
    [v3 setObject:latestPuzzleIDs forKey:@"latest_puzzle_IDs"];
  }
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  if (promotedPuzzleIDs) {
    [v3 setObject:promotedPuzzleIDs forKey:@"promoted_puzzle_IDs"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs) {
    [v3 setObject:blockedStorefrontIDs forKey:@"blocked_storefront_IDs"];
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs) {
    [v3 setObject:allowedStorefrontIDs forKey:@"allowed_storefront_IDs"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
  }
  nameImageURL = self->_nameImageURL;
  if (nameImageURL) {
    [v3 setObject:nameImageURL forKey:@"name_image_URL"];
  }
  nameImageCompactURL = self->_nameImageCompactURL;
  if (nameImageCompactURL) {
    [v3 setObject:nameImageCompactURL forKey:@"name_image_compact_URL"];
  }
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if (nameImageForDarkBackgroundURL) {
    [v3 setObject:nameImageForDarkBackgroundURL forKey:@"name_image_for_dark_background_URL"];
  }
  nameImageMaskURL = self->_nameImageMaskURL;
  if (nameImageMaskURL) {
    [v3 setObject:nameImageMaskURL forKey:@"name_image_mask_URL"];
  }
  coverImageURL = self->_coverImageURL;
  if (coverImageURL) {
    [v3 setObject:coverImageURL forKey:@"cover_image_URL"];
  }
  feedNavImageURL = self->_feedNavImageURL;
  if (feedNavImageURL) {
    [v3 setObject:feedNavImageURL forKey:@"feed_nav_image_URL"];
  }
  exploreTileImageURL = self->_exploreTileImageURL;
  if (exploreTileImageURL) {
    [v3 setObject:exploreTileImageURL forKey:@"explore_tile_image_URL"];
  }
  themeConfiguration = self->_themeConfiguration;
  if (themeConfiguration) {
    [v3 setObject:themeConfiguration forKey:@"theme_configuration"];
  }
  imagesResourceID = self->_imagesResourceID;
  if (imagesResourceID) {
    [v3 setObject:imagesResourceID forKey:@"images_resource_ID"];
  }
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if (navigationChromeBackgroundImageURL) {
    [v3 setObject:navigationChromeBackgroundImageURL forKey:@"navigation_chrome_background_image_URL"];
  }
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if (navigationChromeBackgroundImageCompactURL) {
    [v3 setObject:navigationChromeBackgroundImageCompactURL forKey:@"navigation_chrome_background_image_compact_URL"];
  }
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if (navigationChromeBackgroundImageLargeURL) {
    [v3 setObject:navigationChromeBackgroundImageLargeURL forKey:@"navigation_chrome_background_image_large_URL"];
  }
  navigationChromeBackgroundDarkModeImageURL = self->_navigationChromeBackgroundDarkModeImageURL;
  if (navigationChromeBackgroundDarkModeImageURL) {
    [v3 setObject:navigationChromeBackgroundDarkModeImageURL forKey:@"navigation_chrome_background_dark_mode_image_URL"];
  }
  navigationChromeBackgroundDarkModeImageCompactURL = self->_navigationChromeBackgroundDarkModeImageCompactURL;
  if (navigationChromeBackgroundDarkModeImageCompactURL) {
    [v3 setObject:navigationChromeBackgroundDarkModeImageCompactURL forKey:@"navigation_chrome_background_dark_mode_image_compact_URL"];
  }
  navigationChromeBackgroundDarkModeImageLargeURL = self->_navigationChromeBackgroundDarkModeImageLargeURL;
  if (navigationChromeBackgroundDarkModeImageLargeURL) {
    [v3 setObject:navigationChromeBackgroundDarkModeImageLargeURL forKey:@"navigation_chrome_background_dark_mode_image_large_URL"];
  }
  kind = self->_kind;
  if (kind) {
    [v3 setObject:kind forKey:@"kind"];
  }
  nameCompact = self->_nameCompact;
  if (nameCompact) {
    [v3 setObject:nameCompact forKey:@"name_compact"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_behaviorFlags), @"behavior_flags");
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPublic), @"is_public");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPuzzleTypeRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_engineResourceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_superfeedConfigResourceID) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  latestPuzzleIDs = self->_latestPuzzleIDs;
  uint64_t v5 = [(NSMutableArray *)latestPuzzleIDs countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(latestPuzzleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)latestPuzzleIDs countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v6);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  uint64_t v10 = [(NSMutableArray *)promotedPuzzleIDs countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(promotedPuzzleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)promotedPuzzleIDs countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v11);
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v15 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v16);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v20 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v21 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v21);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_nameImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageForDarkBackgroundURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageMaskURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_coverImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedNavImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_exploreTileImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_themeConfiguration) {
    PBDataWriterWriteStringField();
  }
  if (self->_imagesResourceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundDarkModeImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundDarkModeImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundDarkModeImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_kind) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameCompact) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 32) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  *(void *)(v5 + 112) = [(NSString *)self->_name copyWithZone:a3];

  *(void *)(v5 + 56) = [(NSString *)self->_engineResourceID copyWithZone:a3];
  *(void *)(v5 + 216) = [(NSString *)self->_superfeedConfigResourceID copyWithZone:a3];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  latestPuzzleIDs = self->_latestPuzzleIDs;
  uint64_t v7 = [(NSMutableArray *)latestPuzzleIDs countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(latestPuzzleIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLatestPuzzleIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)latestPuzzleIDs countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  uint64_t v13 = [(NSMutableArray *)promotedPuzzleIDs countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(promotedPuzzleIDs);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addPromotedPuzzleIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)promotedPuzzleIDs countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }

  *(void *)(v5 + 96) = [(NSString *)self->_language copyWithZone:a3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v19 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        v23 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v23];
      }
      uint64_t v20 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v20);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v25 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        long long v29 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v29];
      }
      uint64_t v26 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v26);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_minimumNewsVersion;
    *(unsigned char *)(v5 + 236) |= 2u;
  }

  *(void *)(v5 + 152) = [(NSString *)self->_nameImageURL copyWithZone:a3];
  *(void *)(v5 + 128) = [(NSString *)self->_nameImageCompactURL copyWithZone:a3];

  *(void *)(v5 + 136) = [(NSString *)self->_nameImageForDarkBackgroundURL copyWithZone:a3];
  *(void *)(v5 + 144) = [(NSString *)self->_nameImageMaskURL copyWithZone:a3];

  *(void *)(v5 + 48) = [(NSString *)self->_coverImageURL copyWithZone:a3];
  *(void *)(v5 + 72) = [(NSString *)self->_feedNavImageURL copyWithZone:a3];

  *(void *)(v5 + 64) = [(NSString *)self->_exploreTileImageURL copyWithZone:a3];
  *(void *)(v5 + 224) = [(NSString *)self->_themeConfiguration copyWithZone:a3];

  *(void *)(v5 + 80) = [(NSString *)self->_imagesResourceID copyWithZone:a3];
  *(void *)(v5 + 200) = [(NSString *)self->_navigationChromeBackgroundImageURL copyWithZone:a3];

  *(void *)(v5 + 184) = [(NSString *)self->_navigationChromeBackgroundImageCompactURL copyWithZone:a3];
  *(void *)(v5 + 192) = [(NSString *)self->_navigationChromeBackgroundImageLargeURL copyWithZone:a3];

  *(void *)(v5 + 176) = [(NSString *)self->_navigationChromeBackgroundDarkModeImageURL copyWithZone:a3];
  *(void *)(v5 + 160) = [(NSString *)self->_navigationChromeBackgroundDarkModeImageCompactURL copyWithZone:a3];

  *(void *)(v5 + 168) = [(NSString *)self->_navigationChromeBackgroundDarkModeImageLargeURL copyWithZone:a3];
  *(void *)(v5 + 88) = [(NSString *)self->_kind copyWithZone:a3];

  *(void *)(v5 + 120) = [(NSString *)self->_nameCompact copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_behaviorFlags;
    *(unsigned char *)(v5 + 236) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 232) = self->_isPublic;
    *(unsigned char *)(v5 + 236) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 4)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      name = self->_name;
      if (!((unint64_t)name | *((void *)a3 + 14)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
      {
        engineResourceID = self->_engineResourceID;
        if (!((unint64_t)engineResourceID | *((void *)a3 + 7))
          || (int v5 = -[NSString isEqual:](engineResourceID, "isEqual:")) != 0)
        {
          superfeedConfigResourceID = self->_superfeedConfigResourceID;
          if (!((unint64_t)superfeedConfigResourceID | *((void *)a3 + 27))
            || (int v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:")) != 0)
          {
            latestPuzzleIDs = self->_latestPuzzleIDs;
            if (!((unint64_t)latestPuzzleIDs | *((void *)a3 + 13))
              || (int v5 = -[NSMutableArray isEqual:](latestPuzzleIDs, "isEqual:")) != 0)
            {
              promotedPuzzleIDs = self->_promotedPuzzleIDs;
              if (!((unint64_t)promotedPuzzleIDs | *((void *)a3 + 26))
                || (int v5 = -[NSMutableArray isEqual:](promotedPuzzleIDs, "isEqual:")) != 0)
              {
                language = self->_language;
                if (!((unint64_t)language | *((void *)a3 + 12))
                  || (int v5 = -[NSString isEqual:](language, "isEqual:")) != 0)
                {
                  blockedStorefrontIDs = self->_blockedStorefrontIDs;
                  if (!((unint64_t)blockedStorefrontIDs | *((void *)a3 + 5))
                    || (int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
                  {
                    allowedStorefrontIDs = self->_allowedStorefrontIDs;
                    if (!((unint64_t)allowedStorefrontIDs | *((void *)a3 + 3))
                      || (int v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
                    {
                      if ((*(unsigned char *)&self->_has & 2) != 0)
                      {
                        if ((*((unsigned char *)a3 + 236) & 2) == 0 || self->_minimumNewsVersion != *((void *)a3 + 2)) {
                          goto LABEL_66;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 236) & 2) != 0)
                      {
                        goto LABEL_66;
                      }
                      nameImageURL = self->_nameImageURL;
                      if (!((unint64_t)nameImageURL | *((void *)a3 + 19))
                        || (int v5 = -[NSString isEqual:](nameImageURL, "isEqual:")) != 0)
                      {
                        nameImageCompactURL = self->_nameImageCompactURL;
                        if (!((unint64_t)nameImageCompactURL | *((void *)a3 + 16))
                          || (int v5 = -[NSString isEqual:](nameImageCompactURL, "isEqual:")) != 0)
                        {
                          nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
                          if (!((unint64_t)nameImageForDarkBackgroundURL | *((void *)a3 + 17))
                            || (int v5 = -[NSString isEqual:](nameImageForDarkBackgroundURL, "isEqual:")) != 0)
                          {
                            nameImageMaskURL = self->_nameImageMaskURL;
                            if (!((unint64_t)nameImageMaskURL | *((void *)a3 + 18))
                              || (int v5 = -[NSString isEqual:](nameImageMaskURL, "isEqual:")) != 0)
                            {
                              coverImageURL = self->_coverImageURL;
                              if (!((unint64_t)coverImageURL | *((void *)a3 + 6))
                                || (int v5 = -[NSString isEqual:](coverImageURL, "isEqual:")) != 0)
                              {
                                feedNavImageURL = self->_feedNavImageURL;
                                if (!((unint64_t)feedNavImageURL | *((void *)a3 + 9))
                                  || (int v5 = -[NSString isEqual:](feedNavImageURL, "isEqual:")) != 0)
                                {
                                  exploreTileImageURL = self->_exploreTileImageURL;
                                  if (!((unint64_t)exploreTileImageURL | *((void *)a3 + 8))
                                    || (int v5 = -[NSString isEqual:](exploreTileImageURL, "isEqual:")) != 0)
                                  {
                                    themeConfiguration = self->_themeConfiguration;
                                    if (!((unint64_t)themeConfiguration | *((void *)a3 + 28))
                                      || (int v5 = -[NSString isEqual:](themeConfiguration, "isEqual:")) != 0)
                                    {
                                      imagesResourceID = self->_imagesResourceID;
                                      if (!((unint64_t)imagesResourceID | *((void *)a3 + 10))
                                        || (int v5 = -[NSString isEqual:](imagesResourceID, "isEqual:")) != 0)
                                      {
                                        navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
                                        if (!((unint64_t)navigationChromeBackgroundImageURL | *((void *)a3 + 25))
                                          || (int v5 = -[NSString isEqual:](navigationChromeBackgroundImageURL, "isEqual:")) != 0)
                                        {
                                          navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
                                          if (!((unint64_t)navigationChromeBackgroundImageCompactURL | *((void *)a3 + 23))
                                            || (int v5 = -[NSString isEqual:](navigationChromeBackgroundImageCompactURL, "isEqual:")) != 0)
                                          {
                                            navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
                                            if (!((unint64_t)navigationChromeBackgroundImageLargeURL | *((void *)a3 + 24))
                                              || (int v5 = -[NSString isEqual:](navigationChromeBackgroundImageLargeURL, "isEqual:")) != 0)
                                            {
                                              navigationChromeBackgroundDarkModeImageURL = self->_navigationChromeBackgroundDarkModeImageURL;
                                              if (!((unint64_t)navigationChromeBackgroundDarkModeImageURL | *((void *)a3 + 22))
                                                || (int v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageURL, "isEqual:")) != 0)
                                              {
                                                navigationChromeBackgroundDarkModeImageCompactURL = self->_navigationChromeBackgroundDarkModeImageCompactURL;
                                                if (!((unint64_t)navigationChromeBackgroundDarkModeImageCompactURL | *((void *)a3 + 20))
                                                  || (int v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageCompactURL, "isEqual:")) != 0)
                                                {
                                                  navigationChromeBackgroundDarkModeImageLargeURL = self->_navigationChromeBackgroundDarkModeImageLargeURL;
                                                  if (!((unint64_t)navigationChromeBackgroundDarkModeImageLargeURL | *((void *)a3 + 21))
                                                    || (int v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageLargeURL, "isEqual:")) != 0)
                                                  {
                                                    kind = self->_kind;
                                                    if (!((unint64_t)kind | *((void *)a3 + 11))
                                                      || (int v5 = -[NSString isEqual:](kind, "isEqual:")) != 0)
                                                    {
                                                      nameCompact = self->_nameCompact;
                                                      if (!((unint64_t)nameCompact | *((void *)a3 + 15))
                                                        || (int v5 = -[NSString isEqual:](nameCompact, "isEqual:")) != 0)
                                                      {
                                                        if (*(unsigned char *)&self->_has)
                                                        {
                                                          if ((*((unsigned char *)a3 + 236) & 1) == 0
                                                            || self->_behaviorFlags != *((void *)a3 + 1))
                                                          {
                                                            goto LABEL_66;
                                                          }
                                                        }
                                                        else if (*((unsigned char *)a3 + 236))
                                                        {
                                                          goto LABEL_66;
                                                        }
                                                        LOBYTE(v5) = (*((unsigned char *)a3 + 236) & 4) == 0;
                                                        if ((*(unsigned char *)&self->_has & 4) != 0)
                                                        {
                                                          if ((*((unsigned char *)a3 + 236) & 4) == 0)
                                                          {
LABEL_66:
                                                            LOBYTE(v5) = 0;
                                                            return v5;
                                                          }
                                                          if (self->_isPublic)
                                                          {
                                                            if (!*((unsigned char *)a3 + 232)) {
                                                              goto LABEL_66;
                                                            }
                                                          }
                                                          else if (*((unsigned char *)a3 + 232))
                                                          {
                                                            goto LABEL_66;
                                                          }
                                                          LOBYTE(v5) = 1;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v32 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v31 = [(NSString *)self->_name hash];
  NSUInteger v30 = [(NSString *)self->_engineResourceID hash];
  NSUInteger v29 = [(NSString *)self->_superfeedConfigResourceID hash];
  uint64_t v28 = [(NSMutableArray *)self->_latestPuzzleIDs hash];
  uint64_t v27 = [(NSMutableArray *)self->_promotedPuzzleIDs hash];
  NSUInteger v26 = [(NSString *)self->_language hash];
  uint64_t v25 = [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  uint64_t v24 = [(NSMutableArray *)self->_allowedStorefrontIDs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v23 = 2654435761 * self->_minimumNewsVersion;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_nameImageURL hash];
  NSUInteger v21 = [(NSString *)self->_nameImageCompactURL hash];
  NSUInteger v20 = [(NSString *)self->_nameImageForDarkBackgroundURL hash];
  NSUInteger v19 = [(NSString *)self->_nameImageMaskURL hash];
  NSUInteger v18 = [(NSString *)self->_coverImageURL hash];
  NSUInteger v17 = [(NSString *)self->_feedNavImageURL hash];
  NSUInteger v16 = [(NSString *)self->_exploreTileImageURL hash];
  NSUInteger v15 = [(NSString *)self->_themeConfiguration hash];
  NSUInteger v3 = [(NSString *)self->_imagesResourceID hash];
  NSUInteger v4 = [(NSString *)self->_navigationChromeBackgroundImageURL hash];
  NSUInteger v5 = [(NSString *)self->_navigationChromeBackgroundImageCompactURL hash];
  NSUInteger v6 = [(NSString *)self->_navigationChromeBackgroundImageLargeURL hash];
  NSUInteger v7 = [(NSString *)self->_navigationChromeBackgroundDarkModeImageURL hash];
  NSUInteger v8 = [(NSString *)self->_navigationChromeBackgroundDarkModeImageCompactURL hash];
  NSUInteger v9 = [(NSString *)self->_navigationChromeBackgroundDarkModeImageLargeURL hash];
  NSUInteger v10 = [(NSString *)self->_kind hash];
  NSUInteger v11 = [(NSString *)self->_nameCompact hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = 2654435761 * self->_behaviorFlags;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v13 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v13 = 2654435761 * self->_isPublic;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 4);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPuzzleTypeRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 14)) {
    -[NTPBPuzzleTypeRecord setName:](self, "setName:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBPuzzleTypeRecord setEngineResourceID:](self, "setEngineResourceID:");
  }
  if (*((void *)a3 + 27)) {
    -[NTPBPuzzleTypeRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  NSUInteger v7 = (void *)*((void *)a3 + 13);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBPuzzleTypeRecord *)self addLatestPuzzleIDs:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v9);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 26);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBPuzzleTypeRecord *)self addPromotedPuzzleIDs:*(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v14);
  }
  if (*((void *)a3 + 12)) {
    -[NTPBPuzzleTypeRecord setLanguage:](self, "setLanguage:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  NSUInteger v17 = (void *)*((void *)a3 + 5);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBPuzzleTypeRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v32 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v19);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  NSUInteger v22 = (void *)*((void *)a3 + 3);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        [(NTPBPuzzleTypeRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v28 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v24);
  }
  if ((*((unsigned char *)a3 + 236) & 2) != 0)
  {
    self->_minimumNewsVersion = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 19)) {
    -[NTPBPuzzleTypeRecord setNameImageURL:](self, "setNameImageURL:");
  }
  if (*((void *)a3 + 16)) {
    -[NTPBPuzzleTypeRecord setNameImageCompactURL:](self, "setNameImageCompactURL:");
  }
  if (*((void *)a3 + 17)) {
    -[NTPBPuzzleTypeRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:");
  }
  if (*((void *)a3 + 18)) {
    -[NTPBPuzzleTypeRecord setNameImageMaskURL:](self, "setNameImageMaskURL:");
  }
  if (*((void *)a3 + 6)) {
    -[NTPBPuzzleTypeRecord setCoverImageURL:](self, "setCoverImageURL:");
  }
  if (*((void *)a3 + 9)) {
    -[NTPBPuzzleTypeRecord setFeedNavImageURL:](self, "setFeedNavImageURL:");
  }
  if (*((void *)a3 + 8)) {
    -[NTPBPuzzleTypeRecord setExploreTileImageURL:](self, "setExploreTileImageURL:");
  }
  if (*((void *)a3 + 28)) {
    -[NTPBPuzzleTypeRecord setThemeConfiguration:](self, "setThemeConfiguration:");
  }
  if (*((void *)a3 + 10)) {
    -[NTPBPuzzleTypeRecord setImagesResourceID:](self, "setImagesResourceID:");
  }
  if (*((void *)a3 + 25)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:");
  }
  if (*((void *)a3 + 23)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:");
  }
  if (*((void *)a3 + 24)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:");
  }
  if (*((void *)a3 + 22)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageURL:](self, "setNavigationChromeBackgroundDarkModeImageURL:");
  }
  if (*((void *)a3 + 20)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageCompactURL:](self, "setNavigationChromeBackgroundDarkModeImageCompactURL:");
  }
  if (*((void *)a3 + 21)) {
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageLargeURL:](self, "setNavigationChromeBackgroundDarkModeImageLargeURL:");
  }
  if (*((void *)a3 + 11)) {
    -[NTPBPuzzleTypeRecord setKind:](self, "setKind:");
  }
  if (*((void *)a3 + 15)) {
    -[NTPBPuzzleTypeRecord setNameCompact:](self, "setNameCompact:");
  }
  char v27 = *((unsigned char *)a3 + 236);
  if (v27)
  {
    self->_behaviorFlags = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v27 = *((unsigned char *)a3 + 236);
  }
  if ((v27 & 4) != 0)
  {
    self->_isPublic = *((unsigned char *)a3 + 232);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)engineResourceID
{
  return self->_engineResourceID;
}

- (void)setEngineResourceID:(id)a3
{
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
}

- (NSMutableArray)latestPuzzleIDs
{
  return self->_latestPuzzleIDs;
}

- (void)setLatestPuzzleIDs:(id)a3
{
}

- (NSMutableArray)promotedPuzzleIDs
{
  return self->_promotedPuzzleIDs;
}

- (void)setPromotedPuzzleIDs:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (void)setBlockedStorefrontIDs:(id)a3
{
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (void)setAllowedStorefrontIDs:(id)a3
{
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)nameImageURL
{
  return self->_nameImageURL;
}

- (void)setNameImageURL:(id)a3
{
}

- (NSString)nameImageCompactURL
{
  return self->_nameImageCompactURL;
}

- (void)setNameImageCompactURL:(id)a3
{
}

- (NSString)nameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL;
}

- (void)setNameImageForDarkBackgroundURL:(id)a3
{
}

- (NSString)nameImageMaskURL
{
  return self->_nameImageMaskURL;
}

- (void)setNameImageMaskURL:(id)a3
{
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (void)setCoverImageURL:(id)a3
{
}

- (NSString)feedNavImageURL
{
  return self->_feedNavImageURL;
}

- (void)setFeedNavImageURL:(id)a3
{
}

- (NSString)exploreTileImageURL
{
  return self->_exploreTileImageURL;
}

- (void)setExploreTileImageURL:(id)a3
{
}

- (NSString)themeConfiguration
{
  return self->_themeConfiguration;
}

- (void)setThemeConfiguration:(id)a3
{
}

- (NSString)imagesResourceID
{
  return self->_imagesResourceID;
}

- (void)setImagesResourceID:(id)a3
{
}

- (NSString)navigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL;
}

- (void)setNavigationChromeBackgroundImageURL:(id)a3
{
}

- (NSString)navigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL;
}

- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3
{
}

- (NSString)navigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL;
}

- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3
{
}

- (NSString)navigationChromeBackgroundDarkModeImageURL
{
  return self->_navigationChromeBackgroundDarkModeImageURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageURL:(id)a3
{
}

- (NSString)navigationChromeBackgroundDarkModeImageCompactURL
{
  return self->_navigationChromeBackgroundDarkModeImageCompactURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageCompactURL:(id)a3
{
}

- (NSString)navigationChromeBackgroundDarkModeImageLargeURL
{
  return self->_navigationChromeBackgroundDarkModeImageLargeURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageLargeURL:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)nameCompact
{
  return self->_nameCompact;
}

- (void)setNameCompact:(id)a3
{
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

@end