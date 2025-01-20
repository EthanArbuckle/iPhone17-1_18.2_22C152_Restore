@interface FCHeadline
+ (id)emptyHeadline;
+ (id)emptyHeadlineWithIdentifier:(id)a3;
- (BOOL)canBePurchased;
- (BOOL)disableBookmarking;
- (BOOL)disablePrerollAds;
- (BOOL)disableTapToChannel;
- (BOOL)hasAudioTrack;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasThumbnail;
- (BOOL)hasVideo;
- (BOOL)hasVideoStillImage;
- (BOOL)hideModalCloseButton;
- (BOOL)isAIGenerated;
- (BOOL)isANF;
- (BOOL)isBlockedExplicitContent;
- (BOOL)isBoundToContext;
- (BOOL)isBundlePaid;
- (BOOL)isCoread;
- (BOOL)isDeleted;
- (BOOL)isDisplayingAsNativeAd;
- (BOOL)isDraft;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEvergreen;
- (BOOL)isExplicitContent;
- (BOOL)isFeatureCandidate;
- (BOOL)isFeatured;
- (BOOL)isFromBlockedStorefront;
- (BOOL)isFullTrackAvailableToAll;
- (BOOL)isGap;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isHiddenFromFeeds;
- (BOOL)isIssueOnly;
- (BOOL)isLocalDraft;
- (BOOL)isPaid;
- (BOOL)isPressRelease;
- (BOOL)isSponsored;
- (BOOL)isTopStory;
- (BOOL)needsRapidUpdates;
- (BOOL)reduceVisibility;
- (BOOL)reduceVisibilityForNonFollowers;
- (BOOL)showBundleSoftPaywall;
- (BOOL)showPublisherLogo;
- (BOOL)showSubscriptionRequiredText;
- (BOOL)useTransparentNavigationBar;
- (BOOL)usesImageOnTopLayout;
- (BOOL)webConverted;
- (BOOL)webEmbedsEnabled;
- (CGRect)thumbnailFocalFrame;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (FCArticleAudioTrack)narrativeTrack;
- (FCArticleAudioTrack)narrativeTrackSample;
- (FCAssetHandle)videoStillImage;
- (FCChannelProviding)sourceChannel;
- (FCColor)thumbnailImageAccentColor;
- (FCColor)thumbnailImageBackgroundColor;
- (FCColor)thumbnailImagePrimaryColor;
- (FCColor)thumbnailImageTextColor;
- (FCCoverArt)coverArt;
- (FCFeedPersonalizedItemScoreProfile)scoreProfile;
- (FCHeadline)init;
- (FCHeadlineExperimentalTitleMetadata)experimentalTitleMetadata;
- (FCHeadlineMetadata)appliedOverrideMetadata;
- (FCHeadlineStocksFields)stocksFields;
- (FCHeadlineThumbnail)thumbnail;
- (FCHeadlineThumbnail)thumbnailHQ;
- (FCHeadlineThumbnail)thumbnailLQ;
- (FCHeadlineThumbnail)thumbnailMedium;
- (FCHeadlineThumbnail)thumbnailUltraHQ;
- (FCHeadlineThumbnail)thumbnailWidget;
- (FCHeadlineThumbnail)thumbnailWidgetHQ;
- (FCHeadlineThumbnail)thumbnailWidgetLQ;
- (FCIssue)parentIssue;
- (FCNativeAdProviding)associatedAd;
- (FCTopStoriesStyleConfiguration)storyStyle;
- (NSArray)allowedStorefrontIDs;
- (NSArray)authors;
- (NSArray)blockedStorefrontIDs;
- (NSArray)iAdCategories;
- (NSArray)iAdKeywords;
- (NSArray)iAdSectionIDs;
- (NSArray)linkedArticleIDs;
- (NSArray)linkedIssueIDs;
- (NSArray)moreFromPublisherArticleIDs;
- (NSArray)narrativeTrackBuddyArticleIDs;
- (NSArray)narrators;
- (NSArray)publisherSpecifiedArticleIDs;
- (NSArray)relatedArticleIDs;
- (NSArray)sportsEventIDs;
- (NSArray)tagsExpiration;
- (NSArray)topicIDs;
- (NSArray)topics;
- (NSData)backingArticleRecordData;
- (NSData)float16FullBodyEncoding;
- (NSData)float16TitleEncoding;
- (NSDate)displayDate;
- (NSDate)globalExpirationTime;
- (NSDate)lastFetchedDate;
- (NSDate)lastModifiedDate;
- (NSDate)publishDate;
- (NSMutableArray)surfacedByArticleListIDs;
- (NSString)accessoryText;
- (NSString)articleID;
- (NSString)callToActionText;
- (NSString)clusterID;
- (NSString)description;
- (NSString)excerpt;
- (NSString)language;
- (NSString)layeredThumbnailJSON;
- (NSString)localDraftPath;
- (NSString)narrativeTrackPreferredUpsellVariantID;
- (NSString)narrativeTrackTextRanges;
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
- (NSURL)headlineURL;
- (NSURL)routeURL;
- (NSURL)videoCallToActionURL;
- (NSURL)videoURL;
- (double)conditionalScore;
- (double)globalUserFeedback;
- (double)layeredThumbnailAspectRatio;
- (double)tileProminenceScore;
- (double)videoDuration;
- (id)contentWithContext:(id)a3;
- (int64_t)backendArticleVersion;
- (int64_t)bodyTextLength;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)contentType;
- (unint64_t)feedOrder;
- (unint64_t)halfLife;
- (unint64_t)hash;
- (unint64_t)publishDateMilliseconds;
- (unint64_t)role;
- (unint64_t)storyType;
- (unint64_t)topStoryType;
- (void)addSurfacedByArticleListID:(id)a3;
- (void)applyConditionalScore:(double)a3;
- (void)applyHeadlineMetadata:(id)a3 configuration:(id)a4;
- (void)assignStoryType:(unint64_t)a3 withConfiguration:(id)a4;
- (void)enumerateTopicCohortsWithBlock:(id)a3;
- (void)enumerateTopicConversionStatsWithBlock:(id)a3;
- (void)markAsEvergreen;
- (void)overrideDisplayDate:(id)a3;
- (void)setAccessoryText:(id)a3;
- (void)setAiGenerated:(BOOL)a3;
- (void)setArticleID:(id)a3;
- (void)setAssociatedAd:(id)a3;
- (void)setBundlePaid:(BOOL)a3;
- (void)setCallToActionText:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setConditionalScore:(double)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDisplayAsNativeAd:(BOOL)a3;
- (void)setDisplayDate:(id)a3;
- (void)setExcerpt:(id)a3;
- (void)setFeedOrder:(unint64_t)a3;
- (void)setGlobalExpirationTime:(id)a3;
- (void)setGlobalUserFeedback:(double)a3;
- (void)setHalfLife:(unint64_t)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setHeadlineURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEvergreen:(BOOL)a3;
- (void)setNativeAdCampaignData:(id)a3;
- (void)setPaid:(BOOL)a3;
- (void)setPublishDate:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)setScoreProfile:(id)a3;
- (void)setShortExcerpt:(id)a3;
- (void)setShowSubscriptionRequiredText:(BOOL)a3;
- (void)setSourceChannel:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSponsored:(BOOL)a3;
- (void)setSponsoredBy:(id)a3;
- (void)setSportsEventIDs:(id)a3;
- (void)setStoryStyle:(id)a3;
- (void)setStoryType:(unint64_t)a3;
- (void)setSurfacedByArticleListIDs:(id)a3;
- (void)setSurfacedByBinID:(id)a3;
- (void)setSurfacedByChannelID:(id)a3;
- (void)setSurfacedBySectionID:(id)a3;
- (void)setSurfacedByTopicID:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailFocalFrame:(CGRect)a3;
- (void)setThumbnailHQ:(id)a3;
- (void)setThumbnailLQ:(id)a3;
- (void)setThumbnailMedium:(id)a3;
- (void)setThumbnailUltraHQ:(id)a3;
- (void)setTileProminenceScore:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTitleCompact:(id)a3;
- (void)setTopStoryType:(unint64_t)a3;
- (void)setTopicIDs:(id)a3;
- (void)setUsesImageOnTopLayout:(BOOL)a3;
- (void)setVideoType:(id)a3;
@end

