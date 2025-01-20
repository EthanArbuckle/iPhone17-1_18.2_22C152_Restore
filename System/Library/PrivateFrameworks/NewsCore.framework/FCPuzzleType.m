@interface FCPuzzleType
+ (BOOL)isPuzzleTypeIdentifier:(id)a3;
- (BOOL)allowCustomBottomStyle;
- (BOOL)disableBlock;
- (BOOL)disableFollow;
- (BOOL)hasEvergreenArticleList;
- (BOOL)hideAccessoryText;
- (BOOL)isArticleReadCountReportingEnabled;
- (BOOL)isAuthenticationSetup;
- (BOOL)isAutoDarkModeEnabled;
- (BOOL)isBlockedExplicitContent;
- (BOOL)isDark;
- (BOOL)isDeprecated;
- (BOOL)isEqualToTag:(id)a3;
- (BOOL)isExplicitContent;
- (BOOL)isHidden;
- (BOOL)isInternal;
- (BOOL)isLocal;
- (BOOL)isMagazine;
- (BOOL)isMySports;
- (BOOL)isNewspaper;
- (BOOL)isNoLongerAvailable;
- (BOOL)isNotificationEnabled;
- (BOOL)isPublic;
- (BOOL)isPurchaseSetup;
- (BOOL)isPuzzleHub;
- (BOOL)isPuzzleType;
- (BOOL)isRealTimeTrackingEnabled;
- (BOOL)isSandbox;
- (BOOL)isSensitiveTopic;
- (BOOL)isSports;
- (BOOL)isSportsEvent;
- (BOOL)isSubscribable;
- (BOOL)isWhite;
- (BOOL)publisherPaidLeakyPaywallOptOut;
- (BOOL)publisherPaidWebAccessOptIn;
- (BOOL)sponsoredFeedEligible;
- (BOOL)useCompactNameForPersonalizedPaywall;
- (CGSize)nameImageForDarkBackgroundSize;
- (CGSize)nameImageMaskSize;
- (CGSize)nameImageSize;
- (FCAssetHandle)coverImageAssetHandle;
- (FCAssetHandle)darkStyleNavigationChromeBackgroundImage;
- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageCompact;
- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageLarge;
- (FCAssetHandle)exploreTileImageAssetHandle;
- (FCAssetHandle)feedNavImageAssetHandle;
- (FCAssetHandle)logoImageAssetHandle;
- (FCAssetHandle)nameImageAssetHandle;
- (FCAssetHandle)nameImageCompactAssetHandle;
- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle;
- (FCAssetHandle)nameImageMaskAssetHandle;
- (FCAssetHandle)navigationChromeBackgroundImage;
- (FCAssetHandle)navigationChromeBackgroundImageCompact;
- (FCAssetHandle)navigationChromeBackgroundImageLarge;
- (FCColor)adBackgroundColor;
- (FCColor)backgroundColor;
- (FCColor)darkStyleAdBackgroundColor;
- (FCColor)darkStyleBackgroundColor;
- (FCColor)darkStyleFeedBackgroundColor;
- (FCColor)darkStyleFeedControlColor;
- (FCColor)darkStyleForegroundColor;
- (FCColor)darkStyleNavigationChromeBackgroundColor;
- (FCColor)darkStyleNavigationChromeSeparatorColor;
- (FCColor)darkStylePuzzlePrimaryColor;
- (FCColor)darkStyleThemeColor;
- (FCColor)feedBackgroundColor;
- (FCColor)feedControlColor;
- (FCColor)foregroundColor;
- (FCColor)navigationChromeBackgroundColor;
- (FCColor)navigationChromeSeparatorColor;
- (FCColor)puzzlePrimaryColor;
- (FCColor)themeColor;
- (FCColorGradient)adBackgroundGradient;
- (FCColorGradient)darkStyleAdBackgroundGradient;
- (FCColorGradient)darkStyleFeedBackgroundGradient;
- (FCColorGradient)darkStyleNavigationChromeBackgroundGradient;
- (FCColorGradient)feedBackgroundGradient;
- (FCColorGradient)navigationChromeBackgroundGradient;
- (FCContentArchive)contentArchive;
- (FCContentColorMap)contentColorMap;
- (FCContentManifest)contentManifest;
- (FCEdgeInsets)nameImageForDarkBackgroundInsets;
- (FCEdgeInsets)nameImageInsets;
- (FCEdgeInsets)nameImageMaskInsets;
- (FCHeadlineTemplate)defaultHeadlineTemplate;
- (FCInterestToken)interestToken;
- (FCPuzzleType)initWithIdentifier:(id)a3 name:(id)a4 nameCompact:(id)a5 kind:(id)a6 traits:(unint64_t)a7 engineResourceID:(id)a8 superfeedConfigResourceID:(id)a9 latestPuzzleIDs:(id)a10 promotedPuzzleIDs:(id)a11 nameImageAssetHandle:(id)a12 nameImageCompactAssetHandle:(id)a13 nameImageMaskAssetHandle:(id)a14 nameImageForDarkBackgroundAssetHandle:(id)a15 feedNavImageAssetHandle:(id)a16 coverImageAssetHandle:(id)a17 navigationChromeBackgroundImageHandle:(id)a18 navigationChromeBackgroundImageCompactHandle:(id)a19 navigationChromeBackgroundImageLargeHandle:(id)a20 navigationChromeBackgroundDarkModeImageHandle:(id)a21 navigationChromeBackgroundDarkModeImageCompactHandle:(id)a22 navigationChromeBackgroundDarkModeImageLargeHandle:(id)a23 language:(id)a24 allowedStorefrontIDs:(id)a25 blockedStorefrontIDs:(id)a26 minimumNewsVersion:(int64_t)a27 loadDate:(id)a28 fetchDate:(id)a29 lastModifiedDate:(id)a30 exploreTileImageAssetHandle:(id)a31 versionKey:(id)a32 titleDisplayPrefix:(id)a33 titleDisplaySuffix:(id)a34 themeColor:(id)a35 puzzlePrimaryColor:(id)a36 darkStyleThemeColor:(id)a37 darkStylePuzzlePrimaryColor:(id)a38 groupTitleColor:(id)a39 groupDarkStyleTitleColor:(id)a40 thumbnailDirectory:(id)a41 isPublic:(BOOL)a42;
- (FCPuzzleType)initWithPuzzleType:(id)a3 overrides:(id)a4;
- (FCPuzzleType)initWithPuzzleTypeRecord:(id)a3 assetManager:(id)a4 context:(id)a5 interestToken:(id)a6;
- (FCPuzzleTypeThumbnailDirectoryType)thumbnailDirectory;
- (FCTagBanner)defaultBannerImage;
- (FCTextInfo)headlineBylineTextInfo;
- (FCTextInfo)headlineExcerptTextInfo;
- (FCTextInfo)headlineTitleTextInfo;
- (NSArray)latestPuzzleIDs;
- (NSArray)loadableFonts;
- (NSArray)orderedNavigationBarThemes;
- (NSArray)promotedPuzzleIDs;
- (NSDictionary)navigationBarThemeByRankID;
- (NSString)engineResourceID;
- (NSString)feedMastheadType;
- (NSString)identifier;
- (NSString)imageResourceID;
- (NSString)kind;
- (NSString)name;
- (NSString)nameCompact;
- (NSString)nameForSharing;
- (NTPBPuzzleTypeRecord)puzzleTypeRecord;
- (double)bannerImageBaselineOffsetPercentage;
- (double)bannerImageScale;
- (double)subscriptionRate;
- (id)adTargetingKeywords;
- (id)allowedStorefrontIDs;
- (id)articleRecirculationConfigJSON;
- (id)asChannel;
- (id)asSection;
- (id)asSports;
- (id)asSportsEvent;
- (id)asTopic;
- (id)authorizationURL;
- (id)blockedStorefrontIDs;
- (id)compactDisplayName;
- (id)displayName;
- (id)feedIDForBin:(int64_t)a3;
- (id)feedNavImageHQAssetHandle;
- (id)fetchDate;
- (id)freeFeedIDForBin:(int64_t)a3;
- (id)groupDarkStyleTitleColor;
- (id)groupName;
- (id)groupTitleColor;
- (id)highlightsArticleListID;
- (id)iAdCategories;
- (id)iAdKeywords;
- (id)language;
- (id)lastModifiedDate;
- (id)loadDate;
- (id)magazineGenre;
- (id)nameImageLargeAssetHandle;
- (id)nameImageLargeMaskAssetHandle;
- (id)nameImageMaskWidgetHQAssetHandle;
- (id)nameImageMaskWidgetLQAssetHandle;
- (id)paidBundlePaywallConfiguration;
- (id)paidFeedIDForBin:(int64_t)a3;
- (id)personalizedPaywallName;
- (id)prefetchPurchaseOffer;
- (id)primaryAudience;
- (id)publisherPaidAuthorizationURL;
- (id)publisherPaidBundlePurchaseIDs;
- (id)publisherPaidDescriptionStrings;
- (id)publisherPaidFeldsparablePurchaseIDs;
- (id)publisherPaidOfferableConfigurations;
- (id)publisherPaidVerificationURL;
- (id)publisherPaidWebAccessURL;
- (id)publisherSpecifiedArticleIDs;
- (id)publisherSpecifiedArticleIDsModifiedDate;
- (id)publisherSpecifiedArticles;
- (id)replacementID;
- (id)sportsRecommendationMappings;
- (id)sportsRecommendationMappingsJSON;
- (id)stocksFields;
- (id)subtitle;
- (id)superfeedConfigResourceID;
- (id)supergroupConfigJson;
- (id)supergroupKnobs;
- (id)supergroupKnobsJson;
- (id)theme;
- (id)titleDisplayPrefix;
- (id)titleDisplaySuffix;
- (id)versionKey;
- (int64_t)contentProvider;
- (int64_t)feedType;
- (int64_t)minimumNewsVersion;
- (int64_t)score;
- (unint64_t)groupingEligibility;
- (unint64_t)navigationChromeBackgroundImageContentMode;
- (unint64_t)navigationChromeBackgroundImageContentModeCompact;
- (unint64_t)navigationChromeBackgroundImageContentModeLarge;
- (unint64_t)tagType;
- (unint64_t)traits;
- (unint64_t)userFacingTagType;
- (void)setTitleDisplayPrefix:(id)a3;
- (void)setTitleDisplaySuffix:(id)a3;
@end

