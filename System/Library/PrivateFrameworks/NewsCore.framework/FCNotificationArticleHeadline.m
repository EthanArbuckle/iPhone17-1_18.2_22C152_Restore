@interface FCNotificationArticleHeadline
- (BOOL)disableBookmarking;
- (BOOL)disableTapToChannel;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasThumbnail;
- (BOOL)hasVideo;
- (BOOL)hideModalCloseButton;
- (BOOL)isANF;
- (BOOL)isBoundToContext;
- (BOOL)isBundlePaid;
- (BOOL)isDeleted;
- (BOOL)isDraft;
- (BOOL)isFeatureCandidate;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isHiddenFromFeeds;
- (BOOL)isIssueOnly;
- (BOOL)isLocalDraft;
- (BOOL)isPaid;
- (BOOL)isPressRelease;
- (BOOL)isSponsored;
- (BOOL)isValid;
- (BOOL)needsRapidUpdates;
- (BOOL)reduceVisibility;
- (BOOL)reduceVisibilityForNonFollowers;
- (BOOL)showBundleSoftPaywall;
- (BOOL)useTransparentNavigationBar;
- (BOOL)webConverted;
- (BOOL)webEmbedsEnabled;
- (CGRect)thumbnailFocalFrame;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (FCAssetManager)assetManager;
- (FCNotificationArticleHeadline)initWithArticlePayload:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5;
- (NSArray)flintFontResourceIDs;
- (NSArray)iAdCategories;
- (NSArray)topicCohortScoresCTRs;
- (NSArray)topicIDs;
- (NSArray)topics;
- (NSData)flintDocumentPrefetchedData;
- (NSDate)publishDate;
- (NSDictionary)articlePayload;
- (NSNumber)channelCohortScoresCTR;
- (NSNumber)globalCohortScoresCTR;
- (NSString)changeEtag;
- (NSString)clusterID;
- (NSString)flintDocumentUrlString;
- (NSString)publisherID;
- (NSString)sourceFeedID;
- (double)layeredThumbnailAspectRatio;
- (double)videoDuration;
- (id)accessoryText;
- (id)allowedStorefrontIDs;
- (id)articleID;
- (id)articleRecirculationConfigAssetHandle;
- (id)blockedStorefrontIDs;
- (id)callToActionText;
- (id)contentURL;
- (id)contentWithContext:(id)a3;
- (id)coverArt;
- (id)generateFlintDocumentAssetHandleForUrlString:(id)a3 prefetchedData:(id)a4 withAssetManager:(id)a5;
- (id)generateThumbnailAssetHandleForUrlString:(id)a3 withAssetManager:(id)a4;
- (id)iAdKeywords;
- (id)iAdSectionIDs;
- (id)identifier;
- (id)lastFetchedDate;
- (id)lastModifiedDate;
- (id)layeredThumbnailJSON;
- (id)linkedArticleIDs;
- (id)linkedIssueIDs;
- (id)moreFromPublisherArticleIDs;
- (id)narrativeTrack;
- (id)narrativeTrackSample;
- (id)narrativeTrackTextRanges;
- (id)primaryAudience;
- (id)publisherSpecifiedArticleIDs;
- (id)referencedArticleID;
- (id)relatedArticleIDs;
- (id)routeURL;
- (id)shortExcerpt;
- (id)sourceChannel;
- (id)sourceName;
- (id)storyStyle;
- (id)surfacedByArticleListIDs;
- (id)thumbnail;
- (id)thumbnailHQ;
- (id)thumbnailLQ;
- (id)thumbnailMedium;
- (id)thumbnailUltraHQ;
- (id)title;
- (id)videoURL;
- (int64_t)backendArticleVersion;
- (int64_t)bodyTextLength;
- (int64_t)minimumNewsVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)contentType;
- (unint64_t)halfLife;
- (unint64_t)role;
- (unint64_t)storyType;
- (void)enumerateTopicCohortsWithBlock:(id)a3;
- (void)setAccessoryText:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticlePayload:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setCallToActionText:(id)a3;
- (void)setChangeEtag:(id)a3;
- (void)setChannelCohortScoresCTR:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFlintDocumentPrefetchedData:(id)a3;
- (void)setFlintDocumentUrlString:(id)a3;
- (void)setFlintFontResourceIDs:(id)a3;
- (void)setGlobalCohortScoresCTR:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)setShortExcerpt:(id)a3;
- (void)setSourceChannel:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSponsored:(BOOL)a3;
- (void)setStoryStyle:(id)a3;
- (void)setStoryType:(unint64_t)a3;
- (void)setSurfacedByArticleListIDs:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailFocalFrame:(CGRect)a3;
- (void)setThumbnailHQ:(id)a3;
- (void)setThumbnailLQ:(id)a3;
- (void)setThumbnailMedium:(id)a3;
- (void)setThumbnailUltraHQ:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicCohortScoresCTRs:(id)a3;
@end