@implementation FCHeadline

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (NSString)title
{
  return self->_title;
}

- (FCArticleAudioTrack)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (NSString)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (BOOL)isDisplayingAsNativeAd
{
  return self->_displayAsNativeAd;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSString)language
{
  return self->_language;
}

- (void)setTitle:(id)a3
{
}

- (void)setSourceName:(id)a3
{
}

- (void)setShortExcerpt:(id)a3
{
}

- (void)setPublishDate:(id)a3
{
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void)setArticleID:(id)a3
{
}

- (void)setAccessoryText:(id)a3
{
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (NSArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (void)setThumbnail:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  return (FCFeedPersonalizedItemScoreProfile *)objc_getProperty(self, a2, 392, 1);
}

- (FCHeadlineThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (NSArray)authors
{
  return self->_authors;
}

- (BOOL)hasVideo
{
  v2 = [(FCHeadline *)self videoURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (FCHeadline)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCHeadline;
  result = [(FCHeadline *)&v3 init];
  if (result) {
    result->_halfLife = 23400000;
  }
  return result;
}

- (void)markAsEvergreen
{
  if (![(FCHeadline *)self isEvergreen])
  {
    [(FCHeadline *)self setIsEvergreen:1];
    if (NFInternalBuild())
    {
      objc_super v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v4 = [v3 BOOLForKey:@"newsfeed.content.highlight_evergreen_articles"];

      if (v4)
      {
        id v6 = [(FCHeadline *)self title];
        v5 = [@"🌲" stringByAppendingString:v6];
        [(FCHeadline *)self setTitle:v5];
      }
    }
  }
}

- (CGRect)thumbnailFocalFrame
{
  double x = self->_thumbnailFocalFrame.origin.x;
  double y = self->_thumbnailFocalFrame.origin.y;
  double width = self->_thumbnailFocalFrame.size.width;
  double height = self->_thumbnailFocalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (NSURL)routeURL
{
  return self->_routeURL;
}

- (NSString)sourceChannelID
{
  v2 = [(FCHeadline *)self sourceChannel];
  objc_super v3 = [v2 identifier];

  return (NSString *)v3;
}

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(FCHeadline *)self identifier];
  uint64_t v6 = [a3 identifier];
  return [(NSString *)v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  v2 = [(FCHeadline *)self identifier];
  return [(NSString *)v2 hash];
}

+ (id)emptyHeadline
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  objc_super v3 = [v2 UUIDString];
  int v4 = +[FCHeadline emptyHeadlineWithIdentifier:v3];

  return v4;
}

+ (id)emptyHeadlineWithIdentifier:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(FCHeadline);
  [(FCHeadline *)v4 setIdentifier:v3];
  [(FCHeadline *)v4 setArticleID:v3];

  return v4;
}

- (id)contentWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 pptContext];
  int v5 = [v4 isRunningPPT];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
      *(_DWORD *)buf = 136315906;
      v13 = "-[FCHeadline contentWithContext:]";
      __int16 v14 = 2080;
      v15 = "FCHeadline.m";
      __int16 v16 = 1024;
      int v17 = 184;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCHeadline contentWithContext:]"];
    id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

    objc_exception_throw(v11);
  }

  return 0;
}