@implementation FCPuzzleType

+ (BOOL)isPuzzleTypeIdentifier:(id)a3
{
  return +[FCPuzzleTypeRecordSource recognizesRecordID:a3];
}

- (FCPuzzleType)initWithIdentifier:(id)a3 name:(id)a4 nameCompact:(id)a5 kind:(id)a6 traits:(unint64_t)a7 engineResourceID:(id)a8 superfeedConfigResourceID:(id)a9 latestPuzzleIDs:(id)a10 promotedPuzzleIDs:(id)a11 nameImageAssetHandle:(id)a12 nameImageCompactAssetHandle:(id)a13 nameImageMaskAssetHandle:(id)a14 nameImageForDarkBackgroundAssetHandle:(id)a15 feedNavImageAssetHandle:(id)a16 coverImageAssetHandle:(id)a17 navigationChromeBackgroundImageHandle:(id)a18 navigationChromeBackgroundImageCompactHandle:(id)a19 navigationChromeBackgroundImageLargeHandle:(id)a20 navigationChromeBackgroundDarkModeImageHandle:(id)a21 navigationChromeBackgroundDarkModeImageCompactHandle:(id)a22 navigationChromeBackgroundDarkModeImageLargeHandle:(id)a23 language:(id)a24 allowedStorefrontIDs:(id)a25 blockedStorefrontIDs:(id)a26 minimumNewsVersion:(int64_t)a27 loadDate:(id)a28 fetchDate:(id)a29 lastModifiedDate:(id)a30 exploreTileImageAssetHandle:(id)a31 versionKey:(id)a32 titleDisplayPrefix:(id)a33 titleDisplaySuffix:(id)a34 themeColor:(id)a35 puzzlePrimaryColor:(id)a36 darkStyleThemeColor:(id)a37 darkStylePuzzlePrimaryColor:(id)a38 groupTitleColor:(id)a39 groupDarkStyleTitleColor:(id)a40 thumbnailDirectory:(id)a41 isPublic:(BOOL)a42
{
  id v88 = a3;
  id v87 = a4;
  id v86 = a5;
  id v85 = a6;
  id v84 = a8;
  id v83 = a9;
  id v82 = a10;
  id v81 = a11;
  id v80 = a12;
  id v79 = a13;
  id v78 = a14;
  id v77 = a15;
  id v76 = a16;
  id v75 = a17;
  id v74 = a18;
  id v73 = a19;
  id v72 = a20;
  id v71 = a21;
  id v70 = a22;
  id v69 = a23;
  id v68 = a24;
  id v67 = a25;
  id v46 = a26;
  id v47 = a28;
  id v66 = a29;
  id v48 = a30;
  id v65 = a31;
  id v64 = a32;
  id v63 = a33;
  id v62 = a34;
  id v61 = a35;
  id v60 = a36;
  id v59 = a37;
  id v58 = a38;
  id v57 = a39;
  id v56 = a40;
  id v55 = a41;
  v89.receiver = self;
  v89.super_class = (Class)FCPuzzleType;
  v49 = [(FCPuzzleType *)&v89 init];
  v50 = v49;
  if (v49)
  {
    objc_storeStrong((id *)&v49->_identifier, a3);
    objc_storeStrong((id *)&v50->_name, a4);
    objc_storeStrong((id *)&v50->_nameCompact, a5);
    objc_storeStrong((id *)&v50->_kind, a6);
    v50->_traits = a7;
    objc_storeStrong((id *)&v50->_engineResourceID, a8);
    objc_storeStrong((id *)&v50->_superfeedConfigResourceID, a9);
    objc_storeStrong((id *)&v50->_latestPuzzleIDs, a10);
    objc_storeStrong((id *)&v50->_promotedPuzzleIDs, a11);
    objc_storeStrong((id *)&v50->_nameImageAssetHandle, a12);
    objc_storeStrong((id *)&v50->_nameImageCompactAssetHandle, a13);
    objc_storeStrong((id *)&v50->_nameImageMaskAssetHandle, a14);
    objc_storeStrong((id *)&v50->_nameImageForDarkBackgroundAssetHandle, a15);
    objc_storeStrong((id *)&v50->_feedNavImageAssetHandle, a16);
    objc_storeStrong((id *)&v50->_coverImageAssetHandle, a17);
    objc_storeStrong((id *)&v50->_navigationChromeBackgroundImage, a18);
    objc_storeStrong((id *)&v50->_navigationChromeBackgroundImageCompact, a19);
    objc_storeStrong((id *)&v50->_navigationChromeBackgroundImageLarge, a20);
    objc_storeStrong((id *)&v50->_darkStyleNavigationChromeBackgroundImage, a21);
    objc_storeStrong((id *)&v50->_darkStyleNavigationChromeBackgroundImageCompact, a22);
    objc_storeStrong((id *)&v50->_darkStyleNavigationChromeBackgroundImageLarge, a23);
    objc_storeStrong((id *)&v50->_language, a24);
    objc_storeStrong((id *)&v50->_allowedStorefrontIDs, a25);
    objc_storeStrong((id *)&v50->_blockedStorefrontIDs, a26);
    v50->_minimumNewsVersion = a27;
    objc_storeStrong((id *)&v50->_loadDate, a28);
    objc_storeStrong((id *)&v50->_fetchDate, a29);
    objc_storeStrong((id *)&v50->_lastModifiedDate, a30);
    objc_storeStrong((id *)&v50->_exploreTileImageAssetHandle, a31);
    objc_storeStrong((id *)&v50->_themeColor, a35);
    objc_storeStrong((id *)&v50->_puzzlePrimaryColor, a36);
    objc_storeStrong((id *)&v50->_darkStyleThemeColor, a37);
    objc_storeStrong((id *)&v50->_darkStylePuzzlePrimaryColor, a38);
    objc_storeStrong((id *)&v50->_groupTitleColor, a39);
    objc_storeStrong((id *)&v50->_groupDarkStyleTitleColor, a40);
    objc_storeStrong((id *)&v50->_versionKey, a32);
    objc_storeStrong((id *)&v50->_titleDisplayPrefix, a33);
    objc_storeStrong((id *)&v50->_titleDisplaySuffix, a34);
    objc_storeStrong((id *)&v50->_thumbnailDirectory, a41);
    v50->_isPublic = a42;
  }

  return v50;
}

