@interface FCTag
- (BOOL)_isValidScheme:(BOOL)a1;
- (BOOL)allowCustomBottomStyle;
- (BOOL)disableBlock;
- (BOOL)disableFollow;
- (BOOL)hasEvergreenArticleList;
- (BOOL)hideAccessoryText;
- (BOOL)hideLocationInMasthead;
- (BOOL)isArticleReadCountReportingEnabled;
- (BOOL)isAuthenticationSetup;
- (BOOL)isAutoDarkModeEnabled;
- (BOOL)isBlockedExplicitContent;
- (BOOL)isDark;
- (BOOL)isDeprecated;
- (BOOL)isEqual:(id)a3;
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
- (BOOL)isSportsRecommendable;
- (BOOL)isSubscribable;
- (BOOL)isWhite;
- (BOOL)isWhitelisted;
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
- (FCAssetHandle)feedNavImageAssetHandle;
- (FCAssetHandle)feedNavImageHQAssetHandle;
- (FCAssetHandle)logoImageAssetHandle;
- (FCAssetHandle)nameImageAssetHandle;
- (FCAssetHandle)nameImageCompactAssetHandle;
- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle;
- (FCAssetHandle)nameImageLargeAssetHandle;
- (FCAssetHandle)nameImageLargeMaskAssetHandle;
- (FCAssetHandle)nameImageMaskAssetHandle;
- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle;
- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle;
- (FCAssetHandle)navigationChromeBackgroundImage;
- (FCAssetHandle)navigationChromeBackgroundImageCompact;
- (FCAssetHandle)navigationChromeBackgroundImageLarge;
- (FCAssetHandle)sportsLogoAltImageAssetHandle;
- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle;
- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle;
- (FCAssetHandle)sportsLogoImageAssetHandle;
- (FCAssetHandle)sportsLogoImageCompactAssetHandle;
- (FCAssetHandle)sportsLogoImageLargeAssetHandle;
- (FCChannelProviding)asChannel;
- (FCColor)adBackgroundColor;
- (FCColor)backgroundColor;
- (FCColor)darkStyleAdBackgroundColor;
- (FCColor)darkStyleBackgroundColor;
- (FCColor)darkStyleFeedBackgroundColor;
- (FCColor)darkStyleFeedControlColor;
- (FCColor)darkStyleForegroundColor;
- (FCColor)darkStyleNavigationChromeBackgroundColor;
- (FCColor)darkStyleNavigationChromeSeparatorColor;
- (FCColor)feedBackgroundColor;
- (FCColor)feedControlColor;
- (FCColor)foregroundColor;
- (FCColor)groupDarkStyleTitleColor;
- (FCColor)groupTitleColor;
- (FCColor)navigationChromeBackgroundColor;
- (FCColor)navigationChromeSeparatorColor;
- (FCColor)sportsEventNavigationForegroundColor;
- (FCColor)sportsPrimaryColor;
- (FCColor)sportsSecondaryColor;
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
- (FCFeedTheming)theme;
- (FCHeadlineTemplate)defaultHeadlineTemplate;
- (FCInterestToken)tagRecordInterestToken;
- (FCPaywallConfiguration)paidBundlePaywallConfiguration;
- (FCPuzzleTypeProviding)asPuzzleType;
- (FCSectionProviding)asSection;
- (FCSectionSupergroupKnobs)supergroupKnobs;
- (FCSportsEventProviding)asSportsEvent;
- (FCSportsProviding)asSports;
- (FCSportsRecommendationMappings)sportsRecommendationMappings;
- (FCTag)initWithData:(id)a3 context:(id)a4;
- (FCTag)initWithTagMetadata:(id)a3 assetManager:(id)a4 isSports:(BOOL)a5;
- (FCTag)initWithTagRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5;
- (FCTag)initWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5;
- (FCTagBanner)bannerImageForMask;
- (FCTagBanner)bannerImageForThemeBackground;
- (FCTagBanner)bannerImageForWhiteBackground;
- (FCTagBanner)compactBannerImage;
- (FCTagBanner)defaultBannerImage;
- (FCTextInfo)headlineBylineTextInfo;
- (FCTextInfo)headlineExcerptTextInfo;
- (FCTextInfo)headlineTitleTextInfo;
- (FCTopicProviding)asTopic;
- (NSArray)adTargetingKeywords;
- (NSArray)allowedStorefrontIDs;
- (NSArray)blockedStorefrontIDs;
- (NSArray)currentIssueIDs;
- (NSArray)iAdCategories;
- (NSArray)iAdKeywords;
- (NSArray)loadableFonts;
- (NSArray)publisherPaidBundlePurchaseIDs;
- (NSArray)publisherPaidFeldsparablePurchaseIDs;
- (NSArray)publisherPaidOfferableConfigurations;
- (NSArray)publisherSpecifiedArticleIDs;
- (NSArray)recentIssueIDs;
- (NSArray)sectionIDs;
- (NSArray)sportsParentTagIdentifiers;
- (NSArray)topLevelGroupsTagIdentifiers;
- (NSData)backingTagRecordData;
- (NSData)data;
- (NSData)sportsRecommendationMappingsJSON;
- (NSDate)fetchDate;
- (NSDate)lastModifiedDate;
- (NSDate)loadDate;
- (NSDate)publisherSpecifiedArticleIDsModifiedDate;
- (NSDictionary)publisherSpecifiedArticles;
- (NSString)UMCCanonicalID;
- (NSString)articleRecirculationConfigJSON;
- (NSString)backIssuesListID;
- (NSString)compactDisplayName;
- (NSString)defaultSectionID;
- (NSString)description;
- (NSString)displayName;
- (NSString)feedMastheadType;
- (NSString)groupName;
- (NSString)highlightsArticleListID;
- (NSString)identifier;
- (NSString)language;
- (NSString)magazineGenre;
- (NSString)name;
- (NSString)nameCompact;
- (NSString)parentID;
- (NSString)personalizedPaywallName;
- (NSString)pptFeedIDOverride;
- (NSString)primaryAudience;
- (NSString)publisherPaidAuthorizationURL;
- (NSString)publisherPaidVerificationURL;
- (NSString)publisherPaidWebAccessURL;
- (NSString)replacementID;
- (NSString)sportsData;
- (NSString)sportsFullName;
- (NSString)sportsLocation;
- (NSString)sportsNameAbbreviation;
- (NSString)sportsNickname;
- (NSString)sportsPrimaryName;
- (NSString)sportsSecondaryName;
- (NSString)sportsSecondaryShortName;
- (NSString)sportsTypeDisplayName;
- (NSString)sportsTypePluralizedDisplayName;
- (NSString)stocksFeedConfigJSON;
- (NSString)subtitle;
- (NSString)superfeedConfigResourceID;
- (NSString)supergroupConfigJson;
- (NSString)supergroupKnobsJson;
- (NSString)titleDisplayPrefix;
- (NSString)titleDisplaySuffix;
- (NSString)topLevelSportTagIdentifier;
- (NSString)versionKey;
- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings;
- (NTPBTagRecord)tagRecord;
- (double)bannerImageBaselineOffsetPercentage;
- (double)bannerImageScale;
- (double)subscriptionRate;
- (id)_FCColorFromHexTriplet:(void *)a1;
- (id)_feedConfigurationForSection:(id *)a1;
- (id)authorizationURL;
- (id)freeFeedIDForBin:(int64_t)a3;
- (id)freeFeedIDForSection:(id)a3 bin:(int64_t)a4;
- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 defaultSection:(id)a5 publisherAuthorizationURL:(id)a6 publisherVerificationURL:(id)a7;
- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 publisherPaidBundlePurchaseIDs:(id)a5;
- (id)initChannelFromNotificationWithIdentifier:(id)a3 name:(id)a4 nameImageAssetHandle:(id)a5 nameImageMaskAssetHandle:(id)a6;
- (id)initForTestingWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5 umcCanonicalID:(id)a6;
- (id)mainCompactDisplayName;
- (id)paidFeedIDForBin:(int64_t)a3;
- (id)paidFeedIDForSection:(id)a3 bin:(int64_t)a4;
- (id)prefetchPurchaseOffer;
- (id)purchaseOfferableConfigurationsFromProtobufList:(void *)a1;
- (id)setTitleDisplayPrefixOverride:(id)a3;
- (id)setTitleDisplaySuffixOverride:(id)a3;
- (int64_t)contentProvider;
- (int64_t)feedType;
- (int64_t)minimumNewsVersion;
- (int64_t)score;
- (int64_t)sportsLogoMastheadHorizontalPaddingOffset;
- (int64_t)sportsLogoMastheadLeadingOffset;
- (unint64_t)channelType;
- (unint64_t)groupingEligibility;
- (unint64_t)hash;
- (unint64_t)navigationChromeBackgroundImageContentMode;
- (unint64_t)navigationChromeBackgroundImageContentModeCompact;
- (unint64_t)navigationChromeBackgroundImageContentModeLarge;
- (unint64_t)sportsLeagueType;
- (unint64_t)sportsLogoMastheadVisibility;
- (unint64_t)sportsType;
- (unint64_t)tagType;
- (unint64_t)userFacingTagType;
- (void)setBannerImageBaselineOffsetPercentage:(double)a3;
- (void)setBannerImageScale:(double)a3;
- (void)setNameImageAssetHandle:(id)a3;
- (void)setNameImageSize:(CGSize)a3;
- (void)setPptFeedIDOverride:(id)a3;
- (void)setTitleDisplayPrefix:(id)a3;
- (void)setTitleDisplaySuffix:(id)a3;
@end

@implementation FCTag

- (FCHeadlineTemplate)defaultHeadlineTemplate
{
  return self->_defaultHeadlineTemplate;
}