@implementation FCNotificationArticleHeadline

- (FCNotificationArticleHeadline)initWithArticlePayload:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v130 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articlePayload");
    *(_DWORD *)buf = 136315906;
    v138 = "-[FCNotificationArticleHeadline initWithArticlePayload:sourceChannel:assetManager:]";
    __int16 v139 = 2080;
    v140 = "FCNotificationArticleHeadline.m";
    __int16 v141 = 1024;
    int v142 = 137;
    __int16 v143 = 2114;
    v144 = v130;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v136.receiver = self;
  v136.super_class = (Class)FCNotificationArticleHeadline;
  v12 = [(FCHeadline *)&v136 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_52;
  }
  objc_storeStrong((id *)&v12->_articlePayload, a3);
  objc_storeStrong((id *)&v13->_assetManager, a5);
  v14 = [v9 objectForKeyedSubscript:@"aid"];
  if (v14 || [0 length])
  {
    id v134 = v10;
    v135 = v11;
    if (v10)
    {
      uint64_t v15 = [v10 copy];
      sourceChannel = v13->_sourceChannel;
      v13->_sourceChannel = (FCChannelProviding *)v15;

      uint64_t v17 = [v10 name];
      sourceName = v13->_sourceName;
      v13->_sourceName = (NSString *)v17;
    }
    else
    {
      v132 = v14;
      sourceName = [v9 objectForKeyedSubscript:@"cid"];
      uint64_t v19 = [v9 objectForKeyedSubscript:@"pn"];
      v20 = [v9 objectForKeyedSubscript:@"pl2"];
      v21 = [v9 objectForKeyedSubscript:@"pm2"];
      if ([v20 length])
      {
        v22 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
        v23 = [v11 assetHandleForURL:v22 lifetimeHint:0];
      }
      else
      {
        v23 = 0;
      }
      if ([v21 length])
      {
        v26 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
        v27 = [v135 assetHandleForURL:v26 lifetimeHint:0];
      }
      else
      {
        v27 = 0;
      }
      uint64_t v28 = [sourceName length];
      if (v28) {
        id v29 = [[FCTag alloc] initChannelFromNotificationWithIdentifier:sourceName name:v19 nameImageAssetHandle:v23 nameImageMaskAssetHandle:v27];
      }
      else {
        id v29 = 0;
      }
      objc_storeStrong((id *)&v13->_sourceChannel, v29);
      if (v28) {

      }
      v30 = v13->_sourceName;
      v13->_sourceName = (NSString *)v19;

      id v11 = v135;
      v14 = v132;
    }

    objc_storeStrong((id *)&v13->_identifier, v14);
    objc_storeStrong((id *)&v13->_articleID, v14);
    v31 = [v9 objectForKeyedSubscript:@"isf"];
    v13->_featureCandidate = [v31 BOOLValue];

    uint64_t v32 = [v9 objectForKeyedSubscript:@"ra"];
    referencedArticleID = v13->_referencedArticleID;
    v13->_referencedArticleID = (NSString *)v32;

    uint64_t v34 = [v9 objectForKeyedSubscript:@"cli"];
    clusterID = v13->_clusterID;
    v13->_clusterID = (NSString *)v34;

    uint64_t v36 = [v9 objectForKeyedSubscript:@"ti"];
    title = v13->_title;
    v13->_title = (NSString *)v36;

    v38 = [v9 objectForKeyedSubscript:@"pd"];
    [v38 doubleValue];
    double v40 = v39;

    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", (unint64_t)v40);
    publishDate = v13->_publishDate;
    v13->_publishDate = (NSDate *)v41;

    v43 = [v9 objectForKeyedSubscript:@"ts"];
    [v43 doubleValue];
    double v45 = v44;

    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", (unint64_t)v45);
    lastModifiedDate = v13->_lastModifiedDate;
    v13->_lastModifiedDate = (NSDate *)v46;

    objc_storeStrong((id *)&v13->_lastFetchedDate, v13->_lastModifiedDate);
    v48 = [v9 objectForKeyedSubscript:@"prev"];
    v13->_publisherArticleVersion = [v48 unsignedLongLongValue];

    v49 = [v9 objectForKeyedSubscript:@"rev"];
    v13->_backendArticleVersion = [v49 unsignedLongLongValue];

    uint64_t v50 = [v9 objectForKeyedSubscript:@"etag"];
    changeEtag = v13->_changeEtag;
    v13->_changeEtag = (NSString *)v50;

    v52 = [v9 objectForKeyedSubscript:@"tnff"];
    v13->_thumbnailFocalFrame.origin.x = FCCGRectFromBuffer([v52 unsignedLongLongValue]);
    v13->_thumbnailFocalFrame.origin.y = v53;
    v13->_thumbnailFocalFrame.size.width = v54;
    v13->_thumbnailFocalFrame.size.height = v55;

    v56 = [v9 objectForKeyedSubscript:@"tnm"];
    unint64_t v57 = [v56 unsignedLongLongValue];
    if (v57) {
      double v58 = (double)((v57 >> 8) & 0xFFFFFFF);
    }
    else {
      double v58 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    if (v57) {
      double v59 = (double)(v57 >> 36);
    }
    else {
      double v59 = *MEMORY[0x1E4F1DB30];
    }

    v60 = [v9 objectForKeyedSubscript:@"tn2"];
    uint64_t v61 = [(FCNotificationArticleHeadline *)v13 generateThumbnailAssetHandleForUrlString:v60 withAssetManager:v11];

    v133 = (void *)v61;
    uint64_t v62 = +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v61, v59, v58);
    thumbnail = v13->_thumbnail;
    v13->_thumbnail = (FCHeadlineThumbnail *)v62;

    v13->_hasThumbnail = v13->_thumbnail != 0;
    uint64_t v64 = [v9 objectForKeyedSubscript:@"fau"];
    flintDocumentUrlString = v13->_flintDocumentUrlString;
    v13->_flintDocumentUrlString = (NSString *)v64;

    uint64_t v66 = [v9 objectForKeyedSubscript:@"fdad"];
    flintDocumentPrefetchedData = v13->_flintDocumentPrefetchedData;
    v13->_flintDocumentPrefetchedData = (NSData *)v66;

    uint64_t v68 = [v9 objectForKeyedSubscript:@"ffr"];
    flintFontResourceIDs = v13->_flintFontResourceIDs;
    v13->_flintFontResourceIDs = (NSArray *)v68;

    uint64_t v70 = [v9 objectForKeyedSubscript:@"ex"];
    shortExcerpt = v13->_shortExcerpt;
    v13->_shortExcerpt = (NSString *)v70;

    uint64_t v72 = [v9 objectForKeyedSubscript:@"at"];
    accessoryText = v13->_accessoryText;
    v13->_accessoryText = (NSString *)v72;

    uint64_t v74 = [v9 objectForKeyedSubscript:@"tt"];
    topicIDs = v13->_topicIDs;
    v13->_topicIDs = (NSArray *)v74;

    uint64_t v76 = [v9 objectForKeyedSubscript:@"gcs"];
    globalCohortScoresCTR = v13->_globalCohortScoresCTR;
    v13->_globalCohortScoresCTR = (NSNumber *)v76;

    uint64_t v78 = [v9 objectForKeyedSubscript:@"ccs"];
    channelCohortScoresCTR = v13->_channelCohortScoresCTR;
    v13->_channelCohortScoresCTR = (NSNumber *)v78;

    uint64_t v80 = [v9 objectForKeyedSubscript:@"tcs"];
    topicCohortScoresCTRs = v13->_topicCohortScoresCTRs;
    v13->_topicCohortScoresCTRs = (NSArray *)v80;

    v82 = [v9 objectForKeyedSubscript:@"iss"];
    v13->_sponsored = [v82 BOOLValue];

    uint64_t v83 = [v9 objectForKeyedSubscript:@"iac"];
    iAdCategories = v13->_iAdCategories;
    v13->_iAdCategories = (NSArray *)v83;

    uint64_t v85 = [v9 objectForKeyedSubscript:@"iak"];
    iAdKeywords = v13->_iAdKeywords;
    v13->_iAdKeywords = (NSArray *)v85;

    uint64_t v87 = [v9 objectForKeyedSubscript:@"iast"];
    iAdSectionIDs = v13->_iAdSectionIDs;
    v13->_iAdSectionIDs = (NSArray *)v87;

    uint64_t v89 = [v9 objectForKeyedSubscript:@"ra2"];
    relatedArticleIDs = v13->_relatedArticleIDs;
    v13->_relatedArticleIDs = (NSArray *)v89;

    uint64_t v91 = [v9 objectForKeyedSubscript:@"mfp"];
    moreFromPublisherArticleIDs = v13->_moreFromPublisherArticleIDs;
    v13->_moreFromPublisherArticleIDs = (NSArray *)v91;

    uint64_t v93 = [v9 objectForKeyedSubscript:@"psa"];
    publisherSpecifiedArticleIDs = v13->_publisherSpecifiedArticleIDs;
    v13->_publisherSpecifiedArticleIDs = (NSArray *)v93;

    v95 = [v9 objectForKeyedSubscript:@"ct"];
    v13->_contentType = ArticleContentTypeFromString(v95);

    v96 = FCCKLocalizedArticleArticleRecirculationConfigurationKey();
    v97 = v14;
    v98 = +[FCRecordFieldURLProtocol URLForRecordID:v14 fieldName:v96];

    uint64_t v99 = [v11 assetHandleForURL:v98 lifetimeHint:2];
    articleRecirculationConfigAssetHandle = v13->_articleRecirculationConfigAssetHandle;
    v13->_articleRecirculationConfigAssetHandle = (FCAssetHandle *)v99;

    v101 = [v9 objectForKeyedSubscript:@"cu"];
    uint64_t v102 = [v101 length];
    if (v102)
    {
      v103 = [MEMORY[0x1E4F1CB10] URLWithString:v101];
    }
    else
    {
      v103 = 0;
    }
    objc_storeStrong((id *)&v13->_contentURL, v103);
    if (v102) {

    }
    v104 = [v9 objectForKeyedSubscript:@"vu"];
    uint64_t v105 = [v104 length];
    if (v105)
    {
      v106 = [MEMORY[0x1E4F1CB10] URLWithString:v104];
    }
    else
    {
      v106 = 0;
    }
    p_videoURL = &v13->_videoURL;
    objc_storeStrong((id *)&v13->_videoURL, v106);
    if (v105) {

    }
    v108 = [v9 objectForKeyedSubscript:@"vd"];
    [v108 floatValue];
    v13->_videoDuration = v109;

    v13->_webEmbedsEnabled = 1;
    v110 = [v9 objectForKeyedSubscript:@"bf"];
    __int16 v111 = [v110 unsignedLongLongValue];

    v13->_needsRapidUpdates = v111 & 1;
    v13->_disableTapToChannel = (v111 & 2) != 0;
    v13->_pressRelease = (v111 & 0x10) != 0;
    v13->_hiddenFromAutoFavorites = (v111 & 0x20) != 0;
    v13->_showBundleSoftPaywall = (v111 & 0x80) != 0;
    v13->_useTransparentNavigationBar = HIBYTE(v111) & 1;
    v13->_disableBookmarking = (v111 & 0x200) != 0;
    v13->_hideModalCloseButton = (v111 & 0x400) != 0;
    v13->_reduceVisibility = (v111 & 0x800) != 0;
    v13->_reduceVisibilityForNonFollowers = (v111 & 0x2000) != 0;
    v13->_webConverted = (v111 & 0x1000) != 0;
    v112 = [v9 objectForKeyedSubscript:@"mnv"];
    v13->_minimumNewsVersion = +[FCRestrictions integerRepresentationOfShortVersionString:v112];

    v113 = [v9 objectForKeyedSubscript:@"ip"];
    v13->_paid = [v113 BOOLValue];

    v114 = [v9 objectForKeyedSubscript:@"ibp"];
    v13->_bundlePaid = [v114 BOOLValue];

    primaryAudience = v13->_primaryAudience;
    v13->_primaryAudience = 0;

    coverArt = v13->_coverArt;
    v13->_coverArt = 0;

    v13->_isDraft = 0;
    v13->_isLocalDraft = 0;
    blockedStorefrontIDs = v13->_blockedStorefrontIDs;
    v118 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v13->_blockedStorefrontIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    allowedStorefrontIDs = v13->_allowedStorefrontIDs;
    v13->_allowedStorefrontIDs = v118;

    v13->_deleted = 0;
    v120 = [v9 objectForKeyedSubscript:@"st"];
    v13->_storyType = FCArticleStoryTypeForStoryTypeString(v120);

    storyStyle = v13->_storyStyle;
    v13->_storyStyle = 0;

    v122 = [v9 objectForKeyedSubscript:@"btl"];
    uint64_t v123 = [v122 unsignedLongLongValue];

    if (v123 <= 0) {
      uint64_t v124 = -1;
    }
    else {
      uint64_t v124 = v123;
    }
    v13->_bodyTextLength = v124;
    v125 = [v9 objectForKeyedSubscript:@"rl"];
    uint64_t v126 = PBArticleRoleFromString(v125) - 1;
    if (v126 < 8) {
      unint64_t v127 = v126 + 1;
    }
    else {
      unint64_t v127 = 0;
    }
    v13->_role = v127;

    v128 = [v9 objectForKeyedSubscript:@"isi"];
    v13->_issueOnly = [v128 BOOLValue];

    if (*p_videoURL
      && [(FCNotificationArticleHeadline *)v13 contentType] != 2
      && *p_videoURL
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v131 = (void *)[[NSString alloc] initWithFormat:@"The videoURL field should only be set for flint articles"];
      *(_DWORD *)buf = 136315906;
      v138 = "-[FCNotificationArticleHeadline initWithArticlePayload:sourceChannel:assetManager:]";
      __int16 v139 = 2080;
      v140 = "FCNotificationArticleHeadline.m";
      __int16 v141 = 1024;
      int v142 = 280;
      __int16 v143 = 2114;
      v144 = v131;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v10 = v134;
    id v11 = v135;
LABEL_52:
    v25 = v13;
    goto LABEL_53;
  }
  v24 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "Article ID is empty in payload", buf, 2u);
  }
  v25 = 0;
