@interface SCWebHeadline
- (BOOL)aiGenerated;
- (BOOL)canBePurchased;
- (BOOL)disablePrerollAds;
- (BOOL)disableTapToChannel;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasThumbnail;
- (BOOL)hasVideo;
- (BOOL)hasVideoStillImage;
- (BOOL)isANF;
- (BOOL)isBlockedExplicitContent;
- (BOOL)isBoundToContext;
- (BOOL)isCoread;
- (BOOL)isDeleted;
- (BOOL)isDisplayingAsNativeAd;
- (BOOL)isDraft;
- (BOOL)isExplicitContent;
- (BOOL)isFeatureCandidate;
- (BOOL)isFromBlockedStorefront;
- (BOOL)isFullTrackAvailableToAll;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isHiddenFromFeeds;
- (BOOL)isPaid;
- (BOOL)isPressRelease;
- (BOOL)isSponsored;
- (BOOL)isTopStory;
- (BOOL)needsRapidUpdates;
- (BOOL)showMinimalChrome;
- (BOOL)showPublisherLogo;
- (BOOL)showSubscriptionRequiredText;
- (BOOL)usesImageOnTopLayout;
- (CGRect)thumbnailFocalFrame;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (FCAssetHandle)videoStillImage;
- (FCChannelProviding)sourceChannel;
- (FCCoverArt)coverArt;
- (FCFeedPersonalizedItemScoreProfile)scoreProfile;
- (FCHeadlineThumbnail)thumbnail;
- (FCHeadlineThumbnail)thumbnailHQ;
- (FCHeadlineThumbnail)thumbnailLQ;
- (FCHeadlineThumbnail)thumbnailMedium;
- (FCHeadlineThumbnail)thumbnailUltraHQ;
- (FCHeadlineThumbnail)thumbnailWidget;
- (FCHeadlineThumbnail)thumbnailWidgetHQ;
- (FCHeadlineThumbnail)thumbnailWidgetLQ;
- (FCNativeAdProviding)associatedAd;
- (FCTopStoriesStyleConfiguration)storyStyle;
- (NSArray)allowedStorefrontIDs;
- (NSArray)authors;
- (NSArray)blockedStorefrontIDs;
- (NSArray)iAdCategories;
- (NSArray)iAdKeywords;
- (NSArray)iAdSectionIDs;
- (NSArray)moreFromPublisherArticleIDs;
- (NSArray)narrators;
- (NSArray)publisherSpecifiedArticleIDs;
- (NSArray)relatedArticleIDs;
- (NSArray)sportsEventIDs;
- (NSArray)surfacedByArticleListIDs;
- (NSArray)topicIDs;
- (NSArray)topics;
- (NSDate)displayDate;
- (NSDate)lastFetchedDate;
- (NSDate)lastModifiedDate;
- (NSDate)publishDate;
- (NSString)accessoryText;
- (NSString)excerpt;
- (NSString)feedID;
- (NSString)identifier;
- (NSString)language;
- (NSString)localDraftPath;
- (NSString)nativeAdCampaignData;
- (NSString)primaryAudience;
- (NSString)publisherID;
- (NSString)referencedArticleID;
- (NSString)shortExcerpt;
- (NSString)sourceChannelID;
- (NSString)sourceFeedID;
- (NSString)sourceName;
- (NSString)sponsoredBy;
- (NSString)surfacedByBinID;
- (NSString)surfacedByChannelID;
- (NSString)surfacedBySectionID;
- (NSString)surfacedByTopicID;
- (NSString)title;
- (NSString)titleCompact;
- (NSString)videoCallToActionTitle;
- (NSString)videoType;
- (NSURL)contentURL;
- (NSURL)routeURL;
- (NSURL)videoCallToActionURL;
- (NSURL)videoURL;
- (SCWebHeadline)initWithURL:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 sourceName:(id)a7;
- (double)globalScore;
- (double)globalUserFeedback;
- (double)tileProminenceScore;
- (double)videoDuration;
- (id)articleRecirculationConfigJSON;
- (id)endOfArticleTopicIDs;
- (id)surfacedByTagIDs;
- (id)thumbnailWidgetHQTagged;
- (id)thumbnailWidgetLQTagged;
- (id)thumbnailWidgetTagged;
- (id)versionIdentifier;
- (int64_t)backendArticleVersion;
- (int64_t)feedElementType;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)articleContentType;
- (unint64_t)contentType;
- (unint64_t)feedHalfLifeMilliseconds;
- (unint64_t)feedOrder;
- (unint64_t)halfLife;
- (unint64_t)order;
- (unint64_t)publishDateMilliseconds;
- (unint64_t)storyType;
- (unint64_t)topStoryType;
- (void)addSurfacedByArticleListID:(id)a3;
- (void)aiGenerated;
- (void)allowedStorefrontIDs;
- (void)applyConditionalScore:(double)a3;
- (void)articleContentType;
- (void)articleRecirculationConfigJSON;
- (void)associatedAd;
- (void)backendArticleVersion;
- (void)blockedStorefrontIDs;
- (void)canBePurchased;
- (void)coverArt;
- (void)disablePrerollAds;
- (void)disableTapToChannel;
- (void)displayDate;
- (void)endOfArticleTopicIDs;
- (void)enumerateTopicConversionStatsWithBlock:(id)a3;
- (void)feedHalfLifeMilliseconds;
- (void)feedID;
- (void)feedOrder;
- (void)globalCohorts;
- (void)globalConversionStats;
- (void)globalScore;
- (void)globalUserFeedback;
- (void)halfLife;
- (void)hasGlobalUserFeedback;
- (void)hasVideoStillImage;
- (void)iAdCategories;
- (void)iAdKeywords;
- (void)iAdSectionIDs;
- (void)isBlockedExplicitContent;
- (void)isBoundToContext;
- (void)isCoread;
- (void)isDeleted;
- (void)isDraft;
- (void)isExplicitContent;
- (void)isFeatureCandidate;
- (void)isFromBlockedStorefront;
- (void)isFullTrackAvailableToAll;
- (void)isHiddenFromAutoFavorites;
- (void)isHiddenFromFeeds;
- (void)isSponsored;
- (void)isTopStory;
- (void)lastFetchedDate;
- (void)lastModifiedDate;
- (void)localDraftPath;
- (void)markAsEvergreen;
- (void)minimumNewsVersion;
- (void)moreFromPublisherArticleIDs;
- (void)narrators;
- (void)nativeAdCampaignData;
- (void)needsRapidUpdates;
- (void)order;
- (void)primaryAudience;
- (void)publishDateMilliseconds;
- (void)publisherCohorts;
- (void)publisherConversionStats;
- (void)publisherID;
- (void)publisherSpecifiedArticleIDs;
- (void)publisherTagMetadata;
- (void)referencedArticleID;
- (void)relatedArticleIDs;
- (void)scoreProfile;
- (void)showMinimalChrome;
- (void)showPublisherLogo;
- (void)sourceChannelID;
- (void)sourceFeedID;
- (void)sponsoredBy;
- (void)sportsEventIDs;
- (void)surfacedByArticleListIDs;
- (void)surfacedByBinID;
- (void)surfacedByChannelID;
- (void)surfacedBySectionID;
- (void)surfacedByTagIDs;
- (void)surfacedByTopicID;
- (void)thumbnailFocalFrame;
- (void)tileProminenceScore;
- (void)titleCompact;
- (void)topStoryType;
- (void)topicIDs;
- (void)topics;
- (void)usesImageOnTopLayout;
- (void)videoCallToActionTitle;
- (void)videoCallToActionURL;
- (void)videoDuration;
- (void)videoStillImage;
- (void)videoType;
- (void)videoURL;
@end

