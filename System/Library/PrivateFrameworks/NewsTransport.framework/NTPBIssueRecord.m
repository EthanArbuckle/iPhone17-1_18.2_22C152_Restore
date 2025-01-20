@interface NTPBIssueRecord
+ (Class)allArticleIDsType;
+ (Class)allowedStorefrontIDsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)bundleFeaturedArticleIDsType;
+ (Class)topicTagIDsType;
- (BOOL)hasBase;
- (BOOL)hasChannelTagID;
- (BOOL)hasConversionStats;
- (BOOL)hasCoverAccentColor;
- (BOOL)hasCoverArticleID;
- (BOOL)hasCoverAspectRatio;
- (BOOL)hasCoverBackgroundColor;
- (BOOL)hasCoverImageURL;
- (BOOL)hasCoverPrimaryColor;
- (BOOL)hasCoverTextColor;
- (BOOL)hasEdition;
- (BOOL)hasHalfLifeMilliseconds;
- (BOOL)hasIsDraft;
- (BOOL)hasIsPaid;
- (BOOL)hasIssueDescription;
- (BOOL)hasLayeredCover;
- (BOOL)hasLayeredCoverAspectRatio;
- (BOOL)hasLayeredCoverPrimaryColor;
- (BOOL)hasMetadataURL;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasNotificationDescription;
- (BOOL)hasPdfResourceArchiveURL;
- (BOOL)hasPublishDate;
- (BOOL)hasScores;
- (BOOL)hasSortDate;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)isDraft;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaid;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats)conversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores)scores;
- (NSMutableArray)allArticleIDs;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)bundleFeaturedArticleIDs;
- (NSMutableArray)topicTagIDs;
- (NSString)channelTagID;
- (NSString)coverAccentColor;
- (NSString)coverArticleID;
- (NSString)coverBackgroundColor;
- (NSString)coverImageURL;
- (NSString)coverPrimaryColor;
- (NSString)coverTextColor;
- (NSString)edition;
- (NSString)issueDescription;
- (NSString)layeredCover;
- (NSString)layeredCoverPrimaryColor;
- (NSString)metadataURL;
- (NSString)notificationDescription;
- (NSString)pdfResourceArchiveURL;
- (NSString)title;
- (NTPBDate)publishDate;
- (NTPBDate)sortDate;
- (NTPBRecordBase)base;
- (double)coverAspectRatio;
- (double)layeredCoverAspectRatio;
- (id)allArticleIDsAtIndex:(unint64_t)a3;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)bundleFeaturedArticleIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicTagIDsAtIndex:(unint64_t)a3;
- (int)type;
- (int64_t)minimumNewsVersion;
- (unint64_t)allArticleIDsCount;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)bundleFeaturedArticleIDsCount;
- (unint64_t)halfLifeMilliseconds;
- (unint64_t)hash;
- (unint64_t)topicTagIDsCount;
- (void)addAllArticleIDs:(id)a3;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addBundleFeaturedArticleIDs:(id)a3;
- (void)addTopicTagIDs:(id)a3;
- (void)clearAllArticleIDs;
- (void)clearAllowedStorefrontIDs;
- (void)clearBlockedStorefrontIDs;
- (void)clearBundleFeaturedArticleIDs;
- (void)clearTopicTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllArticleIDs:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setBase:(id)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setBundleFeaturedArticleIDs:(id)a3;
- (void)setChannelTagID:(id)a3;
- (void)setConversionStats:(id)a3;
- (void)setCoverAccentColor:(id)a3;
- (void)setCoverArticleID:(id)a3;
- (void)setCoverAspectRatio:(double)a3;
- (void)setCoverBackgroundColor:(id)a3;
- (void)setCoverImageURL:(id)a3;
- (void)setCoverPrimaryColor:(id)a3;
- (void)setCoverTextColor:(id)a3;
- (void)setEdition:(id)a3;
- (void)setHalfLifeMilliseconds:(unint64_t)a3;
- (void)setHasCoverAspectRatio:(BOOL)a3;
- (void)setHasHalfLifeMilliseconds:(BOOL)a3;
- (void)setHasIsDraft:(BOOL)a3;
- (void)setHasIsPaid:(BOOL)a3;
- (void)setHasLayeredCoverAspectRatio:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsDraft:(BOOL)a3;
- (void)setIsPaid:(BOOL)a3;
- (void)setIssueDescription:(id)a3;
- (void)setLayeredCover:(id)a3;
- (void)setLayeredCoverAspectRatio:(double)a3;
- (void)setLayeredCoverPrimaryColor:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setNotificationDescription:(id)a3;
- (void)setPdfResourceArchiveURL:(id)a3;
- (void)setPublishDate:(id)a3;
- (void)setScores:(id)a3;
- (void)setSortDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicTagIDs:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (double)coverAspectRatio
{
  return self->_coverAspectRatio;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSMutableArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (NSString)title
{
  return self->_title;
}

- (NTPBDate)sortDate
{
  return self->_sortDate;
}

- (NTPBDate)publishDate
{
  return self->_publishDate;
}

- (NSString)notificationDescription
{
  return self->_notificationDescription;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)metadataURL
{
  return self->_metadataURL;
}

- (NSString)layeredCover
{
  return self->_layeredCover;
}

- (NSString)layeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (NSString)edition
{
  return self->_edition;
}

- (NSString)coverTextColor
{
  return self->_coverTextColor;
}

- (NSString)coverPrimaryColor
{
  return self->_coverPrimaryColor;
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (NSString)coverBackgroundColor
{
  return self->_coverBackgroundColor;
}

- (NSString)coverArticleID
{
  return self->_coverArticleID;
}

- (NSString)coverAccentColor
{
  return self->_coverAccentColor;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSMutableArray)allArticleIDs
{
  return self->_allArticleIDs;
}

- (NSString)channelTagID
{
  return self->_channelTagID;
}

- (BOOL)hasMetadataURL
{
  return self->_metadataURL != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (void)addAllArticleIDs:(id)a3
{
  allArticleIDs = self->_allArticleIDs;
  if (!allArticleIDs)
  {
    allArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_allArticleIDs = allArticleIDs;
  }

  [(NSMutableArray *)allArticleIDs addObject:a3];
}

- (void)addTopicTagIDs:(id)a3
{
  topicTagIDs = self->_topicTagIDs;
  if (!topicTagIDs)
  {
    topicTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_topicTagIDs = topicTagIDs;
  }

  [(NSMutableArray *)topicTagIDs addObject:a3];
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

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  [(NTPBIssueRecord *)self setBase:0];
  [(NTPBIssueRecord *)self setAllArticleIDs:0];
  [(NTPBIssueRecord *)self setAllowedStorefrontIDs:0];
  [(NTPBIssueRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBIssueRecord *)self setChannelTagID:0];
  [(NTPBIssueRecord *)self setCoverArticleID:0];
  [(NTPBIssueRecord *)self setCoverImageURL:0];
  [(NTPBIssueRecord *)self setCoverPrimaryColor:0];
  [(NTPBIssueRecord *)self setEdition:0];
  [(NTPBIssueRecord *)self setIssueDescription:0];
  [(NTPBIssueRecord *)self setLayeredCover:0];
  [(NTPBIssueRecord *)self setLayeredCoverPrimaryColor:0];
  [(NTPBIssueRecord *)self setMetadataURL:0];
  [(NTPBIssueRecord *)self setNotificationDescription:0];
  [(NTPBIssueRecord *)self setPublishDate:0];
  [(NTPBIssueRecord *)self setScores:0];
  [(NTPBIssueRecord *)self setTitle:0];
  [(NTPBIssueRecord *)self setTopicTagIDs:0];
  [(NTPBIssueRecord *)self setPdfResourceArchiveURL:0];
  [(NTPBIssueRecord *)self setBundleFeaturedArticleIDs:0];
  [(NTPBIssueRecord *)self setConversionStats:0];
  [(NTPBIssueRecord *)self setCoverBackgroundColor:0];
  [(NTPBIssueRecord *)self setCoverTextColor:0];
  [(NTPBIssueRecord *)self setCoverAccentColor:0];
  [(NTPBIssueRecord *)self setSortDate:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueRecord;
  [(NTPBIssueRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearAllArticleIDs
{
}

- (unint64_t)allArticleIDsCount
{
  return [(NSMutableArray *)self->_allArticleIDs count];
}

- (id)allArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allArticleIDs objectAtIndex:a3];
}

+ (Class)allArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
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

- (BOOL)hasChannelTagID
{
  return self->_channelTagID != 0;
}

- (BOOL)hasCoverArticleID
{
  return self->_coverArticleID != 0;
}

- (void)setCoverAspectRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coverAspectRatio = a3;
}

- (void)setHasCoverAspectRatio:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverAspectRatio
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCoverPrimaryColor
{
  return self->_coverPrimaryColor != 0;
}

- (BOOL)hasEdition
{
  return self->_edition != 0;
}

- (void)setHalfLifeMilliseconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_halfLifeMilliseconds = a3;
}

- (void)setHasHalfLifeMilliseconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHalfLifeMilliseconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsDraft:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isDraft = a3;
}

- (void)setHasIsDraft:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsDraft
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsPaid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPaid
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (BOOL)hasLayeredCover
{
  return self->_layeredCover != 0;
}

- (void)setLayeredCoverAspectRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_layeredCoverAspectRatio = a3;
}

- (void)setHasLayeredCoverAspectRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLayeredCoverAspectRatio
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasLayeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor != 0;
}