LABEL_53:

  return v25;
}

- (id)contentWithContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(FCNotificationArticleHeadline *)self contentType] != 2)
  {
    v22 = (void *)FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v24 = v22;
      unint64_t v25 = [(FCNotificationArticleHeadline *)self contentType];
      v26 = [(FCNotificationArticleHeadline *)self articleID];
      int v27 = 134218242;
      unint64_t v28 = v25;
      __int16 v29 = 2114;
      v30 = v26;
      _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "Invalid content type: %lu for article ID: %{public}@", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_10;
  }
  v4 = [(FCNotificationArticleHeadline *)self flintDocumentUrlString];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
  v6 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = [(FCNotificationArticleHeadline *)self articleID];
    id v9 = [(FCNotificationArticleHeadline *)self flintDocumentPrefetchedData];
    id v10 = @"with";
    if (!v9) {
      id v10 = @"without";
    }
    int v27 = 138543618;
    unint64_t v28 = (unint64_t)v8;
    __int16 v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Creating content for article %{public}@ %{public}@ prefetched ANF JSON", (uint8_t *)&v27, 0x16u);
  }
  id v11 = [(FCNotificationArticleHeadline *)self flintDocumentUrlString];
  v12 = [(FCNotificationArticleHeadline *)self flintDocumentPrefetchedData];
  v13 = [(FCNotificationArticleHeadline *)self assetManager];
  v14 = [(FCNotificationArticleHeadline *)self generateFlintDocumentAssetHandleForUrlString:v11 prefetchedData:v12 withAssetManager:v13];

  uint64_t v15 = [FCANFContent alloc];
  v16 = [(FCNotificationArticleHeadline *)self articleID];
  uint64_t v17 = [(FCNotificationArticleHeadline *)self flintFontResourceIDs];
  v18 = [(FCANFContent *)v15 initWithIdentifier:v16 mainDocumentAssetHandle:v14 fontResourceIDs:v17];

  uint64_t v19 = [FCArticleContent alloc];
  v20 = [(FCNotificationArticleHeadline *)self articleID];
  v21 = [(FCArticleContent *)v19 initWithArticleID:v20 anfContent:v18];