@implementation SCWebHeadline

- (SCWebHeadline)initWithURL:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 sourceName:(id)a7
{
  id v13 = a3;
  id v21 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SCWebHeadline;
  v17 = [(SCWebHeadline *)&v22 init];
  if (v17)
  {
    uint64_t v18 = [v13 absoluteString];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_contentURL, a3);
    objc_storeStrong((id *)&v17->_title, a4);
    objc_storeStrong((id *)&v17->_shortExcerpt, a5);
    objc_storeStrong((id *)&v17->_publishDate, a6);
    objc_storeStrong((id *)&v17->_sourceName, a7);
  }

  return v17;
}

- (unint64_t)contentType
{
  return 1;
}

- (BOOL)hasThumbnail
{
  return 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (int64_t)feedElementType
{
  return 0;
}

- (id)versionIdentifier
{
  return @"1";
}

- (FCChannelProviding)sourceChannel
{
  return 0;
}

- (BOOL)isPaid
{
  return 0;
}

- (BOOL)isPressRelease
{
  return 0;
}

- (NSString)language
{
  return 0;
}

- (BOOL)isANF
{
  return 0;
}

- (NSString)accessoryText
{
  return 0;
}

- (unint64_t)storyType
{
  return 0;
}

- (BOOL)isDisplayingAsNativeAd
{
  return 0;
}

- (BOOL)showSubscriptionRequiredText
{
  return 0;
}

- (FCTopStoriesStyleConfiguration)storyStyle
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnail
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidgetLQ
{
  return 0;
}

- (id)thumbnailWidgetLQTagged
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidget
{
  return 0;
}

- (id)thumbnailWidgetTagged
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidgetHQ
{
  return 0;
}

- (id)thumbnailWidgetHQTagged
{
  return 0;
}

- (NSURL)routeURL
{
  return 0;
}

- (NSArray)authors
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int64_t)publisherArticleVersion
{
  return 0;
}