- (BOOL)hasNotificationDescription
{
  return self->_notificationDescription != 0;
}

- (BOOL)hasPublishDate
{
  return self->_publishDate != 0;
}

- (BOOL)hasScores
{
  return self->_scores != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)clearTopicTagIDs
{
}

- (unint64_t)topicTagIDsCount
{
  return [(NSMutableArray *)self->_topicTagIDs count];
}

- (id)topicTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicTagIDs objectAtIndex:a3];
}

+ (Class)topicTagIDsType
{
  return (Class)objc_opt_class();
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasPdfResourceArchiveURL
{
  return self->_pdfResourceArchiveURL != 0;
}

- (void)clearBundleFeaturedArticleIDs
{
}

- (void)addBundleFeaturedArticleIDs:(id)a3
{
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  if (!bundleFeaturedArticleIDs)
  {
    bundleFeaturedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_bundleFeaturedArticleIDs = bundleFeaturedArticleIDs;
  }

  [(NSMutableArray *)bundleFeaturedArticleIDs addObject:a3];
}

- (unint64_t)bundleFeaturedArticleIDsCount
{
  return [(NSMutableArray *)self->_bundleFeaturedArticleIDs count];
}

- (id)bundleFeaturedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleFeaturedArticleIDs objectAtIndex:a3];
}