- (FCPuzzleType)initWithPuzzleTypeRecord:(id)a3 assetManager:(id)a4 context:(id)a5 interestToken:(id)a6
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 base];
  v16 = [v15 identifier];

  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v113 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != 0");
    *(_DWORD *)buf = 136315906;
    v128 = "-[FCPuzzleType initWithPuzzleTypeRecord:assetManager:context:interestToken:]";
    __int16 v129 = 2080;
    v130 = "FCPuzzleType.m";
    __int16 v131 = 1024;
    int v132 = 175;
    __int16 v133 = 2114;
    v134 = v113;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v126.receiver = self;
  v126.super_class = (Class)FCPuzzleType;
  v17 = [(FCPuzzleType *)&v126 init];
  if (v17)
  {
    if ([v16 length])
    {
      context = (void *)MEMORY[0x1A6260FD0]();
      objc_storeStrong((id *)&v17->_puzzleTypeRecord, a3);
      objc_storeStrong((id *)&v17->_interestToken, a6);
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      loadDate = v17->_loadDate;
      v17->_loadDate = (NSDate *)v18;

      v20 = (void *)MEMORY[0x1E4F1C9C8];
      v21 = [v11 base];
      v22 = [v21 fetchDate];
      uint64_t v23 = [v20 dateWithPBDate:v22];
      fetchDate = v17->_fetchDate;
      v17->_fetchDate = (NSDate *)v23;

      v25 = (void *)MEMORY[0x1E4F1C9C8];
      v26 = [v11 base];
      v27 = [v26 modificationDate];
      uint64_t v28 = [v25 dateWithPBDate:v27];
      lastModifiedDate = v17->_lastModifiedDate;
      v17->_lastModifiedDate = (NSDate *)v28;

      uint64_t v30 = [v16 copy];
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)v30;

      uint64_t v32 = [v11 name];
      name = v17->_name;
      v17->_name = (NSString *)v32;

      uint64_t v34 = [v11 nameCompact];
      nameCompact = v17->_nameCompact;
      v17->_nameCompact = (NSString *)v34;

      uint64_t v36 = [v11 kind];
      kind = v17->_kind;
      v17->_kind = (NSString *)v36;

      v17->_traits = [v11 behaviorFlags];
      uint64_t v38 = [v11 engineResourceID];
      engineResourceID = v17->_engineResourceID;
      v17->_engineResourceID = (NSString *)v38;

      uint64_t v40 = [v11 superfeedConfigResourceID];
      superfeedConfigResourceID = v17->_superfeedConfigResourceID;
      v17->_superfeedConfigResourceID = (NSString *)v40;

      uint64_t v42 = [v11 latestPuzzleIDs];
      latestPuzzleIDs = v17->_latestPuzzleIDs;
      v17->_latestPuzzleIDs = (NSArray *)v42;

      uint64_t v44 = [v11 promotedPuzzleIDs];
      promotedPuzzleIDs = v17->_promotedPuzzleIDs;
      v17->_promotedPuzzleIDs = (NSArray *)v44;

      uint64_t v46 = [v11 generateNameImageAssetHandleWithAssetManager:v12];
      nameImageAssetHandle = v17->_nameImageAssetHandle;
      v17->_nameImageAssetHandle = (FCAssetHandle *)v46;

      uint64_t v48 = [v11 generateNameImageCompactAssetHandleWithAssetManager:v12];
      nameImageCompactAssetHandle = v17->_nameImageCompactAssetHandle;
      v17->_nameImageCompactAssetHandle = (FCAssetHandle *)v48;

      uint64_t v50 = [v11 generateNameImageForDarkBackgroundAssetHandleWithAssetManager:v12];
      nameImageForDarkBackgroundAssetHandle = v17->_nameImageForDarkBackgroundAssetHandle;
      v17->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v50;

      uint64_t v52 = [v11 generateNameImageMaskAssetHandleWithAssetManager:v12];
      nameImageMaskAssetHandle = v17->_nameImageMaskAssetHandle;
      v17->_nameImageMaskAssetHandle = (FCAssetHandle *)v52;

      uint64_t v54 = [v11 generateCoverImageAssetHandleWithAssetManager:v12];
      coverImageAssetHandle = v17->_coverImageAssetHandle;
      v17->_coverImageAssetHandle = (FCAssetHandle *)v54;

      uint64_t v56 = [v11 generateFeedNavImageAssetHandleWithAssetManager:v12];
      feedNavImageAssetHandle = v17->_feedNavImageAssetHandle;
      v17->_feedNavImageAssetHandle = (FCAssetHandle *)v56;

      uint64_t v58 = [v11 generateFeedNavImageAssetHandleWithAssetManager:v12];
      feedNavImageHQAssetHandle = v17->_feedNavImageHQAssetHandle;
      v17->_feedNavImageHQAssetHandle = (FCAssetHandle *)v58;

      uint64_t v60 = [v11 generateNavigationChromeBackgroundImageHandleWithAssetManager:v12];
      navigationChromeBackgroundImage = v17->_navigationChromeBackgroundImage;
      v17->_navigationChromeBackgroundImage = (FCAssetHandle *)v60;

      uint64_t v62 = [v11 generateNavigationChromeBackgroundImageCompactHandleWithAssetManager:v12];
      navigationChromeBackgroundImageCompact = v17->_navigationChromeBackgroundImageCompact;
      v17->_navigationChromeBackgroundImageCompact = (FCAssetHandle *)v62;

      uint64_t v64 = [v11 generateNavigationChromeBackgroundImageLargeHandleWithAssetManager:v12];
      navigationChromeBackgroundImageLarge = v17->_navigationChromeBackgroundImageLarge;
      v17->_navigationChromeBackgroundImageLarge = (FCAssetHandle *)v64;

      uint64_t v66 = [v11 generateNavigationChromeBackgroundDarkModeImageHandleWithAssetManager:v12];
      darkStyleNavigationChromeBackgroundImage = v17->_darkStyleNavigationChromeBackgroundImage;
      v17->_darkStyleNavigationChromeBackgroundImage = (FCAssetHandle *)v66;

      uint64_t v68 = [v11 generateNavigationChromeBackgroundDarkModeImageCompactHandleWithAssetManager:v12];
      darkStyleNavigationChromeBackgroundImageCompact = v17->_darkStyleNavigationChromeBackgroundImageCompact;
      v17->_darkStyleNavigationChromeBackgroundImageCompact = (FCAssetHandle *)v68;

      uint64_t v70 = [v11 generateNavigationChromeBackgroundDarkModeImageLargeHandleWithAssetManager:v12];
      darkStyleNavigationChromeBackgroundImageLarge = v17->_darkStyleNavigationChromeBackgroundImageLarge;
      v17->_darkStyleNavigationChromeBackgroundImageLarge = (FCAssetHandle *)v70;

      uint64_t v72 = [v11 generateExploreTileImageAssetHandleWithAssetManager:v12];
      exploreTileImageAssetHandle = v17->_exploreTileImageAssetHandle;
      v17->_exploreTileImageAssetHandle = (FCAssetHandle *)v72;

      id v74 = [v11 themeConfiguration];
      id v75 = [v74 dataUsingEncoding:4];

      if (v75)
      {
        [MEMORY[0x1E4F28D90] JSONObjectWithData:v75 options:0 error:0];
        id v76 = v121 = v13;
        v120 = [v76 objectForKeyedSubscript:@"exploreTileBackgroundColor"];
        uint64_t v77 = +[FCColor colorWithHexString:v120];
        themeColor = v17->_themeColor;
        v17->_themeColor = (FCColor *)v77;

        v119 = [v76 objectForKeyedSubscript:@"darkStyleExploreTileBackgroundColor"];
        uint64_t v79 = +[FCColor colorWithHexString:v119];
        darkStyleThemeColor = v17->_darkStyleThemeColor;
        v17->_darkStyleThemeColor = (FCColor *)v79;

        v118 = [v76 objectForKeyedSubscript:@"puzzlePrimaryColor"];
        uint64_t v81 = +[FCColor colorWithHexString:v118];
        puzzlePrimaryColor = v17->_puzzlePrimaryColor;
        v17->_puzzlePrimaryColor = (FCColor *)v81;

        v117 = [v76 objectForKeyedSubscript:@"darkStylePuzzlePrimaryColor"];
        uint64_t v83 = +[FCColor colorWithHexString:v117];
        darkStylePuzzlePrimaryColor = v17->_darkStylePuzzlePrimaryColor;
        v17->_darkStylePuzzlePrimaryColor = (FCColor *)v83;

        v116 = [v76 objectForKeyedSubscript:@"groupTitleColor"];
        uint64_t v85 = +[FCColor colorWithHexString:v116];
        groupTitleColor = v17->_groupTitleColor;
        v17->_groupTitleColor = (FCColor *)v85;

        v115 = [v76 objectForKeyedSubscript:@"darkStyleGroupTitleColor"];
        uint64_t v87 = +[FCColor colorWithHexString:v115];
        groupDarkStyleTitleColor = v17->_groupDarkStyleTitleColor;
        v17->_groupDarkStyleTitleColor = (FCColor *)v87;

        objc_super v89 = [MEMORY[0x1E4F1CA60] dictionary];
        v114 = [v76 objectForKeyedSubscript:@"navigationBarTheme"];
        v90 = [MEMORY[0x1E4F1CA48] array];
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __76__FCPuzzleType_initWithPuzzleTypeRecord_assetManager_context_interestToken___block_invoke;
        v123[3] = &unk_1E5B54E38;
        v91 = v89;
        v124 = v91;
        v92 = v90;
        v125 = v92;
        [v114 enumerateObjectsUsingBlock:v123];
        v93 = v75;
        v94 = v16;
        id v95 = v14;
        navigationBarThemeByRankID = v17->_navigationBarThemeByRankID;
        v17->_navigationBarThemeByRankID = v91;
        v97 = v91;

        orderedNavigationBarThemes = v17->_orderedNavigationBarThemes;
        v17->_orderedNavigationBarThemes = v92;
        v99 = v92;

        id v14 = v95;
        v16 = v94;
        id v75 = v93;

        id v13 = v121;
      }
      uint64_t v100 = [v11 imagesResourceID];
      imageResourceID = v17->_imageResourceID;
      v17->_imageResourceID = (NSString *)v100;

      v102 = [FCPuzzleTypeThumbnailDirectory alloc];
      v103 = [v11 imagesResourceID];
      uint64_t v104 = [(FCPuzzleTypeThumbnailDirectory *)v102 initWithResourceMapId:v103 assetManager:v12 context:v13];
      thumbnailDirectory = v17->_thumbnailDirectory;
      v17->_thumbnailDirectory = (FCPuzzleTypeThumbnailDirectoryType *)v104;

      uint64_t v106 = [v11 language];
      language = v17->_language;
      v17->_language = (NSString *)v106;

      uint64_t v108 = [v11 blockedStorefrontIDs];
      blockedStorefrontIDs = v17->_blockedStorefrontIDs;
      v17->_blockedStorefrontIDs = (NSArray *)v108;

      uint64_t v110 = [v11 allowedStorefrontIDs];
      allowedStorefrontIDs = v17->_allowedStorefrontIDs;
      v17->_allowedStorefrontIDs = (NSArray *)v110;

      v17->_minimumNewsVersion = [v11 minimumNewsVersion];
      v17->_isPublic = [v11 isPublic];
    }
    else
    {

      v17 = 0;
    }
  }

  return v17;
}