LABEL_11:
  return v21;
}

- (BOOL)isValid
{
  if ([(FCNotificationArticleHeadline *)self contentType] == 2)
  {
    v3 = [(FCNotificationArticleHeadline *)self flintDocumentUrlString];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  uint64_t v5 = [(FCNotificationArticleHeadline *)self sourceChannel];

  return v5 && v4;
}

- (id)generateThumbnailAssetHandleForUrlString:(id)a3 withAssetManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = [v6 assetHandleForCKAssetURLString:v5 lifetimeHint:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)generateFlintDocumentAssetHandleForUrlString:(id)a3 prefetchedData:(id)a4 withAssetManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length])
  {
    id v10 = [v9 assetHandleForCKAssetURLString:v7 prefetchedData:v8 unzipIfNeeded:1 lifetimeHint:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSString)sourceFeedID
{
  return 0;
}

- (unint64_t)halfLife
{
  return 0;
}

- (NSString)publisherID
{
  v2 = [(FCNotificationArticleHeadline *)self sourceChannel];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return [(FCNotificationArticleHeadline *)self contentType] == 2;
}

- (BOOL)hasVideo
{
  v2 = [(FCNotificationArticleHeadline *)self videoURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F82940]);
  BOOL v4 = [(FCNotificationArticleHeadline *)self globalCohortScoresCTR];
  [v4 doubleValue];
  objc_msgSend(v3, "setClicks:");

  [v3 setImpressions:1.0];
  objc_msgSend(v3, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
  id v5 = objc_alloc_init(MEMORY[0x1E4F82948]);
  [v5 addCohorts:v3];

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v5;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F82940]);
  BOOL v4 = [(FCNotificationArticleHeadline *)self channelCohortScoresCTR];
  [v4 doubleValue];
  objc_msgSend(v3, "setClicks:");

  [v3 setImpressions:1.0];
  objc_msgSend(v3, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
  id v5 = objc_alloc_init(MEMORY[0x1E4F82948]);
  [v5 addCohorts:v3];

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v5;
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  BOOL v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(FCNotificationArticleHeadline *)self topicCohortScoresCTRs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F82948]);
        id v11 = objc_alloc_init(MEMORY[0x1E4F82940]);
        [v9 doubleValue];
        objc_msgSend(v11, "setClicks:");
        [v11 setImpressions:1.0];
        objc_msgSend(v11, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
        [v10 addCohorts:v11];
        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  v12 = [(FCNotificationArticleHeadline *)self topicIDs];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v4 count];

  if (v13 == v14)
  {
    uint64_t v15 = [(FCNotificationArticleHeadline *)self topicIDs];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__FCNotificationArticleHeadline_enumerateTopicCohortsWithBlock___block_invoke;
    v18[3] = &unk_1E5B4D9E8;
    id v19 = v16;
    objc_msgSend(v15, "fc_enumerateSideBySideWithArray:reverse:block:", v4, 0, v18);
  }
}

