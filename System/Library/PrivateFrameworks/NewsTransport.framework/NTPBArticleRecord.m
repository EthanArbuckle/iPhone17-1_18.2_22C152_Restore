@interface NTPBArticleRecord
+ (Class)allowedStorefrontIDsType;
+ (Class)authorsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)experimentalTitlesType;
+ (Class)flintFontResourceIDsType;
+ (Class)iAdCategoriesType;
+ (Class)iAdKeywordsType;
+ (Class)iAdSectionIDsType;
+ (Class)linkedArticleIDsType;
+ (Class)linkedIssueIDsType;
+ (Class)moreFromPublisherArticleIDsType;
+ (Class)publisherSpecifiedArticleIDsType;
+ (Class)relatedArticleIDsType;
+ (Class)sportsEventIDsType;
+ (Class)topicsType;
- (BOOL)hasAccessoryText;
- (BOOL)hasArticleRecirculationConfigurationURL;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBase;
- (BOOL)hasBehaviorFlags;
- (BOOL)hasBodyTextLength;
- (BOOL)hasChannelConversionStats;
- (BOOL)hasChannelTagMetadata;
- (BOOL)hasClusterID;
- (BOOL)hasContentType;
- (BOOL)hasContentURL;
- (BOOL)hasCoverArt;
- (BOOL)hasExcerptURL;
- (BOOL)hasExpirationData;
- (BOOL)hasFlintDocumentURL;
- (BOOL)hasFloat16FullBodyEncoding;
- (BOOL)hasFloat16TitleEncoding;
- (BOOL)hasGlobalCohorts;
- (BOOL)hasGlobalConversionStats;
- (BOOL)hasHalfLifeMilliseconds;
- (BOOL)hasHalfLifeMillisecondsOverride;
- (BOOL)hasIsBundlePaid;
- (BOOL)hasIsDraft;
- (BOOL)hasIsFeatureCandidate;
- (BOOL)hasIsIssueOnly;
- (BOOL)hasIsPaid;
- (BOOL)hasIsSponsored;
- (BOOL)hasLanguage;
- (BOOL)hasLayeredCover;
- (BOOL)hasLayeredCoverAspectRatio;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasNarrativeTrackFullURL;
- (BOOL)hasNarrativeTrackMetadata;
- (BOOL)hasNarrativeTrackSampleURL;
- (BOOL)hasNarrativeTrackTextRanges;
- (BOOL)hasParentIssueID;
- (BOOL)hasPrimaryAudience;
- (BOOL)hasPublishDate;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasReferencedArticleID;
- (BOOL)hasRole;
- (BOOL)hasRouteURL;
- (BOOL)hasSchemaFlags;
- (BOOL)hasShortExcerpt;
- (BOOL)hasSourceChannelCohorts;
- (BOOL)hasSourceChannelTagID;
- (BOOL)hasStocksClusterID;
- (BOOL)hasStocksMetadata;
- (BOOL)hasStocksScores;
- (BOOL)hasStoryType;
- (BOOL)hasSubtitle;
- (BOOL)hasThumbnailAccentColor;
- (BOOL)hasThumbnailBackgroundColor;
- (BOOL)hasThumbnailFocalFrame;
- (BOOL)hasThumbnailHQMetadata;
- (BOOL)hasThumbnailHQURL;
- (BOOL)hasThumbnailLQMetadata;
- (BOOL)hasThumbnailLQURL;
- (BOOL)hasThumbnailMediumMetadata;
- (BOOL)hasThumbnailMediumURL;
- (BOOL)hasThumbnailMetadata;
- (BOOL)hasThumbnailPerceptualHash;
- (BOOL)hasThumbnailPrimaryColor;
- (BOOL)hasThumbnailTextColor;
- (BOOL)hasThumbnailURL;
- (BOOL)hasThumbnailUltraHQMetadata;
- (BOOL)hasThumbnailUltraHQURL;
- (BOOL)hasThumbnailWidgetHQMetadata;
- (BOOL)hasThumbnailWidgetHQTaggedURL;
- (BOOL)hasThumbnailWidgetHQURL;
- (BOOL)hasThumbnailWidgetLQMetadata;
- (BOOL)hasThumbnailWidgetLQTaggedURL;
- (BOOL)hasThumbnailWidgetLQURL;
- (BOOL)hasThumbnailWidgetMetadata;
- (BOOL)hasThumbnailWidgetTaggedURL;
- (BOOL)hasThumbnailWidgetURL;
- (BOOL)hasTitle;
- (BOOL)hasTitleCompact;
- (BOOL)hasVideoCallToActionTitle;
- (BOOL)hasVideoCallToActionURL;
- (BOOL)hasVideoDuration;
- (BOOL)hasVideoStillImageURL;
- (BOOL)hasVideoType;
- (BOOL)hasVideoURL;
- (BOOL)isBundlePaid;
- (BOOL)isDraft;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeatureCandidate;
- (BOOL)isIssueOnly;
- (BOOL)isPaid;
- (BOOL)isSponsored;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata;
- (NSData)float16FullBodyEncoding;
- (NSData)float16TitleEncoding;
- (NSData)thumbnailPerceptualHash;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)authors;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)experimentalTitles;
- (NSMutableArray)flintFontResourceIDs;
- (NSMutableArray)iAdCategories;
- (NSMutableArray)iAdKeywords;
- (NSMutableArray)iAdSectionIDs;
- (NSMutableArray)linkedArticleIDs;
- (NSMutableArray)linkedIssueIDs;
- (NSMutableArray)moreFromPublisherArticleIDs;
- (NSMutableArray)publisherSpecifiedArticleIDs;
- (NSMutableArray)relatedArticleIDs;
- (NSMutableArray)sportsEventIDs;
- (NSMutableArray)topics;
- (NSString)accessoryText;
- (NSString)articleRecirculationConfigurationURL;
- (NSString)clusterID;
- (NSString)contentURL;
- (NSString)coverArt;
- (NSString)excerptURL;
- (NSString)flintDocumentURL;
- (NSString)language;
- (NSString)layeredCover;
- (NSString)narrativeTrackFullURL;
- (NSString)narrativeTrackMetadata;
- (NSString)narrativeTrackSampleURL;
- (NSString)narrativeTrackTextRanges;
- (NSString)parentIssueID;
- (NSString)primaryAudience;
- (NSString)referencedArticleID;
- (NSString)routeURL;
- (NSString)shortExcerpt;
- (NSString)sourceChannelTagID;
- (NSString)stocksClusterID;
- (NSString)stocksMetadata;
- (NSString)stocksScores;
- (NSString)subtitle;
- (NSString)thumbnailAccentColor;
- (NSString)thumbnailBackgroundColor;
- (NSString)thumbnailHQURL;
- (NSString)thumbnailLQURL;
- (NSString)thumbnailMediumURL;
- (NSString)thumbnailPrimaryColor;
- (NSString)thumbnailTextColor;
- (NSString)thumbnailURL;
- (NSString)thumbnailUltraHQURL;
- (NSString)thumbnailWidgetHQTaggedURL;
- (NSString)thumbnailWidgetHQURL;
- (NSString)thumbnailWidgetLQTaggedURL;
- (NSString)thumbnailWidgetLQURL;
- (NSString)thumbnailWidgetTaggedURL;
- (NSString)thumbnailWidgetURL;
- (NSString)title;
- (NSString)titleCompact;
- (NSString)videoCallToActionTitle;
- (NSString)videoCallToActionURL;
- (NSString)videoStillImageURL;
- (NSString)videoType;
- (NSString)videoURL;
- (NTPBDate)publishDate;
- (NTPBRecordBase)base;
- (double)layeredCoverAspectRatio;
- (double)videoDuration;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)authorsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)experimentalTitlesAtIndex:(unint64_t)a3;
- (id)flintFontResourceIDsAtIndex:(unint64_t)a3;
- (id)iAdCategoriesAtIndex:(unint64_t)a3;
- (id)iAdKeywordsAtIndex:(unint64_t)a3;
- (id)iAdSectionIDsAtIndex:(unint64_t)a3;
- (id)linkedArticleIDsAtIndex:(unint64_t)a3;
- (id)linkedIssueIDsAtIndex:(unint64_t)a3;
- (id)moreFromPublisherArticleIDsAtIndex:(unint64_t)a3;
- (id)publisherSpecifiedArticleIDsAtIndex:(unint64_t)a3;
- (id)relatedArticleIDsAtIndex:(unint64_t)a3;
- (id)sportsEventIDsAtIndex:(unint64_t)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (int)contentType;
- (int)role;
- (int)storyType;
- (int64_t)backendArticleVersion;
- (int64_t)behaviorFlags;
- (int64_t)bodyTextLength;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (int64_t)schemaFlags;
- (int64_t)thumbnailFocalFrame;
- (int64_t)thumbnailHQMetadata;
- (int64_t)thumbnailLQMetadata;
- (int64_t)thumbnailMediumMetadata;
- (int64_t)thumbnailMetadata;
- (int64_t)thumbnailUltraHQMetadata;
- (int64_t)thumbnailWidgetHQMetadata;
- (int64_t)thumbnailWidgetLQMetadata;
- (int64_t)thumbnailWidgetMetadata;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)authorsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)experimentalTitlesCount;
- (unint64_t)flintFontResourceIDsCount;
- (unint64_t)halfLifeMilliseconds;
- (unint64_t)halfLifeMillisecondsOverride;
- (unint64_t)hash;
- (unint64_t)iAdCategoriesCount;
- (unint64_t)iAdKeywordsCount;
- (unint64_t)iAdSectionIDsCount;
- (unint64_t)linkedArticleIDsCount;
- (unint64_t)linkedIssueIDsCount;
- (unint64_t)moreFromPublisherArticleIDsCount;
- (unint64_t)publisherSpecifiedArticleIDsCount;
- (unint64_t)relatedArticleIDsCount;
- (unint64_t)sportsEventIDsCount;
- (unint64_t)topicsCount;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addAuthors:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addExperimentalTitles:(id)a3;
- (void)addFlintFontResourceIDs:(id)a3;
- (void)addIAdCategories:(id)a3;
- (void)addIAdKeywords:(id)a3;
- (void)addIAdSectionIDs:(id)a3;
- (void)addLinkedArticleIDs:(id)a3;
- (void)addLinkedIssueIDs:(id)a3;
- (void)addMoreFromPublisherArticleIDs:(id)a3;
- (void)addPublisherSpecifiedArticleIDs:(id)a3;
- (void)addRelatedArticleIDs:(id)a3;
- (void)addSportsEventIDs:(id)a3;
- (void)addTopics:(id)a3;
- (void)clearAllowedStorefrontIDs;
- (void)clearAuthors;
- (void)clearBlockedStorefrontIDs;
- (void)clearExperimentalTitles;
- (void)clearFlintFontResourceIDs;
- (void)clearIAdCategories;
- (void)clearIAdKeywords;
- (void)clearIAdSectionIDs;
- (void)clearLinkedArticleIDs;
- (void)clearLinkedIssueIDs;
- (void)clearMoreFromPublisherArticleIDs;
- (void)clearPublisherSpecifiedArticleIDs;
- (void)clearRelatedArticleIDs;
- (void)clearSportsEventIDs;
- (void)clearTopics;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryText:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setArticleRecirculationConfigurationURL:(id)a3;
- (void)setAuthors:(id)a3;
- (void)setBackendArticleVersion:(int64_t)a3;
- (void)setBase:(id)a3;
- (void)setBehaviorFlags:(int64_t)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setBodyTextLength:(int64_t)a3;
- (void)setChannelConversionStats:(id)a3;
- (void)setChannelTagMetadata:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setContentType:(int)a3;
- (void)setContentURL:(id)a3;
- (void)setCoverArt:(id)a3;
- (void)setExcerptURL:(id)a3;
- (void)setExperimentalTitles:(id)a3;
- (void)setExpirationData:(id)a3;
- (void)setFlintDocumentURL:(id)a3;
- (void)setFlintFontResourceIDs:(id)a3;
- (void)setFloat16FullBodyEncoding:(id)a3;
- (void)setFloat16TitleEncoding:(id)a3;
- (void)setGlobalCohorts:(id)a3;
- (void)setGlobalConversionStats:(id)a3;
- (void)setHalfLifeMilliseconds:(unint64_t)a3;
- (void)setHalfLifeMillisecondsOverride:(unint64_t)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBehaviorFlags:(BOOL)a3;
- (void)setHasBodyTextLength:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasHalfLifeMilliseconds:(BOOL)a3;
- (void)setHasHalfLifeMillisecondsOverride:(BOOL)a3;
- (void)setHasIsBundlePaid:(BOOL)a3;
- (void)setHasIsDraft:(BOOL)a3;
- (void)setHasIsFeatureCandidate:(BOOL)a3;
- (void)setHasIsIssueOnly:(BOOL)a3;
- (void)setHasIsPaid:(BOOL)a3;
- (void)setHasIsSponsored:(BOOL)a3;
- (void)setHasLayeredCoverAspectRatio:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setHasSchemaFlags:(BOOL)a3;
- (void)setHasStoryType:(BOOL)a3;
- (void)setHasThumbnailFocalFrame:(BOOL)a3;
- (void)setHasThumbnailHQMetadata:(BOOL)a3;
- (void)setHasThumbnailLQMetadata:(BOOL)a3;
- (void)setHasThumbnailMediumMetadata:(BOOL)a3;
- (void)setHasThumbnailMetadata:(BOOL)a3;
- (void)setHasThumbnailUltraHQMetadata:(BOOL)a3;
- (void)setHasThumbnailWidgetHQMetadata:(BOOL)a3;
- (void)setHasThumbnailWidgetLQMetadata:(BOOL)a3;
- (void)setHasThumbnailWidgetMetadata:(BOOL)a3;
- (void)setHasVideoDuration:(BOOL)a3;
- (void)setIAdCategories:(id)a3;
- (void)setIAdKeywords:(id)a3;
- (void)setIAdSectionIDs:(id)a3;
- (void)setIsBundlePaid:(BOOL)a3;
- (void)setIsDraft:(BOOL)a3;
- (void)setIsFeatureCandidate:(BOOL)a3;
- (void)setIsIssueOnly:(BOOL)a3;
- (void)setIsPaid:(BOOL)a3;
- (void)setIsSponsored:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLayeredCover:(id)a3;
- (void)setLayeredCoverAspectRatio:(double)a3;
- (void)setLinkedArticleIDs:(id)a3;
- (void)setLinkedIssueIDs:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setMoreFromPublisherArticleIDs:(id)a3;
- (void)setNarrativeTrackFullURL:(id)a3;
- (void)setNarrativeTrackMetadata:(id)a3;
- (void)setNarrativeTrackSampleURL:(id)a3;
- (void)setNarrativeTrackTextRanges:(id)a3;
- (void)setParentIssueID:(id)a3;
- (void)setPrimaryAudience:(id)a3;
- (void)setPublishDate:(id)a3;
- (void)setPublisherArticleVersion:(int64_t)a3;
- (void)setPublisherSpecifiedArticleIDs:(id)a3;
- (void)setReferencedArticleID:(id)a3;
- (void)setRelatedArticleIDs:(id)a3;
- (void)setRole:(int)a3;
- (void)setRouteURL:(id)a3;
- (void)setSchemaFlags:(int64_t)a3;
- (void)setShortExcerpt:(id)a3;
- (void)setSourceChannelCohorts:(id)a3;
- (void)setSourceChannelTagID:(id)a3;
- (void)setSportsEventIDs:(id)a3;
- (void)setStocksClusterID:(id)a3;
- (void)setStocksMetadata:(id)a3;
- (void)setStocksScores:(id)a3;
- (void)setStoryType:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailAccentColor:(id)a3;
- (void)setThumbnailBackgroundColor:(id)a3;
- (void)setThumbnailFocalFrame:(int64_t)a3;
- (void)setThumbnailHQMetadata:(int64_t)a3;
- (void)setThumbnailHQURL:(id)a3;
- (void)setThumbnailLQMetadata:(int64_t)a3;
- (void)setThumbnailLQURL:(id)a3;
- (void)setThumbnailMediumMetadata:(int64_t)a3;
- (void)setThumbnailMediumURL:(id)a3;
- (void)setThumbnailMetadata:(int64_t)a3;
- (void)setThumbnailPerceptualHash:(id)a3;
- (void)setThumbnailPrimaryColor:(id)a3;
- (void)setThumbnailTextColor:(id)a3;
- (void)setThumbnailURL:(id)a3;
- (void)setThumbnailUltraHQMetadata:(int64_t)a3;
- (void)setThumbnailUltraHQURL:(id)a3;
- (void)setThumbnailWidgetHQMetadata:(int64_t)a3;
- (void)setThumbnailWidgetHQTaggedURL:(id)a3;
- (void)setThumbnailWidgetHQURL:(id)a3;
- (void)setThumbnailWidgetLQMetadata:(int64_t)a3;
- (void)setThumbnailWidgetLQTaggedURL:(id)a3;
- (void)setThumbnailWidgetLQURL:(id)a3;
- (void)setThumbnailWidgetMetadata:(int64_t)a3;
- (void)setThumbnailWidgetTaggedURL:(id)a3;
- (void)setThumbnailWidgetURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleCompact:(id)a3;
- (void)setTopics:(id)a3;
- (void)setVideoCallToActionTitle:(id)a3;
- (void)setVideoCallToActionURL:(id)a3;
- (void)setVideoDuration:(double)a3;
- (void)setVideoStillImageURL:(id)a3;
- (void)setVideoType:(id)a3;
- (void)setVideoURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (NSString)sourceChannelTagID
{
  return self->_sourceChannelTagID;
}