void __76__FCPuzzleType_initWithPuzzleTypeRecord_assetManager_context_interestToken___block_invoke(uint64_t a1, void *a2)
{
  id v34 = a2;
  uint64_t v2 = [v34 objectForKeyedSubscript:@"backgroundColor"];
  uint64_t v32 = (void *)v2;
  if (v2)
  {
    uint64_t v3 = +[FCColor colorWithHexString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v34 objectForKeyedSubscript:@"backgroundDarkModeColor"];
  v31 = (void *)v4;
  if (v4)
  {
    v5 = +[FCColor colorWithHexString:v4];
  }
  else
  {
    v5 = 0;
  }
  uint64_t v6 = [v34 objectForKeyedSubscript:@"barButtonItemTintColor"];
  uint64_t v30 = (void *)v6;
  if (v6)
  {
    v33 = +[FCColor colorWithHexString:v6];
  }
  else
  {
    v33 = 0;
  }
  uint64_t v7 = [v34 objectForKeyedSubscript:@"barButtonItemTintDarkModeColor"];
  v29 = (void *)v7;
  if (v7)
  {
    v8 = +[FCColor colorWithHexString:v7];
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [v34 objectForKeyedSubscript:@"barButtonItemBackgroundColor"];
  uint64_t v28 = (void *)v9;
  if (v9)
  {
    v25 = +[FCColor colorWithHexString:v9];
  }
  else
  {
    v25 = 0;
  }
  uint64_t v10 = [v34 objectForKeyedSubscript:@"barButtonItemBackgroundDarkModeColor"];
  v27 = (void *)v10;
  if (v10)
  {
    id v11 = +[FCColor colorWithHexString:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = (void *)v3;
  uint64_t v13 = [v34 objectForKeyedSubscript:@"shareTextForegroundColor"];
  v26 = (void *)v13;
  if (v13)
  {
    id v14 = +[FCColor colorWithHexString:v13];
  }
  else
  {
    id v14 = 0;
  }
  v15 = [v34 objectForKeyedSubscript:@"rankForegroundColor"];
  if (v15)
  {
    v16 = +[FCColor colorWithHexString:v15];
  }
  else
  {
    v16 = 0;
  }
  v17 = [v34 objectForKeyedSubscript:@"rankForegroundDarkModeColor"];
  if (v17)
  {
    uint64_t v18 = +[FCColor colorWithHexString:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }
  v19 = [v34 objectForKeyedSubscript:@"rankIdentifier"];
  if (v19)
  {
    v20 = [[FCPuzzleNavigationBarTheme alloc] initWithNavigationBarBackgroundColor:v12 navigationBarBackgroundDarkModeColor:v5 rankForegroundColor:v16 rankForegroundDarkModeColor:v18 barButtonItemTintColor:v33 barButtonItemTintDarkModeColor:v8 barButtonItemBackgroundColor:v25 barButtonItemBackgroundDarkModeColor:v11 shareTextForegroundColor:v14];
    uint64_t v23 = v18;
    v21 = v11;
    v22 = v20;
    [*(id *)(a1 + 32) setObject:v20 forKey:v19];
    [*(id *)(a1 + 40) addObject:v22];

    id v11 = v21;
    uint64_t v18 = v23;
  }
}

- (FCPuzzleType)initWithPuzzleType:(id)a3 overrides:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v53 = [v5 identifier];
  uint64_t v52 = [v5 name];
  v51 = [v5 nameCompact];
  uint64_t v50 = [v5 kind];
  uint64_t v19 = [v5 traits];
  v49 = [v5 engineResourceID];
  uint64_t v48 = [v5 superfeedConfigResourceID];
  id v47 = [v5 latestPuzzleIDs];
  uint64_t v46 = [v5 promotedPuzzleIDs];
  v45 = [v5 nameImageAssetHandle];
  uint64_t v44 = [v5 nameImageCompactAssetHandle];
  v43 = [v5 nameImageMaskAssetHandle];
  uint64_t v42 = [v5 nameImageForDarkBackgroundAssetHandle];
  v41 = [v5 feedNavImageAssetHandle];
  uint64_t v40 = [v5 coverImageAssetHandle];
  v39 = [v5 navigationChromeBackgroundImage];
  uint64_t v38 = [v5 navigationChromeBackgroundImageCompact];
  v37 = [v5 navigationChromeBackgroundImageLarge];
  uint64_t v36 = [v5 darkStyleNavigationChromeBackgroundImage];
  v35 = [v5 darkStyleNavigationChromeBackgroundImageCompact];
  id v34 = [v5 darkStyleNavigationChromeBackgroundImageLarge];
  v33 = [v5 language];
  uint64_t v32 = [v5 allowedStorefrontIDs];
  v31 = [v5 blockedStorefrontIDs];
  uint64_t v18 = [v5 minimumNewsVersion];
  uint64_t v30 = [v5 loadDate];
  v29 = [v5 fetchDate];
  uint64_t v28 = [v5 lastModifiedDate];
  uint64_t v7 = [v6 exploreTileImageAssetHandle];
  v24 = v7;
  if (!v7)
  {
    v24 = [v5 exploreTileImageAssetHandle];
  }
  v27 = [v5 versionKey];
  v26 = [v5 titleDisplayPrefix];
  v25 = [v5 titleDisplaySuffix];
  v8 = [v6 themeColor];
  uint64_t v23 = v8;
  if (!v8)
  {
    uint64_t v23 = [v5 themeColor];
  }
  uint64_t v9 = [v5 puzzlePrimaryColor];
  v22 = v6;
  uint64_t v10 = [v6 darkStyleThemeColor];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [v5 darkStyleThemeColor];
  }
  id v12 = [v5 darkStylePuzzlePrimaryColor];
  uint64_t v13 = [v5 groupTitleColor];
  id v14 = [v5 groupDarkStyleTitleColor];
  v15 = [v5 thumbnailDirectory];
  LOBYTE(v17) = [v5 isPublic];
  v21 = -[FCPuzzleType initWithIdentifier:name:nameCompact:kind:traits:engineResourceID:superfeedConfigResourceID:latestPuzzleIDs:promotedPuzzleIDs:nameImageAssetHandle:nameImageCompactAssetHandle:nameImageMaskAssetHandle:nameImageForDarkBackgroundAssetHandle:feedNavImageAssetHandle:coverImageAssetHandle:navigationChromeBackgroundImageHandle:navigationChromeBackgroundImageCompactHandle:navigationChromeBackgroundImageLargeHandle:navigationChromeBackgroundDarkModeImageHandle:navigationChromeBackgroundDarkModeImageCompactHandle:navigationChromeBackgroundDarkModeImageLargeHandle:language:allowedStorefrontIDs:blockedStorefrontIDs:minimumNewsVersion:loadDate:fetchDate:lastModifiedDate:exploreTileImageAssetHandle:versionKey:titleDisplayPrefix:titleDisplaySuffix:themeColor:puzzlePrimaryColor:darkStyleThemeColor:darkStylePuzzlePrimaryColor:groupTitleColor:groupDarkStyleTitleColor:thumbnailDirectory:isPublic:](self, "initWithIdentifier:name:nameCompact:kind:traits:engineResourceID:superfeedConfigResourceID:latestPuzzleIDs:promotedPuzzleIDs:nameImageAssetHandle:nameImageCompactAssetHandle:nameImageMaskAssetHandle:nameImageForDarkBackgroundAssetHandle:feedNavImageAssetHandle:coverImageAssetHandle:navigationChromeBackgroundImageHandle:navigationChromeBackgroundImageCompactHandle:navigationChromeBackgroundImageLargeHandle:navigationChromeBackgroundDarkModeImageHandle:navigationChromeBackgroundDarkModeImageCompactHandle:navigationChromeBackgroundDarkModeImageLargeHandle:language:allowedStorefrontIDs:blockedStorefrontIDs:minimumNewsVersion:loadDate:fetchDate:lastModifiedDate:exploreTileImageAssetHandle:versionKey:titleDisplayPrefix:titleDisplaySuffix:themeColor:puzzlePrimaryColor:darkStyleThemeColor:darkStylePuzzlePrimaryColor:groupTitleColor:groupDarkStyleTitleColor:thumbnailDirectory:isPublic:", v53, v52, v51, v50, v19, v49, v48, v47, v46, v45,
          v44,
          v43,
          v42,
          v41,
          v40,
          v39,
          v38,
          v37,
          v36,
          v35,
          v34,
          v33,
          v32,
          v31,
          v18,
          v30,
          v29,
          v28,
          v24,
          v27,
          v26,
          v25,
          v23,
          v9,
          v11,
          v12,
          v13,
          v14,
          v15,
          v17);

  if (!v10) {
  if (!v8)
  }

  if (!v7) {
  return v21;
  }
}

- (FCContentArchive)contentArchive
{
  uint64_t v2 = [(FCPuzzleType *)self puzzleTypeRecord];
  uint64_t v3 = +[FCContentArchive archiveWithRecord:v2];

  return (FCContentArchive *)v3;
}

- (FCContentManifest)contentManifest
{
  uint64_t v3 = [(FCPuzzleType *)self puzzleTypeRecord];
  if (v3)
  {
    uint64_t v4 = [(FCPuzzleType *)self puzzleTypeRecord];
    id v5 = [v4 base];
    id v6 = [v5 contentManifest];
  }
  else
  {
    id v6 = +[FCContentManifest empty];
  }

  return (FCContentManifest *)v6;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = FCCheckedDynamicCast(v5, (uint64_t)v4);

  identifier = self->_identifier;
  v8 = [v6 identifier];
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v8];

  return (char)identifier;
}

- (id)asChannel
{
  return 0;
}

- (id)asSection
{
  return 0;
}

- (id)asTopic
{
  return 0;
}

- (id)asSports
{
  return 0;
}

- (id)asSportsEvent
{
  return 0;
}

- (BOOL)isSports
{
  return 0;
}

- (BOOL)isSportsEvent
{
  return 0;
}

- (BOOL)isPuzzleType
{
  return 1;
}

- (unint64_t)tagType
{
  return 2;
}

- (NSString)nameCompact
{
  return self->_name;
}

- (id)displayName
{
  return self->_name;
}

- (id)compactDisplayName
{
  return self->_name;
}

- (NSString)nameForSharing
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 localizedStringForKey:@"Apple News+ %@" value:&stru_1EF8299B8 table:0];

  id v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, self->_name);

  return (NSString *)v5;
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (id)groupName
{
  return self->_name;
}

