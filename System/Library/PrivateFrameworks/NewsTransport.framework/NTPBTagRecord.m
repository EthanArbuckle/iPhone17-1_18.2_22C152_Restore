@interface NTPBTagRecord
+ (Class)adTargetingKeywordsType;
+ (Class)allowedStorefrontIDsType;
+ (Class)blockedStorefrontIDsType;
+ (Class)channelSectionFeedConfigurationsType;
+ (Class)channelSectionIDsType;
+ (Class)iAdCategoriesType;
+ (Class)iAdKeywordsType;
+ (Class)latestIssueIDsType;
+ (Class)publisherPaidBundlePurchaseIDsType;
+ (Class)publisherPaidFeldsparablePurchaseIDsType;
+ (Class)publisherSpecifiedArticleIDsType;
+ (Class)purchaseOfferableConfigurationType;
+ (Class)recentIssueIDsType;
- (BOOL)hasArchiveIssueListID;
- (BOOL)hasArticleRecirculationConfiguration;
- (BOOL)hasBase;
- (BOOL)hasBehaviorFlags;
- (BOOL)hasChannelDefaultSectionID;
- (BOOL)hasContentProvider;
- (BOOL)hasCoverImageURL;
- (BOOL)hasDarkStyleNavigationChromeBackgroundImageCompactURL;
- (BOOL)hasDarkStyleNavigationChromeBackgroundImageLargeURL;
- (BOOL)hasDarkStyleNavigationChromeBackgroundImageURL;
- (BOOL)hasFeedConfiguration;
- (BOOL)hasFeedNavImageHQURL;
- (BOOL)hasFeedNavImageURL;
- (BOOL)hasGroupingAvailability;
- (BOOL)hasHideAccessoryText;
- (BOOL)hasHighlightsArticleListID;
- (BOOL)hasIsDeprecated;
- (BOOL)hasIsExplicitContent;
- (BOOL)hasIsHidden;
- (BOOL)hasIsNotificationEnabled;
- (BOOL)hasIsPublic;
- (BOOL)hasIsSportsRecommendable;
- (BOOL)hasLanguage;
- (BOOL)hasLogoURL;
- (BOOL)hasMagazineGenre;
- (BOOL)hasMinimumNewsVersion;
- (BOOL)hasName;
- (BOOL)hasNameCompact;
- (BOOL)hasNameImageBaselineShift;
- (BOOL)hasNameImageCompactMetadata;
- (BOOL)hasNameImageCompactURL;
- (BOOL)hasNameImageForDarkBackgroundURL;
- (BOOL)hasNameImageLargeMaskURL;
- (BOOL)hasNameImageLargeURL;
- (BOOL)hasNameImageMaskURL;
- (BOOL)hasNameImageMaskWidgetHQURL;
- (BOOL)hasNameImageMaskWidgetLQURL;
- (BOOL)hasNameImageMetadata;
- (BOOL)hasNameImageScaleFactor;
- (BOOL)hasNameImageURL;
- (BOOL)hasNavigationChromeBackgroundImageCompactURL;
- (BOOL)hasNavigationChromeBackgroundImageLargeURL;
- (BOOL)hasNavigationChromeBackgroundImageURL;
- (BOOL)hasPaidBundlePaywallConfigurationJson;
- (BOOL)hasParentID;
- (BOOL)hasPrimaryAudience;
- (BOOL)hasPropertyFlags;
- (BOOL)hasPropertyFlagsLocalized;
- (BOOL)hasPublisherPaidAuthorizationURL;
- (BOOL)hasPublisherPaidDescriptionStrings;
- (BOOL)hasPublisherPaidLeakyPaywallOptOut;
- (BOOL)hasPublisherPaidVerificationURL;
- (BOOL)hasPublisherPaidWebOptIn;
- (BOOL)hasPublisherPaidWebaccessURL;
- (BOOL)hasPublisherSpecifiedArticleIDsModifiedDate;
- (BOOL)hasPublisherSpecifiedArticlesJson;
- (BOOL)hasReplacementID;
- (BOOL)hasScore;
- (BOOL)hasSportsData;
- (BOOL)hasSportsLogoAltImageCompactURL;
- (BOOL)hasSportsLogoAltImageLargeURL;
- (BOOL)hasSportsLogoAltImageURL;
- (BOOL)hasSportsLogoImageCompactURL;
- (BOOL)hasSportsLogoImageLargeURL;
- (BOOL)hasSportsLogoImageURL;
- (BOOL)hasSportsRecommendationMappingsJson;
- (BOOL)hasSportsTheme;
- (BOOL)hasStocksFeedConfigurationJson;
- (BOOL)hasSubscriptionRate;
- (BOOL)hasSubtitle;
- (BOOL)hasSuperfeedConfigResourceID;
- (BOOL)hasSupergroupConfigJson;
- (BOOL)hasSupergroupKnobsJson;
- (BOOL)hasTemplateJson;
- (BOOL)hasType;
- (BOOL)hideAccessoryText;
- (BOOL)isDeprecated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (BOOL)isHidden;
- (BOOL)isNotificationEnabled;
- (BOOL)isPublic;
- (BOOL)isSportsRecommendable;
- (BOOL)publisherPaidLeakyPaywallOptOut;
- (BOOL)publisherPaidWebOptIn;
- (BOOL)readFrom:(id)a3;
- (NSData)articleRecirculationConfiguration;
- (NSData)nameImageCompactMetadata;
- (NSData)nameImageMetadata;
- (NSData)sportsRecommendationMappingsJson;
- (NSMutableArray)adTargetingKeywords;
- (NSMutableArray)allowedStorefrontIDs;
- (NSMutableArray)blockedStorefrontIDs;
- (NSMutableArray)channelSectionFeedConfigurations;
- (NSMutableArray)channelSectionIDs;
- (NSMutableArray)iAdCategories;
- (NSMutableArray)iAdKeywords;
- (NSMutableArray)latestIssueIDs;
- (NSMutableArray)publisherPaidBundlePurchaseIDs;
- (NSMutableArray)publisherPaidFeldsparablePurchaseIDs;
- (NSMutableArray)publisherSpecifiedArticleIDs;
- (NSMutableArray)purchaseOfferableConfigurations;
- (NSMutableArray)recentIssueIDs;
- (NSString)archiveIssueListID;
- (NSString)channelDefaultSectionID;
- (NSString)coverImageURL;
- (NSString)darkStyleNavigationChromeBackgroundImageCompactURL;
- (NSString)darkStyleNavigationChromeBackgroundImageLargeURL;
- (NSString)darkStyleNavigationChromeBackgroundImageURL;
- (NSString)feedNavImageHQURL;
- (NSString)feedNavImageURL;
- (NSString)highlightsArticleListID;
- (NSString)language;
- (NSString)logoURL;
- (NSString)magazineGenre;
- (NSString)name;
- (NSString)nameCompact;
- (NSString)nameImageCompactURL;
- (NSString)nameImageForDarkBackgroundURL;
- (NSString)nameImageLargeMaskURL;
- (NSString)nameImageLargeURL;
- (NSString)nameImageMaskURL;
- (NSString)nameImageMaskWidgetHQURL;
- (NSString)nameImageMaskWidgetLQURL;
- (NSString)nameImageURL;
- (NSString)navigationChromeBackgroundImageCompactURL;
- (NSString)navigationChromeBackgroundImageLargeURL;
- (NSString)navigationChromeBackgroundImageURL;
- (NSString)paidBundlePaywallConfigurationJson;
- (NSString)parentID;
- (NSString)primaryAudience;
- (NSString)publisherPaidAuthorizationURL;
- (NSString)publisherPaidVerificationURL;
- (NSString)publisherPaidWebaccessURL;
- (NSString)publisherSpecifiedArticlesJson;
- (NSString)replacementID;
- (NSString)sportsData;
- (NSString)sportsLogoAltImageCompactURL;
- (NSString)sportsLogoAltImageLargeURL;
- (NSString)sportsLogoAltImageURL;
- (NSString)sportsLogoImageCompactURL;
- (NSString)sportsLogoImageLargeURL;
- (NSString)sportsLogoImageURL;
- (NSString)sportsTheme;
- (NSString)stocksFeedConfigurationJson;
- (NSString)subtitle;
- (NSString)superfeedConfigResourceID;
- (NSString)supergroupConfigJson;
- (NSString)supergroupKnobsJson;
- (NSString)templateJson;
- (NTPBDate)publisherSpecifiedArticleIDsModifiedDate;
- (NTPBFeedConfiguration)feedConfiguration;
- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings;
- (NTPBRecordBase)base;
- (double)nameImageScaleFactor;
- (double)subscriptionRate;
- (id)adTargetingKeywordsAtIndex:(unint64_t)a3;
- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3;
- (id)channelSectionFeedConfigurationsAtIndex:(unint64_t)a3;
- (id)channelSectionIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)iAdCategoriesAtIndex:(unint64_t)a3;
- (id)iAdKeywordsAtIndex:(unint64_t)a3;
- (id)latestIssueIDsAtIndex:(unint64_t)a3;
- (id)publisherPaidBundlePurchaseIDsAtIndex:(unint64_t)a3;
- (id)publisherPaidFeldsparablePurchaseIDsAtIndex:(unint64_t)a3;
- (id)publisherSpecifiedArticleIDsAtIndex:(unint64_t)a3;
- (id)purchaseOfferableConfigurationAtIndex:(unint64_t)a3;
- (id)recentIssueIDsAtIndex:(unint64_t)a3;
- (int)groupingAvailability;
- (int)type;
- (int64_t)behaviorFlags;
- (int64_t)contentProvider;
- (int64_t)minimumNewsVersion;
- (int64_t)propertyFlags;
- (int64_t)propertyFlagsLocalized;
- (int64_t)score;
- (unint64_t)adTargetingKeywordsCount;
- (unint64_t)allowedStorefrontIDsCount;
- (unint64_t)blockedStorefrontIDsCount;
- (unint64_t)channelSectionFeedConfigurationsCount;
- (unint64_t)channelSectionIDsCount;
- (unint64_t)hash;
- (unint64_t)iAdCategoriesCount;
- (unint64_t)iAdKeywordsCount;
- (unint64_t)latestIssueIDsCount;
- (unint64_t)nameImageBaselineShift;
- (unint64_t)publisherPaidBundlePurchaseIDsCount;
- (unint64_t)publisherPaidFeldsparablePurchaseIDsCount;
- (unint64_t)publisherSpecifiedArticleIDsCount;
- (unint64_t)purchaseOfferableConfigurationsCount;
- (unint64_t)recentIssueIDsCount;
- (void)addAdTargetingKeywords:(id)a3;
- (void)addAllowedStorefrontIDs:(id)a3;
- (void)addBlockedStorefrontIDs:(id)a3;
- (void)addChannelSectionFeedConfigurations:(id)a3;
- (void)addChannelSectionIDs:(id)a3;
- (void)addIAdCategories:(id)a3;
- (void)addIAdKeywords:(id)a3;
- (void)addLatestIssueIDs:(id)a3;
- (void)addPublisherPaidBundlePurchaseIDs:(id)a3;
- (void)addPublisherPaidFeldsparablePurchaseIDs:(id)a3;
- (void)addPublisherSpecifiedArticleIDs:(id)a3;
- (void)addPurchaseOfferableConfiguration:(id)a3;
- (void)addRecentIssueIDs:(id)a3;
- (void)clearAdTargetingKeywords;
- (void)clearAllowedStorefrontIDs;
- (void)clearBlockedStorefrontIDs;
- (void)clearChannelSectionFeedConfigurations;
- (void)clearChannelSectionIDs;
- (void)clearIAdCategories;
- (void)clearIAdKeywords;
- (void)clearLatestIssueIDs;
- (void)clearPublisherPaidBundlePurchaseIDs;
- (void)clearPublisherPaidFeldsparablePurchaseIDs;
- (void)clearPublisherSpecifiedArticleIDs;
- (void)clearPurchaseOfferableConfigurations;
- (void)clearRecentIssueIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdTargetingKeywords:(id)a3;
- (void)setAllowedStorefrontIDs:(id)a3;
- (void)setArchiveIssueListID:(id)a3;
- (void)setArticleRecirculationConfiguration:(id)a3;
- (void)setBase:(id)a3;
- (void)setBehaviorFlags:(int64_t)a3;
- (void)setBlockedStorefrontIDs:(id)a3;
- (void)setChannelDefaultSectionID:(id)a3;
- (void)setChannelSectionFeedConfigurations:(id)a3;
- (void)setChannelSectionIDs:(id)a3;
- (void)setContentProvider:(int64_t)a3;
- (void)setCoverImageURL:(id)a3;
- (void)setDarkStyleNavigationChromeBackgroundImageCompactURL:(id)a3;
- (void)setDarkStyleNavigationChromeBackgroundImageLargeURL:(id)a3;
- (void)setDarkStyleNavigationChromeBackgroundImageURL:(id)a3;
- (void)setFeedConfiguration:(id)a3;
- (void)setFeedNavImageHQURL:(id)a3;
- (void)setFeedNavImageURL:(id)a3;
- (void)setGroupingAvailability:(int)a3;
- (void)setHasBehaviorFlags:(BOOL)a3;
- (void)setHasContentProvider:(BOOL)a3;
- (void)setHasGroupingAvailability:(BOOL)a3;
- (void)setHasHideAccessoryText:(BOOL)a3;
- (void)setHasIsDeprecated:(BOOL)a3;
- (void)setHasIsExplicitContent:(BOOL)a3;
- (void)setHasIsHidden:(BOOL)a3;
- (void)setHasIsNotificationEnabled:(BOOL)a3;
- (void)setHasIsPublic:(BOOL)a3;
- (void)setHasIsSportsRecommendable:(BOOL)a3;
- (void)setHasMinimumNewsVersion:(BOOL)a3;
- (void)setHasNameImageBaselineShift:(BOOL)a3;
- (void)setHasNameImageScaleFactor:(BOOL)a3;
- (void)setHasPropertyFlags:(BOOL)a3;
- (void)setHasPropertyFlagsLocalized:(BOOL)a3;
- (void)setHasPublisherPaidLeakyPaywallOptOut:(BOOL)a3;
- (void)setHasPublisherPaidWebOptIn:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSubscriptionRate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHideAccessoryText:(BOOL)a3;
- (void)setHighlightsArticleListID:(id)a3;
- (void)setIAdCategories:(id)a3;
- (void)setIAdKeywords:(id)a3;
- (void)setIsDeprecated:(BOOL)a3;
- (void)setIsExplicitContent:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsNotificationEnabled:(BOOL)a3;
- (void)setIsPublic:(BOOL)a3;
- (void)setIsSportsRecommendable:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLatestIssueIDs:(id)a3;
- (void)setLogoURL:(id)a3;
- (void)setMagazineGenre:(id)a3;
- (void)setMinimumNewsVersion:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNameCompact:(id)a3;
- (void)setNameImageBaselineShift:(unint64_t)a3;
- (void)setNameImageCompactMetadata:(id)a3;
- (void)setNameImageCompactURL:(id)a3;
- (void)setNameImageForDarkBackgroundURL:(id)a3;
- (void)setNameImageLargeMaskURL:(id)a3;
- (void)setNameImageLargeURL:(id)a3;
- (void)setNameImageMaskURL:(id)a3;
- (void)setNameImageMaskWidgetHQURL:(id)a3;
- (void)setNameImageMaskWidgetLQURL:(id)a3;
- (void)setNameImageMetadata:(id)a3;
- (void)setNameImageScaleFactor:(double)a3;
- (void)setNameImageURL:(id)a3;
- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3;
- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3;
- (void)setNavigationChromeBackgroundImageURL:(id)a3;
- (void)setPaidBundlePaywallConfigurationJson:(id)a3;
- (void)setParentID:(id)a3;
- (void)setPrimaryAudience:(id)a3;
- (void)setPropertyFlags:(int64_t)a3;
- (void)setPropertyFlagsLocalized:(int64_t)a3;
- (void)setPublisherPaidAuthorizationURL:(id)a3;
- (void)setPublisherPaidBundlePurchaseIDs:(id)a3;
- (void)setPublisherPaidDescriptionStrings:(id)a3;
- (void)setPublisherPaidFeldsparablePurchaseIDs:(id)a3;
- (void)setPublisherPaidLeakyPaywallOptOut:(BOOL)a3;
- (void)setPublisherPaidVerificationURL:(id)a3;
- (void)setPublisherPaidWebOptIn:(BOOL)a3;
- (void)setPublisherPaidWebaccessURL:(id)a3;
- (void)setPublisherSpecifiedArticleIDs:(id)a3;
- (void)setPublisherSpecifiedArticleIDsModifiedDate:(id)a3;
- (void)setPublisherSpecifiedArticlesJson:(id)a3;
- (void)setPurchaseOfferableConfigurations:(id)a3;
- (void)setRecentIssueIDs:(id)a3;
- (void)setReplacementID:(id)a3;
- (void)setScore:(int64_t)a3;
- (void)setSportsData:(id)a3;
- (void)setSportsLogoAltImageCompactURL:(id)a3;
- (void)setSportsLogoAltImageLargeURL:(id)a3;
- (void)setSportsLogoAltImageURL:(id)a3;
- (void)setSportsLogoImageCompactURL:(id)a3;
- (void)setSportsLogoImageLargeURL:(id)a3;
- (void)setSportsLogoImageURL:(id)a3;
- (void)setSportsRecommendationMappingsJson:(id)a3;
- (void)setSportsTheme:(id)a3;
- (void)setStocksFeedConfigurationJson:(id)a3;
- (void)setSubscriptionRate:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuperfeedConfigResourceID:(id)a3;
- (void)setSupergroupConfigJson:(id)a3;
- (void)setSupergroupKnobsJson:(id)a3;
- (void)setTemplateJson:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTagRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (int64_t)propertyFlags
{
  return self->_propertyFlags;
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (NSData)nameImageMetadata
{
  return self->_nameImageMetadata;
}

- (NSString)nameImageCompactURL
{
  return self->_nameImageCompactURL;
}

- (NSString)supergroupKnobsJson
{
  return self->_supergroupKnobsJson;
}

- (NSMutableArray)purchaseOfferableConfigurations
{
  return self->_purchaseOfferableConfigurations;
}

- (NSString)feedNavImageHQURL
{
  return self->_feedNavImageHQURL;
}

- (NSString)feedNavImageURL
{
  return self->_feedNavImageURL;
}

- (NSString)nameImageURL
{
  return self->_nameImageURL;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (NSString)nameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL;
}

- (NSString)nameImageMaskURL
{
  return self->_nameImageMaskURL;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)subscriptionRate
{
  return self->_subscriptionRate;
}

- (NSString)sportsTheme
{
  return self->_sportsTheme;
}

- (NSString)sportsLogoImageURL
{
  return self->_sportsLogoImageURL;
}

- (NSString)sportsLogoImageLargeURL
{
  return self->_sportsLogoImageLargeURL;
}

- (NSString)sportsLogoImageCompactURL
{
  return self->_sportsLogoImageCompactURL;
}

- (NSString)sportsLogoAltImageURL
{
  return self->_sportsLogoAltImageURL;
}

- (NSString)sportsLogoAltImageLargeURL
{
  return self->_sportsLogoAltImageLargeURL;
}

- (NSString)sportsLogoAltImageCompactURL
{
  return self->_sportsLogoAltImageCompactURL;
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (int64_t)score
{
  return self->_score;
}

- (NSString)replacementID
{
  return self->_replacementID;
}

- (NSMutableArray)recentIssueIDs
{
  return self->_recentIssueIDs;
}

- (NSMutableArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (NTPBDate)publisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate;
}

- (int64_t)propertyFlagsLocalized
{
  return self->_propertyFlagsLocalized;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSString)paidBundlePaywallConfigurationJson
{
  return self->_paidBundlePaywallConfigurationJson;
}

- (NSString)navigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL;
}

- (NSString)navigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL;
}