- (NSString)excerpt
{
  return (NSString *)&stru_1F087FC88;
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline enumerateTopicConversionStatsWithBlock:]();
  }
}

- (void)addSurfacedByArticleListID:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline addSurfacedByArticleListID:]();
  }
}

- (void)applyConditionalScore:(double)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline applyConditionalScore:]();
  }
}

- (void)markAsEvergreen
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s method"];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline markAsEvergreen]", v6, 2u);
}

- (NSDate)displayDate
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline displayDate]();
  }
  return 0;
}

- (BOOL)usesImageOnTopLayout
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline usesImageOnTopLayout]();
  }
  return 0;
}

- (unint64_t)topStoryType
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline topStoryType]();
  }
  return 0;
}

- (BOOL)isTopStory
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isTopStory]();
  }
  return 0;
}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline scoreProfile]();
  }
  return 0;
}

- (double)tileProminenceScore
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline tileProminenceScore]();
  }
  return 0.0;
}

- (NSString)surfacedByBinID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedByBinID]();
  }
  return 0;
}

- (NSString)surfacedByTopicID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedByTopicID]();
  }
  return 0;
}

- (NSString)surfacedByChannelID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedByChannelID]();
  }
  return 0;
}

- (NSString)surfacedBySectionID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedBySectionID]();
  }
  return 0;
}

- (id)surfacedByTagIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedByTagIDs]();
  }
  return 0;
}

- (NSString)referencedArticleID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline referencedArticleID]();
  }
  return 0;
}

- (NSString)primaryAudience
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline primaryAudience]();
  }
  return 0;
}

- (NSString)titleCompact
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline titleCompact]();
  }
  return 0;
}

- (int64_t)backendArticleVersion
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline backendArticleVersion]();
  }
  return 0;
}

- (CGRect)thumbnailFocalFrame
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline thumbnailFocalFrame]();
  }
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSDate)lastModifiedDate
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline lastModifiedDate]();
  }
  return 0;
}

- (NSDate)lastFetchedDate
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline lastFetchedDate]();
  }
  return 0;
}

- (NSArray)topics
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline topics]();
  }
  return 0;
}

- (NSArray)topicIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline topicIDs]();
  }
  return 0;
}

- (id)endOfArticleTopicIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline endOfArticleTopicIDs]();
  }
  return 0;
}

- (NSURL)videoURL
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoURL]();
  }
  return 0;
}

- (double)videoDuration
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoDuration]();
  }
  return 0.0;
}

- (BOOL)isFeatureCandidate
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isFeatureCandidate]();
  }
  return 0;
}

