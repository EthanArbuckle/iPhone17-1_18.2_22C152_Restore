@interface NTPBPuzzleRecord
+ (Class)allowedStorefrontIDsType;
+ (Class)authorsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)relatedPuzzleIDsType;
- (BOOL)hasBase;
- (BOOL)hasBehaviorFlags;
- (BOOL)hasDataResourceID;
- (BOOL)hasDifficultyLevel;
- (BOOL)hasIsDeprecated;
- (BOOL)hasIsDraft;
- (BOOL)hasIsPaid;
- (BOOL)hasLanguage;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasPublishedDate;
- (BOOL)hasPuzzleDescription;
- (BOOL)hasPuzzleTypeID;
- (BOOL)hasSubtitle;
- (BOOL)hasTeaserConfiguration;
- (BOOL)hasThumbnailImageCompactURL;
- (BOOL)hasThumbnailImageLargeURL;
- (BOOL)hasTitle;
- (BOOL)isDeprecated;
- (BOOL)isDraft;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaid;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)authors;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)relatedPuzzleIDs;
- (NSString)dataResourceID;
- (NSString)language;
- (NSString)puzzleDescription;
- (NSString)puzzleTypeID;
- (NSString)subtitle;
- (NSString)teaserConfiguration;
- (NSString)thumbnailImageCompactURL;
- (NSString)thumbnailImageLargeURL;
- (NSString)title;
- (NTPBDate)publishedDate;
- (NTPBRecordBase)base;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)authorsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)relatedPuzzleIDsAtIndex:(unint64_t)a3;
- (int64_t)behaviorFlags;
- (int64_t)difficultyLevel;
- (int64_t)minimumNewsVersion;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)authorsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)hash;
- (unint64_t)relatedPuzzleIDsCount;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addAuthors:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addRelatedPuzzleIDs:(id)a3;
- (void)clearAllowedStorefrontIDs;
- (void)clearAuthors;
- (void)clearBlockedStorefrontIDs;
- (void)clearRelatedPuzzleIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setAuthors:(id)a3;
- (void)setBase:(id)a3;
- (void)setBehaviorFlags:(int64_t)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setDataResourceID:(id)a3;
- (void)setDifficultyLevel:(int64_t)a3;
- (void)setHasBehaviorFlags:(BOOL)a3;
- (void)setHasDifficultyLevel:(BOOL)a3;
- (void)setHasIsDeprecated:(BOOL)a3;
- (void)setHasIsDraft:(BOOL)a3;
- (void)setHasIsPaid:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setIsDeprecated:(BOOL)a3;
- (void)setIsDraft:(BOOL)a3;
- (void)setIsPaid:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setPublishedDate:(id)a3;
- (void)setPuzzleDescription:(id)a3;
- (void)setPuzzleTypeID:(id)a3;
- (void)setRelatedPuzzleIDs:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTeaserConfiguration:(id)a3;
- (void)setThumbnailImageCompactURL:(id)a3;
- (void)setThumbnailImageLargeURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPuzzleRecord

- (void)dealloc
{
  [(NTPBPuzzleRecord *)self setBase:0];
  [(NTPBPuzzleRecord *)self setTitle:0];
  [(NTPBPuzzleRecord *)self setPuzzleDescription:0];
  [(NTPBPuzzleRecord *)self setPuzzleTypeID:0];
  [(NTPBPuzzleRecord *)self setDataResourceID:0];
  [(NTPBPuzzleRecord *)self setAuthors:0];
  [(NTPBPuzzleRecord *)self setPublishedDate:0];
  [(NTPBPuzzleRecord *)self setThumbnailImageCompactURL:0];
  [(NTPBPuzzleRecord *)self setThumbnailImageLargeURL:0];
  [(NTPBPuzzleRecord *)self setLanguage:0];
  [(NTPBPuzzleRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBPuzzleRecord *)self setAllowedStorefrontIDs:0];
  [(NTPBPuzzleRecord *)self setTeaserConfiguration:0];
  [(NTPBPuzzleRecord *)self setSubtitle:0];
  [(NTPBPuzzleRecord *)self setRelatedPuzzleIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleRecord;
  [(NTPBPuzzleRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPuzzleDescription
{
  return self->_puzzleDescription != 0;
}

- (BOOL)hasPuzzleTypeID
{
  return self->_puzzleTypeID != 0;
}

- (BOOL)hasDataResourceID
{
  return self->_dataResourceID != 0;
}

- (void)clearAuthors
{
}

- (void)addAuthors:(id)a3
{
  authors = self->_authors;
  if (!authors)
  {
    authors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_authors = authors;
  }

  [(NSMutableArray *)authors addObject:a3];
}

- (unint64_t)authorsCount
{
  return [(NSMutableArray *)self->_authors count];
}

- (id)authorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authors objectAtIndex:a3];
}

+ (Class)authorsType
{
  return (Class)objc_opt_class();
}

- (void)setIsPaid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPaid
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasPublishedDate
{
  return self->_publishedDate != 0;
}

- (void)setDifficultyLevel:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_difficultyLevel = a3;
}

- (void)setHasDifficultyLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDifficultyLevel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasThumbnailImageCompactURL
{
  return self->_thumbnailImageCompactURL != 0;
}

- (BOOL)hasThumbnailImageLargeURL
{
  return self->_thumbnailImageLargeURL != 0;
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
  *(unsigned char *)&self->_has |= 4u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTeaserConfiguration
{
  return self->_teaserConfiguration != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
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

- (void)setIsDeprecated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isDeprecated = a3;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsDeprecated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsDraft:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isDraft = a3;
}

- (void)setHasIsDraft:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsDraft
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearRelatedPuzzleIDs
{
}

- (void)addRelatedPuzzleIDs:(id)a3
{
  relatedPuzzleIDs = self->_relatedPuzzleIDs;
  if (!relatedPuzzleIDs)
  {
    relatedPuzzleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_relatedPuzzleIDs = relatedPuzzleIDs;
  }

  [(NSMutableArray *)relatedPuzzleIDs addObject:a3];
}

- (unint64_t)relatedPuzzleIDsCount
{
  return [(NSMutableArray *)self->_relatedPuzzleIDs count];
}

- (id)relatedPuzzleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_relatedPuzzleIDs objectAtIndex:a3];
}

+ (Class)relatedPuzzleIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPuzzleRecord description](&v3, sel_description), -[NTPBPuzzleRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  puzzleDescription = self->_puzzleDescription;
  if (puzzleDescription) {
    [v3 setObject:puzzleDescription forKey:@"puzzle_description"];
  }
  puzzleTypeID = self->_puzzleTypeID;
  if (puzzleTypeID) {
    [v3 setObject:puzzleTypeID forKey:@"puzzle_type_ID"];
  }
  dataResourceID = self->_dataResourceID;
  if (dataResourceID) {
    [v3 setObject:dataResourceID forKey:@"data_resource_ID"];
  }
  authors = self->_authors;
  if (authors) {
    [v3 setObject:authors forKey:@"authors"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaid), @"is_paid");
  }
  publishedDate = self->_publishedDate;
  if (publishedDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishedDate, "dictionaryRepresentation"), @"published_date");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_difficultyLevel), @"difficulty_level");
  }
  thumbnailImageCompactURL = self->_thumbnailImageCompactURL;
  if (thumbnailImageCompactURL) {
    [v3 setObject:thumbnailImageCompactURL forKey:@"thumbnail_image_compact_URL"];
  }
  thumbnailImageLargeURL = self->_thumbnailImageLargeURL;
  if (thumbnailImageLargeURL) {
    [v3 setObject:thumbnailImageLargeURL forKey:@"thumbnail_image_large_URL"];
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
  }
  teaserConfiguration = self->_teaserConfiguration;
  if (teaserConfiguration) {
    [v3 setObject:teaserConfiguration forKey:@"teaser_configuration"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_behaviorFlags), @"behavior_flags");
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_37:
      if ((has & 0x10) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDeprecated), @"is_deprecated");
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_38:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDraft), @"is_draft");
LABEL_39:
  relatedPuzzleIDs = self->_relatedPuzzleIDs;
  if (relatedPuzzleIDs) {
    [v3 setObject:relatedPuzzleIDs forKey:@"related_puzzle_IDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPuzzleRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_puzzleDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_puzzleTypeID) {
    PBDataWriterWriteStringField();
  }
  if (self->_dataResourceID) {
    PBDataWriterWriteStringField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  authors = self->_authors;
  uint64_t v5 = [(NSMutableArray *)authors countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(authors);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)authors countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v6);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_publishedDate) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v10 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v11);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v15 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v16);
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_teaserConfiguration) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_52:
      if ((has & 0x10) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_53:
  }
    PBDataWriterWriteBOOLField();