- (int64_t)contentProvider
{
  return 0;
}

- (id)iAdCategories
{
  return 0;
}

- (id)iAdKeywords
{
  return 0;
}

- (BOOL)isDeprecated
{
  return 0;
}

- (BOOL)isExplicitContent
{
  return 0;
}

- (BOOL)isNotificationEnabled
{
  return 0;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (BOOL)isSubscribable
{
  return 1;
}

- (id)magazineGenre
{
  return 0;
}

- (id)primaryAudience
{
  return 0;
}

- (id)publisherPaidAuthorizationURL
{
  return 0;
}

- (id)publisherPaidFeldsparablePurchaseIDs
{
  return 0;
}

- (id)publisherPaidBundlePurchaseIDs
{
  return 0;
}

- (id)publisherPaidOfferableConfigurations
{
  return 0;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return 0;
}

- (id)publisherPaidVerificationURL
{
  return 0;
}

- (id)nameImageMaskWidgetLQAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageMaskWidgetHQAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageLargeMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageLargeAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (BOOL)isBlockedExplicitContent
{
  return 0;
}

- (id)publisherPaidDescriptionStrings
{
  return 0;
}

- (unint64_t)groupingEligibility
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isRealTimeTrackingEnabled
{
  return 0;
}

- (BOOL)isArticleReadCountReportingEnabled
{
  return 0;
}

- (BOOL)isAutoDarkModeEnabled
{
  return 0;
}

- (BOOL)isInternal
{
  return 0;
}

- (BOOL)isSandbox
{
  return 0;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isSensitiveTopic
{
  return 0;
}

- (BOOL)isNewspaper
{
  return 0;
}

- (BOOL)isMagazine
{
  return 0;
}

- (id)articleRecirculationConfigJSON
{
  return 0;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return 0;
}

- (id)publisherPaidWebAccessURL
{
  return 0;
}

- (id)publisherSpecifiedArticleIDs
{
  return 0;
}

- (id)publisherSpecifiedArticles
{
  return 0;
}

- (id)paidBundlePaywallConfiguration
{
  return 0;
}

- (id)publisherSpecifiedArticleIDsModifiedDate
{
  return 0;
}

- (id)replacementID
{
  return 0;
}

- (int64_t)score
{
  return 0;
}

- (id)stocksFields
{
  return 0;
}

- (double)subscriptionRate
{
  return 0.0;
}

- (id)subtitle
{
  return 0;
}

- (id)theme
{
  uint64_t v2 = self;
  return v2;
}

- (unint64_t)userFacingTagType
{
  return 1;
}

- (id)authorizationURL
{
  return 0;
}

- (id)feedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)freeFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (BOOL)isAuthenticationSetup
{
  return 0;
}

- (BOOL)isNoLongerAvailable
{
  return 0;
}

- (BOOL)isPurchaseSetup
{
  return 0;
}

- (id)paidFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)prefetchPurchaseOffer
{
  return 0;
}