+ (Class)bundleFeaturedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConversionStats
{
  return self->_conversionStats != 0;
}

- (BOOL)hasCoverBackgroundColor
{
  return self->_coverBackgroundColor != 0;
}

- (BOOL)hasCoverTextColor
{
  return self->_coverTextColor != 0;
}

- (BOOL)hasCoverAccentColor
{
  return self->_coverAccentColor != 0;
}

- (BOOL)hasSortDate
{
  return self->_sortDate != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBIssueRecord description](&v3, sel_description), -[NTPBIssueRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  allArticleIDs = self->_allArticleIDs;
  if (allArticleIDs) {
    [v3 setObject:allArticleIDs forKey:@"all_article_IDs"];
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs) {
    [v3 setObject:allowedStorefrontIDs forKey:@"allowed_storefront_IDs"];
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs) {
    [v3 setObject:blockedStorefrontIDs forKey:@"blocked_storefront_IDs"];
  }
  channelTagID = self->_channelTagID;
  if (channelTagID) {
    [v3 setObject:channelTagID forKey:@"channel_tag_ID"];
  }
  coverArticleID = self->_coverArticleID;
  if (coverArticleID) {
    [v3 setObject:coverArticleID forKey:@"cover_article_ID"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_coverAspectRatio), @"cover_aspect_ratio");
  }
  coverImageURL = self->_coverImageURL;
  if (coverImageURL) {
    [v3 setObject:coverImageURL forKey:@"cover_image_URL"];
  }
  coverPrimaryColor = self->_coverPrimaryColor;
  if (coverPrimaryColor) {
    [v3 setObject:coverPrimaryColor forKey:@"cover_primary_color"];
  }
  edition = self->_edition;
  if (edition) {
    [v3 setObject:edition forKey:@"edition"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_halfLifeMilliseconds), @"half_life_milliseconds");
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_23:
      if ((has & 0x40) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDraft), @"is_draft");
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_24:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaid), @"is_paid");
LABEL_25:
  issueDescription = self->_issueDescription;
  if (issueDescription) {
    [v3 setObject:issueDescription forKey:@"issue_description"];
  }
  layeredCover = self->_layeredCover;
  if (layeredCover) {
    [v3 setObject:layeredCover forKey:@"layered_cover"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_layeredCoverAspectRatio), @"layered_cover_aspect_ratio");
  }
  layeredCoverPrimaryColor = self->_layeredCoverPrimaryColor;
  if (layeredCoverPrimaryColor) {
    [v3 setObject:layeredCoverPrimaryColor forKey:@"layered_cover_primary_color"];
  }
  metadataURL = self->_metadataURL;
  if (metadataURL) {
    [v3 setObject:metadataURL forKey:@"metadata_URL"];
  }
  notificationDescription = self->_notificationDescription;
  if (notificationDescription) {
    [v3 setObject:notificationDescription forKey:@"notification_description"];
  }
  publishDate = self->_publishDate;
  if (publishDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishDate, "dictionaryRepresentation"), @"publish_date");
  }
  scores = self->_scores;
  if (scores) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores dictionaryRepresentation](scores, "dictionaryRepresentation"), @"scores");
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  topicTagIDs = self->_topicTagIDs;
  if (topicTagIDs) {
    [v3 setObject:topicTagIDs forKey:@"topic_tag_IDs"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_type), @"type");
    char v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
  }
  pdfResourceArchiveURL = self->_pdfResourceArchiveURL;
  if (pdfResourceArchiveURL) {
    [v3 setObject:pdfResourceArchiveURL forKey:@"pdf_resource_archive_URL"];
  }
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  if (bundleFeaturedArticleIDs) {
    [v3 setObject:bundleFeaturedArticleIDs forKey:@"bundle_featured_article_IDs"];
  }
  conversionStats = self->_conversionStats;
  if (conversionStats) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats dictionaryRepresentation](conversionStats, "dictionaryRepresentation"), @"conversion_stats");
  }
  coverBackgroundColor = self->_coverBackgroundColor;
  if (coverBackgroundColor) {
    [v3 setObject:coverBackgroundColor forKey:@"cover_background_color"];
  }
  coverTextColor = self->_coverTextColor;
  if (coverTextColor) {
    [v3 setObject:coverTextColor forKey:@"cover_text_color"];
  }
  coverAccentColor = self->_coverAccentColor;
  if (coverAccentColor) {
    [v3 setObject:coverAccentColor forKey:@"cover_accent_color"];
  }
  sortDate = self->_sortDate;
  if (sortDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](sortDate, "dictionaryRepresentation"), @"sort_date");
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  allArticleIDs = self->_allArticleIDs;
  uint64_t v5 = [(NSMutableArray *)allArticleIDs countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(allArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)allArticleIDs countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v6);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v10 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v11);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v15 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v16);
  }
  if (self->_channelTagID) {
    PBDataWriterWriteStringField();
  }
  if (self->_coverArticleID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_coverImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_coverPrimaryColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_edition) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_38:
      if ((has & 0x40) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_39:
  }
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_issueDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_layeredCover) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_layeredCoverPrimaryColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadataURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_publishDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_scores) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  topicTagIDs = self->_topicTagIDs;
  uint64_t v21 = [(NSMutableArray *)topicTagIDs countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(topicTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSMutableArray *)topicTagIDs countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v22);
  }
  char v25 = (char)self->_has;
  if ((v25 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v25 = (char)self->_has;
  }
  if ((v25 & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_pdfResourceArchiveURL) {
    PBDataWriterWriteStringField();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  uint64_t v27 = [(NSMutableArray *)bundleFeaturedArticleIDs countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(bundleFeaturedArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v28 = [(NSMutableArray *)bundleFeaturedArticleIDs countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
  if (self->_conversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_coverBackgroundColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_coverTextColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_coverAccentColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_sortDate) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 56) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  allArticleIDs = self->_allArticleIDs;
  uint64_t v7 = [(NSMutableArray *)allArticleIDs countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(allArticleIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAllArticleIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)allArticleIDs countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v8);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v13 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v14);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v19 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v23];
      }
      uint64_t v20 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v20);
  }

  *(void *)(v5 + 80) = [(NSString *)self->_channelTagID copyWithZone:a3];
  *(void *)(v5 + 104) = [(NSString *)self->_coverArticleID copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_coverAspectRatio;
    *(unsigned char *)(v5 + 248) |= 1u;
  }

  *(void *)(v5 + 120) = [(NSString *)self->_coverImageURL copyWithZone:a3];
  *(void *)(v5 + 128) = [(NSString *)self->_coverPrimaryColor copyWithZone:a3];

  *(void *)(v5 + 144) = [(NSString *)self->_edition copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_halfLifeMilliseconds;
    *(unsigned char *)(v5 + 248) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_26:
      if ((has & 0x40) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_26;
  }
  *(unsigned char *)(v5 + 244) = self->_isDraft;
  *(unsigned char *)(v5 + 248) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *(unsigned char *)(v5 + 245) = self->_isPaid;
    *(unsigned char *)(v5 + 248) |= 0x40u;
  }
