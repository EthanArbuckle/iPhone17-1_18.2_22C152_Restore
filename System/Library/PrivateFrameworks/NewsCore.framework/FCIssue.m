@interface FCIssue
+ (BOOL)_fakeIssuesTimestamp;
- (BOOL)hasGlobalUserFeedback;
- (BOOL)hasThumbnail;
- (BOOL)hasVideo;
- (BOOL)isANF;
- (BOOL)isBlockedExplicitContent;
- (BOOL)isCurrent;
- (BOOL)isDraft;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHiddenFromAutoFavorites;
- (BOOL)isLocalDraft;
- (BOOL)isPaid;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata;
- (FCAssetHandle)coverImageAssetHandle;
- (FCAssetHandle)metadataJSONAssetHandle;
- (FCChannelProviding)sourceChannel;
- (FCColor)coverImageAccentColor;
- (FCColor)coverImageBackgroundColor;
- (FCColor)coverImagePrimaryColor;
- (FCColor)coverImageTextColor;
- (FCColor)layeredCoverPrimaryColor;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (FCFeedPersonalizedItemScoreProfile)scoreProfile;
- (FCInterestToken)interestToken;
- (FCIssue)init;
- (FCIssue)initWithData:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5;
- (FCIssue)initWithIdentifier:(id)a3 type:(int64_t)a4 title:(id)a5 publicationDate:(id)a6 coverDate:(id)a7 metadataJSONAssetHandle:(id)a8 coverImageAssetHandle:(id)a9 coverImageAspectRatio:(double)a10 coverImagePrimaryColor:(id)a11 coverImageBackgroundColor:(id)a12 coverImageTextColor:(id)a13 coverImageAccentColor:(id)a14 layeredCoverJSON:(id)a15 layeredCoverAspectRatio:(double)a16 layeredCoverPrimaryColor:(id)a17 isCurrent:(BOOL)a18 isDraft:(BOOL)a19 isPaid:(BOOL)a20 minimumNewsVersion:(int64_t)a21 allArticleIDs:(id)a22 coverArticleID:(id)a23 allowedStorefrontIDs:(id)a24 blockedStorefrontIDs:(id)a25 topicTagIDs:(id)a26 sourceChannel:(id)a27 notificationDescription:(id)a28 issueDescription:(id)a29 sortDate:(id)a30;
- (FCIssue)initWithIssue:(id)a3 overrides:(id)a4;
- (FCIssue)initWithIssueRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5 sourceChannel:(id)a6;
- (NSArray)allArticleIDs;
- (NSArray)allowedStorefrontIDs;
- (NSArray)blockedStorefrontIDs;
- (NSArray)topicTagIDs;
- (NSArray)topics;
- (NSDate)publicationDate;
- (NSDate)sortDate;
- (NSString)coverArticleID;
- (NSString)coverDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)issueDescription;
- (NSString)layeredCoverJSON;
- (NSString)notificationDescription;
- (NSString)publisherID;
- (NSString)sourceChannelID;
- (NSString)sourceFeedID;
- (NSString)title;
- (NTPBIssueRecord)issueRecord;
- (double)coverImageAspectRatio;
- (double)globalUserFeedback;
- (double)layeredCoverAspectRatio;
- (int64_t)minimumNewsVersion;
- (int64_t)type;
- (unint64_t)halfLife;
- (unint64_t)hash;
- (void)enumerateTopicCohortsWithBlock:(id)a3;
- (void)enumerateTopicConversionStatsWithBlock:(id)a3;
- (void)setInterestToken:(id)a3;
- (void)setScoreProfile:(id)a3;
@end

@implementation FCIssue

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (FCColor)coverImageTextColor
{
  return self->_coverImageTextColor;
}

- (FCColor)coverImagePrimaryColor
{
  return self->_coverImagePrimaryColor;
}

- (FCColor)coverImageBackgroundColor
{
  return self->_coverImageBackgroundColor;
}

- (FCColor)coverImageAccentColor
{
  return self->_coverImageAccentColor;
}