- (FCSportsProviding)asSports
{
  if ([(FCTag *)self isSports]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (FCSportsProviding *)v3;
}

- (BOOL)isSports
{
  return self->_isSports;
}

- (FCFeedTheming)theme
{
  v2 = self;
  return (FCFeedTheming *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRecordInterestToken, 0);
  objc_storeStrong((id *)&self->_tagRecord, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_lazyContentColorMap, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_adBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedControlColorHexString, 0);
  objc_storeStrong((id *)&self->_feedControlColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeSeparatorColorHexString, 0);
  objc_storeStrong((id *)&self->_navigationChromeSeparatorColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleForegroundColorHexString, 0);
  objc_storeStrong((id *)&self->_foregroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_backgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_sectionFeedConfigurations, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_tagInterestToken, 0);
  objc_storeStrong((id *)&self->_pptFeedIDOverride, 0);
  objc_storeStrong((id *)&self->_feedMastheadType, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_adBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundColor, 0);
  objc_storeStrong((id *)&self->_adBackgroundColor, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedControlColor, 0);
  objc_storeStrong((id *)&self->_feedControlColor, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_feedBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sportsEventNavigationForegroundColor, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
  objc_storeStrong((id *)&self->_sportsRecommendationMappings, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryColor, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryColor, 0);
  objc_storeStrong((id *)&self->_sportsTypePluralizedDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsTypeDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsLocation, 0);
  objc_storeStrong((id *)&self->_sportsNickname, 0);
  objc_storeStrong((id *)&self->_sportsFullName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryShortName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryName, 0);
  objc_storeStrong((id *)&self->_sportsNameAbbreviation, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryName, 0);
  objc_storeStrong((id *)&self->_UMCCanonicalID, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsData, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColorHexString, 0);
  objc_storeStrong((id *)&self->_groupTitleColorHexString, 0);
  objc_storeStrong((id *)&self->_supergroupKnobs, 0);
  objc_storeStrong((id *)&self->_supergroupKnobsJson, 0);
  objc_storeStrong((id *)&self->_supergroupConfigJson, 0);
  objc_storeStrong((id *)&self->_paidBundlePaywallConfiguration, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticles, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDsModifiedDate, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_nameImageLargeMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskWidgetHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskWidgetLQAssetHandle, 0);
  objc_storeStrong((id *)&self->_publisherPaidDescriptionStrings, 0);
  objc_storeStrong((id *)&self->_publisherPaidOfferableConfigurations, 0);
  objc_storeStrong((id *)&self->_publisherPaidBundlePurchaseIDs, 0);
  objc_storeStrong((id *)&self->_publisherPaidFeldsparablePurchaseIDs, 0);
  objc_storeStrong((id *)&self->_publisherPaidWebAccessURL, 0);
  objc_storeStrong((id *)&self->_publisherPaidVerificationURL, 0);
  objc_storeStrong((id *)&self->_publisherPaidAuthorizationURL, 0);
  objc_storeStrong((id *)&self->_compactBannerImage, 0);
  objc_storeStrong((id *)&self->_bannerImageForMask, 0);
  objc_storeStrong((id *)&self->_bannerImageForThemeBackground, 0);
  objc_storeStrong((id *)&self->_bannerImageForWhiteBackground, 0);
  objc_storeStrong((id *)&self->_defaultHeadlineTemplate, 0);
  objc_storeStrong((id *)&self->_defaultSectionID, 0);
  objc_storeStrong((id *)&self->_sectionIDs, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_headlineBylineTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineExcerptTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineTitleTextInfo, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_feedNavImageHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_logoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackgroundAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_adTargetingKeywords, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_magazineGenre, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_backIssuesListID, 0);
  objc_storeStrong((id *)&self->_recentIssueIDs, 0);
  objc_storeStrong((id *)&self->_currentIssueIDs, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_highlightsArticleListID, 0);
  objc_storeStrong((id *)&self->_replacementID, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_nameCompact, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isPuzzleHub
{
  return self->_isPuzzleHub;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (BOOL)isNewspaper
{
  return self->_isNewspaper;
}

- (BOOL)isMySports
{
  return self->_isMySports;
}

- (BOOL)isMagazine
{
  return self->_isMagazine;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)hideAccessoryText
{
  return self->_hideAccessoryText;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return self->_feedNavImageAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (double)bannerImageScale
{
  return self->_bannerImageScale;
}

- (double)bannerImageBaselineOffsetPercentage
{
  return self->_bannerImageBaselineOffsetPercentage;
}

- (BOOL)isSportsEvent
{
  return [(FCTag *)self conformsToProtocol:&unk_1EF8F7530];
}

- (FCChannelProviding)asChannel
{
  if ([(FCTag *)self tagType] == 2) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (FCChannelProviding *)v3;
}

- (FCTopicProviding)asTopic
{
  if ([(FCTag *)self tagType] == 1) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (FCTopicProviding *)v3;
}

- (FCSectionProviding)asSection
{
  v2 = self;
  if ([(FCTag *)self tagType] != 3
    && [(FCTag *)v2 tagType] != 5
    && [(FCTag *)v2 tagType] != 4)
  {
    v2 = 0;
  }
  return (FCSectionProviding *)v2;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (FCTag)initWithTagRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5
{
  uint64_t v425 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a4;
  id v416 = a5;
  uint64_t v10 = [v8 name];
  uint64_t v11 = [v8 type] - 1;
  if (v11 < 5) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = [v8 base];
  v14 = [v13 identifier];
  v415 = (void *)v10;
  v15 = [(FCTag *)self initWithTagType:v12 identifier:v14 name:v10];

  if (!v15) {
    goto LABEL_82;
  }
  id v409 = a4;
  context = (void *)MEMORY[0x1A6260FD0]();
  if (([v8 propertyFlags] & 4) != 0) {
    v15->_userFacingTagTypeOverride = 1;
  }
  uint64_t v16 = [v8 nameCompact];
  nameCompact = v15->_nameCompact;
  v15->_nameCompact = (NSString *)v16;

  uint64_t v18 = [v8 feedConfiguration];
  feedConfiguration = v15->_feedConfiguration;
  v15->_feedConfiguration = (NTPBFeedConfiguration *)v18;

  v411 = [v8 purchaseOfferableConfigurations];
  uint64_t v20 = -[FCTag purchaseOfferableConfigurationsFromProtobufList:](v411);
  publisherPaidOfferableConfigurations = v15->_publisherPaidOfferableConfigurations;
  v15->_publisherPaidOfferableConfigurations = (NSArray *)v20;

  unint64_t v22 = 0x1E4F1C000uLL;
  v23 = (void *)MEMORY[0x1E4F1C9C8];
  v24 = [v8 base];
  v25 = [v24 fetchDate];
  uint64_t v26 = [v23 dateWithPBDate:v25];
  fetchDate = v15->_fetchDate;
  v15->_fetchDate = (NSDate *)v26;

  uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
  loadDate = v15->_loadDate;
  v15->_loadDate = (NSDate *)v28;

  v30 = (void *)MEMORY[0x1E4F1C9C8];
  v31 = [v8 base];
  v32 = [v31 modificationDate];
  uint64_t v33 = [v30 dateWithPBDate:v32];
  lastModifiedDate = v15->_lastModifiedDate;
  v15->_lastModifiedDate = (NSDate *)v33;

  v35 = [v8 base];
  uint64_t v36 = [v35 changeTag];
  versionKey = v15->_versionKey;
  v15->_versionKey = (NSString *)v36;

  v15->_isDeprecated = [v8 isDeprecated];
  uint64_t v38 = [v8 replacementID];
  replacementID = v15->_replacementID;
  v15->_replacementID = (NSString *)v38;

  uint64_t v40 = [v8 highlightsArticleListID];
  highlightsArticleListID = v15->_highlightsArticleListID;
  v15->_highlightsArticleListID = (NSString *)v40;

  v15->_isExplicitContent = [v8 isExplicitContent];
  uint64_t v42 = [v8 primaryAudience];
  primaryAudience = v15->_primaryAudience;
  v15->_primaryAudience = (NSString *)v42;

  uint64_t v44 = [v8 iAdCategories];
  iAdCategories = v15->_iAdCategories;
  v15->_iAdCategories = (NSArray *)v44;

  uint64_t v46 = [v8 iAdKeywords];
  iAdKeywords = v15->_iAdKeywords;
  v15->_iAdKeywords = (NSArray *)v46;

  uint64_t v48 = [v8 language];
  language = v15->_language;
  v15->_language = (NSString *)v48;

  uint64_t v50 = [v8 magazineGenre];
  magazineGenre = v15->_magazineGenre;
  v15->_magazineGenre = (NSString *)v50;

  uint64_t v52 = [v8 superfeedConfigResourceID];
  superfeedConfigResourceID = v15->_superfeedConfigResourceID;
  v15->_superfeedConfigResourceID = (NSString *)v52;

  [v8 subscriptionRate];
  v15->_subscriptionRate = v54;
  uint64_t v55 = [v8 adTargetingKeywords];
  adTargetingKeywords = v15->_adTargetingKeywords;
  v15->_adTargetingKeywords = (NSArray *)v55;

  uint64_t v57 = [v8 blockedStorefrontIDs];
  blockedStorefrontIDs = v15->_blockedStorefrontIDs;
  v15->_blockedStorefrontIDs = (NSArray *)v57;

  uint64_t v59 = [v8 allowedStorefrontIDs];
  allowedStorefrontIDs = v15->_allowedStorefrontIDs;
  v15->_allowedStorefrontIDs = (NSArray *)v59;

  v15->_score = [v8 score];
  v15->_contentProvider = [v8 contentProvider];
  v15->_isPublic = [v8 isPublic];
  v15->_minimumNewsVersion = [v8 minimumNewsVersion];
  v15->_isNotificationEnabled = [v8 isNotificationEnabled];
  uint64_t v61 = [v8 subtitle];
  subtitle = v15->_subtitle;
  v15->_subtitle = (NSString *)v61;

  uint64_t v63 = [v8 latestIssueIDs];
  currentIssueIDs = v15->_currentIssueIDs;
  v15->_currentIssueIDs = (NSArray *)v63;

  uint64_t v65 = [v8 recentIssueIDs];
  recentIssueIDs = v15->_recentIssueIDs;
  v15->_recentIssueIDs = (NSArray *)v65;

  uint64_t v67 = [v8 archiveIssueListID];
  backIssuesListID = v15->_backIssuesListID;
  v15->_backIssuesListID = (NSString *)v67;

  [v8 nameImageScaleFactor];
  v15->_bannerImageScale = v69;
  v15->_bannerImageBaselineOffsetPercentage = (double)(unint64_t)[v8 nameImageBaselineShift];
  uint64_t v70 = [v8 generateLogoImageAssetHandleWithAssetManager:v9];
  logoImageAssetHandle = v15->_logoImageAssetHandle;
  v15->_logoImageAssetHandle = (FCAssetHandle *)v70;

  uint64_t v72 = [v8 generateNameImageAssetHandleWithAssetManager:v9];
  nameImageAssetHandle = v15->_nameImageAssetHandle;
  v15->_nameImageAssetHandle = (FCAssetHandle *)v72;

  uint64_t v74 = [v8 generateNameImageCompactAssetHandleWithAssetManager:v9];
  nameImageCompactAssetHandle = v15->_nameImageCompactAssetHandle;
  v15->_nameImageCompactAssetHandle = (FCAssetHandle *)v74;

  uint64_t v76 = [v8 generateNameImageForDarkBackgroundAssetHandleWithAssetManager:v9];
  nameImageForDarkBackgroundAssetHandle = v15->_nameImageForDarkBackgroundAssetHandle;
  v15->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v76;

  v78 = [v8 nameImageMaskURL];
  uint64_t v79 = [v8 generateNameImageMaskAssetHandleForURL:v78 withAssetManager:v9];
  nameImageMaskAssetHandle = v15->_nameImageMaskAssetHandle;
  v15->_nameImageMaskAssetHandle = (FCAssetHandle *)v79;

  uint64_t v81 = [v8 generateCoverImageAssetHandleWithAssetManager:v9];
  coverImageAssetHandle = v15->_coverImageAssetHandle;
  v15->_coverImageAssetHandle = (FCAssetHandle *)v81;

  uint64_t v83 = [v8 generateFeedNavImageAssetHandleWithAssetManager:v9];
  feedNavImageAssetHandle = v15->_feedNavImageAssetHandle;
  v15->_feedNavImageAssetHandle = (FCAssetHandle *)v83;

  uint64_t v85 = [v8 generateFeedNavImageHQAssetHandleWithAssetManager:v9];
  feedNavImageHQAssetHandle = v15->_feedNavImageHQAssetHandle;
  v15->_feedNavImageHQAssetHandle = (FCAssetHandle *)v85;

  uint64_t v87 = [v8 parentID];
  parentID = v15->_parentID;
  v15->_parentID = (NSString *)v87;

  uint64_t v89 = [v8 channelSectionIDs];
  sectionIDs = v15->_sectionIDs;
  v15->_sectionIDs = (NSArray *)v89;

  uint64_t v91 = [v8 channelDefaultSectionID];
  defaultSectionID = v15->_defaultSectionID;
  v15->_defaultSectionID = (NSString *)v91;

  uint64_t v93 = [v8 channelSectionFeedConfigurations];
  sectionFeedConfigurations = v15->_sectionFeedConfigurations;
  v15->_sectionFeedConfigurations = (NSArray *)v93;

  uint64_t v95 = [v8 supergroupConfigJson];
  supergroupConfigJson = v15->_supergroupConfigJson;
  v15->_supergroupConfigJson = (NSString *)v95;

  uint64_t v97 = [v8 supergroupKnobsJson];
  supergroupKnobsJson = v15->_supergroupKnobsJson;
  v15->_supergroupKnobsJson = (NSString *)v97;

  v99 = [FCSectionSupergroupKnobs alloc];
  v100 = [v8 supergroupKnobsJson];
  uint64_t v101 = [(FCSectionSupergroupKnobs *)v99 initWithJSONString:v100];
  supergroupKnobs = v15->_supergroupKnobs;
  v15->_supergroupKnobs = (FCSectionSupergroupKnobs *)v101;

  v15->_hideAccessoryText = [v8 hideAccessoryText];
  v103 = [v8 templateJson];
  v104 = [v103 dataUsingEncoding:4];

  if (v104)
  {
    id v403 = a5;
    id v418 = 0;
    uint64_t v105 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v104 options:0 error:&v418];
    id v106 = v418;
    v407 = (void *)v105;
    if (v105)
    {
      if (v9) {
        v107 = (void *)v9[15];
      }
      else {
        v107 = 0;
      }
      id v108 = v107;
      id v109 = v407;
      id v110 = v108;
      v111 = [v109 objectForKeyedSubscript:@"2"];
      if (v111)
      {
        v404 = v110;
        uint64_t v112 = [@"2" integerValue];
        id v113 = v111;
        if (v112 == 2)
        {
          id v401 = v106;
          id v399 = v404;
          uint64_t v114 = [v113 objectForKeyedSubscript:@"foregroundColor"];
          foregroundColorHexString = v15->_foregroundColorHexString;
          v15->_foregroundColorHexString = (NSString *)v114;

          uint64_t v116 = [v113 objectForKeyedSubscript:@"darkStyleForegroundColor"];
          darkStyleForegroundColorHexString = v15->_darkStyleForegroundColorHexString;
          v15->_darkStyleForegroundColorHexString = (NSString *)v116;

          uint64_t v118 = [v113 objectForKeyedSubscript:@"backgroundColor"];
          backgroundColorHexString = v15->_backgroundColorHexString;
          v15->_backgroundColorHexString = (NSString *)v118;

          uint64_t v120 = [v113 objectForKeyedSubscript:@"darkStyleBackgroundColor"];
          darkStyleBackgroundColorHexString = v15->_darkStyleBackgroundColorHexString;
          v15->_darkStyleBackgroundColorHexString = (NSString *)v120;

          uint64_t v122 = [v113 objectForKeyedSubscript:@"groupTitleColor"];
          groupTitleColorHexString = v15->_groupTitleColorHexString;
          v15->_groupTitleColorHexString = (NSString *)v122;

          uint64_t v124 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundColor"];
          navigationChromeBackgroundColorHexString = v15->_navigationChromeBackgroundColorHexString;
          v15->_navigationChromeBackgroundColorHexString = (NSString *)v124;

          uint64_t v126 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundDarkModeColor"];
          darkStyleNavigationChromeBackgroundColorHexString = v15->_darkStyleNavigationChromeBackgroundColorHexString;
          v15->_darkStyleNavigationChromeBackgroundColorHexString = (NSString *)v126;

          uint64_t v128 = [v113 objectForKeyedSubscript:@"navigationChromeSeparatorColor"];
          navigationChromeSeparatorColorHexString = v15->_navigationChromeSeparatorColorHexString;
          v15->_navigationChromeSeparatorColorHexString = (NSString *)v128;

          uint64_t v130 = [v113 objectForKeyedSubscript:@"navigationChromeSeparatorDarkModeColor"];
          darkStyleNavigationChromeSeparatorColorHexString = v15->_darkStyleNavigationChromeSeparatorColorHexString;
          v15->_darkStyleNavigationChromeSeparatorColorHexString = (NSString *)v130;

          uint64_t v132 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundGradient"];
          v400 = (void *)v132;
          if (v132)
          {
            uint64_t v133 = +[FCColorGradient colorGradientWithConfigDict:v132];
            navigationChromeBackgroundGradient = v15->_navigationChromeBackgroundGradient;
            v15->_navigationChromeBackgroundGradient = (FCColorGradient *)v133;
          }
          else
          {
            navigationChromeBackgroundGradient = v15->_navigationChromeBackgroundGradient;
            v15->_navigationChromeBackgroundGradient = 0;
          }

          uint64_t v153 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundDarkModeGradient"];
          v398 = (void *)v153;
          if (v153)
          {
            uint64_t v154 = +[FCColorGradient colorGradientWithConfigDict:v153];
            darkStyleNavigationChromeBackgroundGradient = v15->_darkStyleNavigationChromeBackgroundGradient;
            v15->_darkStyleNavigationChromeBackgroundGradient = (FCColorGradient *)v154;
          }
          else
          {
            darkStyleNavigationChromeBackgroundGradient = v15->_darkStyleNavigationChromeBackgroundGradient;
            v15->_darkStyleNavigationChromeBackgroundGradient = 0;
          }

          uint64_t v156 = [v113 objectForKeyedSubscript:@"feedBackgroundColor"];
          feedBackgroundColorHexString = v15->_feedBackgroundColorHexString;
          v15->_feedBackgroundColorHexString = (NSString *)v156;

          uint64_t v158 = [v113 objectForKeyedSubscript:@"darkStyleFeedBackgroundColor"];
          darkStyleFeedBackgroundColorHexString = v15->_darkStyleFeedBackgroundColorHexString;
          v15->_darkStyleFeedBackgroundColorHexString = (NSString *)v158;

          uint64_t v160 = [v113 objectForKeyedSubscript:@"feedBackgroundGradient"];
          v397 = (void *)v160;
          if (v160)
          {
            uint64_t v161 = +[FCColorGradient colorGradientWithConfigDict:v160];
            feedBackgroundGradient = v15->_feedBackgroundGradient;
            v15->_feedBackgroundGradient = (FCColorGradient *)v161;
          }
          else
          {
            feedBackgroundGradient = v15->_feedBackgroundGradient;
            v15->_feedBackgroundGradient = 0;
          }

          uint64_t v163 = [v113 objectForKeyedSubscript:@"darkStyleFeedBackgroundGradient"];
          v396 = (void *)v163;
          if (v163)
          {
            uint64_t v164 = +[FCColorGradient colorGradientWithConfigDict:v163];
            darkStyleFeedBackgroundGradient = v15->_darkStyleFeedBackgroundGradient;
            v15->_darkStyleFeedBackgroundGradient = (FCColorGradient *)v164;
          }
          else
          {
            darkStyleFeedBackgroundGradient = v15->_darkStyleFeedBackgroundGradient;
            v15->_darkStyleFeedBackgroundGradient = 0;
          }

          uint64_t v166 = [v113 objectForKeyedSubscript:@"feedControlColor"];
          feedControlColorHexString = v15->_feedControlColorHexString;
          v15->_feedControlColorHexString = (NSString *)v166;

          uint64_t v168 = [v113 objectForKeyedSubscript:@"darkStyleFeedControlColor"];
          darkStyleFeedControlColorHexString = v15->_darkStyleFeedControlColorHexString;
          v15->_darkStyleFeedControlColorHexString = (NSString *)v168;

          uint64_t v170 = [v113 objectForKeyedSubscript:@"adBackgroundColor"];
          adBackgroundColorHexString = v15->_adBackgroundColorHexString;
          v15->_adBackgroundColorHexString = (NSString *)v170;

          uint64_t v172 = [v113 objectForKeyedSubscript:@"darkStyleAdBackgroundColor"];
          darkStyleAdBackgroundColorHexString = v15->_darkStyleAdBackgroundColorHexString;
          v15->_darkStyleAdBackgroundColorHexString = (NSString *)v172;

          uint64_t v174 = [v113 objectForKeyedSubscript:@"adBackgroundGradient"];
          v395 = (void *)v174;
          if (v174)
          {
            uint64_t v175 = +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v174, v174, v396, v397, v398);
            adBackgroundGradient = v15->_adBackgroundGradient;
            v15->_adBackgroundGradient = (FCColorGradient *)v175;
          }
          else
          {
            adBackgroundGradient = v15->_adBackgroundGradient;
            v15->_adBackgroundGradient = 0;
          }

          v177 = [v113 objectForKeyedSubscript:@"darkStyleAdBackgroundGradient"];
          v178 = v9;
          if (v177)
          {
            uint64_t v179 = +[FCColorGradient colorGradientWithConfigDict:v177];
            darkStyleAdBackgroundGradient = v15->_darkStyleAdBackgroundGradient;
            v15->_darkStyleAdBackgroundGradient = (FCColorGradient *)v179;
          }
          else
          {
            darkStyleAdBackgroundGradient = v15->_darkStyleAdBackgroundGradient;
            v15->_darkStyleAdBackgroundGradient = 0;
          }

          uint64_t v181 = [v113 objectForKeyedSubscript:@"feedMastheadType"];
          feedMastheadType = v15->_feedMastheadType;
          v15->_feedMastheadType = (NSString *)v181;

          v183 = [v113 objectForKeyedSubscript:@"titleFontAttributes"];
          uint64_t v184 = +[FCTextInfo textInfoFromJSONValues:v183 URLGenerator:v399];
          headlineTitleTextInfo = v15->_headlineTitleTextInfo;
          v15->_headlineTitleTextInfo = (FCTextInfo *)v184;

          v186 = [v113 objectForKeyedSubscript:@"excerptFontAttributes"];
          uint64_t v187 = +[FCTextInfo textInfoFromJSONValues:v186 URLGenerator:v399];
          headlineExcerptTextInfo = v15->_headlineExcerptTextInfo;
          v15->_headlineExcerptTextInfo = (FCTextInfo *)v187;

          v189 = [v113 objectForKeyedSubscript:@"bylineFontAttributes"];
          uint64_t v190 = +[FCTextInfo textInfoFromJSONValues:v189 URLGenerator:v399];

          headlineBylineTextInfo = v15->_headlineBylineTextInfo;
          v15->_headlineBylineTextInfo = (FCTextInfo *)v190;

          v192 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundImageContentMode"];
          v15->_navigationChromeBackgroundImageContentMode = FCContentModeFromString(v192);

          v193 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundImageContentModeCompact"];
          v15->_navigationChromeBackgroundImageContentModeCompact = FCContentModeFromString(v193);

          v194 = [v113 objectForKeyedSubscript:@"navigationChromeBackgroundImageContentModeLarge"];
          v15->_navigationChromeBackgroundImageContentModeLarge = FCContentModeFromString(v194);

          v195 = [v113 objectForKeyedSubscript:@"contentColorMap"];
          id v196 = objc_alloc(MEMORY[0x1E4F81BD0]);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __61__FCTag__inflateFromJSONDictionary_withVersion_URLGenerator___block_invoke;
          *(void *)&long long v424 = &unk_1E5B4C840;
          *((void *)&v424 + 1) = v195;
          id v197 = v195;
          uint64_t v198 = [v196 initWithConstructor:buf];
          lazyContentColorMap = v15->_lazyContentColorMap;
          v15->_lazyContentColorMap = (NFLazy *)v198;

          v9 = v178;
          unint64_t v22 = 0x1E4F1C000uLL;
          id v106 = v401;
        }

        id v110 = v404;
      }
      else
      {
        id v136 = v110;
        id v402 = v106;
        id v137 = v109;
        uint64_t v138 = [v137 objectForKeyedSubscript:@"foregroundColor"];
        v139 = v15->_foregroundColorHexString;
        v15->_foregroundColorHexString = (NSString *)v138;

        uint64_t v140 = [v137 objectForKeyedSubscript:@"backgroundColor"];
        v141 = v15->_backgroundColorHexString;
        v15->_backgroundColorHexString = (NSString *)v140;

        uint64_t v142 = [v137 objectForKeyedSubscript:@"groupTitleColor"];
        v143 = v15->_groupTitleColorHexString;
        v15->_groupTitleColorHexString = (NSString *)v142;

        v144 = __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, @"headlineTitleFontName", @"headlineTitleFontResourceID");
        __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, @"headlineExcerptFontName", @"headlineExcerptFontResourceID");
        v145 = v405 = v9;
        v146 = __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, @"headlineBylineFontName", @"headlineBylineFontResourceID");

        uint64_t v147 = +[FCTextInfo textInfoFromJSONValues:v144 URLGenerator:v136];
        v148 = v15->_headlineTitleTextInfo;
        v15->_headlineTitleTextInfo = (FCTextInfo *)v147;

        uint64_t v149 = +[FCTextInfo textInfoFromJSONValues:v145 URLGenerator:v136];
        v150 = v15->_headlineExcerptTextInfo;
        v15->_headlineExcerptTextInfo = (FCTextInfo *)v149;

        uint64_t v151 = +[FCTextInfo textInfoFromJSONValues:v146 URLGenerator:v136];

        v152 = v15->_headlineBylineTextInfo;
        v15->_headlineBylineTextInfo = (FCTextInfo *)v151;
        v111 = 0;
        id v106 = v402;

        unint64_t v22 = 0x1E4F1C000;
        v9 = v405;
      }
    }
    else
    {
      v135 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v106;
        _os_log_error_impl(&dword_1A460D000, v135, OS_LOG_TYPE_ERROR, "failed to parse Tag template JSON with error: %{public}@", buf, 0xCu);
      }
    }

    a5 = v403;
  }
  v200 = objc_alloc_init(FCHeadlineTemplate);
  [(FCHeadlineTemplate *)v200 setHeadlineTitleTextInfo:v15->_headlineTitleTextInfo];
  [(FCHeadlineTemplate *)v200 setHeadlineExcerptTextInfo:v15->_headlineExcerptTextInfo];
  [(FCHeadlineTemplate *)v200 setHeadlineBylineTextInfo:v15->_headlineBylineTextInfo];
  v201 = +[FCColor whiteColor];
  [(FCHeadlineTemplate *)v200 setBackgroundColor:v201];

  v408 = v200;
  objc_storeStrong((id *)&v15->_defaultHeadlineTemplate, v200);
  v202 = [v8 nameImageMetadata];

  if (v202)
  {
    v203 = [v8 nameImageMetadata];
    unint64_t v204 = [v203 length];

    if (v204 <= 0x23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v394 = (void *)[[NSString alloc] initWithFormat:@"name image metadata has unexpected size"];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[FCTag initWithTagRecord:assetManager:interestToken:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCTag.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v424) = 560;
      WORD2(v424) = 2114;
      *(void *)((char *)&v424 + 6) = v394;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v205 = objc_msgSend(v8, "nameImageMetadata", v395);
    unint64_t v206 = [v205 length];

    if (v206 >= 0x24)
    {
      id v207 = [v8 nameImageMetadata];
      v208 = (_WORD *)[v207 bytes];

      LOWORD(v209) = *v208;
      CGFloat v210 = (double)v209;
      LOWORD(v211) = v208[1];
      CGFloat v212 = (double)v211;
      v15->_nameImageSize.width = v210;
      v15->_nameImageSize.height = v212;
      LOWORD(v210) = v208[2];
      double v213 = (double)*(unint64_t *)&v210;
      LOWORD(v212) = v208[5];
      double v214 = (double)*(unint64_t *)&v212;
      LOWORD(v215) = v208[4];
      double v216 = (double)v215;
      LOWORD(v217) = v208[3];
      double v218 = (double)v217;
      v15->_nameImageInsets.top = v213;
      v15->_nameImageInsets.left = v214;
      v15->_nameImageInsets.bottom = v216;
      v15->_nameImageInsets.right = v218;
      LOWORD(v213) = v208[6];
      LOWORD(v214) = v208[7];
      LOWORD(v216) = v208[8];
      LOWORD(v218) = v208[11];
      LOWORD(v219) = v208[10];
      LOWORD(v220) = v208[9];
      v15->_nameImageForDarkBackgroundSize.width = (double)*(unint64_t *)&v213;
      v15->_nameImageForDarkBackgroundSize.height = (double)*(unint64_t *)&v214;
      double v221 = (double)*(unint64_t *)&v216;
      double v222 = (double)*(unint64_t *)&v218;
      *(double *)&unint64_t v223 = (double)v219;
      *(double *)&unint64_t v224 = (double)v220;
      v15->_nameImageForDarkBackgroundInsets.top = v221;
      v15->_nameImageForDarkBackgroundInsets.left = v222;
      v15->_nameImageForDarkBackgroundInsets.bottom = (double)v219;
      v15->_nameImageForDarkBackgroundInsets.right = (double)v220;
      LOWORD(v221) = v208[12];
      CGFloat v225 = (double)*(unint64_t *)&v221;
      LOWORD(v222) = v208[13];
      CGFloat v226 = (double)*(unint64_t *)&v222;
      v15->_nameImageMaskSize.width = v225;
      v15->_nameImageMaskSize.height = v226;
      LOWORD(v225) = v208[14];
      LOWORD(v226) = v208[17];
      LOWORD(v223) = v208[16];
      LOWORD(v224) = v208[15];
      v15->_nameImageMaskInsets.top = (double)*(unint64_t *)&v225;
      v15->_nameImageMaskInsets.left = (double)*(unint64_t *)&v226;
      v15->_nameImageMaskInsets.bottom = (double)v223;
      v15->_nameImageMaskInsets.right = (double)v224;
    }
  }
  uint64_t v227 = objc_msgSend(v8, "publisherPaidAuthorizationURL", v395);
  publisherPaidAuthorizationURL = v15->_publisherPaidAuthorizationURL;
  v15->_publisherPaidAuthorizationURL = (NSString *)v227;

  uint64_t v229 = [v8 publisherPaidVerificationURL];
  publisherPaidVerificationURL = v15->_publisherPaidVerificationURL;
  v15->_publisherPaidVerificationURL = (NSString *)v229;

  uint64_t v231 = [v8 publisherPaidWebaccessURL];
  publisherPaidWebAccessURL = v15->_publisherPaidWebAccessURL;
  v15->_publisherPaidWebAccessURL = (NSString *)v231;

  uint64_t v233 = [v8 publisherPaidFeldsparablePurchaseIDs];
  publisherPaidFeldsparablePurchaseIDs = v15->_publisherPaidFeldsparablePurchaseIDs;
  v15->_publisherPaidFeldsparablePurchaseIDs = (NSArray *)v233;

  uint64_t v235 = [v8 publisherPaidBundlePurchaseIDs];
  publisherPaidBundlePurchaseIDs = v15->_publisherPaidBundlePurchaseIDs;
  v15->_publisherPaidBundlePurchaseIDs = (NSArray *)v235;

  v237 = [v8 purchaseOfferableConfigurations];
  uint64_t v238 = -[FCTag purchaseOfferableConfigurationsFromProtobufList:](v237);
  v239 = v15->_publisherPaidOfferableConfigurations;
  v15->_publisherPaidOfferableConfigurations = (NSArray *)v238;

  v15->_publisherPaidLeakyPaywallOptOut = [v8 publisherPaidLeakyPaywallOptOut];
  v15->_publisherPaidWebAccessOptIn = [v8 publisherPaidWebOptIn];
  uint64_t v240 = [v8 publisherPaidDescriptionStrings];
  publisherPaidDescriptionStrings = v15->_publisherPaidDescriptionStrings;
  v15->_publisherPaidDescriptionStrings = (NTPBPublisherPaidDescriptionStrings *)v240;

  uint64_t v242 = [v8 groupingAvailability] - 1;
  if (v242 < 3) {
    unint64_t v243 = v242 + 1;
  }
  else {
    unint64_t v243 = 0;
  }
  v15->_groupingEligibility = v243;
  v15->_isHidden = [v8 isHidden];
  v244 = [v8 nameImageMaskWidgetLQURL];
  uint64_t v245 = [v8 generateNameImageMaskAssetHandleForURL:v244 withAssetManager:v9];
  nameImageMaskWidgetLQAssetHandle = v15->_nameImageMaskWidgetLQAssetHandle;
  v15->_nameImageMaskWidgetLQAssetHandle = (FCAssetHandle *)v245;

  v247 = [v8 nameImageMaskWidgetHQURL];
  uint64_t v248 = [v8 generateNameImageMaskAssetHandleForURL:v247 withAssetManager:v9];
  nameImageMaskWidgetHQAssetHandle = v15->_nameImageMaskWidgetHQAssetHandle;
  v15->_nameImageMaskWidgetHQAssetHandle = (FCAssetHandle *)v248;

  v250 = [v8 nameImageLargeURL];
  uint64_t v251 = [v8 generateNameImageLargeAssetHandleForURLString:v250 withAssetManager:v9];
  nameImageLargeAssetHandle = v15->_nameImageLargeAssetHandle;
  v15->_nameImageLargeAssetHandle = (FCAssetHandle *)v251;

  v253 = [v8 nameImageLargeMaskURL];
  uint64_t v254 = [v8 generateNameImageLargeMaskAssetHandleForURLString:v253 withAssetManager:v9];
  nameImageLargeMaskAssetHandle = v15->_nameImageLargeMaskAssetHandle;
  v15->_nameImageLargeMaskAssetHandle = (FCAssetHandle *)v254;

  v256 = [v8 navigationChromeBackgroundImageURL];
  uint64_t v257 = [v8 generateNavigationChromeBackgroundImageAssetHandleForURLString:v256 withAssetManager:v9];
  navigationChromeBackgroundImage = v15->_navigationChromeBackgroundImage;
  v15->_navigationChromeBackgroundImage = (FCAssetHandle *)v257;

  v259 = [v8 darkStyleNavigationChromeBackgroundImageURL];
  uint64_t v260 = [v8 generateNavigationChromeBackgroundImageAssetHandleForURLString:v259 withAssetManager:v9];
  darkStyleNavigationChromeBackgroundImage = v15->_darkStyleNavigationChromeBackgroundImage;
  v15->_darkStyleNavigationChromeBackgroundImage = (FCAssetHandle *)v260;

  v262 = [v8 navigationChromeBackgroundImageCompactURL];
  uint64_t v263 = [v8 generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:v262 withAssetManager:v9];
  navigationChromeBackgroundImageCompact = v15->_navigationChromeBackgroundImageCompact;
  v15->_navigationChromeBackgroundImageCompact = (FCAssetHandle *)v263;

  v265 = [v8 darkStyleNavigationChromeBackgroundImageCompactURL];
  uint64_t v266 = [v8 generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:v265 withAssetManager:v9];
  darkStyleNavigationChromeBackgroundImageCompact = v15->_darkStyleNavigationChromeBackgroundImageCompact;
  v15->_darkStyleNavigationChromeBackgroundImageCompact = (FCAssetHandle *)v266;

  v268 = [v8 navigationChromeBackgroundImageLargeURL];
  uint64_t v269 = [v8 generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:v268 withAssetManager:v9];
  navigationChromeBackgroundImageLarge = v15->_navigationChromeBackgroundImageLarge;
  v15->_navigationChromeBackgroundImageLarge = (FCAssetHandle *)v269;

  v271 = [v8 darkStyleNavigationChromeBackgroundImageLargeURL];
  uint64_t v272 = [v8 generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:v271 withAssetManager:v9];
  darkStyleNavigationChromeBackgroundImageLarge = v15->_darkStyleNavigationChromeBackgroundImageLarge;
  v15->_darkStyleNavigationChromeBackgroundImageLarge = (FCAssetHandle *)v272;

  v274 = [v8 nameImageCompactURL];

  if (v274)
  {
    v275 = [v8 nameImageCompactURL];
    uint64_t v276 = [v8 generateNameImageMaskAssetHandleForURL:v275 withAssetManager:v9];
    v277 = v15->_nameImageCompactAssetHandle;
    v15->_nameImageCompactAssetHandle = (FCAssetHandle *)v276;
  }
  objc_storeStrong((id *)&v15->_tagRecord, a3);
  objc_storeStrong((id *)&v15->_assetManager, v409);
  objc_storeStrong((id *)&v15->_tagInterestToken, a5);
  v278 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageAssetHandle, v15->_nameImageSize.width, v15->_nameImageSize.height, v15->_nameImageInsets.top, v15->_nameImageInsets.left, v15->_nameImageInsets.bottom, v15->_nameImageInsets.right);
  bannerImageForWhiteBackground = v15->_bannerImageForWhiteBackground;
  v15->_bannerImageForWhiteBackground = v278;

  v280 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageForDarkBackgroundAssetHandle, v15->_nameImageForDarkBackgroundSize.width, v15->_nameImageForDarkBackgroundSize.height, v15->_nameImageForDarkBackgroundInsets.top, v15->_nameImageForDarkBackgroundInsets.left, v15->_nameImageForDarkBackgroundInsets.bottom, v15->_nameImageForDarkBackgroundInsets.right);
  bannerImageForThemeBackground = v15->_bannerImageForThemeBackground;
  v15->_bannerImageForThemeBackground = v280;

  v282 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageMaskAssetHandle, v15->_nameImageMaskSize.width, v15->_nameImageMaskSize.height, v15->_nameImageMaskInsets.top, v15->_nameImageMaskInsets.left, v15->_nameImageMaskInsets.bottom, v15->_nameImageMaskInsets.right);
  bannerImageForMask = v15->_bannerImageForMask;
  v15->_bannerImageForMask = v282;

  v284 = [FCTagBanner alloc];
  uint64_t v285 = -[FCTagBanner initWithAssetHandle:size:insets:](v284, "initWithAssetHandle:size:insets:", v15->_nameImageCompactAssetHandle, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0, 0.0, 0.0, 0.0);
  compactBannerImage = v15->_compactBannerImage;
  v15->_compactBannerImage = (FCTagBanner *)v285;

  v15->_isRealTimeTrackingEnabled = [v8 behaviorFlags] & 1;
  v15->_isArticleReadCountReportingEnabled = ([v8 behaviorFlags] & 8) != 0;
  v15->_isAutoDarkModeEnabled = ([v8 behaviorFlags] & 0x10) == 0;
  v15->_disableFollow = ([v8 behaviorFlags] & 2) != 0;
  v15->_disableBlock = ([v8 behaviorFlags] & 4) != 0;
  v15->_useCompactNameForPersonalizedPaywall = ([v8 behaviorFlags] & 0x20) != 0;
  v15->_sponsoredFeedEligible = ([v8 behaviorFlags] & 0x40) != 0;
  v15->_isInternal = [v8 propertyFlags] & 1;
  v15->_isSandbox = ([v8 propertyFlags] & 2) != 0;
  v15->_isLocal = ([v8 propertyFlags] & 4) != 0;
  v15->_isSensitiveTopic = ([v8 propertyFlags] & 8) != 0;
  v15->_isNewspaper = ([v8 propertyFlags] & 0x10) != 0;
  v15->_isMagazine = ([v8 propertyFlags] & 0x20) != 0;
  v15->_isSports = ([v8 propertyFlags] & 0x40) != 0;
  v15->_isMySports = ([v8 propertyFlags] & 0x80) != 0;
  v15->_isPuzzleHub = ((unsigned __int16)[v8 propertyFlags] >> 8) & 1;
  v15->_hasEvergreenArticleList = [v8 propertyFlagsLocalized] & 1;
  v287 = [(FCTag *)v15 identifier];
  v15->_isPuzzleType = +[FCPuzzleType isPuzzleTypeIdentifier:v287];

  v15->_isSportsRecommendable = [v8 isSportsRecommendable];
  uint64_t v288 = [v8 generateSportsLogoImageAssetHandleWithAssetManager:v9];
  sportsLogoImageAssetHandle = v15->_sportsLogoImageAssetHandle;
  v15->_sportsLogoImageAssetHandle = (FCAssetHandle *)v288;

  uint64_t v290 = [v8 generateSportsLogoImageCompactAssetHandleWithAssetManager:v9];
  sportsLogoImageCompactAssetHandle = v15->_sportsLogoImageCompactAssetHandle;
  v15->_sportsLogoImageCompactAssetHandle = (FCAssetHandle *)v290;

  uint64_t v292 = [v8 generateSportsLogoImageLargeAssetHandleWithAssetManager:v9];
  sportsLogoImageLargeAssetHandle = v15->_sportsLogoImageLargeAssetHandle;
  v15->_sportsLogoImageLargeAssetHandle = (FCAssetHandle *)v292;

  uint64_t v294 = [v8 generateSportsLogoAltImageAssetHandleWithAssetManager:v9];
  sportsLogoAltImageAssetHandle = v15->_sportsLogoAltImageAssetHandle;
  v15->_sportsLogoAltImageAssetHandle = (FCAssetHandle *)v294;

  uint64_t v296 = [v8 generateSportsLogoAltImageCompactAssetHandleWithAssetManager:v9];
  sportsLogoAltImageCompactAssetHandle = v15->_sportsLogoAltImageCompactAssetHandle;
  v15->_sportsLogoAltImageCompactAssetHandle = (FCAssetHandle *)v296;

  uint64_t v298 = [v8 generateSportsLogoAltImageLargeAssetHandleWithAssetManager:v9];
  sportsLogoAltImageLargeAssetHandle = v15->_sportsLogoAltImageLargeAssetHandle;
  v15->_sportsLogoAltImageLargeAssetHandle = (FCAssetHandle *)v298;

  v300 = [v8 sportsData];
  uint64_t v301 = [v300 length];

  if (v301)
  {
    uint64_t v302 = [v8 sportsData];
    sportsData = v15->_sportsData;
    v15->_sportsData = (NSString *)v302;

    v304 = (void *)MEMORY[0x1E4F1C9E8];
    v305 = [v8 sportsData];
    v306 = objc_msgSend(v304, "fc_dictionaryFromJSON:", v305);

    id v307 = v306;
    v308 = [[FCSportsData alloc] initWithDictionary:v307];

    uint64_t v309 = [(FCSportsData *)v308 UMCCanonicalID];
    UMCCanonicalID = v15->_UMCCanonicalID;
    v15->_UMCCanonicalID = (NSString *)v309;

    uint64_t v311 = [(FCSportsData *)v308 sportsPrimaryName];
    sportsPrimaryName = v15->_sportsPrimaryName;
    v15->_sportsPrimaryName = (NSString *)v311;

    uint64_t v313 = [(FCSportsData *)v308 sportsNameAbbreviation];
    sportsNameAbbreviation = v15->_sportsNameAbbreviation;
    v15->_sportsNameAbbreviation = (NSString *)v313;

    uint64_t v315 = [(FCSportsData *)v308 sportsSecondaryName];
    sportsSecondaryName = v15->_sportsSecondaryName;
    v15->_sportsSecondaryName = (NSString *)v315;

    uint64_t v317 = [(FCSportsData *)v308 sportsSecondaryShortName];
    sportsSecondaryShortName = v15->_sportsSecondaryShortName;
    v15->_sportsSecondaryShortName = (NSString *)v317;

    uint64_t v319 = [(FCSportsData *)v308 sportsFullName];
    sportsFullName = v15->_sportsFullName;
    v15->_sportsFullName = (NSString *)v319;

    uint64_t v321 = [(FCSportsData *)v308 topLevelSportTagIdentifier];
    topLevelSportTagIdentifier = v15->_topLevelSportTagIdentifier;
    v15->_topLevelSportTagIdentifier = (NSString *)v321;

    uint64_t v323 = [(FCSportsData *)v308 topLevelGroupsTagIdentifiers];
    topLevelGroupsTagIdentifiers = v15->_topLevelGroupsTagIdentifiers;
    v15->_topLevelGroupsTagIdentifiers = (NSArray *)v323;

    uint64_t v325 = [(FCSportsData *)v308 sportsNickname];
    sportsNickname = v15->_sportsNickname;
    v15->_sportsNickname = (NSString *)v325;

    uint64_t v327 = [(FCSportsData *)v308 sportsLocation];
    sportsLocation = v15->_sportsLocation;
    v15->_sportsLocation = (NSString *)v327;

    v15->_hideLocationInMasthead = [(FCSportsData *)v308 hideLocationInMasthead];
    v15->_sportsType = [(FCSportsData *)v308 sportsType];
    uint64_t v329 = [(FCSportsData *)v308 sportsTypeDisplayName];
    sportsTypeDisplayName = v15->_sportsTypeDisplayName;
    v15->_sportsTypeDisplayName = (NSString *)v329;

    uint64_t v331 = [(FCSportsData *)v308 sportsTypePluralizedDisplayName];
    sportsTypePluralizedDisplayName = v15->_sportsTypePluralizedDisplayName;
    v15->_sportsTypePluralizedDisplayName = (NSString *)v331;

    v15->_sportsLeagueType = [(FCSportsData *)v308 sportsLeagueType];
  }
  v333 = [v8 sportsTheme];
  uint64_t v334 = [v333 length];

  if (v334)
  {
    v335 = (void *)MEMORY[0x1E4F1C9E8];
    v336 = [v8 sportsTheme];
    v337 = objc_msgSend(v335, "fc_dictionaryFromJSON:", v336);

    id v338 = v337;
    v339 = [v338 objectForKeyedSubscript:@"primaryColor"];
    uint64_t v340 = +[FCColor nullableColorWithHexString:v339];
    sportsPrimaryColor = v15->_sportsPrimaryColor;
    v15->_sportsPrimaryColor = (FCColor *)v340;

    v342 = [v338 objectForKeyedSubscript:@"secondaryColor"];
    uint64_t v343 = +[FCColor nullableColorWithHexString:v342];
    sportsSecondaryColor = v15->_sportsSecondaryColor;
    v15->_sportsSecondaryColor = (FCColor *)v343;

    v345 = [v338 objectForKeyedSubscript:@"sportsEventNavigationForegroundColor"];
    uint64_t v346 = +[FCColor nullableColorWithHexString:v345];
    sportsEventNavigationForegroundColor = v15->_sportsEventNavigationForegroundColor;
    v15->_sportsEventNavigationForegroundColor = (FCColor *)v346;

    v348 = [v338 objectForKeyedSubscript:@"sportsLogoMastheadHorizontalPaddingOffset"];
    v15->_sportsLogoMastheadHorizontalPaddingOffset = [v348 integerValue];
    v349 = [v338 objectForKeyedSubscript:@"sportsLogoMastheadLeadingOffset"];
    v15->_sportsLogoMastheadLeadingOffset = [v349 integerValue];
    v350 = [v338 objectForKeyedSubscript:@"sportsLogoMastheadVisibility"];

    v15->_sportsLogoMastheadVisibility = (unint64_t)FCMastheadLogoVisibilityFromString(v350);
  }
  uint64_t v351 = [v8 publisherSpecifiedArticleIDs];
  publisherSpecifiedArticleIDs = v15->_publisherSpecifiedArticleIDs;
  v15->_publisherSpecifiedArticleIDs = (NSArray *)v351;

  v353 = *(void **)(v22 + 2504);
  v354 = [v8 publisherSpecifiedArticleIDsModifiedDate];
  uint64_t v355 = [v353 dateWithPBDate:v354];
  publisherSpecifiedArticleIDsModifiedDate = v15->_publisherSpecifiedArticleIDsModifiedDate;
  v15->_publisherSpecifiedArticleIDsModifiedDate = (NSDate *)v355;

  if ([v8 hasPublisherSpecifiedArticlesJson])
  {
    v406 = v9;
    v357 = (void *)MEMORY[0x1E4F1C9E8];
    id obja = v8;
    v358 = [v8 publisherSpecifiedArticlesJson];
    v359 = objc_msgSend(v357, "fc_dictionaryFromJSON:", v358);

    id v410 = v359;
    v360 = [v359 objectForKeyedSubscript:@"articles"];
    id v361 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v419 = 0u;
    long long v420 = 0u;
    long long v421 = 0u;
    long long v422 = 0u;
    id v362 = v360;
    uint64_t v363 = [v362 countByEnumeratingWithState:&v419 objects:buf count:16];
    if (v363)
    {
      uint64_t v364 = v363;
      uint64_t v365 = *(void *)v420;
      do
      {
        for (uint64_t i = 0; i != v364; ++i)
        {
          if (*(void *)v420 != v365) {
            objc_enumerationMutation(v362);
          }
          v367 = [[FCPublisherSpecifiedArticle alloc] initWithDictionary:*(void *)(*((void *)&v419 + 1) + 8 * i)];
          v368 = [(FCPublisherSpecifiedArticle *)v367 articleID];
          uint64_t v369 = [v368 length];

          if (v369)
          {
            v370 = [(FCPublisherSpecifiedArticle *)v367 articleID];
            [v361 setObject:v367 forKeyedSubscript:v370];
          }
        }
        uint64_t v364 = [v362 countByEnumeratingWithState:&v419 objects:buf count:16];
      }
      while (v364);
    }

    if ([v361 count]) {
      v371 = v361;
    }
    else {
      v371 = 0;
    }
    objc_storeStrong((id *)&v15->_publisherSpecifiedArticles, v371);

    id v8 = obja;
    v9 = v406;
  }
  v372 = [v8 paidBundlePaywallConfigurationJson];
  uint64_t v373 = [v372 length];

  if (v373)
  {
    v374 = (void *)MEMORY[0x1E4F1C9E8];
    v375 = [v8 paidBundlePaywallConfigurationJson];
    v376 = objc_msgSend(v374, "fc_dictionaryFromJSON:", v375);

    paidBundlePaywallConfiguration = [v376 allKeys];
    if ([paidBundlePaywallConfiguration count])
    {
      v378 = [v376 allKeys];
      int v379 = [v378 containsObject:@"subscriptionButton"];

      if (!v379)
      {
LABEL_72:

        goto LABEL_73;
      }
      v380 = [[FCPaywallConfiguration alloc] initWithConfigDictionary:v376];
      paidBundlePaywallConfiguration = v15->_paidBundlePaywallConfiguration;
      v15->_paidBundlePaywallConfiguration = v380;
    }

    goto LABEL_72;
  }
