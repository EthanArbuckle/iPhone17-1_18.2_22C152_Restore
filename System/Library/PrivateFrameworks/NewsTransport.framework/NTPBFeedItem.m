@interface NTPBFeedItem
+ (Class)surfacedByArticleListID2Type;
+ (Class)topicIDsType;
+ (Class)topicsType;
- (BOOL)hasArticleID;
- (BOOL)hasAudioTrack;
- (BOOL)hasBodyTextLength;
- (BOOL)hasChannelConversionStats;
- (BOOL)hasChannelTagMetadata;
- (BOOL)hasClusterID;
- (BOOL)hasConditionalScore;
- (BOOL)hasContentType;
- (BOOL)hasExpirationData;
- (BOOL)hasFeedHalfLifeMilliseconds;
- (BOOL)hasFeedID;
- (BOOL)hasFloat16FullBodyEncoding;
- (BOOL)hasFloat16TitleEncoding;
- (BOOL)hasGlobalCohorts;
- (BOOL)hasGlobalConversionStats;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasHasAudioTrack;
- (BOOL)hasHasThumbnail;
- (BOOL)hasHasVideo;
- (BOOL)hasHasVideoStillImage;
- (BOOL)hasIsAIGenerated;
- (BOOL)hasIsBundlePaid;
- (BOOL)hasIsCoread;
- (BOOL)hasIsEvergreen;
- (BOOL)hasIsExplicitContent;
- (BOOL)hasIsFeatureCandidate;
- (BOOL)hasIsFeatured;
- (BOOL)hasIsFromBlockedStorefront;
- (BOOL)hasIsHiddenFromAutoFavorites;
- (BOOL)hasIsIssueOnly;
- (BOOL)hasIsPaid;
- (BOOL)hasIsSponsored;
- (BOOL)hasLanguage;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasOrder;
- (BOOL)hasParentIssueID;
- (BOOL)hasPublishDateMilliseconds;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasReduceVisibility;
- (BOOL)hasReduceVisibilityForNonFollowers;
- (BOOL)hasScoreProfiles;
- (BOOL)hasSourceChannelCohorts;
- (BOOL)hasSourceChannelID;
- (BOOL)hasThumbnail;
- (BOOL)hasThumbnailPerceptualHash;
- (BOOL)hasVideo;
- (BOOL)hasVideoStillImage;
- (BOOL)hasWebConverted;
- (BOOL)isAIGenerated;
- (BOOL)isBundlePaid;
- (BOOL)isCoread;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEvergreen;
- (BOOL)isExplicitContent;
- (BOOL)isFeatureCandidate;
- (BOOL)isFeatured;
- (BOOL)isFromBlockedStorefront;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isIssueOnly;
- (BOOL)isPaid;
- (BOOL)isSponsored;
- (BOOL)readFrom:(id)a3;
- (BOOL)reduceVisibility;
- (BOOL)reduceVisibilityForNonFollowers;
- (BOOL)webConverted;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata;
- (NSData)float16FullBodyEncoding;
- (NSData)float16TitleEncoding;
- (NSData)thumbnailPerceptualHash;
- (NSMutableArray)surfacedByArticleListID2s;
- (NSMutableArray)topicIDs;
- (NSMutableArray)topics;
- (NSString)articleID;
- (NSString)clusterID;
- (NSString)feedID;
- (NSString)language;
- (NSString)parentIssueID;
- (NSString)sourceChannelID;
- (NTPBScoreProfiles)scoreProfiles;
- (double)conditionalScore;
- (double)globalUserFeedback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)surfacedByArticleListID2AtIndex:(unint64_t)a3;
- (id)topicIDsAtIndex:(unint64_t)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (int64_t)bodyTextLength;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)contentType;
- (unint64_t)feedHalfLifeMilliseconds;
- (unint64_t)hash;
- (unint64_t)order;
- (unint64_t)publishDateMilliseconds;
- (unint64_t)surfacedByArticleListID2sCount;
- (unint64_t)topicIDsCount;
- (unint64_t)topicsCount;
- (void)addSurfacedByArticleListID2:(id)a3;
- (void)addTopicIDs:(id)a3;
- (void)addTopics:(id)a3;
- (void)clearSurfacedByArticleListID2s;
- (void)clearTopicIDs;
- (void)clearTopics;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setBodyTextLength:(int64_t)a3;
- (void)setChannelConversionStats:(id)a3;
- (void)setChannelTagMetadata:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setConditionalScore:(double)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setExpirationData:(id)a3;
- (void)setFeedHalfLifeMilliseconds:(unint64_t)a3;
- (void)setFeedID:(id)a3;
- (void)setFloat16FullBodyEncoding:(id)a3;
- (void)setFloat16TitleEncoding:(id)a3;
- (void)setGlobalCohorts:(id)a3;
- (void)setGlobalConversionStats:(id)a3;
- (void)setGlobalUserFeedback:(double)a3;
- (void)setHasAudioTrack:(BOOL)a3;
- (void)setHasBodyTextLength:(BOOL)a3;
- (void)setHasConditionalScore:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasFeedHalfLifeMilliseconds:(BOOL)a3;
- (void)setHasGlobalUserFeedback:(BOOL)a3;
- (void)setHasHasAudioTrack:(BOOL)a3;
- (void)setHasHasThumbnail:(BOOL)a3;
- (void)setHasHasVideo:(BOOL)a3;
- (void)setHasHasVideoStillImage:(BOOL)a3;
- (void)setHasIsAIGenerated:(BOOL)a3;
- (void)setHasIsBundlePaid:(BOOL)a3;
- (void)setHasIsCoread:(BOOL)a3;
- (void)setHasIsEvergreen:(BOOL)a3;
- (void)setHasIsExplicitContent:(BOOL)a3;
- (void)setHasIsFeatureCandidate:(BOOL)a3;
- (void)setHasIsFeatured:(BOOL)a3;
- (void)setHasIsFromBlockedStorefront:(BOOL)a3;
- (void)setHasIsHiddenFromAutoFavorites:(BOOL)a3;
- (void)setHasIsIssueOnly:(BOOL)a3;
- (void)setHasIsPaid:(BOOL)a3;
- (void)setHasIsSponsored:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setHasOrder:(BOOL)a3;
- (void)setHasPublishDateMilliseconds:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasReduceVisibility:(BOOL)a3;
- (void)setHasReduceVisibilityForNonFollowers:(BOOL)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setHasVideoStillImage:(BOOL)a3;
- (void)setHasWebConverted:(BOOL)a3;
- (void)setIsAIGenerated:(BOOL)a3;
- (void)setIsBundlePaid:(BOOL)a3;
- (void)setIsCoread:(BOOL)a3;
- (void)setIsEvergreen:(BOOL)a3;
- (void)setIsExplicitContent:(BOOL)a3;
- (void)setIsFeatureCandidate:(BOOL)a3;
- (void)setIsFeatured:(BOOL)a3;
- (void)setIsFromBlockedStorefront:(BOOL)a3;
- (void)setIsHiddenFromAutoFavorites:(BOOL)a3;
- (void)setIsIssueOnly:(BOOL)a3;
- (void)setIsPaid:(BOOL)a3;
- (void)setIsSponsored:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setParentIssueID:(id)a3;
- (void)setPublishDateMilliseconds:(unint64_t)a3;
- (void)setPublisherArticleVersion:(int64_t)a3;
- (void)setReduceVisibility:(BOOL)a3;
- (void)setReduceVisibilityForNonFollowers:(BOOL)a3;
- (void)setScoreProfiles:(id)a3;
- (void)setSourceChannelCohorts:(id)a3;
- (void)setSourceChannelID:(id)a3;
- (void)setSurfacedByArticleListID2s:(id)a3;
- (void)setThumbnailPerceptualHash:(id)a3;
- (void)setTopicIDs:(id)a3;
- (void)setTopics:(id)a3;
- (void)setWebConverted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedItem

- (void)dealloc
{
  [(NTPBFeedItem *)self setFeedID:0];
  [(NTPBFeedItem *)self setArticleID:0];
  [(NTPBFeedItem *)self setClusterID:0];
  [(NTPBFeedItem *)self setSourceChannelID:0];
  [(NTPBFeedItem *)self setTopicIDs:0];
  [(NTPBFeedItem *)self setParentIssueID:0];
  [(NTPBFeedItem *)self setLanguage:0];
  [(NTPBFeedItem *)self setSourceChannelCohorts:0];
  [(NTPBFeedItem *)self setGlobalCohorts:0];
  [(NTPBFeedItem *)self setChannelConversionStats:0];
  [(NTPBFeedItem *)self setGlobalConversionStats:0];
  [(NTPBFeedItem *)self setChannelTagMetadata:0];
  [(NTPBFeedItem *)self setTopics:0];
  [(NTPBFeedItem *)self setExpirationData:0];
  [(NTPBFeedItem *)self setFloat16TitleEncoding:0];
  [(NTPBFeedItem *)self setFloat16FullBodyEncoding:0];
  [(NTPBFeedItem *)self setThumbnailPerceptualHash:0];
  [(NTPBFeedItem *)self setSurfacedByArticleListID2s:0];
  [(NTPBFeedItem *)self setScoreProfiles:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItem;
  [(NTPBFeedItem *)&v3 dealloc];
}

- (BOOL)hasFeedID
{
  return self->_feedID != 0;
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (void)setOrder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasOrder
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPublishDateMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_publishDateMilliseconds = a3;
}

- (void)setHasPublishDateMilliseconds:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPublishDateMilliseconds
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setFeedHalfLifeMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_feedHalfLifeMilliseconds = a3;
}

- (void)setHasFeedHalfLifeMilliseconds:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFeedHalfLifeMilliseconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setGlobalUserFeedback:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_globalUserFeedback = a3;
}

- (void)setHasGlobalUserFeedback:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGlobalUserFeedback
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasSourceChannelID
{
  return self->_sourceChannelID != 0;
}

- (void)setHasThumbnail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hasThumbnail = a3;
}

- (void)setHasHasThumbnail:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHasThumbnail
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsFromBlockedStorefront:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isFromBlockedStorefront = a3;
}

- (void)setHasIsFromBlockedStorefront:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsFromBlockedStorefront
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsExplicitContent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isExplicitContent = a3;
}

- (void)setHasIsExplicitContent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setContentType:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasContentType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearTopicIDs
{
}

- (void)addTopicIDs:(id)a3
{
  topicIDs = self->_topicIDs;
  if (!topicIDs)
  {
    topicIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_topicIDs = topicIDs;
  }

  [(NSMutableArray *)topicIDs addObject:a3];
}

- (unint64_t)topicIDsCount
{
  return [(NSMutableArray *)self->_topicIDs count];
}

- (id)topicIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIDs objectAtIndex:a3];
}

+ (Class)topicIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIsPaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsPaid
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hasVideo = a3;
}

- (void)setHasHasVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHasVideo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setIsHiddenFromAutoFavorites:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isHiddenFromAutoFavorites = a3;
}

- (void)setHasIsHiddenFromAutoFavorites:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsHiddenFromAutoFavorites
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasParentIssueID
{
  return self->_parentIssueID != 0;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isBundlePaid = a3;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsBundlePaid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBodyTextLength:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_bodyTextLength = a3;
}

- (void)setHasBodyTextLength:(BOOL)a3
{
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBodyTextLength
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsFeatured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isFeatured = a3;
}

- (void)setHasIsFeatured:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsFeatured
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAudioTrack:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hasAudioTrack = a3;
}

- (void)setHasHasAudioTrack:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHasAudioTrack
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsFeatureCandidate:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isFeatureCandidate = a3;
}

- (void)setHasIsFeatureCandidate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsFeatureCandidate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setReduceVisibility:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_reduceVisibility = a3;
}

- (void)setHasReduceVisibility:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasReduceVisibility
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsIssueOnly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isIssueOnly = a3;
}

- (void)setHasIsIssueOnly:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsIssueOnly
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsEvergreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isEvergreen = a3;
}

- (void)setHasIsEvergreen:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsEvergreen
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (BOOL)hasChannelTagMetadata
{
  return self->_channelTagMetadata != 0;
}

- (void)clearTopics
{
}

- (void)addTopics:(id)a3
{
  topics = self->_topics;
  if (!topics)
  {
    topics = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_topics = topics;
  }

  [(NSMutableArray *)topics addObject:a3];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasExpirationData
{
  return self->_expirationData != 0;
}

- (BOOL)hasFloat16TitleEncoding
{
  return self->_float16TitleEncoding != 0;
}

- (BOOL)hasFloat16FullBodyEncoding
{
  return self->_float16FullBodyEncoding != 0;
}

- (BOOL)hasThumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash != 0;
}

- (void)setIsSponsored:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isSponsored = a3;
}

- (void)setHasIsSponsored:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsSponsored
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasVideoStillImage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasVideoStillImage = a3;
}

- (void)setHasHasVideoStillImage:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHasVideoStillImage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setWebConverted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_webConverted = a3;
}

- (void)setHasWebConverted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasWebConverted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setReduceVisibilityForNonFollowers:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_reduceVisibilityForNonFollowers = a3;
}

- (void)setHasReduceVisibilityForNonFollowers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasReduceVisibilityForNonFollowers
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)clearSurfacedByArticleListID2s
{
}

- (void)addSurfacedByArticleListID2:(id)a3
{
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  if (!surfacedByArticleListID2s)
  {
    surfacedByArticleListID2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_surfacedByArticleListID2s = surfacedByArticleListID2s;
  }

  [(NSMutableArray *)surfacedByArticleListID2s addObject:a3];
}

- (unint64_t)surfacedByArticleListID2sCount
{
  return [(NSMutableArray *)self->_surfacedByArticleListID2s count];
}

- (id)surfacedByArticleListID2AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_surfacedByArticleListID2s objectAtIndex:a3];
}

+ (Class)surfacedByArticleListID2Type
{
  return (Class)objc_opt_class();
}

- (void)setConditionalScore:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_conditionalScore = a3;
}

- (void)setHasConditionalScore:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConditionalScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAIGenerated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isAIGenerated = a3;
}

- (void)setHasIsAIGenerated:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsAIGenerated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsCoread:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isCoread = a3;
}

- (void)setHasIsCoread:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsCoread
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasScoreProfiles
{
  return self->_scoreProfiles != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBFeedItem description](&v3, sel_description), -[NTPBFeedItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  feedID = self->_feedID;
  if (feedID) {
    [v3 setObject:feedID forKey:@"feed_ID"];
  }
  articleID = self->_articleID;
  if (articleID) {
    [v4 setObject:articleID forKey:@"article_ID"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_order), @"order");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_83;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_publishDateMilliseconds), @"publish_date_milliseconds");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_83:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_feedHalfLifeMilliseconds), @"feed_half_life_milliseconds");
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_globalUserFeedback), @"global_user_feedback");
LABEL_10:
  clusterID = self->_clusterID;
  if (clusterID) {
    [v4 setObject:clusterID forKey:@"cluster_ID"];
  }
  sourceChannelID = self->_sourceChannelID;
  if (sourceChannelID) {
    [v4 setObject:sourceChannelID forKey:@"source_channel_ID"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasThumbnail), @"has_thumbnail");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v10 & 0x20000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFromBlockedStorefront), @"is_from_blocked_storefront");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isExplicitContent), @"is_explicit_content");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_88:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_19:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_contentType), @"content_type");
