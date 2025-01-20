@interface FCArticleHeadline
+ (__CFString)_tempOverrideMIMETypeForURL:(uint64_t)a1;
- (BOOL)canBePurchased;
- (BOOL)disableBookmarking;
- (BOOL)disablePrerollAds;
- (BOOL)disableTapToChannel;
- (BOOL)hasAudioTrack;
- (BOOL)hasThumbnail;
- (BOOL)hideModalCloseButton;
- (BOOL)isAIGenerated;
- (BOOL)isBoundToContext;
- (BOOL)isBundlePaid;
- (BOOL)isDeleted;
- (BOOL)isDraft;
- (BOOL)isEvergreen;
- (BOOL)isFeatureCandidate;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isHiddenFromFeeds;
- (BOOL)isIssueOnly;
- (BOOL)isLocalDraft;
- (BOOL)isPaid;
- (BOOL)isPressRelease;
- (BOOL)isSponsored;
- (BOOL)needsRapidUpdates;
- (BOOL)reduceVisibility;
- (BOOL)reduceVisibilityForNonFollowers;
- (BOOL)showBundleSoftPaywall;
- (BOOL)useTransparentNavigationBar;
- (BOOL)webConverted;
- (BOOL)webEmbedsEnabled;
- (CGRect)thumbnailFocalFrame;
- (FCArticleHeadline)init;
- (FCArticleHeadline)initWithArticleMetadata:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5;
- (FCArticleHeadline)initWithArticleRecord:(id)a3 articleInterestToken:(id)a4 sourceChannel:(id)a5 parentIssue:(id)a6 storyStyleConfigs:(id)a7 storyTypeTimeout:(int64_t)a8 rapidUpdatesTimeout:(int64_t)a9 assetManager:(id)a10 experimentalTitleProvider:(id)a11;
- (FCArticleHeadline)initWithArticleRecordData:(id)a3 sourceChannel:(id)a4 parentIssue:(id)a5 assetManager:(id)a6;
- (FCChannelProviding)sourceChannel;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (FCInterestToken)articleInterestToken;
- (NSArray)allowedStorefrontIDs;
- (NSArray)blockedStorefrontIDs;
- (NSString)identifier;
- (NSString)stocksClusterID;
- (NSString)stocksMetadataJSON;
- (NSString)stocksScoresJSON;
- (NSString)title;
- (NTPBArticleRecord)articleRecord;
- (double)layeredThumbnailAspectRatio;
- (double)videoDuration;
- (id)accessoryText;
- (id)articleID;
- (id)articleRecirculationConfigAssetHandle;
- (id)authors;
- (id)backingArticleRecordData;
- (id)clusterID;
- (id)contentURL;
- (id)contentWithContext:(id)a3;
- (id)coverArt;
- (id)excerpt;
- (id)experimentalTitleMetadata;
- (id)float16FullBodyEncoding;
- (id)float16TitleEncoding;
- (id)globalCohorts;
- (id)globalConversionStats;
- (id)globalExpirationTime;
- (id)iAdCategories;
- (id)iAdKeywords;
- (id)iAdSectionIDs;
- (id)language;
- (id)lastFetchedDate;
- (id)lastModifiedDate;
- (id)layeredThumbnailJSON;
- (id)linkedArticleIDs;
- (id)linkedIssueIDs;
- (id)moreFromPublisherArticleIDs;
- (id)narrativeTrack;
- (id)narrativeTrackBuddyArticleIDs;
- (id)narrativeTrackPreferredUpsellVariantID;
- (id)narrativeTrackSample;
- (id)narrativeTrackTextRanges;
- (id)narrators;
- (id)parentIssue;
- (id)primaryAudience;
- (id)publishDate;
- (id)publisherCohorts;
- (id)publisherConversionStats;
- (id)publisherID;
- (id)publisherSpecifiedArticleIDs;
- (id)publisherTagMetadata;
- (id)referencedArticleID;
- (id)relatedArticleIDs;
- (id)routeURL;
- (id)shortExcerpt;
- (id)sourceName;
- (id)sportsEventIDs;
- (id)storyStyle;
- (id)tagsExpiration;
- (id)thumbnail;
- (id)thumbnailHQ;
- (id)thumbnailImageAccentColor;
- (id)thumbnailImageBackgroundColor;
- (id)thumbnailImagePrimaryColor;
- (id)thumbnailImageTextColor;
- (id)thumbnailLQ;
- (id)thumbnailMedium;
- (id)thumbnailPerceptualHash;
- (id)thumbnailUltraHQ;
- (id)thumbnailWidget;
- (id)thumbnailWidgetHQ;
- (id)thumbnailWidgetLQ;
- (id)titleCompact;
- (id)topicIDs;
- (id)topics;
- (id)videoCallToActionTitle;
- (id)videoCallToActionURL;
- (id)videoStillImage;
- (id)videoType;
- (id)videoURL;
- (int64_t)backendArticleVersion;
- (int64_t)behaviorFlags;
- (int64_t)bodyTextLength;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)contentType;
- (unint64_t)dataSource;
- (unint64_t)halfLife;
- (unint64_t)halfLifeOverride;
- (unint64_t)role;
- (unint64_t)storyType;
- (void)setAccessoryText:(id)a3;
- (void)setAiGenerated:(BOOL)a3;
- (void)setArticleID:(id)a3;
- (void)setArticleInterestToken:(id)a3;
- (void)setArticleRecord:(id)a3;
- (void)setBehaviorFlags:(int64_t)a3;
- (void)setClusterID:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setExcerpt:(id)a3;
- (void)setGlobalExpirationTime:(id)a3;
- (void)setHalfLife:(unint64_t)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setIsEvergreen:(BOOL)a3;
- (void)setPublishDate:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)setShortExcerpt:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSponsored:(BOOL)a3;
- (void)setSportsEventIDs:(id)a3;
- (void)setStoryStyle:(id)a3;
- (void)setStoryType:(unint64_t)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailFocalFrame:(CGRect)a3;
- (void)setThumbnailHQ:(id)a3;
- (void)setThumbnailLQ:(id)a3;
- (void)setThumbnailMedium:(id)a3;
- (void)setThumbnailUltraHQ:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleCompact:(id)a3;
- (void)setTopicIDs:(id)a3;
- (void)setVideoType:(id)a3;
@end