LABEL_73:
  v381 = [(FCTag *)v15 sportsRecommendationMappingsJSON];
  uint64_t v382 = [v381 length];

  if (v382)
  {
    v383 = [(FCTag *)v15 sportsRecommendationMappingsJSON];
    if (v383)
    {
      id v417 = 0;
      v384 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v383 options:0 error:&v417];
      id v385 = v417;
      if (v385)
      {
        v386 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v385;
          _os_log_error_impl(&dword_1A460D000, v386, OS_LOG_TYPE_ERROR, "failed to parse sports recommendation JSON with error: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v387 = [[FCSportsRecommendationMappings alloc] initWithDictionary:v384];
        sportsRecommendationMappings = v15->_sportsRecommendationMappings;
        v15->_sportsRecommendationMappings = v387;
      }
    }
  }
  uint64_t v389 = FCTagAdjustName(v15->_name, v15->_isMySports);
  name = v15->_name;
  v15->_name = (NSString *)v389;

  uint64_t v391 = FCTagAdjustName(v15->_nameCompact, v15->_isMySports);
  v392 = v15->_nameCompact;
  v15->_nameCompact = (NSString *)v391;

LABEL_82:

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)purchaseOfferableConfigurationsFromProtobufList:(void *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [FCPurchaseOfferableConfiguration alloc];
        v9 = [v7 purchaseId];
        uint64_t v10 = -[FCPurchaseOfferableConfiguration initWithPurchaseID:allowsPublisherPhoneApp:allowsPublisherPadApp:allowsPublisherWebsite:preferredOffer:](v8, "initWithPurchaseID:allowsPublisherPhoneApp:allowsPublisherPadApp:allowsPublisherWebsite:preferredOffer:", v9, [v7 allowsPublisherPhoneApp], objc_msgSend(v7, "allowsPublisherPadApp"), objc_msgSend(v7, "allowsPublisherWebSite"), objc_msgSend(v7, "preferredOffer"));

        [v2 addObject:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = (void *)[v2 copy];
  return v11;
}

- (FCTag)initWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != 0");
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[FCTag initWithTagType:identifier:name:]";
    __int16 v20 = 2080;
    v21 = "FCTag.m";
    __int16 v22 = 1024;
    int v23 = 323;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v17.receiver = self;
  v17.super_class = (Class)FCTag;
  uint64_t v10 = [(FCTag *)&v17 init];
  if (v10)
  {
    if ([v8 length])
    {
      v10->_tagType = a3;
      uint64_t v11 = [v8 copy];
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v11;

      uint64_t v13 = [v9 copy];
      name = (FCTag *)v10->_name;
      v10->_name = (NSString *)v13;
    }
    else
    {
      name = v10;
      uint64_t v10 = 0;
    }
  }
  return v10;
}