- (BOOL)isANF
{
  return [(FCHeadline *)self contentType] == 2;
}

- (BOOL)isGap
{
  return 0;
}

- (BOOL)isSponsored
{
  return self->_sponsored || self->_sponsoredBy != 0;
}

- (BOOL)isBlockedExplicitContent
{
  id v3 = +[FCRestrictions sharedInstance];
  if ([v3 isExplicitContentAllowed])
  {
    char v4 = 0;
  }
  else
  {
    int v5 = [(FCHeadline *)self primaryAudience];
    char v4 = [v5 isEqualToString:@"MATURE"];
  }
  return v4;
}

- (BOOL)showPublisherLogo
{
  return [(FCHeadline *)self role] != 3;
}

- (BOOL)hasVideoStillImage
{
  v2 = [(FCHeadline *)self videoStillImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFeatured
{
  return [(FCHeadline *)self role] == 6;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)FCHeadline;
  v2 = [(FCHeadline *)&v4 description];
  return (NSString *)v2;
}

- (void)overrideDisplayDate:(id)a3
{
  id v4 = a3;
  [(FCHeadline *)self setDisplayDate:v4];
  [(FCHeadline *)self setPublishDate:v4];
}

- (void)applyConditionalScore:(double)a3
{
  [(FCHeadline *)self conditionalScore];
  if (v5 <= a3) {
    double v5 = a3;
  }
  [(FCHeadline *)self setConditionalScore:v5];
}

- (void)addSurfacedByArticleListID:(id)a3
{
  id v7 = a3;
  id v4 = [(FCHeadline *)self surfacedByArticleListIDs];

  if (!v4)
  {
    double v5 = [MEMORY[0x1E4F1CA48] array];
    [(FCHeadline *)self setSurfacedByArticleListIDs:v5];
  }
  if ([v7 hasPrefix:@"LX"]) {
    self->_isCoread = 1;
  }
  uint64_t v6 = [(FCHeadline *)self surfacedByArticleListIDs];
  [v6 addObject:v7];
}

- (void)assignStoryType:(unint64_t)a3 withConfiguration:(id)a4
{
  id v16 = a4;
  if (a3 != 5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [(FCHeadline *)self publishDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;
    v10 = [v16 topStoriesConfig];
    BOOL v11 = v9 >= (double)[v10 storyTypeTimeout];

    if (v11) {
      a3 = 0;
    }
  }
  if (a3 != [(FCHeadline *)self storyType])
  {
    [(FCHeadline *)self setStoryType:a3];
    if (a3)
    {
      v12 = [v16 topStoriesConfig];
      v13 = [v12 styleConfigurations];
      __int16 v14 = [NSNumber numberWithUnsignedInteger:a3];
      v15 = [v13 objectForKey:v14];
      [(FCHeadline *)self setStoryStyle:v15];
    }
    else
    {
      [(FCHeadline *)self setStoryStyle:0];
    }
  }
}

- (void)applyHeadlineMetadata:(id)a3 configuration:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v18 title];

    if (v7)
    {
      double v8 = [v18 title];
      [(FCHeadline *)self overrideTitle:v8];
    }
  }
  double v9 = [v18 displayDate];

  if (v9)
  {
    v10 = [v18 displayDate];
    [(FCHeadline *)self overrideDisplayDate:v10];
  }
  BOOL v11 = [v18 storyType];
  uint64_t v12 = [v11 length];

  if (v6 && v12)
  {
    v13 = [v18 storyType];
    uint64_t v14 = PBArticleStoryTypeFromString(v13) - 1;
    if (v14 < 5) {
      uint64_t v15 = v14 + 1;
    }
    else {
      uint64_t v15 = 0;
    }

    [(FCHeadline *)self assignStoryType:v15 withConfiguration:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v16 = [v18 shortExcerpt];

    if (v16)
    {
      int v17 = [v18 shortExcerpt];
      [(FCHeadline *)self overrideShortExcerpt:v17];
    }
  }
}