@implementation FCArticleHeadline

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (BOOL)isSponsored
{
  return self->_sponsored;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (id)language
{
  return self->_language;
}

- (id)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (id)narrativeTrack
{
  return self->_narrativeTrack;
}

- (id)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (BOOL)hasAudioTrack
{
  return self->_narrativeTrack != 0;
}

- (id)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (id)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (id)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (id)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (id)iAdKeywords
{
  return self->_iAdKeywords;
}

- (id)publishDate
{
  return self->_publishDate;
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

- (id)shortExcerpt
{
  return self->_shortExcerpt;
}

- (FCArticleHeadline)initWithArticleRecord:(id)a3 articleInterestToken:(id)a4 sourceChannel:(id)a5 parentIssue:(id)a6 storyStyleConfigs:(id)a7 storyTypeTimeout:(int64_t)a8 rapidUpdatesTimeout:(int64_t)a9 assetManager:(id)a10 experimentalTitleProvider:(id)a11
{
  uint64_t v344 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v337 = a7;
  id v21 = a10;
  id v338 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v284 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleRecord");
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyS"
                         "tyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCArticleHeadline.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v342) = 265;
    WORD2(v342) = 2114;
    *(void *)((char *)&v342 + 6) = v284;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v339.receiver = self;
  v339.super_class = (Class)FCArticleHeadline;
  v22 = [(FCHeadline *)&v339 init];
  if (v22)
  {
    id v334 = v20;
    context = (void *)MEMORY[0x1A6260FD0]();
    objc_storeStrong((id *)&v22->_articleRecord, a3);
    objc_storeStrong((id *)&v22->_articleInterestToken, a4);
    uint64_t v23 = [v19 copy];
    sourceChannel = v22->_sourceChannel;
    v22->_sourceChannel = (FCChannelProviding *)v23;

    uint64_t v25 = [v19 name];
    sourceName = v22->_sourceName;
    v22->_sourceName = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E4FBA8A8];
    v28 = [(NTPBArticleRecord *)v22->_articleRecord sourceChannelTagID];
    v29 = [(FCChannelProviding *)v22->_sourceChannel identifier];
    LOBYTE(v27) = objc_msgSend(v27, "nf_object:isEqualToObject:", v28, v29);

    if ((v27 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v285 = [NSString alloc];
      v286 = (objc_class *)objc_opt_class();
      v287 = NSStringFromClass(v286);
      v288 = [(NTPBArticleRecord *)v22->_articleRecord sourceChannelTagID];
      v289 = [(FCChannelProviding *)v22->_sourceChannel identifier];
      v290 = (void *)[v285 initWithFormat:@"Attempting to initialize a %@ with mismatched articleRecord sourceChannelTagID : %@ and sourceChannel identifier : %@", v287, v288, v289];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:stor"
                           "yStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCArticleHeadline.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v342) = 296;
      WORD2(v342) = 2114;
      *(void *)((char *)&v342 + 6) = v290;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v30 = [v17 base];
    v31 = [v30 identifier];

    objc_storeStrong((id *)&v22->_identifier, v31);
    v336 = v31;
    objc_storeStrong((id *)&v22->_articleID, v31);
    v22->_featureCandidate = [v17 isFeatureCandidate];
    uint64_t v32 = [v17 referencedArticleID];
    referencedArticleID = v22->_referencedArticleID;
    v22->_referencedArticleID = (NSString *)v32;

    uint64_t v34 = [v17 clusterID];
    clusterID = v22->_clusterID;
    v22->_clusterID = (NSString *)v34;

    uint64_t v36 = [v17 language];
    language = v22->_language;
    v22->_language = (NSString *)v36;

    v22->_bodyTextLength = [v17 bodyTextLength];
    uint64_t v38 = [v17 float16TitleEncoding];
    float16TitleEncoding = v22->_float16TitleEncoding;
    v22->_float16TitleEncoding = (NSData *)v38;

    uint64_t v40 = [v17 float16FullBodyEncoding];
    float16FullBodyEncoding = v22->_float16FullBodyEncoding;
    v22->_float16FullBodyEncoding = (NSData *)v40;

    v42 = [v17 expirationData];
    LODWORD(v31) = [v42 hasGlobalExpireUtcTime];

    if (v31)
    {
      v43 = (void *)MEMORY[0x1E4F1C9C8];
      v44 = [v17 expirationData];
      uint64_t v45 = objc_msgSend(v43, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v44, "globalExpireUtcTime") / 1000.0);
      globalExpirationTime = v22->_globalExpirationTime;
      v22->_globalExpirationTime = (NSDate *)v45;
    }
    v47 = [v17 expirationData];
    v48 = [v47 tagsExpirationLists];
    uint64_t v49 = +[FCArticleTagsExpiration tagsExpirationsFromRecord:v48];
    tagsExpiration = v22->_tagsExpiration;
    v22->_tagsExpiration = (NSArray *)v49;

    uint64_t v51 = [v17 title];
    v52 = (void *)v51;
    if (v338)
    {
      v53 = [v17 experimentalTitles];
      uint64_t v54 = [v338 headlineMetadataFromTitle:v52 fromExperimentalTitles:v53 forArticleID:v336];
      experimentalTitleMetadata = v22->_experimentalTitleMetadata;
      v22->_experimentalTitleMetadata = (FCHeadlineExperimentalTitleMetadata *)v54;

      uint64_t v56 = [(FCHeadlineExperimentalTitleMetadata *)v22->_experimentalTitleMetadata chosenTitle];
      title = (FCHeadlineExperimentalTitleMetadata *)v22->_title;
      v22->_title = (NSString *)v56;
    }
    else
    {
      v58 = v22->_title;
      v22->_title = (NSString *)v51;

      title = v22->_experimentalTitleMetadata;
      v22->_experimentalTitleMetadata = 0;
    }

    v335 = v19;
    if (![(NSString *)v22->_title length])
    {
      v59 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        v291 = v59;
        uint64_t v292 = [v17 title];
        v293 = (void *)v292;
        if (v292) {
          v294 = (__CFString *)v292;
        }
        else {
          v294 = @"nil";
        }
        uint64_t v295 = [v17 experimentalTitles];
        v296 = (void *)v295;
        *(_DWORD *)buf = 138543874;
        if (v295) {
          v297 = (__CFString *)v295;
        }
        else {
          v297 = @"nil";
        }
        *(void *)&buf[4] = v336;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v294;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&long long v342 = v297;
        _os_log_error_impl(&dword_1A460D000, v291, OS_LOG_TYPE_ERROR, "Headline article [%{public}@] was assigned an empty title! Original record had title=[%{public}@] experimentalTitles=[%{public}@]", buf, 0x20u);
      }
    }
    uint64_t v60 = [v17 titleCompact];
    titleCompact = v22->_titleCompact;
    v22->_titleCompact = (NSString *)v60;

    uint64_t v62 = [v17 primaryAudience];
    primaryAudience = v22->_primaryAudience;
    v22->_primaryAudience = (NSString *)v62;

    v64 = (void *)MEMORY[0x1E4F1C9C8];
    v65 = [v17 publishDate];
    v66 = [v64 dateWithPBDate:v65];

    self;
    if (qword_1EB5D0E48 != -1) {
      dispatch_once(&qword_1EB5D0E48, &__block_literal_global_55_0);
    }
    int v67 = byte_1EB5D0E32;
    if (byte_1EB5D0E32)
    {
      v68 = objc_msgSend(v66, "fc_adjustToRecentDate");
    }
    else
    {
      v68 = v66;
    }
    objc_storeStrong((id *)&v22->_publishDate, v68);
    if (v67) {

    }
    v22->_publisherArticleVersion = [v17 publisherArticleVersion];
    v22->_backendArticleVersion = [v17 backendArticleVersion];
    v22->_thumbnailFocalFrame.origin.double x = FCCGRectFromBuffer([v17 thumbnailFocalFrame]);
    v22->_thumbnailFocalFrame.origin.double y = v69;
    v22->_thumbnailFocalFrame.size.double width = v70;
    v22->_thumbnailFocalFrame.size.double height = v71;
    uint64_t v72 = [v17 thumbnailPerceptualHash];
    thumbnailPerceptualHash = v22->_thumbnailPerceptualHash;
    v22->_thumbnailPerceptualHash = (NSData *)v72;

    unint64_t v74 = [v17 thumbnailLQMetadata];
    double v76 = *MEMORY[0x1E4F1DB30];
    double v75 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v77 = v75;
    double v78 = *MEMORY[0x1E4F1DB30];
    if (v74)
    {
      double v77 = (double)((v74 >> 8) & 0xFFFFFFF);
      double v78 = (double)(v74 >> 36);
    }
    unint64_t v79 = [v17 thumbnailMetadata];
    double v80 = v75;
    double v81 = v76;
    if (v79)
    {
      double v80 = (double)((v79 >> 8) & 0xFFFFFFF);
      double v81 = (double)(v79 >> 36);
    }
    unint64_t v82 = [v17 thumbnailMediumMetadata];
    double v83 = v75;
    double v84 = v76;
    if (v82)
    {
      double v83 = (double)((v82 >> 8) & 0xFFFFFFF);
      double v84 = (double)(v82 >> 36);
    }
    double v320 = v84;
    unint64_t v85 = [v17 thumbnailHQMetadata];
    double v86 = v75;
    double v87 = v76;
    if (v85)
    {
      double v86 = (double)((v85 >> 8) & 0xFFFFFFF);
      double v87 = (double)(v85 >> 36);
    }
    double v318 = v87;
    double v321 = v86;
    unint64_t v88 = [v17 thumbnailUltraHQMetadata];
    double v89 = v75;
    double v90 = v76;
    if (v88)
    {
      double v89 = (double)((v88 >> 8) & 0xFFFFFFF);
      double v90 = (double)(v88 >> 36);
    }
    double v316 = v90;
    double v319 = v89;
    unint64_t v91 = [v17 thumbnailWidgetLQMetadata];
    double v92 = v75;
    double v93 = v76;
    if (v91)
    {
      double v92 = (double)((v91 >> 8) & 0xFFFFFFF);
      double v93 = (double)(v91 >> 36);
    }
    double v314 = v93;
    double v317 = v92;
    unint64_t v94 = [v17 thumbnailWidgetMetadata];
    double v95 = v75;
    double v96 = v76;
    if (v94)
    {
      double v95 = (double)((v94 >> 8) & 0xFFFFFFF);
      double v96 = (double)(v94 >> 36);
    }
    double v313 = v96;
    double v315 = v95;
    v323 = v66;
    unint64_t v97 = [v17 thumbnailWidgetHQMetadata];
    if (v97)
    {
      double v75 = (double)((v97 >> 8) & 0xFFFFFFF);
      double v76 = (double)(v97 >> 36);
    }
    v98 = [v17 thumbnailLQURL];
    v333 = [v17 generateThumbnailAssetHandleForURL:v98 withAssetManager:v21];

    v99 = [v17 thumbnailURL];
    v332 = [v17 generateThumbnailAssetHandleForURL:v99 withAssetManager:v21];

    v100 = [v17 thumbnailMediumURL];
    v331 = [v17 generateThumbnailAssetHandleForURL:v100 withAssetManager:v21];

    v101 = [v17 thumbnailHQURL];
    v330 = [v17 generateThumbnailAssetHandleForURL:v101 withAssetManager:v21];

    v102 = [v17 thumbnailUltraHQURL];
    v329 = [v17 generateThumbnailAssetHandleForURL:v102 withAssetManager:v21];

    v103 = [v17 thumbnailWidgetLQURL];
    v328 = [v17 generateThumbnailAssetHandleForURL:v103 withAssetManager:v21];

    v104 = [v17 thumbnailWidgetURL];
    v327 = [v17 generateThumbnailAssetHandleForURL:v104 withAssetManager:v21];

    v105 = [v17 thumbnailWidgetHQURL];
    v322 = [v17 generateThumbnailAssetHandleForURL:v105 withAssetManager:v21];

    uint64_t v106 = [v17 shortExcerpt];
    shortExcerpt = v22->_shortExcerpt;
    v22->_shortExcerpt = (NSString *)v106;

    uint64_t v108 = [v17 accessoryText];
    accessoryText = v22->_accessoryText;
    v22->_accessoryText = (NSString *)v108;

    v110 = (void *)MEMORY[0x1E4F1C9C8];
    v111 = [v17 base];
    v112 = [v111 modificationDate];
    uint64_t v113 = [v110 dateWithPBDate:v112];
    lastModifiedDate = v22->_lastModifiedDate;
    v22->_lastModifiedDate = (NSDate *)v113;

    v115 = (void *)MEMORY[0x1E4F1C9C8];
    v116 = [v17 base];
    v117 = [v116 fetchDate];
    uint64_t v118 = [v115 dateWithPBDate:v117];
    lastFetchedDate = v22->_lastFetchedDate;
    v22->_lastFetchedDate = (NSDate *)v118;

    uint64_t v120 = [v17 topics];
    topics = v22->_topics;
    v22->_topics = (NSArray *)v120;

    uint64_t v122 = [v17 topicIDs];
    topicIDs = v22->_topicIDs;
    v22->_topicIDs = (NSArray *)v122;

    uint64_t v124 = [v17 globalCohorts];
    globalCohorts = v22->_globalCohorts;
    v22->_globalCohorts = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v124;

    uint64_t v126 = [v17 globalConversionStats];
    globalConversionStats = v22->_globalConversionStats;
    v22->_globalConversionStats = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v126;

    uint64_t v128 = [v17 sourceChannelCohorts];
    publisherCohorts = v22->_publisherCohorts;
    v22->_publisherCohorts = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v128;

    uint64_t v130 = [v17 channelConversionStats];
    publisherConversionStats = v22->_publisherConversionStats;
    v22->_publisherConversionStats = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v130;

    uint64_t v132 = [v17 channelTagMetadata];
    publisherTagMetadata = v22->_publisherTagMetadata;
    v22->_publisherTagMetadata = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)v132;

    if ([v17 isSponsored])
    {
      BOOL v134 = 1;
    }
    else
    {
      self;
      if (qword_1EB5D0E38 != -1) {
        dispatch_once(&qword_1EB5D0E38, &__block_literal_global_51_1);
      }
      BOOL v134 = _MergedGlobals_17 != 0;
    }
    v22->_sponsored = v134;
    uint64_t v135 = [v17 iAdCategories];
    iAdCategories = v22->_iAdCategories;
    v22->_iAdCategories = (NSArray *)v135;

    uint64_t v137 = [v17 iAdKeywords];
    iAdKeywords = v22->_iAdKeywords;
    v22->_iAdKeywords = (NSArray *)v137;

    uint64_t v139 = [v17 iAdSectionIDs];
    iAdSectionIDs = v22->_iAdSectionIDs;
    v22->_iAdSectionIDs = (NSArray *)v139;

    v22->_isDraft = [v17 isDraft];
    uint64_t v141 = [v17 blockedStorefrontIDs];
    blockedStorefrontIDs = v22->_blockedStorefrontIDs;
    v22->_blockedStorefrontIDs = (NSArray *)v141;

    uint64_t v143 = [v17 allowedStorefrontIDs];
    allowedStorefrontIDs = v22->_allowedStorefrontIDs;
    v22->_allowedStorefrontIDs = (NSArray *)v143;

    v145 = [v17 base];
    v22->_deleted = [v145 deletedFromCloud];

    uint64_t v146 = [v17 relatedArticleIDs];
    relatedArticleIDs = v22->_relatedArticleIDs;
    v22->_relatedArticleIDs = (NSArray *)v146;

    uint64_t v148 = [v17 moreFromPublisherArticleIDs];
    moreFromPublisherArticleIDs = v22->_moreFromPublisherArticleIDs;
    v22->_moreFromPublisherArticleIDs = (NSArray *)v148;

    uint64_t v150 = [v17 contentType] - 1;
    if (v150 < 3) {
      unint64_t v151 = v150 + 1;
    }
    else {
      unint64_t v151 = 0;
    }
    v22->_contentType = v151;
    uint64_t v152 = [v17 role] - 1;
    if (v152 < 8) {
      unint64_t v153 = v152 + 1;
    }
    else {
      unint64_t v153 = 0;
    }
    v22->_role = v153;
    uint64_t v154 = [v20 copy];
    parentIssue = v22->_parentIssue;
    v22->_parentIssue = (FCIssue *)v154;

    if (v20) {
      [(FCHeadline *)v22 markAsEvergreen];
    }
    v22->_halfLife = [v17 halfLifeMilliseconds];
    v22->_halfLifeOverride = [v17 halfLifeMillisecondsOverride];
    uint64_t v156 = [v17 linkedArticleIDs];
    linkedArticleIDs = v22->_linkedArticleIDs;
    v22->_linkedArticleIDs = (NSArray *)v156;

    uint64_t v158 = [v17 linkedIssueIDs];
    linkedIssueIDs = v22->_linkedIssueIDs;
    v22->_linkedIssueIDs = (NSArray *)v158;

    uint64_t v160 = [v17 authors];
    authors = v22->_authors;
    v22->_authors = (NSArray *)v160;

    uint64_t v162 = [v17 contentURL];
    if (v162)
    {
      v163 = [MEMORY[0x1E4F1CB10] URLWithString:v162];
    }
    else
    {
      v163 = 0;
    }
    objc_storeStrong((id *)&v22->_contentURL, v163);
    if (v162) {

    }
    v312 = (void *)v162;
    v164 = [v17 videoURL];
    uint64_t v165 = [v164 length];
    v311 = v164;
    if (v165)
    {
      v166 = [MEMORY[0x1E4F1CB10] URLWithString:v164];
    }
    else
    {
      v166 = 0;
    }
    objc_storeStrong((id *)&v22->_videoURL, v166);
    if (v165) {

    }
    v167 = [v17 videoStillImageURL];
    uint64_t v168 = [v17 generateThumbnailAssetHandleForURL:v167 withAssetManager:v21];
    videoStillImage = v22->_videoStillImage;
    v22->_videoStillImage = (FCAssetHandle *)v168;

    [v17 videoDuration];
    v22->_videoDuration = v170;
    v171 = [FCCoverArt alloc];
    v172 = [v17 coverArt];
    uint64_t v173 = [(FCCoverArt *)v171 initWithJSONString:v172];
    coverArt = v22->_coverArt;
    v22->_coverArt = (FCCoverArt *)v173;

    v175 = [v17 videoCallToActionTitle];
    uint64_t v176 = [v175 copy];
    videoCallToActionTitle = v22->_videoCallToActionTitle;
    v22->_videoCallToActionTitle = (NSString *)v176;

    uint64_t v178 = [v17 videoCallToActionURL];
    if (v178)
    {
      uint64_t v179 = [MEMORY[0x1E4F1CB10] URLWithString:v178];
      videoCallToActionURL = v22->_videoCallToActionURL;
      v22->_videoCallToActionURL = (NSURL *)v179;
    }
    uint64_t v181 = [v17 videoType];
    videoType = v22->_videoType;
    v22->_videoType = (NSString *)v181;

    uint64_t v183 = [v17 sportsEventIDs];
    sportsEventIDs = v22->_sportsEventIDs;
    v22->_sportsEventIDs = (NSArray *)v183;

    v185 = [MEMORY[0x1E4F1C9C8] date];
    [v185 timeIntervalSinceDate:v22->_lastModifiedDate];
    double v187 = v186;

    self;
    v310 = (void *)v178;
    if (qword_1EB5D0E40 != -1) {
      dispatch_once(&qword_1EB5D0E40, &__block_literal_global_53_0);
    }
    if (byte_1EB5D0E31)
    {
      uint64_t v188 = arc4random_uniform(3u) + 1;
      if (v188 < 5)
      {
        v22->_storyType = v188 + 1;
        v185 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        v189 = [v337 objectForKey:v185];
      }
      else
      {
        v189 = 0;
        v22->_storyType = 0;
      }
      objc_storeStrong((id *)&v22->_storyStyle, v189);
      if (v188 <= 4)
      {
      }
    }
    uint64_t v190 = [v17 behaviorFlags];
    LOWORD(behaviorFlags) = v190;
    v22->_int64_t behaviorFlags = v190;
    if (v190)
    {
      if (v187 >= (double)a9)
      {
        v193 = (void *)FCDefaultLog;
        BOOL v194 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
        char v192 = 0;
        if (v194)
        {
          v195 = v193;
          v196 = [(FCArticleHeadline *)v22 articleID];
          v197 = v22->_lastModifiedDate;
          v198 = [NSNumber numberWithLongLong:a9];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v196;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v197;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&long long v342 = v198;
          _os_log_impl(&dword_1A460D000, v195, OS_LOG_TYPE_DEFAULT, "Headline will ignore rapid-updates flag due to rapid-updates timeout, articleID=%{public}@, lastModified=%{public}@, timeout=%{public}@", buf, 0x20u);

          char v192 = 0;
          int64_t behaviorFlags = v22->_behaviorFlags;
        }
      }
      else
      {
        char v192 = 1;
      }
      v22->_needsRapidUpdates = v192;
    }
    v22->_disableTapToChannel = (behaviorFlags & 2) != 0;
    v22->_boundToContext = (behaviorFlags & 4) != 0;
    v22->_hiddenFromFeeds = (behaviorFlags & 8) != 0;
    v22->_pressRelease = (behaviorFlags & 0x10) != 0;
    v22->_hiddenFromAutoFavorites = (behaviorFlags & 0x20) != 0;
    v22->_webEmbedsEnabled = (behaviorFlags & 0x40) != 0;
    v22->_showBundleSoftPaywall = (behaviorFlags & 0x80) != 0;
    v22->_useTransparentNavigationBar = BYTE1(behaviorFlags) & 1;
    v22->_disableBookmarking = (behaviorFlags & 0x200) != 0;
    v22->_hideModalCloseButton = (behaviorFlags & 0x400) != 0;
    v22->_reduceVisibilitdouble y = (behaviorFlags & 0x800) != 0;
    v22->_webConverted = (behaviorFlags & 0x1000) != 0;
    v22->_disablePrerollAds = (behaviorFlags & 0x4000) != 0;
    v22->_aiGenerated = (behaviorFlags & 0x8000) != 0;
    v22->_minimumNewsVersion = [v17 minimumNewsVersion];
    v22->_paid = [v17 isPaid];
    v22->_bundlePaid = [v17 isBundlePaid];
    v22->_canBePurchased = [v335 isPurchaseSetup];
    v22->_issueOnldouble y = [v17 isIssueOnly];
    v199 = [v17 layeredCover];
    uint64_t v200 = [v199 copy];
    layeredThumbnailJSON = v22->_layeredThumbnailJSON;
    v22->_layeredThumbnailJSON = (NSString *)v200;

    [v17 layeredCoverAspectRatio];
    v22->_layeredThumbnailAspectRatio = v202;
    v203 = [v17 routeURL];
    uint64_t v204 = [v203 length];
    if (v204)
    {
      v205 = [MEMORY[0x1E4F1CB10] URLWithString:v203];
    }
    else
    {
      v205 = 0;
    }
    objc_storeStrong((id *)&v22->_routeURL, v205);
    if (v204) {

    }
    v22->_dataSource = 0;
    if ([v17 schemaFlags])
    {
      v209 = [v17 articleRecirculationConfigurationURL];

      if (!v209) {
        goto LABEL_87;
      }
      v207 = [v17 articleRecirculationConfigurationURL];
      uint64_t v208 = [v21 assetHandleForCKAssetURLString:v207 lifetimeHint:2];
    }
    else
    {
      v206 = FCCKLocalizedArticleArticleRecirculationConfigurationKey();
      v207 = +[FCRecordFieldURLProtocol URLForRecordID:v336 fieldName:v206];

      uint64_t v208 = [v21 assetHandleForURL:v207 lifetimeHint:2];
    }
    articleRecirculationConfigAssetHandle = v22->_articleRecirculationConfigAssetHandle;
    v22->_articleRecirculationConfigAssetHandle = (FCAssetHandle *)v208;

LABEL_87:
    id v326 = v18;
    id v211 = v17;
    id v325 = v21;
    v212 = v21;
    v213 = (void *)MEMORY[0x1E4F1CB10];
    v214 = [v211 narrativeTrackFullURL];
    v215 = objc_msgSend(v213, "fc_safeURLWithString:", v214);

    if (v215)
    {
      id v216 = v215;
      v217 = [v211 narrativeTrackMetadata];
      if (v217)
      {
        id v340 = 0;
        v218 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:error:", v217, &v340);
        id v219 = v340;
        v220 = v219;
        if (v218)
        {
          id v305 = v219;
          v306 = v217;
          v309 = v216;
          uint64_t v221 = [v218 objectForKeyedSubscript:@"description"];
          excerpt = v22->_excerpt;
          v22->_excerpt = (NSString *)v221;

          uint64_t v223 = [v218 objectForKeyedSubscript:@"narrators"];
          narrators = v22->_narrators;
          v22->_narrators = (NSArray *)v223;

          uint64_t v225 = [v218 objectForKeyedSubscript:@"preferredUpsellVariant"];
          narrativeTrackPreferredUpsellVariantID = v22->_narrativeTrackPreferredUpsellVariantID;
          v22->_narrativeTrackPreferredUpsellVariantID = (NSString *)v225;

          v227 = [v218 objectForKeyedSubscript:@"upNext"];
          v228 = (void *)MEMORY[0x1E4F1C978];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_48;
          *(void *)&long long v342 = &unk_1E5B4BF30;
          id v304 = v227;
          *((void *)&v342 + 1) = v304;
          uint64_t v229 = objc_msgSend(v228, "fc_array:", buf);
          narrativeTrackBuddyArticleIDs = v22->_narrativeTrackBuddyArticleIDs;
          v22->_narrativeTrackBuddyArticleIDs = (NSArray *)v229;

          [v211 narrativeTrackFullIdentifier];
          v308 = v307 = v203;
          if (v212) {
            v231 = (void *)v212[14];
          }
          else {
            v231 = 0;
          }
          id v232 = v231;
          v233 = +[FCArticleHeadline _tempOverrideMIMETypeForURL:]((uint64_t)FCArticleHeadline, v309);
          uint64_t v234 = [v232 assetWithIdentifier:v308 remoteURL:v309 overrideMIMEType:v233];

          v235 = [FCArticleAudioTrack alloc];
          v236 = [v218 objectForKeyedSubscript:@"fullTrackDuration"];
          [v236 doubleValue];
          v303 = (void *)v234;
          uint64_t v237 = -[FCArticleAudioTrack initWithType:asset:duration:](v235, "initWithType:asset:duration:", 0, v234);
          narrativeTrack = v22->_narrativeTrack;
          v22->_narrativeTrack = (FCArticleAudioTrack *)v237;

          v239 = (void *)MEMORY[0x1E4F1CB10];
          v240 = [v211 narrativeTrackSampleURL];
          v241 = objc_msgSend(v239, "fc_safeURLWithString:", v240);

          v302 = v212;
          if (v241)
          {
            double v301 = v81;
            double v242 = v83;
            double v243 = v78;
            double v244 = v80;
            uint64_t v245 = [v211 narrativeTrackSampleIdentifier];
            double v246 = v77;
            if (v212) {
              v247 = (void *)v212[14];
            }
            else {
              v247 = 0;
            }
            id v248 = v247;
            v249 = +[FCArticleHeadline _tempOverrideMIMETypeForURL:]((uint64_t)FCArticleHeadline, v241);
            v299 = [v248 assetWithIdentifier:v245 remoteURL:v241 overrideMIMEType:v249];

            v250 = [FCArticleAudioTrack alloc];
            v300 = [v218 objectForKeyedSubscript:@"sampleTrackDuration"];
            [v300 doubleValue];
            double v252 = v251;
            v253 = [v218 objectForKeyedSubscript:@"sampleTrackEmbeddedUpsellStartTime"];
            [v253 doubleValue];
            double v255 = v254;
            [v218 objectForKeyedSubscript:@"sampleTrackEmbeddedUpsellEndTime"];
            v257 = v256 = (void *)v245;
            [v257 doubleValue];
            uint64_t v259 = [(FCArticleAudioTrack *)v250 initWithType:0 asset:v299 duration:v252 embeddedUpsellStartTime:v255 embeddedUpsellEndTime:v258];
            narrativeTrackSample = v22->_narrativeTrackSample;
            v22->_narrativeTrackSample = (FCArticleAudioTrack *)v259;

            double v77 = v246;
            double v80 = v244;
            double v78 = v243;
            double v83 = v242;
            double v81 = v301;
          }
          else
          {
            v261 = v22->_narrativeTrack;
            v256 = v22->_narrativeTrackSample;
            v22->_narrativeTrackSample = v261;
          }
          v203 = v307;
          v220 = v305;

          uint64_t v262 = [v211 narrativeTrackTextRanges];
          narrativeTrackTextRanges = v22->_narrativeTrackTextRanges;
          v22->_narrativeTrackTextRanges = (NSString *)v262;

          id v216 = v309;
          v217 = v306;
          v212 = v302;
        }
        else
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_47;
          *(void *)&long long v342 = &unk_1E5B4BE70;
          *((void *)&v342 + 1) = v22;
          id v343 = v219;
          __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_47((uint64_t)buf);
        }
      }
      else
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2;
        *(void *)&long long v342 = &unk_1E5B4C018;
        *((void *)&v342 + 1) = v22;
        __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2((uint64_t)buf);
      }
    }
    uint64_t v264 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v333, v78, v77);
    thumbnailLQ = v22->_thumbnailLQ;
    v22->_thumbnailLQ = (FCHeadlineThumbnail *)v264;

    uint64_t v266 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v332, v81, v80);
    thumbnail = v22->_thumbnail;
    v22->_thumbnail = (FCHeadlineThumbnail *)v266;

    uint64_t v268 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v331, v320, v83);
    thumbnailMedium = v22->_thumbnailMedium;
    v22->_thumbnailMedium = (FCHeadlineThumbnail *)v268;

    uint64_t v270 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v330, v318, v321);
    thumbnailHQ = v22->_thumbnailHQ;
    v22->_thumbnailHQ = (FCHeadlineThumbnail *)v270;

    uint64_t v272 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v329, v316, v319);
    thumbnailUltraHQ = v22->_thumbnailUltraHQ;
    v22->_thumbnailUltraHQ = (FCHeadlineThumbnail *)v272;

    uint64_t v274 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v328, v314, v317);
    thumbnailWidgetLQ = v22->_thumbnailWidgetLQ;
    v22->_thumbnailWidgetLQ = (FCHeadlineThumbnail *)v274;

    uint64_t v276 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v327, v313, v315);
    thumbnailWidget = v22->_thumbnailWidget;
    v22->_thumbnailWidget = (FCHeadlineThumbnail *)v276;

    uint64_t v278 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v322, v76, v75);
    thumbnailWidgetHQ = v22->_thumbnailWidgetHQ;
    v22->_thumbnailWidgetHQ = (FCHeadlineThumbnail *)v278;

    if (v22->_thumbnailLQ)
    {
      BOOL v280 = 1;
      id v18 = v326;
    }
    else
    {
      id v18 = v326;
      if (!v22->_thumbnail)
      {
        p_videoURL = &v22->_videoURL;
        if (v22->_thumbnailMedium)
        {
          BOOL v280 = 1;
          id v20 = v334;
          id v19 = v335;
        }
        else
        {
          id v20 = v334;
          if (v22->_thumbnailHQ) {
            BOOL v280 = 1;
          }
          else {
            BOOL v280 = v22->_thumbnailUltraHQ != 0;
          }
          id v19 = v335;
        }
        goto LABEL_107;
      }
      BOOL v280 = 1;
    }
    id v20 = v334;
    id v19 = v335;
    p_videoURL = &v22->_videoURL;