- (NSData)sportsRecommendationMappingsJSON
{
  v2 = [(FCTag *)self tagRecord];
  uint64_t v3 = [v2 sportsRecommendationMappingsJson];
  uint64_t v4 = objc_msgSend(v3, "fc_gzipInflate");

  return (NSData *)v4;
}

- (NTPBTagRecord)tagRecord
{
  return self->_tagRecord;
}

- (FCColor)feedControlColor
{
  if (self) {
    feedControlColorHexString = self->_feedControlColorHexString;
  }
  else {
    feedControlColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, feedControlColorHexString);
}

- (FCColor)feedBackgroundColor
{
  if (self) {
    feedBackgroundColorHexString = self->_feedBackgroundColorHexString;
  }
  else {
    feedBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, feedBackgroundColorHexString);
}

- (FCTagBanner)bannerImageForThemeBackground
{
  uint64_t v3 = [(FCTag *)self nameImageForDarkBackgroundAssetHandle];

  if (v3)
  {
    uint64_t v4 = self->_bannerImageForThemeBackground;
  }
  else
  {
    uint64_t v5 = [(FCTag *)self nameImageAssetHandle];

    if (v5)
    {
      uint64_t v4 = [(FCTag *)self bannerImageForWhiteBackground];
    }
    else
    {
      v6 = [(FCTag *)self nameImageMaskAssetHandle];

      if (v6)
      {
        uint64_t v4 = [(FCTag *)self bannerImageForMask];
      }
      else
      {
        v7 = [(FCTag *)self nameImageCompactAssetHandle];

        if (v7)
        {
          uint64_t v4 = [(FCTag *)self compactBannerImage];
        }
        else
        {
          uint64_t v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCTagBanner)bannerImageForWhiteBackground
{
  uint64_t v3 = [(FCTag *)self nameImageAssetHandle];

  if (v3)
  {
    uint64_t v4 = self->_bannerImageForWhiteBackground;
  }
  else
  {
    uint64_t v5 = [(FCTag *)self nameImageForDarkBackgroundAssetHandle];

    if (v5)
    {
      uint64_t v4 = [(FCTag *)self bannerImageForThemeBackground];
    }
    else
    {
      v6 = [(FCTag *)self nameImageMaskAssetHandle];

      if (v6)
      {
        uint64_t v4 = [(FCTag *)self bannerImageForMask];
      }
      else
      {
        v7 = [(FCTag *)self nameImageCompactAssetHandle];

        if (v7)
        {
          uint64_t v4 = [(FCTag *)self compactBannerImage];
        }
        else
        {
          uint64_t v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCAssetHandle)nameImageAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle
{
  return self->_nameImageForDarkBackgroundAssetHandle;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPurchaseSetup
{
  v2 = [(FCTag *)self publisherPaidOfferableConfigurations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)publisherPaidOfferableConfigurations
{
  return self->_publisherPaidOfferableConfigurations;
}

- (id)_FCColorFromHexTriplet:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      a1 = +[FCColor nullableColorWithHexString:v4];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (FCTagBanner)bannerImageForMask
{
  id v3 = [(FCTag *)self nameImageMaskAssetHandle];

  if (v3)
  {
    uint64_t v4 = self->_bannerImageForMask;
  }
  else
  {
    uint64_t v5 = [(FCTag *)self nameImageForDarkBackgroundAssetHandle];

    if (v5)
    {
      uint64_t v4 = [(FCTag *)self bannerImageForThemeBackground];
    }
    else
    {
      v6 = [(FCTag *)self nameImageAssetHandle];

      if (v6)
      {
        uint64_t v4 = [(FCTag *)self bannerImageForWhiteBackground];
      }
      else
      {
        v7 = [(FCTag *)self nameImageCompactAssetHandle];

        if (v7)
        {
          uint64_t v4 = [(FCTag *)self compactBannerImage];
        }
        else
        {
          uint64_t v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCAssetHandle)nameImageMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (FCColor)foregroundColor
{
  if (self) {
    foregroundColorHexString = self->_foregroundColorHexString;
  }
  else {
    foregroundColorHexString = 0;
  }
  id v3 = foregroundColorHexString;
  if ([(NSString *)v3 length])
  {
    uint64_t v4 = +[FCColor nullableColorWithHexString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)backgroundColor
{
  if (self) {
    backgroundColorHexString = self->_backgroundColorHexString;
  }
  else {
    backgroundColorHexString = 0;
  }
  id v3 = backgroundColorHexString;
  if ([(NSString *)v3 length])
  {
    uint64_t v4 = +[FCColor nullableColorWithHexString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (FCColor *)v4;
}

- (NSArray)currentIssueIDs
{
  return self->_currentIssueIDs;
}

- (FCContentManifest)contentManifest
{
  v2 = [(FCTag *)self tagRecord];
  id v3 = [v2 base];
  uint64_t v4 = [v3 contentManifest];

  return (FCContentManifest *)v4;
}

- (FCTag)initWithTagMetadata:(id)a3 assetManager:(id)a4 isSports:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v78.receiver = self;
  v78.super_class = (Class)FCTag;
  uint64_t v10 = [(FCTag *)&v78 init];
  if (v10)
  {
    uint64_t v11 = [v8 name];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v8 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;

    v10->_tagType = [v8 tagType];
    v10->_isSports = a5;
    uint64_t v15 = [v8 sportsPrimaryName];
    sportsPrimaryName = v10->_sportsPrimaryName;
    v10->_sportsPrimaryName = (NSString *)v15;

    uint64_t v17 = [v8 sportsSecondaryName];
    sportsSecondaryName = v10->_sportsSecondaryName;
    v10->_sportsSecondaryName = (NSString *)v17;

    uint64_t v19 = [v8 sportsSecondaryShortName];
    sportsSecondaryShortName = v10->_sportsSecondaryShortName;
    v10->_sportsSecondaryShortName = (NSString *)v19;

    uint64_t v21 = [v8 sportsFullName];
    sportsFullName = v10->_sportsFullName;
    v10->_sportsFullName = (NSString *)v21;

    v10->_sportsLeagueType = [v8 sportsLeagueType];
    int v23 = [v8 sportsPrimaryColor];
    uint64_t v24 = +[FCColor nullableColorWithHexString:v23];
    sportsPrimaryColor = v10->_sportsPrimaryColor;
    v10->_sportsPrimaryColor = (FCColor *)v24;

    int v26 = [v8 isAthlete];
    uint64_t v27 = 4;
    if (!v26) {
      uint64_t v27 = 0;
    }
    v10->_sportsType = v27;
    v10->_isLocal = [v8 isLocalNews];
    uint64_t v28 = [v8 groupTitleColor];
    groupTitleColorHexString = v10->_groupTitleColorHexString;
    v10->_groupTitleColorHexString = (NSString *)v28;

    v30 = [v8 nameImageMetadata];
    v31 = v30;
    if (v30)
    {
      v32 = [v30 dataUsingEncoding:4];
      uint64_t v33 = v32;
      if (v32)
      {
        v34 = (_WORD *)[v32 bytes];
        LOWORD(v35) = *v34;
        CGFloat v36 = (double)v35;
        LOWORD(v37) = v34[1];
        CGFloat v38 = (double)v37;
        v10->_nameImageSize.width = v36;
        v10->_nameImageSize.height = v38;
        LOWORD(v36) = v34[2];
        double v39 = (double)*(unint64_t *)&v36;
        LOWORD(v38) = v34[5];
        double v40 = (double)*(unint64_t *)&v38;
        LOWORD(v41) = v34[4];
        double v42 = (double)v41;
        LOWORD(v43) = v34[3];
        double v44 = (double)v43;
        v10->_nameImageInsets.top = v39;
        v10->_nameImageInsets.left = v40;
        v10->_nameImageInsets.bottom = v42;
        v10->_nameImageInsets.right = v44;
        LOWORD(v39) = v34[6];
        LOWORD(v40) = v34[7];
        LOWORD(v42) = v34[8];
        LOWORD(v44) = v34[11];
        LOWORD(v45) = v34[10];
        LOWORD(v46) = v34[9];
        v10->_nameImageForDarkBackgroundSize.width = (double)*(unint64_t *)&v39;
        v10->_nameImageForDarkBackgroundSize.height = (double)*(unint64_t *)&v40;
        double v47 = (double)*(unint64_t *)&v42;
        double v48 = (double)*(unint64_t *)&v44;
        *(double *)&unint64_t v49 = (double)v45;
        *(double *)&unint64_t v50 = (double)v46;
        v10->_nameImageForDarkBackgroundInsets.top = v47;
        v10->_nameImageForDarkBackgroundInsets.left = v48;
        v10->_nameImageForDarkBackgroundInsets.bottom = (double)v45;
        v10->_nameImageForDarkBackgroundInsets.right = (double)v46;
        LOWORD(v47) = v34[12];
        CGFloat v51 = (double)*(unint64_t *)&v47;
        LOWORD(v48) = v34[13];
        CGFloat v52 = (double)*(unint64_t *)&v48;
        v10->_nameImageMaskSize.width = v51;
        v10->_nameImageMaskSize.height = v52;
        LOWORD(v51) = v34[14];
        LOWORD(v52) = v34[17];
        LOWORD(v49) = v34[16];
        LOWORD(v50) = v34[15];
        v10->_nameImageMaskInsets.top = (double)*(unint64_t *)&v51;
        v10->_nameImageMaskInsets.left = (double)*(unint64_t *)&v52;
        v10->_nameImageMaskInsets.bottom = (double)v49;
        v10->_nameImageMaskInsets.right = (double)v50;
      }
    }
    v53 = [v8 nameImage];
    if (v53)
    {
      uint64_t v54 = [v9 assetHandleForCKAssetURLString:v53 lifetimeHint:0];
      nameImageAssetHandle = v10->_nameImageAssetHandle;
      v10->_nameImageAssetHandle = (FCAssetHandle *)v54;

      v56 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageAssetHandle, v10->_nameImageSize.width, v10->_nameImageSize.height, v10->_nameImageInsets.top, v10->_nameImageInsets.left, v10->_nameImageInsets.bottom, v10->_nameImageInsets.right);
      bannerImageForWhiteBackground = v10->_bannerImageForWhiteBackground;
      v10->_bannerImageForWhiteBackground = v56;
    }
    v58 = [v8 coverImage];
    if (v58)
    {
      uint64_t v59 = [v9 assetHandleForCKAssetURLString:v58 lifetimeHint:0];
      coverImageAssetHandle = v10->_coverImageAssetHandle;
      v10->_coverImageAssetHandle = (FCAssetHandle *)v59;
    }
    uint64_t v61 = [v8 feedNavImage];
    if (v61)
    {
      uint64_t v62 = [v9 assetHandleForCKAssetURLString:v61 lifetimeHint:0];
      feedNavImageAssetHandle = v10->_feedNavImageAssetHandle;
      v10->_feedNavImageAssetHandle = (FCAssetHandle *)v62;
    }
    v64 = [v8 nameImageForDarkBackground];
    if (v64)
    {
      uint64_t v65 = [v9 assetHandleForCKAssetURLString:v64 lifetimeHint:0];
      nameImageForDarkBackgroundAssetHandle = v10->_nameImageForDarkBackgroundAssetHandle;
      v10->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v65;

      uint64_t v67 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageForDarkBackgroundAssetHandle, v10->_nameImageForDarkBackgroundSize.width, v10->_nameImageForDarkBackgroundSize.height, v10->_nameImageForDarkBackgroundInsets.top, v10->_nameImageForDarkBackgroundInsets.left, v10->_nameImageForDarkBackgroundInsets.bottom, v10->_nameImageForDarkBackgroundInsets.right);
      bannerImageForThemeBackground = v10->_bannerImageForThemeBackground;
      v10->_bannerImageForThemeBackground = v67;
    }
    double v69 = [v8 nameImageMask];
    if (v69)
    {
      uint64_t v70 = [v9 assetHandleForCKAssetURLString:v69 lifetimeHint:0];
      nameImageMaskAssetHandle = v10->_nameImageMaskAssetHandle;
      v10->_nameImageMaskAssetHandle = (FCAssetHandle *)v70;

      uint64_t v72 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageMaskAssetHandle, v10->_nameImageMaskSize.width, v10->_nameImageMaskSize.height, v10->_nameImageMaskInsets.top, v10->_nameImageMaskInsets.left, v10->_nameImageMaskInsets.bottom, v10->_nameImageMaskInsets.right);
      bannerImageForMask = v10->_bannerImageForMask;
      v10->_bannerImageForMask = v72;
    }
    uint64_t v74 = [v8 sportsLogoImageCompact];
    if (v74)
    {
      uint64_t v75 = [v9 assetHandleForCKAssetURLString:v74 lifetimeHint:0];
      sportsLogoImageCompactAssetHandle = v10->_sportsLogoImageCompactAssetHandle;
      v10->_sportsLogoImageCompactAssetHandle = (FCAssetHandle *)v75;
    }
  }

  return v10;
}

- (FCTag)initWithData:(id)a3 context:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F82BE8];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithData:v8];

  uint64_t v10 = [FCTag alloc];
  uint64_t v11 = [v7 assetManager];

  uint64_t v12 = [(FCTag *)v10 initWithTagRecord:v9 assetManager:v11 interestToken:0];
  return v12;
}

- (unint64_t)userFacingTagType
{
  unint64_t result = self->_userFacingTagTypeOverride;
  if (!result)
  {
    unint64_t result = [(FCTag *)self tagType];
    if (result != 2) {
      return result == 1;
    }
  }
  return result;
}

- (NSArray)loadableFonts
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(FCTag *)self headlineTitleTextInfo];
  uint64_t v5 = [v4 font];

  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(FCTag *)self headlineExcerptTextInfo];
  id v7 = [v6 font];

  if (v7) {
    [v3 addObject:v7];
  }
  id v8 = [(FCTag *)self headlineBylineTextInfo];
  id v9 = [v8 font];

  if (v9) {
    [v3 addObject:v9];
  }

  return (NSArray *)v3;
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
    uint64_t v5 = [(FCTag *)self primaryAudience];
    char v4 = [v5 isEqualToString:@"MATURE"];
  }
  return v4;
}

- (NSString)description
{
  id v3 = +[FCDescription descriptionWithObject:self];
  char v4 = [(FCTag *)self name];
  [v3 addField:@"name" value:v4];

  uint64_t v5 = [(FCTag *)self identifier];
  [v3 addField:@"ID" value:v5];

  v6 = [v3 descriptionString];

  return (NSString *)v6;
}

- (NSData)data
{
  v2 = [(FCTag *)self tagRecord];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (NSString)groupName
{
  id v3 = objc_opt_new();
  char v4 = [(FCTag *)self titleDisplayPrefix];

  if (v4)
  {
    uint64_t v5 = [(FCTag *)self titleDisplayPrefix];
    [v3 appendString:v5];
  }
  if (self->_name) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = [(FCTag *)self titleDisplaySuffix];

  if (v6)
  {
    id v7 = [(FCTag *)self titleDisplaySuffix];
    [v3 appendString:v7];
  }
  id v8 = (void *)[v3 copy];

  return (NSString *)v8;
}

- (NSString)displayName
{
  id v3 = [(FCTag *)self asSports];
  char v4 = v3;
  if (v3 && (unint64_t v5 = [v3 sportsType], v5 <= 0xB))
  {
    if (((1 << v5) & 0xFDB) != 0) {
      [v4 sportsFullName];
    }
    else {
    v6 = [v4 sportsPrimaryName];
    }
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(FCTag *)self name];
    }
    id v9 = v8;
  }
  else
  {
    id v9 = [(FCTag *)self name];
  }

  return (NSString *)v9;
}

- (NSString)compactDisplayName
{
  id v3 = [(FCTag *)self asSports];
  char v4 = v3;
  if (v3
    && ([v3 sportsSecondaryShortName],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [NSString alloc];
    id v7 = FCBundle();
    id v8 = [v7 localizedStringForKey:@"%@ (%@)" value:&stru_1EF8299B8 table:0];
    id v9 = -[FCTag mainCompactDisplayName](self);
    uint64_t v10 = [v4 sportsSecondaryShortName];
    uint64_t v11 = objc_msgSend(v6, "initWithFormat:", v8, v9, v10);
  }
  else
  {
    uint64_t v11 = -[FCTag mainCompactDisplayName](self);
  }

  return (NSString *)v11;
}

- (id)mainCompactDisplayName
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 nameCompact];
    if (v2
      && (id v3 = (void *)v2,
          [v1 nameCompact],
          char v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = [v4 isEqualToString:&stru_1EF8299B8],
          v4,
          v3,
          (v5 & 1) == 0))
    {
      id v1 = [v1 nameCompact];
    }
    else
    {
      id v6 = [v1 asSports];
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 sportsPrimaryName];
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [v1 displayName];
        }
        id v1 = v10;
      }
      else
      {
        id v1 = [v1 displayName];
      }
    }
  }
  return v1;
}

id __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [v5 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = [v5 objectForKeyedSubscript:v6];
    [v8 setObject:v10 forKeyedSubscript:@"fontName"];
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v7];

  if (v11)
  {
    uint64_t v12 = [v5 objectForKeyedSubscript:v7];
    [v8 setObject:v12 forKeyedSubscript:@"fontResourceID"];
  }
  uint64_t v13 = (void *)[v8 copy];

  return v13;
}