- (NSString)navigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL;
}

- (double)nameImageScaleFactor
{
  return self->_nameImageScaleFactor;
}

- (NSString)nameImageLargeMaskURL
{
  return self->_nameImageLargeMaskURL;
}

- (unint64_t)nameImageBaselineShift
{
  return self->_nameImageBaselineShift;
}

- (NSString)nameCompact
{
  return self->_nameCompact;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)magazineGenre
{
  return self->_magazineGenre;
}

- (NSString)logoURL
{
  return self->_logoURL;
}

- (NSMutableArray)latestIssueIDs
{
  return self->_latestIssueIDs;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)isSportsRecommendable
{
  return self->_isSportsRecommendable;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (NSMutableArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSMutableArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (NTPBFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (NSString)darkStyleNavigationChromeBackgroundImageURL
{
  return self->_darkStyleNavigationChromeBackgroundImageURL;
}

- (NSString)darkStyleNavigationChromeBackgroundImageLargeURL
{
  return self->_darkStyleNavigationChromeBackgroundImageLargeURL;
}

- (NSString)darkStyleNavigationChromeBackgroundImageCompactURL
{
  return self->_darkStyleNavigationChromeBackgroundImageCompactURL;
}

- (int64_t)contentProvider
{
  return self->_contentProvider;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSString)archiveIssueListID
{
  return self->_archiveIssueListID;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSMutableArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (NSString)templateJson
{
  return self->_templateJson;
}

- (NSString)supergroupConfigJson
{
  return self->_supergroupConfigJson;
}

- (NSData)sportsRecommendationMappingsJson
{
  return self->_sportsRecommendationMappingsJson;
}

- (NSString)publisherPaidWebaccessURL
{
  return self->_publisherPaidWebaccessURL;
}

- (BOOL)publisherPaidWebOptIn
{
  return self->_publisherPaidWebOptIn;
}

- (NSString)publisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return self->_publisherPaidLeakyPaywallOptOut;
}

- (NSMutableArray)publisherPaidFeldsparablePurchaseIDs
{
  return self->_publisherPaidFeldsparablePurchaseIDs;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings;
}

- (NSMutableArray)publisherPaidBundlePurchaseIDs
{
  return self->_publisherPaidBundlePurchaseIDs;
}

- (NSString)publisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL;
}

- (NSString)parentID
{
  return self->_parentID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)nameImageMaskWidgetLQURL
{
  return self->_nameImageMaskWidgetLQURL;
}

- (NSString)nameImageMaskWidgetHQURL
{
  return self->_nameImageMaskWidgetHQURL;
}

- (NSString)nameImageLargeURL
{
  return self->_nameImageLargeURL;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)hideAccessoryText
{
  return self->_hideAccessoryText;
}

- (NSMutableArray)channelSectionIDs
{
  return self->_channelSectionIDs;
}

- (NSMutableArray)channelSectionFeedConfigurations
{
  return self->_channelSectionFeedConfigurations;
}

- (NSString)channelDefaultSectionID
{
  return self->_channelDefaultSectionID;
}

- (BOOL)hasPublisherSpecifiedArticlesJson
{
  return self->_publisherSpecifiedArticlesJson != 0;
}

- (NSString)publisherSpecifiedArticlesJson
{
  return self->_publisherSpecifiedArticlesJson;
}

- (int)type
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (int)groupingAvailability
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_groupingAvailability;
  }
  else {
    return 0;
  }
}

- (void)addChannelSectionIDs:(id)a3
{
  channelSectionIDs = self->_channelSectionIDs;
  if (!channelSectionIDs)
  {
    channelSectionIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_channelSectionIDs = channelSectionIDs;
  }

  [(NSMutableArray *)channelSectionIDs addObject:a3];
}

- (void)addChannelSectionFeedConfigurations:(id)a3
{
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  if (!channelSectionFeedConfigurations)
  {
    channelSectionFeedConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_channelSectionFeedConfigurations = channelSectionFeedConfigurations;
  }

  [(NSMutableArray *)channelSectionFeedConfigurations addObject:a3];
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

- (void)addRecentIssueIDs:(id)a3
{
  recentIssueIDs = self->_recentIssueIDs;
  if (!recentIssueIDs)
  {
    recentIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_recentIssueIDs = recentIssueIDs;
  }

  [(NSMutableArray *)recentIssueIDs addObject:a3];
}

- (void)addLatestIssueIDs:(id)a3
{
  latestIssueIDs = self->_latestIssueIDs;
  if (!latestIssueIDs)
  {
    latestIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_latestIssueIDs = latestIssueIDs;
  }

  [(NSMutableArray *)latestIssueIDs addObject:a3];
}

- (void)addPublisherPaidBundlePurchaseIDs:(id)a3
{
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if (!publisherPaidBundlePurchaseIDs)
  {
    publisherPaidBundlePurchaseIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_publisherPaidBundlePurchaseIDs = publisherPaidBundlePurchaseIDs;
  }

  [(NSMutableArray *)publisherPaidBundlePurchaseIDs addObject:a3];
}

- (void)addPublisherPaidFeldsparablePurchaseIDs:(id)a3
{
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if (!publisherPaidFeldsparablePurchaseIDs)
  {
    publisherPaidFeldsparablePurchaseIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_publisherPaidFeldsparablePurchaseIDs = publisherPaidFeldsparablePurchaseIDs;
  }

  [(NSMutableArray *)publisherPaidFeldsparablePurchaseIDs addObject:a3];
}

- (void)addPurchaseOfferableConfiguration:(id)a3
{
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  if (!purchaseOfferableConfigurations)
  {
    purchaseOfferableConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_purchaseOfferableConfigurations = purchaseOfferableConfigurations;
  }

  [(NSMutableArray *)purchaseOfferableConfigurations addObject:a3];
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

- (void)dealloc
{
  [(NTPBTagRecord *)self setBase:0];
  [(NTPBTagRecord *)self setName:0];
  [(NTPBTagRecord *)self setReplacementID:0];
  [(NTPBTagRecord *)self setPrimaryAudience:0];
  [(NTPBTagRecord *)self setParentID:0];
  [(NTPBTagRecord *)self setLogoURL:0];
  [(NTPBTagRecord *)self setIAdCategories:0];
  [(NTPBTagRecord *)self setBlockedStorefrontIDs:0];
  [(NTPBTagRecord *)self setAllowedStorefrontIDs:0];
  [(NTPBTagRecord *)self setFeedConfiguration:0];
  [(NTPBTagRecord *)self setNameImageURL:0];
  [(NTPBTagRecord *)self setNameImageForDarkBackgroundURL:0];
  [(NTPBTagRecord *)self setNameImageMaskURL:0];
  [(NTPBTagRecord *)self setNameImageMetadata:0];
  [(NTPBTagRecord *)self setCoverImageURL:0];
  [(NTPBTagRecord *)self setTemplateJson:0];
  [(NTPBTagRecord *)self setChannelSectionIDs:0];
  [(NTPBTagRecord *)self setChannelDefaultSectionID:0];
  [(NTPBTagRecord *)self setChannelSectionFeedConfigurations:0];
  [(NTPBTagRecord *)self setPublisherPaidAuthorizationURL:0];
  [(NTPBTagRecord *)self setPublisherPaidVerificationURL:0];
  [(NTPBTagRecord *)self setPublisherPaidWebaccessURL:0];
  [(NTPBTagRecord *)self setPublisherPaidFeldsparablePurchaseIDs:0];
  [(NTPBTagRecord *)self setPublisherPaidBundlePurchaseIDs:0];
  [(NTPBTagRecord *)self setPurchaseOfferableConfigurations:0];
  [(NTPBTagRecord *)self setIAdKeywords:0];
  [(NTPBTagRecord *)self setNameImageMaskWidgetLQURL:0];
  [(NTPBTagRecord *)self setNameImageMaskWidgetHQURL:0];
  [(NTPBTagRecord *)self setPublisherPaidDescriptionStrings:0];
  [(NTPBTagRecord *)self setNameCompact:0];
  [(NTPBTagRecord *)self setNameImageCompactURL:0];
  [(NTPBTagRecord *)self setNameImageCompactMetadata:0];
  [(NTPBTagRecord *)self setArticleRecirculationConfiguration:0];
  [(NTPBTagRecord *)self setPublisherSpecifiedArticleIDs:0];
  [(NTPBTagRecord *)self setSubtitle:0];
  [(NTPBTagRecord *)self setPublisherSpecifiedArticleIDsModifiedDate:0];
  [(NTPBTagRecord *)self setFeedNavImageURL:0];
  [(NTPBTagRecord *)self setLatestIssueIDs:0];
  [(NTPBTagRecord *)self setArchiveIssueListID:0];
  [(NTPBTagRecord *)self setLanguage:0];
  [(NTPBTagRecord *)self setMagazineGenre:0];
  [(NTPBTagRecord *)self setPaidBundlePaywallConfigurationJson:0];
  [(NTPBTagRecord *)self setStocksFeedConfigurationJson:0];
  [(NTPBTagRecord *)self setSupergroupConfigJson:0];
  [(NTPBTagRecord *)self setSupergroupKnobsJson:0];
  [(NTPBTagRecord *)self setRecentIssueIDs:0];
  [(NTPBTagRecord *)self setNameImageLargeURL:0];
  [(NTPBTagRecord *)self setNameImageLargeMaskURL:0];
  [(NTPBTagRecord *)self setSuperfeedConfigResourceID:0];
  [(NTPBTagRecord *)self setSportsRecommendationMappingsJson:0];
  [(NTPBTagRecord *)self setHighlightsArticleListID:0];
  [(NTPBTagRecord *)self setSportsLogoImageURL:0];
  [(NTPBTagRecord *)self setSportsLogoImageCompactURL:0];
  [(NTPBTagRecord *)self setSportsLogoImageLargeURL:0];
  [(NTPBTagRecord *)self setSportsData:0];
  [(NTPBTagRecord *)self setSportsTheme:0];
  [(NTPBTagRecord *)self setNavigationChromeBackgroundImageURL:0];
  [(NTPBTagRecord *)self setDarkStyleNavigationChromeBackgroundImageURL:0];
  [(NTPBTagRecord *)self setNavigationChromeBackgroundImageCompactURL:0];
  [(NTPBTagRecord *)self setDarkStyleNavigationChromeBackgroundImageCompactURL:0];
  [(NTPBTagRecord *)self setNavigationChromeBackgroundImageLargeURL:0];
  [(NTPBTagRecord *)self setDarkStyleNavigationChromeBackgroundImageLargeURL:0];
  [(NTPBTagRecord *)self setPublisherSpecifiedArticlesJson:0];
  [(NTPBTagRecord *)self setAdTargetingKeywords:0];
  [(NTPBTagRecord *)self setFeedNavImageHQURL:0];
  [(NTPBTagRecord *)self setSportsLogoAltImageURL:0];
  [(NTPBTagRecord *)self setSportsLogoAltImageCompactURL:0];
  [(NTPBTagRecord *)self setSportsLogoAltImageLargeURL:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagRecord;
  [(NTPBTagRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setContentProvider:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_contentProvider = a3;
}

- (void)setHasContentProvider:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasContentProvider
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsPublic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isPublic = a3;
}

- (void)setHasIsPublic:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsPublic
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsDeprecated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isDeprecated = a3;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasReplacementID
{
  return self->_replacementID != 0;
}

- (BOOL)hasPrimaryAudience
{
  return self->_primaryAudience != 0;
}

- (BOOL)hasParentID
{
  return self->_parentID != 0;
}

- (BOOL)hasLogoURL
{
  return self->_logoURL != 0;
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

- (BOOL)hasFeedConfiguration
{
  return self->_feedConfiguration != 0;
}

- (void)setScore:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasNameImageURL
{
  return self->_nameImageURL != 0;
}

- (BOOL)hasNameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL != 0;
}

- (BOOL)hasNameImageMaskURL
{
  return self->_nameImageMaskURL != 0;
}

- (BOOL)hasNameImageMetadata
{
  return self->_nameImageMetadata != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (BOOL)hasTemplateJson
{
  return self->_templateJson != 0;
}

- (void)clearChannelSectionIDs
{
}

- (unint64_t)channelSectionIDsCount
{
  return [(NSMutableArray *)self->_channelSectionIDs count];
}

- (id)channelSectionIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelSectionIDs objectAtIndex:a3];
}

+ (Class)channelSectionIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelDefaultSectionID
{
  return self->_channelDefaultSectionID != 0;
}

- (void)clearChannelSectionFeedConfigurations
{
}

- (unint64_t)channelSectionFeedConfigurationsCount
{
  return [(NSMutableArray *)self->_channelSectionFeedConfigurations count];
}

- (id)channelSectionFeedConfigurationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelSectionFeedConfigurations objectAtIndex:a3];
}

+ (Class)channelSectionFeedConfigurationsType
{
  return (Class)objc_opt_class();
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsExplicitContent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isExplicitContent = a3;
}

- (void)setHasIsExplicitContent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isNotificationEnabled = a3;
}

- (void)setHasIsNotificationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsNotificationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPublisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL != 0;
}

- (BOOL)hasPublisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL != 0;
}