LABEL_107:
    v22->_hasThumbnail = v280;
    id v21 = v325;
    if (!v22->_halfLife)
    {
      uint64_t v282 = 21600000;
      if (v20 && [v20 halfLife]) {
        uint64_t v282 = [v20 halfLife];
      }
      v22->_halfLife = v282;
    }
    if (*p_videoURL
      && [(FCArticleHeadline *)v22 contentType] != 2
      && *p_videoURL
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v298 = (void *)[[NSString alloc] initWithFormat:@"The videoURL field should only be set for ANF articles"];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:stor"
                           "yStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCArticleHeadline.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v342) = 521;
      WORD2(v342) = 2114;
      *(void *)((char *)&v342 + 6) = v298;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }

  return v22;
}

- (id)videoURL
{
  return self->_videoURL;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (void)setIsEvergreen:(BOOL)a3
{
  self->_isEvergreen = a3;
}

+ (__CFString)_tempOverrideMIMETypeForURL:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 pathExtension];
  uint64_t v4 = [v3 length];

  if (!v4) {
    goto LABEL_5;
  }
  v5 = [v2 pathExtension];
  if ([v5 isEqualToString:@"aif"])
  {

LABEL_5:
    v8 = @"audio/mpeg";
    goto LABEL_6;
  }
  v6 = [v2 pathExtension];
  int v7 = [v6 isEqualToString:@"aiff"];

  if (v7) {
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)authors
{
  return self->_authors;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (id)videoStillImage
{
  return self->_videoStillImage;
}

- (id)articleID
{
  return self->_articleID;
}

- (id)routeURL
{
  return self->_routeURL;
}

- (id)sourceName
{
  return self->_sourceName;
}

- (BOOL)isAIGenerated
{
  return self->_aiGenerated;
}

- (id)thumbnailImageBackgroundColor
{
  thumbnailImageBackgroundColor = self->_thumbnailImageBackgroundColor;
  if (thumbnailImageBackgroundColor)
  {
    v3 = thumbnailImageBackgroundColor;
  }
  else
  {
    uint64_t v4 = [(FCArticleHeadline *)self articleRecord];
    v5 = [v4 thumbnailBackgroundColor];
    v3 = +[FCColor nullableColorWithHexString:v5];
  }
  return v3;
}

- (id)thumbnailImagePrimaryColor
{
  thumbnailImagePrimaryColor = self->_thumbnailImagePrimaryColor;
  if (thumbnailImagePrimaryColor)
  {
    v3 = thumbnailImagePrimaryColor;
  }
  else
  {
    uint64_t v4 = [(FCArticleHeadline *)self articleRecord];
    v5 = [v4 thumbnailPrimaryColor];
    v3 = +[FCColor nullableColorWithHexString:v5];
  }
  return v3;
}

- (id)thumbnailImageTextColor
{
  thumbnailImageTextColor = self->_thumbnailImageTextColor;
  if (thumbnailImageTextColor)
  {
    v3 = thumbnailImageTextColor;
  }
  else
  {
    uint64_t v4 = [(FCArticleHeadline *)self articleRecord];
    v5 = [v4 thumbnailTextColor];
    v3 = +[FCColor nullableColorWithHexString:v5];
  }
  return v3;
}

- (id)thumbnailImageAccentColor
{
  thumbnailImageAccentColor = self->_thumbnailImageAccentColor;
  if (thumbnailImageAccentColor)
  {
    v3 = thumbnailImageAccentColor;
  }
  else
  {
    uint64_t v4 = [(FCArticleHeadline *)self articleRecord];
    v5 = [v4 thumbnailAccentColor];
    v3 = +[FCColor nullableColorWithHexString:v5];
  }
  return v3;
}

- (NTPBArticleRecord)articleRecord
{
  return self->_articleRecord;
}

- (FCContentManifest)contentManifest
{
  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FCArticleHeadline_contentManifest__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  v5 = [(FCContentManifest *)v3 initWithManifests:v4];

  return v5;
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "objectForKeyedSubscript:", @"articleID", (void)v10);
        objc_msgSend(v3, "fc_safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __36__FCArticleHeadline_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 articleRecord];
  uint64_t v6 = [v5 base];
  uint64_t v7 = [v6 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  uint64_t v8 = [*(id *)(a1 + 32) sourceChannel];
  v9 = v8;
  if (v8)
  {
    if ([v8 conformsToProtocol:&unk_1EF8E9808]) {
      long long v10 = v9;
    }
    else {
      long long v10 = 0;
    }
  }
  else
  {
    long long v10 = 0;
  }
  id v14 = v10;

  long long v11 = [v14 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

  long long v12 = [*(id *)(a1 + 32) parentIssue];
  long long v13 = [v12 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v13);
}

- (id)parentIssue
{
  return self->_parentIssue;
}

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (id)storyStyle
{
  return self->_storyStyle;
}

void __43__FCArticleHeadline__fakeArticlesTimestamp__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB5D0E32 = [v0 BOOLForKey:@"newsfeed.content.show_fake_timestamps"];
}

void __55__FCArticleHeadline__forceArticlesToBeShownAsSponsored__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_17 = [v0 BOOLForKey:@"force_articles_to_be_shown_as_sponsored"];
}

void __46__FCArticleHeadline__simulateTopStoriesBadges__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB5D0E31 = [v0 BOOLForKey:@"simulate_top_stories_badges"];
}