FCContentColorMap *__61__FCTag__inflateFromJSONDictionary_withVersion_URLGenerator___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 32) count])
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v28;
      id v5 = @"light";
      id v6 = @"dark";
      id v7 = off_1E5B4A000;
      do
      {
        uint64_t v8 = 0;
        uint64_t v25 = v3;
        do
        {
          if (*(void *)v28 != v4) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
          id v10 = [v9 objectForKeyedSubscript:v5];
          uint64_t v11 = [v9 objectForKeyedSubscript:v6];
          uint64_t v12 = [(__objc2_class *)v7[93] nullableColorWithHexString:v10];
          uint64_t v13 = [(__objc2_class *)v7[93] nullableColorWithHexString:v11];
          long long v14 = (void *)v13;
          if (v12) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            long long v16 = v7;
            uint64_t v17 = v6;
            uint64_t v18 = v5;
            uint64_t v19 = v4;
            __int16 v20 = [[FCContentColorPair alloc] initWithLightColor:v12 darkColor:v13];
            [v24 addObject:v20];

            uint64_t v4 = v19;
            id v5 = v18;
            id v6 = v17;
            id v7 = v16;
            uint64_t v3 = v25;
          }

          ++v8;
        }
        while (v3 != v8);
        uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v3);
    }

    uint64_t v21 = [[FCContentColorMap alloc] initWithColors:v24];
  }
  else
  {
    __int16 v22 = [FCContentColorMap alloc];
    uint64_t v21 = [(FCContentColorMap *)v22 initWithColors:MEMORY[0x1E4F1CBF0]];
  }
  return v21;
}