- (BOOL)isMySports
{
  return 0;
}

- (BOOL)isPuzzleHub
{
  return 0;
}

- (BOOL)hasEvergreenArticleList
{
  return 0;
}

- (id)adTargetingKeywords
{
  return 0;
}

- (id)versionKey
{
  return 0;
}

- (id)sportsRecommendationMappings
{
  return 0;
}

- (id)sportsRecommendationMappingsJSON
{
  return 0;
}

- (id)highlightsArticleListID
{
  return 0;
}

- (id)supergroupConfigJson
{
  return 0;
}

- (id)supergroupKnobs
{
  return 0;
}

- (id)supergroupKnobsJson
{
  return 0;
}

- (BOOL)useCompactNameForPersonalizedPaywall
{
  return 0;
}

- (BOOL)sponsoredFeedEligible
{
  return 0;
}

- (id)personalizedPaywallName
{
  return self->_name;
}

- (double)bannerImageScale
{
  return 1.0;
}

- (BOOL)isDark
{
  return 0;
}

- (BOOL)isWhite
{
  return 0;
}

- (FCColor)backgroundColor
{
  return 0;
}

- (FCColor)foregroundColor
{
  return 0;
}

- (FCTagBanner)defaultBannerImage
{
  uint64_t v3 = [FCTagBanner alloc];
  id v4 = -[FCTagBanner initWithAssetHandle:size:insets:](v3, "initWithAssetHandle:size:insets:", self->_nameImageAssetHandle, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0, 0.0, 0.0, 0.0);
  return v4;
}