- (BOOL)needsRapidUpdates
{
  return self->_needsRapidUpdates;
}

- (BOOL)isPressRelease
{
  return self->_pressRelease;
}

- (BOOL)isLocalDraft
{
  return self->_isLocalDraft;
}

- (unint64_t)dataSource
{
  return self->_dataSource;
}

- (id)contentWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FCArticleContent alloc];
  uint64_t v6 = [(FCArticleHeadline *)self articleRecord];
  uint64_t v7 = [(FCArticleContent *)v5 initWithContext:v4 articleRecord:v6];

  return v7;
}

- (FCArticleHeadline)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCArticleHeadline init]";
    __int16 v9 = 2080;
    long long v10 = "FCArticleHeadline.m";
    __int16 v11 = 1024;
    int v12 = 176;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCArticleHeadline init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCArticleHeadline)initWithArticleMetadata:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v89.receiver = self;
  v89.super_class = (Class)FCArticleHeadline;
  __int16 v11 = [(FCHeadline *)&v89 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    sourceChannel = v11->_sourceChannel;
    v11->_sourceChannel = (FCChannelProviding *)v12;

    uint64_t v14 = [v9 name];
    sourceName = v11->_sourceName;
    v11->_sourceName = (NSString *)v14;

    uint64_t v16 = [v8 articleID];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    uint64_t v18 = [v8 articleID];
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v18;

    uint64_t v20 = [v8 title];
    title = v11->_title;
    v11->_title = (NSString *)v20;

    uint64_t v22 = [v8 publishDate];
    publishDate = v11->_publishDate;
    v11->_publishDate = (NSDate *)v22;

    v11->_contentType = [v8 contentType];
    v24 = [v8 thumbnailTextColor];
    uint64_t v25 = +[FCColor nullableColorWithHexString:v24];
    thumbnailImageTextColor = v11->_thumbnailImageTextColor;
    v11->_thumbnailImageTextColor = (FCColor *)v25;

    v27 = [v8 thumbnailBackgroundColor];
    uint64_t v28 = +[FCColor nullableColorWithHexString:v27];
    thumbnailImageBackgroundColor = v11->_thumbnailImageBackgroundColor;
    v11->_thumbnailImageBackgroundColor = (FCColor *)v28;

    v30 = [v8 thumbnailAccentColor];
    uint64_t v31 = +[FCColor nullableColorWithHexString:v30];
    thumbnailImageAccentColor = v11->_thumbnailImageAccentColor;
    v11->_thumbnailImageAccentColor = (FCColor *)v31;

    v33 = [v8 thumbnailPrimaryColor];
    uint64_t v34 = +[FCColor nullableColorWithHexString:v33];
    thumbnailImagePrimaryColor = v11->_thumbnailImagePrimaryColor;
    v11->_thumbnailImagePrimaryColor = (FCColor *)v34;

    v11->_thumbnailFocalFrame.origin.double x = FCCGRectFromBuffer([v8 thumbnailFocalFrame]);
    v11->_thumbnailFocalFrame.origin.double y = v36;
    v11->_thumbnailFocalFrame.size.double width = v37;
    v11->_thumbnailFocalFrame.size.double height = v38;
    v39 = [v8 thumbnail];

    uint64_t v40 = (double *)MEMORY[0x1E4F1DB30];
    if (v39)
    {
      unint64_t v41 = [v8 thumbnailMetadata];
      if (v41) {
        double v42 = (double)((v41 >> 8) & 0xFFFFFFF);
      }
      else {
        double v42 = v40[1];
      }
      if (v41) {
        double v43 = (double)(v41 >> 36);
      }
      else {
        double v43 = *v40;
      }
      v44 = objc_msgSend(v8, "thumbnail", *v40);
      uint64_t v45 = [v10 assetHandleForCKAssetURLString:v44 lifetimeHint:0];

      uint64_t v46 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v45, v43, v42);
      thumbnail = v11->_thumbnail;
      v11->_thumbnail = (FCHeadlineThumbnail *)v46;
    }
    v48 = [v8 thumbnailHQ];

    if (v48)
    {
      unint64_t v49 = [v8 thumbnailHQMetadata];
      if (v49) {
        double v50 = (double)((v49 >> 8) & 0xFFFFFFF);
      }
      else {
        double v50 = v40[1];
      }
      if (v49) {
        double v51 = (double)(v49 >> 36);
      }
      else {
        double v51 = *v40;
      }
      v52 = objc_msgSend(v8, "thumbnailHQ", *v40);
      v53 = [v10 assetHandleForCKAssetURLString:v52 lifetimeHint:0];

      uint64_t v54 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v53, v51, v50);
      thumbnailHQ = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v54;
    }
    uint64_t v56 = [v8 thumbnailMedium];

    if (v56)
    {
      unint64_t v57 = [v8 thumbnailMediumMetadata];
      if (v57) {
        double v58 = (double)((v57 >> 8) & 0xFFFFFFF);
      }
      else {
        double v58 = v40[1];
      }
      if (v57) {
        double v59 = (double)(v57 >> 36);
      }
      else {
        double v59 = *v40;
      }
      uint64_t v60 = objc_msgSend(v8, "thumbnailHQ", *v40);
      v61 = [v10 assetHandleForCKAssetURLString:v60 lifetimeHint:0];

      uint64_t v62 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v61, v59, v58);
      v63 = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v62;
    }
    v64 = [v8 thumbnailHQ];

    if (v64)
    {
      unint64_t v65 = [v8 thumbnailHQMetadata];
      if (v65) {
        double v66 = (double)((v65 >> 8) & 0xFFFFFFF);
      }
      else {
        double v66 = v40[1];
      }
      if (v65) {
        double v67 = (double)(v65 >> 36);
      }
      else {
        double v67 = *v40;
      }
      v68 = objc_msgSend(v8, "thumbnailHQ", *v40);
      CGFloat v69 = [v10 assetHandleForCKAssetURLString:v68 lifetimeHint:0];

      uint64_t v70 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v69, v67, v66);
      CGFloat v71 = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v70;

      v11->_hasThumbnail = 1;
    }
    uint64_t v72 = [v8 thumbnailUltraHQ];

    if (v72)
    {
      unint64_t v73 = [v8 thumbnailUltraHQMetadata];
      if (v73) {
        double v74 = (double)((v73 >> 8) & 0xFFFFFFF);
      }
      else {
        double v74 = v40[1];
      }
      if (v73) {
        double v75 = (double)(v73 >> 36);
      }
      else {
        double v75 = *v40;
      }
      double v76 = objc_msgSend(v8, "thumbnailUltraHQ", *v40);
      double v77 = [v10 assetHandleForCKAssetURLString:v76 lifetimeHint:0];

      uint64_t v78 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v77, v75, v74);
      thumbnailUltraHQ = v11->_thumbnailUltraHQ;
      v11->_thumbnailUltraHQ = (FCHeadlineThumbnail *)v78;

      v11->_hasThumbnail = 1;
    }
    double v80 = [v8 videoURL];
    uint64_t v81 = [v80 length];
    if (v81)
    {
      unint64_t v82 = [MEMORY[0x1E4F1CB10] URLWithString:v80];
    }
    else
    {
      unint64_t v82 = 0;
    }
    objc_storeStrong((id *)&v11->_videoURL, v82);
    if (v81) {

    }
    BOOL v83 = v11->_thumbnail || v11->_thumbnailMedium || v11->_thumbnailHQ || v11->_thumbnailUltraHQ != 0;
    v11->_hasThumbnail = v83;
    v11->_paid = [v8 isPaid];
    v11->_bundlePaid = [v8 isPaid];
    uint64_t v84 = [v8 routeURL];
    routeURL = v11->_routeURL;
    v11->_routeURL = (NSURL *)v84;

    double v86 = [v8 contentURL];
    if (v86)
    {
      double v87 = [MEMORY[0x1E4F1CB10] URLWithString:v86];
    }
    else
    {
      double v87 = 0;
    }
    objc_storeStrong((id *)&v11->_contentURL, v87);
    if (v86) {

    }
    v11->_role = 1;
    v11->_dataSource = 1;
  }
  return v11;
}