- (id)initForTestingWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5 umcCanonicalID:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self)
  {
    if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != 0");
      *(_DWORD *)uint64_t v21 = 136315906;
      *(void *)&v21[4] = "-[FCTag initWithTagType:identifier:name:umcCanonicalID:]";
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "FCTag.m";
      __int16 v22 = 1024;
      int v23 = 344;
      __int16 v24 = 2114;
      uint64_t v25 = v20;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);
    }
    *(void *)uint64_t v21 = self;
    *(void *)&v21[8] = FCTag;
    self = (FCTag *)objc_msgSendSuper2((objc_super *)v21, sel_init);
    if (self)
    {
      if ([v10 length])
      {
        self->_tagType = a3;
        uint64_t v13 = (NSString *)[v10 copy];
        identifier = self->_identifier;
        self->_identifier = v13;

        BOOL v15 = (NSString *)[v11 copy];
        name = self->_name;
        self->_name = v15;

        uint64_t v17 = (NSString *)[v12 copy];
        UMCCanonicalID = self->_UMCCanonicalID;
        self->_UMCCanonicalID = v17;

        self->_isSports = 1;
      }
      else
      {

        self = 0;
      }
    }
  }

  return self;
}

- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 defaultSection:(id)a5 publisherAuthorizationURL:(id)a6 publisherVerificationURL:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![v12 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[FCTag initChannelForTestingWithIdentifier:name:defaultSection:publisherAuthorizationURL:publisherVerificationURL:]";
    __int16 v33 = 2080;
    v34 = "FCTag.m";
    __int16 v35 = 1024;
    int v36 = 1058;
    __int16 v37 = 2114;
    CGFloat v38 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v30.receiver = self;
  v30.super_class = (Class)FCTag;
  uint64_t v17 = [(FCTag *)&v30 init];
  if (v17)
  {
    if ([v12 length])
    {
      v17->_tagType = 2;
      uint64_t v18 = [v12 copy];
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)v18;

      uint64_t v20 = [v13 copy];
      name = v17->_name;
      v17->_name = (NSString *)v20;

      uint64_t v22 = [v14 copy];
      defaultSectionID = v17->_defaultSectionID;
      v17->_defaultSectionID = (NSString *)v22;

      uint64_t v24 = [v15 copy];
      publisherPaidAuthorizationURL = v17->_publisherPaidAuthorizationURL;
      v17->_publisherPaidAuthorizationURL = (NSString *)v24;

      uint64_t v26 = [v16 copy];
      publisherPaidVerificationURL = (FCTag *)v17->_publisherPaidVerificationURL;
      v17->_publisherPaidVerificationURL = (NSString *)v26;
    }
    else
    {
      publisherPaidVerificationURL = v17;
      uint64_t v17 = 0;
    }
  }
  return v17;
}

- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 publisherPaidBundlePurchaseIDs:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = "-[FCTag initChannelForTestingWithIdentifier:name:publisherPaidBundlePurchaseIDs:]";
    __int16 v23 = 2080;
    uint64_t v24 = "FCTag.m";
    __int16 v25 = 1024;
    int v26 = 1084;
    __int16 v27 = 2114;
    long long v28 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v20.receiver = self;
  v20.super_class = (Class)FCTag;
  id v11 = [(FCTag *)&v20 init];
  if (v11)
  {
    if ([v8 length])
    {
      v11->_tagType = 2;
      uint64_t v12 = [v8 copy];
      identifier = v11->_identifier;
      v11->_identifier = (NSString *)v12;

      uint64_t v14 = [v9 copy];
      name = v11->_name;
      v11->_name = (NSString *)v14;

      uint64_t v16 = [v10 copy];
      publisherPaidBundlePurchaseIDs = v11->_publisherPaidBundlePurchaseIDs;
      v11->_publisherPaidBundlePurchaseIDs = (NSArray *)v16;
    }
    else
    {
      publisherPaidBundlePurchaseIDs = v11;
      id v11 = 0;
    }
  }
  return v11;
}

- (id)initChannelFromNotificationWithIdentifier:(id)a3 name:(id)a4 nameImageAssetHandle:(id)a5 nameImageMaskAssetHandle:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 length] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    objc_super v30 = "-[FCTag initChannelFromNotificationWithIdentifier:name:nameImageAssetHandle:nameImageMaskAssetHandle:]";
    __int16 v31 = 2080;
    uint64_t v32 = "FCTag.m";
    __int16 v33 = 1024;
    int v34 = 1109;
    __int16 v35 = 2114;
    int v36 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v28.receiver = self;
  v28.super_class = (Class)FCTag;
  uint64_t v14 = [(FCTag *)&v28 init];
  if (v14)
  {
    if ([v10 length])
    {
      v14->_tagType = 2;
      uint64_t v15 = [v10 copy];
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      uint64_t v17 = [v11 copy];
      name = v14->_name;
      v14->_name = (NSString *)v17;

      objc_storeStrong((id *)&v14->_nameImageAssetHandle, a5);
      uint64_t v19 = [FCTagBanner alloc];
      double v20 = *MEMORY[0x1E4F1DB30];
      double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v22 = -[FCTagBanner initWithAssetHandle:size:insets:](v19, "initWithAssetHandle:size:insets:", v12, *MEMORY[0x1E4F1DB30], v21, 0.0, 0.0, 0.0, 0.0);
      bannerImageForWhiteBackground = v14->_bannerImageForWhiteBackground;
      v14->_bannerImageForWhiteBackground = (FCTagBanner *)v22;

      uint64_t v24 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v13, v20, v21, 0.0, 0.0, 0.0, 0.0);
      bannerImageForMask = v14->_bannerImageForMask;
      v14->_bannerImageForMask = v24;
    }
    else
    {
      bannerImageForMask = v14;
      uint64_t v14 = 0;
    }
  }
  return v14;
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
    id v7 = [(FCTag *)self identifier];
    id v8 = [v6 identifier];
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
  uint64_t v2 = [(FCTag *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (FCContentArchive)contentArchive
{
  uint64_t v2 = [(FCTag *)self tagRecord];
  unint64_t v3 = +[FCContentArchive archiveWithRecord:v2];

  return (FCContentArchive *)v3;
}

- (FCSportsEventProviding)asSportsEvent
{
  if ([(FCTag *)self isSportsEvent]) {
    unint64_t v3 = self;
  }
  else {
    unint64_t v3 = 0;
  }
  return (FCSportsEventProviding *)v3;
}

- (FCPuzzleTypeProviding)asPuzzleType
{
  if ([(FCTag *)self isPuzzleType]) {
    unint64_t v3 = self;
  }
  else {
    unint64_t v3 = 0;
  }
  return (FCPuzzleTypeProviding *)v3;
}

- (BOOL)allowCustomBottomStyle
{
  return 0;
}

- (BOOL)isSubscribable
{
  if ([(FCTag *)self isDeprecated]) {
    return 0;
  }
  if ([(FCTag *)self tagType] != 1)
  {
    if ([(FCTag *)self tagType] == 2)
    {
      id v4 = [(FCTag *)self defaultSectionID];
      BOOL v3 = v4 != 0;

      return v3;
    }
    return 0;
  }
  return 1;
}

- (NSString)personalizedPaywallName
{
  if ([(FCTag *)self useCompactNameForPersonalizedPaywall])
  {
    BOOL v3 = [(FCTag *)self nameCompact];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(FCTag *)self name];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(FCTag *)self name];
  }
  return (NSString *)v6;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = FCCheckedDynamicCast(v5, (uint64_t)v4);

  id v7 = [(FCTag *)self versionKey];
  id v8 = [v6 versionKey];
  char v9 = [v7 isEqualToString:v8];

  return v9;
}