LABEL_20:
  topicIDs = self->_topicIDs;
  if (topicIDs) {
    [v4 setObject:topicIDs forKey:@"topic_IDs"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaid), @"is_paid");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x800) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v12 & 0x100) == 0) {
        goto LABEL_25;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_WORD *)&v12 & 0x800) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasVideo), @"has_video");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v12 & 0x200000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_92:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_publisherArticleVersion), @"publisher_article_version");
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_26:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isHiddenFromAutoFavorites), @"is_hidden_from_auto_favorites");
LABEL_27:
  parentIssueID = self->_parentIssueID;
  if (parentIssueID) {
    [v4 setObject:parentIssueID forKey:@"parent_issue_ID"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isBundlePaid), @"is_bundle_paid");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 1) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v14 & 0x80000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_96;
    }
  }
  else if ((*(unsigned char *)&v14 & 1) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_bodyTextLength), @"body_text_length");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x200) == 0) {
      goto LABEL_33;
    }
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFeatured), @"is_featured");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v14 & 0x40000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasAudioTrack), @"has_audio_track");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFeatureCandidate), @"is_feature_candidate");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v14 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_reduceVisibility), @"reduce_visibility");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_100:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isIssueOnly), @"is_issue_only");
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_37:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isEvergreen), @"is_evergreen");
LABEL_38:
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](sourceChannelCohorts, "dictionaryRepresentation"), @"source_channel_cohorts");
  }
  globalCohorts = self->_globalCohorts;
  if (globalCohorts) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation"), @"global_cohorts");
  }
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](channelConversionStats, "dictionaryRepresentation"), @"channel_conversion_stats");
  }
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation"), @"global_conversion_stats");
  }
  channelTagMetadata = self->_channelTagMetadata;
  if (channelTagMetadata) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata dictionaryRepresentation](channelTagMetadata, "dictionaryRepresentation"), @"channel_tag_metadata");
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    topics = self->_topics;
    uint64_t v23 = [(NSMutableArray *)topics countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(topics);
          }
          objc_msgSend(v21, "addObject:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v24 = [(NSMutableArray *)topics countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v24);
    }
    [v4 setObject:v21 forKey:@"topics"];
  }
  expirationData = self->_expirationData;
  if (expirationData) {
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration dictionaryRepresentation](expirationData, "dictionaryRepresentation"), @"expiration_data");
  }
  float16TitleEncoding = self->_float16TitleEncoding;
  if (float16TitleEncoding) {
    [v4 setObject:float16TitleEncoding forKey:@"float16_title_encoding"];
  }
  float16FullBodyEncoding = self->_float16FullBodyEncoding;
  if (float16FullBodyEncoding) {
    [v4 setObject:float16FullBodyEncoding forKey:@"float16_full_body_encoding"];
  }
  thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
  if (thumbnailPerceptualHash) {
    [v4 setObject:thumbnailPerceptualHash forKey:@"thumbnail_perceptual_hash"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x1000000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isSponsored), @"is_sponsored");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x1000) == 0)
    {
LABEL_69:
      if ((*(_DWORD *)&v31 & 0x8000000) == 0) {
        goto LABEL_70;
      }
      goto LABEL_104;
    }
  }
  else if ((*(_WORD *)&v31 & 0x1000) == 0)
  {
    goto LABEL_69;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasVideoStillImage), @"has_video_still_image");
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x8000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v31 & 0x4000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
LABEL_104:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_webConverted), @"web_converted");
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0) {
LABEL_71:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_reduceVisibilityForNonFollowers), @"reduce_visibility_for_non_followers");
LABEL_72:
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  if (surfacedByArticleListID2s) {
    [v4 setObject:surfacedByArticleListID2s forKey:@"surfaced_by_article_list_ID_2"];
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v33 = self->_has;
  if ((*(unsigned char *)&v33 & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_conditionalScore), @"conditional_score");
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v33 = self->_has;
    if ((*(_WORD *)&v33 & 0x2000) == 0)
    {
LABEL_76:
      if ((*(_WORD *)&v33 & 0x8000) == 0) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
    goto LABEL_76;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isAIGenerated), @"is_AI_generated");
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_77:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isCoread), @"is_coread");
LABEL_78:
  scoreProfiles = self->_scoreProfiles;
  if (scoreProfiles) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBScoreProfiles dictionaryRepresentation](scoreProfiles, "dictionaryRepresentation"), @"score_profiles");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedItemReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (self->_feedID) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_91;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteDoubleField();
LABEL_10:
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelID) {
    PBDataWriterWriteStringField();
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v5 & 0x20000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_95;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint64Field();
LABEL_20:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  topicIDs = self->_topicIDs;
  uint64_t v7 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(topicIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x800) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&v11 & 0x100) == 0) {
        goto LABEL_30;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_WORD *)&v11 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v11 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_100:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_31:
  }
    PBDataWriterWriteBOOLField();
LABEL_32:
  if (self->_parentIssueID) {
    PBDataWriterWriteStringField();
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 1) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v12 & 0x80000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_104;
    }
  }
  else if ((*(unsigned char *)&v12 & 1) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt64Field();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v12 & 0x200) == 0) {
      goto LABEL_38;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x40000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v12 & 0x2000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v12 & 0x400000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v12 & 0x10000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_42:
  }
    PBDataWriterWriteBOOLField();
LABEL_43:
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  topics = self->_topics;
  uint64_t v14 = [(NSMutableArray *)topics countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(topics);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = [(NSMutableArray *)topics countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }
  if (self->_expirationData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_float16TitleEncoding) {
    PBDataWriterWriteDataField();
  }
  if (self->_float16FullBodyEncoding) {
    PBDataWriterWriteDataField();
  }
  if (self->_thumbnailPerceptualHash) {
    PBDataWriterWriteDataField();
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x1000) == 0)
    {
LABEL_72:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_112;
    }
  }
  else if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteBOOLField();
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v18 & 0x4000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0) {
LABEL_74:
  }
    PBDataWriterWriteBOOLField();
LABEL_75:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  uint64_t v20 = [(NSMutableArray *)surfacedByArticleListID2s countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(surfacedByArticleListID2s);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v21 = [(NSMutableArray *)surfacedByArticleListID2s countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v24 = self->_has;
    if ((*(_WORD *)&v24 & 0x2000) == 0)
    {
LABEL_84:
      if ((*(_WORD *)&v24 & 0x8000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_85;
    }
  }
  else if ((*(_WORD *)&v24 & 0x2000) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_85:
  }
    PBDataWriterWriteBOOLField();
LABEL_86:
  if (self->_scoreProfiles) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 120) = [(NSString *)self->_feedID copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSString *)self->_articleID copyWithZone:a3];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_order;
    *(_DWORD *)(v5 + 252) |= 0x40u;
    $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 64) = self->_publishDateMilliseconds;
  *(_DWORD *)(v5 + 252) |= 0x80u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_59:
  *(void *)(v5 + 32) = self->_feedHalfLifeMilliseconds;
  *(_DWORD *)(v5 + 252) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(double *)(v5 + 40) = self->_globalUserFeedback;
    *(_DWORD *)(v5 + 252) |= 0x10u;
  }