- (BOOL)isSponsored
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isSponsored]();
  }
  return 0;
}

- (NSString)sponsoredBy
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline sponsoredBy]();
  }
  return 0;
}

- (NSArray)iAdCategories
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline iAdCategories]();
  }
  return 0;
}

- (NSArray)iAdKeywords
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline iAdKeywords]();
  }
  return 0;
}

- (NSArray)iAdSectionIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline iAdSectionIDs]();
  }
  return 0;
}

- (NSArray)blockedStorefrontIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline blockedStorefrontIDs]();
  }
  return 0;
}

- (NSArray)allowedStorefrontIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline allowedStorefrontIDs]();
  }
  return 0;
}

- (BOOL)isDeleted
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isDeleted]();
  }
  return 0;
}

- (BOOL)isDraft
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isDraft]();
  }
  return 0;
}

- (NSString)localDraftPath
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline localDraftPath]();
  }
  return 0;
}

- (NSArray)relatedArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline relatedArticleIDs]();
  }
  return 0;
}

- (NSArray)moreFromPublisherArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline moreFromPublisherArticleIDs]();
  }
  return 0;
}

- (int64_t)minimumNewsVersion
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline minimumNewsVersion]();
  }
  return 0;
}

- (FCCoverArt)coverArt
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline coverArt]();
  }
  return 0;
}

- (NSString)videoCallToActionTitle
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoCallToActionTitle]();
  }
  return 0;
}

- (NSURL)videoCallToActionURL
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoCallToActionURL]();
  }
  return 0;
}

- (BOOL)needsRapidUpdates
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline needsRapidUpdates]();
  }
  return 0;
}

- (BOOL)showMinimalChrome
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline showMinimalChrome]();
  }
  return 0;
}

- (BOOL)isBoundToContext
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isBoundToContext]();
  }
  return 0;
}

- (BOOL)isHiddenFromFeeds
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isHiddenFromFeeds]();
  }
  return 0;
}

- (NSString)sourceFeedID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline sourceFeedID]();
  }
  return 0;
}

- (NSString)publisherID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publisherID]();
  }
  return 0;
}

- (double)globalUserFeedback
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline globalUserFeedback]();
  }
  return 0.0;
}

- (BOOL)hasGlobalUserFeedback
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline hasGlobalUserFeedback]();
  }
  return 0;
}

- (unint64_t)articleContentType
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline articleContentType]();
  }
  return 0;
}

- (unint64_t)halfLife
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline halfLife]();
  }
  return 0;
}

- (BOOL)isBlockedExplicitContent
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isBlockedExplicitContent]();
  }
  return 0;
}

- (unint64_t)feedOrder
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline feedOrder]();
  }
  return 0;
}

- (BOOL)isFromBlockedStorefront
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isFromBlockedStorefront]();
  }
  return 0;
}

- (BOOL)isExplicitContent
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isExplicitContent]();
  }
  return 0;
}

- (NSString)feedID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline feedID]();
  }
  return 0;
}

- (unint64_t)order
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline order]();
  }
  return 0;
}

- (NSString)sourceChannelID
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline sourceChannelID]();
  }
  return 0;
}

- (unint64_t)publishDateMilliseconds
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publishDateMilliseconds]();
  }
  return 0;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline feedHalfLifeMilliseconds]();
  }
  return 0;
}

- (double)globalScore
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline globalScore]();
  }
  return 0.0;
}

- (BOOL)canBePurchased
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline canBePurchased]();
  }
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline globalCohorts]();
  }
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publisherCohorts]();
  }
  return 0;
}

- (id)articleRecirculationConfigJSON
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline articleRecirculationConfigJSON]();
  }
  return 0;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publisherSpecifiedArticleIDs]();
  }
  return 0;
}

- (FCNativeAdProviding)associatedAd
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline associatedAd]();
  }
  return 0;
}

- (BOOL)isHiddenFromAutoFavorites
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isHiddenFromAutoFavorites]();
  }
  return 0;
}

- (BOOL)showPublisherLogo
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline showPublisherLogo]();
  }
  return 0;
}

- (BOOL)isFullTrackAvailableToAll
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isFullTrackAvailableToAll]();
  }
  return 0;
}