- (NSString)parentIssueID
{
  return self->_parentIssueID;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData
{
  return self->_expirationData;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)articleRecirculationConfigurationURL
{
  return self->_articleRecirculationConfigurationURL;
}

- (NSString)thumbnailTextColor
{
  return self->_thumbnailTextColor;
}

- (NSString)thumbnailPrimaryColor
{
  return self->_thumbnailPrimaryColor;
}

- (NSString)thumbnailBackgroundColor
{
  return self->_thumbnailBackgroundColor;
}

- (NSString)thumbnailAccentColor
{
  return self->_thumbnailAccentColor;
}

- (NSString)narrativeTrackFullURL
{
  return self->_narrativeTrackFullURL;
}

- (NSString)videoURL
{
  return self->_videoURL;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (NSString)videoStillImageURL
{
  return self->_videoStillImageURL;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (NSString)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (NSString)thumbnailWidgetURL
{
  return self->_thumbnailWidgetURL;
}

- (int64_t)thumbnailWidgetMetadata
{
  return self->_thumbnailWidgetMetadata;
}

- (NSString)thumbnailWidgetLQURL
{
  return self->_thumbnailWidgetLQURL;
}

- (int64_t)thumbnailWidgetLQMetadata
{
  return self->_thumbnailWidgetLQMetadata;
}

- (NSString)thumbnailWidgetHQURL
{
  return self->_thumbnailWidgetHQURL;
}

- (int64_t)thumbnailWidgetHQMetadata
{
  return self->_thumbnailWidgetHQMetadata;
}

- (NSString)thumbnailUltraHQURL
{
  return self->_thumbnailUltraHQURL;
}

- (int64_t)thumbnailUltraHQMetadata
{
  return self->_thumbnailUltraHQMetadata;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (int64_t)thumbnailMetadata
{
  return self->_thumbnailMetadata;
}

- (NSString)thumbnailMediumURL
{
  return self->_thumbnailMediumURL;
}

- (int64_t)thumbnailMediumMetadata
{
  return self->_thumbnailMediumMetadata;
}

- (NSString)thumbnailLQURL
{
  return self->_thumbnailLQURL;
}

- (int64_t)thumbnailLQMetadata
{
  return self->_thumbnailLQMetadata;
}

- (NSString)thumbnailHQURL
{
  return self->_thumbnailHQURL;
}

- (int64_t)thumbnailHQMetadata
{
  return self->_thumbnailHQMetadata;
}

- (int64_t)thumbnailFocalFrame
{
  return self->_thumbnailFocalFrame;
}

- (NSMutableArray)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (int64_t)schemaFlags
{
  return self->_schemaFlags;
}

- (NSString)routeURL
{
  return self->_routeURL;
}

- (NSMutableArray)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (NSString)referencedArticleID
{
  return self->_referencedArticleID;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (NTPBDate)publishDate
{
  return self->_publishDate;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSMutableArray)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSMutableArray)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (NSMutableArray)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (NSString)layeredCover
{
  return self->_layeredCover;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)isSponsored
{
  return self->_isSponsored;
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (BOOL)isIssueOnly
{
  return self->_isIssueOnly;
}

- (BOOL)isFeatureCandidate
{
  return self->_isFeatureCandidate;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (NSMutableArray)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (NSMutableArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSMutableArray)iAdCategories
{
  return self->_iAdCategories;
}

- (unint64_t)halfLifeMilliseconds
{
  return self->_halfLifeMilliseconds;
}

- (unint64_t)halfLifeMillisecondsOverride
{
  return self->_halfLifeMillisecondsOverride;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (NSMutableArray)experimentalTitles
{
  return self->_experimentalTitles;
}

- (NSString)coverArt
{
  return self->_coverArt;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata
{
  return self->_channelTagMetadata;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSMutableArray)authors
{
  return self->_authors;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (int)contentType
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (int)role
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    return self->_role;
  }
  else {
    return 0;
  }
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

- (void)addRelatedArticleIDs:(id)a3
{
  relatedArticleIDs = self->_relatedArticleIDs;
  if (!relatedArticleIDs)
  {
    relatedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_relatedArticleIDs = relatedArticleIDs;
  }

  [(NSMutableArray *)relatedArticleIDs addObject:a3];
}

- (void)addFlintFontResourceIDs:(id)a3
{
  flintFontResourceIDs = self->_flintFontResourceIDs;
  if (!flintFontResourceIDs)
  {
    flintFontResourceIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_flintFontResourceIDs = flintFontResourceIDs;
  }

  [(NSMutableArray *)flintFontResourceIDs addObject:a3];
}

- (void)addIAdKeywords:(id)a3
{
  iAdKeywords = self->_iAdKeywords;
  if (!iAdKeywords)
  {
    iAdKeywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_iAdKeywords = iAdKeywords;
  }

  [(NSMutableArray *)iAdKeywords addObject:a3];
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

- (void)addLinkedArticleIDs:(id)a3
{
  linkedArticleIDs = self->_linkedArticleIDs;
  if (!linkedArticleIDs)
  {
    linkedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_linkedArticleIDs = linkedArticleIDs;
  }

  [(NSMutableArray *)linkedArticleIDs addObject:a3];
}

- (void)addIAdSectionIDs:(id)a3
{
  iAdSectionIDs = self->_iAdSectionIDs;
  if (!iAdSectionIDs)
  {
    iAdSectionIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_iAdSectionIDs = iAdSectionIDs;
  }

  [(NSMutableArray *)iAdSectionIDs addObject:a3];
}

- (void)addIAdCategories:(id)a3
{
  iAdCategories = self->_iAdCategories;
  if (!iAdCategories)
  {
    iAdCategories = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_iAdCategories = iAdCategories;
  }

  [(NSMutableArray *)iAdCategories addObject:a3];
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

- (NSMutableArray)flintFontResourceIDs
{
  return self->_flintFontResourceIDs;
}

- (NSString)flintDocumentURL
{
  return self->_flintDocumentURL;
}

- (NSString)narrativeTrackSampleURL
{
  return self->_narrativeTrackSampleURL;
}

- (NSString)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (NSString)narrativeTrackMetadata
{
  return self->_narrativeTrackMetadata;
}

- (void)dealloc
{
  [(NTPBArticleRecord *)self setBase:0];
  [(NTPBArticleRecord *)self setReferencedArticleID:0];
  [(NTPBArticleRecord *)self setTitle:0];
  [(NTPBArticleRecord *)self setSubtitle:0];
  [(NTPBArticleRecord *)self setSourceChannelTagID:0];
  [(NTPBArticleRecord *)self setPublishDate:0];
  [(NTPBArticleRecord *)self setThumbnailLQURL:0];
  [(NTPBArticleRecord *)self setPrimaryAudience:0];
  [(NTPBArticleRecord *)self setExcerptURL:0];
  [(NTPBArticleRecord *)self setShortExcerpt:0];
  [(NTPBArticleRecord *)self setAccessoryText:0];
  [(NTPBArticleRecord *)self setContentURL:0];
  [(NTPBArticleRecord *)self setClusterID:0];
  [(NTPBArticleRecord *)self setFlintDocumentURL:0];
  [(NTPBArticleRecord *)self setFlintFontResourceIDs:0];
  [(NTPBArticleRecord *)self setVideoURL:0];
  [(NTPBArticleRecord *)self setIAdCategories:0];
  [(NTPBArticleRecord *)self setIAdKeywords:0];
  [(NTPBArticleRecord *)self setIAdSectionIDs:0];
  [(NTPBArticleRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBArticleRecord *)self setAllowedStorefrontIDs:0];
  [(NTPBArticleRecord *)self setRelatedArticleIDs:0];
  [(NTPBArticleRecord *)self setMoreFromPublisherArticleIDs:0];
  [(NTPBArticleRecord *)self setThumbnailURL:0];
  [(NTPBArticleRecord *)self setThumbnailMediumURL:0];
  [(NTPBArticleRecord *)self setThumbnailHQURL:0];
  [(NTPBArticleRecord *)self setThumbnailUltraHQURL:0];
  [(NTPBArticleRecord *)self setCoverArt:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetLQURL:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetLQTaggedURL:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetURL:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetTaggedURL:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetHQURL:0];
  [(NTPBArticleRecord *)self setThumbnailWidgetHQTaggedURL:0];
  [(NTPBArticleRecord *)self setTopics:0];
  [(NTPBArticleRecord *)self setSourceChannelCohorts:0];
  [(NTPBArticleRecord *)self setGlobalCohorts:0];
  [(NTPBArticleRecord *)self setTitleCompact:0];
  [(NTPBArticleRecord *)self setVideoCallToActionTitle:0];
  [(NTPBArticleRecord *)self setVideoCallToActionURL:0];
  [(NTPBArticleRecord *)self setPublisherSpecifiedArticleIDs:0];
  [(NTPBArticleRecord *)self setStocksClusterID:0];
  [(NTPBArticleRecord *)self setStocksMetadata:0];
  [(NTPBArticleRecord *)self setStocksScores:0];
  [(NTPBArticleRecord *)self setExperimentalTitles:0];
  [(NTPBArticleRecord *)self setParentIssueID:0];
  [(NTPBArticleRecord *)self setLanguage:0];
  [(NTPBArticleRecord *)self setLinkedArticleIDs:0];
  [(NTPBArticleRecord *)self setLinkedIssueIDs:0];
  [(NTPBArticleRecord *)self setNarrativeTrackMetadata:0];
  [(NTPBArticleRecord *)self setNarrativeTrackFullURL:0];
  [(NTPBArticleRecord *)self setNarrativeTrackSampleURL:0];
  [(NTPBArticleRecord *)self setNarrativeTrackTextRanges:0];
  [(NTPBArticleRecord *)self setChannelConversionStats:0];
  [(NTPBArticleRecord *)self setGlobalConversionStats:0];
  [(NTPBArticleRecord *)self setLayeredCover:0];
  [(NTPBArticleRecord *)self setThumbnailPrimaryColor:0];
  [(NTPBArticleRecord *)self setThumbnailBackgroundColor:0];
  [(NTPBArticleRecord *)self setThumbnailTextColor:0];
  [(NTPBArticleRecord *)self setThumbnailAccentColor:0];
  [(NTPBArticleRecord *)self setAuthors:0];
  [(NTPBArticleRecord *)self setChannelTagMetadata:0];
  [(NTPBArticleRecord *)self setVideoStillImageURL:0];
  [(NTPBArticleRecord *)self setExpirationData:0];
  [(NTPBArticleRecord *)self setRouteURL:0];
  [(NTPBArticleRecord *)self setFloat16TitleEncoding:0];
  [(NTPBArticleRecord *)self setFloat16FullBodyEncoding:0];
  [(NTPBArticleRecord *)self setArticleRecirculationConfigurationURL:0];
  [(NTPBArticleRecord *)self setThumbnailPerceptualHash:0];
  [(NTPBArticleRecord *)self setVideoType:0];
  [(NTPBArticleRecord *)self setSportsEventIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleRecord;
  [(NTPBArticleRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasReferencedArticleID
{
  return self->_referencedArticleID != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasSourceChannelTagID
{
  return self->_sourceChannelTagID != 0;
}

- (BOOL)hasPublishDate
{
  return self->_publishDate != 0;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setBackendArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasThumbnailLQURL
{
  return self->_thumbnailLQURL != 0;
}

- (void)setThumbnailLQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_thumbnailLQMetadata = a3;
}

- (void)setHasThumbnailLQMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasThumbnailLQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPrimaryAudience
{
  return self->_primaryAudience != 0;
}

- (BOOL)hasExcerptURL
{
  return self->_excerptURL != 0;
}

- (BOOL)hasShortExcerpt
{
  return self->_shortExcerpt != 0;
}

- (BOOL)hasAccessoryText
{
  return self->_accessoryText != 0;
}

- (BOOL)hasContentURL
{
  return self->_contentURL != 0;
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasContentType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasFlintDocumentURL
{
  return self->_flintDocumentURL != 0;
}

- (void)clearFlintFontResourceIDs
{
}

- (unint64_t)flintFontResourceIDsCount
{
  return [(NSMutableArray *)self->_flintFontResourceIDs count];
}

- (id)flintFontResourceIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_flintFontResourceIDs objectAtIndex:a3];
}

+ (Class)flintFontResourceIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasVideoURL
{
  return self->_videoURL != 0;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isBundlePaid = a3;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsBundlePaid
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsFeatureCandidate:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isFeatureCandidate = a3;
}

- (void)setHasIsFeatureCandidate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsFeatureCandidate
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIsSponsored:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isSponsored = a3;
}

- (void)setHasIsSponsored:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsSponsored
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)clearIAdCategories
{
}

- (unint64_t)iAdCategoriesCount
{
  return [(NSMutableArray *)self->_iAdCategories count];
}

- (id)iAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_iAdCategories objectAtIndex:a3];
}

+ (Class)iAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)clearIAdKeywords
{
}

- (unint64_t)iAdKeywordsCount
{
  return [(NSMutableArray *)self->_iAdKeywords count];
}

- (id)iAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_iAdKeywords objectAtIndex:a3];
}

+ (Class)iAdKeywordsType
{
  return (Class)objc_opt_class();
}

- (void)clearIAdSectionIDs
{
}

- (unint64_t)iAdSectionIDsCount
{
  return [(NSMutableArray *)self->_iAdSectionIDs count];
}

- (id)iAdSectionIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_iAdSectionIDs objectAtIndex:a3];
}

+ (Class)iAdSectionIDsType
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

- (void)setIsDraft:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isDraft = a3;
}

- (void)setHasIsDraft:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsDraft
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)clearRelatedArticleIDs
{
}

- (unint64_t)relatedArticleIDsCount
{
  return [(NSMutableArray *)self->_relatedArticleIDs count];
}

- (id)relatedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_relatedArticleIDs objectAtIndex:a3];
}

+ (Class)relatedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoreFromPublisherArticleIDs
{
}

- (void)addMoreFromPublisherArticleIDs:(id)a3
{
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  if (!moreFromPublisherArticleIDs)
  {
    moreFromPublisherArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_moreFromPublisherArticleIDs = moreFromPublisherArticleIDs;
  }

  [(NSMutableArray *)moreFromPublisherArticleIDs addObject:a3];
}

- (unint64_t)moreFromPublisherArticleIDsCount
{
  return [(NSMutableArray *)self->_moreFromPublisherArticleIDs count];
}

- (id)moreFromPublisherArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_moreFromPublisherArticleIDs objectAtIndex:a3];
}

+ (Class)moreFromPublisherArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasThumbnailURL
{
  return self->_thumbnailURL != 0;
}

- (void)setThumbnailMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_thumbnailMetadata = a3;
}

- (void)setHasThumbnailMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasThumbnailMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setThumbnailFocalFrame:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_thumbnailFocalFrame = a3;
}

- (void)setHasThumbnailFocalFrame:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasThumbnailFocalFrame
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasThumbnailMediumURL
{
  return self->_thumbnailMediumURL != 0;
}

- (void)setThumbnailMediumMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_thumbnailMediumMetadata = a3;
}

- (void)setHasThumbnailMediumMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasThumbnailMediumMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasThumbnailHQURL
{
  return self->_thumbnailHQURL != 0;
}

- (void)setThumbnailHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_thumbnailHQMetadata = a3;
}

- (void)setHasThumbnailHQMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasThumbnailHQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasThumbnailUltraHQURL
{
  return self->_thumbnailUltraHQURL != 0;
}

- (void)setThumbnailUltraHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_thumbnailUltraHQMetadata = a3;
}

- (void)setHasThumbnailUltraHQMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasThumbnailUltraHQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)storyType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_storyType;
  }
  else {
    return 0;
  }
}

- (void)setStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_storyType = a3;
}

- (void)setHasStoryType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasStoryType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_behaviorFlags = a3;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBehaviorFlags
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasCoverArt
{
  return self->_coverArt != 0;
}

- (void)setIsPaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsPaid
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasThumbnailWidgetLQURL
{
  return self->_thumbnailWidgetLQURL != 0;
}

- (BOOL)hasThumbnailWidgetLQTaggedURL
{
  return self->_thumbnailWidgetLQTaggedURL != 0;
}

- (void)setThumbnailWidgetLQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_thumbnailWidgetLQMetadata = a3;
}

- (void)setHasThumbnailWidgetLQMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasThumbnailWidgetLQMetadata
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasThumbnailWidgetURL
{
  return self->_thumbnailWidgetURL != 0;
}

- (BOOL)hasThumbnailWidgetTaggedURL
{
  return self->_thumbnailWidgetTaggedURL != 0;
}

- (void)setThumbnailWidgetMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_thumbnailWidgetMetadata = a3;
}

- (void)setHasThumbnailWidgetMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasThumbnailWidgetMetadata
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasThumbnailWidgetHQURL
{
  return self->_thumbnailWidgetHQURL != 0;
}

- (BOOL)hasThumbnailWidgetHQTaggedURL
{
  return self->_thumbnailWidgetHQTaggedURL != 0;
}

- (void)setThumbnailWidgetHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_thumbnailWidgetHQMetadata = a3;
}

- (void)setHasThumbnailWidgetHQMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasThumbnailWidgetHQMetadata
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearTopics
{
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

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasTitleCompact
{
  return self->_titleCompact != 0;
}

- (BOOL)hasVideoCallToActionTitle
{
  return self->_videoCallToActionTitle != 0;
}

- (BOOL)hasVideoCallToActionURL
{
  return self->_videoCallToActionURL != 0;
}

- (void)clearPublisherSpecifiedArticleIDs
{
}

- (void)addPublisherSpecifiedArticleIDs:(id)a3
{
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (!publisherSpecifiedArticleIDs)
  {
    publisherSpecifiedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_publisherSpecifiedArticleIDs = publisherSpecifiedArticleIDs;
  }

  [(NSMutableArray *)publisherSpecifiedArticleIDs addObject:a3];
}

- (unint64_t)publisherSpecifiedArticleIDsCount
{
  return [(NSMutableArray *)self->_publisherSpecifiedArticleIDs count];
}

- (id)publisherSpecifiedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_publisherSpecifiedArticleIDs objectAtIndex:a3];
}