- (NSArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (FCIssue)initWithIssueRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5 sourceChannel:(id)a6
{
  id v10 = a3;
  id v35 = a5;
  id v52 = a5;
  id v11 = a6;
  id v12 = a4;
  BOOL v47 = [v10 type] == 2;
  v51 = [v10 generateMetadataJSONAssetHandleWithAssetManager:v12];
  v66 = [v10 generateCoverImageAssetHandleWithAssetManager:v12];

  v13 = (void *)MEMORY[0x1E4F1C9C8];
  v14 = [v10 publishDate];
  v15 = [v13 dateWithPBDate:v14];

  v48 = self;
  if ([(id)objc_opt_class() _fakeIssuesTimestamp])
  {
    uint64_t v16 = objc_msgSend(v15, "fc_adjustToRecentDate");

    v15 = (void *)v16;
  }
  [v10 coverAspectRatio];
  double v17 = 0.75;
  if (v18 > 0.0)
  {
    [v10 coverAspectRatio];
    double v17 = v19;
  }
  v49 = [v10 base];
  v65 = [v49 identifier];
  v64 = [v10 title];
  v53 = v15;
  v50 = v15;
  if (!v15)
  {
    v53 = [MEMORY[0x1E4F1C9C8] date];
  }
  v63 = [v10 edition];
  v46 = [v10 coverPrimaryColor];
  v62 = +[FCColor colorWithHexString:](FCColor, "colorWithHexString:");
  v45 = [v10 coverBackgroundColor];
  v61 = +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v44 = [v10 coverTextColor];
  v60 = +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v43 = [v10 coverAccentColor];
  v59 = +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v58 = [v10 layeredCover];
  [v10 layeredCoverAspectRatio];
  double v21 = v20;
  v42 = [v10 layeredCoverPrimaryColor];
  v57 = +[FCColor colorWithHexString:](FCColor, "colorWithHexString:");
  v22 = [v11 currentIssueIDs];
  v40 = [v10 base];
  [v40 identifier];
  v39 = v41 = v22;
  char v38 = objc_msgSend(v22, "containsObject:");
  char v37 = [v10 isDraft];
  uint64_t v36 = [v10 minimumNewsVersion];
  v56 = [v10 allArticleIDs];
  v55 = [v10 coverArticleID];
  v54 = [v10 allowedStorefrontIDs];
  v23 = [v10 blockedStorefrontIDs];
  v24 = [v10 topicTagIDs];
  v25 = [v10 notificationDescription];
  v26 = v25;
  if (!v25)
  {
    v26 = [v10 issueDescription];
  }
  v27 = [v10 issueDescription];
  v28 = (void *)MEMORY[0x1E4F1C9C8];
  v29 = [v10 sortDate];
  v30 = [v28 dateWithPBDate:v29];
  BYTE2(v33) = 1;
  BYTE1(v33) = v37;
  LOBYTE(v33) = v38;
  v31 = -[FCIssue initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:](v48, "initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:", v65, v47, v64, v53, v63, v51, v17, v21, v66, v62, v61, v60, v59,
          v58,
          v57,
          v33,
          v36,
          v56,
          v55,
          v54,
          v23,
          v24,
          v11,
          v26,
          v27,
          v30);

  if (!v25) {
  if (!v50)
  }

  if (v31)
  {
    objc_storeStrong((id *)&v31->_issueRecord, a3);
    objc_storeStrong((id *)&v31->_interestToken, v35);
  }

  return v31;
}

- (FCIssue)initWithIdentifier:(id)a3 type:(int64_t)a4 title:(id)a5 publicationDate:(id)a6 coverDate:(id)a7 metadataJSONAssetHandle:(id)a8 coverImageAssetHandle:(id)a9 coverImageAspectRatio:(double)a10 coverImagePrimaryColor:(id)a11 coverImageBackgroundColor:(id)a12 coverImageTextColor:(id)a13 coverImageAccentColor:(id)a14 layeredCoverJSON:(id)a15 layeredCoverAspectRatio:(double)a16 layeredCoverPrimaryColor:(id)a17 isCurrent:(BOOL)a18 isDraft:(BOOL)a19 isPaid:(BOOL)a20 minimumNewsVersion:(int64_t)a21 allArticleIDs:(id)a22 coverArticleID:(id)a23 allowedStorefrontIDs:(id)a24 blockedStorefrontIDs:(id)a25 topicTagIDs:(id)a26 sourceChannel:(id)a27 notificationDescription:(id)a28 issueDescription:(id)a29 sortDate:(id)a30
{
  id v90 = a3;
  id v91 = a5;
  id v99 = a6;
  id v98 = a7;
  id obj = a8;
  id v89 = a8;
  id v88 = a9;
  id v97 = a11;
  id v96 = a12;
  id v95 = a13;
  id v94 = a14;
  id v93 = a15;
  id v92 = a17;
  id v36 = a22;
  id v37 = a23;
  id v38 = a24;
  id v39 = a25;
  id v40 = a26;
  id v41 = a27;
  id v42 = a28;
  id v43 = a29;
  id v44 = a30;
  v100.receiver = self;
  v100.super_class = (Class)FCIssue;
  v45 = [(FCIssue *)&v100 init];
  if (v45)
  {
    uint64_t v46 = [v90 copy];
    identifier = v45->_identifier;
    v45->_identifier = (NSString *)v46;

    v45->_type = a4;
    uint64_t v48 = [v91 copy];
    title = v45->_title;
    v45->_title = (NSString *)v48;

    uint64_t v50 = [v99 copy];
    publicationDate = v45->_publicationDate;
    v45->_publicationDate = (NSDate *)v50;

    uint64_t v52 = [v98 copy];
    coverDate = v45->_coverDate;
    v45->_coverDate = (NSString *)v52;

    objc_storeStrong((id *)&v45->_metadataJSONAssetHandle, obj);
    objc_storeStrong((id *)&v45->_coverImageAssetHandle, a9);
    v45->_coverImageAspectRatio = a10;
    uint64_t v54 = [v97 copy];
    coverImagePrimaryColor = v45->_coverImagePrimaryColor;
    v45->_coverImagePrimaryColor = (FCColor *)v54;

    uint64_t v56 = [v96 copy];
    coverImageBackgroundColor = v45->_coverImageBackgroundColor;
    v45->_coverImageBackgroundColor = (FCColor *)v56;

    uint64_t v58 = [v95 copy];
    coverImageTextColor = v45->_coverImageTextColor;
    v45->_coverImageTextColor = (FCColor *)v58;

    uint64_t v60 = [v94 copy];
    coverImageAccentColor = v45->_coverImageAccentColor;
    v45->_coverImageAccentColor = (FCColor *)v60;

    uint64_t v62 = [v93 copy];
    layeredCoverJSON = v45->_layeredCoverJSON;
    v45->_layeredCoverJSON = (NSString *)v62;

    v45->_layeredCoverAspectRatio = a16;
    uint64_t v64 = [v92 copy];
    layeredCoverPrimaryColor = v45->_layeredCoverPrimaryColor;
    v45->_layeredCoverPrimaryColor = (FCColor *)v64;

    v45->_isCurrent = a18;
    v45->_isDraft = a19;
    v45->_paid = a20;
    v45->_minimumNewsVersion = a21;
    uint64_t v66 = [v36 copy];
    allArticleIDs = v45->_allArticleIDs;
    v45->_allArticleIDs = (NSArray *)v66;

    uint64_t v68 = [v37 copy];
    coverArticleID = v45->_coverArticleID;
    v45->_coverArticleID = (NSString *)v68;

    uint64_t v70 = [v38 copy];
    allowedStorefrontIDs = v45->_allowedStorefrontIDs;
    v45->_allowedStorefrontIDs = (NSArray *)v70;

    uint64_t v72 = [v39 copy];
    blockedStorefrontIDs = v45->_blockedStorefrontIDs;
    v45->_blockedStorefrontIDs = (NSArray *)v72;

    uint64_t v74 = [v40 copy];
    topicTagIDs = v45->_topicTagIDs;
    v45->_topicTagIDs = (NSArray *)v74;

    uint64_t v76 = [v41 copy];
    sourceChannel = v45->_sourceChannel;
    v45->_sourceChannel = (FCChannelProviding *)v76;

    uint64_t v78 = [v42 copy];
    notificationDescription = v45->_notificationDescription;
    v45->_notificationDescription = (NSString *)v78;

    uint64_t v80 = [v43 copy];
    issueDescription = v45->_issueDescription;
    v45->_issueDescription = (NSString *)v80;

    uint64_t v82 = [v44 copy];
    sortDate = v45->_sortDate;
    v45->_sortDate = (NSDate *)v82;
  }
  return v45;
}

+ (BOOL)_fakeIssuesTimestamp
{
  if (qword_1EB5D1C28 != -1) {
    dispatch_once(&qword_1EB5D1C28, &__block_literal_global_192);
  }
  return _MergedGlobals_228;
}

void __31__FCIssue__fakeIssuesTimestamp__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_228 = [v0 BOOLForKey:@"newsfeed.content.show_fake_timestamps"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceFeedID
{
  v2 = [(FCIssue *)self sourceChannel];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (unint64_t)halfLife
{
  v2 = [(FCIssue *)self issueRecord];
  unint64_t v3 = [v2 halfLifeMilliseconds];

  return v3;
}

- (NSString)publisherID
{
  v2 = [(FCIssue *)self sourceChannel];
  unint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

- (double)globalUserFeedback
{
  return 0.0;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return [(FCIssue *)self type] == 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (BOOL)hasThumbnail
{
  return 1;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  v2 = [(FCIssue *)self issueRecord];
  unint64_t v3 = [v2 scores];
  v4 = [v3 globalCohorts];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  v7 = v6;

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v7;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  v2 = [(FCIssue *)self issueRecord];
  unint64_t v3 = [v2 scores];
  v4 = [v3 sourceChannelCohorts];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  v7 = v6;

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v7;
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(FCIssue *)self issueRecord];
  id v6 = [v5 scores];
  v7 = [v6 topicCohorts];

  if (v7)
  {
    v8 = [(FCIssue *)self issueRecord];
    v9 = [v8 scores];
    id v10 = [v9 topicCohortScores];

    id v11 = [(FCIssue *)self issueRecord];
    id v12 = [v11 scores];
    v13 = v12;
    if (v10)
    {
      v14 = [v12 topicCohortScores];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_2;
      v20[3] = &unk_1E5B4D9C0;
      v15 = &v21;
      id v21 = v4;
      [v14 enumerateObjectsUsingBlock:v20];
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v16 = [v12 topicCohorts];

    if (v16)
    {
      id v11 = [(FCIssue *)self topicTagIDs];
      v13 = [(FCIssue *)self issueRecord];
      v14 = [v13 scores];
      double v17 = [v14 topicCohorts];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_3;
      v18[3] = &unk_1E5B4D9E8;
      v15 = &v19;
      id v19 = v4;
      objc_msgSend(v11, "fc_enumerateSideBySideWithArray:reverse:block:", v17, 0, v18);

      goto LABEL_6;
    }
  }
LABEL_7:
}

void __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagId];
  id v4 = [v3 cohorts];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

uint64_t __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  uint64_t v2 = [(FCIssue *)self issueRecord];
  id v3 = [v2 conversionStats];
  id v4 = [v3 globalConversionStats];

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v4;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  uint64_t v2 = [(FCIssue *)self issueRecord];
  id v3 = [v2 conversionStats];
  id v4 = [v3 channelConversionStats];

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v4;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return 0;
}

- (NSArray)topics
{
  return 0;
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FCIssue *)self issueRecord];
  id v6 = [v5 conversionStats];
  v7 = [v6 topicConversionStats];

  if (v7)
  {
    v8 = [(FCIssue *)self issueRecord];
    v9 = [v8 conversionStats];
    id v10 = [v9 topicConversionStats];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__FCIssue_Personalization__enumerateTopicConversionStatsWithBlock___block_invoke_2;
    v11[3] = &unk_1E5B4DA10;
    id v12 = v4;
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

void __67__FCIssue_Personalization__enumerateTopicConversionStatsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagId];
  id v4 = [v3 conversionStats];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (FCIssue)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssue init]";
    __int16 v9 = 2080;
    id v10 = "FCIssue.m";
    __int16 v11 = 1024;
    int v12 = 48;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssue init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssue)initWithData:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F82A78];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = (void *)[[v8 alloc] initWithData:v11];

  __int16 v13 = [(FCIssue *)self initWithIssueRecord:v12 assetManager:v9 interestToken:0 sourceChannel:v10];
  return v13;
}