- (BOOL)isTopStory
{
  return [(FCHeadline *)self topStoryType] != 0;
}

- (NSString)sourceFeedID
{
  BOOL v3 = [(FCHeadline *)self surfacedByChannelID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadline *)self surfacedByTopicID];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)publisherID
{
  v2 = [(FCHeadline *)self sourceChannel];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)hasGlobalUserFeedback
{
  [(FCHeadline *)self globalUserFeedback];
  return v2 != 0.0;
}

- (double)globalUserFeedback
{
  double result = self->_globalUserFeedback;
  if (result < 0.0) {
    return 0.5;
  }
  return result;
}

- (unint64_t)publishDateMilliseconds
{
  double v2 = [(FCHeadline *)self publishDate];
  unint64_t v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (BOOL)isFromBlockedStorefront
{
  unint64_t v3 = +[FCRestrictions sharedInstance];
  id v4 = +[FCAppleAccount sharedAccount];
  id v5 = [v4 contentStoreFrontID];
  id v6 = [(FCHeadline *)self allowedStorefrontIDs];
  id v7 = [(FCHeadline *)self blockedStorefrontIDs];
  char v8 = [v3 isContentBlockedInStorefrontID:v5 withAllowedStorefrontIDs:v6 blockedStorefrontIDs:v7];

  return v8;
}

- (BOOL)isExplicitContent
{
  double v2 = [(FCHeadline *)self primaryAudience];
  char v3 = [v2 isEqualToString:@"MATURE"];

  return v3;
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(FCHeadline *)self topics];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          BOOL v11 = [v10 tagID];
          uint64_t v12 = [v10 cohorts];
          v4[2](v4, v11, v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(FCHeadline *)self topics];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          BOOL v11 = [v10 tagID];
          uint64_t v12 = [v10 conversionStats];
          v4[2](v4, v11, v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isFullTrackAvailableToAll
{
  double v2 = self;
  char v3 = [(FCHeadline *)self narrativeTrack];
  id v4 = [(FCHeadline *)v2 narrativeTrackSample];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (FCHeadlineMetadata)appliedOverrideMetadata
{
  return 0;
}

- (BOOL)isCoread
{
  double v2 = [(FCHeadline *)self surfacedByArticleListIDs];
  char v3 = v2;
  if (v2) {
    char v4 = objc_msgSend(v2, "fc_containsObjectPassingTest:", &__block_literal_global_32_2);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __22__FCHeadline_isCoread__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"LX"];
}

- (void)setThumbnailLQ:(id)a3
{
}

- (void)setThumbnailMedium:(id)a3
{
}

- (void)setThumbnailHQ:(id)a3
{
}

- (void)setThumbnailUltraHQ:(id)a3
{
}

- (FCHeadlineThumbnail)thumbnailWidgetLQ
{
  return self->_thumbnailWidgetLQ;
}

- (FCHeadlineThumbnail)thumbnailWidget
{
  return self->_thumbnailWidget;
}

- (FCHeadlineThumbnail)thumbnailWidgetHQ
{
  return self->_thumbnailWidgetHQ;
}

- (FCHeadlineExperimentalTitleMetadata)experimentalTitleMetadata
{
  return self->_experimentalTitleMetadata;
}

- (NSString)referencedArticleID
{
  return self->_referencedArticleID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (void)setSourceChannel:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (FCAssetHandle)videoStillImage
{
  return self->_videoStillImage;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
}

- (NSArray)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (void)setSportsEventIDs:(id)a3
{
}

- (BOOL)isFeatureCandidate
{
  return self->_featureCandidate;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSArray)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isLocalDraft
{
  return self->_isLocalDraft;
}

- (NSString)surfacedBySectionID
{
  return self->_surfacedBySectionID;
}

- (void)setSurfacedBySectionID:(id)a3
{
}

- (NSString)surfacedByChannelID
{
  return self->_surfacedByChannelID;
}

- (void)setSurfacedByChannelID:(id)a3
{
}

- (NSString)surfacedByTopicID
{
  return self->_surfacedByTopicID;
}

- (void)setSurfacedByTopicID:(id)a3
{
}

- (NSString)surfacedByBinID
{
  return self->_surfacedByBinID;
}

- (void)setSurfacedByBinID:(id)a3
{
}

- (NSMutableArray)surfacedByArticleListIDs
{
  return self->_surfacedByArticleListIDs;
}

- (void)setSurfacedByArticleListIDs:(id)a3
{
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (NSString)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
}

- (NSString)localDraftPath
{
  return self->_localDraftPath;
}

- (void)setScoreProfile:(id)a3
{
}

- (double)tileProminenceScore
{
  return self->_personalizedScore;
}

- (void)setTileProminenceScore:(double)a3
{
  self->_personalizedScore = a3;
}

- (BOOL)usesImageOnTopLayout
{
  return self->_usesImageOnTopLayout;
}

- (void)setUsesImageOnTopLayout:(BOOL)a3
{
  self->_usesImageOnTopLayout = a3;
}

- (unint64_t)topStoryType
{
  return self->_topStoryType;
}

- (void)setTopStoryType:(unint64_t)a3
{
  self->_topStoryType = a3;
}

- (NSArray)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (NSArray)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (FCTopStoriesStyleConfiguration)storyStyle
{
  return self->_storyStyle;
}

- (void)setStoryStyle:(id)a3
{
}

- (BOOL)needsRapidUpdates
{
  return self->_needsRapidUpdates;
}

- (BOOL)disableTapToChannel
{
  return self->_disableTapToChannel;
}

- (BOOL)isBoundToContext
{
  return self->_boundToContext;
}

- (BOOL)isHiddenFromFeeds
{
  return self->_hiddenFromFeeds;
}

- (BOOL)isPressRelease
{
  return self->_pressRelease;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_hiddenFromAutoFavorites;
}

- (BOOL)disablePrerollAds
{
  return self->_disablePrerollAds;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (void)setPaid:(BOOL)a3
{
  self->_paid = a3;
}

- (FCCoverArt)coverArt
{
  return self->_coverArt;
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (NSURL)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (BOOL)showSubscriptionRequiredText
{
  return self->_showSubscriptionRequiredText;
}

- (void)setShowSubscriptionRequiredText:(BOOL)a3
{
  self->_showSubscriptionRequiredText = a3;
}

- (unint64_t)feedOrder
{
  return self->_feedOrder;
}

- (void)setFeedOrder:(unint64_t)a3
{
  self->_feedOrder = a3;
}

- (void)setGlobalUserFeedback:(double)a3
{
  self->_globalUserFeedback = a3;
}

- (unint64_t)halfLife
{
  return self->_halfLife;
}

- (void)setHalfLife:(unint64_t)a3
{
  self->_halfLife = a3;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (void)setIsEvergreen:(BOOL)a3
{
  self->_isEvergreen = a3;
}

- (BOOL)canBePurchased
{
  return self->_canBePurchased;
}

- (void)setDisplayDate:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  return self->_publisherCohorts;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return self->_publisherConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return self->_publisherTagMetadata;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (void)setDisplayAsNativeAd:(BOOL)a3
{
  self->_displayAsNativeAd = a3;
}

- (NSString)sponsoredBy
{
  return self->_sponsoredBy;
}

- (void)setSponsoredBy:(id)a3
{
}

- (FCNativeAdProviding)associatedAd
{
  return self->_associatedAd;
}

- (void)setAssociatedAd:(id)a3
{
}

- (NSString)nativeAdCampaignData
{
  return self->_nativeAdCampaignData;
}

- (void)setNativeAdCampaignData:(id)a3
{
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (FCHeadlineStocksFields)stocksFields
{
  return self->_stocksFields;
}

- (NSData)backingArticleRecordData
{
  return self->_backingArticleRecordData;
}

- (FCIssue)parentIssue
{
  return self->_parentIssue;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (BOOL)showBundleSoftPaywall
{
  return self->_showBundleSoftPaywall;
}

- (BOOL)disableBookmarking
{
  return self->_disableBookmarking;
}

- (BOOL)hideModalCloseButton
{
  return self->_hideModalCloseButton;
}

- (BOOL)reduceVisibility
{
  return self->_reduceVisibility;
}

- (BOOL)reduceVisibilityForNonFollowers
{
  return self->_reduceVisibilityForNonFollowers;
}

- (BOOL)webConverted
{
  return self->_webConverted;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)useTransparentNavigationBar
{
  return self->_useTransparentNavigationBar;
}

- (FCArticleAudioTrack)narrativeTrack
{
  return self->_narrativeTrack;
}

- (NSString)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (BOOL)hasAudioTrack
{
  return self->_hasAudioTrack;
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (NSArray)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (NSArray)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (FCColor)thumbnailImagePrimaryColor
{
  return self->_thumbnailImagePrimaryColor;
}

- (FCColor)thumbnailImageBackgroundColor
{
  return self->_thumbnailImageBackgroundColor;
}

- (FCColor)thumbnailImageTextColor
{
  return self->_thumbnailImageTextColor;
}

- (FCColor)thumbnailImageAccentColor
{
  return self->_thumbnailImageAccentColor;
}

- (NSArray)narrators
{
  return self->_narrators;
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
}

- (NSArray)narrativeTrackBuddyArticleIDs
{
  return self->_narrativeTrackBuddyArticleIDs;
}

- (NSString)narrativeTrackPreferredUpsellVariantID
{
  return self->_narrativeTrackPreferredUpsellVariantID;
}

- (NSDate)globalExpirationTime
{
  return self->_globalExpirationTime;
}

- (void)setGlobalExpirationTime:(id)a3
{
}

- (NSArray)tagsExpiration
{
  return self->_tagsExpiration;
}

- (double)conditionalScore
{
  return self->_conditionalScore;
}

- (void)setConditionalScore:(double)a3
{
  self->_conditionalScore = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)headlineURL
{
  return self->_headlineURL;
}

- (void)setHeadlineURL:(id)a3
{
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (void)setTitleCompact:(id)a3
{
}

- (BOOL)isAIGenerated
{
  return self->_aiGenerated;
}

- (void)setAiGenerated:(BOOL)a3
{
  self->_aiGenerated = a3;
}

- (void)setBundlePaid:(BOOL)a3
{
  self->_bundlePaid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleCompact, 0);
  objc_storeStrong((id *)&self->_headlineURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_routeURL, 0);
  objc_storeStrong((id *)&self->_tagsExpiration, 0);
  objc_storeStrong((id *)&self->_globalExpirationTime, 0);
  objc_storeStrong((id *)&self->_narrativeTrackPreferredUpsellVariantID, 0);
  objc_storeStrong((id *)&self->_narrativeTrackBuddyArticleIDs, 0);
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_narrators, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_thumbnailImageAccentColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImageTextColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImagePrimaryColor, 0);
  objc_storeStrong((id *)&self->_layeredThumbnailJSON, 0);
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_float16FullBodyEncoding, 0);
  objc_storeStrong((id *)&self->_float16TitleEncoding, 0);
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_parentIssue, 0);
  objc_storeStrong((id *)&self->_backingArticleRecordData, 0);
  objc_storeStrong((id *)&self->_stocksFields, 0);
  objc_storeStrong((id *)&self->_nativeAdCampaignData, 0);
  objc_storeStrong((id *)&self->_associatedAd, 0);
  objc_storeStrong((id *)&self->_sponsoredBy, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_publisherTagMetadata, 0);
  objc_storeStrong((id *)&self->_publisherConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);
  objc_storeStrong((id *)&self->_publisherCohorts, 0);
  objc_storeStrong((id *)&self->_globalCohorts, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_scoreProfile, 0);
  objc_storeStrong((id *)&self->_localDraftPath, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, 0);
  objc_storeStrong((id *)&self->_surfacedByBinID, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicID, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelID, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionID, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_videoType, 0);
  objc_storeStrong((id *)&self->_videoStillImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_experimentalTitleMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailWidget, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
}

@end