uint64_t __64__FCNotificationArticleHeadline_enumerateTopicCohortsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return 0;
}

- (NSArray)topics
{
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (id)referencedArticleID
{
  return self->_referencedArticleID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)primaryAudience
{
  return self->_primaryAudience;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (id)sourceChannel
{
  return self->_sourceChannel;
}

- (void)setSourceChannel:(id)a3
{
}

- (id)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
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

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (id)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (void)setThumbnailLQ:(id)a3
{
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (id)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (void)setThumbnailMedium:(id)a3
{
}

- (id)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (void)setThumbnailHQ:(id)a3
{
}

- (id)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (void)setThumbnailUltraHQ:(id)a3
{
}

- (id)shortExcerpt
{
  return self->_shortExcerpt;
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

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (id)videoURL
{
  return self->_videoURL;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (BOOL)isSponsored
{
  return self->_sponsored;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (id)iAdKeywords
{
  return self->_iAdKeywords;
}

- (id)iAdSectionIDs
{
  return self->_iAdSectionIDs;
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

- (id)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (id)allowedStorefrontIDs
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

- (id)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (id)articleRecirculationConfigAssetHandle
{
  return self->_articleRecirculationConfigAssetHandle;
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (id)storyStyle
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

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (id)coverArt
{
  return self->_coverArt;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
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

- (id)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (id)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (id)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
}

- (id)surfacedByArticleListIDs
{
  return self->_surfacedByArticleListIDs;
}

- (void)setSurfacedByArticleListIDs:(id)a3
{
}

- (id)narrativeTrack
{
  return self->_narrativeTrack;
}

- (id)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (id)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (id)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (id)routeURL
{
  return self->_routeURL;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (NSDictionary)articlePayload
{
  return self->_articlePayload;
}

- (void)setArticlePayload:(id)a3
{
}

- (NSString)flintDocumentUrlString
{
  return self->_flintDocumentUrlString;
}

- (void)setFlintDocumentUrlString:(id)a3
{
}

- (NSData)flintDocumentPrefetchedData
{
  return self->_flintDocumentPrefetchedData;
}

- (void)setFlintDocumentPrefetchedData:(id)a3
{
}

- (NSArray)flintFontResourceIDs
{
  return self->_flintFontResourceIDs;
}

- (void)setFlintFontResourceIDs:(id)a3
{
}

- (NSString)changeEtag
{
  return self->_changeEtag;
}

- (void)setChangeEtag:(id)a3
{
}

- (NSNumber)globalCohortScoresCTR
{
  return self->_globalCohortScoresCTR;
}

- (void)setGlobalCohortScoresCTR:(id)a3
{
}

- (NSNumber)channelCohortScoresCTR
{
  return self->_channelCohortScoresCTR;
}

- (void)setChannelCohortScoresCTR:(id)a3
{
}

- (NSArray)topicCohortScoresCTRs
{
  return self->_topicCohortScoresCTRs;
}

- (void)setTopicCohortScoresCTRs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicCohortScoresCTRs, 0);
  objc_storeStrong((id *)&self->_channelCohortScoresCTR, 0);
  objc_storeStrong((id *)&self->_globalCohortScoresCTR, 0);
  objc_storeStrong((id *)&self->_changeEtag, 0);
  objc_storeStrong((id *)&self->_flintFontResourceIDs, 0);
  objc_storeStrong((id *)&self->_flintDocumentPrefetchedData, 0);
  objc_storeStrong((id *)&self->_flintDocumentUrlString, 0);
  objc_storeStrong((id *)&self->_articlePayload, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_routeURL, 0);
  objc_storeStrong((id *)&self->_layeredThumbnailJSON, 0);
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfigAssetHandle, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end