- (int64_t)feedType
{
  return 0;
}

- (double)bannerImageBaselineOffsetPercentage
{
  return 0.0;
}

- (FCContentColorMap)contentColorMap
{
  return 0;
}

- (FCHeadlineTemplate)defaultHeadlineTemplate
{
  return 0;
}

- (FCTextInfo)headlineTitleTextInfo
{
  return 0;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return 0;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return 0;
}

- (FCColor)darkStyleBackgroundColor
{
  return 0;
}

- (FCColor)darkStyleForegroundColor
{
  return 0;
}

- (FCColor)navigationChromeBackgroundColor
{
  return 0;
}

- (FCColor)navigationChromeSeparatorColor
{
  return 0;
}

- (FCColorGradient)navigationChromeBackgroundGradient
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentMode
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentModeCompact
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentModeLarge
{
  return 0;
}

- (FCColor)darkStyleNavigationChromeSeparatorColor
{
  return 0;
}

- (FCColor)darkStyleNavigationChromeBackgroundColor
{
  return 0;
}

- (FCColorGradient)darkStyleNavigationChromeBackgroundGradient
{
  return 0;
}

- (BOOL)allowCustomBottomStyle
{
  return 0;
}

- (CGSize)nameImageSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (FCEdgeInsets)nameImageInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCEdgeInsets)nameImageForDarkBackgroundInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCEdgeInsets)nameImageMaskInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCAssetHandle)logoImageAssetHandle
{
  double v2 = [(FCPuzzleType *)self defaultBannerImage];
  double v3 = [v2 assetHandle];

  return (FCAssetHandle *)v3;
}