+ (Class)publisherSpecifiedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStocksClusterID
{
  return self->_stocksClusterID != 0;
}

- (BOOL)hasStocksMetadata
{
  return self->_stocksMetadata != 0;
}

- (BOOL)hasStocksScores
{
  return self->_stocksScores != 0;
}

- (void)clearExperimentalTitles
{
}

- (void)addExperimentalTitles:(id)a3
{
  experimentalTitles = self->_experimentalTitles;
  if (!experimentalTitles)
  {
    experimentalTitles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_experimentalTitles = experimentalTitles;
  }

  [(NSMutableArray *)experimentalTitles addObject:a3];
}

- (unint64_t)experimentalTitlesCount
{
  return [(NSMutableArray *)self->_experimentalTitles count];
}

- (id)experimentalTitlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_experimentalTitles objectAtIndex:a3];
}

+ (Class)experimentalTitlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParentIssueID
{
  return self->_parentIssueID != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setRole:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRole
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHalfLifeMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_halfLifeMilliseconds = a3;
}

- (void)setHasHalfLifeMilliseconds:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHalfLifeMilliseconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearLinkedArticleIDs
{
}

- (unint64_t)linkedArticleIDsCount
{
  return [(NSMutableArray *)self->_linkedArticleIDs count];
}

- (id)linkedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_linkedArticleIDs objectAtIndex:a3];
}

+ (Class)linkedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearLinkedIssueIDs
{
}

- (void)addLinkedIssueIDs:(id)a3
{
  linkedIssueIDs = self->_linkedIssueIDs;
  if (!linkedIssueIDs)
  {
    linkedIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_linkedIssueIDs = linkedIssueIDs;
  }

  [(NSMutableArray *)linkedIssueIDs addObject:a3];
}

- (unint64_t)linkedIssueIDsCount
{
  return [(NSMutableArray *)self->_linkedIssueIDs count];
}

- (id)linkedIssueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_linkedIssueIDs objectAtIndex:a3];
}

+ (Class)linkedIssueIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIsIssueOnly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isIssueOnly = a3;
}

- (void)setHasIsIssueOnly:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsIssueOnly
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setBodyTextLength:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bodyTextLength = a3;
}

- (void)setHasBodyTextLength:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBodyTextLength
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasNarrativeTrackMetadata
{
  return self->_narrativeTrackMetadata != 0;
}

- (BOOL)hasNarrativeTrackFullURL
{
  return self->_narrativeTrackFullURL != 0;
}

- (BOOL)hasNarrativeTrackSampleURL
{
  return self->_narrativeTrackSampleURL != 0;
}

- (BOOL)hasNarrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges != 0;
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (BOOL)hasLayeredCover
{
  return self->_layeredCover != 0;
}

- (void)setLayeredCoverAspectRatio:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_layeredCoverAspectRatio = a3;
}

- (void)setHasLayeredCoverAspectRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLayeredCoverAspectRatio
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasThumbnailPrimaryColor
{
  return self->_thumbnailPrimaryColor != 0;
}

- (BOOL)hasThumbnailBackgroundColor
{
  return self->_thumbnailBackgroundColor != 0;
}

- (BOOL)hasThumbnailTextColor
{
  return self->_thumbnailTextColor != 0;
}

- (BOOL)hasThumbnailAccentColor
{
  return self->_thumbnailAccentColor != 0;
}

- (void)clearAuthors
{
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

- (BOOL)hasChannelTagMetadata
{
  return self->_channelTagMetadata != 0;
}

- (void)setHalfLifeMillisecondsOverride:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_halfLifeMillisecondsOverride = a3;
}

- (void)setHasHalfLifeMillisecondsOverride:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHalfLifeMillisecondsOverride
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasVideoStillImageURL
{
  return self->_videoStillImageURL != 0;
}

- (BOOL)hasExpirationData
{
  return self->_expirationData != 0;
}

- (void)setVideoDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_videoDuration = a3;
}

- (void)setHasVideoDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVideoDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasRouteURL
{
  return self->_routeURL != 0;
}

- (BOOL)hasFloat16TitleEncoding
{
  return self->_float16TitleEncoding != 0;
}

- (BOOL)hasFloat16FullBodyEncoding
{
  return self->_float16FullBodyEncoding != 0;
}

- (void)setSchemaFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_schemaFlags = a3;
}

- (void)setHasSchemaFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSchemaFlags
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasArticleRecirculationConfigurationURL
{
  return self->_articleRecirculationConfigurationURL != 0;
}

- (BOOL)hasThumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash != 0;
}

- (BOOL)hasVideoType
{
  return self->_videoType != 0;
}

- (void)clearSportsEventIDs
{
}

- (void)addSportsEventIDs:(id)a3
{
  sportsEventIDs = self->_sportsEventIDs;
  if (!sportsEventIDs)
  {
    sportsEventIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_sportsEventIDs = sportsEventIDs;
  }

  [(NSMutableArray *)sportsEventIDs addObject:a3];
}

- (unint64_t)sportsEventIDsCount
{
  return [(NSMutableArray *)self->_sportsEventIDs count];
}

- (id)sportsEventIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sportsEventIDs objectAtIndex:a3];
}

+ (Class)sportsEventIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBArticleRecord description](&v3, sel_description), -[NTPBArticleRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  referencedArticleID = self->_referencedArticleID;
  if (referencedArticleID) {
    [v3 setObject:referencedArticleID forKey:@"referenced_article_ID"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  sourceChannelTagID = self->_sourceChannelTagID;
  if (sourceChannelTagID) {
    [v3 setObject:sourceChannelTagID forKey:@"source_channel_tag_ID"];
  }
  publishDate = self->_publishDate;
  if (publishDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishDate, "dictionaryRepresentation"), @"publish_date");
  }
  $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_publisherArticleVersion), @"publisher_article_version");
    $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  }
  if (*(unsigned char *)&has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_backendArticleVersion), @"backend_article_version");
  }
  thumbnailLQURL = self->_thumbnailLQURL;
  if (thumbnailLQURL) {
    [v3 setObject:thumbnailLQURL forKey:@"thumbnail_LQ_URL"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailLQMetadata), @"thumbnail_LQ_metadata");
  }
  primaryAudience = self->_primaryAudience;
  if (primaryAudience) {
    [v3 setObject:primaryAudience forKey:@"primary_audience"];
  }
  excerptURL = self->_excerptURL;
  if (excerptURL) {
    [v3 setObject:excerptURL forKey:@"excerpt_URL"];
  }
  shortExcerpt = self->_shortExcerpt;
  if (shortExcerpt) {
    [v3 setObject:shortExcerpt forKey:@"short_excerpt"];
  }
  accessoryText = self->_accessoryText;
  if (accessoryText) {
    [v3 setObject:accessoryText forKey:@"accessory_text"];
  }
  contentURL = self->_contentURL;
  if (contentURL) {
    [v3 setObject:contentURL forKey:@"content_URL"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_contentType), @"content_type");
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v3 setObject:clusterID forKey:@"cluster_ID"];
  }
  flintDocumentURL = self->_flintDocumentURL;
  if (flintDocumentURL) {
    [v3 setObject:flintDocumentURL forKey:@"flint_document_URL"];
  }
  flintFontResourceIDs = self->_flintFontResourceIDs;
  if (flintFontResourceIDs) {
    [v3 setObject:flintFontResourceIDs forKey:@"flint_font_resource_IDs"];
  }
  videoURL = self->_videoURL;
  if (videoURL) {
    [v3 setObject:videoURL forKey:@"video_URL"];
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x400000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isBundlePaid), @"is_bundle_paid");
    $A8E075B7A99374BF2C8CD763302FCDDE v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x1000000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v21 & 0x8000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x1000000) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFeatureCandidate), @"is_feature_candidate");
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0) {
LABEL_44:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isSponsored), @"is_sponsored");
LABEL_45:
  iAdCategories = self->_iAdCategories;
  if (iAdCategories) {
    [v3 setObject:iAdCategories forKey:@"i_ad_categories"];
  }
  iAdKeywords = self->_iAdKeywords;
  if (iAdKeywords) {
    [v3 setObject:iAdKeywords forKey:@"i_ad_keywords"];
  }
  iAdSectionIDs = self->_iAdSectionIDs;
  if (iAdSectionIDs) {
    [v3 setObject:iAdSectionIDs forKey:@"i_ad_section_IDs"];
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs) {
    [v3 setObject:blockedStorefrontIDs forKey:@"blocked_storefront_IDs"];
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs) {
    [v3 setObject:allowedStorefrontIDs forKey:@"allowed_storefront_IDs"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDraft), @"is_draft");
  }
  relatedArticleIDs = self->_relatedArticleIDs;
  if (relatedArticleIDs) {
    [v3 setObject:relatedArticleIDs forKey:@"related_article_IDs"];
  }
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  if (moreFromPublisherArticleIDs) {
    [v3 setObject:moreFromPublisherArticleIDs forKey:@"more_from_publisher_article_IDs"];
  }
  thumbnailURL = self->_thumbnailURL;
  if (thumbnailURL) {
    [v3 setObject:thumbnailURL forKey:@"thumbnail_URL"];
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailMetadata), @"thumbnail_metadata");
    $A8E075B7A99374BF2C8CD763302FCDDE v30 = self->_has;
  }
  if ((*(_WORD *)&v30 & 0x200) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailFocalFrame), @"thumbnail_focal_frame");
  }
  thumbnailMediumURL = self->_thumbnailMediumURL;
  if (thumbnailMediumURL) {
    [v3 setObject:thumbnailMediumURL forKey:@"thumbnail_medium_URL"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailMediumMetadata), @"thumbnail_medium_metadata");
  }
  thumbnailHQURL = self->_thumbnailHQURL;
  if (thumbnailHQURL) {
    [v3 setObject:thumbnailHQURL forKey:@"thumbnail_HQ_URL"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailHQMetadata), @"thumbnail_HQ_metadata");
  }
  thumbnailUltraHQURL = self->_thumbnailUltraHQURL;
  if (thumbnailUltraHQURL) {
    [v3 setObject:thumbnailUltraHQURL forKey:@"thumbnail_ultra_HQ_URL"];
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailUltraHQMetadata), @"thumbnail_ultra_HQ_metadata");
    $A8E075B7A99374BF2C8CD763302FCDDE v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x200000) == 0)
    {
LABEL_79:
      if ((*(unsigned char *)&v34 & 2) == 0) {
        goto LABEL_80;
      }
      goto LABEL_207;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x200000) == 0)
  {
    goto LABEL_79;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_storyType), @"story_type");
  $A8E075B7A99374BF2C8CD763302FCDDE v34 = self->_has;
  if ((*(unsigned char *)&v34 & 2) == 0)
  {
LABEL_80:
    if ((*(unsigned char *)&v34 & 0x40) == 0) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
LABEL_207:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_behaviorFlags), @"behavior_flags");
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_81:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
LABEL_82:
  coverArt = self->_coverArt;
  if (coverArt) {
    [v3 setObject:coverArt forKey:@"coverArt"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaid), @"is_paid");
  }
  thumbnailWidgetLQURL = self->_thumbnailWidgetLQURL;
  if (thumbnailWidgetLQURL) {
    [v3 setObject:thumbnailWidgetLQURL forKey:@"thumbnail_widget_LQ_URL"];
  }
  thumbnailWidgetLQTaggedURL = self->_thumbnailWidgetLQTaggedURL;
  if (thumbnailWidgetLQTaggedURL) {
    [v3 setObject:thumbnailWidgetLQTaggedURL forKey:@"thumbnail_widget_LQ_tagged_URL"];
  }
  if (*((unsigned char *)&self->_has + 2)) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailWidgetLQMetadata), @"thumbnail_widget_LQ_metadata");
  }
  thumbnailWidgetURL = self->_thumbnailWidgetURL;
  if (thumbnailWidgetURL) {
    [v3 setObject:thumbnailWidgetURL forKey:@"thumbnail_widget_URL"];
  }
  thumbnailWidgetTaggedURL = self->_thumbnailWidgetTaggedURL;
  if (thumbnailWidgetTaggedURL) {
    [v3 setObject:thumbnailWidgetTaggedURL forKey:@"thumbnail_widget_tagged_URL"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailWidgetMetadata), @"thumbnail_widget_metadata");
  }
  thumbnailWidgetHQURL = self->_thumbnailWidgetHQURL;
  if (thumbnailWidgetHQURL) {
    [v3 setObject:thumbnailWidgetHQURL forKey:@"thumbnail_widget_HQ_URL"];
  }
  thumbnailWidgetHQTaggedURL = self->_thumbnailWidgetHQTaggedURL;
  if (thumbnailWidgetHQTaggedURL) {
    [v3 setObject:thumbnailWidgetHQTaggedURL forKey:@"thumbnail_widget_HQ_tagged_URL"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_thumbnailWidgetHQMetadata), @"thumbnail_widget_HQ_metadata");
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    topics = self->_topics;
    uint64_t v44 = [(NSMutableArray *)topics countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v88 != v46) {
            objc_enumerationMutation(topics);
          }
          objc_msgSend(v42, "addObject:", objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v45 = [(NSMutableArray *)topics countByEnumeratingWithState:&v87 objects:v91 count:16];
      }
      while (v45);
    }
    [v3 setObject:v42 forKey:@"topics"];
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](sourceChannelCohorts, "dictionaryRepresentation"), @"source_channel_cohorts");
  }
  globalCohorts = self->_globalCohorts;
  if (globalCohorts) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation"), @"global_cohorts");
  }
  titleCompact = self->_titleCompact;
  if (titleCompact) {
    [v3 setObject:titleCompact forKey:@"title_compact"];
  }
  videoCallToActionTitle = self->_videoCallToActionTitle;
  if (videoCallToActionTitle) {
    [v3 setObject:videoCallToActionTitle forKey:@"video_call_to_action_title"];
  }
  videoCallToActionURL = self->_videoCallToActionURL;
  if (videoCallToActionURL) {
    [v3 setObject:videoCallToActionURL forKey:@"video_call_to_action_URL"];
  }
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (publisherSpecifiedArticleIDs) {
    [v3 setObject:publisherSpecifiedArticleIDs forKey:@"publisher_specified_article_IDs"];
  }
  stocksClusterID = self->_stocksClusterID;
  if (stocksClusterID) {
    [v3 setObject:stocksClusterID forKey:@"stocks_cluster_ID"];
  }
  stocksMetadata = self->_stocksMetadata;
  if (stocksMetadata) {
    [v3 setObject:stocksMetadata forKey:@"stocks_metadata"];
  }
  stocksScores = self->_stocksScores;
  if (stocksScores) {
    [v3 setObject:stocksScores forKey:@"stocks_scores"];
  }
  experimentalTitles = self->_experimentalTitles;
  if (experimentalTitles) {
    [v3 setObject:experimentalTitles forKey:@"experimental_titles"];
  }
  parentIssueID = self->_parentIssueID;
  if (parentIssueID) {
    [v3 setObject:parentIssueID forKey:@"parent_issue_ID"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v60 = self->_has;
  if ((*(_DWORD *)&v60 & 0x100000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_role), @"role");
    $A8E075B7A99374BF2C8CD763302FCDDE v60 = self->_has;
  }
  if ((*(unsigned char *)&v60 & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_halfLifeMilliseconds), @"half_life_milliseconds");
  }
  linkedArticleIDs = self->_linkedArticleIDs;
  if (linkedArticleIDs) {
    [v3 setObject:linkedArticleIDs forKey:@"linked_article_IDs"];
  }
  linkedIssueIDs = self->_linkedIssueIDs;
  if (linkedIssueIDs) {
    [v3 setObject:linkedIssueIDs forKey:@"linked_issue_IDs"];
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x2000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isIssueOnly), @"is_issue_only");
    $A8E075B7A99374BF2C8CD763302FCDDE v63 = self->_has;
  }
  if ((*(unsigned char *)&v63 & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_bodyTextLength), @"body_text_length");
  }
  narrativeTrackMetadata = self->_narrativeTrackMetadata;
  if (narrativeTrackMetadata) {
    [v3 setObject:narrativeTrackMetadata forKey:@"narrative_track_metadata"];
  }
  narrativeTrackFullURL = self->_narrativeTrackFullURL;
  if (narrativeTrackFullURL) {
    [v3 setObject:narrativeTrackFullURL forKey:@"narrative_track_full_URL"];
  }
  narrativeTrackSampleURL = self->_narrativeTrackSampleURL;
  if (narrativeTrackSampleURL) {
    [v3 setObject:narrativeTrackSampleURL forKey:@"narrative_track_sample_URL"];
  }
  narrativeTrackTextRanges = self->_narrativeTrackTextRanges;
  if (narrativeTrackTextRanges) {
    [v3 setObject:narrativeTrackTextRanges forKey:@"narrative_track_text_ranges"];
  }
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](channelConversionStats, "dictionaryRepresentation"), @"channel_conversion_stats");
  }
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation"), @"global_conversion_stats");
  }
  layeredCover = self->_layeredCover;
  if (layeredCover) {
    [v3 setObject:layeredCover forKey:@"layered_cover"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_layeredCoverAspectRatio), @"layered_cover_aspect_ratio");
  }
  thumbnailPrimaryColor = self->_thumbnailPrimaryColor;
  if (thumbnailPrimaryColor) {
    [v3 setObject:thumbnailPrimaryColor forKey:@"thumbnail_primary_color"];
  }
  thumbnailBackgroundColor = self->_thumbnailBackgroundColor;
  if (thumbnailBackgroundColor) {
    [v3 setObject:thumbnailBackgroundColor forKey:@"thumbnail_background_color"];
  }
  thumbnailTextColor = self->_thumbnailTextColor;
  if (thumbnailTextColor) {
    [v3 setObject:thumbnailTextColor forKey:@"thumbnail_text_color"];
  }
  thumbnailAccentColor = self->_thumbnailAccentColor;
  if (thumbnailAccentColor) {
    [v3 setObject:thumbnailAccentColor forKey:@"thumbnail_accent_color"];
  }
  authors = self->_authors;
  if (authors) {
    [v3 setObject:authors forKey:@"authors"];
  }
  channelTagMetadata = self->_channelTagMetadata;
  if (channelTagMetadata) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata dictionaryRepresentation](channelTagMetadata, "dictionaryRepresentation"), @"channel_tag_metadata");
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_halfLifeMillisecondsOverride), @"half_life_milliseconds_override");
  }
  videoStillImageURL = self->_videoStillImageURL;
  if (videoStillImageURL) {
    [v3 setObject:videoStillImageURL forKey:@"video_still_image_URL"];
  }
  expirationData = self->_expirationData;
  if (expirationData) {
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration dictionaryRepresentation](expirationData, "dictionaryRepresentation"), @"expiration_data");
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_videoDuration), @"video_duration");
  }
  routeURL = self->_routeURL;
  if (routeURL) {
    [v3 setObject:routeURL forKey:@"route_URL"];
  }
  float16TitleEncoding = self->_float16TitleEncoding;
  if (float16TitleEncoding) {
    [v3 setObject:float16TitleEncoding forKey:@"float16_title_encoding"];
  }
  float16FullBodyEncoding = self->_float16FullBodyEncoding;
  if (float16FullBodyEncoding) {
    [v3 setObject:float16FullBodyEncoding forKey:@"float16_full_body_encoding"];
  }
  if (*((unsigned char *)&self->_has + 1)) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_schemaFlags), @"schema_flags");
  }
  articleRecirculationConfigurationURL = self->_articleRecirculationConfigurationURL;
  if (articleRecirculationConfigurationURL) {
    [v3 setObject:articleRecirculationConfigurationURL forKey:@"article_recirculation_configuration_URL"];
  }
  thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
  if (thumbnailPerceptualHash) {
    [v3 setObject:thumbnailPerceptualHash forKey:@"thumbnail_perceptual_hash"];
  }
  videoType = self->_videoType;
  if (videoType) {
    [v3 setObject:videoType forKey:@"video_type"];
  }
  sportsEventIDs = self->_sportsEventIDs;
  if (sportsEventIDs) {
    [v3 setObject:sportsEventIDs forKey:@"sports_event_IDs"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_referencedArticleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelTagID) {
    PBDataWriterWriteStringField();
  }
  if (self->_publishDate) {
    PBDataWriterWriteSubmessage();
  }
  $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  }
  if (*(unsigned char *)&has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailLQURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_primaryAudience) {
    PBDataWriterWriteStringField();
  }
  if (self->_excerptURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_shortExcerpt) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryText) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_clusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_flintDocumentURL) {
    PBDataWriterWriteStringField();
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  flintFontResourceIDs = self->_flintFontResourceIDs;
  uint64_t v6 = [(NSMutableArray *)flintFontResourceIDs countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v142 != v8) {
          objc_enumerationMutation(flintFontResourceIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)flintFontResourceIDs countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v7);
  }
  if (self->_videoURL) {
    PBDataWriterWriteStringField();
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $A8E075B7A99374BF2C8CD763302FCDDE v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x1000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v10 & 0x8000000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0) {
LABEL_49:
  }
    PBDataWriterWriteBOOLField();