LABEL_6:

  *(void *)(v5 + 104) = [(NSString *)self->_clusterID copyWithZone:a3];
  *(void *)(v5 + 192) = [(NSString *)self->_sourceChannelID copyWithZone:a3];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 233) = self->_hasThumbnail;
    *(_DWORD *)(v5 + 252) |= 0x400u;
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&v7 & 0x20000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_63;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
    goto LABEL_8;
  }
  *(unsigned char *)(v5 + 243) = self->_isFromBlockedStorefront;
  *(_DWORD *)(v5 + 252) |= 0x100000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v5 + 240) = self->_isExplicitContent;
  *(_DWORD *)(v5 + 252) |= 0x20000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_64:
  *(void *)(v5 + 48) = self->_minimumNewsVersion;
  *(_DWORD *)(v5 + 252) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *(void *)(v5 + 24) = self->_contentType;
    *(_DWORD *)(v5 + 252) |= 4u;
  }
LABEL_12:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  topicIDs = self->_topicIDs;
  uint64_t v9 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(topicIDs);
        }
        v13 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTopicIDs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)topicIDs countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v10);
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 246) = self->_isPaid;
    *(_DWORD *)(v5 + 252) |= 0x800000u;
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x800) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x100) == 0) {
        goto LABEL_22;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v14 & 0x800) == 0)
  {
    goto LABEL_21;
  }
  *(unsigned char *)(v5 + 234) = self->_hasVideo;
  *(_DWORD *)(v5 + 252) |= 0x800u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_68:
  *(void *)(v5 + 72) = self->_publisherArticleVersion;
  *(_DWORD *)(v5 + 252) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_23:
    *(unsigned char *)(v5 + 244) = self->_isHiddenFromAutoFavorites;
    *(_DWORD *)(v5 + 252) |= 0x200000u;
  }
LABEL_24:

  *(void *)(v5 + 168) = [(NSString *)self->_parentIssueID copyWithZone:a3];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 237) = self->_isBundlePaid;
    *(_DWORD *)(v5 + 252) |= 0x4000u;
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
    if ((*(unsigned char *)&v15 & 1) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v15 & 0x80000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_72;
    }
  }
  else if ((*(unsigned char *)&v15 & 1) == 0)
  {
    goto LABEL_26;
  }
  *(void *)(v5 + 8) = self->_bodyTextLength;
  *(_DWORD *)(v5 + 252) |= 1u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v15 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(unsigned char *)(v5 + 242) = self->_isFeatured;
  *(_DWORD *)(v5 + 252) |= 0x80000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v15 & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(unsigned char *)(v5 + 232) = self->_hasAudioTrack;
  *(_DWORD *)(v5 + 252) |= 0x200u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v15 & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(unsigned char *)(v5 + 241) = self->_isFeatureCandidate;
  *(_DWORD *)(v5 + 252) |= 0x40000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v15 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(unsigned char *)(v5 + 248) = self->_reduceVisibility;
  *(_DWORD *)(v5 + 252) |= 0x2000000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v15 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_76:
  *(unsigned char *)(v5 + 245) = self->_isIssueOnly;
  *(_DWORD *)(v5 + 252) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_32:
    *(unsigned char *)(v5 + 239) = self->_isEvergreen;
    *(_DWORD *)(v5 + 252) |= 0x10000u;
  }
LABEL_33:

  *(void *)(v5 + 160) = [(NSString *)self->_language copyWithZone:a3];
  *(void *)(v5 + 184) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts copyWithZone:a3];

  *(void *)(v5 + 144) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts copyWithZone:a3];
  *(void *)(v5 + 88) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats copyWithZone:a3];

  *(void *)(v5 + 152) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats copyWithZone:a3];
  *(void *)(v5 + 96) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata copyWithZone:a3];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  topics = self->_topics;
  uint64_t v17 = [(NSMutableArray *)topics countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(topics);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTopics:v21];
      }
      uint64_t v18 = [(NSMutableArray *)topics countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v18);
  }

  *(void *)(v5 + 112) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *)self->_expirationData copyWithZone:a3];
  *(void *)(v5 + 136) = [(NSData *)self->_float16TitleEncoding copyWithZone:a3];

  *(void *)(v5 + 128) = [(NSData *)self->_float16FullBodyEncoding copyWithZone:a3];
  *(void *)(v5 + 208) = [(NSData *)self->_thumbnailPerceptualHash copyWithZone:a3];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) != 0)
  {
    *(unsigned char *)(v5 + 247) = self->_isSponsored;
    *(_DWORD *)(v5 + 252) |= 0x1000000u;
    $6B8E73DA7CC4B9E6BA45EB77898599E8 v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x1000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v22 & 0x8000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_80;
    }
  }
  else if ((*(_WORD *)&v22 & 0x1000) == 0)
  {
    goto LABEL_42;
  }
  *(unsigned char *)(v5 + 235) = self->_hasVideoStillImage;
  *(_DWORD *)(v5 + 252) |= 0x1000u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x8000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v22 & 0x4000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_80:
  *(unsigned char *)(v5 + 250) = self->_webConverted;
  *(_DWORD *)(v5 + 252) |= 0x8000000u;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_44:
    *(unsigned char *)(v5 + 249) = self->_reduceVisibilityForNonFollowers;
    *(_DWORD *)(v5 + 252) |= 0x4000000u;
  }
LABEL_45:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  uint64_t v24 = [(NSMutableArray *)surfacedByArticleListID2s countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(surfacedByArticleListID2s);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSurfacedByArticleListID2:v28];
      }
      uint64_t v25 = [(NSMutableArray *)surfacedByArticleListID2s countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v25);
  }
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 2) == 0)
  {
    if ((*(_WORD *)&v29 & 0x2000) == 0) {
      goto LABEL_54;
    }
LABEL_83:
    *(unsigned char *)(v5 + 236) = self->_isAIGenerated;
    *(_DWORD *)(v5 + 252) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  *(double *)(v5 + 16) = self->_conditionalScore;
  *(_DWORD *)(v5 + 252) |= 2u;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) != 0) {
    goto LABEL_83;
  }
LABEL_54:
  if ((*(_WORD *)&v29 & 0x8000) != 0)
  {
LABEL_55:
    *(unsigned char *)(v5 + 238) = self->_isCoread;
    *(_DWORD *)(v5 + 252) |= 0x8000u;
  }