- (BOOL)hasPublisherPaidWebaccessURL
{
  return self->_publisherPaidWebaccessURL != 0;
}

- (void)clearPublisherPaidFeldsparablePurchaseIDs
{
}

- (unint64_t)publisherPaidFeldsparablePurchaseIDsCount
{
  return [(NSMutableArray *)self->_publisherPaidFeldsparablePurchaseIDs count];
}

- (id)publisherPaidFeldsparablePurchaseIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_publisherPaidFeldsparablePurchaseIDs objectAtIndex:a3];
}

+ (Class)publisherPaidFeldsparablePurchaseIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPublisherPaidBundlePurchaseIDs
{
}

- (unint64_t)publisherPaidBundlePurchaseIDsCount
{
  return [(NSMutableArray *)self->_publisherPaidBundlePurchaseIDs count];
}

- (id)publisherPaidBundlePurchaseIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_publisherPaidBundlePurchaseIDs objectAtIndex:a3];
}

+ (Class)publisherPaidBundlePurchaseIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPurchaseOfferableConfigurations
{
}

- (unint64_t)purchaseOfferableConfigurationsCount
{
  return [(NSMutableArray *)self->_purchaseOfferableConfigurations count];
}

- (id)purchaseOfferableConfigurationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_purchaseOfferableConfigurations objectAtIndex:a3];
}

+ (Class)purchaseOfferableConfigurationType
{
  return (Class)objc_opt_class();
}

- (void)setPublisherPaidLeakyPaywallOptOut:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_publisherPaidLeakyPaywallOptOut = a3;
}

- (void)setHasPublisherPaidLeakyPaywallOptOut:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPublisherPaidLeakyPaywallOptOut
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPublisherPaidWebOptIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_publisherPaidWebOptIn = a3;
}

- (void)setHasPublisherPaidWebOptIn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPublisherPaidWebOptIn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNameImageBaselineShift:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_nameImageBaselineShift = a3;
}

- (void)setHasNameImageBaselineShift:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNameImageBaselineShift
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNameImageScaleFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_nameImageScaleFactor = a3;
}

- (void)setHasNameImageScaleFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNameImageScaleFactor
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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

- (BOOL)hasNameImageMaskWidgetLQURL
{
  return self->_nameImageMaskWidgetLQURL != 0;
}

- (BOOL)hasNameImageMaskWidgetHQURL
{
  return self->_nameImageMaskWidgetHQURL != 0;
}

- (void)setHideAccessoryText:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hideAccessoryText = a3;
}

- (void)setHasHideAccessoryText:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHideAccessoryText
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPublisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings != 0;
}

- (BOOL)hasNameCompact
{
  return self->_nameCompact != 0;
}

- (BOOL)hasNameImageCompactURL
{
  return self->_nameImageCompactURL != 0;
}

- (BOOL)hasNameImageCompactMetadata
{
  return self->_nameImageCompactMetadata != 0;
}

- (void)setGroupingAvailability:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_groupingAvailability = a3;
}

- (void)setHasGroupingAvailability:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGroupingAvailability
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsHidden:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isHidden = a3;
}

- (void)setHasIsHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsHidden
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_behaviorFlags = a3;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBehaviorFlags
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasArticleRecirculationConfiguration
{
  return self->_articleRecirculationConfiguration != 0;
}

- (void)clearPublisherSpecifiedArticleIDs
{
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

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasPublisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate != 0;
}

- (BOOL)hasFeedNavImageURL
{
  return self->_feedNavImageURL != 0;
}

- (void)clearLatestIssueIDs
{
}

- (unint64_t)latestIssueIDsCount
{
  return [(NSMutableArray *)self->_latestIssueIDs count];
}

- (id)latestIssueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_latestIssueIDs objectAtIndex:a3];
}

+ (Class)latestIssueIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasArchiveIssueListID
{
  return self->_archiveIssueListID != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasMagazineGenre
{
  return self->_magazineGenre != 0;
}

- (BOOL)hasPaidBundlePaywallConfigurationJson
{
  return self->_paidBundlePaywallConfigurationJson != 0;
}

- (BOOL)hasStocksFeedConfigurationJson
{
  return self->_stocksFeedConfigurationJson != 0;
}

- (BOOL)hasSupergroupConfigJson
{
  return self->_supergroupConfigJson != 0;
}

- (BOOL)hasSupergroupKnobsJson
{
  return self->_supergroupKnobsJson != 0;
}

- (void)setPropertyFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_propertyFlags = a3;
}

- (void)setHasPropertyFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPropertyFlags
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearRecentIssueIDs
{
}

- (unint64_t)recentIssueIDsCount
{
  return [(NSMutableArray *)self->_recentIssueIDs count];
}

- (id)recentIssueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recentIssueIDs objectAtIndex:a3];
}

+ (Class)recentIssueIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNameImageLargeURL
{
  return self->_nameImageLargeURL != 0;
}

- (BOOL)hasNameImageLargeMaskURL
{
  return self->_nameImageLargeMaskURL != 0;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)setIsSportsRecommendable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isSportsRecommendable = a3;
}

- (void)setHasIsSportsRecommendable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsSportsRecommendable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasSportsRecommendationMappingsJson
{
  return self->_sportsRecommendationMappingsJson != 0;
}

- (BOOL)hasHighlightsArticleListID
{
  return self->_highlightsArticleListID != 0;
}

- (BOOL)hasSportsLogoImageURL
{
  return self->_sportsLogoImageURL != 0;
}

- (BOOL)hasSportsLogoImageCompactURL
{
  return self->_sportsLogoImageCompactURL != 0;
}

- (BOOL)hasSportsLogoImageLargeURL
{
  return self->_sportsLogoImageLargeURL != 0;
}

- (BOOL)hasSportsData
{
  return self->_sportsData != 0;
}

- (BOOL)hasSportsTheme
{
  return self->_sportsTheme != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageURL
{
  return self->_darkStyleNavigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageCompactURL
{
  return self->_darkStyleNavigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageLargeURL
{
  return self->_darkStyleNavigationChromeBackgroundImageLargeURL != 0;
}

- (void)setSubscriptionRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_subscriptionRate = a3;
}

- (void)setHasSubscriptionRate:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSubscriptionRate
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)clearAdTargetingKeywords
{
}

- (void)addAdTargetingKeywords:(id)a3
{
  adTargetingKeywords = self->_adTargetingKeywords;
  if (!adTargetingKeywords)
  {
    adTargetingKeywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_adTargetingKeywords = adTargetingKeywords;
  }

  [(NSMutableArray *)adTargetingKeywords addObject:a3];
}

- (unint64_t)adTargetingKeywordsCount
{
  return [(NSMutableArray *)self->_adTargetingKeywords count];
}

- (id)adTargetingKeywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_adTargetingKeywords objectAtIndex:a3];
}

+ (Class)adTargetingKeywordsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedNavImageHQURL
{
  return self->_feedNavImageHQURL != 0;
}

- (BOOL)hasSportsLogoAltImageURL
{
  return self->_sportsLogoAltImageURL != 0;
}

- (BOOL)hasSportsLogoAltImageCompactURL
{
  return self->_sportsLogoAltImageCompactURL != 0;
}

- (BOOL)hasSportsLogoAltImageLargeURL
{
  return self->_sportsLogoAltImageLargeURL != 0;
}

- (void)setPropertyFlagsLocalized:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_propertyFlagsLocalized = a3;
}