- (FCArticleHeadline)initWithArticleRecordData:(id)a3 sourceChannel:(id)a4 parentIssue:(id)a5 assetManager:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F829B0]) initWithData:v10];
  if (v14)
  {
    self = [(FCArticleHeadline *)self initWithArticleRecord:v14 articleInterestToken:0 sourceChannel:v11 parentIssue:v12 storyStyleConfigs:0 storyTypeTimeout:0 rapidUpdatesTimeout:0 assetManager:v13 experimentalTitleProvider:0];
    uint64_t v15 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      id v17 = (void *)[[NSString alloc] initWithFormat:@"failed to parse data %@", v10];
      *(_DWORD *)buf = 136315906;
      id v19 = "-[FCArticleHeadline initWithArticleRecordData:sourceChannel:parentIssue:assetManager:]";
      __int16 v20 = 2080;
      id v21 = "FCArticleHeadline.m";
      __int16 v22 = 1024;
      int v23 = 533;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: ReferredArticleDecode) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)backingArticleRecordData
{
  id v2 = [(FCArticleHeadline *)self articleRecord];
  id v3 = [v2 data];

  return v3;
}

- (id)publisherSpecifiedArticleIDs
{
  id v2 = [(FCArticleHeadline *)self articleRecord];
  id v3 = [v2 publisherSpecifiedArticleIDs];

  return v3;
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FCArticleHeadline_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  id v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  id v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __35__FCArticleHeadline_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 articleRecord];
  id v6 = +[FCContentArchive archiveWithRecord:v5];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  uint64_t v7 = [*(id *)(a1 + 32) sourceChannel];
  id v8 = v7;
  if (v7)
  {
    if ([v7 conformsToProtocol:&unk_1EF8E9808]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v13 = v9;

  id v10 = [v13 contentArchive];
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  id v11 = [*(id *)(a1 + 32) parentIssue];
  id v12 = [v11 contentArchive];
  objc_msgSend(v4, "fc_safelyAddObject:", v12);
}

- (NSString)stocksClusterID
{
  id v2 = [(FCArticleHeadline *)self articleRecord];
  id v3 = [v2 stocksClusterID];

  return (NSString *)v3;
}

- (NSString)stocksMetadataJSON
{
  id v2 = [(FCArticleHeadline *)self articleRecord];
  id v3 = [v2 stocksMetadata];

  return (NSString *)v3;
}

- (NSString)stocksScoresJSON
{
  id v2 = [(FCArticleHeadline *)self articleRecord];
  id v3 = [v2 stocksScores];

  return (NSString *)v3;
}

- (id)publisherID
{
  id v3 = [(FCArticleHeadline *)self articleRecord];
  id v4 = [v3 sourceChannelTagID];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(FCHeadline *)self sourceChannelID];
  }
  uint64_t v7 = v6;

  return v7;
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 articleID];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "article %{public}@ has a narrative track URL but no metadata", (uint8_t *)&v6, 0xCu);
  }
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_47(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 articleID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "failed to parse narrative track metadata for %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)setArticleID:(id)a3
{
}

- (id)referencedArticleID
{
  return self->_referencedArticleID;
}

- (id)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void)setTitle:(id)a3
{
}