- (NSArray)narrators
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline narrators]();
  }
  return 0;
}

- (BOOL)disablePrerollAds
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline disablePrerollAds]();
  }
  return 0;
}

- (BOOL)disableTapToChannel
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline disableTapToChannel]();
  }
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline globalConversionStats]();
  }
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publisherConversionStats]();
  }
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline publisherTagMetadata]();
  }
  return 0;
}

- (BOOL)hasVideoStillImage
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline hasVideoStillImage]();
  }
  return 0;
}

- (FCAssetHandle)videoStillImage
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoStillImage]();
  }
  return 0;
}

- (NSString)videoType
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline videoType]();
  }
  return 0;
}

- (BOOL)isCoread
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline isCoread]();
  }
  return 0;
}

- (NSString)nativeAdCampaignData
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline nativeAdCampaignData]();
  }
  return 0;
}

- (NSArray)sportsEventIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline sportsEventIDs]();
  }
  return 0;
}

- (NSArray)surfacedByArticleListIDs
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline surfacedByArticleListIDs]();
  }
  return 0;
}

- (BOOL)aiGenerated
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SCWebHeadline aiGenerated]();
  }
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)enumerateTopicConversionStatsWithBlock:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s method"];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline enumerateTopicConversionStatsWithBlock:]", v6, 2u);
}

- (void)addSurfacedByArticleListID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s method"];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline addSurfacedByArticleListID:]", v6, 2u);
}

- (void)applyConditionalScore:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s method"];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline applyConditionalScore:]", v6, 2u);
}

- (void)displayDate
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"displayDate", v6, 2u);
}

- (void)usesImageOnTopLayout
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"usesImageOnTopLayout", v6, 2u);
}

- (void)topStoryType
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topStoryType", v6, 2u);
}

- (void)isTopStory
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isTopStory", v6, 2u);
}

- (void)scoreProfile
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"scoreProfile", v6, 2u);
}

- (void)tileProminenceScore
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tileProminenceScore", v6, 2u);
}

- (void)surfacedByBinID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByBinID", v6, 2u);
}

- (void)surfacedByTopicID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByTopicID", v6, 2u);
}

- (void)surfacedByChannelID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByChannelID", v6, 2u);
}

- (void)surfacedBySectionID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedBySectionID", v6, 2u);
}

- (void)surfacedByTagIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByTagIDs", v6, 2u);
}

- (void)referencedArticleID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referencedArticleID", v6, 2u);
}

- (void)primaryAudience
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"primaryAudience", v6, 2u);
}

- (void)titleCompact
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"titleCompact", v6, 2u);
}

- (void)backendArticleVersion
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"backendArticleVersion", v6, 2u);
}

- (void)thumbnailFocalFrame
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnailFocalFrame", v6, 2u);
}

- (void)lastModifiedDate
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastModifiedDate", v6, 2u);
}

- (void)lastFetchedDate
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastFetchedDate", v6, 2u);
}

- (void)topics
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topics", v6, 2u);
}

- (void)topicIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topicIDs", v6, 2u);
}

- (void)endOfArticleTopicIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"endOfArticleTopicIDs", v6, 2u);
}

- (void)videoURL
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoURL", v6, 2u);
}

- (void)videoDuration
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoDuration", v6, 2u);
}

- (void)isFeatureCandidate
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFeatureCandidate", v6, 2u);
}

- (void)isSponsored
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isSponsored", v6, 2u);
}

- (void)sponsoredBy
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sponsoredBy", v6, 2u);
}

- (void)iAdCategories
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdCategories", v6, 2u);
}

- (void)iAdKeywords
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdKeywords", v6, 2u);
}

- (void)iAdSectionIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdSectionIDs", v6, 2u);
}

- (void)blockedStorefrontIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"blockedStorefrontIDs", v6, 2u);
}

- (void)allowedStorefrontIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"allowedStorefrontIDs", v6, 2u);
}

- (void)isDeleted
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isDeleted", v6, 2u);
}

- (void)isDraft
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isDraft", v6, 2u);
}