- (void)setHasPropertyFlagsLocalized:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPropertyFlagsLocalized
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTagRecord description](&v3, sel_description), -[NTPBTagRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_type), @"type");
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_contentProvider), @"content_provider");
    $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPublic), @"is_public");
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_10:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isDeprecated), @"is_deprecated");
LABEL_11:
  replacementID = self->_replacementID;
  if (replacementID) {
    [v3 setObject:replacementID forKey:@"replacement_ID"];
  }
  primaryAudience = self->_primaryAudience;
  if (primaryAudience) {
    [v3 setObject:primaryAudience forKey:@"primary_audience"];
  }
  parentID = self->_parentID;
  if (parentID) {
    [v3 setObject:parentID forKey:@"parent_ID"];
  }
  logoURL = self->_logoURL;
  if (logoURL) {
    [v3 setObject:logoURL forKey:@"logo_URL"];
  }
  iAdCategories = self->_iAdCategories;
  if (iAdCategories) {
    [v3 setObject:iAdCategories forKey:@"i_ad_categories"];
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs) {
    [v3 setObject:blockedStorefrontIDs forKey:@"blocked_storefront_IDs"];
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs) {
    [v3 setObject:allowedStorefrontIDs forKey:@"allowed_storefront_IDs"];
  }
  feedConfiguration = self->_feedConfiguration;
  if (feedConfiguration) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBFeedConfiguration dictionaryRepresentation](feedConfiguration, "dictionaryRepresentation"), @"feed_configuration");
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_score), @"score");
  }
  nameImageURL = self->_nameImageURL;
  if (nameImageURL) {
    [v3 setObject:nameImageURL forKey:@"name_image_URL"];
  }
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if (nameImageForDarkBackgroundURL) {
    [v3 setObject:nameImageForDarkBackgroundURL forKey:@"name_image_for_dark_background_URL"];
  }
  nameImageMaskURL = self->_nameImageMaskURL;
  if (nameImageMaskURL) {
    [v3 setObject:nameImageMaskURL forKey:@"name_image_mask_URL"];
  }
  nameImageMetadata = self->_nameImageMetadata;
  if (nameImageMetadata) {
    [v3 setObject:nameImageMetadata forKey:@"name_image_metadata"];
  }
  coverImageURL = self->_coverImageURL;
  if (coverImageURL) {
    [v3 setObject:coverImageURL forKey:@"cover_image_URL"];
  }
  templateJson = self->_templateJson;
  if (templateJson) {
    [v3 setObject:templateJson forKey:@"template_json"];
  }
  channelSectionIDs = self->_channelSectionIDs;
  if (channelSectionIDs) {
    [v3 setObject:channelSectionIDs forKey:@"channel_section_IDs"];
  }
  channelDefaultSectionID = self->_channelDefaultSectionID;
  if (channelDefaultSectionID) {
    [v3 setObject:channelDefaultSectionID forKey:@"channel_default_section_ID"];
  }
  if ([(NSMutableArray *)self->_channelSectionFeedConfigurations count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_channelSectionFeedConfigurations, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
    uint64_t v25 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v91 objects:v96 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v92 != v27) {
            objc_enumerationMutation(channelSectionFeedConfigurations);
          }
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v26 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v91 objects:v96 count:16];
      }
      while (v26);
    }
    [v3 setObject:v23 forKey:@"channel_section_feed_configurations"];
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v29 = self->_has;
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_minimumNewsVersion), @"minimum_news_version");
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x2000) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v29 & 0x8000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v29 & 0x2000) == 0)
  {
    goto LABEL_56;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isExplicitContent), @"is_explicit_content");
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_57:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isNotificationEnabled), @"is_notification_enabled");
LABEL_58:
  publisherPaidAuthorizationURL = self->_publisherPaidAuthorizationURL;
  if (publisherPaidAuthorizationURL) {
    [v3 setObject:publisherPaidAuthorizationURL forKey:@"publisher_paid_authorization_URL"];
  }
  publisherPaidVerificationURL = self->_publisherPaidVerificationURL;
  if (publisherPaidVerificationURL) {
    [v3 setObject:publisherPaidVerificationURL forKey:@"publisher_paid_verification_URL"];
  }
  publisherPaidWebaccessURL = self->_publisherPaidWebaccessURL;
  if (publisherPaidWebaccessURL) {
    [v3 setObject:publisherPaidWebaccessURL forKey:@"publisher_paid_webaccess_URL"];
  }
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if (publisherPaidFeldsparablePurchaseIDs) {
    [v3 setObject:publisherPaidFeldsparablePurchaseIDs forKey:@"publisher_paid_feldsparable_purchase_IDs"];
  }
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if (publisherPaidBundlePurchaseIDs) {
    [v3 setObject:publisherPaidBundlePurchaseIDs forKey:@"publisher_paid_bundle_purchase_IDs"];
  }
  if ([(NSMutableArray *)self->_purchaseOfferableConfigurations count])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_purchaseOfferableConfigurations, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
    uint64_t v37 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v88 != v39) {
            objc_enumerationMutation(purchaseOfferableConfigurations);
          }
          objc_msgSend(v35, "addObject:", objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v38 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v87 objects:v95 count:16];
      }
      while (v38);
    }
    [v3 setObject:v35 forKey:@"purchase_offerable_configuration"];
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_publisherPaidLeakyPaywallOptOut), @"publisher_paid_leaky_paywall_opt_out");
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x80000) == 0)
    {
LABEL_79:
      if ((*(unsigned char *)&v41 & 8) == 0) {
        goto LABEL_80;
      }
      goto LABEL_191;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x80000) == 0)
  {
    goto LABEL_79;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_publisherPaidWebOptIn), @"publisher_paid_web_opt_in");
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v41 = self->_has;
  if ((*(unsigned char *)&v41 & 8) == 0)
  {
LABEL_80:
    if ((*(unsigned char *)&v41 & 0x10) == 0) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
LABEL_191:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_nameImageBaselineShift), @"name_image_baseline_shift");
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_81:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_nameImageScaleFactor), @"name_image_scale_factor");
LABEL_82:
  iAdKeywords = self->_iAdKeywords;
  if (iAdKeywords) {
    [v3 setObject:iAdKeywords forKey:@"i_ad_keywords"];
  }
  nameImageMaskWidgetLQURL = self->_nameImageMaskWidgetLQURL;
  if (nameImageMaskWidgetLQURL) {
    [v3 setObject:nameImageMaskWidgetLQURL forKey:@"name_image_mask_widget_LQ_URL"];
  }
  nameImageMaskWidgetHQURL = self->_nameImageMaskWidgetHQURL;
  if (nameImageMaskWidgetHQURL) {
    [v3 setObject:nameImageMaskWidgetHQURL forKey:@"name_image_mask_widget_HQ_URL"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hideAccessoryText), @"hide_accessory_text");
  }
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  if (publisherPaidDescriptionStrings) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPublisherPaidDescriptionStrings dictionaryRepresentation](publisherPaidDescriptionStrings, "dictionaryRepresentation"), @"publisher_paid_description_strings");
  }
  nameCompact = self->_nameCompact;
  if (nameCompact) {
    [v3 setObject:nameCompact forKey:@"name_compact"];
  }
  nameImageCompactURL = self->_nameImageCompactURL;
  if (nameImageCompactURL) {
    [v3 setObject:nameImageCompactURL forKey:@"name_image_compact_URL"];
  }
  nameImageCompactMetadata = self->_nameImageCompactMetadata;
  if (nameImageCompactMetadata) {
    [v3 setObject:nameImageCompactMetadata forKey:@"name_image_compact_metadata"];
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v49 = self->_has;
  if ((*(_WORD *)&v49 & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_groupingAvailability), @"grouping_availability");
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v49 = self->_has;
    if ((*(_WORD *)&v49 & 0x4000) == 0)
    {
LABEL_100:
      if ((*(unsigned char *)&v49 & 1) == 0) {
        goto LABEL_102;
      }
      goto LABEL_101;
    }
  }
  else if ((*(_WORD *)&v49 & 0x4000) == 0)
  {
    goto LABEL_100;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isHidden), @"is_hidden");
  if (*(_DWORD *)&self->_has) {
LABEL_101:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_behaviorFlags), @"behavior_flags");
LABEL_102:
  articleRecirculationConfiguration = self->_articleRecirculationConfiguration;
  if (articleRecirculationConfiguration) {
    [v3 setObject:articleRecirculationConfiguration forKey:@"article_recirculation_configuration"];
  }
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (publisherSpecifiedArticleIDs) {
    [v3 setObject:publisherSpecifiedArticleIDs forKey:@"publisher_specified_article_IDs"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  if (publisherSpecifiedArticleIDsModifiedDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publisherSpecifiedArticleIDsModifiedDate, "dictionaryRepresentation"), @"publisher_specified_article_IDs_modified_date");
  }
  feedNavImageURL = self->_feedNavImageURL;
  if (feedNavImageURL) {
    [v3 setObject:feedNavImageURL forKey:@"feed_nav_image_URL"];
  }
  latestIssueIDs = self->_latestIssueIDs;
  if (latestIssueIDs) {
    [v3 setObject:latestIssueIDs forKey:@"latest_issue_IDs"];
  }
  archiveIssueListID = self->_archiveIssueListID;
  if (archiveIssueListID) {
    [v3 setObject:archiveIssueListID forKey:@"archive_issue_list_ID"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  magazineGenre = self->_magazineGenre;
  if (magazineGenre) {
    [v3 setObject:magazineGenre forKey:@"magazine_genre"];
  }
  paidBundlePaywallConfigurationJson = self->_paidBundlePaywallConfigurationJson;
  if (paidBundlePaywallConfigurationJson) {
    [v3 setObject:paidBundlePaywallConfigurationJson forKey:@"paid_bundle_paywall_configuration_json"];
  }
  stocksFeedConfigurationJson = self->_stocksFeedConfigurationJson;
  if (stocksFeedConfigurationJson) {
    [v3 setObject:stocksFeedConfigurationJson forKey:@"stocks_feed_configuration_json"];
  }
  supergroupConfigJson = self->_supergroupConfigJson;
  if (supergroupConfigJson) {
    [v3 setObject:supergroupConfigJson forKey:@"supergroup_config_json"];
  }
  supergroupKnobsJson = self->_supergroupKnobsJson;
  if (supergroupKnobsJson) {
    [v3 setObject:supergroupKnobsJson forKey:@"supergroup_knobs_json"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_propertyFlags), @"property_flags");
  }
  recentIssueIDs = self->_recentIssueIDs;
  if (recentIssueIDs) {
    [v3 setObject:recentIssueIDs forKey:@"recent_issue_IDs"];
  }
  nameImageLargeURL = self->_nameImageLargeURL;
  if (nameImageLargeURL) {
    [v3 setObject:nameImageLargeURL forKey:@"name_image_large_URL"];
  }
  nameImageLargeMaskURL = self->_nameImageLargeMaskURL;
  if (nameImageLargeMaskURL) {
    [v3 setObject:nameImageLargeMaskURL forKey:@"name_image_large_mask_URL"];
  }
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID) {
    [v3 setObject:superfeedConfigResourceID forKey:@"superfeed_config_resource_ID"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isSportsRecommendable), @"is_sports_recommendable");
  }
  sportsRecommendationMappingsJson = self->_sportsRecommendationMappingsJson;
  if (sportsRecommendationMappingsJson) {
    [v3 setObject:sportsRecommendationMappingsJson forKey:@"sports_recommendation_mappings_json"];
  }
  highlightsArticleListID = self->_highlightsArticleListID;
  if (highlightsArticleListID) {
    [v3 setObject:highlightsArticleListID forKey:@"highlights_article_list_ID"];
  }
  sportsLogoImageURL = self->_sportsLogoImageURL;
  if (sportsLogoImageURL) {
    [v3 setObject:sportsLogoImageURL forKey:@"sports_logo_image_URL"];
  }
  sportsLogoImageCompactURL = self->_sportsLogoImageCompactURL;
  if (sportsLogoImageCompactURL) {
    [v3 setObject:sportsLogoImageCompactURL forKey:@"sports_logo_image_compact_URL"];
  }
  sportsLogoImageLargeURL = self->_sportsLogoImageLargeURL;
  if (sportsLogoImageLargeURL) {
    [v3 setObject:sportsLogoImageLargeURL forKey:@"sports_logo_image_large_URL"];
  }
  sportsData = self->_sportsData;
  if (sportsData) {
    [v3 setObject:sportsData forKey:@"sports_data"];
  }
  sportsTheme = self->_sportsTheme;
  if (sportsTheme) {
    [v3 setObject:sportsTheme forKey:@"sports_theme"];
  }
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if (navigationChromeBackgroundImageURL) {
    [v3 setObject:navigationChromeBackgroundImageURL forKey:@"navigation_chrome_background_image_URL"];
  }
  darkStyleNavigationChromeBackgroundImageURL = self->_darkStyleNavigationChromeBackgroundImageURL;
  if (darkStyleNavigationChromeBackgroundImageURL) {
    [v3 setObject:darkStyleNavigationChromeBackgroundImageURL forKey:@"dark_style_navigation_chrome_background_image_URL"];
  }
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if (navigationChromeBackgroundImageCompactURL) {
    [v3 setObject:navigationChromeBackgroundImageCompactURL forKey:@"navigation_chrome_background_image_compact_URL"];
  }
  darkStyleNavigationChromeBackgroundImageCompactURL = self->_darkStyleNavigationChromeBackgroundImageCompactURL;
  if (darkStyleNavigationChromeBackgroundImageCompactURL) {
    [v3 setObject:darkStyleNavigationChromeBackgroundImageCompactURL forKey:@"dark_style_navigation_chrome_background_image_compact_URL"];
  }
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if (navigationChromeBackgroundImageLargeURL) {
    [v3 setObject:navigationChromeBackgroundImageLargeURL forKey:@"navigation_chrome_background_image_large_URL"];
  }
  darkStyleNavigationChromeBackgroundImageLargeURL = self->_darkStyleNavigationChromeBackgroundImageLargeURL;
  if (darkStyleNavigationChromeBackgroundImageLargeURL) {
    [v3 setObject:darkStyleNavigationChromeBackgroundImageLargeURL forKey:@"dark_style_navigation_chrome_background_image_large_URL"];
  }
  if (*((unsigned char *)&self->_has + 1)) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_subscriptionRate), @"subscription_rate");
  }
  publisherSpecifiedArticlesJson = self->_publisherSpecifiedArticlesJson;
  if (publisherSpecifiedArticlesJson) {
    [v3 setObject:publisherSpecifiedArticlesJson forKey:@"publisher_specified_articles_json"];
  }
  adTargetingKeywords = self->_adTargetingKeywords;
  if (adTargetingKeywords) {
    [v3 setObject:adTargetingKeywords forKey:@"ad_targeting_keywords"];
  }
  feedNavImageHQURL = self->_feedNavImageHQURL;
  if (feedNavImageHQURL) {
    [v3 setObject:feedNavImageHQURL forKey:@"feed_nav_image_HQ_URL"];
  }
  sportsLogoAltImageURL = self->_sportsLogoAltImageURL;
  if (sportsLogoAltImageURL) {
    [v3 setObject:sportsLogoAltImageURL forKey:@"sports_logo_alt_image_URL"];
  }
  sportsLogoAltImageCompactURL = self->_sportsLogoAltImageCompactURL;
  if (sportsLogoAltImageCompactURL) {
    [v3 setObject:sportsLogoAltImageCompactURL forKey:@"sports_logo_alt_image_compact_URL"];
  }
  sportsLogoAltImageLargeURL = self->_sportsLogoAltImageLargeURL;
  if (sportsLogoAltImageLargeURL) {
    [v3 setObject:sportsLogoAltImageLargeURL forKey:@"sports_logo_alt_image_large_URL"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_propertyFlagsLocalized), @"property_flags_localized");
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_replacementID) {
    PBDataWriterWriteStringField();
  }
  if (self->_primaryAudience) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_logoURL) {
    PBDataWriterWriteStringField();
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  iAdCategories = self->_iAdCategories;
  uint64_t v6 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v121 objects:v137 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v122 != v8) {
          objc_enumerationMutation(iAdCategories);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v121 objects:v137 count:16];
    }
    while (v7);
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v11 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v117 objects:v136 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v118 != v13) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v117 objects:v136 count:16];
    }
    while (v12);
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v16 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v113 objects:v135 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v114;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v114 != v18) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v113 objects:v135 count:16];
    }
    while (v17);
  }
  if (self->_feedConfiguration) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_nameImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageForDarkBackgroundURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageMaskURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageMetadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_coverImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_templateJson) {
    PBDataWriterWriteStringField();
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  channelSectionIDs = self->_channelSectionIDs;
  uint64_t v21 = [(NSMutableArray *)channelSectionIDs countByEnumeratingWithState:&v109 objects:v134 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v110;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v110 != v23) {
          objc_enumerationMutation(channelSectionIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSMutableArray *)channelSectionIDs countByEnumeratingWithState:&v109 objects:v134 count:16];
    }
    while (v22);
  }
  if (self->_channelDefaultSectionID) {
    PBDataWriterWriteStringField();
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  uint64_t v26 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v105 objects:v133 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v106;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v106 != v28) {
          objc_enumerationMutation(channelSectionFeedConfigurations);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v105 objects:v133 count:16];
    }
    while (v27);
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v30 = self->_has;
  if ((*(unsigned char *)&v30 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x2000) == 0)
    {
LABEL_74:
      if ((*(_WORD *)&v30 & 0x8000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_75;
    }
  }
  else if ((*(_WORD *)&v30 & 0x2000) == 0)
  {
    goto LABEL_74;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_75:
  }
    PBDataWriterWriteBOOLField();
LABEL_76:
  if (self->_publisherPaidAuthorizationURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_publisherPaidVerificationURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_publisherPaidWebaccessURL) {
    PBDataWriterWriteStringField();
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  uint64_t v32 = [(NSMutableArray *)publisherPaidFeldsparablePurchaseIDs countByEnumeratingWithState:&v101 objects:v132 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v102;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v102 != v34) {
          objc_enumerationMutation(publisherPaidFeldsparablePurchaseIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v33 = [(NSMutableArray *)publisherPaidFeldsparablePurchaseIDs countByEnumeratingWithState:&v101 objects:v132 count:16];
    }
    while (v33);
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  uint64_t v37 = [(NSMutableArray *)publisherPaidBundlePurchaseIDs countByEnumeratingWithState:&v97 objects:v131 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v98;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v98 != v39) {
          objc_enumerationMutation(publisherPaidBundlePurchaseIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v38 = [(NSMutableArray *)publisherPaidBundlePurchaseIDs countByEnumeratingWithState:&v97 objects:v131 count:16];
    }
    while (v38);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  uint64_t v42 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v93 objects:v130 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v94;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v94 != v44) {
          objc_enumerationMutation(purchaseOfferableConfigurations);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v93 objects:v130 count:16];
    }
    while (v43);
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v46 = self->_has;
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x80000) == 0)
    {
LABEL_105:
      if ((*(unsigned char *)&v46 & 8) == 0) {
        goto LABEL_106;
      }
      goto LABEL_242;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x80000) == 0)
  {
    goto LABEL_105;
  }
  PBDataWriterWriteBOOLField();
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v46 = self->_has;
  if ((*(unsigned char *)&v46 & 8) == 0)
  {
LABEL_106:
    if ((*(unsigned char *)&v46 & 0x10) == 0) {
      goto LABEL_108;
    }
    goto LABEL_107;
  }
LABEL_242:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_107:
  }
    PBDataWriterWriteDoubleField();
LABEL_108:
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  iAdKeywords = self->_iAdKeywords;
  uint64_t v48 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v89 objects:v129 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v90;
    do
    {
      for (muint64_t m = 0; mm != v49; ++mm)
      {
        if (*(void *)v90 != v50) {
          objc_enumerationMutation(iAdKeywords);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v49 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v89 objects:v129 count:16];
    }
    while (v49);
  }
  if (self->_nameImageMaskWidgetLQURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageMaskWidgetHQURL) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_publisherPaidDescriptionStrings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nameCompact) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageCompactMetadata) {
    PBDataWriterWriteDataField();
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x4000) == 0)
    {
LABEL_131:
      if ((*(unsigned char *)&v52 & 1) == 0) {
        goto LABEL_133;
      }
      goto LABEL_132;
    }
  }
  else if ((*(_WORD *)&v52 & 0x4000) == 0)
  {
    goto LABEL_131;
  }
  PBDataWriterWriteBOOLField();
  if (*(_DWORD *)&self->_has) {
LABEL_132:
  }
    PBDataWriterWriteInt64Field();