- (id)titleCompact
{
  return self->_titleCompact;
}

- (void)setTitleCompact:(id)a3
{
}

- (id)experimentalTitleMetadata
{
  return self->_experimentalTitleMetadata;
}

- (id)primaryAudience
{
  return self->_primaryAudience;
}

- (void)setPublishDate:(id)a3
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

- (void)setSourceName:(id)a3
{
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (id)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void)setThumbnailLQ:(id)a3
{
}

- (void)setThumbnail:(id)a3
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

- (id)thumbnailWidgetLQ
{
  return self->_thumbnailWidgetLQ;
}

- (id)thumbnailWidget
{
  return self->_thumbnailWidget;
}

- (id)thumbnailWidgetHQ
{
  return self->_thumbnailWidgetHQ;
}

- (void)setShortExcerpt:(id)a3
{
}

- (id)accessoryText
{
  return self->_accessoryText;
}

- (void)setAccessoryText:(id)a3
{
}

- (id)contentURL
{
  return self->_contentURL;
}

- (id)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (id)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (id)topics
{
  return self->_topics;
}

- (id)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (id)globalCohorts
{
  return self->_globalCohorts;
}

- (id)publisherCohorts
{
  return self->_publisherCohorts;
}

- (id)globalConversionStats
{
  return self->_globalConversionStats;
}