- (CGSize)nameImageMaskSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)nameImageForDarkBackgroundSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)loadableFonts
{
  return 0;
}

- (FCColor)feedBackgroundColor
{
  return 0;
}

- (FCColor)feedControlColor
{
  return 0;
}

- (FCColorGradient)adBackgroundGradient
{
  return 0;
}

- (FCColor)adBackgroundColor
{
  return 0;
}

- (FCColorGradient)feedBackgroundGradient
{
  return 0;
}

- (FCColor)darkStyleFeedBackgroundColor
{
  return 0;
}

- (FCColor)darkStyleAdBackgroundColor
{
  return 0;
}

- (FCColorGradient)darkStyleAdBackgroundGradient
{
  return 0;
}

- (FCColorGradient)darkStyleFeedBackgroundGradient
{
  return 0;
}

- (FCColor)darkStyleFeedControlColor
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)kind
{
  return self->_kind;
}

- (unint64_t)traits
{
  return self->_traits;
}

- (NSString)engineResourceID
{
  return self->_engineResourceID;
}

- (id)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSArray)promotedPuzzleIDs
{
  return self->_promotedPuzzleIDs;
}

- (NSArray)latestPuzzleIDs
{
  return self->_latestPuzzleIDs;
}

- (FCAssetHandle)nameImageAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return self->_nameImageCompactAssetHandle;
}

- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle
{
  return self->_nameImageForDarkBackgroundAssetHandle;
}

- (FCAssetHandle)nameImageMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return self->_feedNavImageAssetHandle;
}

- (id)feedNavImageHQAssetHandle
{
  return self->_feedNavImageHQAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (FCAssetHandle)navigationChromeBackgroundImage
{
  return self->_navigationChromeBackgroundImage;
}

- (FCAssetHandle)navigationChromeBackgroundImageCompact
{
  return self->_navigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)navigationChromeBackgroundImageLarge
{
  return self->_navigationChromeBackgroundImageLarge;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImage
{
  return self->_darkStyleNavigationChromeBackgroundImage;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageCompact
{
  return self->_darkStyleNavigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageLarge
{
  return self->_darkStyleNavigationChromeBackgroundImageLarge;
}

- (id)language
{
  return self->_language;
}

- (id)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (id)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (id)loadDate
{
  return self->_loadDate;
}

- (id)fetchDate
{
  return self->_fetchDate;
}

- (id)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (FCAssetHandle)exploreTileImageAssetHandle
{
  return self->_exploreTileImageAssetHandle;
}

- (FCColor)themeColor
{
  return self->_themeColor;
}

- (FCColor)puzzlePrimaryColor
{
  return self->_puzzlePrimaryColor;
}

- (FCColor)darkStyleThemeColor
{
  return self->_darkStyleThemeColor;
}

- (FCColor)darkStylePuzzlePrimaryColor
{
  return self->_darkStylePuzzlePrimaryColor;
}

- (id)groupTitleColor
{
  return self->_groupTitleColor;
}

- (id)groupDarkStyleTitleColor
{
  return self->_groupDarkStyleTitleColor;
}

- (id)titleDisplayPrefix
{
  return self->_titleDisplayPrefix;
}

- (void)setTitleDisplayPrefix:(id)a3
{
}

- (id)titleDisplaySuffix
{
  return self->_titleDisplaySuffix;
}

- (void)setTitleDisplaySuffix:(id)a3
{
}

- (FCPuzzleTypeThumbnailDirectoryType)thumbnailDirectory
{
  return self->_thumbnailDirectory;
}

- (BOOL)disableBlock
{
  return self->_disableBlock;
}

- (BOOL)disableFollow
{
  return self->_disableFollow;
}

- (NSString)feedMastheadType
{
  return self->_feedMastheadType;
}

- (NSString)imageResourceID
{
  return self->_imageResourceID;
}

- (NSDictionary)navigationBarThemeByRankID
{
  return self->_navigationBarThemeByRankID;
}

- (NSArray)orderedNavigationBarThemes
{
  return self->_orderedNavigationBarThemes;
}

- (NTPBPuzzleTypeRecord)puzzleTypeRecord
{
  return self->_puzzleTypeRecord;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecord, 0);
  objc_storeStrong((id *)&self->_orderedNavigationBarThemes, 0);
  objc_storeStrong((id *)&self->_navigationBarThemeByRankID, 0);
  objc_storeStrong((id *)&self->_imageResourceID, 0);
  objc_storeStrong((id *)&self->_feedMastheadType, 0);
  objc_storeStrong((id *)&self->_thumbnailDirectory, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColor, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
  objc_storeStrong((id *)&self->_darkStylePuzzlePrimaryColor, 0);
  objc_storeStrong((id *)&self->_darkStyleThemeColor, 0);
  objc_storeStrong((id *)&self->_puzzlePrimaryColor, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_exploreTileImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackgroundAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_latestPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_promotedPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_engineResourceID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_nameCompact, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end