LABEL_54:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  relatedPuzzleIDs = self->_relatedPuzzleIDs;
  uint64_t v21 = [(NSMutableArray *)relatedPuzzleIDs countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(relatedPuzzleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSMutableArray *)relatedPuzzleIDs countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 48) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  *(void *)(v5 + 144) = [(NSString *)self->_title copyWithZone:a3];

  *(void *)(v5 + 88) = [(NSString *)self->_puzzleDescription copyWithZone:a3];
  *(void *)(v5 + 96) = [(NSString *)self->_puzzleTypeID copyWithZone:a3];

  *(void *)(v5 + 64) = [(NSString *)self->_dataResourceID copyWithZone:a3];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  authors = self->_authors;
  uint64_t v7 = [(NSMutableArray *)authors countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(authors);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAuthors:v11];
      }
      uint64_t v8 = [(NSMutableArray *)authors countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 154) = self->_isPaid;
    *(unsigned char *)(v5 + 156) |= 0x20u;
  }

  *(void *)(v5 + 80) = [(NTPBDate *)self->_publishedDate copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_difficultyLevel;
    *(unsigned char *)(v5 + 156) |= 2u;
  }

  *(void *)(v5 + 128) = [(NSString *)self->_thumbnailImageCompactURL copyWithZone:a3];
  *(void *)(v5 + 136) = [(NSString *)self->_thumbnailImageLargeURL copyWithZone:a3];

  *(void *)(v5 + 72) = [(NSString *)self->_language copyWithZone:a3];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v13 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v19 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v23];
      }
      uint64_t v20 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v20);
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_minimumNewsVersion;
    *(unsigned char *)(v5 + 156) |= 4u;
  }

  *(void *)(v5 + 120) = [(NSString *)self->_teaserConfiguration copyWithZone:a3];
  *(void *)(v5 + 112) = [(NSString *)self->_subtitle copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_behaviorFlags;
    *(unsigned char *)(v5 + 156) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_30:
      if ((has & 0x10) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_30;
  }
  *(unsigned char *)(v5 + 152) = self->_isDeprecated;
  *(unsigned char *)(v5 + 156) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_31:
    *(unsigned char *)(v5 + 153) = self->_isDraft;
    *(unsigned char *)(v5 + 156) |= 0x10u;
  }