LABEL_50:
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  iAdCategories = self->_iAdCategories;
  uint64_t v12 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v138;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v138 != v14) {
          objc_enumerationMutation(iAdCategories);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v137 objects:v158 count:16];
    }
    while (v13);
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  iAdKeywords = self->_iAdKeywords;
  uint64_t v17 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v133 objects:v157 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v134;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v134 != v19) {
          objc_enumerationMutation(iAdKeywords);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v133 objects:v157 count:16];
    }
    while (v18);
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  iAdSectionIDs = self->_iAdSectionIDs;
  uint64_t v22 = [(NSMutableArray *)iAdSectionIDs countByEnumeratingWithState:&v129 objects:v156 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v130;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v130 != v24) {
          objc_enumerationMutation(iAdSectionIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)iAdSectionIDs countByEnumeratingWithState:&v129 objects:v156 count:16];
    }
    while (v23);
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v27 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v125 objects:v155 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v126;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v126 != v29) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v28 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v125 objects:v155 count:16];
    }
    while (v28);
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v32 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v121 objects:v154 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v122;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v122 != v34) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v33 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v121 objects:v154 count:16];
    }
    while (v33);
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  relatedArticleIDs = self->_relatedArticleIDs;
  uint64_t v37 = [(NSMutableArray *)relatedArticleIDs countByEnumeratingWithState:&v117 objects:v153 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v118;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v118 != v39) {
          objc_enumerationMutation(relatedArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v38 = [(NSMutableArray *)relatedArticleIDs countByEnumeratingWithState:&v117 objects:v153 count:16];
    }
    while (v38);
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  uint64_t v42 = [(NSMutableArray *)moreFromPublisherArticleIDs countByEnumeratingWithState:&v113 objects:v152 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v114;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v114 != v44) {
          objc_enumerationMutation(moreFromPublisherArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v43 = [(NSMutableArray *)moreFromPublisherArticleIDs countByEnumeratingWithState:&v113 objects:v152 count:16];
    }
    while (v43);
  }
  if (self->_thumbnailURL) {
    PBDataWriterWriteStringField();
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $A8E075B7A99374BF2C8CD763302FCDDE v46 = self->_has;
  }
  if ((*(_WORD *)&v46 & 0x200) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailMediumURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailHQURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailUltraHQURL) {
    PBDataWriterWriteStringField();
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $A8E075B7A99374BF2C8CD763302FCDDE v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x200000) == 0)
    {
LABEL_119:
      if ((*(unsigned char *)&v47 & 2) == 0) {
        goto LABEL_120;
      }
      goto LABEL_275;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x200000) == 0)
  {
    goto LABEL_119;
  }
  PBDataWriterWriteInt32Field();
  $A8E075B7A99374BF2C8CD763302FCDDE v47 = self->_has;
  if ((*(unsigned char *)&v47 & 2) == 0)
  {
LABEL_120:
    if ((*(unsigned char *)&v47 & 0x40) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
LABEL_275:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_121:
  }
    PBDataWriterWriteInt64Field();
LABEL_122:
  if (self->_coverArt) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_thumbnailWidgetLQURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailWidgetLQTaggedURL) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailWidgetURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailWidgetTaggedURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_thumbnailWidgetHQURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailWidgetHQTaggedURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  topics = self->_topics;
  uint64_t v49 = [(NSMutableArray *)topics countByEnumeratingWithState:&v109 objects:v151 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v110;
    do
    {
      for (muint64_t m = 0; mm != v50; ++mm)
      {
        if (*(void *)v110 != v51) {
          objc_enumerationMutation(topics);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v50 = [(NSMutableArray *)topics countByEnumeratingWithState:&v109 objects:v151 count:16];
    }
    while (v50);
  }
  if (self->_sourceChannelCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalCohorts) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_titleCompact) {
    PBDataWriterWriteStringField();
  }
  if (self->_videoCallToActionTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_videoCallToActionURL) {
    PBDataWriterWriteStringField();
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  uint64_t v54 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v105 objects:v150 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v106;
    do
    {
      for (nuint64_t n = 0; nn != v55; ++nn)
      {
        if (*(void *)v106 != v56) {
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v55 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v105 objects:v150 count:16];
    }
    while (v55);
  }
  if (self->_stocksClusterID) {
    PBDataWriterWriteStringField();
  }
  if (self->_stocksMetadata) {
    PBDataWriterWriteStringField();
  }
  if (self->_stocksScores) {
    PBDataWriterWriteStringField();
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  experimentalTitles = self->_experimentalTitles;
  uint64_t v59 = [(NSMutableArray *)experimentalTitles countByEnumeratingWithState:&v101 objects:v149 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v102;
    do
    {
      for (uint64_t i1 = 0; i1 != v60; ++i1)
      {
        if (*(void *)v102 != v61) {
          objc_enumerationMutation(experimentalTitles);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v60 = [(NSMutableArray *)experimentalTitles countByEnumeratingWithState:&v101 objects:v149 count:16];
    }
    while (v60);
  }
  if (self->_parentIssueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $A8E075B7A99374BF2C8CD763302FCDDE v63 = self->_has;
  }
  if ((*(unsigned char *)&v63 & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  linkedArticleIDs = self->_linkedArticleIDs;
  uint64_t v65 = [(NSMutableArray *)linkedArticleIDs countByEnumeratingWithState:&v97 objects:v148 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v98;
    do
    {
      for (uint64_t i2 = 0; i2 != v66; ++i2)
      {
        if (*(void *)v98 != v67) {
          objc_enumerationMutation(linkedArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v66 = [(NSMutableArray *)linkedArticleIDs countByEnumeratingWithState:&v97 objects:v148 count:16];
    }
    while (v66);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  linkedIssueIDs = self->_linkedIssueIDs;
  uint64_t v70 = [(NSMutableArray *)linkedIssueIDs countByEnumeratingWithState:&v93 objects:v147 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v94;
    do
    {
      for (uint64_t i3 = 0; i3 != v71; ++i3)
      {
        if (*(void *)v94 != v72) {
          objc_enumerationMutation(linkedIssueIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v71 = [(NSMutableArray *)linkedIssueIDs countByEnumeratingWithState:&v93 objects:v147 count:16];
    }
    while (v71);
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v74 = self->_has;
  if ((*(_DWORD *)&v74 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $A8E075B7A99374BF2C8CD763302FCDDE v74 = self->_has;
  }
  if ((*(unsigned char *)&v74 & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_narrativeTrackMetadata) {
    PBDataWriterWriteStringField();
  }
  if (self->_narrativeTrackFullURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_narrativeTrackSampleURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_narrativeTrackTextRanges) {
    PBDataWriterWriteStringField();
  }
  if (self->_channelConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_globalConversionStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_layeredCover) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_thumbnailPrimaryColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailBackgroundColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailTextColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailAccentColor) {
    PBDataWriterWriteStringField();
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  authors = self->_authors;
  uint64_t v76 = [(NSMutableArray *)authors countByEnumeratingWithState:&v89 objects:v146 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v90;
    do
    {
      for (uint64_t i4 = 0; i4 != v77; ++i4)
      {
        if (*(void *)v90 != v78) {
          objc_enumerationMutation(authors);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v77 = [(NSMutableArray *)authors countByEnumeratingWithState:&v89 objects:v146 count:16];
    }
    while (v77);
  }
  if (self->_channelTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_videoStillImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_expirationData) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_routeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_float16TitleEncoding) {
    PBDataWriterWriteDataField();
  }
  if (self->_float16FullBodyEncoding) {
    PBDataWriterWriteDataField();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_articleRecirculationConfigurationURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailPerceptualHash) {
    PBDataWriterWriteDataField();
  }
  if (self->_videoType) {
    PBDataWriterWriteStringField();
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  sportsEventIDs = self->_sportsEventIDs;
  uint64_t v81 = [(NSMutableArray *)sportsEventIDs countByEnumeratingWithState:&v85 objects:v145 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v86;
    do
    {
      for (uint64_t i5 = 0; i5 != v82; ++i5)
      {
        if (*(void *)v86 != v83) {
          objc_enumerationMutation(sportsEventIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v82 = [(NSMutableArray *)sportsEventIDs countByEnumeratingWithState:&v85 objects:v145 count:16];
    }
    while (v82);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 192) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  *(void *)(v5 + 456) = [(NSString *)self->_referencedArticleID copyWithZone:a3];

  *(void *)(v5 + 688) = [(NSString *)self->_title copyWithZone:a3];
  *(void *)(v5 + 552) = [(NSString *)self->_subtitle copyWithZone:a3];

  *(void *)(v5 + 504) = [(NSString *)self->_sourceChannelTagID copyWithZone:a3];
  *(void *)(v5 + 440) = [(NTPBDate *)self->_publishDate copyWithZone:a3];
  $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_publisherArticleVersion;
    *(_DWORD *)(v5 + 760) |= 0x80u;
    $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_backendArticleVersion;
    *(_DWORD *)(v5 + 760) |= 1u;
  }

  *(void *)(v5 + 584) = [(NSString *)self->_thumbnailLQURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(void *)(v5 + 96) = self->_thumbnailLQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x800u;
  }

  *(void *)(v5 + 432) = [(NSString *)self->_primaryAudience copyWithZone:a3];
  *(void *)(v5 + 256) = [(NSString *)self->_excerptURL copyWithZone:a3];

  *(void *)(v5 + 488) = [(NSString *)self->_shortExcerpt copyWithZone:a3];
  *(void *)(v5 + 160) = [(NSString *)self->_accessoryText copyWithZone:a3];

  *(void *)(v5 + 240) = [(NSString *)self->_contentURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_contentType;
    *(_DWORD *)(v5 + 760) |= 0x80000u;
  }

  *(void *)(v5 + 224) = [(NSString *)self->_clusterID copyWithZone:a3];
  *(void *)(v5 + 280) = [(NSString *)self->_flintDocumentURL copyWithZone:a3];
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  flintFontResourceIDs = self->_flintFontResourceIDs;
  uint64_t v8 = [(NSMutableArray *)flintFontResourceIDs countByEnumeratingWithState:&v159 objects:v177 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v160 != v10) {
          objc_enumerationMutation(flintFontResourceIDs);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v159 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addFlintFontResourceIDs:v12];
      }
      uint64_t v9 = [(NSMutableArray *)flintFontResourceIDs countByEnumeratingWithState:&v159 objects:v177 count:16];
    }
    while (v9);
  }

  *(void *)(v5 + 744) = [(NSString *)self->_videoURL copyWithZone:a3];
  $A8E075B7A99374BF2C8CD763302FCDDE v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
    *(unsigned char *)(v5 + 752) = self->_isBundlePaid;
    *(_DWORD *)(v5 + 760) |= 0x400000u;
    $A8E075B7A99374BF2C8CD763302FCDDE v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x1000000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v13 & 0x8000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
    goto LABEL_18;
  }
  *(unsigned char *)(v5 + 754) = self->_isFeatureCandidate;
  *(_DWORD *)(v5 + 760) |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
  {
LABEL_19:
    *(unsigned char *)(v5 + 757) = self->_isSponsored;
    *(_DWORD *)(v5 + 760) |= 0x8000000u;
  }
LABEL_20:
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  iAdCategories = self->_iAdCategories;
  uint64_t v15 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v155 objects:v176 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v156;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v156 != v17) {
          objc_enumerationMutation(iAdCategories);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v155 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addIAdCategories:v19];
      }
      uint64_t v16 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v155 objects:v176 count:16];
    }
    while (v16);
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  iAdKeywords = self->_iAdKeywords;
  uint64_t v21 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v151 objects:v175 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v152;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v152 != v23) {
          objc_enumerationMutation(iAdKeywords);
        }
        v25 = (void *)[*(id *)(*((void *)&v151 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addIAdKeywords:v25];
      }
      uint64_t v22 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v151 objects:v175 count:16];
    }
    while (v22);
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  iAdSectionIDs = self->_iAdSectionIDs;
  uint64_t v27 = [(NSMutableArray *)iAdSectionIDs countByEnumeratingWithState:&v147 objects:v174 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v148;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v148 != v29) {
          objc_enumerationMutation(iAdSectionIDs);
        }
        v31 = (void *)[*(id *)(*((void *)&v147 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addIAdSectionIDs:v31];
      }
      uint64_t v28 = [(NSMutableArray *)iAdSectionIDs countByEnumeratingWithState:&v147 objects:v174 count:16];
    }
    while (v28);
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v33 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v143 objects:v173 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v144;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v144 != v35) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        uint64_t v37 = (void *)[*(id *)(*((void *)&v143 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v37];
      }
      uint64_t v34 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v143 objects:v173 count:16];
    }
    while (v34);
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v39 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v139 objects:v172 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v140;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v140 != v41) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        uint64_t v43 = (void *)[*(id *)(*((void *)&v139 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v43];
      }
      uint64_t v40 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v139 objects:v172 count:16];
    }
    while (v40);
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 753) = self->_isDraft;
    *(_DWORD *)(v5 + 760) |= 0x800000u;
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  relatedArticleIDs = self->_relatedArticleIDs;
  uint64_t v45 = [(NSMutableArray *)relatedArticleIDs countByEnumeratingWithState:&v135 objects:v171 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v136;
    do
    {
      for (juint64_t j = 0; jj != v46; ++jj)
      {
        if (*(void *)v136 != v47) {
          objc_enumerationMutation(relatedArticleIDs);
        }
        uint64_t v49 = (void *)[*(id *)(*((void *)&v135 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addRelatedArticleIDs:v49];
      }
      uint64_t v46 = [(NSMutableArray *)relatedArticleIDs countByEnumeratingWithState:&v135 objects:v171 count:16];
    }
    while (v46);
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  uint64_t v51 = [(NSMutableArray *)moreFromPublisherArticleIDs countByEnumeratingWithState:&v131 objects:v170 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v132;
    do
    {
      for (kuint64_t k = 0; kk != v52; ++kk)
      {
        if (*(void *)v132 != v53) {
          objc_enumerationMutation(moreFromPublisherArticleIDs);
        }
        uint64_t v55 = (void *)[*(id *)(*((void *)&v131 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addMoreFromPublisherArticleIDs:v55];
      }
      uint64_t v52 = [(NSMutableArray *)moreFromPublisherArticleIDs countByEnumeratingWithState:&v131 objects:v170 count:16];
    }
    while (v52);
  }

  *(void *)(v5 + 624) = [(NSString *)self->_thumbnailURL copyWithZone:a3];
  $A8E075B7A99374BF2C8CD763302FCDDE v56 = self->_has;
  if ((*(_WORD *)&v56 & 0x2000) != 0)
  {
    *(void *)(v5 + 112) = self->_thumbnailMetadata;
    *(_DWORD *)(v5 + 760) |= 0x2000u;
    $A8E075B7A99374BF2C8CD763302FCDDE v56 = self->_has;
  }
  if ((*(_WORD *)&v56 & 0x200) != 0)
  {
    *(void *)(v5 + 80) = self->_thumbnailFocalFrame;
    *(_DWORD *)(v5 + 760) |= 0x200u;
  }

  *(void *)(v5 + 592) = [(NSString *)self->_thumbnailMediumURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(void *)(v5 + 104) = self->_thumbnailMediumMetadata;
    *(_DWORD *)(v5 + 760) |= 0x1000u;
  }

  *(void *)(v5 + 576) = [(NSString *)self->_thumbnailHQURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(void *)(v5 + 88) = self->_thumbnailHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x400u;
  }

  *(void *)(v5 + 632) = [(NSString *)self->_thumbnailUltraHQURL copyWithZone:a3];
  $A8E075B7A99374BF2C8CD763302FCDDE v57 = self->_has;
  if ((*(_WORD *)&v57 & 0x4000) != 0)
  {
    *(void *)(v5 + 120) = self->_thumbnailUltraHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x4000u;
    $A8E075B7A99374BF2C8CD763302FCDDE v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x200000) == 0)
    {
LABEL_81:
      if ((*(unsigned char *)&v57 & 2) == 0) {
        goto LABEL_82;
      }
      goto LABEL_163;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x200000) == 0)
  {
    goto LABEL_81;
  }
  *(_DWORD *)(v5 + 544) = self->_storyType;
  *(_DWORD *)(v5 + 760) |= 0x200000u;
  $A8E075B7A99374BF2C8CD763302FCDDE v57 = self->_has;
  if ((*(unsigned char *)&v57 & 2) == 0)
  {
LABEL_82:
    if ((*(unsigned char *)&v57 & 0x40) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_163:
  *(void *)(v5 + 16) = self->_behaviorFlags;
  *(_DWORD *)(v5 + 760) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_83:
    *(void *)(v5 + 56) = self->_minimumNewsVersion;
    *(_DWORD *)(v5 + 760) |= 0x40u;
  }
LABEL_84:

  *(void *)(v5 + 248) = [(NSString *)self->_coverArt copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0)
  {
    *(unsigned char *)(v5 + 756) = self->_isPaid;
    *(_DWORD *)(v5 + 760) |= 0x4000000u;
  }

  *(void *)(v5 + 664) = [(NSString *)self->_thumbnailWidgetLQURL copyWithZone:a3];
  *(void *)(v5 + 656) = [(NSString *)self->_thumbnailWidgetLQTaggedURL copyWithZone:a3];
  if (*((unsigned char *)&self->_has + 2))
  {
    *(void *)(v5 + 136) = self->_thumbnailWidgetLQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x10000u;
  }

  *(void *)(v5 + 680) = [(NSString *)self->_thumbnailWidgetURL copyWithZone:a3];
  *(void *)(v5 + 672) = [(NSString *)self->_thumbnailWidgetTaggedURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(void *)(v5 + 144) = self->_thumbnailWidgetMetadata;
    *(_DWORD *)(v5 + 760) |= 0x20000u;
  }

  *(void *)(v5 + 648) = [(NSString *)self->_thumbnailWidgetHQURL copyWithZone:a3];
  *(void *)(v5 + 640) = [(NSString *)self->_thumbnailWidgetHQTaggedURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(void *)(v5 + 128) = self->_thumbnailWidgetHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x8000u;
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  topics = self->_topics;
  uint64_t v59 = [(NSMutableArray *)topics countByEnumeratingWithState:&v127 objects:v169 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v128;
    do
    {
      for (muint64_t m = 0; mm != v60; ++mm)
      {
        if (*(void *)v128 != v61) {
          objc_enumerationMutation(topics);
        }
        $A8E075B7A99374BF2C8CD763302FCDDE v63 = (void *)[*(id *)(*((void *)&v127 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addTopics:v63];
      }
      uint64_t v60 = [(NSMutableArray *)topics countByEnumeratingWithState:&v127 objects:v169 count:16];
    }
    while (v60);
  }

  *(void *)(v5 + 496) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts copyWithZone:a3];
  *(void *)(v5 + 312) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts copyWithZone:a3];

  *(void *)(v5 + 696) = [(NSString *)self->_titleCompact copyWithZone:a3];
  *(void *)(v5 + 712) = [(NSString *)self->_videoCallToActionTitle copyWithZone:a3];

  *(void *)(v5 + 720) = [(NSString *)self->_videoCallToActionURL copyWithZone:a3];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  uint64_t v65 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v123 objects:v168 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v124;
    do
    {
      for (nuint64_t n = 0; nn != v66; ++nn)
      {
        if (*(void *)v124 != v67) {
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        }
        v69 = (void *)[*(id *)(*((void *)&v123 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addPublisherSpecifiedArticleIDs:v69];
      }
      uint64_t v66 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v123 objects:v168 count:16];
    }
    while (v66);
  }

  *(void *)(v5 + 520) = [(NSString *)self->_stocksClusterID copyWithZone:a3];
  *(void *)(v5 + 528) = [(NSString *)self->_stocksMetadata copyWithZone:a3];

  *(void *)(v5 + 536) = [(NSString *)self->_stocksScores copyWithZone:a3];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  experimentalTitles = self->_experimentalTitles;
  uint64_t v71 = [(NSMutableArray *)experimentalTitles countByEnumeratingWithState:&v119 objects:v167 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v120;
    do
    {
      for (uint64_t i1 = 0; i1 != v72; ++i1)
      {
        if (*(void *)v120 != v73) {
          objc_enumerationMutation(experimentalTitles);
        }
        v75 = (void *)[*(id *)(*((void *)&v119 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addExperimentalTitles:v75];
      }
      uint64_t v72 = [(NSMutableArray *)experimentalTitles countByEnumeratingWithState:&v119 objects:v167 count:16];
    }
    while (v72);
  }

  *(void *)(v5 + 424) = [(NSString *)self->_parentIssueID copyWithZone:a3];
  *(void *)(v5 + 352) = [(NSString *)self->_language copyWithZone:a3];
  $A8E075B7A99374BF2C8CD763302FCDDE v76 = self->_has;
  if ((*(_DWORD *)&v76 & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 472) = self->_role;
    *(_DWORD *)(v5 + 760) |= 0x100000u;
    $A8E075B7A99374BF2C8CD763302FCDDE v76 = self->_has;
  }
  if ((*(unsigned char *)&v76 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_halfLifeMilliseconds;
    *(_DWORD *)(v5 + 760) |= 8u;
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  linkedArticleIDs = self->_linkedArticleIDs;
  uint64_t v78 = [(NSMutableArray *)linkedArticleIDs countByEnumeratingWithState:&v115 objects:v166 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v116;
    do
    {
      for (uint64_t i2 = 0; i2 != v79; ++i2)
      {
        if (*(void *)v116 != v80) {
          objc_enumerationMutation(linkedArticleIDs);
        }
        uint64_t v82 = (void *)[*(id *)(*((void *)&v115 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v5 addLinkedArticleIDs:v82];
      }
      uint64_t v79 = [(NSMutableArray *)linkedArticleIDs countByEnumeratingWithState:&v115 objects:v166 count:16];
    }
    while (v79);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  linkedIssueIDs = self->_linkedIssueIDs;
  uint64_t v84 = [(NSMutableArray *)linkedIssueIDs countByEnumeratingWithState:&v111 objects:v165 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v112;
    do
    {
      for (uint64_t i3 = 0; i3 != v85; ++i3)
      {
        if (*(void *)v112 != v86) {
          objc_enumerationMutation(linkedIssueIDs);
        }
        long long v88 = (void *)[*(id *)(*((void *)&v111 + 1) + 8 * i3) copyWithZone:a3];
        [(id)v5 addLinkedIssueIDs:v88];
      }
      uint64_t v85 = [(NSMutableArray *)linkedIssueIDs countByEnumeratingWithState:&v111 objects:v165 count:16];
    }
    while (v85);
  }
  $A8E075B7A99374BF2C8CD763302FCDDE v89 = self->_has;
  if ((*(_DWORD *)&v89 & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 755) = self->_isIssueOnly;
    *(_DWORD *)(v5 + 760) |= 0x2000000u;
    $A8E075B7A99374BF2C8CD763302FCDDE v89 = self->_has;
  }
  if ((*(unsigned char *)&v89 & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_bodyTextLength;
    *(_DWORD *)(v5 + 760) |= 4u;
  }

  *(void *)(v5 + 400) = [(NSString *)self->_narrativeTrackMetadata copyWithZone:a3];
  *(void *)(v5 + 392) = [(NSString *)self->_narrativeTrackFullURL copyWithZone:a3];

  *(void *)(v5 + 408) = [(NSString *)self->_narrativeTrackSampleURL copyWithZone:a3];
  *(void *)(v5 + 416) = [(NSString *)self->_narrativeTrackTextRanges copyWithZone:a3];

  *(void *)(v5 + 208) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats copyWithZone:a3];
  *(void *)(v5 + 320) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats copyWithZone:a3];

  *(void *)(v5 + 360) = [(NSString *)self->_layeredCover copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_layeredCoverAspectRatio;
    *(_DWORD *)(v5 + 760) |= 0x20u;
  }

  *(void *)(v5 + 608) = [(NSString *)self->_thumbnailPrimaryColor copyWithZone:a3];
  *(void *)(v5 + 568) = [(NSString *)self->_thumbnailBackgroundColor copyWithZone:a3];

  *(void *)(v5 + 616) = [(NSString *)self->_thumbnailTextColor copyWithZone:a3];
  *(void *)(v5 + 560) = [(NSString *)self->_thumbnailAccentColor copyWithZone:a3];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  authors = self->_authors;
  uint64_t v91 = [(NSMutableArray *)authors countByEnumeratingWithState:&v107 objects:v164 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v108;
    do
    {
      for (uint64_t i4 = 0; i4 != v92; ++i4)
      {
        if (*(void *)v108 != v93) {
          objc_enumerationMutation(authors);
        }
        long long v95 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * i4) copyWithZone:a3];
        [(id)v5 addAuthors:v95];
      }
      uint64_t v92 = [(NSMutableArray *)authors countByEnumeratingWithState:&v107 objects:v164 count:16];
    }
    while (v92);
  }

  *(void *)(v5 + 216) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_halfLifeMillisecondsOverride;
    *(_DWORD *)(v5 + 760) |= 0x10u;
  }

  *(void *)(v5 + 728) = [(NSString *)self->_videoStillImageURL copyWithZone:a3];
  *(void *)(v5 + 272) = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *)self->_expirationData copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *(double *)(v5 + 152) = self->_videoDuration;
    *(_DWORD *)(v5 + 760) |= 0x40000u;
  }

  *(void *)(v5 + 480) = [(NSString *)self->_routeURL copyWithZone:a3];
  *(void *)(v5 + 304) = [(NSData *)self->_float16TitleEncoding copyWithZone:a3];

  *(void *)(v5 + 296) = [(NSData *)self->_float16FullBodyEncoding copyWithZone:a3];
  if (*((unsigned char *)&self->_has + 1))
  {
    *(void *)(v5 + 72) = self->_schemaFlags;
    *(_DWORD *)(v5 + 760) |= 0x100u;
  }

  *(void *)(v5 + 176) = [(NSString *)self->_articleRecirculationConfigurationURL copyWithZone:a3];
  *(void *)(v5 + 600) = [(NSData *)self->_thumbnailPerceptualHash copyWithZone:a3];

  *(void *)(v5 + 736) = [(NSString *)self->_videoType copyWithZone:a3];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  sportsEventIDs = self->_sportsEventIDs;
  uint64_t v97 = [(NSMutableArray *)sportsEventIDs countByEnumeratingWithState:&v103 objects:v163 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v104;
    do
    {
      for (uint64_t i5 = 0; i5 != v98; ++i5)
      {
        if (*(void *)v104 != v99) {
          objc_enumerationMutation(sportsEventIDs);
        }
        long long v101 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * i5) copyWithZone:a3];
        [(id)v5 addSportsEventIDs:v101];
      }
      uint64_t v98 = [(NSMutableArray *)sportsEventIDs countByEnumeratingWithState:&v103 objects:v163 count:16];
    }
    while (v98);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 24)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      referencedArticleID = self->_referencedArticleID;
      if (!((unint64_t)referencedArticleID | *((void *)a3 + 57))
        || (int v5 = -[NSString isEqual:](referencedArticleID, "isEqual:")) != 0)
      {
        title = self->_title;
        if (!((unint64_t)title | *((void *)a3 + 86)) || (int v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
        {
          subtitle = self->_subtitle;
          if (!((unint64_t)subtitle | *((void *)a3 + 69))
            || (int v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
          {
            sourceChannelTagID = self->_sourceChannelTagID;
            if (!((unint64_t)sourceChannelTagID | *((void *)a3 + 63))
              || (int v5 = -[NSString isEqual:](sourceChannelTagID, "isEqual:")) != 0)
            {
              publishDate = self->_publishDate;
              if (!((unint64_t)publishDate | *((void *)a3 + 55))
                || (int v5 = -[NTPBDate isEqual:](publishDate, "isEqual:")) != 0)
              {
                $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
                int v13 = *((_DWORD *)a3 + 190);
                if ((*(unsigned char *)&has & 0x80) != 0)
                {
                  if ((v13 & 0x80) == 0 || self->_publisherArticleVersion != *((void *)a3 + 8)) {
                    goto LABEL_75;
                  }
                }
                else if ((v13 & 0x80) != 0)
                {
                  goto LABEL_75;
                }
                if (*(unsigned char *)&has)
                {
                  if ((v13 & 1) == 0 || self->_backendArticleVersion != *((void *)a3 + 1)) {
                    goto LABEL_75;
                  }
                }
                else if (v13)
                {
                  goto LABEL_75;
                }
                thumbnailLQURL = self->_thumbnailLQURL;
                if ((unint64_t)thumbnailLQURL | *((void *)a3 + 73))
                {
                  int v5 = -[NSString isEqual:](thumbnailLQURL, "isEqual:");
                  if (!v5) {
                    return v5;
                  }
                  $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
                }
                int v15 = *((_DWORD *)a3 + 190);
                if ((*(_WORD *)&has & 0x800) != 0)
                {
                  if ((v15 & 0x800) == 0 || self->_thumbnailLQMetadata != *((void *)a3 + 12)) {
                    goto LABEL_75;
                  }
                }
                else if ((v15 & 0x800) != 0)
                {
                  goto LABEL_75;
                }
                primaryAudience = self->_primaryAudience;
                if (!((unint64_t)primaryAudience | *((void *)a3 + 54))
                  || (int v5 = -[NSString isEqual:](primaryAudience, "isEqual:")) != 0)
                {
                  excerptURL = self->_excerptURL;
                  if (!((unint64_t)excerptURL | *((void *)a3 + 32))
                    || (int v5 = -[NSString isEqual:](excerptURL, "isEqual:")) != 0)
                  {
                    shortExcerpt = self->_shortExcerpt;
                    if (!((unint64_t)shortExcerpt | *((void *)a3 + 61))
                      || (int v5 = -[NSString isEqual:](shortExcerpt, "isEqual:")) != 0)
                    {
                      accessoryText = self->_accessoryText;
                      if (!((unint64_t)accessoryText | *((void *)a3 + 20))
                        || (int v5 = -[NSString isEqual:](accessoryText, "isEqual:")) != 0)
                      {
                        contentURL = self->_contentURL;
                        if (!((unint64_t)contentURL | *((void *)a3 + 30))
                          || (int v5 = -[NSString isEqual:](contentURL, "isEqual:")) != 0)
                        {
                          int v21 = *((_DWORD *)a3 + 190);
                          if ((*((unsigned char *)&self->_has + 2) & 8) != 0)
                          {
                            if ((v21 & 0x80000) == 0 || self->_contentType != *((_DWORD *)a3 + 58)) {
                              goto LABEL_75;
                            }
                          }
                          else if ((v21 & 0x80000) != 0)
                          {
                            goto LABEL_75;
                          }
                          clusterID = self->_clusterID;
                          if (!((unint64_t)clusterID | *((void *)a3 + 28))
                            || (int v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
                          {
                            flintDocumentURL = self->_flintDocumentURL;
                            if (!((unint64_t)flintDocumentURL | *((void *)a3 + 35))
                              || (int v5 = -[NSString isEqual:](flintDocumentURL, "isEqual:")) != 0)
                            {
                              flintFontResourceIDs = self->_flintFontResourceIDs;
                              if (!((unint64_t)flintFontResourceIDs | *((void *)a3 + 36))
                                || (int v5 = -[NSMutableArray isEqual:](flintFontResourceIDs, "isEqual:")) != 0)
                              {
                                videoURL = self->_videoURL;
                                if (!((unint64_t)videoURL | *((void *)a3 + 93))
                                  || (int v5 = -[NSString isEqual:](videoURL, "isEqual:")) != 0)
                                {
                                  $A8E075B7A99374BF2C8CD763302FCDDE v26 = self->_has;
                                  int v27 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v26 & 0x400000) != 0)
                                  {
                                    if ((v27 & 0x400000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isBundlePaid)
                                    {
                                      if (!*((unsigned char *)a3 + 752)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 752))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x400000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v26 & 0x1000000) != 0)
                                  {
                                    if ((v27 & 0x1000000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isFeatureCandidate)
                                    {
                                      if (!*((unsigned char *)a3 + 754)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 754))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x1000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v26 & 0x8000000) != 0)
                                  {
                                    if ((v27 & 0x8000000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isSponsored)
                                    {
                                      if (!*((unsigned char *)a3 + 757)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 757))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x8000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  iAdCategories = self->_iAdCategories;
                                  if ((unint64_t)iAdCategories | *((void *)a3 + 41))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](iAdCategories, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  iAdKeywords = self->_iAdKeywords;
                                  if ((unint64_t)iAdKeywords | *((void *)a3 + 42))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](iAdKeywords, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  iAdSectionIDs = self->_iAdSectionIDs;
                                  if ((unint64_t)iAdSectionIDs | *((void *)a3 + 43))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](iAdSectionIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  blockedStorefrontIDs = self->_blockedStorefrontIDs;
                                  if ((unint64_t)blockedStorefrontIDs | *((void *)a3 + 25))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  allowedStorefrontIDs = self->_allowedStorefrontIDs;
                                  if ((unint64_t)allowedStorefrontIDs | *((void *)a3 + 21))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v33 = *((_DWORD *)a3 + 190);
                                  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
                                  {
                                    if ((v33 & 0x800000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isDraft)
                                    {
                                      if (!*((unsigned char *)a3 + 753)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 753))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v33 & 0x800000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  relatedArticleIDs = self->_relatedArticleIDs;
                                  if ((unint64_t)relatedArticleIDs | *((void *)a3 + 58))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](relatedArticleIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
                                  if ((unint64_t)moreFromPublisherArticleIDs | *((void *)a3 + 48))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](moreFromPublisherArticleIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailURL = self->_thumbnailURL;
                                  if ((unint64_t)thumbnailURL | *((void *)a3 + 78))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  $A8E075B7A99374BF2C8CD763302FCDDE v37 = self->_has;
                                  int v38 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x2000) != 0)
                                  {
                                    if ((v38 & 0x2000) == 0 || self->_thumbnailMetadata != *((void *)a3 + 14)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v38 & 0x2000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_WORD *)&v37 & 0x200) != 0)
                                  {
                                    if ((v38 & 0x200) == 0 || self->_thumbnailFocalFrame != *((void *)a3 + 10)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v38 & 0x200) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailMediumURL = self->_thumbnailMediumURL;
                                  if ((unint64_t)thumbnailMediumURL | *((void *)a3 + 74))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailMediumURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                    $A8E075B7A99374BF2C8CD763302FCDDE v37 = self->_has;
                                  }
                                  int v40 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x1000) != 0)
                                  {
                                    if ((v40 & 0x1000) == 0 || self->_thumbnailMediumMetadata != *((void *)a3 + 13)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v40 & 0x1000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailHQURL = self->_thumbnailHQURL;
                                  if ((unint64_t)thumbnailHQURL | *((void *)a3 + 72))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailHQURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                    $A8E075B7A99374BF2C8CD763302FCDDE v37 = self->_has;
                                  }
                                  int v42 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x400) != 0)
                                  {
                                    if ((v42 & 0x400) == 0 || self->_thumbnailHQMetadata != *((void *)a3 + 11)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v42 & 0x400) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailUltraHQURL = self->_thumbnailUltraHQURL;
                                  if ((unint64_t)thumbnailUltraHQURL | *((void *)a3 + 79))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailUltraHQURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                    $A8E075B7A99374BF2C8CD763302FCDDE v37 = self->_has;
                                  }
                                  int v44 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x4000) != 0)
                                  {
                                    if ((v44 & 0x4000) == 0 || self->_thumbnailUltraHQMetadata != *((void *)a3 + 15)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v44 & 0x4000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v37 & 0x200000) != 0)
                                  {
                                    if ((v44 & 0x200000) == 0 || self->_storyType != *((_DWORD *)a3 + 136)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v44 & 0x200000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(unsigned char *)&v37 & 2) != 0)
                                  {
                                    if ((v44 & 2) == 0 || self->_behaviorFlags != *((void *)a3 + 2)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v44 & 2) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(unsigned char *)&v37 & 0x40) != 0)
                                  {
                                    if ((v44 & 0x40) == 0 || self->_minimumNewsVersion != *((void *)a3 + 7)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v44 & 0x40) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  coverArt = self->_coverArt;
                                  if ((unint64_t)coverArt | *((void *)a3 + 31))
                                  {
                                    int v5 = -[NSString isEqual:](coverArt, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                    $A8E075B7A99374BF2C8CD763302FCDDE v37 = self->_has;
                                  }
                                  int v46 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v37 & 0x4000000) != 0)
                                  {
                                    if ((v46 & 0x4000000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isPaid)
                                    {
                                      if (!*((unsigned char *)a3 + 756)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 756))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v46 & 0x4000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetLQURL = self->_thumbnailWidgetLQURL;
                                  if ((unint64_t)thumbnailWidgetLQURL | *((void *)a3 + 83))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetLQURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailWidgetLQTaggedURL = self->_thumbnailWidgetLQTaggedURL;
                                  if ((unint64_t)thumbnailWidgetLQTaggedURL | *((void *)a3 + 82))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetLQTaggedURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v49 = *((_DWORD *)a3 + 190);
                                  if (*((unsigned char *)&self->_has + 2))
                                  {
                                    if ((v49 & 0x10000) == 0
                                      || self->_thumbnailWidgetLQMetadata != *((void *)a3 + 17))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v49 & 0x10000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetURL = self->_thumbnailWidgetURL;
                                  if ((unint64_t)thumbnailWidgetURL | *((void *)a3 + 85))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailWidgetTaggedURL = self->_thumbnailWidgetTaggedURL;
                                  if ((unint64_t)thumbnailWidgetTaggedURL | *((void *)a3 + 84))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetTaggedURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v52 = *((_DWORD *)a3 + 190);
                                  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
                                  {
                                    if ((v52 & 0x20000) == 0 || self->_thumbnailWidgetMetadata != *((void *)a3 + 18)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v52 & 0x20000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetHQURL = self->_thumbnailWidgetHQURL;
                                  if ((unint64_t)thumbnailWidgetHQURL | *((void *)a3 + 81))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetHQURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailWidgetHQTaggedURL = self->_thumbnailWidgetHQTaggedURL;
                                  if ((unint64_t)thumbnailWidgetHQTaggedURL | *((void *)a3 + 80))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailWidgetHQTaggedURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v55 = *((_DWORD *)a3 + 190);
                                  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
                                  {
                                    if ((v55 & 0x8000) == 0 || self->_thumbnailWidgetHQMetadata != *((void *)a3 + 16)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v55 & 0x8000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  topics = self->_topics;
                                  if ((unint64_t)topics | *((void *)a3 + 88))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](topics, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  sourceChannelCohorts = self->_sourceChannelCohorts;
                                  if ((unint64_t)sourceChannelCohorts | *((void *)a3 + 62))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  globalCohorts = self->_globalCohorts;
                                  if ((unint64_t)globalCohorts | *((void *)a3 + 39))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  titleCompact = self->_titleCompact;
                                  if ((unint64_t)titleCompact | *((void *)a3 + 87))
                                  {
                                    int v5 = -[NSString isEqual:](titleCompact, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  videoCallToActionTitle = self->_videoCallToActionTitle;
                                  if ((unint64_t)videoCallToActionTitle | *((void *)a3 + 89))
                                  {
                                    int v5 = -[NSString isEqual:](videoCallToActionTitle, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  videoCallToActionURL = self->_videoCallToActionURL;
                                  if ((unint64_t)videoCallToActionURL | *((void *)a3 + 90))
                                  {
                                    int v5 = -[NSString isEqual:](videoCallToActionURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
                                  if ((unint64_t)publisherSpecifiedArticleIDs | *((void *)a3 + 56))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](publisherSpecifiedArticleIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  stocksClusterID = self->_stocksClusterID;
                                  if ((unint64_t)stocksClusterID | *((void *)a3 + 65))
                                  {
                                    int v5 = -[NSString isEqual:](stocksClusterID, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  stocksMetadata = self->_stocksMetadata;
                                  if ((unint64_t)stocksMetadata | *((void *)a3 + 66))
                                  {
                                    int v5 = -[NSString isEqual:](stocksMetadata, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  stocksScores = self->_stocksScores;
                                  if ((unint64_t)stocksScores | *((void *)a3 + 67))
                                  {
                                    int v5 = -[NSString isEqual:](stocksScores, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  experimentalTitles = self->_experimentalTitles;
                                  if ((unint64_t)experimentalTitles | *((void *)a3 + 33))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](experimentalTitles, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  parentIssueID = self->_parentIssueID;
                                  if ((unint64_t)parentIssueID | *((void *)a3 + 53))
                                  {
                                    int v5 = -[NSString isEqual:](parentIssueID, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  language = self->_language;
                                  if ((unint64_t)language | *((void *)a3 + 44))
                                  {
                                    int v5 = -[NSString isEqual:](language, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  $A8E075B7A99374BF2C8CD763302FCDDE v69 = self->_has;
                                  int v70 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v69 & 0x100000) != 0)
                                  {
                                    if ((v70 & 0x100000) == 0 || self->_role != *((_DWORD *)a3 + 118)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v70 & 0x100000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(unsigned char *)&v69 & 8) != 0)
                                  {
                                    if ((v70 & 8) == 0 || self->_halfLifeMilliseconds != *((void *)a3 + 4)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v70 & 8) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  linkedArticleIDs = self->_linkedArticleIDs;
                                  if ((unint64_t)linkedArticleIDs | *((void *)a3 + 46))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](linkedArticleIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  linkedIssueIDs = self->_linkedIssueIDs;
                                  if ((unint64_t)linkedIssueIDs | *((void *)a3 + 47))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](linkedIssueIDs, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  $A8E075B7A99374BF2C8CD763302FCDDE v73 = self->_has;
                                  int v74 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v73 & 0x2000000) != 0)
                                  {
                                    if ((v74 & 0x2000000) == 0) {
                                      goto LABEL_75;
                                    }
                                    if (self->_isIssueOnly)
                                    {
                                      if (!*((unsigned char *)a3 + 755)) {
                                        goto LABEL_75;
                                      }
                                    }
                                    else if (*((unsigned char *)a3 + 755))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v74 & 0x2000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(unsigned char *)&v73 & 4) != 0)
                                  {
                                    if ((v74 & 4) == 0 || self->_bodyTextLength != *((void *)a3 + 3)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v74 & 4) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  narrativeTrackMetadata = self->_narrativeTrackMetadata;
                                  if ((unint64_t)narrativeTrackMetadata | *((void *)a3 + 50))
                                  {
                                    int v5 = -[NSString isEqual:](narrativeTrackMetadata, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  narrativeTrackFullURL = self->_narrativeTrackFullURL;
                                  if ((unint64_t)narrativeTrackFullURL | *((void *)a3 + 49))
                                  {
                                    int v5 = -[NSString isEqual:](narrativeTrackFullURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  narrativeTrackSampleURL = self->_narrativeTrackSampleURL;
                                  if ((unint64_t)narrativeTrackSampleURL | *((void *)a3 + 51))
                                  {
                                    int v5 = -[NSString isEqual:](narrativeTrackSampleURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  narrativeTrackTextRanges = self->_narrativeTrackTextRanges;
                                  if ((unint64_t)narrativeTrackTextRanges | *((void *)a3 + 52))
                                  {
                                    int v5 = -[NSString isEqual:](narrativeTrackTextRanges, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  channelConversionStats = self->_channelConversionStats;
                                  if ((unint64_t)channelConversionStats | *((void *)a3 + 26))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  globalConversionStats = self->_globalConversionStats;
                                  if ((unint64_t)globalConversionStats | *((void *)a3 + 40))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  layeredCover = self->_layeredCover;
                                  if ((unint64_t)layeredCover | *((void *)a3 + 45))
                                  {
                                    int v5 = -[NSString isEqual:](layeredCover, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v82 = *((_DWORD *)a3 + 190);
                                  if ((*(unsigned char *)&self->_has & 0x20) != 0)
                                  {
                                    if ((v82 & 0x20) == 0 || self->_layeredCoverAspectRatio != *((double *)a3 + 6)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v82 & 0x20) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailPrimaryColor = self->_thumbnailPrimaryColor;
                                  if ((unint64_t)thumbnailPrimaryColor | *((void *)a3 + 76))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailPrimaryColor, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailBackgroundColor = self->_thumbnailBackgroundColor;
                                  if ((unint64_t)thumbnailBackgroundColor | *((void *)a3 + 71))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailBackgroundColor, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailTextColor = self->_thumbnailTextColor;
                                  if ((unint64_t)thumbnailTextColor | *((void *)a3 + 77))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailTextColor, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  thumbnailAccentColor = self->_thumbnailAccentColor;
                                  if ((unint64_t)thumbnailAccentColor | *((void *)a3 + 70))
                                  {
                                    int v5 = -[NSString isEqual:](thumbnailAccentColor, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  authors = self->_authors;
                                  if ((unint64_t)authors | *((void *)a3 + 23))
                                  {
                                    int v5 = -[NSMutableArray isEqual:](authors, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  channelTagMetadata = self->_channelTagMetadata;
                                  if ((unint64_t)channelTagMetadata | *((void *)a3 + 27))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](channelTagMetadata, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v89 = *((_DWORD *)a3 + 190);
                                  if ((*(unsigned char *)&self->_has & 0x10) != 0)
                                  {
                                    if ((v89 & 0x10) == 0 || self->_halfLifeMillisecondsOverride != *((void *)a3 + 5)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v89 & 0x10) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  videoStillImageURL = self->_videoStillImageURL;
                                  if ((unint64_t)videoStillImageURL | *((void *)a3 + 91))
                                  {
                                    int v5 = -[NSString isEqual:](videoStillImageURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  expirationData = self->_expirationData;
                                  if ((unint64_t)expirationData | *((void *)a3 + 34))
                                  {
                                    int v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration isEqual:](expirationData, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v92 = *((_DWORD *)a3 + 190);
                                  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
                                  {
                                    if ((v92 & 0x40000) == 0 || self->_videoDuration != *((double *)a3 + 19)) {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v92 & 0x40000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  routeURL = self->_routeURL;
                                  if ((unint64_t)routeURL | *((void *)a3 + 60))
                                  {
                                    int v5 = -[NSString isEqual:](routeURL, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  float16TitleEncoding = self->_float16TitleEncoding;
                                  if ((unint64_t)float16TitleEncoding | *((void *)a3 + 38))
                                  {
                                    int v5 = -[NSData isEqual:](float16TitleEncoding, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  float16FullBodyEncoding = self->_float16FullBodyEncoding;
                                  if ((unint64_t)float16FullBodyEncoding | *((void *)a3 + 37))
                                  {
                                    int v5 = -[NSData isEqual:](float16FullBodyEncoding, "isEqual:");
                                    if (!v5) {
                                      return v5;
                                    }
                                  }
                                  int v96 = *((_DWORD *)a3 + 190);
                                  if (*((unsigned char *)&self->_has + 1))
                                  {
                                    if ((v96 & 0x100) == 0 || self->_schemaFlags != *((void *)a3 + 9)) {
                                      goto LABEL_75;
                                    }
                                    goto LABEL_301;
                                  }
                                  if ((v96 & 0x100) == 0)
                                  {
LABEL_301:
                                    articleRecirculationConfigurationURL = self->_articleRecirculationConfigurationURL;
                                    if (!((unint64_t)articleRecirculationConfigurationURL | *((void *)a3 + 22))
                                      || (int v5 = -[NSString isEqual:](articleRecirculationConfigurationURL, "isEqual:")) != 0)
                                    {
                                      thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
                                      if (!((unint64_t)thumbnailPerceptualHash | *((void *)a3 + 75))
                                        || (int v5 = -[NSData isEqual:](thumbnailPerceptualHash, "isEqual:")) != 0)
                                      {
                                        videoType = self->_videoType;
                                        if (!((unint64_t)videoType | *((void *)a3 + 92))
                                          || (int v5 = -[NSString isEqual:](videoType, "isEqual:")) != 0)
                                        {
                                          sportsEventIDs = self->_sportsEventIDs;
                                          if ((unint64_t)sportsEventIDs | *((void *)a3 + 64))
                                          {
                                            LOBYTE(v5) = -[NSMutableArray isEqual:](sportsEventIDs, "isEqual:");
                                          }
                                          else
                                          {
                                            LOBYTE(v5) = 1;
                                          }
                                        }
                                      }
                                    }
                                    return v5;
                                  }
LABEL_75:
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
  unint64_t v116 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v115 = [(NSString *)self->_referencedArticleID hash];
  NSUInteger v114 = [(NSString *)self->_title hash];
  NSUInteger v113 = [(NSString *)self->_subtitle hash];
  NSUInteger v112 = [(NSString *)self->_sourceChannelTagID hash];
  unint64_t v111 = [(NTPBDate *)self->_publishDate hash];
  $A8E075B7A99374BF2C8CD763302FCDDE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t v110 = 2654435761 * self->_publisherArticleVersion;
    if (*(unsigned char *)&has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v110 = 0;
    if (*(unsigned char *)&has)
    {
LABEL_3:
      uint64_t v109 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_6;
    }
  }
  uint64_t v109 = 0;
LABEL_6:
  NSUInteger v108 = [(NSString *)self->_thumbnailLQURL hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    uint64_t v107 = 2654435761 * self->_thumbnailLQMetadata;
  }
  else {
    uint64_t v107 = 0;
  }
  NSUInteger v106 = [(NSString *)self->_primaryAudience hash];
  NSUInteger v105 = [(NSString *)self->_excerptURL hash];
  NSUInteger v104 = [(NSString *)self->_shortExcerpt hash];
  NSUInteger v103 = [(NSString *)self->_accessoryText hash];
  NSUInteger v102 = [(NSString *)self->_contentURL hash];
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    uint64_t v101 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v101 = 0;
  }
  NSUInteger v100 = [(NSString *)self->_clusterID hash];
  NSUInteger v99 = [(NSString *)self->_flintDocumentURL hash];
  uint64_t v98 = [(NSMutableArray *)self->_flintFontResourceIDs hash];
  NSUInteger v97 = [(NSString *)self->_videoURL hash];
  $A8E075B7A99374BF2C8CD763302FCDDE v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x400000) == 0)
  {
    uint64_t v96 = 0;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v95 = 0;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v96 = 2654435761 * self->_isBundlePaid;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v95 = 2654435761 * self->_isFeatureCandidate;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_15:
    uint64_t v94 = 2654435761 * self->_isSponsored;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v94 = 0;
LABEL_19:
  uint64_t v93 = [(NSMutableArray *)self->_iAdCategories hash];
  uint64_t v92 = [(NSMutableArray *)self->_iAdKeywords hash];
  uint64_t v91 = [(NSMutableArray *)self->_iAdSectionIDs hash];
  uint64_t v90 = [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  uint64_t v89 = [(NSMutableArray *)self->_allowedStorefrontIDs hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v88 = 2654435761 * self->_isDraft;
  }
  else {
    uint64_t v88 = 0;
  }
  uint64_t v87 = [(NSMutableArray *)self->_relatedArticleIDs hash];
  uint64_t v86 = [(NSMutableArray *)self->_moreFromPublisherArticleIDs hash];
  NSUInteger v85 = [(NSString *)self->_thumbnailURL hash];
  $A8E075B7A99374BF2C8CD763302FCDDE v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
    uint64_t v84 = 2654435761 * self->_thumbnailMetadata;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v84 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_24:
      uint64_t v83 = 2654435761 * self->_thumbnailFocalFrame;
      goto LABEL_27;
    }
  }
  uint64_t v83 = 0;
LABEL_27:
  NSUInteger v82 = [(NSString *)self->_thumbnailMediumURL hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v81 = 2654435761 * self->_thumbnailMediumMetadata;
  }
  else {
    uint64_t v81 = 0;
  }
  NSUInteger v80 = [(NSString *)self->_thumbnailHQURL hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    uint64_t v79 = 2654435761 * self->_thumbnailHQMetadata;
  }
  else {
    uint64_t v79 = 0;
  }
  NSUInteger v78 = [(NSString *)self->_thumbnailUltraHQURL hash];
  $A8E075B7A99374BF2C8CD763302FCDDE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    uint64_t v77 = 2654435761 * self->_thumbnailUltraHQMetadata;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
    {
LABEL_35:
      uint64_t v76 = 2654435761 * self->_storyType;
      if ((*(unsigned char *)&v6 & 2) != 0) {
        goto LABEL_36;
      }
LABEL_40:
      uint64_t v75 = 0;
      if ((*(unsigned char *)&v6 & 0x40) != 0) {
        goto LABEL_37;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v77 = 0;
    if ((*(_DWORD *)&v6 & 0x200000) != 0) {
      goto LABEL_35;
    }
  }
  uint64_t v76 = 0;
  if ((*(unsigned char *)&v6 & 2) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v75 = 2654435761 * self->_behaviorFlags;
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
LABEL_37:
    uint64_t v74 = 2654435761 * self->_minimumNewsVersion;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v74 = 0;
LABEL_42:
  NSUInteger v73 = [(NSString *)self->_coverArt hash];
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0) {
    uint64_t v72 = 2654435761 * self->_isPaid;
  }
  else {
    uint64_t v72 = 0;
  }
  NSUInteger v71 = [(NSString *)self->_thumbnailWidgetLQURL hash];
  NSUInteger v70 = [(NSString *)self->_thumbnailWidgetLQTaggedURL hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v69 = 2654435761 * self->_thumbnailWidgetLQMetadata;
  }
  else {
    uint64_t v69 = 0;
  }
  NSUInteger v68 = [(NSString *)self->_thumbnailWidgetURL hash];
  NSUInteger v67 = [(NSString *)self->_thumbnailWidgetTaggedURL hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v66 = 2654435761 * self->_thumbnailWidgetMetadata;
  }
  else {
    uint64_t v66 = 0;
  }
  NSUInteger v65 = [(NSString *)self->_thumbnailWidgetHQURL hash];
  NSUInteger v64 = [(NSString *)self->_thumbnailWidgetHQTaggedURL hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v63 = 2654435761 * self->_thumbnailWidgetHQMetadata;
  }
  else {
    uint64_t v63 = 0;
  }
  uint64_t v62 = [(NSMutableArray *)self->_topics hash];
  unint64_t v61 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_sourceChannelCohorts hash];
  unint64_t v60 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)self->_globalCohorts hash];
  NSUInteger v59 = [(NSString *)self->_titleCompact hash];
  NSUInteger v58 = [(NSString *)self->_videoCallToActionTitle hash];
  NSUInteger v57 = [(NSString *)self->_videoCallToActionURL hash];
  uint64_t v56 = [(NSMutableArray *)self->_publisherSpecifiedArticleIDs hash];
  NSUInteger v55 = [(NSString *)self->_stocksClusterID hash];
  NSUInteger v54 = [(NSString *)self->_stocksMetadata hash];
  NSUInteger v53 = [(NSString *)self->_stocksScores hash];
  uint64_t v52 = [(NSMutableArray *)self->_experimentalTitles hash];
  NSUInteger v51 = [(NSString *)self->_parentIssueID hash];
  NSUInteger v50 = [(NSString *)self->_language hash];
  $A8E075B7A99374BF2C8CD763302FCDDE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) != 0)
  {
    uint64_t v49 = 2654435761 * self->_role;
    if ((*(unsigned char *)&v7 & 8) != 0) {
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((*(unsigned char *)&v7 & 8) != 0)
    {
LABEL_56:
      unint64_t v48 = 2654435761u * self->_halfLifeMilliseconds;
      goto LABEL_59;
    }
  }
  unint64_t v48 = 0;
LABEL_59:
  uint64_t v47 = [(NSMutableArray *)self->_linkedArticleIDs hash];
  uint64_t v46 = [(NSMutableArray *)self->_linkedIssueIDs hash];
  $A8E075B7A99374BF2C8CD763302FCDDE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) != 0)
  {
    uint64_t v45 = 2654435761 * self->_isIssueOnly;
    if ((*(unsigned char *)&v8 & 4) != 0) {
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v45 = 0;
    if ((*(unsigned char *)&v8 & 4) != 0)
    {
LABEL_61:
      uint64_t v44 = 2654435761 * self->_bodyTextLength;
      goto LABEL_64;
    }
  }
  uint64_t v44 = 0;
LABEL_64:
  NSUInteger v43 = [(NSString *)self->_narrativeTrackMetadata hash];
  NSUInteger v42 = [(NSString *)self->_narrativeTrackFullURL hash];
  NSUInteger v41 = [(NSString *)self->_narrativeTrackSampleURL hash];
  NSUInteger v40 = [(NSString *)self->_narrativeTrackTextRanges hash];
  unint64_t v39 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_channelConversionStats hash];
  unint64_t v38 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)self->_globalConversionStats hash];
  NSUInteger v37 = [(NSString *)self->_layeredCover hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    double layeredCoverAspectRatio = self->_layeredCoverAspectRatio;
    double v11 = -layeredCoverAspectRatio;
    if (layeredCoverAspectRatio >= 0.0) {
      double v11 = self->_layeredCoverAspectRatio;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v36 = [(NSString *)self->_thumbnailPrimaryColor hash];
  NSUInteger v35 = [(NSString *)self->_thumbnailBackgroundColor hash];
  NSUInteger v34 = [(NSString *)self->_thumbnailTextColor hash];
  NSUInteger v33 = [(NSString *)self->_thumbnailAccentColor hash];
  uint64_t v32 = [(NSMutableArray *)self->_authors hash];
  unint64_t v31 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    unint64_t v14 = 2654435761u * self->_halfLifeMillisecondsOverride;
  }
  else {
    unint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_videoStillImageURL hash];
  unint64_t v16 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *)self->_expirationData hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    videoDuratiouint64_t n = self->_videoDuration;
    double v19 = -videoDuration;
    if (videoDuration >= 0.0) {
      double v19 = self->_videoDuration;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_routeURL hash];
  uint64_t v23 = [(NSData *)self->_float16TitleEncoding hash];
  uint64_t v24 = [(NSData *)self->_float16FullBodyEncoding hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v25 = 2654435761 * self->_schemaFlags;
  }
  else {
    uint64_t v25 = 0;
  }
  NSUInteger v26 = v115 ^ v116 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v9 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v14 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23;
  NSUInteger v27 = v24 ^ v25 ^ [(NSString *)self->_articleRecirculationConfigurationURL hash];
  uint64_t v28 = v27 ^ [(NSData *)self->_thumbnailPerceptualHash hash];
  NSUInteger v29 = v28 ^ [(NSString *)self->_videoType hash];
  return v26 ^ v29 ^ [(NSMutableArray *)self->_sportsEventIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 24);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBArticleRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 57)) {
    -[NTPBArticleRecord setReferencedArticleID:](self, "setReferencedArticleID:");
  }
  if (*((void *)a3 + 86)) {
    -[NTPBArticleRecord setTitle:](self, "setTitle:");
  }
  if (*((void *)a3 + 69)) {
    -[NTPBArticleRecord setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)a3 + 63)) {
    -[NTPBArticleRecord setSourceChannelTagID:](self, "setSourceChannelTagID:");
  }
  publishDate = self->_publishDate;
  uint64_t v8 = *((void *)a3 + 55);
  if (publishDate)
  {
    if (v8) {
      -[NTPBDate mergeFrom:](publishDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBArticleRecord setPublishDate:](self, "setPublishDate:");
  }
  int v9 = *((_DWORD *)a3 + 190);
  if ((v9 & 0x80) != 0)
  {
    self->_publisherArticleVersiouint64_t n = *((void *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    int v9 = *((_DWORD *)a3 + 190);
  }
  if (v9)
  {
    self->_backendArticleVersiouint64_t n = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 73)) {
    -[NTPBArticleRecord setThumbnailLQURL:](self, "setThumbnailLQURL:");
  }
  if ((*((unsigned char *)a3 + 761) & 8) != 0)
  {
    self->_thumbnailLQMetadata = *((void *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  if (*((void *)a3 + 54)) {
    -[NTPBArticleRecord setPrimaryAudience:](self, "setPrimaryAudience:");
  }
  if (*((void *)a3 + 32)) {
    -[NTPBArticleRecord setExcerptURL:](self, "setExcerptURL:");
  }
  if (*((void *)a3 + 61)) {
    -[NTPBArticleRecord setShortExcerpt:](self, "setShortExcerpt:");
  }
  if (*((void *)a3 + 20)) {
    -[NTPBArticleRecord setAccessoryText:](self, "setAccessoryText:");
  }
  if (*((void *)a3 + 30)) {
    -[NTPBArticleRecord setContentURL:](self, "setContentURL:");
  }
  if ((*((unsigned char *)a3 + 762) & 8) != 0)
  {
    self->_contentType = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((void *)a3 + 28)) {
    -[NTPBArticleRecord setClusterID:](self, "setClusterID:");
  }
  if (*((void *)a3 + 35)) {
    -[NTPBArticleRecord setFlintDocumentURL:](self, "setFlintDocumentURL:");
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 36);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v158 objects:v176 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v159;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v159 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBArticleRecord *)self addFlintFontResourceIDs:*(void *)(*((void *)&v158 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v158 objects:v176 count:16];
    }
    while (v12);
  }
  if (*((void *)a3 + 93)) {
    -[NTPBArticleRecord setVideoURL:](self, "setVideoURL:");
  }
  int v15 = *((_DWORD *)a3 + 190);
  if ((v15 & 0x400000) != 0)
  {
    self->_isBundlePaid = *((unsigned char *)a3 + 752);
    *(_DWORD *)&self->_has |= 0x400000u;
    int v15 = *((_DWORD *)a3 + 190);
    if ((v15 & 0x1000000) == 0)
    {
LABEL_54:
      if ((v15 & 0x8000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((v15 & 0x1000000) == 0)
  {
    goto LABEL_54;
  }
  self->_isFeatureCandidate = *((unsigned char *)a3 + 754);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)a3 + 190) & 0x8000000) != 0)
  {
LABEL_55:
    self->_isSponsored = *((unsigned char *)a3 + 757);
    *(_DWORD *)&self->_has |= 0x8000000u;
  }
LABEL_56:
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  unint64_t v16 = (void *)*((void *)a3 + 41);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v154 objects:v175 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v155;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v155 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NTPBArticleRecord *)self addIAdCategories:*(void *)(*((void *)&v154 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v154 objects:v175 count:16];
    }
    while (v18);
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  double v21 = (void *)*((void *)a3 + 42);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v150 objects:v174 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v151;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v151 != v24) {
          objc_enumerationMutation(v21);
        }
        [(NTPBArticleRecord *)self addIAdKeywords:*(void *)(*((void *)&v150 + 1) + 8 * k)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v150 objects:v174 count:16];
    }
    while (v23);
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  NSUInteger v26 = (void *)*((void *)a3 + 43);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v146 objects:v173 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v147;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v147 != v29) {
          objc_enumerationMutation(v26);
        }
        [(NTPBArticleRecord *)self addIAdSectionIDs:*(void *)(*((void *)&v146 + 1) + 8 * m)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v146 objects:v173 count:16];
    }
    while (v28);
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  unint64_t v31 = (void *)*((void *)a3 + 25);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v142 objects:v172 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v143;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v143 != v34) {
          objc_enumerationMutation(v31);
        }
        [(NTPBArticleRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v142 + 1) + 8 * n)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v142 objects:v172 count:16];
    }
    while (v33);
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  NSUInteger v36 = (void *)*((void *)a3 + 21);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v138 objects:v171 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v139;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v139 != v39) {
          objc_enumerationMutation(v36);
        }
        [(NTPBArticleRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v138 + 1) + 8 * ii)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v138 objects:v171 count:16];
    }
    while (v38);
  }
  if ((*((unsigned char *)a3 + 762) & 0x80) != 0)
  {
    self->_isDraft = *((unsigned char *)a3 + 753);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  NSUInteger v41 = (void *)*((void *)a3 + 58);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v134 objects:v170 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v135;
    do
    {
      for (juint64_t j = 0; jj != v43; ++jj)
      {
        if (*(void *)v135 != v44) {
          objc_enumerationMutation(v41);
        }
        [(NTPBArticleRecord *)self addRelatedArticleIDs:*(void *)(*((void *)&v134 + 1) + 8 * jj)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v134 objects:v170 count:16];
    }
    while (v43);
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v46 = (void *)*((void *)a3 + 48);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v130 objects:v169 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v131;
    do
    {
      for (kuint64_t k = 0; kk != v48; ++kk)
      {
        if (*(void *)v131 != v49) {
          objc_enumerationMutation(v46);
        }
        [(NTPBArticleRecord *)self addMoreFromPublisherArticleIDs:*(void *)(*((void *)&v130 + 1) + 8 * kk)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v130 objects:v169 count:16];
    }
    while (v48);
  }
  if (*((void *)a3 + 78)) {
    -[NTPBArticleRecord setThumbnailURL:](self, "setThumbnailURL:");
  }
  int v51 = *((_DWORD *)a3 + 190);
  if ((v51 & 0x2000) != 0)
  {
    self->_thumbnailMetadata = *((void *)a3 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v51 = *((_DWORD *)a3 + 190);
  }
  if ((v51 & 0x200) != 0)
  {
    self->_thumbnailFocalFrame = *((void *)a3 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)a3 + 74)) {
    -[NTPBArticleRecord setThumbnailMediumURL:](self, "setThumbnailMediumURL:");
  }
  if ((*((unsigned char *)a3 + 761) & 0x10) != 0)
  {
    self->_thumbnailMediumMetadata = *((void *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)a3 + 72)) {
    -[NTPBArticleRecord setThumbnailHQURL:](self, "setThumbnailHQURL:");
  }
  if ((*((unsigned char *)a3 + 761) & 4) != 0)
  {
    self->_thumbnailHQMetadata = *((void *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)a3 + 79)) {
    -[NTPBArticleRecord setThumbnailUltraHQURL:](self, "setThumbnailUltraHQURL:");
  }
  int v52 = *((_DWORD *)a3 + 190);
  if ((v52 & 0x4000) != 0)
  {
    self->_thumbnailUltraHQMetadata = *((void *)a3 + 15);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v52 = *((_DWORD *)a3 + 190);
    if ((v52 & 0x200000) == 0)
    {
LABEL_125:
      if ((v52 & 2) == 0) {
        goto LABEL_126;
      }
      goto LABEL_165;
    }
  }
  else if ((v52 & 0x200000) == 0)
  {
    goto LABEL_125;
  }
  self->_storyType = *((_DWORD *)a3 + 136);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v52 = *((_DWORD *)a3 + 190);
  if ((v52 & 2) == 0)
  {
LABEL_126:
    if ((v52 & 0x40) == 0) {
      goto LABEL_128;
    }
    goto LABEL_127;
  }
LABEL_165:
  self->_behaviorFlags = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 190) & 0x40) != 0)
  {
LABEL_127:
    self->_minimumNewsVersiouint64_t n = *((void *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_128:
  if (*((void *)a3 + 31)) {
    -[NTPBArticleRecord setCoverArt:](self, "setCoverArt:");
  }
  if ((*((unsigned char *)a3 + 763) & 4) != 0)
  {
    self->_isPaid = *((unsigned char *)a3 + 756);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
  if (*((void *)a3 + 83)) {
    -[NTPBArticleRecord setThumbnailWidgetLQURL:](self, "setThumbnailWidgetLQURL:");
  }
  if (*((void *)a3 + 82)) {
    -[NTPBArticleRecord setThumbnailWidgetLQTaggedURL:](self, "setThumbnailWidgetLQTaggedURL:");
  }
  if (*((unsigned char *)a3 + 762))
  {
    self->_thumbnailWidgetLQMetadata = *((void *)a3 + 17);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((void *)a3 + 85)) {
    -[NTPBArticleRecord setThumbnailWidgetURL:](self, "setThumbnailWidgetURL:");
  }
  if (*((void *)a3 + 84)) {
    -[NTPBArticleRecord setThumbnailWidgetTaggedURL:](self, "setThumbnailWidgetTaggedURL:");
  }
  if ((*((unsigned char *)a3 + 762) & 2) != 0)
  {
    self->_thumbnailWidgetMetadata = *((void *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)a3 + 81)) {
    -[NTPBArticleRecord setThumbnailWidgetHQURL:](self, "setThumbnailWidgetHQURL:");
  }
  if (*((void *)a3 + 80)) {
    -[NTPBArticleRecord setThumbnailWidgetHQTaggedURL:](self, "setThumbnailWidgetHQTaggedURL:");
  }
  if ((*((unsigned char *)a3 + 761) & 0x80) != 0)
  {
    self->_thumbnailWidgetHQMetadata = *((void *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  NSUInteger v53 = (void *)*((void *)a3 + 88);
  uint64_t v54 = [v53 countByEnumeratingWithState:&v126 objects:v168 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v127;
    do
    {
      for (muint64_t m = 0; mm != v55; ++mm)
      {
        if (*(void *)v127 != v56) {
          objc_enumerationMutation(v53);
        }
        [(NTPBArticleRecord *)self addTopics:*(void *)(*((void *)&v126 + 1) + 8 * mm)];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v126 objects:v168 count:16];
    }
    while (v55);
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  uint64_t v59 = *((void *)a3 + 62);
  if (sourceChannelCohorts)
  {
    if (v59) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[NTPBArticleRecord setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  globalCohorts = self->_globalCohorts;
  uint64_t v61 = *((void *)a3 + 39);
  if (globalCohorts)
  {
    if (v61) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
    }
  }
  else if (v61)
  {
    -[NTPBArticleRecord setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  if (*((void *)a3 + 87)) {
    -[NTPBArticleRecord setTitleCompact:](self, "setTitleCompact:");
  }
  if (*((void *)a3 + 89)) {
    -[NTPBArticleRecord setVideoCallToActionTitle:](self, "setVideoCallToActionTitle:");
  }
  if (*((void *)a3 + 90)) {
    -[NTPBArticleRecord setVideoCallToActionURL:](self, "setVideoCallToActionURL:");
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v62 = (void *)*((void *)a3 + 56);
  uint64_t v63 = [v62 countByEnumeratingWithState:&v122 objects:v167 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v123;
    do
    {
      for (nuint64_t n = 0; nn != v64; ++nn)
      {
        if (*(void *)v123 != v65) {
          objc_enumerationMutation(v62);
        }
        [(NTPBArticleRecord *)self addPublisherSpecifiedArticleIDs:*(void *)(*((void *)&v122 + 1) + 8 * nn)];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v122 objects:v167 count:16];
    }
    while (v64);
  }
  if (*((void *)a3 + 65)) {
    -[NTPBArticleRecord setStocksClusterID:](self, "setStocksClusterID:");
  }
  if (*((void *)a3 + 66)) {
    -[NTPBArticleRecord setStocksMetadata:](self, "setStocksMetadata:");
  }
  if (*((void *)a3 + 67)) {
    -[NTPBArticleRecord setStocksScores:](self, "setStocksScores:");
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  NSUInteger v67 = (void *)*((void *)a3 + 33);
  uint64_t v68 = [v67 countByEnumeratingWithState:&v118 objects:v166 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v119;
    do
    {
      for (uint64_t i1 = 0; i1 != v69; ++i1)
      {
        if (*(void *)v119 != v70) {
          objc_enumerationMutation(v67);
        }
        [(NTPBArticleRecord *)self addExperimentalTitles:*(void *)(*((void *)&v118 + 1) + 8 * i1)];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v118 objects:v166 count:16];
    }
    while (v69);
  }
  if (*((void *)a3 + 53)) {
    -[NTPBArticleRecord setParentIssueID:](self, "setParentIssueID:");
  }
  if (*((void *)a3 + 44)) {
    -[NTPBArticleRecord setLanguage:](self, "setLanguage:");
  }
  int v72 = *((_DWORD *)a3 + 190);
  if ((v72 & 0x100000) != 0)
  {
    self->_role = *((_DWORD *)a3 + 118);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v72 = *((_DWORD *)a3 + 190);
  }
  if ((v72 & 8) != 0)
  {
    self->_halfLifeMilliseconds = *((void *)a3 + 4);
    *(_DWORD *)&self->_has |= 8u;
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  NSUInteger v73 = (void *)*((void *)a3 + 46);
  uint64_t v74 = [v73 countByEnumeratingWithState:&v114 objects:v165 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v115;
    do
    {
      for (uint64_t i2 = 0; i2 != v75; ++i2)
      {
        if (*(void *)v115 != v76) {
          objc_enumerationMutation(v73);
        }
        [(NTPBArticleRecord *)self addLinkedArticleIDs:*(void *)(*((void *)&v114 + 1) + 8 * i2)];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v114 objects:v165 count:16];
    }
    while (v75);
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  NSUInteger v78 = (void *)*((void *)a3 + 47);
  uint64_t v79 = [v78 countByEnumeratingWithState:&v110 objects:v164 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v111;
    do
    {
      for (uint64_t i3 = 0; i3 != v80; ++i3)
      {
        if (*(void *)v111 != v81) {
          objc_enumerationMutation(v78);
        }
        [(NTPBArticleRecord *)self addLinkedIssueIDs:*(void *)(*((void *)&v110 + 1) + 8 * i3)];
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v110 objects:v164 count:16];
    }
    while (v80);
  }
  int v83 = *((_DWORD *)a3 + 190);
  if ((v83 & 0x2000000) != 0)
  {
    self->_isIssueOnly = *((unsigned char *)a3 + 755);
    *(_DWORD *)&self->_has |= 0x2000000u;
    int v83 = *((_DWORD *)a3 + 190);
  }
  if ((v83 & 4) != 0)
  {
    self->_bodyTextLength = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 50)) {
    -[NTPBArticleRecord setNarrativeTrackMetadata:](self, "setNarrativeTrackMetadata:");
  }
  if (*((void *)a3 + 49)) {
    -[NTPBArticleRecord setNarrativeTrackFullURL:](self, "setNarrativeTrackFullURL:");
  }
  if (*((void *)a3 + 51)) {
    -[NTPBArticleRecord setNarrativeTrackSampleURL:](self, "setNarrativeTrackSampleURL:");
  }
  if (*((void *)a3 + 52)) {
    -[NTPBArticleRecord setNarrativeTrackTextRanges:](self, "setNarrativeTrackTextRanges:");
  }
  channelConversionStats = self->_channelConversionStats;
  uint64_t v85 = *((void *)a3 + 26);
  if (channelConversionStats)
  {
    if (v85) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
    }
  }
  else if (v85)
  {
    -[NTPBArticleRecord setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  uint64_t v87 = *((void *)a3 + 40);
  if (globalConversionStats)
  {
    if (v87) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
    }
  }
  else if (v87)
  {
    -[NTPBArticleRecord setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
  if (*((void *)a3 + 45)) {
    -[NTPBArticleRecord setLayeredCover:](self, "setLayeredCover:");
  }
  if ((*((unsigned char *)a3 + 760) & 0x20) != 0)
  {
    self->_double layeredCoverAspectRatio = *((double *)a3 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)a3 + 76)) {
    -[NTPBArticleRecord setThumbnailPrimaryColor:](self, "setThumbnailPrimaryColor:");
  }
  if (*((void *)a3 + 71)) {
    -[NTPBArticleRecord setThumbnailBackgroundColor:](self, "setThumbnailBackgroundColor:");
  }
  if (*((void *)a3 + 77)) {
    -[NTPBArticleRecord setThumbnailTextColor:](self, "setThumbnailTextColor:");
  }
  if (*((void *)a3 + 70)) {
    -[NTPBArticleRecord setThumbnailAccentColor:](self, "setThumbnailAccentColor:");
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v88 = (void *)*((void *)a3 + 23);
  uint64_t v89 = [v88 countByEnumeratingWithState:&v106 objects:v163 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = *(void *)v107;
    do
    {
      for (uint64_t i4 = 0; i4 != v90; ++i4)
      {
        if (*(void *)v107 != v91) {
          objc_enumerationMutation(v88);
        }
        [(NTPBArticleRecord *)self addAuthors:*(void *)(*((void *)&v106 + 1) + 8 * i4)];
      }
      uint64_t v90 = [v88 countByEnumeratingWithState:&v106 objects:v163 count:16];
    }
    while (v90);
  }
  channelTagMetadata = self->_channelTagMetadata;
  uint64_t v94 = *((void *)a3 + 27);
  if (channelTagMetadata)
  {
    if (v94) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](channelTagMetadata, "mergeFrom:");
    }
  }
  else if (v94)
  {
    -[NTPBArticleRecord setChannelTagMetadata:](self, "setChannelTagMetadata:");
  }
  if ((*((unsigned char *)a3 + 760) & 0x10) != 0)
  {
    self->_halfLifeMillisecondsOverride = *((void *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 91)) {
    -[NTPBArticleRecord setVideoStillImageURL:](self, "setVideoStillImageURL:");
  }
  expirationData = self->_expirationData;
  uint64_t v96 = *((void *)a3 + 34);
  if (expirationData)
  {
    if (v96) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration mergeFrom:](expirationData, "mergeFrom:");
    }
  }
  else if (v96)
  {
    -[NTPBArticleRecord setExpirationData:](self, "setExpirationData:");
  }
  if ((*((unsigned char *)a3 + 762) & 4) != 0)
  {
    self->_videoDuratiouint64_t n = *((double *)a3 + 19);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((void *)a3 + 60)) {
    [(NTPBArticleRecord *)self setRouteURL:"setRouteURL:"];
  }
  if (*((void *)a3 + 38)) {
    -[NTPBArticleRecord setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:");
  }
  if (*((void *)a3 + 37)) {
    -[NTPBArticleRecord setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:");
  }
  if (*((unsigned char *)a3 + 761))
  {
    self->_schemaFlags = *((void *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 22)) {
    -[NTPBArticleRecord setArticleRecirculationConfigurationURL:](self, "setArticleRecirculationConfigurationURL:");
  }
  if (*((void *)a3 + 75)) {
    -[NTPBArticleRecord setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:");
  }
  if (*((void *)a3 + 92)) {
    -[NTPBArticleRecord setVideoType:](self, "setVideoType:");
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  NSUInteger v97 = (void *)*((void *)a3 + 64);
  uint64_t v98 = [v97 countByEnumeratingWithState:&v102 objects:v162 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v103;
    do
    {
      for (uint64_t i5 = 0; i5 != v99; ++i5)
      {
        if (*(void *)v103 != v100) {
          objc_enumerationMutation(v97);
        }
        [(NTPBArticleRecord *)self addSportsEventIDs:*(void *)(*((void *)&v102 + 1) + 8 * i5)];
      }
      uint64_t v99 = [v97 countByEnumeratingWithState:&v102 objects:v162 count:16];
    }
    while (v99);
  }
}

- (void)setBase:(id)a3
{
}

- (void)setReferencedArticleID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void)setSourceChannelTagID:(id)a3
{
}

- (void)setPublishDate:(id)a3
{
}

- (void)setThumbnailLQURL:(id)a3
{
}

- (void)setPrimaryAudience:(id)a3
{
}

- (NSString)excerptURL
{
  return self->_excerptURL;
}

- (void)setExcerptURL:(id)a3
{
}

- (void)setShortExcerpt:(id)a3
{
}

- (void)setAccessoryText:(id)a3
{
}

- (void)setContentURL:(id)a3
{
}

- (void)setClusterID:(id)a3
{
}

- (void)setFlintDocumentURL:(id)a3
{
}

- (void)setFlintFontResourceIDs:(id)a3
{
}

- (void)setVideoURL:(id)a3
{
}

- (void)setIAdCategories:(id)a3
{
}

- (void)setIAdKeywords:(id)a3
{
}

- (void)setIAdSectionIDs:(id)a3
{
}

- (void)setBlockedStorefrontIDs:(id)a3
{
}

- (void)setAllowedStorefrontIDs:(id)a3
{
}

- (void)setRelatedArticleIDs:(id)a3
{
}

- (void)setMoreFromPublisherArticleIDs:(id)a3
{
}

- (void)setThumbnailURL:(id)a3
{
}

- (void)setThumbnailMediumURL:(id)a3
{
}

- (void)setThumbnailHQURL:(id)a3
{
}

- (void)setThumbnailUltraHQURL:(id)a3
{
}

- (void)setCoverArt:(id)a3
{
}

- (void)setThumbnailWidgetLQURL:(id)a3
{
}

- (NSString)thumbnailWidgetLQTaggedURL
{
  return self->_thumbnailWidgetLQTaggedURL;
}

- (void)setThumbnailWidgetLQTaggedURL:(id)a3
{
}

- (void)setThumbnailWidgetURL:(id)a3
{
}

- (NSString)thumbnailWidgetTaggedURL
{
  return self->_thumbnailWidgetTaggedURL;
}

- (void)setThumbnailWidgetTaggedURL:(id)a3
{
}

- (void)setThumbnailWidgetHQURL:(id)a3
{
}

- (NSString)thumbnailWidgetHQTaggedURL
{
  return self->_thumbnailWidgetHQTaggedURL;
}

- (void)setThumbnailWidgetHQTaggedURL:(id)a3
{
}

- (void)setTopics:(id)a3
{
}

- (void)setSourceChannelCohorts:(id)a3
{
}

- (void)setGlobalCohorts:(id)a3
{
}

- (void)setTitleCompact:(id)a3
{
}

- (void)setVideoCallToActionTitle:(id)a3
{
}

- (void)setVideoCallToActionURL:(id)a3
{
}

- (NSMutableArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (void)setPublisherSpecifiedArticleIDs:(id)a3
{
}

- (NSString)stocksClusterID
{
  return self->_stocksClusterID;
}

- (void)setStocksClusterID:(id)a3
{
}

- (NSString)stocksMetadata
{
  return self->_stocksMetadata;
}

- (void)setStocksMetadata:(id)a3
{
}

- (NSString)stocksScores
{
  return self->_stocksScores;
}

- (void)setStocksScores:(id)a3
{
}

- (void)setExperimentalTitles:(id)a3
{
}

- (void)setParentIssueID:(id)a3
{
}

- (void)setLanguage:(id)a3
{
}

- (void)setLinkedArticleIDs:(id)a3
{
}

- (void)setLinkedIssueIDs:(id)a3
{
}

- (void)setNarrativeTrackMetadata:(id)a3
{
}

- (void)setNarrativeTrackFullURL:(id)a3
{
}

- (void)setNarrativeTrackSampleURL:(id)a3
{
}

- (void)setNarrativeTrackTextRanges:(id)a3
{
}

- (void)setChannelConversionStats:(id)a3
{
}

- (void)setGlobalConversionStats:(id)a3
{
}

- (void)setLayeredCover:(id)a3
{
}

- (void)setThumbnailPrimaryColor:(id)a3
{
}

- (void)setThumbnailBackgroundColor:(id)a3
{
}

- (void)setThumbnailTextColor:(id)a3
{
}

- (void)setThumbnailAccentColor:(id)a3
{
}

- (void)setAuthors:(id)a3
{
}

- (void)setChannelTagMetadata:(id)a3
{
}

- (void)setVideoStillImageURL:(id)a3
{
}

- (void)setExpirationData:(id)a3
{
}

- (void)setRouteURL:(id)a3
{
}

- (void)setFloat16TitleEncoding:(id)a3
{
}

- (void)setFloat16FullBodyEncoding:(id)a3
{
}

- (void)setArticleRecirculationConfigurationURL:(id)a3
{
}

- (void)setThumbnailPerceptualHash:(id)a3
{
}

- (void)setVideoType:(id)a3
{
}

- (void)setSportsEventIDs:(id)a3
{
}

@end