- (id)freeFeedIDForBin:(int64_t)a3
{
  id v5 = [(FCTag *)self pptFeedIDOverride];

  if (v5)
  {
    id v6 = [(FCTag *)self pptFeedIDOverride];
  }
  else
  {
    if (self) {
      feedConfiguration = self->_feedConfiguration;
    }
    else {
      feedConfiguration = 0;
    }
    id v8 = [(NTPBFeedConfiguration *)feedConfiguration feedIDForBin:a3 paid:0];
    char v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(FCTag *)self identifier];
    }
    id v6 = v10;
  }
  return v6;
}

- (id)paidFeedIDForBin:(int64_t)a3
{
  id v5 = [(FCTag *)self pptFeedIDOverride];

  if (v5)
  {
    id v6 = [(FCTag *)self pptFeedIDOverride];
  }
  else
  {
    if (self) {
      feedConfiguration = self->_feedConfiguration;
    }
    else {
      feedConfiguration = 0;
    }
    id v8 = [(NTPBFeedConfiguration *)feedConfiguration feedIDForBin:a3 paid:1];
    char v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(FCTag *)self freeFeedIDForBin:a3];
    }
    id v6 = v10;
  }
  return v6;
}

- (id)_feedConfigurationForSection:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__46;
    uint64_t v18 = __Block_byref_object_dispose__46;
    id v19 = 0;
    id v4 = [a1 sectionIDs];
    uint64_t v5 = [v4 count];
    id v6 = a1[130];
    uint64_t v7 = [v6 count];

    if (v5 == v7)
    {
      id v8 = [a1 sectionIDs];
      id v9 = a1[130];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __38__FCTag__feedConfigurationForSection___block_invoke;
      v11[3] = &unk_1E5B56CB0;
      id v12 = v3;
      id v13 = &v14;
      objc_msgSend(v8, "fc_enumerateSideBySideWithArray:reverse:block:", v9, 0, v11);
    }
    a1 = (id *)(id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  return a1;
}

void __38__FCTag__feedConfigurationForSection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)setTitleDisplayPrefixOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FCTag alloc];
  id v6 = [(FCTag *)self tagRecord];
  if (self)
  {
    uint64_t v7 = self->_assetManager;
    tagInterestToken = self->_tagInterestToken;
  }
  else
  {
    uint64_t v7 = 0;
    tagInterestToken = 0;
  }
  id v9 = [(FCTag *)v5 initWithTagRecord:v6 assetManager:v7 interestToken:tagInterestToken];

  [(FCTag *)v9 setTitleDisplayPrefix:v4];
  return v9;
}

- (id)setTitleDisplaySuffixOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FCTag alloc];
  id v6 = [(FCTag *)self tagRecord];
  if (self)
  {
    uint64_t v7 = self->_assetManager;
    tagInterestToken = self->_tagInterestToken;
  }
  else
  {
    uint64_t v7 = 0;
    tagInterestToken = 0;
  }
  id v9 = [(FCTag *)v5 initWithTagRecord:v6 assetManager:v7 interestToken:tagInterestToken];

  [(FCTag *)v9 setTitleDisplaySuffix:v4];
  return v9;
}

- (id)freeFeedIDForSection:(id)a3 bin:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = -[FCTag _feedConfigurationForSection:]((id *)&self->super.isa, v6);
  id v8 = [v7 feedIDForBin:a4 paid:0];

  if (!v8)
  {
    id v9 = [(FCTag *)self defaultSectionID];
    int v10 = [v6 isEqualToString:v9];

    if (v10)
    {
      id v8 = [(FCTag *)self freeFeedIDForBin:a4];
    }
    else
    {
      id v8 = 0;
    }
  }
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = v6;
  }
  id v12 = v11;

  return v12;
}

- (id)paidFeedIDForSection:(id)a3 bin:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = -[FCTag _feedConfigurationForSection:]((id *)&self->super.isa, v6);
  id v8 = [v7 feedIDForBin:a4 paid:1];

  if (!v8)
  {
    id v9 = [(FCTag *)self defaultSectionID];
    int v10 = [v6 isEqualToString:v9];

    if (!v10
      || ([(FCTag *)self paidFeedIDForBin:a4],
          (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v8 = [(FCTag *)self freeFeedIDForSection:v6 bin:a4];
    }
  }

  return v8;
}

- (BOOL)isNoLongerAvailable
{
  if (![(FCTag *)self isDeprecated]) {
    return 0;
  }
  id v3 = [(FCTag *)self replacementID];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)isAuthenticationSetup
{
  id v3 = [(FCTag *)self publisherPaidAuthorizationURL];
  BOOL v4 = objc_msgSend(v3, "fc_stringByTrimmingWhiteSpace");

  uint64_t v5 = [(FCTag *)self publisherPaidVerificationURL];
  id v6 = objc_msgSend(v5, "fc_stringByTrimmingWhiteSpace");

  if ([v4 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F29088]);
    id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    id v9 = (void *)[v7 initWithURL:v8 resolvingAgainstBaseURL:1];

    id v10 = objc_alloc(MEMORY[0x1E4F29088]);
    id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    id v12 = (void *)[v10 initWithURL:v11 resolvingAgainstBaseURL:1];

    id v13 = [v9 scheme];
    if (-[FCTag _isValidScheme:]((BOOL)self, v13))
    {
      uint64_t v14 = [v12 scheme];
      BOOL v15 = -[FCTag _isValidScheme:]((BOOL)self, v14);
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_isValidScheme:(BOOL)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 length];
    a1 = v5 == [@"https" length]
      && [v4 rangeOfString:@"https" options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return a1;
}

- (id)authorizationURL
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.stocks"];

  id v6 = NSString;
  uint64_t v7 = [(FCTag *)self identifier];
  id v8 = (void *)v7;
  id v9 = @"applenews://authentication_callback";
  if (v5) {
    id v9 = @"stocks://authentication_callback";
  }
  id v10 = [v6 stringWithFormat:@"%@/%@", v9, v7];

  id v11 = [(FCTag *)self publisherPaidAuthorizationURL];
  id v12 = objc_msgSend(v11, "fc_stringByTrimmingWhiteSpace");

  if ([v12 length])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F29088]);
    uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    BOOL v15 = (void *)[v13 initWithURL:v14 resolvingAgainstBaseURL:1];

    uint64_t v16 = [v15 scheme];
    BOOL v17 = -[FCTag _isValidScheme:]((BOOL)self, v16);

    if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v19 = [v18 objectForKey:*MEMORY[0x1E4F1C438]];

      double v20 = [MEMORY[0x1E4F1CA20] currentLocale];
      double v21 = [v20 objectForKey:*MEMORY[0x1E4F1C400]];

      uint64_t v22 = [v12 rangeOfString:@"redirect_uri"];
      __int16 v23 = (void *)MEMORY[0x1E4F1CB10];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
        [NSString stringWithFormat:@"%@?%@=%@&%@=%@&%@=%@", v12, @"redirect_uri", v10, @"country", v21, @"language", v19];
      }
      else {
      __int16 v25 = [NSString stringWithFormat:@"%@%@&%@=%@&%@=%@", v12, v10, @"country", v21, @"language", v19, v27];
      }
      uint64_t v24 = [v23 URLWithString:v25];
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)prefetchPurchaseOffer
{
  if ([(FCTag *)self isPurchaseSetup])
  {
    id v3 = [(FCTag *)self publisherPaidOfferableConfigurations];
    if ([v3 count] == 1)
    {
      id v4 = [v3 firstObject];
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      id v11 = __Block_byref_object_copy__46;
      id v12 = __Block_byref_object_dispose__46;
      id v13 = 0;
      int v5 = [(FCTag *)self publisherPaidOfferableConfigurations];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __30__FCTag_prefetchPurchaseOffer__block_invoke;
      v7[3] = &unk_1E5B56CD8;
      v7[4] = &v8;
      [v5 enumerateObjectsUsingBlock:v7];
      id v4 = (id)v9[5];

      _Block_object_dispose(&v8, 8);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __30__FCTag_prefetchPurchaseOffer__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 preferredOffer])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)articleRecirculationConfigJSON
{
  id v3 = [NSString alloc];
  id v4 = [(FCTag *)self tagRecord];
  int v5 = [v4 articleRecirculationConfiguration];
  id v6 = objc_msgSend(v5, "fc_gzipInflate");
  id v7 = (void *)[v3 initWithData:v6 encoding:4];

  return (NSString *)v7;
}

- (NSString)highlightsArticleListID
{
  uint64_t v2 = [(FCTag *)self tagRecord];
  id v3 = [v2 highlightsArticleListID];

  return (NSString *)v3;
}

- (NSString)stocksFeedConfigJSON
{
  uint64_t v2 = [(FCTag *)self tagRecord];
  id v3 = [v2 stocksFeedConfigurationJson];

  return (NSString *)v3;
}

- (int64_t)feedType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(FCTag *)self tagType];
  if (v2 < 6) {
    return qword_1A4973D70[v2];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
    int v5 = 136315906;
    id v6 = "-[FCTag feedType]";
    __int16 v7 = 2080;
    uint64_t v8 = "FCTag.m";
    __int16 v9 = 1024;
    int v10 = 1481;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return 0;
}