LABEL_28:

  *(void *)(v5 + 152) = [(NSString *)self->_issueDescription copyWithZone:a3];
  *(void *)(v5 + 160) = [(NSString *)self->_layeredCover copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_layeredCoverAspectRatio;
    *(unsigned char *)(v5 + 248) |= 4u;
  }

  *(void *)(v5 + 168) = [(NSString *)self->_layeredCoverPrimaryColor copyWithZone:a3];
  *(void *)(v5 + 176) = [(NSString *)self->_metadataURL copyWithZone:a3];

  *(void *)(v5 + 184) = [(NSString *)self->_notificationDescription copyWithZone:a3];
  *(void *)(v5 + 200) = [(NTPBDate *)self->_publishDate copyWithZone:a3];

  *(void *)(v5 + 208) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self->_scores copyWithZone:a3];
  *(void *)(v5 + 224) = [(NSString *)self->_title copyWithZone:a3];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  topicTagIDs = self->_topicTagIDs;
  uint64_t v26 = [(NSMutableArray *)topicTagIDs countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(topicTagIDs);
        }
        v30 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addTopicTagIDs:v30];
      }
      uint64_t v27 = [(NSMutableArray *)topicTagIDs countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v27);
  }
  char v31 = (char)self->_has;
  if ((v31 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_type;
    *(unsigned char *)(v5 + 248) |= 0x10u;
    char v31 = (char)self->_has;
  }
  if ((v31 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_minimumNewsVersion;
    *(unsigned char *)(v5 + 248) |= 8u;
  }

  *(void *)(v5 + 192) = [(NSString *)self->_pdfResourceArchiveURL copyWithZone:a3];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  uint64_t v33 = [(NSMutableArray *)bundleFeaturedArticleIDs countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(bundleFeaturedArticleIDs);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addBundleFeaturedArticleIDs:v37];
      }
      uint64_t v34 = [(NSMutableArray *)bundleFeaturedArticleIDs countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v34);
  }

  *(void *)(v5 + 88) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self->_conversionStats copyWithZone:a3];
  *(void *)(v5 + 112) = [(NSString *)self->_coverBackgroundColor copyWithZone:a3];

  *(void *)(v5 + 136) = [(NSString *)self->_coverTextColor copyWithZone:a3];
  *(void *)(v5 + 96) = [(NSString *)self->_coverAccentColor copyWithZone:a3];

  *(void *)(v5 + 216) = [(NTPBDate *)self->_sortDate copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 7)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      allArticleIDs = self->_allArticleIDs;
      if (!((unint64_t)allArticleIDs | *((void *)a3 + 5))
        || (int v5 = -[NSMutableArray isEqual:](allArticleIDs, "isEqual:")) != 0)
      {
        allowedStorefrontIDs = self->_allowedStorefrontIDs;
        if (!((unint64_t)allowedStorefrontIDs | *((void *)a3 + 6))
          || (int v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
        {
          blockedStorefrontIDs = self->_blockedStorefrontIDs;
          if (!((unint64_t)blockedStorefrontIDs | *((void *)a3 + 8))
            || (int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
          {
            channelTagID = self->_channelTagID;
            if (!((unint64_t)channelTagID | *((void *)a3 + 10))
              || (int v5 = -[NSString isEqual:](channelTagID, "isEqual:")) != 0)
            {
              coverArticleID = self->_coverArticleID;
              if (!((unint64_t)coverArticleID | *((void *)a3 + 13))
                || (int v5 = -[NSString isEqual:](coverArticleID, "isEqual:")) != 0)
              {
                if (*(unsigned char *)&self->_has)
                {
                  if ((*((unsigned char *)a3 + 248) & 1) == 0 || self->_coverAspectRatio != *((double *)a3 + 1)) {
                    goto LABEL_42;
                  }
                }
                else if (*((unsigned char *)a3 + 248))
                {
                  goto LABEL_42;
                }
                coverImageURL = self->_coverImageURL;
                if (!((unint64_t)coverImageURL | *((void *)a3 + 15))
                  || (int v5 = -[NSString isEqual:](coverImageURL, "isEqual:")) != 0)
                {
                  coverPrimaryColor = self->_coverPrimaryColor;
                  if (!((unint64_t)coverPrimaryColor | *((void *)a3 + 16))
                    || (int v5 = -[NSString isEqual:](coverPrimaryColor, "isEqual:")) != 0)
                  {
                    editiouint64_t n = self->_edition;
                    if (!((unint64_t)edition | *((void *)a3 + 18))
                      || (int v5 = -[NSString isEqual:](edition, "isEqual:")) != 0)
                    {
                      if ((*(unsigned char *)&self->_has & 2) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 2) == 0 || self->_halfLifeMilliseconds != *((void *)a3 + 2)) {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 248) & 2) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(unsigned char *)&self->_has & 0x20) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 0x20) == 0) {
                          goto LABEL_42;
                        }
                        if (self->_isDraft)
                        {
                          if (!*((unsigned char *)a3 + 244)) {
                            goto LABEL_42;
                          }
                        }
                        else if (*((unsigned char *)a3 + 244))
                        {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 248) & 0x20) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(unsigned char *)&self->_has & 0x40) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 0x40) == 0) {
                          goto LABEL_42;
                        }
                        if (self->_isPaid)
                        {
                          if (!*((unsigned char *)a3 + 245)) {
                            goto LABEL_42;
                          }
                        }
                        else if (*((unsigned char *)a3 + 245))
                        {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 248) & 0x40) != 0)
                      {
                        goto LABEL_42;
                      }
                      issueDescriptiouint64_t n = self->_issueDescription;
                      if ((unint64_t)issueDescription | *((void *)a3 + 19))
                      {
                        int v5 = -[NSString isEqual:](issueDescription, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      layeredCover = self->_layeredCover;
                      if ((unint64_t)layeredCover | *((void *)a3 + 20))
                      {
                        int v5 = -[NSString isEqual:](layeredCover, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      if ((*(unsigned char *)&self->_has & 4) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 4) == 0 || self->_layeredCoverAspectRatio != *((double *)a3 + 3)) {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 248) & 4) != 0)
                      {
                        goto LABEL_42;
                      }
                      layeredCoverPrimaryColor = self->_layeredCoverPrimaryColor;
                      if ((unint64_t)layeredCoverPrimaryColor | *((void *)a3 + 21))
                      {
                        int v5 = -[NSString isEqual:](layeredCoverPrimaryColor, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      metadataURL = self->_metadataURL;
                      if ((unint64_t)metadataURL | *((void *)a3 + 22))
                      {
                        int v5 = -[NSString isEqual:](metadataURL, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      notificationDescriptiouint64_t n = self->_notificationDescription;
                      if ((unint64_t)notificationDescription | *((void *)a3 + 23))
                      {
                        int v5 = -[NSString isEqual:](notificationDescription, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      publishDate = self->_publishDate;
                      if ((unint64_t)publishDate | *((void *)a3 + 25))
                      {
                        int v5 = -[NTPBDate isEqual:](publishDate, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      scores = self->_scores;
                      if ((unint64_t)scores | *((void *)a3 + 26))
                      {
                        int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores isEqual:](scores, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      title = self->_title;
                      if ((unint64_t)title | *((void *)a3 + 28))
                      {
                        int v5 = -[NSString isEqual:](title, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      topicTagIDs = self->_topicTagIDs;
                      if ((unint64_t)topicTagIDs | *((void *)a3 + 29))
                      {
                        int v5 = -[NSMutableArray isEqual:](topicTagIDs, "isEqual:");
                        if (!v5) {
                          return v5;
                        }
                      }
                      if ((*(unsigned char *)&self->_has & 0x10) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 0x10) == 0 || self->_type != *((_DWORD *)a3 + 60)) {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((unsigned char *)a3 + 248) & 0x10) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(unsigned char *)&self->_has & 8) != 0)
                      {
                        if ((*((unsigned char *)a3 + 248) & 8) == 0 || self->_minimumNewsVersion != *((void *)a3 + 4)) {
                          goto LABEL_42;
                        }
                        goto LABEL_81;
                      }
                      if ((*((unsigned char *)a3 + 248) & 8) == 0)
                      {
LABEL_81:
                        pdfResourceArchiveURL = self->_pdfResourceArchiveURL;
                        if (!((unint64_t)pdfResourceArchiveURL | *((void *)a3 + 24))
                          || (int v5 = -[NSString isEqual:](pdfResourceArchiveURL, "isEqual:")) != 0)
                        {
                          bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
                          if (!((unint64_t)bundleFeaturedArticleIDs | *((void *)a3 + 9))
                            || (int v5 = -[NSMutableArray isEqual:](bundleFeaturedArticleIDs, "isEqual:")) != 0)
                          {
                            conversionStats = self->_conversionStats;
                            if (!((unint64_t)conversionStats | *((void *)a3 + 11))
                              || (int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats isEqual:](conversionStats, "isEqual:")) != 0)
                            {
                              coverBackgroundColor = self->_coverBackgroundColor;
                              if (!((unint64_t)coverBackgroundColor | *((void *)a3 + 14))
                                || (int v5 = -[NSString isEqual:](coverBackgroundColor, "isEqual:")) != 0)
                              {
                                coverTextColor = self->_coverTextColor;
                                if (!((unint64_t)coverTextColor | *((void *)a3 + 17))
                                  || (int v5 = -[NSString isEqual:](coverTextColor, "isEqual:")) != 0)
                                {
                                  coverAccentColor = self->_coverAccentColor;
                                  if (!((unint64_t)coverAccentColor | *((void *)a3 + 12))
                                    || (int v5 = -[NSString isEqual:](coverAccentColor, "isEqual:")) != 0)
                                  {
                                    sortDate = self->_sortDate;
                                    if ((unint64_t)sortDate | *((void *)a3 + 27))
                                    {
                                      LOBYTE(v5) = -[NTPBDate isEqual:](sortDate, "isEqual:");
                                    }
                                    else
                                    {
                                      LOBYTE(v5) = 1;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        return v5;
                      }
LABEL_42:
                      LOBYTE(v5) = 0;
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
  unint64_t v51 = [(NTPBRecordBase *)self->_base hash];
  uint64_t v50 = [(NSMutableArray *)self->_allArticleIDs hash];
  uint64_t v49 = [(NSMutableArray *)self->_allowedStorefrontIDs hash];
  uint64_t v48 = [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  NSUInteger v47 = [(NSString *)self->_channelTagID hash];
  NSUInteger v46 = [(NSString *)self->_coverArticleID hash];
  if (*(unsigned char *)&self->_has)
  {
    double coverAspectRatio = self->_coverAspectRatio;
    double v4 = -coverAspectRatio;
    if (coverAspectRatio >= 0.0) {
      double v4 = self->_coverAspectRatio;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v45 = v10;
  }
  else
  {
    unint64_t v45 = 0;
  }
  NSUInteger v44 = [(NSString *)self->_coverImageURL hash];
  NSUInteger v43 = [(NSString *)self->_coverPrimaryColor hash];
  NSUInteger v42 = [(NSString *)self->_edition hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v41 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v40 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  unint64_t v41 = 2654435761u * self->_halfLifeMilliseconds;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v40 = 2654435761 * self->_isDraft;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v39 = 2654435761 * self->_isPaid;
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v39 = 0;
LABEL_17:
  NSUInteger v38 = [(NSString *)self->_issueDescription hash];
  NSUInteger v37 = [(NSString *)self->_layeredCover hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double layeredCoverAspectRatio = self->_layeredCoverAspectRatio;
    double v13 = -layeredCoverAspectRatio;
    if (layeredCoverAspectRatio >= 0.0) {
      double v13 = self->_layeredCoverAspectRatio;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    double v16 = fmod(v14, 1.84467441e19);
    unint64_t v17 = 2654435761u * (unint64_t)v16;
    unint64_t v18 = v17 + (unint64_t)v15;
    if (v15 <= 0.0) {
      unint64_t v18 = 2654435761u * (unint64_t)v16;
    }
    unint64_t v19 = v17 - (unint64_t)fabs(v15);
    if (v15 < 0.0) {
      unint64_t v11 = v19;
    }
    else {
      unint64_t v11 = v18;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_layeredCoverPrimaryColor hash];
  NSUInteger v21 = [(NSString *)self->_metadataURL hash];
  NSUInteger v22 = [(NSString *)self->_notificationDescription hash];
  unint64_t v23 = [(NTPBDate *)self->_publishDate hash];
  unint64_t v24 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *)self->_scores hash];
  NSUInteger v25 = [(NSString *)self->_title hash];
  uint64_t v26 = [(NSMutableArray *)self->_topicTagIDs hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v27 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_28;
    }
LABEL_30:
    uint64_t v28 = 0;
    goto LABEL_31;
  }
  uint64_t v27 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_30;
  }
LABEL_28:
  uint64_t v28 = 2654435761 * self->_minimumNewsVersion;
LABEL_31:
  unint64_t v29 = v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  NSUInteger v30 = v27 ^ v28 ^ [(NSString *)self->_pdfResourceArchiveURL hash];
  uint64_t v31 = v30 ^ [(NSMutableArray *)self->_bundleFeaturedArticleIDs hash];
  unint64_t v32 = v31 ^ [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *)self->_conversionStats hash];
  NSUInteger v33 = v32 ^ [(NSString *)self->_coverBackgroundColor hash];
  NSUInteger v34 = v33 ^ [(NSString *)self->_coverTextColor hash];
  NSUInteger v35 = v29 ^ v34 ^ [(NSString *)self->_coverAccentColor hash];
  return v35 ^ [(NTPBDate *)self->_sortDate hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 7);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBIssueRecord setBase:](self, "setBase:");
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  double v7 = (void *)*((void *)a3 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBIssueRecord *)self addAllArticleIDs:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v9);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 6);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBIssueRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v14);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  unint64_t v17 = (void *)*((void *)a3 + 8);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBIssueRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v50 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v19);
  }
  if (*((void *)a3 + 10)) {
    -[NTPBIssueRecord setChannelTagID:](self, "setChannelTagID:");
  }
  if (*((void *)a3 + 13)) {
    -[NTPBIssueRecord setCoverArticleID:](self, "setCoverArticleID:");
  }
  if (*((unsigned char *)a3 + 248))
  {
    self->_double coverAspectRatio = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 15)) {
    -[NTPBIssueRecord setCoverImageURL:](self, "setCoverImageURL:");
  }
  if (*((void *)a3 + 16)) {
    -[NTPBIssueRecord setCoverPrimaryColor:](self, "setCoverPrimaryColor:");
  }
  if (*((void *)a3 + 18)) {
    -[NTPBIssueRecord setEdition:](self, "setEdition:");
  }
  char v22 = *((unsigned char *)a3 + 248);
  if ((v22 & 2) != 0)
  {
    self->_halfLifeMilliseconds = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v22 = *((unsigned char *)a3 + 248);
    if ((v22 & 0x20) == 0)
    {
LABEL_41:
      if ((v22 & 0x40) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 248) & 0x20) == 0)
  {
    goto LABEL_41;
  }
  self->_isDraft = *((unsigned char *)a3 + 244);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 248) & 0x40) != 0)
  {
LABEL_42:
    self->_isPaid = *((unsigned char *)a3 + 245);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_43:
  if (*((void *)a3 + 19)) {
    -[NTPBIssueRecord setIssueDescription:](self, "setIssueDescription:");
  }
  if (*((void *)a3 + 20)) {
    -[NTPBIssueRecord setLayeredCover:](self, "setLayeredCover:");
  }
  if ((*((unsigned char *)a3 + 248) & 4) != 0)
  {
    self->_double layeredCoverAspectRatio = *((double *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 21)) {
    -[NTPBIssueRecord setLayeredCoverPrimaryColor:](self, "setLayeredCoverPrimaryColor:");
  }
  if (*((void *)a3 + 22)) {
    -[NTPBIssueRecord setMetadataURL:](self, "setMetadataURL:");
  }
  if (*((void *)a3 + 23)) {
    -[NTPBIssueRecord setNotificationDescription:](self, "setNotificationDescription:");
  }
  publishDate = self->_publishDate;
  uint64_t v24 = *((void *)a3 + 25);
  if (publishDate)
  {
    if (v24) {
      -[NTPBDate mergeFrom:](publishDate, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBIssueRecord setPublishDate:](self, "setPublishDate:");
  }
  scores = self->_scores;
  uint64_t v26 = *((void *)a3 + 26);
  if (scores)
  {
    if (v26) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores mergeFrom:](scores, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBIssueRecord setScores:](self, "setScores:");
  }
  if (*((void *)a3 + 28)) {
    -[NTPBIssueRecord setTitle:](self, "setTitle:");
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v27 = (void *)*((void *)a3 + 29);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(v27);
        }
        [(NTPBIssueRecord *)self addTopicTagIDs:*(void *)(*((void *)&v46 + 1) + 8 * m)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v29);
  }
  char v32 = *((unsigned char *)a3 + 248);
  if ((v32 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)a3 + 60);
    *(unsigned char *)&self->_has |= 0x10u;
    char v32 = *((unsigned char *)a3 + 248);
  }
  if ((v32 & 8) != 0)
  {
    self->_minimumNewsVersiouint64_t n = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 24)) {
    -[NTPBIssueRecord setPdfResourceArchiveURL:](self, "setPdfResourceArchiveURL:");
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  NSUInteger v33 = (void *)*((void *)a3 + 9);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v42 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v33);
        }
        [(NTPBIssueRecord *)self addBundleFeaturedArticleIDs:*(void *)(*((void *)&v42 + 1) + 8 * n)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v62 count:16];
    }
    while (v35);
  }
  conversionStats = self->_conversionStats;
  uint64_t v39 = *((void *)a3 + 11);
  if (conversionStats)
  {
    if (v39) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats mergeFrom:](conversionStats, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[NTPBIssueRecord setConversionStats:](self, "setConversionStats:");
  }
  if (*((void *)a3 + 14)) {
    -[NTPBIssueRecord setCoverBackgroundColor:](self, "setCoverBackgroundColor:");
  }
  if (*((void *)a3 + 17)) {
    -[NTPBIssueRecord setCoverTextColor:](self, "setCoverTextColor:");
  }
  if (*((void *)a3 + 12)) {
    -[NTPBIssueRecord setCoverAccentColor:](self, "setCoverAccentColor:");
  }
  sortDate = self->_sortDate;
  uint64_t v41 = *((void *)a3 + 27);
  if (sortDate)
  {
    if (v41) {
      -[NTPBDate mergeFrom:](sortDate, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[NTPBIssueRecord setSortDate:](self, "setSortDate:");
  }
}

- (void)setBase:(id)a3
{
}

- (void)setAllArticleIDs:(id)a3
{
}

- (void)setAllowedStorefrontIDs:(id)a3
{
}

- (void)setBlockedStorefrontIDs:(id)a3
{
}

- (void)setChannelTagID:(id)a3
{
}

- (void)setCoverArticleID:(id)a3
{
}

- (void)setCoverImageURL:(id)a3
{
}

- (void)setCoverPrimaryColor:(id)a3
{
}

- (void)setEdition:(id)a3
{
}

- (unint64_t)halfLifeMilliseconds
{
  return self->_halfLifeMilliseconds;
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (void)setIssueDescription:(id)a3
{
}

- (void)setLayeredCover:(id)a3
{
}

- (void)setLayeredCoverPrimaryColor:(id)a3
{
}

- (void)setMetadataURL:(id)a3
{
}

- (void)setNotificationDescription:(id)a3
{
}

- (void)setPublishDate:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setTopicTagIDs:(id)a3
{
}

- (NSString)pdfResourceArchiveURL
{
  return self->_pdfResourceArchiveURL;
}

- (void)setPdfResourceArchiveURL:(id)a3
{
}

- (NSMutableArray)bundleFeaturedArticleIDs
{
  return self->_bundleFeaturedArticleIDs;
}

- (void)setBundleFeaturedArticleIDs:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats)conversionStats
{
  return self->_conversionStats;
}

- (void)setConversionStats:(id)a3
{
}

- (void)setCoverBackgroundColor:(id)a3
{
}

- (void)setCoverTextColor:(id)a3
{
}

- (void)setCoverAccentColor:(id)a3
{
}

- (void)setSortDate:(id)a3
{
}

@end