- (FCIssue)initWithIssue:(id)a3 overrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 title];
  if (v8)
  {
  }
  else
  {
    id v9 = [v7 issueDescription];

    if (!v9)
    {
      v24 = (FCIssue *)v6;

      goto LABEL_13;
    }
  }
  uint64_t v33 = self;
  uint64_t v48 = [v6 identifier];
  uint64_t v31 = [v6 type];
  uint64_t v10 = [v7 title];
  id v36 = (void *)v10;
  if (!v10)
  {
    id v36 = [v6 title];
  }
  v32 = (void *)v10;
  BOOL v47 = [v6 publicationDate];
  uint64_t v46 = [v6 coverDate];
  v45 = [v6 metadataJSONAssetHandle];
  id v44 = [v6 coverImageAssetHandle];
  [v6 coverImageAspectRatio];
  double v12 = v11;
  id v43 = [v6 coverImagePrimaryColor];
  id v42 = [v6 coverImageBackgroundColor];
  id v41 = [v6 coverImageTextColor];
  id v40 = [v6 coverImageAccentColor];
  id v39 = [v6 layeredCoverJSON];
  [v6 layeredCoverAspectRatio];
  double v14 = v13;
  id v38 = [v6 layeredCoverPrimaryColor];
  char v30 = [v6 isCurrent];
  char v29 = [v6 isDraft];
  char v28 = [v6 isPaid];
  uint64_t v27 = [v6 minimumNewsVersion];
  id v37 = [v6 allArticleIDs];
  uint64_t v15 = [v6 coverArticleID];
  uint64_t v16 = [v6 allowedStorefrontIDs];
  double v17 = [v6 blockedStorefrontIDs];
  double v18 = [v6 topicTagIDs];
  id v19 = [v6 sourceChannel];
  double v20 = [v6 notificationDescription];
  id v35 = v7;
  id v21 = [v7 issueDescription];
  v22 = v21;
  if (!v21)
  {
    v22 = [v6 issueDescription];
  }
  v23 = [v6 sortDate];
  BYTE2(v26) = v28;
  BYTE1(v26) = v29;
  LOBYTE(v26) = v30;
  v34 = -[FCIssue initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:](v33, "initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:", v48, v31, v36, v47, v46, v45, v12, v14, v44, v43, v42, v41, v40,
          v39,
          v38,
          v26,
          v27,
          v37,
          v15,
          v16,
          v17,
          v18,
          v19,
          v20,
          v22,
          v23);

  if (!v21) {
  if (!v32)
  }

  self = v34;
  v24 = self;
  id v7 = v35;