LABEL_56:

  *(void *)(v5 + 176) = [(NTPBScoreProfiles *)self->_scoreProfiles copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    feedID = self->_feedID;
    if (!((unint64_t)feedID | *((void *)a3 + 15)) || (int v5 = -[NSString isEqual:](feedID, "isEqual:")) != 0)
    {
      articleID = self->_articleID;
      if (!((unint64_t)articleID | *((void *)a3 + 10))
        || (int v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
      {
        $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
        int v9 = *((_DWORD *)a3 + 63);
        if ((*(unsigned char *)&has & 0x40) != 0)
        {
          if ((v9 & 0x40) == 0 || self->_order != *((void *)a3 + 7)) {
            goto LABEL_156;
          }
        }
        else if ((v9 & 0x40) != 0)
        {
          goto LABEL_156;
        }
        if ((*(unsigned char *)&has & 0x80) != 0)
        {
          if ((v9 & 0x80) == 0 || self->_publishDateMilliseconds != *((void *)a3 + 8)) {
            goto LABEL_156;
          }
        }
        else if ((v9 & 0x80) != 0)
        {
          goto LABEL_156;
        }
        if ((*(unsigned char *)&has & 8) != 0)
        {
          if ((v9 & 8) == 0 || self->_feedHalfLifeMilliseconds != *((void *)a3 + 4)) {
            goto LABEL_156;
          }
        }
        else if ((v9 & 8) != 0)
        {
          goto LABEL_156;
        }
        if ((*(unsigned char *)&has & 0x10) != 0)
        {
          if ((v9 & 0x10) == 0 || self->_globalUserFeedback != *((double *)a3 + 5)) {
            goto LABEL_156;
          }
        }
        else if ((v9 & 0x10) != 0)
        {
          goto LABEL_156;
        }
        clusterID = self->_clusterID;
        if (!((unint64_t)clusterID | *((void *)a3 + 13))
          || (int v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
        {
          sourceChannelID = self->_sourceChannelID;
          if (!((unint64_t)sourceChannelID | *((void *)a3 + 24))
            || (int v5 = -[NSString isEqual:](sourceChannelID, "isEqual:")) != 0)
          {
            $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
            int v13 = *((_DWORD *)a3 + 63);
            if ((*(_WORD *)&v12 & 0x400) != 0)
            {
              if ((v13 & 0x400) == 0) {
                goto LABEL_156;
              }
              if (self->_hasThumbnail)
              {
                if (!*((unsigned char *)a3 + 233)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 233))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x400) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x100000) != 0)
            {
              if ((v13 & 0x100000) == 0) {
                goto LABEL_156;
              }
              if (self->_isFromBlockedStorefront)
              {
                if (!*((unsigned char *)a3 + 243)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 243))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x100000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x20000) != 0)
            {
              if ((v13 & 0x20000) == 0) {
                goto LABEL_156;
              }
              if (self->_isExplicitContent)
              {
                if (!*((unsigned char *)a3 + 240)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 240))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x20000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(unsigned char *)&v12 & 0x20) != 0)
            {
              if ((v13 & 0x20) == 0 || self->_minimumNewsVersion != *((void *)a3 + 6)) {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x20) != 0)
            {
              goto LABEL_156;
            }
            if ((*(unsigned char *)&v12 & 4) != 0)
            {
              if ((v13 & 4) == 0 || self->_contentType != *((void *)a3 + 3)) {
                goto LABEL_156;
              }
            }
            else if ((v13 & 4) != 0)
            {
              goto LABEL_156;
            }
            topicIDs = self->_topicIDs;
            if ((unint64_t)topicIDs | *((void *)a3 + 27))
            {
              int v5 = -[NSMutableArray isEqual:](topicIDs, "isEqual:");
              if (!v5) {
                return v5;
              }
              $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
            }
            int v15 = *((_DWORD *)a3 + 63);
            if ((*(_DWORD *)&v12 & 0x800000) != 0)
            {
              if ((v15 & 0x800000) == 0) {
                goto LABEL_156;
              }
              if (self->_isPaid)
              {
                if (!*((unsigned char *)a3 + 246)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 246))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x800000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x800) != 0)
            {
              if ((v15 & 0x800) == 0) {
                goto LABEL_156;
              }
              if (self->_hasVideo)
              {
                if (!*((unsigned char *)a3 + 234)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 234))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x800) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x100) != 0)
            {
              if ((v15 & 0x100) == 0 || self->_publisherArticleVersion != *((void *)a3 + 9)) {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x100) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x200000) != 0)
            {
              if ((v15 & 0x200000) == 0) {
                goto LABEL_156;
              }
              if (self->_isHiddenFromAutoFavorites)
              {
                if (!*((unsigned char *)a3 + 244)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 244))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x200000) != 0)
            {
              goto LABEL_156;
            }
            parentIssueID = self->_parentIssueID;
            if ((unint64_t)parentIssueID | *((void *)a3 + 21))
            {
              int v5 = -[NSString isEqual:](parentIssueID, "isEqual:");
              if (!v5) {
                return v5;
              }
              $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
            }
            int v17 = *((_DWORD *)a3 + 63);
            if ((*(_WORD *)&v12 & 0x4000) != 0)
            {
              if ((v17 & 0x4000) == 0) {
                goto LABEL_156;
              }
              if (self->_isBundlePaid)
              {
                if (!*((unsigned char *)a3 + 237)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 237))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x4000) != 0)
            {
              goto LABEL_156;
            }
            if (*(unsigned char *)&v12)
            {
              if ((v17 & 1) == 0 || self->_bodyTextLength != *((void *)a3 + 1)) {
                goto LABEL_156;
              }
            }
            else if (v17)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x80000) != 0)
            {
              if ((v17 & 0x80000) == 0) {
                goto LABEL_156;
              }
              if (self->_isFeatured)
              {
                if (!*((unsigned char *)a3 + 242)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 242))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x80000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x200) != 0)
            {
              if ((v17 & 0x200) == 0) {
                goto LABEL_156;
              }
              if (self->_hasAudioTrack)
              {
                if (!*((unsigned char *)a3 + 232)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 232))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x200) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x40000) != 0)
            {
              if ((v17 & 0x40000) == 0) {
                goto LABEL_156;
              }
              if (self->_isFeatureCandidate)
              {
                if (!*((unsigned char *)a3 + 241)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 241))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x40000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x2000000) != 0)
            {
              if ((v17 & 0x2000000) == 0) {
                goto LABEL_156;
              }
              if (self->_reduceVisibility)
              {
                if (!*((unsigned char *)a3 + 248)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 248))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x2000000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x400000) != 0)
            {
              if ((v17 & 0x400000) == 0) {
                goto LABEL_156;
              }
              if (self->_isIssueOnly)
              {
                if (!*((unsigned char *)a3 + 245)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 245))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x400000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x10000) != 0)
            {
              if ((v17 & 0x10000) == 0) {
                goto LABEL_156;
              }
              if (self->_isEvergreen)
              {
                if (!*((unsigned char *)a3 + 239)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 239))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x10000) != 0)
            {
              goto LABEL_156;
            }
            language = self->_language;
            if ((unint64_t)language | *((void *)a3 + 20))
            {
              int v5 = -[NSString isEqual:](language, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            sourceChannelCohorts = self->_sourceChannelCohorts;
            if ((unint64_t)sourceChannelCohorts | *((void *)a3 + 23))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            globalCohorts = self->_globalCohorts;
            if ((unint64_t)globalCohorts | *((void *)a3 + 18))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            channelConversionStats = self->_channelConversionStats;
            if ((unint64_t)channelConversionStats | *((void *)a3 + 11))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            globalConversionStats = self->_globalConversionStats;
            if ((unint64_t)globalConversionStats | *((void *)a3 + 19))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            channelTagMetadata = self->_channelTagMetadata;
            if ((unint64_t)channelTagMetadata | *((void *)a3 + 12))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](channelTagMetadata, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            topics = self->_topics;
            if ((unint64_t)topics | *((void *)a3 + 28))
            {
              int v5 = -[NSMutableArray isEqual:](topics, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            expirationData = self->_expirationData;
            if ((unint64_t)expirationData | *((void *)a3 + 14))
            {
              int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration isEqual:](expirationData, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            float16TitleEncoding = self->_float16TitleEncoding;
            if ((unint64_t)float16TitleEncoding | *((void *)a3 + 17))
            {
              int v5 = -[NSData isEqual:](float16TitleEncoding, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            float16FullBodyEncoding = self->_float16FullBodyEncoding;
            if ((unint64_t)float16FullBodyEncoding | *((void *)a3 + 16))
            {
              int v5 = -[NSData isEqual:](float16FullBodyEncoding, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
            if ((unint64_t)thumbnailPerceptualHash | *((void *)a3 + 26))
            {
              int v5 = -[NSData isEqual:](thumbnailPerceptualHash, "isEqual:");
              if (!v5) {
                return v5;
              }
            }
            $6B8E73DA7CC4B9E6BA45EB77898599E8 v29 = self->_has;
            int v30 = *((_DWORD *)a3 + 63);
            if ((*(_DWORD *)&v29 & 0x1000000) != 0)
            {
              if ((v30 & 0x1000000) == 0) {
                goto LABEL_156;
              }
              if (self->_isSponsored)
              {
                if (!*((unsigned char *)a3 + 247)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 247))
              {
                goto LABEL_156;
              }
            }
            else if ((v30 & 0x1000000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v29 & 0x1000) != 0)
            {
              if ((v30 & 0x1000) == 0) {
                goto LABEL_156;
              }
              if (self->_hasVideoStillImage)
              {
                if (!*((unsigned char *)a3 + 235)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 235))
              {
                goto LABEL_156;
              }
            }
            else if ((v30 & 0x1000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v29 & 0x8000000) != 0)
            {
              if ((v30 & 0x8000000) == 0) {
                goto LABEL_156;
              }
              if (self->_webConverted)
              {
                if (!*((unsigned char *)a3 + 250)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 250))
              {
                goto LABEL_156;
              }
            }
            else if ((v30 & 0x8000000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v29 & 0x4000000) != 0)
            {
              if ((v30 & 0x4000000) == 0) {
                goto LABEL_156;
              }
              if (self->_reduceVisibilityForNonFollowers)
              {
                if (!*((unsigned char *)a3 + 249)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 249))
              {
                goto LABEL_156;
              }
            }
            else if ((v30 & 0x4000000) != 0)
            {
              goto LABEL_156;
            }
            surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
            if ((unint64_t)surfacedByArticleListID2s | *((void *)a3 + 25))
            {
              int v5 = -[NSMutableArray isEqual:](surfacedByArticleListID2s, "isEqual:");
              if (!v5) {
                return v5;
              }
              $6B8E73DA7CC4B9E6BA45EB77898599E8 v29 = self->_has;
            }
            int v32 = *((_DWORD *)a3 + 63);
            if ((*(unsigned char *)&v29 & 2) != 0)
            {
              if ((v32 & 2) == 0 || self->_conditionalScore != *((double *)a3 + 2)) {
                goto LABEL_156;
              }
            }
            else if ((v32 & 2) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v29 & 0x2000) != 0)
            {
              if ((v32 & 0x2000) == 0) {
                goto LABEL_156;
              }
              if (self->_isAIGenerated)
              {
                if (!*((unsigned char *)a3 + 236)) {
                  goto LABEL_156;
                }
              }
              else if (*((unsigned char *)a3 + 236))
              {
                goto LABEL_156;
              }
            }
            else if ((v32 & 0x2000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v29 & 0x8000) != 0)
            {
              if ((v32 & 0x8000) != 0)
              {
                if (self->_isCoread)
                {
                  if (!*((unsigned char *)a3 + 238)) {
                    goto LABEL_156;
                  }
                  goto LABEL_240;
                }
                if (!*((unsigned char *)a3 + 238))
                {
LABEL_240:
                  scoreProfiles = self->_scoreProfiles;
                  if ((unint64_t)scoreProfiles | *((void *)a3 + 22))
                  {
                    LOBYTE(v5) = -[NTPBScoreProfiles isEqual:](scoreProfiles, "isEqual:");
                  }
                  else
                  {
                    LOBYTE(v5) = 1;
                  }
                  return v5;
                }
              }
            }
            else if ((v32 & 0x8000) == 0)
            {
              goto LABEL_240;
            }
LABEL_156:
            LOBYTE(v5) = 0;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v67 = [(NSString *)self->_feedID hash];
  NSUInteger v66 = [(NSString *)self->_articleID hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    unint64_t v65 = 2654435761u * self->_order;
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
LABEL_3:
      unint64_t v64 = 2654435761u * self->_publishDateMilliseconds;
      if ((*(unsigned char *)&has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_14:
      unint64_t v63 = 0;
      if ((*(unsigned char *)&has & 0x10) != 0) {
        goto LABEL_5;
      }
LABEL_15:
      unint64_t v62 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v65 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v64 = 0;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_4:
  unint64_t v63 = 2654435761u * self->_feedHalfLifeMilliseconds;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_5:
  globalUserFeedbacuint64_t k = self->_globalUserFeedback;
  double v5 = -globalUserFeedback;
  if (globalUserFeedback >= 0.0) {
    double v5 = self->_globalUserFeedback;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v62 = v11;
LABEL_16:
  NSUInteger v61 = [(NSString *)self->_clusterID hash];
  NSUInteger v60 = [(NSString *)self->_sourceChannelID hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    uint64_t v59 = 2654435761 * self->_hasThumbnail;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
    {
LABEL_18:
      uint64_t v58 = 2654435761 * self->_isFromBlockedStorefront;
      if ((*(_DWORD *)&v12 & 0x20000) != 0) {
        goto LABEL_19;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v59 = 0;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v58 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v57 = 2654435761 * self->_isExplicitContent;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_20;
    }
LABEL_25:
    uint64_t v56 = 0;
    if ((*(unsigned char *)&v12 & 4) != 0) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v57 = 0;
  if ((*(unsigned char *)&v12 & 0x20) == 0) {
    goto LABEL_25;
  }
LABEL_20:
  uint64_t v56 = 2654435761 * self->_minimumNewsVersion;
  if ((*(unsigned char *)&v12 & 4) != 0)
  {
LABEL_21:
    unint64_t v55 = 2654435761u * self->_contentType;
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v55 = 0;
LABEL_27:
  uint64_t v54 = [(NSMutableArray *)self->_topicIDs hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    uint64_t v53 = 2654435761 * self->_isPaid;
    if ((*(_WORD *)&v13 & 0x800) != 0)
    {
LABEL_29:
      uint64_t v52 = 2654435761 * self->_hasVideo;
      if ((*(_WORD *)&v13 & 0x100) != 0) {
        goto LABEL_30;
      }
LABEL_34:
      uint64_t v51 = 0;
      if ((*(_DWORD *)&v13 & 0x200000) != 0) {
        goto LABEL_31;
      }
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v53 = 0;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v52 = 0;
  if ((*(_WORD *)&v13 & 0x100) == 0) {
    goto LABEL_34;
  }
LABEL_30:
  uint64_t v51 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_DWORD *)&v13 & 0x200000) != 0)
  {
LABEL_31:
    uint64_t v50 = 2654435761 * self->_isHiddenFromAutoFavorites;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v50 = 0;
LABEL_36:
  NSUInteger v49 = [(NSString *)self->_parentIssueID hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    uint64_t v48 = 2654435761 * self->_isBundlePaid;
    if (*(unsigned char *)&v14)
    {
LABEL_38:
      uint64_t v47 = 2654435761 * self->_bodyTextLength;
      if ((*(_DWORD *)&v14 & 0x80000) != 0) {
        goto LABEL_39;
      }
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if (*(unsigned char *)&v14) {
      goto LABEL_38;
    }
  }
  uint64_t v47 = 0;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
LABEL_39:
    uint64_t v46 = 2654435761 * self->_isFeatured;
    if ((*(_WORD *)&v14 & 0x200) != 0) {
      goto LABEL_40;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v46 = 0;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
LABEL_40:
    uint64_t v45 = 2654435761 * self->_hasAudioTrack;
    if ((*(_DWORD *)&v14 & 0x40000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
LABEL_41:
    uint64_t v44 = 2654435761 * self->_isFeatureCandidate;
    if ((*(_DWORD *)&v14 & 0x2000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v44 = 0;
  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
LABEL_42:
    uint64_t v43 = 2654435761 * self->_reduceVisibility;
    if ((*(_DWORD *)&v14 & 0x400000) != 0) {
      goto LABEL_43;
    }
LABEL_51:
    uint64_t v42 = 0;
    if ((*(_DWORD *)&v14 & 0x10000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_52;
  }
LABEL_50:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&v14 & 0x400000) == 0) {
    goto LABEL_51;
  }
LABEL_43:
  uint64_t v42 = 2654435761 * self->_isIssueOnly;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
LABEL_44:
    uint64_t v41 = 2654435761 * self->_isEvergreen;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v41 = 0;
LABEL_53:
  NSUInteger v40 = [(NSString *)self->_language hash];
  unint64_t v39 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts hash];
  unint64_t v38 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts hash];
  unint64_t v37 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats hash];
  unint64_t v36 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats hash];
  unint64_t v35 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata hash];
  uint64_t v34 = [(NSMutableArray *)self->_topics hash];
  unint64_t v33 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *)self->_expirationData hash];
  uint64_t v32 = [(NSData *)self->_float16TitleEncoding hash];
  uint64_t v15 = [(NSData *)self->_float16FullBodyEncoding hash];
  uint64_t v16 = [(NSData *)self->_thumbnailPerceptualHash hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
  {
    uint64_t v18 = 2654435761 * self->_isSponsored;
    if ((*(_WORD *)&v17 & 0x1000) != 0)
    {
LABEL_55:
      uint64_t v19 = 2654435761 * self->_hasVideoStillImage;
      if ((*(_DWORD *)&v17 & 0x8000000) != 0) {
        goto LABEL_56;
      }
LABEL_60:
      uint64_t v20 = 0;
      if ((*(_DWORD *)&v17 & 0x4000000) != 0) {
        goto LABEL_57;
      }
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&v17 & 0x1000) != 0) {
      goto LABEL_55;
    }
  }
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0) {
    goto LABEL_60;
  }
LABEL_56:
  uint64_t v20 = 2654435761 * self->_webConverted;
  if ((*(_DWORD *)&v17 & 0x4000000) != 0)
  {
LABEL_57:
    uint64_t v21 = 2654435761 * self->_reduceVisibilityForNonFollowers;
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v21 = 0;
LABEL_62:
  uint64_t v22 = [(NSMutableArray *)self->_surfacedByArticleListID2s hash];
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 2) != 0)
  {
    double conditionalScore = self->_conditionalScore;
    double v26 = -conditionalScore;
    if (conditionalScore >= 0.0) {
      double v26 = self->_conditionalScore;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    uint64_t v29 = 2654435761 * self->_isAIGenerated;
    if ((*(_WORD *)&v23 & 0x8000) != 0) {
      goto LABEL_72;
    }
LABEL_74:
    uint64_t v30 = 0;
    return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v29 ^ v30 ^ [(NTPBScoreProfiles *)self->_scoreProfiles hash];
  }
  uint64_t v29 = 0;
  if ((*(_WORD *)&v23 & 0x8000) == 0) {
    goto LABEL_74;
  }
LABEL_72:
  uint64_t v30 = 2654435761 * self->_isCoread;
  return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v29 ^ v30 ^ [(NTPBScoreProfiles *)self->_scoreProfiles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 15)) {
    -[NTPBFeedItem setFeedID:](self, "setFeedID:");
  }
  if (*((void *)a3 + 10)) {
    -[NTPBFeedItem setArticleID:](self, "setArticleID:");
  }
  int v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x40) != 0)
  {
    self->_order = *((void *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    int v5 = *((_DWORD *)a3 + 63);
    if ((v5 & 0x80) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_50;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  self->_publishDateMilliseconds = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_50:
  self->_feedHalfLifeMilliseconds = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 63) & 0x10) != 0)
  {
LABEL_9:
    self->_globalUserFeedbacuint64_t k = *((double *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_10:
  if (*((void *)a3 + 13)) {
    -[NTPBFeedItem setClusterID:](self, "setClusterID:");
  }
  if (*((void *)a3 + 24)) {
    -[NTPBFeedItem setSourceChannelID:](self, "setSourceChannelID:");
  }
  int v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x400) != 0)
  {
    self->_hasThumbnail = *((unsigned char *)a3 + 233);
    *(_DWORD *)&self->_has |= 0x400u;
    int v6 = *((_DWORD *)a3 + 63);
    if ((v6 & 0x100000) == 0)
    {
LABEL_16:
      if ((v6 & 0x20000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_54;
    }
  }
  else if ((v6 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  self->_isFromBlockedStorefront = *((unsigned char *)a3 + 243);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x20000) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_isExplicitContent = *((unsigned char *)a3 + 240);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x20) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_55:
  self->_minimumNewsVersion = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 63) & 4) != 0)
  {
LABEL_19:
    self->_contentType = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_20:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  double v7 = (void *)*((void *)a3 + 27);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBFeedItem *)self addTopicIDs:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v9);
  }
  int v12 = *((_DWORD *)a3 + 63);
  if ((v12 & 0x800000) != 0)
  {
    self->_isPaid = *((unsigned char *)a3 + 246);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v12 = *((_DWORD *)a3 + 63);
    if ((v12 & 0x800) == 0)
    {
LABEL_29:
      if ((v12 & 0x100) == 0) {
        goto LABEL_30;
      }
      goto LABEL_59;
    }
  }
  else if ((v12 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  self->_hasVideo = *((unsigned char *)a3 + 234);
  *(_DWORD *)&self->_has |= 0x800u;
  int v12 = *((_DWORD *)a3 + 63);
  if ((v12 & 0x100) == 0)
  {
LABEL_30:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_59:
  self->_publisherArticleVersion = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 63) & 0x200000) != 0)
  {
LABEL_31:
    self->_isHiddenFromAutoFavorites = *((unsigned char *)a3 + 244);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_32:
  if (*((void *)a3 + 21)) {
    -[NTPBFeedItem setParentIssueID:](self, "setParentIssueID:");
  }
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x4000) != 0)
  {
    self->_isBundlePaid = *((unsigned char *)a3 + 237);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v13 = *((_DWORD *)a3 + 63);
    if ((v13 & 1) == 0)
    {
LABEL_36:
      if ((v13 & 0x80000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_63;
    }
  }
  else if ((v13 & 1) == 0)
  {
    goto LABEL_36;
  }
  self->_bodyTextLength = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x80000) == 0)
  {
LABEL_37:
    if ((v13 & 0x200) == 0) {
      goto LABEL_38;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_isFeatured = *((unsigned char *)a3 + 242);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x200) == 0)
  {
LABEL_38:
    if ((v13 & 0x40000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_hasAudioTracuint64_t k = *((unsigned char *)a3 + 232);
  *(_DWORD *)&self->_has |= 0x200u;
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x40000) == 0)
  {
LABEL_39:
    if ((v13 & 0x2000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_isFeatureCandidate = *((unsigned char *)a3 + 241);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v13 & 0x400000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_reduceVisibility = *((unsigned char *)a3 + 248);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x400000) == 0)
  {
LABEL_41:
    if ((v13 & 0x10000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_67:
  self->_isIssueOnly = *((unsigned char *)a3 + 245);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)a3 + 63) & 0x10000) != 0)
  {
LABEL_42:
    self->_isEvergreen = *((unsigned char *)a3 + 239);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_43:
  if (*((void *)a3 + 20)) {
    -[NTPBFeedItem setLanguage:](self, "setLanguage:");
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  uint64_t v15 = *((void *)a3 + 23);
  if (sourceChannelCohorts)
  {
    if (v15) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[NTPBFeedItem setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  globalCohorts = self->_globalCohorts;
  uint64_t v17 = *((void *)a3 + 18);
  if (globalCohorts)
  {
    if (v17) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[NTPBFeedItem setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  channelConversionStats = self->_channelConversionStats;
  uint64_t v19 = *((void *)a3 + 11);
  if (channelConversionStats)
  {
    if (v19) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[NTPBFeedItem setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  uint64_t v21 = *((void *)a3 + 19);
  if (globalConversionStats)
  {
    if (v21) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[NTPBFeedItem setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
  channelTagMetadata = self->_channelTagMetadata;
  uint64_t v23 = *((void *)a3 + 12);
  if (channelTagMetadata)
  {
    if (v23) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](channelTagMetadata, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[NTPBFeedItem setChannelTagMetadata:](self, "setChannelTagMetadata:");
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v24 = (void *)*((void *)a3 + 28);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        [(NTPBFeedItem *)self addTopics:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v26);
  }
  expirationData = self->_expirationData;
  uint64_t v30 = *((void *)a3 + 14);
  if (expirationData)
  {
    if (v30) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration mergeFrom:](expirationData, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[NTPBFeedItem setExpirationData:](self, "setExpirationData:");
  }
  if (*((void *)a3 + 17)) {
    -[NTPBFeedItem setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:");
  }
  if (*((void *)a3 + 16)) {
    -[NTPBFeedItem setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:");
  }
  if (*((void *)a3 + 26)) {
    -[NTPBFeedItem setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:");
  }
  int v31 = *((_DWORD *)a3 + 63);
  if ((v31 & 0x1000000) != 0)
  {
    self->_isSponsored = *((unsigned char *)a3 + 247);
    *(_DWORD *)&self->_has |= 0x1000000u;
    int v31 = *((_DWORD *)a3 + 63);
    if ((v31 & 0x1000) == 0)
    {
LABEL_111:
      if ((v31 & 0x8000000) == 0) {
        goto LABEL_112;
      }
      goto LABEL_130;
    }
  }
  else if ((v31 & 0x1000) == 0)
  {
    goto LABEL_111;
  }
  self->_hasVideoStillImage = *((unsigned char *)a3 + 235);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v31 = *((_DWORD *)a3 + 63);
  if ((v31 & 0x8000000) == 0)
  {
LABEL_112:
    if ((v31 & 0x4000000) == 0) {
      goto LABEL_114;
    }
    goto LABEL_113;
  }
LABEL_130:
  self->_webConverted = *((unsigned char *)a3 + 250);
  *(_DWORD *)&self->_has |= 0x8000000u;
  if ((*((_DWORD *)a3 + 63) & 0x4000000) != 0)
  {
LABEL_113:
    self->_reduceVisibilityForNonFollowers = *((unsigned char *)a3 + 249);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_114:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v32 = (void *)*((void *)a3 + 25);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v32);
        }
        [(NTPBFeedItem *)self addSurfacedByArticleListID2:*(void *)(*((void *)&v40 + 1) + 8 * k)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v34);
  }
  int v37 = *((_DWORD *)a3 + 63);
  if ((v37 & 2) != 0)
  {
    self->_double conditionalScore = *((double *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v37 = *((_DWORD *)a3 + 63);
    if ((v37 & 0x2000) == 0)
    {
LABEL_123:
      if ((v37 & 0x8000) == 0) {
        goto LABEL_125;
      }
      goto LABEL_124;
    }
  }
  else if ((v37 & 0x2000) == 0)
  {
    goto LABEL_123;
  }
  self->_isAIGenerated = *((unsigned char *)a3 + 236);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)a3 + 63) & 0x8000) != 0)
  {
LABEL_124:
    self->_isCoread = *((unsigned char *)a3 + 238);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_125:
  scoreProfiles = self->_scoreProfiles;
  uint64_t v39 = *((void *)a3 + 22);
  if (scoreProfiles)
  {
    if (v39) {
      -[NTPBScoreProfiles mergeFrom:](scoreProfiles, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[NTPBFeedItem setScoreProfiles:](self, "setScoreProfiles:");
  }
}

- (NSString)feedID
{
  return self->_feedID;
}

- (void)setFeedID:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (unint64_t)order
{
  return self->_order;
}

- (unint64_t)publishDateMilliseconds
{
  return self->_publishDateMilliseconds;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  return self->_feedHalfLifeMilliseconds;
}

- (double)globalUserFeedback
{
  return self->_globalUserFeedback;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (NSString)sourceChannelID
{
  return self->_sourceChannelID;
}

- (void)setSourceChannelID:(id)a3
{
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (BOOL)isFromBlockedStorefront
{
  return self->_isFromBlockedStorefront;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSMutableArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_isHiddenFromAutoFavorites;
}

- (NSString)parentIssueID
{
  return self->_parentIssueID;
}

- (void)setParentIssueID:(id)a3
{
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (BOOL)hasAudioTrack
{
  return self->_hasAudioTrack;
}

- (BOOL)isFeatureCandidate
{
  return self->_isFeatureCandidate;
}

- (BOOL)reduceVisibility
{
  return self->_reduceVisibility;
}

- (BOOL)isIssueOnly
{
  return self->_isIssueOnly;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (void)setSourceChannelCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (void)setGlobalCohorts:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (void)setChannelConversionStats:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (void)setGlobalConversionStats:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata
{
  return self->_channelTagMetadata;
}

- (void)setChannelTagMetadata:(id)a3
{
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData
{
  return self->_expirationData;
}

- (void)setExpirationData:(id)a3
{
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (void)setFloat16TitleEncoding:(id)a3
{
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (void)setFloat16FullBodyEncoding:(id)a3
{
}

- (NSData)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (void)setThumbnailPerceptualHash:(id)a3
{
}

- (BOOL)isSponsored
{
  return self->_isSponsored;
}

- (BOOL)hasVideoStillImage
{
  return self->_hasVideoStillImage;
}

- (BOOL)webConverted
{
  return self->_webConverted;
}

- (BOOL)reduceVisibilityForNonFollowers
{
  return self->_reduceVisibilityForNonFollowers;
}

- (NSMutableArray)surfacedByArticleListID2s
{
  return self->_surfacedByArticleListID2s;
}

- (void)setSurfacedByArticleListID2s:(id)a3
{
}

- (double)conditionalScore
{
  return self->_conditionalScore;
}

- (BOOL)isAIGenerated
{
  return self->_isAIGenerated;
}

- (BOOL)isCoread
{
  return self->_isCoread;
}

- (NTPBScoreProfiles)scoreProfiles
{
  return self->_scoreProfiles;
}

- (void)setScoreProfiles:(id)a3
{
}

@end