LABEL_32:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  relatedPuzzleIDs = self->_relatedPuzzleIDs;
  uint64_t v26 = [(NSMutableArray *)relatedPuzzleIDs countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(relatedPuzzleIDs);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addRelatedPuzzleIDs:v30];
      }
      uint64_t v27 = [(NSMutableArray *)relatedPuzzleIDs countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v27);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  base = self->_base;
  if ((unint64_t)base | *((void *)a3 + 6))
  {
    int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)a3 + 18))
  {
    int v5 = -[NSString isEqual:](title, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  puzzleDescription = self->_puzzleDescription;
  if ((unint64_t)puzzleDescription | *((void *)a3 + 11))
  {
    int v5 = -[NSString isEqual:](puzzleDescription, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  puzzleTypeID = self->_puzzleTypeID;
  if ((unint64_t)puzzleTypeID | *((void *)a3 + 12))
  {
    int v5 = -[NSString isEqual:](puzzleTypeID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  dataResourceID = self->_dataResourceID;
  if ((unint64_t)dataResourceID | *((void *)a3 + 8))
  {
    int v5 = -[NSString isEqual:](dataResourceID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  authors = self->_authors;
  if ((unint64_t)authors | *((void *)a3 + 5))
  {
    int v5 = -[NSMutableArray isEqual:](authors, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 156) & 0x20) == 0) {
      goto LABEL_66;
    }
    if (self->_isPaid)
    {
      if (!*((unsigned char *)a3 + 154)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)a3 + 154))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)a3 + 156) & 0x20) != 0)
  {
    goto LABEL_66;
  }
  publishedDate = self->_publishedDate;
  if ((unint64_t)publishedDate | *((void *)a3 + 10))
  {
    int v5 = -[NTPBDate isEqual:](publishedDate, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 156) & 2) == 0 || self->_difficultyLevel != *((void *)a3 + 2)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)a3 + 156) & 2) != 0)
  {
    goto LABEL_66;
  }
  thumbnailImageCompactURL = self->_thumbnailImageCompactURL;
  if (!((unint64_t)thumbnailImageCompactURL | *((void *)a3 + 16))
    || (int v5 = -[NSString isEqual:](thumbnailImageCompactURL, "isEqual:")) != 0)
  {
    thumbnailImageLargeURL = self->_thumbnailImageLargeURL;
    if (!((unint64_t)thumbnailImageLargeURL | *((void *)a3 + 17))
      || (int v5 = -[NSString isEqual:](thumbnailImageLargeURL, "isEqual:")) != 0)
    {
      language = self->_language;
      if (!((unint64_t)language | *((void *)a3 + 9)) || (int v5 = -[NSString isEqual:](language, "isEqual:")) != 0)
      {
        blockedStorefrontIDs = self->_blockedStorefrontIDs;
        if (!((unint64_t)blockedStorefrontIDs | *((void *)a3 + 7))
          || (int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
        {
          allowedStorefrontIDs = self->_allowedStorefrontIDs;
          if (!((unint64_t)allowedStorefrontIDs | *((void *)a3 + 4))
            || (int v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
          {
            if ((*(unsigned char *)&self->_has & 4) != 0)
            {
              if ((*((unsigned char *)a3 + 156) & 4) == 0 || self->_minimumNewsVersion != *((void *)a3 + 3)) {
                goto LABEL_66;
              }
            }
            else if ((*((unsigned char *)a3 + 156) & 4) != 0)
            {
              goto LABEL_66;
            }
            teaserConfiguration = self->_teaserConfiguration;
            if (!((unint64_t)teaserConfiguration | *((void *)a3 + 15))
              || (int v5 = -[NSString isEqual:](teaserConfiguration, "isEqual:")) != 0)
            {
              subtitle = self->_subtitle;
              if (!((unint64_t)subtitle | *((void *)a3 + 14))
                || (int v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
              {
                if (*(unsigned char *)&self->_has)
                {
                  if ((*((unsigned char *)a3 + 156) & 1) == 0 || self->_behaviorFlags != *((void *)a3 + 1)) {
                    goto LABEL_66;
                  }
                }
                else if (*((unsigned char *)a3 + 156))
                {
                  goto LABEL_66;
                }
                if ((*(unsigned char *)&self->_has & 8) != 0)
                {
                  if ((*((unsigned char *)a3 + 156) & 8) == 0) {
                    goto LABEL_66;
                  }
                  if (self->_isDeprecated)
                  {
                    if (!*((unsigned char *)a3 + 152)) {
                      goto LABEL_66;
                    }
                  }
                  else if (*((unsigned char *)a3 + 152))
                  {
                    goto LABEL_66;
                  }
                }
                else if ((*((unsigned char *)a3 + 156) & 8) != 0)
                {
                  goto LABEL_66;
                }
                if ((*(unsigned char *)&self->_has & 0x10) != 0)
                {
                  if ((*((unsigned char *)a3 + 156) & 0x10) != 0)
                  {
                    if (self->_isDraft)
                    {
                      if (!*((unsigned char *)a3 + 153)) {
                        goto LABEL_66;
                      }
                      goto LABEL_72;
                    }
                    if (!*((unsigned char *)a3 + 153))
                    {
LABEL_72:
                      relatedPuzzleIDs = self->_relatedPuzzleIDs;
                      if ((unint64_t)relatedPuzzleIDs | *((void *)a3 + 13))
                      {
                        LOBYTE(v5) = -[NSMutableArray isEqual:](relatedPuzzleIDs, "isEqual:");
                      }
                      else
                      {
                        LOBYTE(v5) = 1;
                      }
                      return v5;
                    }
                  }
                }
                else if ((*((unsigned char *)a3 + 156) & 0x10) == 0)
                {
                  goto LABEL_72;
                }
LABEL_66:
                LOBYTE(v5) = 0;
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
  unint64_t v23 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v22 = [(NSString *)self->_title hash];
  NSUInteger v21 = [(NSString *)self->_puzzleDescription hash];
  NSUInteger v20 = [(NSString *)self->_puzzleTypeID hash];
  NSUInteger v19 = [(NSString *)self->_dataResourceID hash];
  uint64_t v18 = [(NSMutableArray *)self->_authors hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v17 = 2654435761 * self->_isPaid;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v16 = [(NTPBDate *)self->_publishedDate hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v15 = 2654435761 * self->_difficultyLevel;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_thumbnailImageCompactURL hash];
  NSUInteger v4 = [(NSString *)self->_thumbnailImageLargeURL hash];
  NSUInteger v5 = [(NSString *)self->_language hash];
  uint64_t v6 = [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  uint64_t v7 = [(NSMutableArray *)self->_allowedStorefrontIDs hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_minimumNewsVersion;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_teaserConfiguration hash];
  NSUInteger v10 = [(NSString *)self->_subtitle hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v13 = 0;
    return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_relatedPuzzleIDs hash];
  }
  uint64_t v11 = 2654435761 * self->_behaviorFlags;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_isDeprecated;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v13 = 2654435761 * self->_isDraft;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_relatedPuzzleIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 6);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPuzzleRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 18)) {
    -[NTPBPuzzleRecord setTitle:](self, "setTitle:");
  }
  if (*((void *)a3 + 11)) {
    -[NTPBPuzzleRecord setPuzzleDescription:](self, "setPuzzleDescription:");
  }
  if (*((void *)a3 + 12)) {
    -[NTPBPuzzleRecord setPuzzleTypeID:](self, "setPuzzleTypeID:");
  }
  if (*((void *)a3 + 8)) {
    -[NTPBPuzzleRecord setDataResourceID:](self, "setDataResourceID:");
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBPuzzleRecord *)self addAuthors:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v9);
  }
  if ((*((unsigned char *)a3 + 156) & 0x20) != 0)
  {
    self->_isPaid = *((unsigned char *)a3 + 154);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  publishedDate = self->_publishedDate;
  uint64_t v13 = *((void *)a3 + 10);
  if (publishedDate)
  {
    if (v13) {
      -[NTPBDate mergeFrom:](publishedDate, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[NTPBPuzzleRecord setPublishedDate:](self, "setPublishedDate:");
  }
  if ((*((unsigned char *)a3 + 156) & 2) != 0)
  {
    self->_difficultyLevel = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 16)) {
    -[NTPBPuzzleRecord setThumbnailImageCompactURL:](self, "setThumbnailImageCompactURL:");
  }
  if (*((void *)a3 + 17)) {
    -[NTPBPuzzleRecord setThumbnailImageLargeURL:](self, "setThumbnailImageLargeURL:");
  }
  if (*((void *)a3 + 9)) {
    -[NTPBPuzzleRecord setLanguage:](self, "setLanguage:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = (void *)*((void *)a3 + 7);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NTPBPuzzleRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v16);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  NSUInteger v19 = (void *)*((void *)a3 + 4);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        [(NTPBPuzzleRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v34 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v21);
  }
  if ((*((unsigned char *)a3 + 156) & 4) != 0)
  {
    self->_minimumNewsVersion = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 15)) {
    -[NTPBPuzzleRecord setTeaserConfiguration:](self, "setTeaserConfiguration:");
  }
  if (*((void *)a3 + 14)) {
    -[NTPBPuzzleRecord setSubtitle:](self, "setSubtitle:");
  }
  char v24 = *((unsigned char *)a3 + 156);
  if (v24)
  {
    self->_behaviorFlags = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v24 = *((unsigned char *)a3 + 156);
    if ((v24 & 8) == 0)
    {
LABEL_58:
      if ((v24 & 0x10) == 0) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)a3 + 156) & 8) == 0)
  {
    goto LABEL_58;
  }
  self->_isDeprecated = *((unsigned char *)a3 + 152);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 156) & 0x10) != 0)
  {
LABEL_59:
    self->_isDraft = *((unsigned char *)a3 + 153);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_60:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v25 = (void *)*((void *)a3 + 13);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        [(NTPBPuzzleRecord *)self addRelatedPuzzleIDs:*(void *)(*((void *)&v30 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v27);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)puzzleDescription
{
  return self->_puzzleDescription;
}

- (void)setPuzzleDescription:(id)a3
{
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (void)setPuzzleTypeID:(id)a3
{
}

- (NSString)dataResourceID
{
  return self->_dataResourceID;
}

- (void)setDataResourceID:(id)a3
{
}

- (NSMutableArray)authors
{
  return self->_authors;
}

- (void)setAuthors:(id)a3
{
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (NTPBDate)publishedDate
{
  return self->_publishedDate;
}

- (void)setPublishedDate:(id)a3
{
}

- (int64_t)difficultyLevel
{
  return self->_difficultyLevel;
}

- (NSString)thumbnailImageCompactURL
{
  return self->_thumbnailImageCompactURL;
}

- (void)setThumbnailImageCompactURL:(id)a3
{
}

- (NSString)thumbnailImageLargeURL
{
  return self->_thumbnailImageLargeURL;
}

- (void)setThumbnailImageLargeURL:(id)a3
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

- (NSString)teaserConfiguration
{
  return self->_teaserConfiguration;
}

- (void)setTeaserConfiguration:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (NSMutableArray)relatedPuzzleIDs
{
  return self->_relatedPuzzleIDs;
}

- (void)setRelatedPuzzleIDs:(id)a3
{
}

@end