LABEL_13:

  return v24;
}

id __35__FCIssue_initWithIssue_overrides___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)description
{
  id v3 = [[FCDescription alloc] initWithObject:self];
  uint64_t v4 = [(FCIssue *)self identifier];
  [(FCDescription *)v3 addField:@"identifier" value:v4];

  id v5 = [(FCDescription *)v3 descriptionString];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [(FCIssue *)self identifier];
    v8 = [v6 identifier];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v2 = [(FCIssue *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isBlockedExplicitContent
{
  uint64_t v2 = [(FCIssue *)self sourceChannel];
  char v3 = [v2 isBlockedExplicitContent];

  return v3;
}

- (BOOL)isLocalDraft
{
  return 0;
}

- (NSString)sourceChannelID
{
  uint64_t v2 = [(FCIssue *)self sourceChannel];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__FCIssue_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  char v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __25__FCIssue_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 issueRecord];
  id v6 = +[FCContentArchive archiveWithRecord:v5];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  id v7 = [*(id *)(a1 + 32) sourceChannel];
  v8 = v7;
  if (v7)
  {
    if ([v7 conformsToProtocol:&unk_1EF8E9808]) {
      char v9 = v8;
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }
  id v11 = v9;

  uint64_t v10 = [v11 contentArchive];
  objc_msgSend(v4, "fc_safelyAddObject:", v10);
}

- (FCContentManifest)contentManifest
{
  char v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__FCIssue_contentManifest__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  id v5 = [(FCContentManifest *)v3 initWithManifests:v4];

  return v5;
}

void __26__FCIssue_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 issueRecord];
  id v6 = [v5 base];
  id v7 = [v6 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  v8 = [*(id *)(a1 + 32) sourceChannel];
  char v9 = v8;
  if (v8)
  {
    if ([v8 conformsToProtocol:&unk_1EF8E9808]) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v12 = v10;

  id v11 = [v12 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v11);
}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  return (FCFeedPersonalizedItemScoreProfile *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScoreProfile:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (NSString)coverDate
{
  return self->_coverDate;
}

- (FCAssetHandle)metadataJSONAssetHandle
{
  return self->_metadataJSONAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (double)coverImageAspectRatio
{
  return self->_coverImageAspectRatio;
}

- (NSString)layeredCoverJSON
{
  return self->_layeredCoverJSON;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (FCColor)layeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)notificationDescription
{
  return self->_notificationDescription;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (NSArray)allArticleIDs
{
  return self->_allArticleIDs;
}

- (NSString)coverArticleID
{
  return self->_coverArticleID;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
}

- (NTPBIssueRecord)issueRecord
{
  return self->_issueRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueRecord, 0);
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_topicTagIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_coverArticleID, 0);
  objc_storeStrong((id *)&self->_allArticleIDs, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_notificationDescription, 0);
  objc_storeStrong((id *)&self->_layeredCoverPrimaryColor, 0);
  objc_storeStrong((id *)&self->_layeredCoverJSON, 0);
  objc_storeStrong((id *)&self->_coverImageAccentColor, 0);
  objc_storeStrong((id *)&self->_coverImageTextColor, 0);
  objc_storeStrong((id *)&self->_coverImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_coverImagePrimaryColor, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_metadataJSONAssetHandle, 0);
  objc_storeStrong((id *)&self->_coverDate, 0);
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scoreProfile, 0);
}

@end