LABEL_133:
  if (self->_articleRecirculationConfiguration) {
    PBDataWriterWriteDataField();
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  uint64_t v54 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v85 objects:v128 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v86;
    do
    {
      for (nuint64_t n = 0; nn != v55; ++nn)
      {
        if (*(void *)v86 != v56) {
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v55 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v85 objects:v128 count:16];
    }
    while (v55);
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_publisherSpecifiedArticleIDsModifiedDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_feedNavImageURL) {
    PBDataWriterWriteStringField();
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  latestIssueIDs = self->_latestIssueIDs;
  uint64_t v59 = [(NSMutableArray *)latestIssueIDs countByEnumeratingWithState:&v81 objects:v127 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v82;
    do
    {
      for (uint64_t i1 = 0; i1 != v60; ++i1)
      {
        if (*(void *)v82 != v61) {
          objc_enumerationMutation(latestIssueIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v60 = [(NSMutableArray *)latestIssueIDs countByEnumeratingWithState:&v81 objects:v127 count:16];
    }
    while (v60);
  }
  if (self->_archiveIssueListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  if (self->_magazineGenre) {
    PBDataWriterWriteStringField();
  }
  if (self->_paidBundlePaywallConfigurationJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_stocksFeedConfigurationJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_supergroupConfigJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_supergroupKnobsJson) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  recentIssueIDs = self->_recentIssueIDs;
  uint64_t v64 = [(NSMutableArray *)recentIssueIDs countByEnumeratingWithState:&v77 objects:v126 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v78;
    do
    {
      for (uint64_t i2 = 0; i2 != v65; ++i2)
      {
        if (*(void *)v78 != v66) {
          objc_enumerationMutation(recentIssueIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v65 = [(NSMutableArray *)recentIssueIDs countByEnumeratingWithState:&v77 objects:v126 count:16];
    }
    while (v65);
  }
  if (self->_nameImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_nameImageLargeMaskURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_superfeedConfigResourceID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sportsRecommendationMappingsJson) {
    PBDataWriterWriteDataField();
  }
  if (self->_highlightsArticleListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsData) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsTheme) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_darkStyleNavigationChromeBackgroundImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_darkStyleNavigationChromeBackgroundImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_navigationChromeBackgroundImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_darkStyleNavigationChromeBackgroundImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_publisherSpecifiedArticlesJson) {
    PBDataWriterWriteStringField();
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  adTargetingKeywords = self->_adTargetingKeywords;
  uint64_t v69 = [(NSMutableArray *)adTargetingKeywords countByEnumeratingWithState:&v73 objects:v125 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v74;
    do
    {
      for (uint64_t i3 = 0; i3 != v70; ++i3)
      {
        if (*(void *)v74 != v71) {
          objc_enumerationMutation(adTargetingKeywords);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v70 = [(NSMutableArray *)adTargetingKeywords countByEnumeratingWithState:&v73 objects:v125 count:16];
    }
    while (v70);
  }
  if (self->_feedNavImageHQURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoAltImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoAltImageCompactURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sportsLogoAltImageLargeURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 112) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v5 + 632) = self->_type;
    *(_DWORD *)(v5 + 648) |= 0x400u;
  }

  *(void *)(v5 + 272) = [(NSString *)self->_name copyWithZone:a3];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_contentProvider;
    *(_DWORD *)(v5 + 648) |= 2u;
    $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 641) = self->_isPublic;
  *(_DWORD *)(v5 + 648) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 637) = self->_isDeprecated;
    *(_DWORD *)(v5 + 648) |= 0x1000u;
  }
LABEL_7:

  *(void *)(v5 + 504) = [(NSString *)self->_replacementID copyWithZone:a3];
  *(void *)(v5 + 408) = [(NSString *)self->_primaryAudience copyWithZone:a3];

  *(void *)(v5 + 400) = [(NSString *)self->_parentID copyWithZone:a3];
  *(void *)(v5 + 256) = [(NSString *)self->_logoURL copyWithZone:a3];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  iAdCategories = self->_iAdCategories;
  uint64_t v8 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v137 objects:v153 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v138 != v10) {
          objc_enumerationMutation(iAdCategories);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v137 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addIAdCategories:v12];
      }
      uint64_t v9 = [(NSMutableArray *)iAdCategories countByEnumeratingWithState:&v137 objects:v153 count:16];
    }
    while (v9);
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  uint64_t v14 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v133 objects:v152 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v134 != v16) {
          objc_enumerationMutation(blockedStorefrontIDs);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v133 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBlockedStorefrontIDs:v18];
      }
      uint64_t v15 = [(NSMutableArray *)blockedStorefrontIDs countByEnumeratingWithState:&v133 objects:v152 count:16];
    }
    while (v15);
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  uint64_t v20 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v129 objects:v151 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v130;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v130 != v22) {
          objc_enumerationMutation(allowedStorefrontIDs);
        }
        v24 = (void *)[*(id *)(*((void *)&v129 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAllowedStorefrontIDs:v24];
      }
      uint64_t v21 = [(NSMutableArray *)allowedStorefrontIDs countByEnumeratingWithState:&v129 objects:v151 count:16];
    }
    while (v21);
  }

  *(void *)(v5 + 184) = [(NTPBFeedConfiguration *)self->_feedConfiguration copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_score;
    *(_DWORD *)(v5 + 648) |= 0x80u;
  }

  *(void *)(v5 + 360) = [(NSString *)self->_nameImageURL copyWithZone:a3];
  *(void *)(v5 + 304) = [(NSString *)self->_nameImageForDarkBackgroundURL copyWithZone:a3];

  *(void *)(v5 + 328) = [(NSString *)self->_nameImageMaskURL copyWithZone:a3];
  *(void *)(v5 + 352) = [(NSData *)self->_nameImageMetadata copyWithZone:a3];

  *(void *)(v5 + 152) = [(NSString *)self->_coverImageURL copyWithZone:a3];
  *(void *)(v5 + 624) = [(NSString *)self->_templateJson copyWithZone:a3];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  channelSectionIDs = self->_channelSectionIDs;
  uint64_t v26 = [(NSMutableArray *)channelSectionIDs countByEnumeratingWithState:&v125 objects:v150 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v126;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v126 != v28) {
          objc_enumerationMutation(channelSectionIDs);
        }
        $33EA3DE8810A8DA2B3B0E292DEF75CDE v30 = (void *)[*(id *)(*((void *)&v125 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addChannelSectionIDs:v30];
      }
      uint64_t v27 = [(NSMutableArray *)channelSectionIDs countByEnumeratingWithState:&v125 objects:v150 count:16];
    }
    while (v27);
  }

  *(void *)(v5 + 128) = [(NSString *)self->_channelDefaultSectionID copyWithZone:a3];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  uint64_t v32 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v121 objects:v149 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v122;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v122 != v34) {
          objc_enumerationMutation(channelSectionFeedConfigurations);
        }
        v36 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addChannelSectionFeedConfigurations:v36];
      }
      uint64_t v33 = [(NSMutableArray *)channelSectionFeedConfigurations countByEnumeratingWithState:&v121 objects:v149 count:16];
    }
    while (v33);
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v37 = self->_has;
  if ((*(unsigned char *)&v37 & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_minimumNewsVersion;
    *(_DWORD *)(v5 + 648) |= 4u;
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x2000) == 0)
    {
LABEL_46:
      if ((*(_WORD *)&v37 & 0x8000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v37 & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  *(unsigned char *)(v5 + 638) = self->_isExplicitContent;
  *(_DWORD *)(v5 + 648) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_47:
    *(unsigned char *)(v5 + 640) = self->_isNotificationEnabled;
    *(_DWORD *)(v5 + 648) |= 0x8000u;
  }
LABEL_48:

  *(void *)(v5 + 416) = [(NSString *)self->_publisherPaidAuthorizationURL copyWithZone:a3];
  *(void *)(v5 + 448) = [(NSString *)self->_publisherPaidVerificationURL copyWithZone:a3];

  *(void *)(v5 + 456) = [(NSString *)self->_publisherPaidWebaccessURL copyWithZone:a3];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  uint64_t v39 = [(NSMutableArray *)publisherPaidFeldsparablePurchaseIDs countByEnumeratingWithState:&v117 objects:v148 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v118;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v118 != v41) {
          objc_enumerationMutation(publisherPaidFeldsparablePurchaseIDs);
        }
        uint64_t v43 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addPublisherPaidFeldsparablePurchaseIDs:v43];
      }
      uint64_t v40 = [(NSMutableArray *)publisherPaidFeldsparablePurchaseIDs countByEnumeratingWithState:&v117 objects:v148 count:16];
    }
    while (v40);
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  uint64_t v45 = [(NSMutableArray *)publisherPaidBundlePurchaseIDs countByEnumeratingWithState:&v113 objects:v147 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v114;
    do
    {
      for (juint64_t j = 0; jj != v46; ++jj)
      {
        if (*(void *)v114 != v47) {
          objc_enumerationMutation(publisherPaidBundlePurchaseIDs);
        }
        uint64_t v49 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addPublisherPaidBundlePurchaseIDs:v49];
      }
      uint64_t v46 = [(NSMutableArray *)publisherPaidBundlePurchaseIDs countByEnumeratingWithState:&v113 objects:v147 count:16];
    }
    while (v46);
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  uint64_t v51 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v109 objects:v146 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v110;
    do
    {
      for (kuint64_t k = 0; kk != v52; ++kk)
      {
        if (*(void *)v110 != v53) {
          objc_enumerationMutation(purchaseOfferableConfigurations);
        }
        uint64_t v55 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addPurchaseOfferableConfiguration:v55];
      }
      uint64_t v52 = [(NSMutableArray *)purchaseOfferableConfigurations countByEnumeratingWithState:&v109 objects:v146 count:16];
    }
    while (v52);
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    *(unsigned char *)(v5 + 643) = self->_publisherPaidLeakyPaywallOptOut;
    *(_DWORD *)(v5 + 648) |= 0x40000u;
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v56 = self->_has;
    if ((*(_DWORD *)&v56 & 0x80000) == 0)
    {
LABEL_71:
      if ((*(unsigned char *)&v56 & 8) == 0) {
        goto LABEL_72;
      }
      goto LABEL_132;
    }
  }
  else if ((*(_DWORD *)&v56 & 0x80000) == 0)
  {
    goto LABEL_71;
  }
  *(unsigned char *)(v5 + 644) = self->_publisherPaidWebOptIn;
  *(_DWORD *)(v5 + 648) |= 0x80000u;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v56 = self->_has;
  if ((*(unsigned char *)&v56 & 8) == 0)
  {
LABEL_72:
    if ((*(unsigned char *)&v56 & 0x10) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_132:
  *(void *)(v5 + 32) = self->_nameImageBaselineShift;
  *(_DWORD *)(v5 + 648) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_73:
    *(double *)(v5 + 40) = self->_nameImageScaleFactor;
    *(_DWORD *)(v5 + 648) |= 0x10u;
  }
LABEL_74:
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  iAdKeywords = self->_iAdKeywords;
  uint64_t v58 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v105 objects:v145 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v106;
    do
    {
      for (muint64_t m = 0; mm != v59; ++mm)
      {
        if (*(void *)v106 != v60) {
          objc_enumerationMutation(iAdKeywords);
        }
        v62 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addIAdKeywords:v62];
      }
      uint64_t v59 = [(NSMutableArray *)iAdKeywords countByEnumeratingWithState:&v105 objects:v145 count:16];
    }
    while (v59);
  }

  *(void *)(v5 + 344) = [(NSString *)self->_nameImageMaskWidgetLQURL copyWithZone:a3];
  *(void *)(v5 + 336) = [(NSString *)self->_nameImageMaskWidgetHQURL copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(unsigned char *)(v5 + 636) = self->_hideAccessoryText;
    *(_DWORD *)(v5 + 648) |= 0x800u;
  }

  *(void *)(v5 + 432) = [(NTPBPublisherPaidDescriptionStrings *)self->_publisherPaidDescriptionStrings copyWithZone:a3];
  *(void *)(v5 + 280) = [(NSString *)self->_nameCompact copyWithZone:a3];

  *(void *)(v5 + 296) = [(NSString *)self->_nameImageCompactURL copyWithZone:a3];
  *(void *)(v5 + 288) = [(NSData *)self->_nameImageCompactMetadata copyWithZone:a3];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v63 = self->_has;
  if ((*(_WORD *)&v63 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 208) = self->_groupingAvailability;
    *(_DWORD *)(v5 + 648) |= 0x200u;
    $33EA3DE8810A8DA2B3B0E292DEF75CDE v63 = self->_has;
    if ((*(_WORD *)&v63 & 0x4000) == 0)
    {
LABEL_85:
      if ((*(unsigned char *)&v63 & 1) == 0) {
        goto LABEL_87;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&v63 & 0x4000) == 0)
  {
    goto LABEL_85;
  }
  *(unsigned char *)(v5 + 639) = self->_isHidden;
  *(_DWORD *)(v5 + 648) |= 0x4000u;
  if (*(_DWORD *)&self->_has)
  {
LABEL_86:
    *(void *)(v5 + 8) = self->_behaviorFlags;
    *(_DWORD *)(v5 + 648) |= 1u;
  }
LABEL_87:

  *(void *)(v5 + 104) = [(NSData *)self->_articleRecirculationConfiguration copyWithZone:a3];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  uint64_t v65 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v101 objects:v144 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v102;
    do
    {
      for (nuint64_t n = 0; nn != v66; ++nn)
      {
        if (*(void *)v102 != v67) {
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        }
        uint64_t v69 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addPublisherSpecifiedArticleIDs:v69];
      }
      uint64_t v66 = [(NSMutableArray *)publisherSpecifiedArticleIDs countByEnumeratingWithState:&v101 objects:v144 count:16];
    }
    while (v66);
  }

  *(void *)(v5 + 592) = [(NSString *)self->_subtitle copyWithZone:a3];
  *(void *)(v5 + 472) = [(NTPBDate *)self->_publisherSpecifiedArticleIDsModifiedDate copyWithZone:a3];

  *(void *)(v5 + 200) = [(NSString *)self->_feedNavImageURL copyWithZone:a3];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  latestIssueIDs = self->_latestIssueIDs;
  uint64_t v71 = [(NSMutableArray *)latestIssueIDs countByEnumeratingWithState:&v97 objects:v143 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v98;
    do
    {
      for (uint64_t i1 = 0; i1 != v72; ++i1)
      {
        if (*(void *)v98 != v73) {
          objc_enumerationMutation(latestIssueIDs);
        }
        long long v75 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addLatestIssueIDs:v75];
      }
      uint64_t v72 = [(NSMutableArray *)latestIssueIDs countByEnumeratingWithState:&v97 objects:v143 count:16];
    }
    while (v72);
  }

  *(void *)(v5 + 96) = [(NSString *)self->_archiveIssueListID copyWithZone:a3];
  *(void *)(v5 + 240) = [(NSString *)self->_language copyWithZone:a3];

  *(void *)(v5 + 264) = [(NSString *)self->_magazineGenre copyWithZone:a3];
  *(void *)(v5 + 392) = [(NSString *)self->_paidBundlePaywallConfigurationJson copyWithZone:a3];

  *(void *)(v5 + 584) = [(NSString *)self->_stocksFeedConfigurationJson copyWithZone:a3];
  *(void *)(v5 + 608) = [(NSString *)self->_supergroupConfigJson copyWithZone:a3];

  *(void *)(v5 + 616) = [(NSString *)self->_supergroupKnobsJson copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_propertyFlags;
    *(_DWORD *)(v5 + 648) |= 0x20u;
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  recentIssueIDs = self->_recentIssueIDs;
  uint64_t v77 = [(NSMutableArray *)recentIssueIDs countByEnumeratingWithState:&v93 objects:v142 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v94;
    do
    {
      for (uint64_t i2 = 0; i2 != v78; ++i2)
      {
        if (*(void *)v94 != v79) {
          objc_enumerationMutation(recentIssueIDs);
        }
        long long v81 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v5 addRecentIssueIDs:v81];
      }
      uint64_t v78 = [(NSMutableArray *)recentIssueIDs countByEnumeratingWithState:&v93 objects:v142 count:16];
    }
    while (v78);
  }

  *(void *)(v5 + 320) = [(NSString *)self->_nameImageLargeURL copyWithZone:a3];
  *(void *)(v5 + 312) = [(NSString *)self->_nameImageLargeMaskURL copyWithZone:a3];

  *(void *)(v5 + 600) = [(NSString *)self->_superfeedConfigResourceID copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(unsigned char *)(v5 + 642) = self->_isSportsRecommendable;
    *(_DWORD *)(v5 + 648) |= 0x20000u;
  }

  *(void *)(v5 + 568) = [(NSData *)self->_sportsRecommendationMappingsJson copyWithZone:a3];
  *(void *)(v5 + 216) = [(NSString *)self->_highlightsArticleListID copyWithZone:a3];

  *(void *)(v5 + 560) = [(NSString *)self->_sportsLogoImageURL copyWithZone:a3];
  *(void *)(v5 + 544) = [(NSString *)self->_sportsLogoImageCompactURL copyWithZone:a3];

  *(void *)(v5 + 552) = [(NSString *)self->_sportsLogoImageLargeURL copyWithZone:a3];
  *(void *)(v5 + 512) = [(NSString *)self->_sportsData copyWithZone:a3];

  *(void *)(v5 + 576) = [(NSString *)self->_sportsTheme copyWithZone:a3];
  *(void *)(v5 + 384) = [(NSString *)self->_navigationChromeBackgroundImageURL copyWithZone:a3];

  *(void *)(v5 + 176) = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageURL copyWithZone:a3];
  *(void *)(v5 + 368) = [(NSString *)self->_navigationChromeBackgroundImageCompactURL copyWithZone:a3];

  *(void *)(v5 + 160) = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageCompactURL copyWithZone:a3];
  *(void *)(v5 + 376) = [(NSString *)self->_navigationChromeBackgroundImageLargeURL copyWithZone:a3];

  *(void *)(v5 + 168) = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageLargeURL copyWithZone:a3];
  if (*((unsigned char *)&self->_has + 1))
  {
    *(double *)(v5 + 72) = self->_subscriptionRate;
    *(_DWORD *)(v5 + 648) |= 0x100u;
  }

  *(void *)(v5 + 480) = [(NSString *)self->_publisherSpecifiedArticlesJson copyWithZone:a3];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  adTargetingKeywords = self->_adTargetingKeywords;
  uint64_t v83 = [(NSMutableArray *)adTargetingKeywords countByEnumeratingWithState:&v89 objects:v141 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v90;
    do
    {
      for (uint64_t i3 = 0; i3 != v84; ++i3)
      {
        if (*(void *)v90 != v85) {
          objc_enumerationMutation(adTargetingKeywords);
        }
        long long v87 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * i3) copyWithZone:a3];
        [(id)v5 addAdTargetingKeywords:v87];
      }
      uint64_t v84 = [(NSMutableArray *)adTargetingKeywords countByEnumeratingWithState:&v89 objects:v141 count:16];
    }
    while (v84);
  }

  *(void *)(v5 + 192) = [(NSString *)self->_feedNavImageHQURL copyWithZone:a3];
  *(void *)(v5 + 536) = [(NSString *)self->_sportsLogoAltImageURL copyWithZone:a3];

  *(void *)(v5 + 520) = [(NSString *)self->_sportsLogoAltImageCompactURL copyWithZone:a3];
  *(void *)(v5 + 528) = [(NSString *)self->_sportsLogoAltImageLargeURL copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_propertyFlagsLocalized;
    *(_DWORD *)(v5 + 648) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  base = self->_base;
  if ((unint64_t)base | *((void *)a3 + 14))
  {
    int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  int v8 = *((_DWORD *)a3 + 162);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_type != *((_DWORD *)a3 + 158)) {
      goto LABEL_29;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_29;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)a3 + 34))
  {
    int v5 = -[NSString isEqual:](name, "isEqual:");
    if (!v5) {
      return v5;
    }
    $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  }
  int v10 = *((_DWORD *)a3 + 162);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_contentProvider != *((void *)a3 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0) {
      goto LABEL_29;
    }
    if (self->_isPublic)
    {
      if (!*((unsigned char *)a3 + 641)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 641))
    {
      goto LABEL_29;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0) {
      goto LABEL_29;
    }
    if (self->_isDeprecated)
    {
      if (!*((unsigned char *)a3 + 637)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 637))
    {
      goto LABEL_29;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_29;
  }
  replacementID = self->_replacementID;
  if ((unint64_t)replacementID | *((void *)a3 + 63))
  {
    int v5 = -[NSString isEqual:](replacementID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  primaryAudience = self->_primaryAudience;
  if ((unint64_t)primaryAudience | *((void *)a3 + 51))
  {
    int v5 = -[NSString isEqual:](primaryAudience, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  parentID = self->_parentID;
  if ((unint64_t)parentID | *((void *)a3 + 50))
  {
    int v5 = -[NSString isEqual:](parentID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  logoURL = self->_logoURL;
  if ((unint64_t)logoURL | *((void *)a3 + 32))
  {
    int v5 = -[NSString isEqual:](logoURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  iAdCategories = self->_iAdCategories;
  if ((unint64_t)iAdCategories | *((void *)a3 + 28))
  {
    int v5 = -[NSMutableArray isEqual:](iAdCategories, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if ((unint64_t)blockedStorefrontIDs | *((void *)a3 + 15))
  {
    int v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if ((unint64_t)allowedStorefrontIDs | *((void *)a3 + 11))
  {
    int v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  feedConfiguratiouint64_t n = self->_feedConfiguration;
  if ((unint64_t)feedConfiguration | *((void *)a3 + 23))
  {
    int v5 = -[NTPBFeedConfiguration isEqual:](feedConfiguration, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  int v19 = *((_DWORD *)a3 + 162);
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_score != *((void *)a3 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_29;
  }
  nameImageURL = self->_nameImageURL;
  if ((unint64_t)nameImageURL | *((void *)a3 + 45))
  {
    int v5 = -[NSString isEqual:](nameImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if ((unint64_t)nameImageForDarkBackgroundURL | *((void *)a3 + 38))
  {
    int v5 = -[NSString isEqual:](nameImageForDarkBackgroundURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageMaskURL = self->_nameImageMaskURL;
  if ((unint64_t)nameImageMaskURL | *((void *)a3 + 41))
  {
    int v5 = -[NSString isEqual:](nameImageMaskURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageMetadata = self->_nameImageMetadata;
  if ((unint64_t)nameImageMetadata | *((void *)a3 + 44))
  {
    int v5 = -[NSData isEqual:](nameImageMetadata, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  coverImageURL = self->_coverImageURL;
  if ((unint64_t)coverImageURL | *((void *)a3 + 19))
  {
    int v5 = -[NSString isEqual:](coverImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  templateJsouint64_t n = self->_templateJson;
  if ((unint64_t)templateJson | *((void *)a3 + 78))
  {
    int v5 = -[NSString isEqual:](templateJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  channelSectionIDs = self->_channelSectionIDs;
  if ((unint64_t)channelSectionIDs | *((void *)a3 + 18))
  {
    int v5 = -[NSMutableArray isEqual:](channelSectionIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  channelDefaultSectionID = self->_channelDefaultSectionID;
  if ((unint64_t)channelDefaultSectionID | *((void *)a3 + 16))
  {
    int v5 = -[NSString isEqual:](channelDefaultSectionID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  if ((unint64_t)channelSectionFeedConfigurations | *((void *)a3 + 17))
  {
    int v5 = -[NSMutableArray isEqual:](channelSectionFeedConfigurations, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v29 = self->_has;
  int v30 = *((_DWORD *)a3 + 162);
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
    if ((v30 & 4) == 0 || self->_minimumNewsVersion != *((void *)a3 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((v30 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0) {
      goto LABEL_29;
    }
    if (self->_isExplicitContent)
    {
      if (!*((unsigned char *)a3 + 638)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 638))
    {
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v29 & 0x8000) != 0)
  {
    if ((v30 & 0x8000) == 0) {
      goto LABEL_29;
    }
    if (self->_isNotificationEnabled)
    {
      if (!*((unsigned char *)a3 + 640)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 640))
    {
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x8000) != 0)
  {
    goto LABEL_29;
  }
  publisherPaidAuthorizationURL = self->_publisherPaidAuthorizationURL;
  if ((unint64_t)publisherPaidAuthorizationURL | *((void *)a3 + 52))
  {
    int v5 = -[NSString isEqual:](publisherPaidAuthorizationURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherPaidVerificationURL = self->_publisherPaidVerificationURL;
  if ((unint64_t)publisherPaidVerificationURL | *((void *)a3 + 56))
  {
    int v5 = -[NSString isEqual:](publisherPaidVerificationURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherPaidWebaccessURL = self->_publisherPaidWebaccessURL;
  if ((unint64_t)publisherPaidWebaccessURL | *((void *)a3 + 57))
  {
    int v5 = -[NSString isEqual:](publisherPaidWebaccessURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if ((unint64_t)publisherPaidFeldsparablePurchaseIDs | *((void *)a3 + 55))
  {
    int v5 = -[NSMutableArray isEqual:](publisherPaidFeldsparablePurchaseIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if ((unint64_t)publisherPaidBundlePurchaseIDs | *((void *)a3 + 53))
  {
    int v5 = -[NSMutableArray isEqual:](publisherPaidBundlePurchaseIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  if ((unint64_t)purchaseOfferableConfigurations | *((void *)a3 + 61))
  {
    int v5 = -[NSMutableArray isEqual:](purchaseOfferableConfigurations, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v37 = self->_has;
  int v38 = *((_DWORD *)a3 + 162);
  if ((*(_DWORD *)&v37 & 0x40000) != 0)
  {
    if ((v38 & 0x40000) == 0) {
      goto LABEL_29;
    }
    if (self->_publisherPaidLeakyPaywallOptOut)
    {
      if (!*((unsigned char *)a3 + 643)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 643))
    {
      goto LABEL_29;
    }
  }
  else if ((v38 & 0x40000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_DWORD *)&v37 & 0x80000) != 0)
  {
    if ((v38 & 0x80000) == 0) {
      goto LABEL_29;
    }
    if (self->_publisherPaidWebOptIn)
    {
      if (!*((unsigned char *)a3 + 644)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 644))
    {
      goto LABEL_29;
    }
  }
  else if ((v38 & 0x80000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&v37 & 8) != 0)
  {
    if ((v38 & 8) == 0 || self->_nameImageBaselineShift != *((void *)a3 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((v38 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&v37 & 0x10) != 0)
  {
    if ((v38 & 0x10) == 0 || self->_nameImageScaleFactor != *((double *)a3 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((v38 & 0x10) != 0)
  {
    goto LABEL_29;
  }
  iAdKeywords = self->_iAdKeywords;
  if ((unint64_t)iAdKeywords | *((void *)a3 + 29))
  {
    int v5 = -[NSMutableArray isEqual:](iAdKeywords, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageMaskWidgetLQURL = self->_nameImageMaskWidgetLQURL;
  if ((unint64_t)nameImageMaskWidgetLQURL | *((void *)a3 + 43))
  {
    int v5 = -[NSString isEqual:](nameImageMaskWidgetLQURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageMaskWidgetHQURL = self->_nameImageMaskWidgetHQURL;
  if ((unint64_t)nameImageMaskWidgetHQURL | *((void *)a3 + 42))
  {
    int v5 = -[NSString isEqual:](nameImageMaskWidgetHQURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  int v42 = *((_DWORD *)a3 + 162);
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    if ((v42 & 0x800) == 0) {
      goto LABEL_29;
    }
    if (self->_hideAccessoryText)
    {
      if (!*((unsigned char *)a3 + 636)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 636))
    {
      goto LABEL_29;
    }
  }
  else if ((v42 & 0x800) != 0)
  {
    goto LABEL_29;
  }
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  if ((unint64_t)publisherPaidDescriptionStrings | *((void *)a3 + 54))
  {
    int v5 = -[NTPBPublisherPaidDescriptionStrings isEqual:](publisherPaidDescriptionStrings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameCompact = self->_nameCompact;
  if ((unint64_t)nameCompact | *((void *)a3 + 35))
  {
    int v5 = -[NSString isEqual:](nameCompact, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageCompactURL = self->_nameImageCompactURL;
  if ((unint64_t)nameImageCompactURL | *((void *)a3 + 37))
  {
    int v5 = -[NSString isEqual:](nameImageCompactURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageCompactMetadata = self->_nameImageCompactMetadata;
  if ((unint64_t)nameImageCompactMetadata | *((void *)a3 + 36))
  {
    int v5 = -[NSData isEqual:](nameImageCompactMetadata, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v47 = self->_has;
  int v48 = *((_DWORD *)a3 + 162);
  if ((*(_WORD *)&v47 & 0x200) != 0)
  {
    if ((v48 & 0x200) == 0 || self->_groupingAvailability != *((_DWORD *)a3 + 52)) {
      goto LABEL_29;
    }
  }
  else if ((v48 & 0x200) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    if ((v48 & 0x4000) == 0) {
      goto LABEL_29;
    }
    if (self->_isHidden)
    {
      if (!*((unsigned char *)a3 + 639)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 639))
    {
      goto LABEL_29;
    }
  }
  else if ((v48 & 0x4000) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&v47)
  {
    if ((v48 & 1) == 0 || self->_behaviorFlags != *((void *)a3 + 1)) {
      goto LABEL_29;
    }
  }
  else if (v48)
  {
    goto LABEL_29;
  }
  articleRecirculationConfiguratiouint64_t n = self->_articleRecirculationConfiguration;
  if ((unint64_t)articleRecirculationConfiguration | *((void *)a3 + 13))
  {
    int v5 = -[NSData isEqual:](articleRecirculationConfiguration, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if ((unint64_t)publisherSpecifiedArticleIDs | *((void *)a3 + 58))
  {
    int v5 = -[NSMutableArray isEqual:](publisherSpecifiedArticleIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)a3 + 74))
  {
    int v5 = -[NSString isEqual:](subtitle, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  if ((unint64_t)publisherSpecifiedArticleIDsModifiedDate | *((void *)a3 + 59))
  {
    int v5 = -[NTPBDate isEqual:](publisherSpecifiedArticleIDsModifiedDate, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  feedNavImageURL = self->_feedNavImageURL;
  if ((unint64_t)feedNavImageURL | *((void *)a3 + 25))
  {
    int v5 = -[NSString isEqual:](feedNavImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  latestIssueIDs = self->_latestIssueIDs;
  if ((unint64_t)latestIssueIDs | *((void *)a3 + 31))
  {
    int v5 = -[NSMutableArray isEqual:](latestIssueIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  archiveIssueListID = self->_archiveIssueListID;
  if ((unint64_t)archiveIssueListID | *((void *)a3 + 12))
  {
    int v5 = -[NSString isEqual:](archiveIssueListID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)a3 + 30))
  {
    int v5 = -[NSString isEqual:](language, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  magazineGenre = self->_magazineGenre;
  if ((unint64_t)magazineGenre | *((void *)a3 + 33))
  {
    int v5 = -[NSString isEqual:](magazineGenre, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  paidBundlePaywallConfigurationJsouint64_t n = self->_paidBundlePaywallConfigurationJson;
  if ((unint64_t)paidBundlePaywallConfigurationJson | *((void *)a3 + 49))
  {
    int v5 = -[NSString isEqual:](paidBundlePaywallConfigurationJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  stocksFeedConfigurationJsouint64_t n = self->_stocksFeedConfigurationJson;
  if ((unint64_t)stocksFeedConfigurationJson | *((void *)a3 + 73))
  {
    int v5 = -[NSString isEqual:](stocksFeedConfigurationJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  supergroupConfigJsouint64_t n = self->_supergroupConfigJson;
  if ((unint64_t)supergroupConfigJson | *((void *)a3 + 76))
  {
    int v5 = -[NSString isEqual:](supergroupConfigJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  supergroupKnobsJsouint64_t n = self->_supergroupKnobsJson;
  if ((unint64_t)supergroupKnobsJson | *((void *)a3 + 77))
  {
    int v5 = -[NSString isEqual:](supergroupKnobsJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  int v62 = *((_DWORD *)a3 + 162);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v62 & 0x20) == 0 || self->_propertyFlags != *((void *)a3 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((v62 & 0x20) != 0)
  {
    goto LABEL_29;
  }
  recentIssueIDs = self->_recentIssueIDs;
  if ((unint64_t)recentIssueIDs | *((void *)a3 + 62))
  {
    int v5 = -[NSMutableArray isEqual:](recentIssueIDs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageLargeURL = self->_nameImageLargeURL;
  if ((unint64_t)nameImageLargeURL | *((void *)a3 + 40))
  {
    int v5 = -[NSString isEqual:](nameImageLargeURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  nameImageLargeMaskURL = self->_nameImageLargeMaskURL;
  if ((unint64_t)nameImageLargeMaskURL | *((void *)a3 + 39))
  {
    int v5 = -[NSString isEqual:](nameImageLargeMaskURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if ((unint64_t)superfeedConfigResourceID | *((void *)a3 + 75))
  {
    int v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  int v67 = *((_DWORD *)a3 + 162);
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    if ((v67 & 0x20000) == 0) {
      goto LABEL_29;
    }
    if (self->_isSportsRecommendable)
    {
      if (!*((unsigned char *)a3 + 642)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 642))
    {
      goto LABEL_29;
    }
  }
  else if ((v67 & 0x20000) != 0)
  {
    goto LABEL_29;
  }
  sportsRecommendationMappingsJsouint64_t n = self->_sportsRecommendationMappingsJson;
  if ((unint64_t)sportsRecommendationMappingsJson | *((void *)a3 + 71))
  {
    int v5 = -[NSData isEqual:](sportsRecommendationMappingsJson, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  highlightsArticleListID = self->_highlightsArticleListID;
  if ((unint64_t)highlightsArticleListID | *((void *)a3 + 27))
  {
    int v5 = -[NSString isEqual:](highlightsArticleListID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  sportsLogoImageURL = self->_sportsLogoImageURL;
  if ((unint64_t)sportsLogoImageURL | *((void *)a3 + 70))
  {
    int v5 = -[NSString isEqual:](sportsLogoImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  sportsLogoImageCompactURL = self->_sportsLogoImageCompactURL;
  if ((unint64_t)sportsLogoImageCompactURL | *((void *)a3 + 68))
  {
    int v5 = -[NSString isEqual:](sportsLogoImageCompactURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  sportsLogoImageLargeURL = self->_sportsLogoImageLargeURL;
  if ((unint64_t)sportsLogoImageLargeURL | *((void *)a3 + 69))
  {
    int v5 = -[NSString isEqual:](sportsLogoImageLargeURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  sportsData = self->_sportsData;
  if ((unint64_t)sportsData | *((void *)a3 + 64))
  {
    int v5 = -[NSString isEqual:](sportsData, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  sportsTheme = self->_sportsTheme;
  if ((unint64_t)sportsTheme | *((void *)a3 + 72))
  {
    int v5 = -[NSString isEqual:](sportsTheme, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if ((unint64_t)navigationChromeBackgroundImageURL | *((void *)a3 + 48))
  {
    int v5 = -[NSString isEqual:](navigationChromeBackgroundImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  darkStyleNavigationChromeBackgroundImageURL = self->_darkStyleNavigationChromeBackgroundImageURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageURL | *((void *)a3 + 22))
  {
    int v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if ((unint64_t)navigationChromeBackgroundImageCompactURL | *((void *)a3 + 46))
  {
    int v5 = -[NSString isEqual:](navigationChromeBackgroundImageCompactURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  darkStyleNavigationChromeBackgroundImageCompactURL = self->_darkStyleNavigationChromeBackgroundImageCompactURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageCompactURL | *((void *)a3 + 20))
  {
    int v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageCompactURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if ((unint64_t)navigationChromeBackgroundImageLargeURL | *((void *)a3 + 47))
  {
    int v5 = -[NSString isEqual:](navigationChromeBackgroundImageLargeURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  darkStyleNavigationChromeBackgroundImageLargeURL = self->_darkStyleNavigationChromeBackgroundImageLargeURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageLargeURL | *((void *)a3 + 21))
  {
    int v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageLargeURL, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  int v81 = *((_DWORD *)a3 + 162);
  if ((*((unsigned char *)&self->_has + 1) & 1) == 0)
  {
    if ((v81 & 0x100) == 0) {
      goto LABEL_251;
    }
LABEL_29:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v81 & 0x100) == 0 || self->_subscriptionRate != *((double *)a3 + 9)) {
    goto LABEL_29;
  }
LABEL_251:
  publisherSpecifiedArticlesJsouint64_t n = self->_publisherSpecifiedArticlesJson;
  if (!((unint64_t)publisherSpecifiedArticlesJson | *((void *)a3 + 60))
    || (int v5 = -[NSString isEqual:](publisherSpecifiedArticlesJson, "isEqual:")) != 0)
  {
    adTargetingKeywords = self->_adTargetingKeywords;
    if (!((unint64_t)adTargetingKeywords | *((void *)a3 + 10))
      || (int v5 = -[NSMutableArray isEqual:](adTargetingKeywords, "isEqual:")) != 0)
    {
      feedNavImageHQURL = self->_feedNavImageHQURL;
      if (!((unint64_t)feedNavImageHQURL | *((void *)a3 + 24))
        || (int v5 = -[NSString isEqual:](feedNavImageHQURL, "isEqual:")) != 0)
      {
        sportsLogoAltImageURL = self->_sportsLogoAltImageURL;
        if (!((unint64_t)sportsLogoAltImageURL | *((void *)a3 + 67))
          || (int v5 = -[NSString isEqual:](sportsLogoAltImageURL, "isEqual:")) != 0)
        {
          sportsLogoAltImageCompactURL = self->_sportsLogoAltImageCompactURL;
          if (!((unint64_t)sportsLogoAltImageCompactURL | *((void *)a3 + 65))
            || (int v5 = -[NSString isEqual:](sportsLogoAltImageCompactURL, "isEqual:")) != 0)
          {
            sportsLogoAltImageLargeURL = self->_sportsLogoAltImageLargeURL;
            if (!((unint64_t)sportsLogoAltImageLargeURL | *((void *)a3 + 66))
              || (int v5 = -[NSString isEqual:](sportsLogoAltImageLargeURL, "isEqual:")) != 0)
            {
              int v88 = *((_DWORD *)a3 + 162);
              LOBYTE(v5) = (v88 & 0x40) == 0;
              if ((*(unsigned char *)&self->_has & 0x40) != 0)
              {
                if ((v88 & 0x40) == 0 || self->_propertyFlagsLocalized != *((void *)a3 + 7)) {
                  goto LABEL_29;
                }
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

- (unint64_t)hash
{
  unint64_t v104 = [(NTPBRecordBase *)self->_base hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    uint64_t v103 = 2654435761 * self->_type;
  }
  else {
    uint64_t v103 = 0;
  }
  NSUInteger v102 = [(NSString *)self->_name hash];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
    uint64_t v101 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v100 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v101 = 2654435761 * self->_contentProvider;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v100 = 2654435761 * self->_isPublic;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_7:
    uint64_t v99 = 2654435761 * self->_isDeprecated;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v99 = 0;
LABEL_11:
  NSUInteger v98 = [(NSString *)self->_replacementID hash];
  NSUInteger v97 = [(NSString *)self->_primaryAudience hash];
  NSUInteger v96 = [(NSString *)self->_parentID hash];
  NSUInteger v95 = [(NSString *)self->_logoURL hash];
  uint64_t v94 = [(NSMutableArray *)self->_iAdCategories hash];
  uint64_t v93 = [(NSMutableArray *)self->_blockedStorefrontIDs hash];
  uint64_t v92 = [(NSMutableArray *)self->_allowedStorefrontIDs hash];
  unint64_t v91 = [(NTPBFeedConfiguration *)self->_feedConfiguration hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v90 = 2654435761 * self->_score;
  }
  else {
    uint64_t v90 = 0;
  }
  NSUInteger v89 = [(NSString *)self->_nameImageURL hash];
  NSUInteger v88 = [(NSString *)self->_nameImageForDarkBackgroundURL hash];
  NSUInteger v87 = [(NSString *)self->_nameImageMaskURL hash];
  uint64_t v86 = [(NSData *)self->_nameImageMetadata hash];
  NSUInteger v85 = [(NSString *)self->_coverImageURL hash];
  NSUInteger v84 = [(NSString *)self->_templateJson hash];
  uint64_t v83 = [(NSMutableArray *)self->_channelSectionIDs hash];
  NSUInteger v82 = [(NSString *)self->_channelDefaultSectionID hash];
  uint64_t v81 = [(NSMutableArray *)self->_channelSectionFeedConfigurations hash];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v4 = self->_has;
  if ((*(unsigned char *)&v4 & 4) == 0)
  {
    uint64_t v80 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v79 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  uint64_t v80 = 2654435761 * self->_minimumNewsVersion;
  if ((*(_WORD *)&v4 & 0x2000) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v79 = 2654435761 * self->_isExplicitContent;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v78 = 2654435761 * self->_isNotificationEnabled;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v78 = 0;
LABEL_21:
  NSUInteger v77 = [(NSString *)self->_publisherPaidAuthorizationURL hash];
  NSUInteger v76 = [(NSString *)self->_publisherPaidVerificationURL hash];
  NSUInteger v75 = [(NSString *)self->_publisherPaidWebaccessURL hash];
  uint64_t v74 = [(NSMutableArray *)self->_publisherPaidFeldsparablePurchaseIDs hash];
  uint64_t v73 = [(NSMutableArray *)self->_publisherPaidBundlePurchaseIDs hash];
  uint64_t v72 = [(NSMutableArray *)self->_purchaseOfferableConfigurations hash];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    uint64_t v71 = 2654435761 * self->_publisherPaidLeakyPaywallOptOut;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
    {
LABEL_23:
      uint64_t v70 = 2654435761 * self->_publisherPaidWebOptIn;
      if ((*(unsigned char *)&v5 & 8) != 0) {
        goto LABEL_24;
      }
LABEL_31:
      unint64_t v69 = 0;
      if ((*(unsigned char *)&v5 & 0x10) != 0) {
        goto LABEL_25;
      }
LABEL_32:
      unint64_t v10 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v71 = 0;
    if ((*(_DWORD *)&v5 & 0x80000) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v70 = 0;
  if ((*(unsigned char *)&v5 & 8) == 0) {
    goto LABEL_31;
  }
LABEL_24:
  unint64_t v69 = 2654435761u * self->_nameImageBaselineShift;
  if ((*(unsigned char *)&v5 & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_25:
  double nameImageScaleFactor = self->_nameImageScaleFactor;
  double v7 = -nameImageScaleFactor;
  if (nameImageScaleFactor >= 0.0) {
    double v7 = self->_nameImageScaleFactor;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_35:
  unint64_t v68 = v10;
  uint64_t v67 = [(NSMutableArray *)self->_iAdKeywords hash];
  NSUInteger v66 = [(NSString *)self->_nameImageMaskWidgetLQURL hash];
  NSUInteger v65 = [(NSString *)self->_nameImageMaskWidgetHQURL hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    uint64_t v64 = 2654435761 * self->_hideAccessoryText;
  }
  else {
    uint64_t v64 = 0;
  }
  unint64_t v63 = [(NTPBPublisherPaidDescriptionStrings *)self->_publisherPaidDescriptionStrings hash];
  NSUInteger v62 = [(NSString *)self->_nameCompact hash];
  NSUInteger v61 = [(NSString *)self->_nameImageCompactURL hash];
  uint64_t v60 = [(NSData *)self->_nameImageCompactMetadata hash];
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
    uint64_t v59 = 0;
    if ((*(_WORD *)&v11 & 0x4000) != 0) {
      goto LABEL_40;
    }
LABEL_43:
    uint64_t v58 = 0;
    if (*(unsigned char *)&v11) {
      goto LABEL_41;
    }
    goto LABEL_44;
  }
  uint64_t v59 = 2654435761 * self->_groupingAvailability;
  if ((*(_WORD *)&v11 & 0x4000) == 0) {
    goto LABEL_43;
  }
LABEL_40:
  uint64_t v58 = 2654435761 * self->_isHidden;
  if (*(unsigned char *)&v11)
  {
LABEL_41:
    uint64_t v57 = 2654435761 * self->_behaviorFlags;
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v57 = 0;
LABEL_45:
  uint64_t v56 = [(NSData *)self->_articleRecirculationConfiguration hash];
  uint64_t v55 = [(NSMutableArray *)self->_publisherSpecifiedArticleIDs hash];
  NSUInteger v54 = [(NSString *)self->_subtitle hash];
  unint64_t v53 = [(NTPBDate *)self->_publisherSpecifiedArticleIDsModifiedDate hash];
  NSUInteger v52 = [(NSString *)self->_feedNavImageURL hash];
  uint64_t v51 = [(NSMutableArray *)self->_latestIssueIDs hash];
  NSUInteger v50 = [(NSString *)self->_archiveIssueListID hash];
  NSUInteger v49 = [(NSString *)self->_language hash];
  NSUInteger v48 = [(NSString *)self->_magazineGenre hash];
  NSUInteger v47 = [(NSString *)self->_paidBundlePaywallConfigurationJson hash];
  NSUInteger v46 = [(NSString *)self->_stocksFeedConfigurationJson hash];
  NSUInteger v45 = [(NSString *)self->_supergroupConfigJson hash];
  NSUInteger v44 = [(NSString *)self->_supergroupKnobsJson hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v43 = 2654435761 * self->_propertyFlags;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v42 = [(NSMutableArray *)self->_recentIssueIDs hash];
  NSUInteger v41 = [(NSString *)self->_nameImageLargeURL hash];
  NSUInteger v40 = [(NSString *)self->_nameImageLargeMaskURL hash];
  NSUInteger v39 = [(NSString *)self->_superfeedConfigResourceID hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v38 = 2654435761 * self->_isSportsRecommendable;
  }
  else {
    uint64_t v38 = 0;
  }
  uint64_t v37 = [(NSData *)self->_sportsRecommendationMappingsJson hash];
  NSUInteger v36 = [(NSString *)self->_highlightsArticleListID hash];
  NSUInteger v35 = [(NSString *)self->_sportsLogoImageURL hash];
  NSUInteger v34 = [(NSString *)self->_sportsLogoImageCompactURL hash];
  NSUInteger v33 = [(NSString *)self->_sportsLogoImageLargeURL hash];
  NSUInteger v32 = [(NSString *)self->_sportsData hash];
  NSUInteger v31 = [(NSString *)self->_sportsTheme hash];
  NSUInteger v30 = [(NSString *)self->_navigationChromeBackgroundImageURL hash];
  NSUInteger v29 = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageURL hash];
  NSUInteger v28 = [(NSString *)self->_navigationChromeBackgroundImageCompactURL hash];
  NSUInteger v27 = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageCompactURL hash];
  NSUInteger v26 = [(NSString *)self->_navigationChromeBackgroundImageLargeURL hash];
  NSUInteger v12 = [(NSString *)self->_darkStyleNavigationChromeBackgroundImageLargeURL hash];
  if (*((unsigned char *)&self->_has + 1))
  {
    double subscriptionRate = self->_subscriptionRate;
    double v15 = -subscriptionRate;
    if (subscriptionRate >= 0.0) {
      double v15 = self->_subscriptionRate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_publisherSpecifiedArticlesJson hash];
  uint64_t v19 = [(NSMutableArray *)self->_adTargetingKeywords hash];
  NSUInteger v20 = [(NSString *)self->_feedNavImageHQURL hash];
  NSUInteger v21 = [(NSString *)self->_sportsLogoAltImageURL hash];
  NSUInteger v22 = [(NSString *)self->_sportsLogoAltImageCompactURL hash];
  NSUInteger v23 = [(NSString *)self->_sportsLogoAltImageLargeURL hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v24 = 2654435761 * self->_propertyFlagsLocalized;
  }
  else {
    uint64_t v24 = 0;
  }
  return v103 ^ v104 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 14);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTagRecord setBase:](self, "setBase:");
  }
  if ((*((unsigned char *)a3 + 649) & 4) != 0)
  {
    self->_type = *((_DWORD *)a3 + 158);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)a3 + 34)) {
    -[NTPBTagRecord setName:](self, "setName:");
  }
  int v7 = *((_DWORD *)a3 + 162);
  if ((v7 & 2) != 0)
  {
    self->_contentProvider = *((void *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v7 = *((_DWORD *)a3 + 162);
    if ((v7 & 0x10000) == 0)
    {
LABEL_12:
      if ((v7 & 0x1000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v7 & 0x10000) == 0)
  {
    goto LABEL_12;
  }
  self->_isPublic = *((unsigned char *)a3 + 641);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)a3 + 162) & 0x1000) != 0)
  {
LABEL_13:
    self->_isDeprecated = *((unsigned char *)a3 + 637);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_14:
  if (*((void *)a3 + 63)) {
    -[NTPBTagRecord setReplacementID:](self, "setReplacementID:");
  }
  if (*((void *)a3 + 51)) {
    -[NTPBTagRecord setPrimaryAudience:](self, "setPrimaryAudience:");
  }
  if (*((void *)a3 + 50)) {
    -[NTPBTagRecord setParentID:](self, "setParentID:");
  }
  if (*((void *)a3 + 32)) {
    -[NTPBTagRecord setLogoURL:](self, "setLogoURL:");
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long double v8 = (void *)*((void *)a3 + 28);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v130 objects:v146 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v131 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBTagRecord *)self addIAdCategories:*(void *)(*((void *)&v130 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v130 objects:v146 count:16];
    }
    while (v10);
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  unint64_t v13 = (void *)*((void *)a3 + 15);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v126 objects:v145 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v127;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v127 != v16) {
          objc_enumerationMutation(v13);
        }
        [(NTPBTagRecord *)self addBlockedStorefrontIDs:*(void *)(*((void *)&v126 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v126 objects:v145 count:16];
    }
    while (v15);
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  NSUInteger v18 = (void *)*((void *)a3 + 11);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v123;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v123 != v21) {
          objc_enumerationMutation(v18);
        }
        [(NTPBTagRecord *)self addAllowedStorefrontIDs:*(void *)(*((void *)&v122 + 1) + 8 * k)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
    }
    while (v20);
  }
  feedConfiguratiouint64_t n = self->_feedConfiguration;
  uint64_t v24 = *((void *)a3 + 23);
  if (feedConfiguration)
  {
    if (v24) {
      -[NTPBFeedConfiguration mergeFrom:](feedConfiguration, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBTagRecord setFeedConfiguration:](self, "setFeedConfiguration:");
  }
  if ((*((unsigned char *)a3 + 648) & 0x80) != 0)
  {
    self->_score = *((void *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((void *)a3 + 45)) {
    -[NTPBTagRecord setNameImageURL:](self, "setNameImageURL:");
  }
  if (*((void *)a3 + 38)) {
    -[NTPBTagRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:");
  }
  if (*((void *)a3 + 41)) {
    -[NTPBTagRecord setNameImageMaskURL:](self, "setNameImageMaskURL:");
  }
  if (*((void *)a3 + 44)) {
    -[NTPBTagRecord setNameImageMetadata:](self, "setNameImageMetadata:");
  }
  if (*((void *)a3 + 19)) {
    -[NTPBTagRecord setCoverImageURL:](self, "setCoverImageURL:");
  }
  if (*((void *)a3 + 78)) {
    -[NTPBTagRecord setTemplateJson:](self, "setTemplateJson:");
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v25 = (void *)*((void *)a3 + 18);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v119;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v119 != v28) {
          objc_enumerationMutation(v25);
        }
        [(NTPBTagRecord *)self addChannelSectionIDs:*(void *)(*((void *)&v118 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
    }
    while (v27);
  }
  if (*((void *)a3 + 16)) {
    -[NTPBTagRecord setChannelDefaultSectionID:](self, "setChannelDefaultSectionID:");
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  NSUInteger v30 = (void *)*((void *)a3 + 17);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v114 objects:v142 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v115;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v115 != v33) {
          objc_enumerationMutation(v30);
        }
        [(NTPBTagRecord *)self addChannelSectionFeedConfigurations:*(void *)(*((void *)&v114 + 1) + 8 * n)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v114 objects:v142 count:16];
    }
    while (v32);
  }
  int v35 = *((_DWORD *)a3 + 162);
  if ((v35 & 4) != 0)
  {
    self->_minimumNewsVersiouint64_t n = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    int v35 = *((_DWORD *)a3 + 162);
    if ((v35 & 0x2000) == 0)
    {
LABEL_83:
      if ((v35 & 0x8000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
  }
  else if ((v35 & 0x2000) == 0)
  {
    goto LABEL_83;
  }
  self->_isExplicitContent = *((unsigned char *)a3 + 638);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)a3 + 162) & 0x8000) != 0)
  {
LABEL_84:
    self->_isNotificationEnabled = *((unsigned char *)a3 + 640);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_85:
  if (*((void *)a3 + 52)) {
    -[NTPBTagRecord setPublisherPaidAuthorizationURL:](self, "setPublisherPaidAuthorizationURL:");
  }
  if (*((void *)a3 + 56)) {
    -[NTPBTagRecord setPublisherPaidVerificationURL:](self, "setPublisherPaidVerificationURL:");
  }
  if (*((void *)a3 + 57)) {
    -[NTPBTagRecord setPublisherPaidWebaccessURL:](self, "setPublisherPaidWebaccessURL:");
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  NSUInteger v36 = (void *)*((void *)a3 + 55);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v110 objects:v141 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v111;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v111 != v39) {
          objc_enumerationMutation(v36);
        }
        [(NTPBTagRecord *)self addPublisherPaidFeldsparablePurchaseIDs:*(void *)(*((void *)&v110 + 1) + 8 * ii)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v110 objects:v141 count:16];
    }
    while (v38);
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  NSUInteger v41 = (void *)*((void *)a3 + 53);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v106 objects:v140 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v107;
    do
    {
      for (juint64_t j = 0; jj != v43; ++jj)
      {
        if (*(void *)v107 != v44) {
          objc_enumerationMutation(v41);
        }
        [(NTPBTagRecord *)self addPublisherPaidBundlePurchaseIDs:*(void *)(*((void *)&v106 + 1) + 8 * jj)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v106 objects:v140 count:16];
    }
    while (v43);
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  NSUInteger v46 = (void *)*((void *)a3 + 61);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v102 objects:v139 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v103;
    do
    {
      for (kuint64_t k = 0; kk != v48; ++kk)
      {
        if (*(void *)v103 != v49) {
          objc_enumerationMutation(v46);
        }
        [(NTPBTagRecord *)self addPurchaseOfferableConfiguration:*(void *)(*((void *)&v102 + 1) + 8 * kk)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v102 objects:v139 count:16];
    }
    while (v48);
  }
  int v51 = *((_DWORD *)a3 + 162);
  if ((v51 & 0x40000) != 0)
  {
    self->_publisherPaidLeakyPaywallOptOut = *((unsigned char *)a3 + 643);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v51 = *((_DWORD *)a3 + 162);
    if ((v51 & 0x80000) == 0)
    {
LABEL_114:
      if ((v51 & 8) == 0) {
        goto LABEL_115;
      }
      goto LABEL_138;
    }
  }
  else if ((v51 & 0x80000) == 0)
  {
    goto LABEL_114;
  }
  self->_publisherPaidWebOptIuint64_t n = *((unsigned char *)a3 + 644);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v51 = *((_DWORD *)a3 + 162);
  if ((v51 & 8) == 0)
  {
LABEL_115:
    if ((v51 & 0x10) == 0) {
      goto LABEL_117;
    }
    goto LABEL_116;
  }
LABEL_138:
  self->_nameImageBaselineShift = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 162) & 0x10) != 0)
  {
LABEL_116:
    self->_double nameImageScaleFactor = *((double *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_117:
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  NSUInteger v52 = (void *)*((void *)a3 + 29);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v98 objects:v138 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v99;
    do
    {
      for (muint64_t m = 0; mm != v54; ++mm)
      {
        if (*(void *)v99 != v55) {
          objc_enumerationMutation(v52);
        }
        [(NTPBTagRecord *)self addIAdKeywords:*(void *)(*((void *)&v98 + 1) + 8 * mm)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v98 objects:v138 count:16];
    }
    while (v54);
  }
  if (*((void *)a3 + 43)) {
    -[NTPBTagRecord setNameImageMaskWidgetLQURL:](self, "setNameImageMaskWidgetLQURL:");
  }
  if (*((void *)a3 + 42)) {
    -[NTPBTagRecord setNameImageMaskWidgetHQURL:](self, "setNameImageMaskWidgetHQURL:");
  }
  if ((*((unsigned char *)a3 + 649) & 8) != 0)
  {
    self->_hideAccessoryText = *((unsigned char *)a3 + 636);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  uint64_t v58 = *((void *)a3 + 54);
  if (publisherPaidDescriptionStrings)
  {
    if (v58) {
      -[NTPBPublisherPaidDescriptionStrings mergeFrom:](publisherPaidDescriptionStrings, "mergeFrom:");
    }
  }
  else if (v58)
  {
    -[NTPBTagRecord setPublisherPaidDescriptionStrings:](self, "setPublisherPaidDescriptionStrings:");
  }
  if (*((void *)a3 + 35)) {
    -[NTPBTagRecord setNameCompact:](self, "setNameCompact:");
  }
  if (*((void *)a3 + 37)) {
    -[NTPBTagRecord setNameImageCompactURL:](self, "setNameImageCompactURL:");
  }
  if (*((void *)a3 + 36)) {
    -[NTPBTagRecord setNameImageCompactMetadata:](self, "setNameImageCompactMetadata:");
  }
  int v59 = *((_DWORD *)a3 + 162);
  if ((v59 & 0x200) != 0)
  {
    self->_groupingAvailability = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x200u;
    int v59 = *((_DWORD *)a3 + 162);
    if ((v59 & 0x4000) == 0)
    {
LABEL_150:
      if ((v59 & 1) == 0) {
        goto LABEL_152;
      }
      goto LABEL_151;
    }
  }
  else if ((v59 & 0x4000) == 0)
  {
    goto LABEL_150;
  }
  self->_isHiddeuint64_t n = *((unsigned char *)a3 + 639);
  *(_DWORD *)&self->_has |= 0x4000u;
  if (*((_DWORD *)a3 + 162))
  {
LABEL_151:
    self->_behaviorFlags = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_152:
  if (*((void *)a3 + 13)) {
    -[NTPBTagRecord setArticleRecirculationConfiguration:](self, "setArticleRecirculationConfiguration:");
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v60 = (void *)*((void *)a3 + 58);
  uint64_t v61 = [v60 countByEnumeratingWithState:&v94 objects:v137 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v95;
    do
    {
      for (nuint64_t n = 0; nn != v62; ++nn)
      {
        if (*(void *)v95 != v63) {
          objc_enumerationMutation(v60);
        }
        [(NTPBTagRecord *)self addPublisherSpecifiedArticleIDs:*(void *)(*((void *)&v94 + 1) + 8 * nn)];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v94 objects:v137 count:16];
    }
    while (v62);
  }
  if (*((void *)a3 + 74)) {
    -[NTPBTagRecord setSubtitle:](self, "setSubtitle:");
  }
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  uint64_t v66 = *((void *)a3 + 59);
  if (publisherSpecifiedArticleIDsModifiedDate)
  {
    if (v66) {
      -[NTPBDate mergeFrom:](publisherSpecifiedArticleIDsModifiedDate, "mergeFrom:");
    }
  }
  else if (v66)
  {
    -[NTPBTagRecord setPublisherSpecifiedArticleIDsModifiedDate:](self, "setPublisherSpecifiedArticleIDsModifiedDate:");
  }
  if (*((void *)a3 + 25)) {
    -[NTPBTagRecord setFeedNavImageURL:](self, "setFeedNavImageURL:");
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v67 = (void *)*((void *)a3 + 31);
  uint64_t v68 = [v67 countByEnumeratingWithState:&v90 objects:v136 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v91;
    do
    {
      for (uint64_t i1 = 0; i1 != v69; ++i1)
      {
        if (*(void *)v91 != v70) {
          objc_enumerationMutation(v67);
        }
        [(NTPBTagRecord *)self addLatestIssueIDs:*(void *)(*((void *)&v90 + 1) + 8 * i1)];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v90 objects:v136 count:16];
    }
    while (v69);
  }
  if (*((void *)a3 + 12)) {
    -[NTPBTagRecord setArchiveIssueListID:](self, "setArchiveIssueListID:");
  }
  if (*((void *)a3 + 30)) {
    -[NTPBTagRecord setLanguage:](self, "setLanguage:");
  }
  if (*((void *)a3 + 33)) {
    -[NTPBTagRecord setMagazineGenre:](self, "setMagazineGenre:");
  }
  if (*((void *)a3 + 49)) {
    -[NTPBTagRecord setPaidBundlePaywallConfigurationJson:](self, "setPaidBundlePaywallConfigurationJson:");
  }
  if (*((void *)a3 + 73)) {
    -[NTPBTagRecord setStocksFeedConfigurationJson:](self, "setStocksFeedConfigurationJson:");
  }
  if (*((void *)a3 + 76)) {
    -[NTPBTagRecord setSupergroupConfigJson:](self, "setSupergroupConfigJson:");
  }
  if (*((void *)a3 + 77)) {
    -[NTPBTagRecord setSupergroupKnobsJson:](self, "setSupergroupKnobsJson:");
  }
  if ((*((unsigned char *)a3 + 648) & 0x20) != 0)
  {
    self->_propertyFlags = *((void *)a3 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v72 = (void *)*((void *)a3 + 62);
  uint64_t v73 = [v72 countByEnumeratingWithState:&v86 objects:v135 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v87;
    do
    {
      for (uint64_t i2 = 0; i2 != v74; ++i2)
      {
        if (*(void *)v87 != v75) {
          objc_enumerationMutation(v72);
        }
        [(NTPBTagRecord *)self addRecentIssueIDs:*(void *)(*((void *)&v86 + 1) + 8 * i2)];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v86 objects:v135 count:16];
    }
    while (v74);
  }
  if (*((void *)a3 + 40)) {
    -[NTPBTagRecord setNameImageLargeURL:](self, "setNameImageLargeURL:");
  }
  if (*((void *)a3 + 39)) {
    -[NTPBTagRecord setNameImageLargeMaskURL:](self, "setNameImageLargeMaskURL:");
  }
  if (*((void *)a3 + 75)) {
    -[NTPBTagRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  }
  if ((*((unsigned char *)a3 + 650) & 2) != 0)
  {
    self->_isSportsRecommendable = *((unsigned char *)a3 + 642);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)a3 + 71)) {
    -[NTPBTagRecord setSportsRecommendationMappingsJson:](self, "setSportsRecommendationMappingsJson:");
  }
  if (*((void *)a3 + 27)) {
    -[NTPBTagRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:");
  }
  if (*((void *)a3 + 70)) {
    -[NTPBTagRecord setSportsLogoImageURL:](self, "setSportsLogoImageURL:");
  }
  if (*((void *)a3 + 68)) {
    -[NTPBTagRecord setSportsLogoImageCompactURL:](self, "setSportsLogoImageCompactURL:");
  }
  if (*((void *)a3 + 69)) {
    -[NTPBTagRecord setSportsLogoImageLargeURL:](self, "setSportsLogoImageLargeURL:");
  }
  if (*((void *)a3 + 64)) {
    -[NTPBTagRecord setSportsData:](self, "setSportsData:");
  }
  if (*((void *)a3 + 72)) {
    -[NTPBTagRecord setSportsTheme:](self, "setSportsTheme:");
  }
  if (*((void *)a3 + 48)) {
    -[NTPBTagRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:");
  }
  if (*((void *)a3 + 22)) {
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageURL:](self, "setDarkStyleNavigationChromeBackgroundImageURL:");
  }
  if (*((void *)a3 + 46)) {
    -[NTPBTagRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:");
  }
  if (*((void *)a3 + 20)) {
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageCompactURL:](self, "setDarkStyleNavigationChromeBackgroundImageCompactURL:");
  }
  if (*((void *)a3 + 47)) {
    -[NTPBTagRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:");
  }
  if (*((void *)a3 + 21)) {
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageLargeURL:](self, "setDarkStyleNavigationChromeBackgroundImageLargeURL:");
  }
  if (*((unsigned char *)a3 + 649))
  {
    self->_double subscriptionRate = *((double *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 60)) {
    -[NTPBTagRecord setPublisherSpecifiedArticlesJson:](self, "setPublisherSpecifiedArticlesJson:");
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  NSUInteger v77 = (void *)*((void *)a3 + 10);
  uint64_t v78 = [v77 countByEnumeratingWithState:&v82 objects:v134 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v83;
    do
    {
      for (uint64_t i3 = 0; i3 != v79; ++i3)
      {
        if (*(void *)v83 != v80) {
          objc_enumerationMutation(v77);
        }
        [(NTPBTagRecord *)self addAdTargetingKeywords:*(void *)(*((void *)&v82 + 1) + 8 * i3)];
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v82 objects:v134 count:16];
    }
    while (v79);
  }
  if (*((void *)a3 + 24)) {
    -[NTPBTagRecord setFeedNavImageHQURL:](self, "setFeedNavImageHQURL:");
  }
  if (*((void *)a3 + 67)) {
    -[NTPBTagRecord setSportsLogoAltImageURL:](self, "setSportsLogoAltImageURL:");
  }
  if (*((void *)a3 + 65)) {
    -[NTPBTagRecord setSportsLogoAltImageCompactURL:](self, "setSportsLogoAltImageCompactURL:");
  }
  if (*((void *)a3 + 66)) {
    -[NTPBTagRecord setSportsLogoAltImageLargeURL:](self, "setSportsLogoAltImageLargeURL:");
  }
  if ((*((unsigned char *)a3 + 648) & 0x40) != 0)
  {
    self->_propertyFlagsLocalized = *((void *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
}

- (void)setBase:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setReplacementID:(id)a3
{
}

- (void)setPrimaryAudience:(id)a3
{
}

- (void)setParentID:(id)a3
{
}

- (void)setLogoURL:(id)a3
{
}

- (void)setIAdCategories:(id)a3
{
}

- (void)setBlockedStorefrontIDs:(id)a3
{
}

- (void)setAllowedStorefrontIDs:(id)a3
{
}

- (void)setFeedConfiguration:(id)a3
{
}

- (void)setNameImageURL:(id)a3
{
}

- (void)setNameImageForDarkBackgroundURL:(id)a3
{
}

- (void)setNameImageMaskURL:(id)a3
{
}

- (void)setNameImageMetadata:(id)a3
{
}

- (void)setCoverImageURL:(id)a3
{
}

- (void)setTemplateJson:(id)a3
{
}

- (void)setChannelSectionIDs:(id)a3
{
}

- (void)setChannelDefaultSectionID:(id)a3
{
}

- (void)setChannelSectionFeedConfigurations:(id)a3
{
}

- (void)setPublisherPaidAuthorizationURL:(id)a3
{
}

- (void)setPublisherPaidVerificationURL:(id)a3
{
}

- (void)setPublisherPaidWebaccessURL:(id)a3
{
}

- (void)setPublisherPaidFeldsparablePurchaseIDs:(id)a3
{
}

- (void)setPublisherPaidBundlePurchaseIDs:(id)a3
{
}

- (void)setPurchaseOfferableConfigurations:(id)a3
{
}

- (void)setIAdKeywords:(id)a3
{
}

- (void)setNameImageMaskWidgetLQURL:(id)a3
{
}

- (void)setNameImageMaskWidgetHQURL:(id)a3
{
}

- (void)setPublisherPaidDescriptionStrings:(id)a3
{
}

- (void)setNameCompact:(id)a3
{
}

- (void)setNameImageCompactURL:(id)a3
{
}

- (NSData)nameImageCompactMetadata
{
  return self->_nameImageCompactMetadata;
}

- (void)setNameImageCompactMetadata:(id)a3
{
}

- (NSData)articleRecirculationConfiguration
{
  return self->_articleRecirculationConfiguration;
}

- (void)setArticleRecirculationConfiguration:(id)a3
{
}

- (void)setPublisherSpecifiedArticleIDs:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setPublisherSpecifiedArticleIDsModifiedDate:(id)a3
{
}

- (void)setFeedNavImageURL:(id)a3
{
}

- (void)setLatestIssueIDs:(id)a3
{
}

- (void)setArchiveIssueListID:(id)a3
{
}

- (void)setLanguage:(id)a3
{
}

- (void)setMagazineGenre:(id)a3
{
}

- (void)setPaidBundlePaywallConfigurationJson:(id)a3
{
}

- (NSString)stocksFeedConfigurationJson
{
  return self->_stocksFeedConfigurationJson;
}

- (void)setStocksFeedConfigurationJson:(id)a3
{
}

- (void)setSupergroupConfigJson:(id)a3
{
}

- (void)setSupergroupKnobsJson:(id)a3
{
}

- (void)setRecentIssueIDs:(id)a3
{
}

- (void)setNameImageLargeURL:(id)a3
{
}

- (void)setNameImageLargeMaskURL:(id)a3
{
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
}

- (void)setSportsRecommendationMappingsJson:(id)a3
{
}

- (void)setHighlightsArticleListID:(id)a3
{
}

- (void)setSportsLogoImageURL:(id)a3
{
}

- (void)setSportsLogoImageCompactURL:(id)a3
{
}

- (void)setSportsLogoImageLargeURL:(id)a3
{
}

- (void)setSportsData:(id)a3
{
}

- (void)setSportsTheme:(id)a3
{
}

- (void)setNavigationChromeBackgroundImageURL:(id)a3
{
}

- (void)setDarkStyleNavigationChromeBackgroundImageURL:(id)a3
{
}

- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3
{
}

- (void)setDarkStyleNavigationChromeBackgroundImageCompactURL:(id)a3
{
}

- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3
{
}

- (void)setDarkStyleNavigationChromeBackgroundImageLargeURL:(id)a3
{
}

- (void)setPublisherSpecifiedArticlesJson:(id)a3
{
}

- (void)setAdTargetingKeywords:(id)a3
{
}

- (void)setFeedNavImageHQURL:(id)a3
{
}

- (void)setSportsLogoAltImageURL:(id)a3
{
}

- (void)setSportsLogoAltImageCompactURL:(id)a3
{
}

- (void)setSportsLogoAltImageLargeURL:(id)a3
{
}

@end