- (void)localDraftPath
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"localDraftPath", v6, 2u);
}

- (void)relatedArticleIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"relatedArticleIDs", v6, 2u);
}

- (void)moreFromPublisherArticleIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"moreFromPublisherArticleIDs", v6, 2u);
}

- (void)minimumNewsVersion
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"minimumNewsVersion", v6, 2u);
}

- (void)coverArt
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"coverArt", v6, 2u);
}

- (void)videoCallToActionTitle
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoCallToActionTitle", v6, 2u);
}

- (void)videoCallToActionURL
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoCallToActionURL", v6, 2u);
}

- (void)needsRapidUpdates
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"needsRapidUpdates", v6, 2u);
}

- (void)showMinimalChrome
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"showMinimalChrome", v6, 2u);
}

- (void)isBoundToContext
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isBoundToContext", v6, 2u);
}

- (void)isHiddenFromFeeds
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isHiddenFromFeeds", v6, 2u);
}

- (void)sourceFeedID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFeedID", v6, 2u);
}

- (void)publisherID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherID", v6, 2u);
}

- (void)globalUserFeedback
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalUserFeedback", v6, 2u);
}

- (void)hasGlobalUserFeedback
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hasGlobalUserFeedback", v6, 2u);
}

- (void)articleContentType
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleContentType", v6, 2u);
}

- (void)halfLife
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"halfLife", v6, 2u);
}

- (void)isBlockedExplicitContent
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isBlockedExplicitContent", v6, 2u);
}

- (void)feedOrder
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedOrder", v6, 2u);
}

- (void)isFromBlockedStorefront
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFromBlockedStorefront", v6, 2u);
}

- (void)isExplicitContent
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isExplicitContent", v6, 2u);
}

- (void)feedID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedID", v6, 2u);
}

- (void)order
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"order", v6, 2u);
}

- (void)sourceChannelID
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceChannelID", v6, 2u);
}

- (void)publishDateMilliseconds
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publishDateMilliseconds", v6, 2u);
}

- (void)feedHalfLifeMilliseconds
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedHalfLifeMilliseconds", v6, 2u);
}

- (void)globalScore
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalScore", v6, 2u);
}

- (void)canBePurchased
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"canBePurchased", v6, 2u);
}

- (void)globalCohorts
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalCohorts", v6, 2u);
}

- (void)publisherCohorts
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherCohorts", v6, 2u);
}

- (void)articleRecirculationConfigJSON
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleRecirculationConfigJSON", v6, 2u);
}

- (void)publisherSpecifiedArticleIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherSpecifiedArticleIDs", v6, 2u);
}

- (void)associatedAd
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"associatedAd", v6, 2u);
}

- (void)isHiddenFromAutoFavorites
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isHiddenFromAutoFavorites", v6, 2u);
}

- (void)showPublisherLogo
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"showPublisherLogo", v6, 2u);
}

- (void)isFullTrackAvailableToAll
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFullTrackAvailableToAll", v6, 2u);
}

- (void)narrators
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"narrators", v6, 2u);
}

- (void)disablePrerollAds
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"disablePrerollAds", v6, 2u);
}

- (void)disableTapToChannel
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"disableTapToChannel", v6, 2u);
}

- (void)globalConversionStats
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalConversionStats", v6, 2u);
}

- (void)publisherConversionStats
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherConversionStats", v6, 2u);
}

- (void)publisherTagMetadata
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherTagMetadata", v6, 2u);
}

- (void)hasVideoStillImage
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hasVideoStillImage", v6, 2u);
}

- (void)videoStillImage
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoStillImage", v6, 2u);
}

- (void)videoType
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoType", v6, 2u);
}

- (void)isCoread
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isCoread", v6, 2u);
}

- (void)nativeAdCampaignData
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"nativeAdCampaignData", v6, 2u);
}

- (void)sportsEventIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sportsEventIDs", v6, 2u);
}

- (void)surfacedByArticleListIDs
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByArticleListIDs", v6, 2u);
}

- (void)aiGenerated
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"SCWebHeadline does not support the %s property"];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aiGenerated", v6, 2u);
}

@end