- (id)publisherConversionStats
{
  return self->_publisherConversionStats;
}

- (id)publisherTagMetadata
{
  return self->_publisherTagMetadata;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (void)setAiGenerated:(BOOL)a3
{
  self->_aiGenerated = a3;
}

- (id)iAdCategories
{
  return self->_iAdCategories;
}

- (id)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (BOOL)isFeatureCandidate
{
  return self->_featureCandidate;
}

- (id)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (id)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (void)setStoryStyle:(id)a3
{
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

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (id)coverArt
{
  return self->_coverArt;
}

- (id)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (id)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (id)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
}

- (id)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (void)setSportsEventIDs:(id)a3
{
}

- (BOOL)canBePurchased
{
  return self->_canBePurchased;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (BOOL)showBundleSoftPaywall
{
  return self->_showBundleSoftPaywall;
}

- (BOOL)useTransparentNavigationBar
{
  return self->_useTransparentNavigationBar;
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

- (unint64_t)halfLife
{
  return self->_halfLife;
}

- (void)setHalfLife:(unint64_t)a3
{
  self->_halfLife = a3;
}

- (unint64_t)halfLifeOverride
{
  return self->_halfLifeOverride;
}

- (id)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (id)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (id)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (id)narrators
{
  return self->_narrators;
}

- (id)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
}

- (id)narrativeTrackBuddyArticleIDs
{
  return self->_narrativeTrackBuddyArticleIDs;
}

- (id)narrativeTrackPreferredUpsellVariantID
{
  return self->_narrativeTrackPreferredUpsellVariantID;
}

- (id)globalExpirationTime
{
  return self->_globalExpirationTime;
}

- (void)setGlobalExpirationTime:(id)a3
{
}

- (id)tagsExpiration
{
  return self->_tagsExpiration;
}

- (id)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (id)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (id)articleRecirculationConfigAssetHandle
{
  return self->_articleRecirculationConfigAssetHandle;
}

- (void)setArticleRecord:(id)a3
{
}

- (FCInterestToken)articleInterestToken
{
  return self->_articleInterestToken;
}

- (void)setArticleInterestToken:(id)a3
{
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  self->_int64_t behaviorFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleInterestToken, 0);
  objc_storeStrong((id *)&self->_articleRecord, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfigAssetHandle, 0);
  objc_storeStrong((id *)&self->_float16FullBodyEncoding, 0);
  objc_storeStrong((id *)&self->_float16TitleEncoding, 0);
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
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_videoType, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_parentIssue, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_videoStillImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_publisherTagMetadata, 0);
  objc_storeStrong((id *)&self->_publisherConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);
  objc_storeStrong((id *)&self->_publisherCohorts, 0);
  objc_storeStrong((id *)&self->_globalCohorts, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailWidget, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailPerceptualHash, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_experimentalTitleMetadata, 0);
  objc_storeStrong((id *)&self->_titleCompact, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end