- (BOOL)isWhite
{
  id v3 = [(FCTag *)self backgroundColor];
  if (v3)
  {
    id v4 = [(FCTag *)self backgroundColor];
    int v5 = +[FCColor whiteColor];
    char v6 = [v4 isSimilarToColor:v5 withinPercentage:0.12];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isDark
{
  id v3 = [(FCTag *)self backgroundColor];
  [v3 red];
  double v5 = v4;
  char v6 = [(FCTag *)self backgroundColor];
  [v6 green];
  double v8 = v7 * 0.7152 + v5 * 0.2126;
  __int16 v9 = [(FCTag *)self backgroundColor];
  [v9 blue];
  double v11 = v8 + v10 * 0.0722;

  id v12 = [(FCTag *)self backgroundColor];
  BOOL v14 = v11 < 0.7 || v12 == 0;

  return v14;
}

- (FCTagBanner)defaultBannerImage
{
  if ([(FCTag *)self isWhite]) {
    [(FCTag *)self bannerImageForWhiteBackground];
  }
  else {
  id v3 = [(FCTag *)self bannerImageForThemeBackground];
  }
  return (FCTagBanner *)v3;
}

- (FCTagBanner)compactBannerImage
{
  id v3 = [(FCTag *)self nameImageCompactAssetHandle];

  if (v3)
  {
    double v4 = self->_compactBannerImage;
  }
  else
  {
    double v5 = [(FCTag *)self nameImageMaskAssetHandle];

    if (v5)
    {
      double v4 = [(FCTag *)self bannerImageForMask];
    }
    else
    {
      char v6 = [(FCTag *)self nameImageAssetHandle];

      if (v6)
      {
        double v4 = [(FCTag *)self bannerImageForWhiteBackground];
      }
      else
      {
        double v7 = [(FCTag *)self nameImageForDarkBackgroundAssetHandle];

        if (v7)
        {
          double v4 = [(FCTag *)self bannerImageForThemeBackground];
        }
        else
        {
          double v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCColor)darkStyleBackgroundColor
{
  if (self) {
    darkStyleBackgroundColorHexString = self->_darkStyleBackgroundColorHexString;
  }
  else {
    darkStyleBackgroundColorHexString = 0;
  }
  id v3 = darkStyleBackgroundColorHexString;
  if ([(NSString *)v3 length])
  {
    double v4 = +[FCColor nullableColorWithHexString:v3];
  }
  else
  {
    double v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)darkStyleForegroundColor
{
  if (self) {
    darkStyleForegroundColorHexString = self->_darkStyleForegroundColorHexString;
  }
  else {
    darkStyleForegroundColorHexString = 0;
  }
  id v3 = darkStyleForegroundColorHexString;
  if ([(NSString *)v3 length])
  {
    double v4 = +[FCColor nullableColorWithHexString:v3];
  }
  else
  {
    double v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)navigationChromeBackgroundColor
{
  if (self) {
    navigationChromeBackgroundColorHexString = self->_navigationChromeBackgroundColorHexString;
  }
  else {
    navigationChromeBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, navigationChromeBackgroundColorHexString);
}

- (FCColor)darkStyleNavigationChromeBackgroundColor
{
  if (self) {
    darkStyleNavigationChromeBackgroundColorHexString = self->_darkStyleNavigationChromeBackgroundColorHexString;
  }
  else {
    darkStyleNavigationChromeBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleNavigationChromeBackgroundColorHexString);
}

- (FCColor)navigationChromeSeparatorColor
{
  if (self) {
    navigationChromeSeparatorColorHexString = self->_navigationChromeSeparatorColorHexString;
  }
  else {
    navigationChromeSeparatorColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, navigationChromeSeparatorColorHexString);
}

- (FCColor)darkStyleNavigationChromeSeparatorColor
{
  if (self) {
    darkStyleNavigationChromeSeparatorColorHexString = self->_darkStyleNavigationChromeSeparatorColorHexString;
  }
  else {
    darkStyleNavigationChromeSeparatorColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleNavigationChromeSeparatorColorHexString);
}

- (FCColor)darkStyleFeedBackgroundColor
{
  if (self) {
    darkStyleFeedBackgroundColorHexString = self->_darkStyleFeedBackgroundColorHexString;
  }
  else {
    darkStyleFeedBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleFeedBackgroundColorHexString);
}

- (FCColor)darkStyleFeedControlColor
{
  if (self) {
    darkStyleFeedControlColorHexString = self->_darkStyleFeedControlColorHexString;
  }
  else {
    darkStyleFeedControlColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleFeedControlColorHexString);
}

- (FCColor)adBackgroundColor
{
  if (self) {
    adBackgroundColorHexString = self->_adBackgroundColorHexString;
  }
  else {
    adBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, adBackgroundColorHexString);
}

- (FCColor)darkStyleAdBackgroundColor
{
  if (self) {
    darkStyleAdBackgroundColorHexString = self->_darkStyleAdBackgroundColorHexString;
  }
  else {
    darkStyleAdBackgroundColorHexString = 0;
  }
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleAdBackgroundColorHexString);
}

- (FCColor)groupTitleColor
{
  if (self) {
    groupTitleColorHexString = self->_groupTitleColorHexString;
  }
  else {
    groupTitleColorHexString = 0;
  }
  double v4 = groupTitleColorHexString;
  if ([(NSString *)v4 length])
  {
    id v5 = +[FCColor colorWithHexString:v4];
  }
  else if ([(FCTag *)self tagType] == 2)
  {
    char v6 = [(FCTag *)self theme];
    double v7 = [v6 backgroundColor];

    double v8 = [(FCTag *)self theme];
    __int16 v9 = [v8 foregroundColor];

    if (v7)
    {
      double v10 = +[FCColor whiteColor];
      int v11 = [v7 isSimilarToColor:v10 withinPercentage:0.2];

      id v12 = v7;
      if (!v11) {
        goto LABEL_12;
      }
    }
    if (v9
      && (+[FCColor whiteColor],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v9 isSimilarToColor:v13 withinPercentage:0.2],
          v13,
          id v12 = v9,
          (v14 & 1) == 0))
    {
LABEL_12:
      id v5 = v12;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (FCColor *)v5;
}

- (FCColor)groupDarkStyleTitleColor
{
  if (self) {
    groupDarkStyleTitleColorHexString = self->_groupDarkStyleTitleColorHexString;
  }
  else {
    groupDarkStyleTitleColorHexString = 0;
  }
  double v4 = groupDarkStyleTitleColorHexString;
  if ([(NSString *)v4 length])
  {
    id v5 = +[FCColor colorWithHexString:v4];
  }
  else if ([(FCTag *)self tagType] == 2)
  {
    char v6 = [(FCTag *)self theme];
    double v7 = [v6 darkStyleBackgroundColor];

    double v8 = [(FCTag *)self theme];
    __int16 v9 = [v8 darkStyleForegroundColor];

    if (v7)
    {
      double v10 = +[FCColor blackColor];
      int v11 = [v7 isSimilarToColor:v10 withinPercentage:0.2];

      id v12 = v7;
      if (!v11) {
        goto LABEL_12;
      }
    }
    if (v9
      && (+[FCColor blackColor],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v9 isSimilarToColor:v13 withinPercentage:0.2],
          v13,
          id v12 = v9,
          (v14 & 1) == 0))
    {
LABEL_12:
      id v5 = v12;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (FCColor *)v5;
}

- (FCContentColorMap)contentColorMap
{
  if (self) {
    self = (FCTag *)self->_lazyContentColorMap;
  }
  return (FCContentColorMap *)[(FCTag *)self value];
}

- (NSData)backingTagRecordData
{
  unint64_t v2 = [(FCTag *)self tagRecord];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)isWhitelisted
{
  id v3 = [(FCTag *)self iAdCategories];
  double v4 = [(FCTag *)self identifier];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (unint64_t)channelType
{
  if ([(FCTag *)self isLocal]) {
    return 1;
  }
  if ([(FCTag *)self isMagazine]) {
    return 2;
  }
  double v4 = [(FCTag *)self currentIssueIDs];
  uint64_t v5 = [v4 count];
  char v6 = [(FCTag *)self recentIssueIDs];
  uint64_t v7 = [v6 count];

  if (v5 + v7) {
    return 2;
  }
  if ([(FCTag *)self isNewspaper]) {
    return 3;
  }
  if ([(FCTag *)self isMySports]) {
    return 4;
  }
  if ([(FCTag *)self isPuzzleHub]) {
    return 5;
  }
  return 0;
}

- (NSArray)sportsParentTagIdentifiers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCTag *)self topLevelGroupsTagIdentifiers];

  if (v3)
  {
    double v4 = [(FCTag *)self topLevelGroupsTagIdentifiers];
  }
  else
  {
    uint64_t v5 = [(FCTag *)self topLevelSportTagIdentifier];

    if (v5)
    {
      char v6 = [(FCTag *)self topLevelSportTagIdentifier];
      v8[0] = v6;
      double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      double v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return (NSArray *)v4;
}

- (NSString)versionKey
{
  return self->_versionKey;
}

- (NSString)nameCompact
{
  return self->_nameCompact;
}

- (int64_t)contentProvider
{
  return self->_contentProvider;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSString)replacementID
{
  return self->_replacementID;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (int64_t)score
{
  return self->_score;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)recentIssueIDs
{
  return self->_recentIssueIDs;
}

- (NSString)backIssuesListID
{
  return self->_backIssuesListID;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)magazineGenre
{
  return self->_magazineGenre;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (double)subscriptionRate
{
  return self->_subscriptionRate;
}

- (NSArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (void)setNameImageAssetHandle:(id)a3
{
}

- (CGSize)nameImageSize
{
  double width = self->_nameImageSize.width;
  double height = self->_nameImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNameImageSize:(CGSize)a3
{
  self->_nameImageSize = a3;
}

- (FCEdgeInsets)nameImageInsets
{
  double top = self->_nameImageInsets.top;
  double left = self->_nameImageInsets.left;
  double bottom = self->_nameImageInsets.bottom;
  double right = self->_nameImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return self->_nameImageCompactAssetHandle;
}

- (void)setBannerImageScale:(double)a3
{
  self->_bannerImageScale = a3;
}

- (void)setBannerImageBaselineOffsetPercentage:(double)a3
{
  self->_bannerImageBaselineOffsetPercentage = a3;
}

- (CGSize)nameImageForDarkBackgroundSize
{
  double width = self->_nameImageForDarkBackgroundSize.width;
  double height = self->_nameImageForDarkBackgroundSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (FCEdgeInsets)nameImageForDarkBackgroundInsets
{
  double top = self->_nameImageForDarkBackgroundInsets.top;
  double left = self->_nameImageForDarkBackgroundInsets.left;
  double bottom = self->_nameImageForDarkBackgroundInsets.bottom;
  double right = self->_nameImageForDarkBackgroundInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)nameImageMaskSize
{
  double width = self->_nameImageMaskSize.width;
  double height = self->_nameImageMaskSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (FCEdgeInsets)nameImageMaskInsets
{
  double top = self->_nameImageMaskInsets.top;
  double left = self->_nameImageMaskInsets.left;
  double bottom = self->_nameImageMaskInsets.bottom;
  double right = self->_nameImageMaskInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (FCAssetHandle)logoImageAssetHandle
{
  return self->_logoImageAssetHandle;
}

- (FCAssetHandle)feedNavImageHQAssetHandle
{
  return self->_feedNavImageHQAssetHandle;
}

- (FCAssetHandle)navigationChromeBackgroundImage
{
  return self->_navigationChromeBackgroundImage;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImage
{
  return self->_darkStyleNavigationChromeBackgroundImage;
}

- (FCAssetHandle)navigationChromeBackgroundImageCompact
{
  return self->_navigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageCompact
{
  return self->_darkStyleNavigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)navigationChromeBackgroundImageLarge
{
  return self->_navigationChromeBackgroundImageLarge;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageLarge
{
  return self->_darkStyleNavigationChromeBackgroundImageLarge;
}

- (FCColorGradient)navigationChromeBackgroundGradient
{
  return self->_navigationChromeBackgroundGradient;
}

- (FCColorGradient)darkStyleNavigationChromeBackgroundGradient
{
  return self->_darkStyleNavigationChromeBackgroundGradient;
}

- (FCTextInfo)headlineTitleTextInfo
{
  return self->_headlineTitleTextInfo;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return self->_headlineExcerptTextInfo;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return self->_headlineBylineTextInfo;
}

- (NSString)parentID
{
  return self->_parentID;
}

- (NSArray)sectionIDs
{
  return self->_sectionIDs;
}

- (NSString)defaultSectionID
{
  return self->_defaultSectionID;
}

- (NSString)publisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL;
}

- (NSString)publisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL;
}

- (NSString)publisherPaidWebAccessURL
{
  return self->_publisherPaidWebAccessURL;
}

- (NSArray)publisherPaidFeldsparablePurchaseIDs
{
  return self->_publisherPaidFeldsparablePurchaseIDs;
}

- (NSArray)publisherPaidBundlePurchaseIDs
{
  return self->_publisherPaidBundlePurchaseIDs;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return self->_publisherPaidLeakyPaywallOptOut;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return self->_publisherPaidWebAccessOptIn;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings;
}

- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle
{
  return self->_nameImageMaskWidgetLQAssetHandle;
}

- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle
{
  return self->_nameImageMaskWidgetHQAssetHandle;
}

- (FCAssetHandle)nameImageLargeAssetHandle
{
  return self->_nameImageLargeAssetHandle;
}

- (FCAssetHandle)nameImageLargeMaskAssetHandle
{
  return self->_nameImageLargeMaskAssetHandle;
}

- (unint64_t)groupingEligibility
{
  return self->_groupingEligibility;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isRealTimeTrackingEnabled
{
  return self->_isRealTimeTrackingEnabled;
}

- (BOOL)isArticleReadCountReportingEnabled
{
  return self->_isArticleReadCountReportingEnabled;
}

- (BOOL)isAutoDarkModeEnabled
{
  return self->_isAutoDarkModeEnabled;
}

- (BOOL)disableFollow
{
  return self->_disableFollow;
}

- (BOOL)disableBlock
{
  return self->_disableBlock;
}

- (BOOL)useCompactNameForPersonalizedPaywall
{
  return self->_useCompactNameForPersonalizedPaywall;
}

- (BOOL)sponsoredFeedEligible
{
  return self->_sponsoredFeedEligible;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)isSandbox
{
  return self->_isSandbox;
}

- (BOOL)isSensitiveTopic
{
  return self->_isSensitiveTopic;
}

- (BOOL)isPuzzleType
{
  return self->_isPuzzleType;
}

- (BOOL)hasEvergreenArticleList
{
  return self->_hasEvergreenArticleList;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (NSDate)publisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate;
}

- (NSDictionary)publisherSpecifiedArticles
{
  return self->_publisherSpecifiedArticles;
}

- (FCPaywallConfiguration)paidBundlePaywallConfiguration
{
  return self->_paidBundlePaywallConfiguration;
}

- (NSString)supergroupConfigJson
{
  return self->_supergroupConfigJson;
}

- (NSString)supergroupKnobsJson
{
  return self->_supergroupKnobsJson;
}

- (FCSectionSupergroupKnobs)supergroupKnobs
{
  return self->_supergroupKnobs;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)titleDisplayPrefix
{
  return self->_titleDisplayPrefix;
}

- (void)setTitleDisplayPrefix:(id)a3
{
}

- (NSString)titleDisplaySuffix
{
  return self->_titleDisplaySuffix;
}

- (void)setTitleDisplaySuffix:(id)a3
{
}

- (BOOL)isSportsRecommendable
{
  return self->_isSportsRecommendable;
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (FCAssetHandle)sportsLogoImageCompactAssetHandle
{
  return self->_sportsLogoImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoImageAssetHandle
{
  return self->_sportsLogoImageAssetHandle;
}

- (FCAssetHandle)sportsLogoImageLargeAssetHandle
{
  return self->_sportsLogoImageLargeAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle
{
  return self->_sportsLogoAltImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageAssetHandle
{
  return self->_sportsLogoAltImageAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle
{
  return self->_sportsLogoAltImageLargeAssetHandle;
}

- (NSString)UMCCanonicalID
{
  return self->_UMCCanonicalID;
}

- (NSString)sportsPrimaryName
{
  return self->_sportsPrimaryName;
}

- (NSString)sportsNameAbbreviation
{
  return self->_sportsNameAbbreviation;
}

- (NSString)sportsSecondaryName
{
  return self->_sportsSecondaryName;
}

- (NSString)sportsSecondaryShortName
{
  return self->_sportsSecondaryShortName;
}

- (NSString)sportsFullName
{
  return self->_sportsFullName;
}

- (NSString)sportsNickname
{
  return self->_sportsNickname;
}

- (NSString)sportsLocation
{
  return self->_sportsLocation;
}

- (BOOL)hideLocationInMasthead
{
  return self->_hideLocationInMasthead;
}

- (unint64_t)sportsType
{
  return self->_sportsType;
}

- (NSString)sportsTypeDisplayName
{
  return self->_sportsTypeDisplayName;
}

- (NSString)sportsTypePluralizedDisplayName
{
  return self->_sportsTypePluralizedDisplayName;
}

- (unint64_t)sportsLeagueType
{
  return self->_sportsLeagueType;
}

- (FCColor)sportsPrimaryColor
{
  return self->_sportsPrimaryColor;
}

- (FCColor)sportsSecondaryColor
{
  return self->_sportsSecondaryColor;
}

- (FCSportsRecommendationMappings)sportsRecommendationMappings
{
  return self->_sportsRecommendationMappings;
}

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (int64_t)sportsLogoMastheadLeadingOffset
{
  return self->_sportsLogoMastheadLeadingOffset;
}

- (int64_t)sportsLogoMastheadHorizontalPaddingOffset
{
  return self->_sportsLogoMastheadHorizontalPaddingOffset;
}

- (unint64_t)sportsLogoMastheadVisibility
{
  return self->_sportsLogoMastheadVisibility;
}

- (FCColor)sportsEventNavigationForegroundColor
{
  return self->_sportsEventNavigationForegroundColor;
}

- (unint64_t)navigationChromeBackgroundImageContentMode
{
  return self->_navigationChromeBackgroundImageContentMode;
}

- (unint64_t)navigationChromeBackgroundImageContentModeCompact
{
  return self->_navigationChromeBackgroundImageContentModeCompact;
}

- (unint64_t)navigationChromeBackgroundImageContentModeLarge
{
  return self->_navigationChromeBackgroundImageContentModeLarge;
}

- (FCColorGradient)feedBackgroundGradient
{
  return self->_feedBackgroundGradient;
}

- (FCColorGradient)darkStyleFeedBackgroundGradient
{
  return self->_darkStyleFeedBackgroundGradient;
}

- (FCColorGradient)adBackgroundGradient
{
  return self->_adBackgroundGradient;
}

- (FCColorGradient)darkStyleAdBackgroundGradient
{
  return self->_darkStyleAdBackgroundGradient;
}

- (NSString)feedMastheadType
{
  return self->_feedMastheadType;
}

- (NSString)pptFeedIDOverride
{
  return self->_pptFeedIDOverride;
}

- (void)setPptFeedIDOverride:(id)a3
{
}

- (FCInterestToken)tagRecordInterestToken
{
  return self->_tagRecordInterestToken;
}

@end