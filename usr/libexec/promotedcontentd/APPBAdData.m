@interface APPBAdData
+ (Class)actionsType;
+ (Class)adLayoutDataType;
+ (Class)confirmedClickPixelURLsType;
+ (Class)creativeSizesType;
+ (Class)excludeTagType;
+ (Class)geofencesType;
+ (Class)iTunesMetadataType;
+ (Class)journeyStartRelayValuesType;
+ (Class)matchTagClauseType;
+ (Class)nativeMetadataType;
+ (Class)rewardTokensType;
+ (Class)screenSaverImageURLType;
+ (Class)trackingURLType;
+ (Class)videoAssetType;
- (APPBAdFrequencyCapData)adFrequencyCapData;
- (APPBAdSpecification)specification;
- (APPBInstallAttribution)installAttribution;
- (APPBMediaFiles)mediaFiles;
- (APPBMerchant)merchant;
- (APPBNativeMediaCreativeMetadata)nativeMediaCreativeMetadata;
- (APPBPolicyData)policyData;
- (APPBTargetingDimensions)targetingDimensions;
- (APPBTransparencyDetails)transparencyDetails;
- (BOOL)doesNotResetListeningTime;
- (BOOL)downloadWebArchivesBeforeShowingBanner;
- (BOOL)hasATVTunerImageURL;
- (BOOL)hasAccessibilityDescription;
- (BOOL)hasAdDataResponseIdentifier;
- (BOOL)hasAdFormatType;
- (BOOL)hasAdFrequencyCapData;
- (BOOL)hasAdOriginalRequesterId;
- (BOOL)hasAdPrivacyMarkPosition;
- (BOOL)hasAdTagContentString;
- (BOOL)hasAdType;
- (BOOL)hasAudioURL;
- (BOOL)hasBannerImpressionThreshold;
- (BOOL)hasBannerNewContentCandidacyThreshold;
- (BOOL)hasBannerQueryString;
- (BOOL)hasBannerURL;
- (BOOL)hasBannerWebArchiveURL;
- (BOOL)hasDescriptionForLCD;
- (BOOL)hasDesiredPosition;
- (BOOL)hasDoesNotResetListeningTime;
- (BOOL)hasDownloadWebArchivesBeforeShowingBanner;
- (BOOL)hasExpirationDate;
- (BOOL)hasExpressionToEvaluate;
- (BOOL)hasHeadlineForLCD;
- (BOOL)hasHumanReadableName;
- (BOOL)hasIAdJSURL;
- (BOOL)hasIAdJSVersion;
- (BOOL)hasImpressionIdentifierData;
- (BOOL)hasInstallAttribution;
- (BOOL)hasLetterboxCreativeColor;
- (BOOL)hasLogoImageURL;
- (BOOL)hasMaximumPretapRequestCount;
- (BOOL)hasMediaFiles;
- (BOOL)hasMerchant;
- (BOOL)hasMinimumIntervalBetweenPresentations;
- (BOOL)hasNativeMediaCreativeMetadata;
- (BOOL)hasPolicyData;
- (BOOL)hasPriority;
- (BOOL)hasRewardTokensExpiration;
- (BOOL)hasSkipThreshold;
- (BOOL)hasSlateImageURL;
- (BOOL)hasSpecification;
- (BOOL)hasTargetAppBundleID;
- (BOOL)hasTargetAppURLScheme;
- (BOOL)hasTargetingDimensions;
- (BOOL)hasTrackingURLSubstitutionParameter;
- (BOOL)hasTransparencyDetails;
- (BOOL)hasUnbranded;
- (BOOL)hasUnfilledReasonCode;
- (BOOL)hasUnfilledReasonInfo;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unbranded;
- (NSData)impressionIdentifierData;
- (NSMutableArray)actions;
- (NSMutableArray)adLayoutDatas;
- (NSMutableArray)confirmedClickPixelURLs;
- (NSMutableArray)creativeSizes;
- (NSMutableArray)excludeTags;
- (NSMutableArray)geofences;
- (NSMutableArray)iTunesMetadatas;
- (NSMutableArray)journeyStartRelayValues;
- (NSMutableArray)matchTagClauses;
- (NSMutableArray)nativeMetadatas;
- (NSMutableArray)rewardTokens;
- (NSMutableArray)screenSaverImageURLs;
- (NSMutableArray)trackingURLs;
- (NSMutableArray)videoAssets;
- (NSString)aTVTunerImageURL;
- (NSString)accessibilityDescription;
- (NSString)adDataResponseIdentifier;
- (NSString)adFormatType;
- (NSString)adOriginalRequesterId;
- (NSString)adTagContentString;
- (NSString)adType;
- (NSString)audioURL;
- (NSString)bannerQueryString;
- (NSString)bannerURL;
- (NSString)bannerWebArchiveURL;
- (NSString)descriptionForLCD;
- (NSString)expressionToEvaluate;
- (NSString)headlineForLCD;
- (NSString)humanReadableName;
- (NSString)iAdJSURL;
- (NSString)iAdJSVersion;
- (NSString)logoImageURL;
- (NSString)slateImageURL;
- (NSString)targetAppBundleID;
- (NSString)targetAppURLScheme;
- (NSString)trackingURLSubstitutionParameter;
- (NSString)unfilledReasonInfo;
- (NSString)uniqueIdentifier;
- (double)expirationDate;
- (double)minimumIntervalBetweenPresentations;
- (double)rewardTokensExpiration;
- (double)skipThreshold;
- (float)bannerImpressionThreshold;
- (float)bannerNewContentCandidacyThreshold;
- (id)actionsAtIndex:(unint64_t)a3;
- (id)adLayoutDataAtIndex:(unint64_t)a3;
- (id)adPrivacyMarkPositionAsString:(int)a3;
- (id)confirmedClickPixelURLsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)creativeSizesAtIndex:(unint64_t)a3;
- (id)description;
- (id)desiredPositionAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)excludeTagAtIndex:(unint64_t)a3;
- (id)geofencesAtIndex:(unint64_t)a3;
- (id)iTunesMetadataAtIndex:(unint64_t)a3;
- (id)journeyStartRelayValuesAtIndex:(unint64_t)a3;
- (id)matchTagClauseAtIndex:(unint64_t)a3;
- (id)nativeMetadataAtIndex:(unint64_t)a3;
- (id)rewardTokensAtIndex:(unint64_t)a3;
- (id)screenSaverImageURLAtIndex:(unint64_t)a3;
- (id)trackingURLAtIndex:(unint64_t)a3;
- (id)unfilledReasonCodeAsString:(int)a3;
- (id)videoAssetAtIndex:(unint64_t)a3;
- (int)StringAsAdPrivacyMarkPosition:(id)a3;
- (int)StringAsDesiredPosition:(id)a3;
- (int)StringAsUnfilledReasonCode:(id)a3;
- (int)adPrivacyMarkPosition;
- (int)desiredPosition;
- (int)impressionCount;
- (int)maximumPretapRequestCount;
- (int)unfilledReasonCode;
- (unint64_t)actionsCount;
- (unint64_t)adLayoutDatasCount;
- (unint64_t)confirmedClickPixelURLsCount;
- (unint64_t)creativeSizesCount;
- (unint64_t)excludeTagsCount;
- (unint64_t)geofencesCount;
- (unint64_t)hash;
- (unint64_t)iTunesMetadatasCount;
- (unint64_t)journeyStartRelayValuesCount;
- (unint64_t)matchTagClausesCount;
- (unint64_t)nativeMetadatasCount;
- (unint64_t)priority;
- (unint64_t)rewardTokensCount;
- (unint64_t)screenSaverImageURLsCount;
- (unint64_t)trackingURLsCount;
- (unint64_t)videoAssetsCount;
- (unsigned)letterboxCreativeColor;
- (void)addActions:(id)a3;
- (void)addAdLayoutData:(id)a3;
- (void)addConfirmedClickPixelURLs:(id)a3;
- (void)addCreativeSizes:(id)a3;
- (void)addExcludeTag:(id)a3;
- (void)addGeofences:(id)a3;
- (void)addITunesMetadata:(id)a3;
- (void)addJourneyStartRelayValues:(id)a3;
- (void)addMatchTagClause:(id)a3;
- (void)addNativeMetadata:(id)a3;
- (void)addRewardTokens:(id)a3;
- (void)addScreenSaverImageURL:(id)a3;
- (void)addTrackingURL:(id)a3;
- (void)addVideoAsset:(id)a3;
- (void)clearActions;
- (void)clearAdLayoutDatas;
- (void)clearConfirmedClickPixelURLs;
- (void)clearCreativeSizes;
- (void)clearExcludeTags;
- (void)clearGeofences;
- (void)clearITunesMetadatas;
- (void)clearJourneyStartRelayValues;
- (void)clearMatchTagClauses;
- (void)clearNativeMetadatas;
- (void)clearRewardTokens;
- (void)clearScreenSaverImageURLs;
- (void)clearTrackingURLs;
- (void)clearVideoAssets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setATVTunerImageURL:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setActions:(id)a3;
- (void)setAdDataResponseIdentifier:(id)a3;
- (void)setAdFormatType:(id)a3;
- (void)setAdFrequencyCapData:(id)a3;
- (void)setAdLayoutDatas:(id)a3;
- (void)setAdOriginalRequesterId:(id)a3;
- (void)setAdPrivacyMarkPosition:(int)a3;
- (void)setAdTagContentString:(id)a3;
- (void)setAdType:(id)a3;
- (void)setAudioURL:(id)a3;
- (void)setBannerImpressionThreshold:(float)a3;
- (void)setBannerNewContentCandidacyThreshold:(float)a3;
- (void)setBannerQueryString:(id)a3;
- (void)setBannerURL:(id)a3;
- (void)setBannerWebArchiveURL:(id)a3;
- (void)setConfirmedClickPixelURLs:(id)a3;
- (void)setCreativeSizes:(id)a3;
- (void)setDescriptionForLCD:(id)a3;
- (void)setDesiredPosition:(int)a3;
- (void)setDoesNotResetListeningTime:(BOOL)a3;
- (void)setDownloadWebArchivesBeforeShowingBanner:(BOOL)a3;
- (void)setExcludeTags:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setExpressionToEvaluate:(id)a3;
- (void)setGeofences:(id)a3;
- (void)setHasAdPrivacyMarkPosition:(BOOL)a3;
- (void)setHasBannerImpressionThreshold:(BOOL)a3;
- (void)setHasBannerNewContentCandidacyThreshold:(BOOL)a3;
- (void)setHasDesiredPosition:(BOOL)a3;
- (void)setHasDoesNotResetListeningTime:(BOOL)a3;
- (void)setHasDownloadWebArchivesBeforeShowingBanner:(BOOL)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasLetterboxCreativeColor:(BOOL)a3;
- (void)setHasMaximumPretapRequestCount:(BOOL)a3;
- (void)setHasMinimumIntervalBetweenPresentations:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasRewardTokensExpiration:(BOOL)a3;
- (void)setHasSkipThreshold:(BOOL)a3;
- (void)setHasUnbranded:(BOOL)a3;
- (void)setHasUnfilledReasonCode:(BOOL)a3;
- (void)setHeadlineForLCD:(id)a3;
- (void)setHumanReadableName:(id)a3;
- (void)setIAdJSURL:(id)a3;
- (void)setIAdJSVersion:(id)a3;
- (void)setITunesMetadatas:(id)a3;
- (void)setImpressionCount:(int)a3;
- (void)setImpressionIdentifierData:(id)a3;
- (void)setInstallAttribution:(id)a3;
- (void)setJourneyStartRelayValues:(id)a3;
- (void)setLetterboxCreativeColor:(unsigned int)a3;
- (void)setLogoImageURL:(id)a3;
- (void)setMatchTagClauses:(id)a3;
- (void)setMaximumPretapRequestCount:(int)a3;
- (void)setMediaFiles:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setMinimumIntervalBetweenPresentations:(double)a3;
- (void)setNativeMediaCreativeMetadata:(id)a3;
- (void)setNativeMetadatas:(id)a3;
- (void)setPolicyData:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRewardTokens:(id)a3;
- (void)setRewardTokensExpiration:(double)a3;
- (void)setScreenSaverImageURLs:(id)a3;
- (void)setSkipThreshold:(double)a3;
- (void)setSlateImageURL:(id)a3;
- (void)setSpecification:(id)a3;
- (void)setTargetAppBundleID:(id)a3;
- (void)setTargetAppURLScheme:(id)a3;
- (void)setTargetingDimensions:(id)a3;
- (void)setTrackingURLSubstitutionParameter:(id)a3;
- (void)setTrackingURLs:(id)a3;
- (void)setTransparencyDetails:(id)a3;
- (void)setUnbranded:(BOOL)a3;
- (void)setUnfilledReasonCode:(int)a3;
- (void)setUnfilledReasonInfo:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVideoAssets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdData

- (BOOL)hasBannerURL
{
  return self->_bannerURL != 0;
}

- (BOOL)hasBannerWebArchiveURL
{
  return self->_bannerWebArchiveURL != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasImpressionIdentifierData
{
  return self->_impressionIdentifierData != 0;
}

- (BOOL)hasHumanReadableName
{
  return self->_humanReadableName != 0;
}

- (void)setExpirationDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearTrackingURLs
{
}

- (void)addTrackingURL:(id)a3
{
  id v4 = a3;
  trackingURLs = self->_trackingURLs;
  id v8 = v4;
  if (!trackingURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_trackingURLs;
    self->_trackingURLs = v6;

    id v4 = v8;
    trackingURLs = self->_trackingURLs;
  }
  [(NSMutableArray *)trackingURLs addObject:v4];
}

- (unint64_t)trackingURLsCount
{
  return (unint64_t)[(NSMutableArray *)self->_trackingURLs count];
}

- (id)trackingURLAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_trackingURLs objectAtIndex:a3];
}

+ (Class)trackingURLType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTrackingURLSubstitutionParameter
{
  return self->_trackingURLSubstitutionParameter != 0;
}

- (void)setUnbranded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unbranded = a3;
}

- (void)setHasUnbranded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUnbranded
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasAccessibilityDescription
{
  return self->_accessibilityDescription != 0;
}

- (void)clearConfirmedClickPixelURLs
{
}

- (void)addConfirmedClickPixelURLs:(id)a3
{
  id v4 = a3;
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  id v8 = v4;
  if (!confirmedClickPixelURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_confirmedClickPixelURLs;
    self->_confirmedClickPixelURLs = v6;

    id v4 = v8;
    confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  }
  [(NSMutableArray *)confirmedClickPixelURLs addObject:v4];
}

- (unint64_t)confirmedClickPixelURLsCount
{
  return (unint64_t)[(NSMutableArray *)self->_confirmedClickPixelURLs count];
}

- (id)confirmedClickPixelURLsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_confirmedClickPixelURLs objectAtIndex:a3];
}

+ (Class)confirmedClickPixelURLsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBannerQueryString
{
  return self->_bannerQueryString != 0;
}

- (void)clearVideoAssets
{
}

- (void)addVideoAsset:(id)a3
{
  id v4 = a3;
  videoAssets = self->_videoAssets;
  id v8 = v4;
  if (!videoAssets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_videoAssets;
    self->_videoAssets = v6;

    id v4 = v8;
    videoAssets = self->_videoAssets;
  }
  [(NSMutableArray *)videoAssets addObject:v4];
}

- (unint64_t)videoAssetsCount
{
  return (unint64_t)[(NSMutableArray *)self->_videoAssets count];
}

- (id)videoAssetAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_videoAssets objectAtIndex:a3];
}

+ (Class)videoAssetType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMediaFiles
{
  return self->_mediaFiles != 0;
}

- (BOOL)hasAudioURL
{
  return self->_audioURL != 0;
}

- (BOOL)hasSlateImageURL
{
  return self->_slateImageURL != 0;
}

- (BOOL)hasATVTunerImageURL
{
  return self->_aTVTunerImageURL != 0;
}

- (void)setDownloadWebArchivesBeforeShowingBanner:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_downloadWebArchivesBeforeShowingBanner = a3;
}

- (void)setHasDownloadWebArchivesBeforeShowingBanner:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasDownloadWebArchivesBeforeShowingBanner
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setBannerImpressionThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_bannerImpressionThreshold = a3;
}

- (void)setHasBannerImpressionThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasBannerImpressionThreshold
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBannerNewContentCandidacyThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_bannerNewContentCandidacyThreshold = a3;
}

- (void)setHasBannerNewContentCandidacyThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasBannerNewContentCandidacyThreshold
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearScreenSaverImageURLs
{
}

- (void)addScreenSaverImageURL:(id)a3
{
  id v4 = a3;
  screenSaverImageURLs = self->_screenSaverImageURLs;
  id v8 = v4;
  if (!screenSaverImageURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_screenSaverImageURLs;
    self->_screenSaverImageURLs = v6;

    id v4 = v8;
    screenSaverImageURLs = self->_screenSaverImageURLs;
  }
  [(NSMutableArray *)screenSaverImageURLs addObject:v4];
}

- (unint64_t)screenSaverImageURLsCount
{
  return (unint64_t)[(NSMutableArray *)self->_screenSaverImageURLs count];
}

- (id)screenSaverImageURLAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_screenSaverImageURLs objectAtIndex:a3];
}

+ (Class)screenSaverImageURLType
{
  return (Class)objc_opt_class();
}

- (void)clearExcludeTags
{
}

- (void)addExcludeTag:(id)a3
{
  id v4 = a3;
  excludeTags = self->_excludeTags;
  id v8 = v4;
  if (!excludeTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_excludeTags;
    self->_excludeTags = v6;

    id v4 = v8;
    excludeTags = self->_excludeTags;
  }
  [(NSMutableArray *)excludeTags addObject:v4];
}

- (unint64_t)excludeTagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_excludeTags count];
}

- (id)excludeTagAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_excludeTags objectAtIndex:a3];
}

+ (Class)excludeTagType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIAdJSVersion
{
  return self->_iAdJSVersion != 0;
}

- (BOOL)hasIAdJSURL
{
  return self->_iAdJSURL != 0;
}

- (void)clearRewardTokens
{
}

- (void)addRewardTokens:(id)a3
{
  id v4 = a3;
  rewardTokens = self->_rewardTokens;
  id v8 = v4;
  if (!rewardTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rewardTokens;
    self->_rewardTokens = v6;

    id v4 = v8;
    rewardTokens = self->_rewardTokens;
  }
  [(NSMutableArray *)rewardTokens addObject:v4];
}

- (unint64_t)rewardTokensCount
{
  return (unint64_t)[(NSMutableArray *)self->_rewardTokens count];
}

- (id)rewardTokensAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_rewardTokens objectAtIndex:a3];
}

+ (Class)rewardTokensType
{
  return (Class)objc_opt_class();
}

- (void)setRewardTokensExpiration:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rewardTokensExpiration = a3;
}

- (void)setHasRewardTokensExpiration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRewardTokensExpiration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearMatchTagClauses
{
}

- (void)addMatchTagClause:(id)a3
{
  id v4 = a3;
  matchTagClauses = self->_matchTagClauses;
  id v8 = v4;
  if (!matchTagClauses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_matchTagClauses;
    self->_matchTagClauses = v6;

    id v4 = v8;
    matchTagClauses = self->_matchTagClauses;
  }
  [(NSMutableArray *)matchTagClauses addObject:v4];
}

- (unint64_t)matchTagClausesCount
{
  return (unint64_t)[(NSMutableArray *)self->_matchTagClauses count];
}

- (id)matchTagClauseAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_matchTagClauses objectAtIndex:a3];
}

+ (Class)matchTagClauseType
{
  return (Class)objc_opt_class();
}

- (void)setSkipThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_skipThreshold = a3;
}

- (void)setHasSkipThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSkipThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasLogoImageURL
{
  return self->_logoImageURL != 0;
}

- (BOOL)hasHeadlineForLCD
{
  return self->_headlineForLCD != 0;
}

- (BOOL)hasDescriptionForLCD
{
  return self->_descriptionForLCD != 0;
}

- (void)setPriority:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)clearGeofences
{
}

- (void)addGeofences:(id)a3
{
  id v4 = a3;
  geofences = self->_geofences;
  id v8 = v4;
  if (!geofences)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_geofences;
    self->_geofences = v6;

    id v4 = v8;
    geofences = self->_geofences;
  }
  [(NSMutableArray *)geofences addObject:v4];
}

- (unint64_t)geofencesCount
{
  return (unint64_t)[(NSMutableArray *)self->_geofences count];
}

- (id)geofencesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_geofences objectAtIndex:a3];
}

+ (Class)geofencesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTargetAppBundleID
{
  return self->_targetAppBundleID != 0;
}

- (BOOL)hasTargetAppURLScheme
{
  return self->_targetAppURLScheme != 0;
}

- (void)clearCreativeSizes
{
}

- (void)addCreativeSizes:(id)a3
{
  id v4 = a3;
  creativeSizes = self->_creativeSizes;
  id v8 = v4;
  if (!creativeSizes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_creativeSizes;
    self->_creativeSizes = v6;

    id v4 = v8;
    creativeSizes = self->_creativeSizes;
  }
  [(NSMutableArray *)creativeSizes addObject:v4];
}

- (unint64_t)creativeSizesCount
{
  return (unint64_t)[(NSMutableArray *)self->_creativeSizes count];
}

- (id)creativeSizesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_creativeSizes objectAtIndex:a3];
}

+ (Class)creativeSizesType
{
  return (Class)objc_opt_class();
}

- (void)setLetterboxCreativeColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_letterboxCreativeColor = a3;
}

- (void)setHasLetterboxCreativeColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLetterboxCreativeColor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasInstallAttribution
{
  return self->_installAttribution != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (void)setMinimumIntervalBetweenPresentations:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_minimumIntervalBetweenPresentations = a3;
}

- (void)setHasMinimumIntervalBetweenPresentations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMinimumIntervalBetweenPresentations
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)doesNotResetListeningTime
{
  return (*(_WORD *)&self->_has & 0x1000) != 0 && self->_doesNotResetListeningTime;
}

- (void)setDoesNotResetListeningTime:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_doesNotResetListeningTime = a3;
}

- (void)setHasDoesNotResetListeningTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDoesNotResetListeningTime
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasMerchant
{
  return self->_merchant != 0;
}

- (void)clearNativeMetadatas
{
}

- (void)addNativeMetadata:(id)a3
{
  id v4 = a3;
  nativeMetadatas = self->_nativeMetadatas;
  id v8 = v4;
  if (!nativeMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nativeMetadatas;
    self->_nativeMetadatas = v6;

    id v4 = v8;
    nativeMetadatas = self->_nativeMetadatas;
  }
  [(NSMutableArray *)nativeMetadatas addObject:v4];
}

- (unint64_t)nativeMetadatasCount
{
  return (unint64_t)[(NSMutableArray *)self->_nativeMetadatas count];
}

- (id)nativeMetadataAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_nativeMetadatas objectAtIndex:a3];
}

+ (Class)nativeMetadataType
{
  return (Class)objc_opt_class();
}

- (int)desiredPosition
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_desiredPosition;
  }
  else {
    return 1101;
  }
}

- (void)setDesiredPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_desiredPosition = a3;
}

- (void)setHasDesiredPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDesiredPosition
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)desiredPositionAsString:(int)a3
{
  if (a3 == 1101)
  {
    id v4 = @"ResellerNative";
  }
  else if (a3 == 1102)
  {
    id v4 = @"PublisherNative";
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsDesiredPosition:(id)a3
{
  id v3 = a3;
  int v4 = 1101;
  if (([v3 isEqualToString:@"ResellerNative"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PublisherNative"]) {
      int v4 = 1102;
    }
    else {
      int v4 = 1101;
    }
  }

  return v4;
}

- (void)clearActions
{
}

- (void)addActions:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSMutableArray *)actions addObject:v4];
}

- (unint64_t)actionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_actions count];
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_actions objectAtIndex:a3];
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

- (void)clearITunesMetadatas
{
}

- (void)addITunesMetadata:(id)a3
{
  id v4 = a3;
  iTunesMetadatas = self->_iTunesMetadatas;
  id v8 = v4;
  if (!iTunesMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_iTunesMetadatas;
    self->_iTunesMetadatas = v6;

    id v4 = v8;
    iTunesMetadatas = self->_iTunesMetadatas;
  }
  [(NSMutableArray *)iTunesMetadatas addObject:v4];
}

- (unint64_t)iTunesMetadatasCount
{
  return (unint64_t)[(NSMutableArray *)self->_iTunesMetadatas count];
}

- (id)iTunesMetadataAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_iTunesMetadatas objectAtIndex:a3];
}

+ (Class)iTunesMetadataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTransparencyDetails
{
  return self->_transparencyDetails != 0;
}

- (BOOL)hasNativeMediaCreativeMetadata
{
  return self->_nativeMediaCreativeMetadata != 0;
}

- (BOOL)hasAdTagContentString
{
  return self->_adTagContentString != 0;
}

- (void)setMaximumPretapRequestCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_maximumPretapRequestCount = a3;
}

- (void)setHasMaximumPretapRequestCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMaximumPretapRequestCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)adPrivacyMarkPosition
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_adPrivacyMarkPosition;
  }
  else {
    return 0;
  }
}

- (void)setAdPrivacyMarkPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adPrivacyMarkPosition = a3;
}

- (void)setHasAdPrivacyMarkPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAdPrivacyMarkPosition
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)adPrivacyMarkPositionAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002360B0 + a3);
  }

  return v3;
}

- (int)StringAsAdPrivacyMarkPosition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BottomRight"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TopRight"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TopLeft"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BottomLeft"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NoAdPrivacyMark"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAdDataResponseIdentifier
{
  return self->_adDataResponseIdentifier != 0;
}

- (int)unfilledReasonCode
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_unfilledReasonCode;
  }
  else {
    return 201;
  }
}

- (void)setUnfilledReasonCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unfilledReasonCode = a3;
}

- (void)setHasUnfilledReasonCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUnfilledReasonCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)unfilledReasonCodeAsString:(int)a3
{
  if ((a3 - 201) >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002360D8 + a3 - 201);
  }

  return v3;
}

- (int)StringAsUnfilledReasonCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"InventoryUnavailable"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"GlobalExclusion"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"PolicyExclusion"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"LimitExceeded"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"AdsDisabledInIssue"])
  {
    int v4 = 205;
  }
  else
  {
    int v4 = 201;
  }

  return v4;
}

- (BOOL)hasUnfilledReasonInfo
{
  return self->_unfilledReasonInfo != 0;
}

- (BOOL)hasAdOriginalRequesterId
{
  return self->_adOriginalRequesterId != 0;
}

- (BOOL)hasExpressionToEvaluate
{
  return self->_expressionToEvaluate != 0;
}

- (void)clearJourneyStartRelayValues
{
}

- (void)addJourneyStartRelayValues:(id)a3
{
  id v4 = a3;
  journeyStartRelayValues = self->_journeyStartRelayValues;
  id v8 = v4;
  if (!journeyStartRelayValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_journeyStartRelayValues;
    self->_journeyStartRelayValues = v6;

    id v4 = v8;
    journeyStartRelayValues = self->_journeyStartRelayValues;
  }
  [(NSMutableArray *)journeyStartRelayValues addObject:v4];
}

- (unint64_t)journeyStartRelayValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_journeyStartRelayValues count];
}

- (id)journeyStartRelayValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_journeyStartRelayValues objectAtIndex:a3];
}

+ (Class)journeyStartRelayValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearAdLayoutDatas
{
}

- (void)addAdLayoutData:(id)a3
{
  id v4 = a3;
  adLayoutDatas = self->_adLayoutDatas;
  id v8 = v4;
  if (!adLayoutDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adLayoutDatas;
    self->_adLayoutDatas = v6;

    id v4 = v8;
    adLayoutDatas = self->_adLayoutDatas;
  }
  [(NSMutableArray *)adLayoutDatas addObject:v4];
}

- (unint64_t)adLayoutDatasCount
{
  return (unint64_t)[(NSMutableArray *)self->_adLayoutDatas count];
}

- (id)adLayoutDataAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_adLayoutDatas objectAtIndex:a3];
}

+ (Class)adLayoutDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAdType
{
  return self->_adType != 0;
}

- (BOOL)hasAdFormatType
{
  return self->_adFormatType != 0;
}

- (BOOL)hasAdFrequencyCapData
{
  return self->_adFrequencyCapData != 0;
}

- (BOOL)hasPolicyData
{
  return self->_policyData != 0;
}

- (BOOL)hasTargetingDimensions
{
  return self->_targetingDimensions != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdData;
  id v3 = [(APPBAdData *)&v7 description];
  id v4 = [(APPBAdData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  bannerURL = self->_bannerURL;
  if (bannerURL) {
    [v3 setObject:bannerURL forKey:@"bannerURL"];
  }
  bannerWebArchiveURL = self->_bannerWebArchiveURL;
  if (bannerWebArchiveURL) {
    [v4 setObject:bannerWebArchiveURL forKey:@"bannerWebArchiveURL"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v4 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData) {
    [v4 setObject:impressionIdentifierData forKey:@"impressionIdentifierData"];
  }
  humanReadableName = self->_humanReadableName;
  if (humanReadableName) {
    [v4 setObject:humanReadableName forKey:@"humanReadableName"];
  }
  v10 = +[NSNumber numberWithInt:self->_impressionCount];
  [v4 setObject:v10 forKey:@"impressionCount"];

  if (*(_WORD *)&self->_has)
  {
    v11 = +[NSNumber numberWithDouble:self->_expirationDate];
    [v4 setObject:v11 forKey:@"expirationDate"];
  }
  trackingURLs = self->_trackingURLs;
  if (trackingURLs) {
    [v4 setObject:trackingURLs forKey:@"trackingURL"];
  }
  trackingURLSubstitutionParameter = self->_trackingURLSubstitutionParameter;
  if (trackingURLSubstitutionParameter) {
    [v4 setObject:trackingURLSubstitutionParameter forKey:@"trackingURLSubstitutionParameter"];
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    v14 = +[NSNumber numberWithBool:self->_unbranded];
    [v4 setObject:v14 forKey:@"unbranded"];
  }
  accessibilityDescription = self->_accessibilityDescription;
  if (accessibilityDescription) {
    [v4 setObject:accessibilityDescription forKey:@"accessibilityDescription"];
  }
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  if (confirmedClickPixelURLs) {
    [v4 setObject:confirmedClickPixelURLs forKey:@"confirmedClickPixelURLs"];
  }
  bannerQueryString = self->_bannerQueryString;
  if (bannerQueryString) {
    [v4 setObject:bannerQueryString forKey:@"bannerQueryString"];
  }
  if ([(NSMutableArray *)self->_videoAssets count])
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_videoAssets, "count")];
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    v20 = self->_videoAssets;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v173 objects:v185 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v174;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v174 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v173 + 1) + 8 * i) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v173 objects:v185 count:16];
      }
      while (v22);
    }

    [v4 setObject:v19 forKey:@"videoAsset"];
  }
  mediaFiles = self->_mediaFiles;
  if (mediaFiles)
  {
    v27 = [(APPBMediaFiles *)mediaFiles dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"mediaFiles"];
  }
  audioURL = self->_audioURL;
  if (audioURL) {
    [v4 setObject:audioURL forKey:@"audioURL"];
  }
  slateImageURL = self->_slateImageURL;
  if (slateImageURL) {
    [v4 setObject:slateImageURL forKey:@"slateImageURL"];
  }
  aTVTunerImageURL = self->_aTVTunerImageURL;
  if (aTVTunerImageURL) {
    [v4 setObject:aTVTunerImageURL forKey:@"ATVTunerImageURL"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    v86 = +[NSNumber numberWithBool:self->_downloadWebArchivesBeforeShowingBanner];
    [v4 setObject:v86 forKey:@"downloadWebArchivesBeforeShowingBanner"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_44:
      if ((has & 0x80) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_44;
  }
  *(float *)&double v18 = self->_bannerImpressionThreshold;
  v87 = +[NSNumber numberWithFloat:v18];
  [v4 setObject:v87 forKey:@"bannerImpressionThreshold"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_45:
    *(float *)&double v18 = self->_bannerNewContentCandidacyThreshold;
    v32 = +[NSNumber numberWithFloat:v18];
    [v4 setObject:v32 forKey:@"bannerNewContentCandidacyThreshold"];
  }
LABEL_46:
  screenSaverImageURLs = self->_screenSaverImageURLs;
  if (screenSaverImageURLs) {
    [v4 setObject:screenSaverImageURLs forKey:@"screenSaverImageURL"];
  }
  excludeTags = self->_excludeTags;
  if (excludeTags) {
    [v4 setObject:excludeTags forKey:@"excludeTag"];
  }
  iAdJSVersion = self->_iAdJSVersion;
  if (iAdJSVersion) {
    [v4 setObject:iAdJSVersion forKey:@"iAdJSVersion"];
  }
  iAdJSURL = self->_iAdJSURL;
  if (iAdJSURL) {
    [v4 setObject:iAdJSURL forKey:@"iAdJSURL"];
  }
  rewardTokens = self->_rewardTokens;
  if (rewardTokens) {
    [v4 setObject:rewardTokens forKey:@"rewardTokens"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v38 = +[NSNumber numberWithDouble:self->_rewardTokensExpiration];
    [v4 setObject:v38 forKey:@"rewardTokensExpiration"];
  }
  if ([(NSMutableArray *)self->_matchTagClauses count])
  {
    id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_matchTagClauses, "count")];
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    v40 = self->_matchTagClauses;
    id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v169 objects:v184 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v170;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v170 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v169 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v169 objects:v184 count:16];
      }
      while (v42);
    }

    [v4 setObject:v39 forKey:@"matchTagClause"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v46 = +[NSNumber numberWithDouble:self->_skipThreshold];
    [v4 setObject:v46 forKey:@"skipThreshold"];
  }
  logoImageURL = self->_logoImageURL;
  if (logoImageURL) {
    [v4 setObject:logoImageURL forKey:@"logoImageURL"];
  }
  headlineForLCD = self->_headlineForLCD;
  if (headlineForLCD) {
    [v4 setObject:headlineForLCD forKey:@"headlineForLCD"];
  }
  descriptionForLCD = self->_descriptionForLCD;
  if (descriptionForLCD) {
    [v4 setObject:descriptionForLCD forKey:@"descriptionForLCD"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v50 = +[NSNumber numberWithUnsignedLongLong:self->_priority];
    [v4 setObject:v50 forKey:@"priority"];
  }
  if ([(NSMutableArray *)self->_geofences count])
  {
    id v51 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_geofences, "count")];
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    v52 = self->_geofences;
    id v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v165 objects:v183 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v166;
      do
      {
        for (k = 0; k != v54; k = (char *)k + 1)
        {
          if (*(void *)v166 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = [*(id *)(*((void *)&v165 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v51 addObject:v57];
        }
        id v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v165 objects:v183 count:16];
      }
      while (v54);
    }

    [v4 setObject:v51 forKey:@"geofences"];
  }
  targetAppBundleID = self->_targetAppBundleID;
  if (targetAppBundleID) {
    [v4 setObject:targetAppBundleID forKey:@"targetAppBundleID"];
  }
  targetAppURLScheme = self->_targetAppURLScheme;
  if (targetAppURLScheme) {
    [v4 setObject:targetAppURLScheme forKey:@"targetAppURLScheme"];
  }
  if ([(NSMutableArray *)self->_creativeSizes count])
  {
    id v60 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_creativeSizes, "count")];
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    v61 = self->_creativeSizes;
    id v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v161 objects:v182 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v162;
      do
      {
        for (m = 0; m != v63; m = (char *)m + 1)
        {
          if (*(void *)v162 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v161 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v60 addObject:v66];
        }
        id v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v161 objects:v182 count:16];
      }
      while (v63);
    }

    [v4 setObject:v60 forKey:@"creativeSizes"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v67 = +[NSNumber numberWithUnsignedInt:self->_letterboxCreativeColor];
    [v4 setObject:v67 forKey:@"letterboxCreativeColor"];
  }
  installAttribution = self->_installAttribution;
  if (installAttribution)
  {
    v69 = [(APPBInstallAttribution *)installAttribution dictionaryRepresentation];
    [v4 setObject:v69 forKey:@"installAttribution"];
  }
  specification = self->_specification;
  if (specification)
  {
    v71 = [(APPBAdSpecification *)specification dictionaryRepresentation];
    [v4 setObject:v71 forKey:@"specification"];
  }
  __int16 v72 = (__int16)self->_has;
  if ((v72 & 2) != 0)
  {
    v73 = +[NSNumber numberWithDouble:self->_minimumIntervalBetweenPresentations];
    [v4 setObject:v73 forKey:@"minimumIntervalBetweenPresentations"];

    __int16 v72 = (__int16)self->_has;
  }
  if ((v72 & 0x1000) != 0)
  {
    v74 = +[NSNumber numberWithBool:self->_doesNotResetListeningTime];
    [v4 setObject:v74 forKey:@"doesNotResetListeningTime"];
  }
  merchant = self->_merchant;
  if (merchant)
  {
    v76 = [(APPBMerchant *)merchant dictionaryRepresentation];
    [v4 setObject:v76 forKey:@"merchant"];
  }
  if ([(NSMutableArray *)self->_nativeMetadatas count])
  {
    id v77 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nativeMetadatas, "count")];
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    v78 = self->_nativeMetadatas;
    id v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v157 objects:v181 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v158;
      do
      {
        for (n = 0; n != v80; n = (char *)n + 1)
        {
          if (*(void *)v158 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = [*(id *)(*((void *)&v157 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v77 addObject:v83];
        }
        id v80 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v157 objects:v181 count:16];
      }
      while (v80);
    }

    [v4 setObject:v77 forKey:@"nativeMetadata"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    int desiredPosition = self->_desiredPosition;
    if (desiredPosition == 1101)
    {
      v85 = @"ResellerNative";
    }
    else if (desiredPosition == 1102)
    {
      v85 = @"PublisherNative";
    }
    else
    {
      v85 = +[NSString stringWithFormat:@"(unknown: %i)", self->_desiredPosition];
    }
    [v4 setObject:v85 forKey:@"desiredPosition"];
  }
  if ([(NSMutableArray *)self->_actions count])
  {
    id v88 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_actions, "count")];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    v89 = self->_actions;
    id v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v153 objects:v180 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v154;
      do
      {
        for (ii = 0; ii != v91; ii = (char *)ii + 1)
        {
          if (*(void *)v154 != v92) {
            objc_enumerationMutation(v89);
          }
          v94 = [*(id *)(*((void *)&v153 + 1) + 8 * (void)ii) dictionaryRepresentation];
          [v88 addObject:v94];
        }
        id v91 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v153 objects:v180 count:16];
      }
      while (v91);
    }

    [v4 setObject:v88 forKey:@"actions"];
  }
  if ([(NSMutableArray *)self->_iTunesMetadatas count])
  {
    id v95 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_iTunesMetadatas, "count")];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v96 = self->_iTunesMetadatas;
    id v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v149 objects:v179 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v150;
      do
      {
        for (jj = 0; jj != v98; jj = (char *)jj + 1)
        {
          if (*(void *)v150 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = [*(id *)(*((void *)&v149 + 1) + 8 * (void)jj) dictionaryRepresentation];
          [v95 addObject:v101];
        }
        id v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v149 objects:v179 count:16];
      }
      while (v98);
    }

    [v4 setObject:v95 forKey:@"iTunesMetadata"];
  }
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v103 = [(APPBTransparencyDetails *)transparencyDetails dictionaryRepresentation];
    [v4 setObject:v103 forKey:@"transparencyDetails"];
  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  if (nativeMediaCreativeMetadata)
  {
    v105 = [(APPBNativeMediaCreativeMetadata *)nativeMediaCreativeMetadata dictionaryRepresentation];
    [v4 setObject:v105 forKey:@"nativeMediaCreativeMetadata"];
  }
  adTagContentString = self->_adTagContentString;
  if (adTagContentString) {
    [v4 setObject:adTagContentString forKey:@"adTagContentString"];
  }
  __int16 v107 = (__int16)self->_has;
  if ((v107 & 0x400) != 0)
  {
    v108 = +[NSNumber numberWithInt:self->_maximumPretapRequestCount];
    [v4 setObject:v108 forKey:@"maximumPretapRequestCount"];

    __int16 v107 = (__int16)self->_has;
  }
  if ((v107 & 0x20) != 0)
  {
    uint64_t adPrivacyMarkPosition = self->_adPrivacyMarkPosition;
    if (adPrivacyMarkPosition >= 5)
    {
      v110 = +[NSString stringWithFormat:@"(unknown: %i)", self->_adPrivacyMarkPosition];
    }
    else
    {
      v110 = *(&off_1002360B0 + adPrivacyMarkPosition);
    }
    [v4 setObject:v110 forKey:@"adPrivacyMarkPosition"];
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier) {
    [v4 setObject:adDataResponseIdentifier forKey:@"adDataResponseIdentifier"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    int v112 = self->_unfilledReasonCode - 201;
    if (v112 >= 5)
    {
      v113 = +[NSString stringWithFormat:@"(unknown: %i)", self->_unfilledReasonCode];
    }
    else
    {
      v113 = *(&off_1002360D8 + v112);
    }
    [v4 setObject:v113 forKey:@"unfilledReasonCode"];
  }
  unfilledReasonInfo = self->_unfilledReasonInfo;
  if (unfilledReasonInfo) {
    [v4 setObject:unfilledReasonInfo forKey:@"unfilledReasonInfo"];
  }
  adOriginalRequesterId = self->_adOriginalRequesterId;
  if (adOriginalRequesterId) {
    [v4 setObject:adOriginalRequesterId forKey:@"adOriginalRequesterId"];
  }
  expressionToEvaluate = self->_expressionToEvaluate;
  if (expressionToEvaluate) {
    [v4 setObject:expressionToEvaluate forKey:@"expressionToEvaluate"];
  }
  if ([(NSMutableArray *)self->_journeyStartRelayValues count])
  {
    id v117 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_journeyStartRelayValues, "count")];
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v118 = self->_journeyStartRelayValues;
    id v119 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v145 objects:v178 count:16];
    if (v119)
    {
      id v120 = v119;
      uint64_t v121 = *(void *)v146;
      do
      {
        for (kk = 0; kk != v120; kk = (char *)kk + 1)
        {
          if (*(void *)v146 != v121) {
            objc_enumerationMutation(v118);
          }
          v123 = [*(id *)(*((void *)&v145 + 1) + 8 * (void)kk) dictionaryRepresentation];
          [v117 addObject:v123];
        }
        id v120 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v145 objects:v178 count:16];
      }
      while (v120);
    }

    [v4 setObject:v117 forKey:@"journeyStartRelayValues"];
  }
  if ([(NSMutableArray *)self->_adLayoutDatas count])
  {
    id v124 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_adLayoutDatas, "count")];
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v125 = self->_adLayoutDatas;
    id v126 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v141 objects:v177 count:16];
    if (v126)
    {
      id v127 = v126;
      uint64_t v128 = *(void *)v142;
      do
      {
        for (mm = 0; mm != v127; mm = (char *)mm + 1)
        {
          if (*(void *)v142 != v128) {
            objc_enumerationMutation(v125);
          }
          v130 = [*(id *)(*((void *)&v141 + 1) + 8 * (void)mm) dictionaryRepresentation];
          [v124 addObject:v130];
        }
        id v127 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v141 objects:v177 count:16];
      }
      while (v127);
    }

    [v4 setObject:v124 forKey:@"adLayoutData"];
  }
  adType = self->_adType;
  if (adType) {
    [v4 setObject:adType forKey:@"AdType"];
  }
  adFormatType = self->_adFormatType;
  if (adFormatType) {
    [v4 setObject:adFormatType forKey:@"AdFormatType"];
  }
  adFrequencyCapData = self->_adFrequencyCapData;
  if (adFrequencyCapData)
  {
    v134 = [(APPBAdFrequencyCapData *)adFrequencyCapData dictionaryRepresentation];
    [v4 setObject:v134 forKey:@"adFrequencyCapData"];
  }
  policyData = self->_policyData;
  if (policyData)
  {
    v136 = [(APPBPolicyData *)policyData dictionaryRepresentation];
    [v4 setObject:v136 forKey:@"policyData"];
  }
  targetingDimensions = self->_targetingDimensions;
  if (targetingDimensions)
  {
    v138 = [(APPBTargetingDimensions *)targetingDimensions dictionaryRepresentation];
    [v4 setObject:v138 forKey:@"targetingDimensions"];
  }
  id v139 = v4;

  return v139;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_bannerURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_bannerWebArchiveURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_uniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_impressionIdentifierData) {
    PBDataWriterWriteDataField();
  }
  if (self->_humanReadableName) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt32Field();
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v5 = self->_trackingURLs;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v130 objects:v147 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v131;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v131 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v130 objects:v147 count:16];
    }
    while (v7);
  }

  if (self->_trackingURLSubstitutionParameter) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_accessibilityDescription) {
    PBDataWriterWriteStringField();
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  v10 = self->_confirmedClickPixelURLs;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v126 objects:v146 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v127;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v127 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v126 objects:v146 count:16];
    }
    while (v12);
  }

  if (self->_bannerQueryString) {
    PBDataWriterWriteStringField();
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v15 = self->_videoAssets;
  v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v122 objects:v145 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v123;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(void *)v123 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v122 objects:v145 count:16];
    }
    while (v17);
  }

  if (self->_mediaFiles) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_audioURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_slateImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_aTVTunerImageURL) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_52:
      if ((has & 0x80) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_53:
  }
    PBDataWriterWriteFloatField();
LABEL_54:
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v21 = self->_screenSaverImageURLs;
  id v22 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v118 objects:v144 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v119;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(void *)v119 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v118 objects:v144 count:16];
    }
    while (v23);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v26 = self->_excludeTags;
  v27 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v114 objects:v143 count:16];
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = *(void *)v115;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(void *)v115 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteStringField();
      }
      v28 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v114 objects:v143 count:16];
    }
    while (v28);
  }

  if (self->_iAdJSVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_iAdJSURL) {
    PBDataWriterWriteStringField();
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v31 = self->_rewardTokens;
  v32 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v110 objects:v142 count:16];
  if (v32)
  {
    v33 = v32;
    uint64_t v34 = *(void *)v111;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(void *)v111 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteStringField();
      }
      v33 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v110 objects:v142 count:16];
    }
    while (v33);
  }

  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v36 = self->_matchTagClauses;
  v37 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v106 objects:v141 count:16];
  if (v37)
  {
    v38 = v37;
    uint64_t v39 = *(void *)v107;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(void *)v107 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      v38 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v106 objects:v141 count:16];
    }
    while (v38);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_logoImageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_headlineForLCD) {
    PBDataWriterWriteStringField();
  }
  if (self->_descriptionForLCD) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteFixed64Field();
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v41 = self->_geofences;
  id v42 = (char *)[(NSMutableArray *)v41 countByEnumeratingWithState:&v102 objects:v140 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v103;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(void *)v103 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = (char *)[(NSMutableArray *)v41 countByEnumeratingWithState:&v102 objects:v140 count:16];
    }
    while (v43);
  }

  if (self->_targetAppBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_targetAppURLScheme) {
    PBDataWriterWriteStringField();
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v46 = self->_creativeSizes;
  v47 = (char *)[(NSMutableArray *)v46 countByEnumeratingWithState:&v98 objects:v139 count:16];
  if (v47)
  {
    v48 = v47;
    uint64_t v49 = *(void *)v99;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(void *)v99 != v49) {
          objc_enumerationMutation(v46);
        }
        PBDataWriterWriteSubmessage();
      }
      v48 = (char *)[(NSMutableArray *)v46 countByEnumeratingWithState:&v98 objects:v139 count:16];
    }
    while (v48);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteFixed32Field();
  }
  if (self->_installAttribution) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_specification) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v51 = (__int16)self->_has;
  if ((v51 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v51 = (__int16)self->_has;
  }
  if ((v51 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_merchant) {
    PBDataWriterWriteSubmessage();
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v52 = self->_nativeMetadatas;
  id v53 = (char *)[(NSMutableArray *)v52 countByEnumeratingWithState:&v94 objects:v138 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v95;
    do
    {
      for (nn = 0; nn != v54; ++nn)
      {
        if (*(void *)v95 != v55) {
          objc_enumerationMutation(v52);
        }
        PBDataWriterWriteSubmessage();
      }
      id v54 = (char *)[(NSMutableArray *)v52 countByEnumeratingWithState:&v94 objects:v138 count:16];
    }
    while (v54);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v57 = self->_actions;
  v58 = (char *)[(NSMutableArray *)v57 countByEnumeratingWithState:&v90 objects:v137 count:16];
  if (v58)
  {
    v59 = v58;
    uint64_t v60 = *(void *)v91;
    do
    {
      for (i1 = 0; i1 != v59; ++i1)
      {
        if (*(void *)v91 != v60) {
          objc_enumerationMutation(v57);
        }
        PBDataWriterWriteSubmessage();
      }
      v59 = (char *)[(NSMutableArray *)v57 countByEnumeratingWithState:&v90 objects:v137 count:16];
    }
    while (v59);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v62 = self->_iTunesMetadatas;
  id v63 = (char *)[(NSMutableArray *)v62 countByEnumeratingWithState:&v86 objects:v136 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v87;
    do
    {
      for (i2 = 0; i2 != v64; ++i2)
      {
        if (*(void *)v87 != v65) {
          objc_enumerationMutation(v62);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v64 = (char *)[(NSMutableArray *)v62 countByEnumeratingWithState:&v86 objects:v136 count:16];
    }
    while (v64);
  }

  if (self->_transparencyDetails) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nativeMediaCreativeMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_adTagContentString) {
    PBDataWriterWriteStringField();
  }
  __int16 v67 = (__int16)self->_has;
  if ((v67 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v67 = (__int16)self->_has;
  }
  if ((v67 & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_adDataResponseIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_unfilledReasonInfo) {
    PBDataWriterWriteStringField();
  }
  if (self->_adOriginalRequesterId) {
    PBDataWriterWriteStringField();
  }
  if (self->_expressionToEvaluate) {
    PBDataWriterWriteStringField();
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v68 = self->_journeyStartRelayValues;
  v69 = (char *)[(NSMutableArray *)v68 countByEnumeratingWithState:&v82 objects:v135 count:16];
  if (v69)
  {
    v70 = v69;
    uint64_t v71 = *(void *)v83;
    do
    {
      for (i3 = 0; i3 != v70; ++i3)
      {
        if (*(void *)v83 != v71) {
          objc_enumerationMutation(v68);
        }
        PBDataWriterWriteSubmessage();
      }
      v70 = (char *)[(NSMutableArray *)v68 countByEnumeratingWithState:&v82 objects:v135 count:16];
    }
    while (v70);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v73 = self->_adLayoutDatas;
  v74 = (char *)[(NSMutableArray *)v73 countByEnumeratingWithState:&v78 objects:v134 count:16];
  if (v74)
  {
    v75 = v74;
    uint64_t v76 = *(void *)v79;
    do
    {
      for (i4 = 0; i4 != v75; ++i4)
      {
        if (*(void *)v79 != v76) {
          objc_enumerationMutation(v73);
        }
        PBDataWriterWriteSubmessage();
      }
      v75 = (char *)[(NSMutableArray *)v73 countByEnumeratingWithState:&v78 objects:v134 count:16];
    }
    while (v75);
  }

  if (self->_adType) {
    PBDataWriterWriteStringField();
  }
  if (self->_adFormatType) {
    PBDataWriterWriteStringField();
  }
  if (self->_adFrequencyCapData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_policyData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_targetingDimensions) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v69 = v4;
  if (self->_bannerURL)
  {
    [v4 setBannerURL:];
    id v4 = v69;
  }
  if (self->_bannerWebArchiveURL)
  {
    [v69 setBannerWebArchiveURL:];
    id v4 = v69;
  }
  if (self->_uniqueIdentifier)
  {
    [v69 setUniqueIdentifier:];
    id v4 = v69;
  }
  if (self->_impressionIdentifierData)
  {
    [v69 setImpressionIdentifierData:];
    id v4 = v69;
  }
  if (self->_humanReadableName)
  {
    [v69 setHumanReadableName:];
    id v4 = v69;
  }
  *((_DWORD *)v4 + 68) = self->_impressionCount;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_expirationDate;
    *((_WORD *)v4 + 246) |= 1u;
  }
  if ([(APPBAdData *)self trackingURLsCount])
  {
    [v69 clearTrackingURLs];
    unint64_t v5 = [(APPBAdData *)self trackingURLsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBAdData *)self trackingURLAtIndex:i];
        [v69 addTrackingURL:v8];
      }
    }
  }
  if (self->_trackingURLSubstitutionParameter) {
    [v69 setTrackingURLSubstitutionParameter:];
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((unsigned char *)v69 + 490) = self->_unbranded;
    *((_WORD *)v69 + 246) |= 0x4000u;
  }
  if (self->_accessibilityDescription) {
    [v69 setAccessibilityDescription:];
  }
  if ([(APPBAdData *)self confirmedClickPixelURLsCount])
  {
    [v69 clearConfirmedClickPixelURLs];
    unint64_t v9 = [(APPBAdData *)self confirmedClickPixelURLsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(APPBAdData *)self confirmedClickPixelURLsAtIndex:j];
        [v69 addConfirmedClickPixelURLs:v12];
      }
    }
  }
  if (self->_bannerQueryString) {
    [v69 setBannerQueryString:];
  }
  if ([(APPBAdData *)self videoAssetsCount])
  {
    [v69 clearVideoAssets];
    unint64_t v13 = [(APPBAdData *)self videoAssetsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = [(APPBAdData *)self videoAssetAtIndex:k];
        [v69 addVideoAsset:v16];
      }
    }
  }
  if (self->_mediaFiles) {
    [v69 setMediaFiles:];
  }
  v17 = v69;
  if (self->_audioURL)
  {
    [v69 setAudioURL:];
    v17 = v69;
  }
  if (self->_slateImageURL)
  {
    [v69 setSlateImageURL:];
    v17 = v69;
  }
  if (self->_aTVTunerImageURL)
  {
    [v69 setATVTunerImageURL:];
    v17 = v69;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
    if ((has & 0x40) == 0) {
      goto LABEL_43;
    }
LABEL_157:
    v17[36] = LODWORD(self->_bannerImpressionThreshold);
    *((_WORD *)v17 + 246) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  *((unsigned char *)v17 + 489) = self->_downloadWebArchivesBeforeShowingBanner;
  *((_WORD *)v17 + 246) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_157;
  }
LABEL_43:
  if ((has & 0x80) != 0)
  {
LABEL_44:
    v17[37] = LODWORD(self->_bannerNewContentCandidacyThreshold);
    *((_WORD *)v17 + 246) |= 0x80u;
  }
LABEL_45:
  if ([(APPBAdData *)self screenSaverImageURLsCount])
  {
    [v69 clearScreenSaverImageURLs];
    unint64_t v19 = [(APPBAdData *)self screenSaverImageURLsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        id v22 = [(APPBAdData *)self screenSaverImageURLAtIndex:m];
        [v69 addScreenSaverImageURL:v22];
      }
    }
  }
  if ([(APPBAdData *)self excludeTagsCount])
  {
    [v69 clearExcludeTags];
    unint64_t v23 = [(APPBAdData *)self excludeTagsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        v26 = [(APPBAdData *)self excludeTagAtIndex:n];
        [v69 addExcludeTag:v26];
      }
    }
  }
  if (self->_iAdJSVersion) {
    [v69 setIAdJSVersion:];
  }
  if (self->_iAdJSURL) {
    [v69 setIAdJSURL:];
  }
  if ([(APPBAdData *)self rewardTokensCount])
  {
    [v69 clearRewardTokens];
    unint64_t v27 = [(APPBAdData *)self rewardTokensCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (iuint64_t i = 0; ii != v28; ++ii)
      {
        v30 = [(APPBAdData *)self rewardTokensAtIndex:ii];
        [v69 addRewardTokens:v30];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((void *)v69 + 4) = *(void *)&self->_rewardTokensExpiration;
    *((_WORD *)v69 + 246) |= 8u;
  }
  if ([(APPBAdData *)self matchTagClausesCount])
  {
    [v69 clearMatchTagClauses];
    unint64_t v31 = [(APPBAdData *)self matchTagClausesCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (juint64_t j = 0; jj != v32; ++jj)
      {
        uint64_t v34 = [(APPBAdData *)self matchTagClauseAtIndex:jj];
        [v69 addMatchTagClause:v34];
      }
    }
  }
  v35 = v69;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((void *)v69 + 5) = *(void *)&self->_skipThreshold;
    *((_WORD *)v69 + 246) |= 0x10u;
  }
  if (self->_logoImageURL)
  {
    [v69 setLogoImageURL:];
    v35 = v69;
  }
  if (self->_headlineForLCD)
  {
    [v69 setHeadlineForLCD];
    v35 = v69;
  }
  if (self->_descriptionForLCD)
  {
    [v69 setDescriptionForLCD:];
    v35 = v69;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v35[3] = self->_priority;
    *((_WORD *)v35 + 246) |= 4u;
  }
  if ([(APPBAdData *)self geofencesCount])
  {
    [v69 clearGeofences];
    unint64_t v36 = [(APPBAdData *)self geofencesCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (kuint64_t k = 0; kk != v37; ++kk)
      {
        uint64_t v39 = [(APPBAdData *)self geofencesAtIndex:kk];
        [v69 addGeofences:v39];
      }
    }
  }
  if (self->_targetAppBundleID) {
    [v69 setTargetAppBundleID:];
  }
  if (self->_targetAppURLScheme) {
    [v69 setTargetAppURLScheme:];
  }
  if ([(APPBAdData *)self creativeSizesCount])
  {
    [v69 clearCreativeSizes];
    unint64_t v40 = [(APPBAdData *)self creativeSizesCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (muint64_t m = 0; mm != v41; ++mm)
      {
        uint64_t v43 = [(APPBAdData *)self creativeSizesAtIndex:mm];
        [v69 addCreativeSizes:v43];
      }
    }
  }
  uint64_t v44 = v69;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v69 + 76) = self->_letterboxCreativeColor;
    *((_WORD *)v69 + 246) |= 0x200u;
  }
  if (self->_installAttribution)
  {
    [v69 setInstallAttribution:];
    uint64_t v44 = v69;
  }
  if (self->_specification)
  {
    [v69 setSpecification:];
    uint64_t v44 = v69;
  }
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 2) != 0)
  {
    v44[2] = *(void *)&self->_minimumIntervalBetweenPresentations;
    *((_WORD *)v44 + 246) |= 2u;
    __int16 v45 = (__int16)self->_has;
  }
  if ((v45 & 0x1000) != 0)
  {
    *((unsigned char *)v44 + 488) = self->_doesNotResetListeningTime;
    *((_WORD *)v44 + 246) |= 0x1000u;
  }
  if (self->_merchant) {
    [v69 setMerchant:];
  }
  if ([(APPBAdData *)self nativeMetadatasCount])
  {
    [v69 clearNativeMetadatas];
    unint64_t v46 = [(APPBAdData *)self nativeMetadatasCount];
    if (v46)
    {
      unint64_t v47 = v46;
      for (nuint64_t n = 0; nn != v47; ++nn)
      {
        uint64_t v49 = [(APPBAdData *)self nativeMetadataAtIndex:nn];
        [v69 addNativeMetadata:v49];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v69 + 50) = self->_desiredPosition;
    *((_WORD *)v69 + 246) |= 0x100u;
  }
  if ([(APPBAdData *)self actionsCount])
  {
    [v69 clearActions];
    unint64_t v50 = [(APPBAdData *)self actionsCount];
    if (v50)
    {
      unint64_t v51 = v50;
      for (uint64_t i1 = 0; i1 != v51; ++i1)
      {
        id v53 = [(APPBAdData *)self actionsAtIndex:i1];
        [v69 addActions:v53];
      }
    }
  }
  if ([(APPBAdData *)self iTunesMetadatasCount])
  {
    [v69 clearITunesMetadatas];
    unint64_t v54 = [(APPBAdData *)self iTunesMetadatasCount];
    if (v54)
    {
      unint64_t v55 = v54;
      for (uint64_t i2 = 0; i2 != v55; ++i2)
      {
        v57 = [(APPBAdData *)self iTunesMetadataAtIndex:i2];
        [v69 addITunesMetadata:v57];
      }
    }
  }
  if (self->_transparencyDetails) {
    [v69 setTransparencyDetails:];
  }
  v58 = v69;
  if (self->_nativeMediaCreativeMetadata)
  {
    [v69 setNativeMediaCreativeMetadata:];
    v58 = v69;
  }
  if (self->_adTagContentString)
  {
    [v69 setAdTagContentString:];
    v58 = v69;
  }
  __int16 v59 = (__int16)self->_has;
  if ((v59 & 0x400) != 0)
  {
    v58[82] = self->_maximumPretapRequestCount;
    *((_WORD *)v58 + 246) |= 0x400u;
    __int16 v59 = (__int16)self->_has;
  }
  if ((v59 & 0x20) != 0)
  {
    v58[28] = self->_adPrivacyMarkPosition;
    *((_WORD *)v58 + 246) |= 0x20u;
  }
  if (self->_adDataResponseIdentifier)
  {
    [v69 setAdDataResponseIdentifier:];
    v58 = v69;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v58[114] = self->_unfilledReasonCode;
    *((_WORD *)v58 + 246) |= 0x800u;
  }
  if (self->_unfilledReasonInfo) {
    [v69 setUnfilledReasonInfo:];
  }
  if (self->_adOriginalRequesterId) {
    [v69 setAdOriginalRequesterId:];
  }
  if (self->_expressionToEvaluate) {
    [v69 setExpressionToEvaluate:];
  }
  if ([(APPBAdData *)self journeyStartRelayValuesCount])
  {
    [v69 clearJourneyStartRelayValues];
    unint64_t v60 = [(APPBAdData *)self journeyStartRelayValuesCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i3 = 0; i3 != v61; ++i3)
      {
        id v63 = [(APPBAdData *)self journeyStartRelayValuesAtIndex:i3];
        [v69 addJourneyStartRelayValues:v63];
      }
    }
  }
  if ([(APPBAdData *)self adLayoutDatasCount])
  {
    [v69 clearAdLayoutDatas];
    unint64_t v64 = [(APPBAdData *)self adLayoutDatasCount];
    if (v64)
    {
      unint64_t v65 = v64;
      for (uint64_t i4 = 0; i4 != v65; ++i4)
      {
        __int16 v67 = [(APPBAdData *)self adLayoutDataAtIndex:i4];
        [v69 addAdLayoutData:v67];
      }
    }
  }
  if (self->_adType) {
    [v69 setAdType:];
  }
  v68 = v69;
  if (self->_adFormatType)
  {
    [v69 setAdFormatType:];
    v68 = v69;
  }
  if (self->_adFrequencyCapData)
  {
    [v69 setAdFrequencyCapData:];
    v68 = v69;
  }
  if (self->_policyData)
  {
    [v69 setPolicyData:];
    v68 = v69;
  }
  if (self->_targetingDimensions)
  {
    [v69 setTargetingDimensions:];
    v68 = v69;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_bannerURL copyWithZone:a3];
  objc_super v7 = (void *)v5[20];
  v5[20] = v6;

  id v8 = [(NSString *)self->_bannerWebArchiveURL copyWithZone:a3];
  unint64_t v9 = (void *)v5[21];
  v5[21] = v8;

  id v10 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v11 = (void *)v5[59];
  v5[59] = v10;

  id v12 = [(NSData *)self->_impressionIdentifierData copyWithZone:a3];
  unint64_t v13 = (void *)v5[35];
  v5[35] = v12;

  id v14 = [(NSString *)self->_humanReadableName copyWithZone:a3];
  v15 = (void *)v5[30];
  v5[30] = v14;

  *((_DWORD *)v5 + 68) = self->_impressionCount;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_expirationDate;
    *((_WORD *)v5 + 246) |= 1u;
  }
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  v16 = self->_trackingURLs;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v215 objects:v232 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v216;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v216 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v215 + 1) + 8 * i) copyWithZone:a3];
        [v5 addTrackingURL:v21];
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v215 objects:v232 count:16];
    }
    while (v18);
  }

  id v22 = [(NSString *)self->_trackingURLSubstitutionParameter copyWithZone:a3];
  unint64_t v23 = (void *)v5[54];
  v5[54] = v22;

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((unsigned char *)v5 + 490) = self->_unbranded;
    *((_WORD *)v5 + 246) |= 0x4000u;
  }
  id v24 = [(NSString *)self->_accessibilityDescription copyWithZone:a3];
  v25 = (void *)v5[7];
  v5[7] = v24;

  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  v26 = self->_confirmedClickPixelURLs;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v211 objects:v231 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v212;
    do
    {
      for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v212 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = [*(id *)(*((void *)&v211 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addConfirmedClickPixelURLs:v31];
      }
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v211 objects:v231 count:16];
    }
    while (v28);
  }

  id v32 = [(NSString *)self->_bannerQueryString copyWithZone:a3];
  v33 = (void *)v5[19];
  v5[19] = v32;

  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  uint64_t v34 = self->_videoAssets;
  id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v207 objects:v230 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v208;
    do
    {
      for (uint64_t k = 0; k != v36; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v208 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = [*(id *)(*((void *)&v207 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addVideoAsset:v39];
      }
      id v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v207 objects:v230 count:16];
    }
    while (v36);
  }

  id v40 = [(APPBMediaFiles *)self->_mediaFiles copyWithZone:a3];
  unint64_t v41 = (void *)v5[42];
  v5[42] = v40;

  id v42 = [(NSString *)self->_audioURL copyWithZone:a3];
  uint64_t v43 = (void *)v5[17];
  v5[17] = v42;

  id v44 = [(NSString *)self->_slateImageURL copyWithZone:a3];
  __int16 v45 = (void *)v5[49];
  v5[49] = v44;

  id v46 = [(NSString *)self->_aTVTunerImageURL copyWithZone:a3];
  unint64_t v47 = (void *)v5[6];
  v5[6] = v46;

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    *((unsigned char *)v5 + 489) = self->_downloadWebArchivesBeforeShowingBanner;
    *((_WORD *)v5 + 246) |= 0x2000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_28:
      if ((has & 0x80) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v5 + 36) = LODWORD(self->_bannerImpressionThreshold);
  *((_WORD *)v5 + 246) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_29:
    *((_DWORD *)v5 + 37) = LODWORD(self->_bannerNewContentCandidacyThreshold);
    *((_WORD *)v5 + 246) |= 0x80u;
  }
LABEL_30:
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  uint64_t v49 = self->_screenSaverImageURLs;
  id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v203 objects:v229 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v204;
    do
    {
      for (uint64_t m = 0; m != v51; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v204 != v52) {
          objc_enumerationMutation(v49);
        }
        id v54 = [*(id *)(*((void *)&v203 + 1) + 8 * (void)m) copyWithZone:a3];
        [v5 addScreenSaverImageURL:v54];
      }
      id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v203 objects:v229 count:16];
    }
    while (v51);
  }

  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  unint64_t v55 = self->_excludeTags;
  id v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v199 objects:v228 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v200;
    do
    {
      for (uint64_t n = 0; n != v57; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v200 != v58) {
          objc_enumerationMutation(v55);
        }
        id v60 = [*(id *)(*((void *)&v199 + 1) + 8 * (void)n) copyWithZone:a3];
        [v5 addExcludeTag:v60];
      }
      id v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v199 objects:v228 count:16];
    }
    while (v57);
  }

  id v61 = [(NSString *)self->_iAdJSVersion copyWithZone:a3];
  id v62 = (void *)v5[32];
  v5[32] = v61;

  id v63 = [(NSString *)self->_iAdJSURL copyWithZone:a3];
  unint64_t v64 = (void *)v5[31];
  v5[31] = v63;

  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  unint64_t v65 = self->_rewardTokens;
  id v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v195 objects:v227 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v196;
    do
    {
      for (iuint64_t i = 0; ii != v67; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v196 != v68) {
          objc_enumerationMutation(v65);
        }
        id v70 = [*(id *)(*((void *)&v195 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v5 addRewardTokens:v70];
      }
      id v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v195 objects:v227 count:16];
    }
    while (v67);
  }

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v5[4] = *(void *)&self->_rewardTokensExpiration;
    *((_WORD *)v5 + 246) |= 8u;
  }
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  uint64_t v71 = self->_matchTagClauses;
  id v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v191 objects:v226 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v192;
    do
    {
      for (juint64_t j = 0; jj != v73; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v192 != v74) {
          objc_enumerationMutation(v71);
        }
        id v76 = [*(id *)(*((void *)&v191 + 1) + 8 * (void)jj) copyWithZone:a3];
        [v5 addMatchTagClause:v76];
      }
      id v73 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v191 objects:v226 count:16];
    }
    while (v73);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[5] = *(void *)&self->_skipThreshold;
    *((_WORD *)v5 + 246) |= 0x10u;
  }
  id v77 = [(NSString *)self->_logoImageURL copyWithZone:a3];
  long long v78 = (void *)v5[39];
  v5[39] = v77;

  id v79 = [(NSString *)self->_headlineForLCD copyWithZone:a3];
  long long v80 = (void *)v5[29];
  v5[29] = v79;

  id v81 = [(NSString *)self->_descriptionForLCD copyWithZone:a3];
  long long v82 = (void *)v5[24];
  v5[24] = v81;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v5[3] = self->_priority;
    *((_WORD *)v5 + 246) |= 4u;
  }
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v83 = self->_geofences;
  id v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v187 objects:v225 count:16];
  if (v84)
  {
    id v85 = v84;
    uint64_t v86 = *(void *)v188;
    do
    {
      for (kuint64_t k = 0; kk != v85; kuint64_t k = (char *)kk + 1)
      {
        if (*(void *)v188 != v86) {
          objc_enumerationMutation(v83);
        }
        id v88 = [*(id *)(*((void *)&v187 + 1) + 8 * (void)kk) copyWithZone:a3];
        [v5 addGeofences:v88];
      }
      id v85 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v187 objects:v225 count:16];
    }
    while (v85);
  }

  id v89 = [(NSString *)self->_targetAppBundleID copyWithZone:a3];
  long long v90 = (void *)v5[51];
  v5[51] = v89;

  id v91 = [(NSString *)self->_targetAppURLScheme copyWithZone:a3];
  long long v92 = (void *)v5[52];
  v5[52] = v91;

  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v93 = self->_creativeSizes;
  id v94 = [(NSMutableArray *)v93 countByEnumeratingWithState:&v183 objects:v224 count:16];
  if (v94)
  {
    id v95 = v94;
    uint64_t v96 = *(void *)v184;
    do
    {
      for (muint64_t m = 0; mm != v95; muint64_t m = (char *)mm + 1)
      {
        if (*(void *)v184 != v96) {
          objc_enumerationMutation(v93);
        }
        id v98 = [*(id *)(*((void *)&v183 + 1) + 8 * (void)mm) copyWithZone:a3];
        [v5 addCreativeSizes:v98];
      }
      id v95 = [(NSMutableArray *)v93 countByEnumeratingWithState:&v183 objects:v224 count:16];
    }
    while (v95);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v5 + 76) = self->_letterboxCreativeColor;
    *((_WORD *)v5 + 246) |= 0x200u;
  }
  id v99 = [(APPBInstallAttribution *)self->_installAttribution copyWithZone:a3];
  long long v100 = (void *)v5[36];
  v5[36] = v99;

  id v101 = [(APPBAdSpecification *)self->_specification copyWithZone:a3];
  long long v102 = (void *)v5[50];
  v5[50] = v101;

  __int16 v103 = (__int16)self->_has;
  if ((v103 & 2) != 0)
  {
    v5[2] = *(void *)&self->_minimumIntervalBetweenPresentations;
    *((_WORD *)v5 + 246) |= 2u;
    __int16 v103 = (__int16)self->_has;
  }
  if ((v103 & 0x1000) != 0)
  {
    *((unsigned char *)v5 + 488) = self->_doesNotResetListeningTime;
    *((_WORD *)v5 + 246) |= 0x1000u;
  }
  id v104 = [(APPBMerchant *)self->_merchant copyWithZone:a3];
  long long v105 = (void *)v5[43];
  v5[43] = v104;

  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  long long v106 = self->_nativeMetadatas;
  id v107 = [(NSMutableArray *)v106 countByEnumeratingWithState:&v179 objects:v223 count:16];
  if (v107)
  {
    id v108 = v107;
    uint64_t v109 = *(void *)v180;
    do
    {
      for (nuint64_t n = 0; nn != v108; nuint64_t n = (char *)nn + 1)
      {
        if (*(void *)v180 != v109) {
          objc_enumerationMutation(v106);
        }
        id v111 = [*(id *)(*((void *)&v179 + 1) + 8 * (void)nn) copyWithZone:a3];
        [v5 addNativeMetadata:v111];
      }
      id v108 = [(NSMutableArray *)v106 countByEnumeratingWithState:&v179 objects:v223 count:16];
    }
    while (v108);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 50) = self->_desiredPosition;
    *((_WORD *)v5 + 246) |= 0x100u;
  }
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v112 = self->_actions;
  id v113 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v175 objects:v222 count:16];
  if (v113)
  {
    id v114 = v113;
    uint64_t v115 = *(void *)v176;
    do
    {
      for (uint64_t i1 = 0; i1 != v114; uint64_t i1 = (char *)i1 + 1)
      {
        if (*(void *)v176 != v115) {
          objc_enumerationMutation(v112);
        }
        id v117 = [*(id *)(*((void *)&v175 + 1) + 8 * (void)i1) copyWithZone:a3];
        [v5 addActions:v117];
      }
      id v114 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v175 objects:v222 count:16];
    }
    while (v114);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v118 = self->_iTunesMetadatas;
  id v119 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v171 objects:v221 count:16];
  if (v119)
  {
    id v120 = v119;
    uint64_t v121 = *(void *)v172;
    do
    {
      for (uint64_t i2 = 0; i2 != v120; uint64_t i2 = (char *)i2 + 1)
      {
        if (*(void *)v172 != v121) {
          objc_enumerationMutation(v118);
        }
        id v123 = [*(id *)(*((void *)&v171 + 1) + 8 * (void)i2) copyWithZone:a3];
        [v5 addITunesMetadata:v123];
      }
      id v120 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v171 objects:v221 count:16];
    }
    while (v120);
  }

  id v124 = [(APPBTransparencyDetails *)self->_transparencyDetails copyWithZone:a3];
  long long v125 = (void *)v5[56];
  v5[56] = v124;

  id v126 = [(APPBNativeMediaCreativeMetadata *)self->_nativeMediaCreativeMetadata copyWithZone:a3];
  long long v127 = (void *)v5[44];
  v5[44] = v126;

  id v128 = [(NSString *)self->_adTagContentString copyWithZone:a3];
  long long v129 = (void *)v5[15];
  v5[15] = v128;

  __int16 v130 = (__int16)self->_has;
  if ((v130 & 0x400) != 0)
  {
    *((_DWORD *)v5 + 82) = self->_maximumPretapRequestCount;
    *((_WORD *)v5 + 246) |= 0x400u;
    __int16 v130 = (__int16)self->_has;
  }
  if ((v130 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_adPrivacyMarkPosition;
    *((_WORD *)v5 + 246) |= 0x20u;
  }
  id v131 = [(NSString *)self->_adDataResponseIdentifier copyWithZone:a3];
  long long v132 = (void *)v5[9];
  v5[9] = v131;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_DWORD *)v5 + 114) = self->_unfilledReasonCode;
    *((_WORD *)v5 + 246) |= 0x800u;
  }
  id v133 = [(NSString *)self->_unfilledReasonInfo copyWithZone:a3];
  v134 = (void *)v5[58];
  v5[58] = v133;

  id v135 = [(NSString *)self->_adOriginalRequesterId copyWithZone:a3];
  v136 = (void *)v5[13];
  v5[13] = v135;

  id v137 = [(NSString *)self->_expressionToEvaluate copyWithZone:a3];
  v138 = (void *)v5[27];
  v5[27] = v137;

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v139 = self->_journeyStartRelayValues;
  id v140 = [(NSMutableArray *)v139 countByEnumeratingWithState:&v167 objects:v220 count:16];
  if (v140)
  {
    id v141 = v140;
    uint64_t v142 = *(void *)v168;
    do
    {
      for (uint64_t i3 = 0; i3 != v141; uint64_t i3 = (char *)i3 + 1)
      {
        if (*(void *)v168 != v142) {
          objc_enumerationMutation(v139);
        }
        id v144 = [*(id *)(*((void *)&v167 + 1) + 8 * (void)i3) copyWithZone:a3];
        [v5 addJourneyStartRelayValues:v144];
      }
      id v141 = [(NSMutableArray *)v139 countByEnumeratingWithState:&v167 objects:v220 count:16];
    }
    while (v141);
  }

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v145 = self->_adLayoutDatas;
  id v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v163 objects:v219 count:16];
  if (v146)
  {
    id v147 = v146;
    uint64_t v148 = *(void *)v164;
    do
    {
      for (uint64_t i4 = 0; i4 != v147; uint64_t i4 = (char *)i4 + 1)
      {
        if (*(void *)v164 != v148) {
          objc_enumerationMutation(v145);
        }
        id v150 = [*(id *)(*((void *)&v163 + 1) + 8 * (void)i4) copyWithZone:a3];
        [v5 addAdLayoutData:v150];
      }
      id v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v163 objects:v219 count:16];
    }
    while (v147);
  }

  id v151 = [(NSString *)self->_adType copyWithZone:a3];
  long long v152 = (void *)v5[16];
  v5[16] = v151;

  id v153 = [(NSString *)self->_adFormatType copyWithZone:a3];
  long long v154 = (void *)v5[10];
  v5[10] = v153;

  id v155 = [(APPBAdFrequencyCapData *)self->_adFrequencyCapData copyWithZone:a3];
  long long v156 = (void *)v5[11];
  v5[11] = v155;

  id v157 = [(APPBPolicyData *)self->_policyData copyWithZone:a3];
  long long v158 = (void *)v5[46];
  v5[46] = v157;

  id v159 = [(APPBTargetingDimensions *)self->_targetingDimensions copyWithZone:a3];
  long long v160 = (void *)v5[53];
  v5[53] = v159;

  long long v161 = v5;
  return v161;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_185;
  }
  bannerURL = self->_bannerURL;
  if ((unint64_t)bannerURL | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](bannerURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  bannerWebArchiveURL = self->_bannerWebArchiveURL;
  if ((unint64_t)bannerWebArchiveURL | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](bannerWebArchiveURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 59))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_185;
    }
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if ((unint64_t)impressionIdentifierData | *((void *)v4 + 35))
  {
    if (!-[NSData isEqual:](impressionIdentifierData, "isEqual:")) {
      goto LABEL_185;
    }
  }
  humanReadableName = self->_humanReadableName;
  if ((unint64_t)humanReadableName | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](humanReadableName, "isEqual:")) {
      goto LABEL_185;
    }
  }
  if (self->_impressionCount != *((_DWORD *)v4 + 68)) {
    goto LABEL_185;
  }
  __int16 v10 = *((_WORD *)v4 + 246);
  if (*(_WORD *)&self->_has)
  {
    if ((v10 & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_185;
    }
  }
  else if (v10)
  {
    goto LABEL_185;
  }
  trackingURLs = self->_trackingURLs;
  if ((unint64_t)trackingURLs | *((void *)v4 + 55)
    && !-[NSMutableArray isEqual:](trackingURLs, "isEqual:"))
  {
    goto LABEL_185;
  }
  trackingURLSubstitutionParameter = self->_trackingURLSubstitutionParameter;
  if ((unint64_t)trackingURLSubstitutionParameter | *((void *)v4 + 54))
  {
    if (!-[NSString isEqual:](trackingURLSubstitutionParameter, "isEqual:")) {
      goto LABEL_185;
    }
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x4000) == 0) {
      goto LABEL_185;
    }
    if (self->_unbranded)
    {
      if (!*((unsigned char *)v4 + 490)) {
        goto LABEL_185;
      }
    }
    else if (*((unsigned char *)v4 + 490))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x4000) != 0)
  {
    goto LABEL_185;
  }
  accessibilityDescriptiouint64_t n = self->_accessibilityDescription;
  if ((unint64_t)accessibilityDescription | *((void *)v4 + 7)
    && !-[NSString isEqual:](accessibilityDescription, "isEqual:"))
  {
    goto LABEL_185;
  }
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  if ((unint64_t)confirmedClickPixelURLs | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](confirmedClickPixelURLs, "isEqual:")) {
      goto LABEL_185;
    }
  }
  bannerQueryString = self->_bannerQueryString;
  if ((unint64_t)bannerQueryString | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](bannerQueryString, "isEqual:")) {
      goto LABEL_185;
    }
  }
  videoAssets = self->_videoAssets;
  if ((unint64_t)videoAssets | *((void *)v4 + 60))
  {
    if (!-[NSMutableArray isEqual:](videoAssets, "isEqual:")) {
      goto LABEL_185;
    }
  }
  mediaFiles = self->_mediaFiles;
  if ((unint64_t)mediaFiles | *((void *)v4 + 42))
  {
    if (!-[APPBMediaFiles isEqual:](mediaFiles, "isEqual:")) {
      goto LABEL_185;
    }
  }
  audioURL = self->_audioURL;
  if ((unint64_t)audioURL | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](audioURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  slateImageURL = self->_slateImageURL;
  if ((unint64_t)slateImageURL | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](slateImageURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  aTVTunerImageURL = self->_aTVTunerImageURL;
  if ((unint64_t)aTVTunerImageURL | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](aTVTunerImageURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v22 = *((_WORD *)v4 + 246);
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x2000) == 0) {
      goto LABEL_185;
    }
    if (self->_downloadWebArchivesBeforeShowingBanner)
    {
      if (!*((unsigned char *)v4 + 489)) {
        goto LABEL_185;
      }
    }
    else if (*((unsigned char *)v4 + 489))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x2000) != 0)
  {
    goto LABEL_185;
  }
  if ((has & 0x40) != 0)
  {
    if ((v22 & 0x40) == 0 || self->_bannerImpressionThreshold != *((float *)v4 + 36)) {
      goto LABEL_185;
    }
  }
  else if ((v22 & 0x40) != 0)
  {
    goto LABEL_185;
  }
  if ((has & 0x80) != 0)
  {
    if ((v22 & 0x80) == 0 || self->_bannerNewContentCandidacyThreshold != *((float *)v4 + 37)) {
      goto LABEL_185;
    }
  }
  else if ((v22 & 0x80) != 0)
  {
    goto LABEL_185;
  }
  screenSaverImageURLs = self->_screenSaverImageURLs;
  if ((unint64_t)screenSaverImageURLs | *((void *)v4 + 48)
    && !-[NSMutableArray isEqual:](screenSaverImageURLs, "isEqual:"))
  {
    goto LABEL_185;
  }
  excludeTags = self->_excludeTags;
  if ((unint64_t)excludeTags | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](excludeTags, "isEqual:")) {
      goto LABEL_185;
    }
  }
  iAdJSVersiouint64_t n = self->_iAdJSVersion;
  if ((unint64_t)iAdJSVersion | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](iAdJSVersion, "isEqual:")) {
      goto LABEL_185;
    }
  }
  iAdJSURL = self->_iAdJSURL;
  if ((unint64_t)iAdJSURL | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](iAdJSURL, "isEqual:")) {
      goto LABEL_185;
    }
  }
  rewardTokens = self->_rewardTokens;
  if ((unint64_t)rewardTokens | *((void *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](rewardTokens, "isEqual:")) {
      goto LABEL_185;
    }
  }
  __int16 v28 = (__int16)self->_has;
  __int16 v29 = *((_WORD *)v4 + 246);
  if ((v28 & 8) != 0)
  {
    if ((v29 & 8) == 0 || self->_rewardTokensExpiration != *((double *)v4 + 4)) {
      goto LABEL_185;
    }
  }
  else if ((v29 & 8) != 0)
  {
    goto LABEL_185;
  }
  matchTagClauses = self->_matchTagClauses;
  if ((unint64_t)matchTagClauses | *((void *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](matchTagClauses, "isEqual:")) {
      goto LABEL_185;
    }
    __int16 v28 = (__int16)self->_has;
  }
  __int16 v31 = *((_WORD *)v4 + 246);
  if ((v28 & 0x10) != 0)
  {
    if ((v31 & 0x10) == 0 || self->_skipThreshold != *((double *)v4 + 5)) {
      goto LABEL_185;
    }
  }
  else if ((v31 & 0x10) != 0)
  {
    goto LABEL_185;
  }
  logoImageURL = self->_logoImageURL;
  if ((unint64_t)logoImageURL | *((void *)v4 + 39)
    && !-[NSString isEqual:](logoImageURL, "isEqual:"))
  {
    goto LABEL_185;
  }
  headlineForLCD = self->_headlineForLCD;
  if ((unint64_t)headlineForLCD | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](headlineForLCD, "isEqual:")) {
      goto LABEL_185;
    }
  }
  descriptionForLCD = self->_descriptionForLCD;
  if ((unint64_t)descriptionForLCD | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](descriptionForLCD, "isEqual:")) {
      goto LABEL_185;
    }
  }
  __int16 v35 = *((_WORD *)v4 + 246);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_priority != *((void *)v4 + 3)) {
      goto LABEL_185;
    }
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_185;
  }
  geofences = self->_geofences;
  if ((unint64_t)geofences | *((void *)v4 + 28)
    && !-[NSMutableArray isEqual:](geofences, "isEqual:"))
  {
    goto LABEL_185;
  }
  targetAppBundleID = self->_targetAppBundleID;
  if ((unint64_t)targetAppBundleID | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](targetAppBundleID, "isEqual:")) {
      goto LABEL_185;
    }
  }
  targetAppURLScheme = self->_targetAppURLScheme;
  if ((unint64_t)targetAppURLScheme | *((void *)v4 + 52))
  {
    if (!-[NSString isEqual:](targetAppURLScheme, "isEqual:")) {
      goto LABEL_185;
    }
  }
  creativeSizes = self->_creativeSizes;
  if ((unint64_t)creativeSizes | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](creativeSizes, "isEqual:")) {
      goto LABEL_185;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x200) == 0 || self->_letterboxCreativeColor != *((_DWORD *)v4 + 76)) {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x200) != 0)
  {
    goto LABEL_185;
  }
  installAttributiouint64_t n = self->_installAttribution;
  if ((unint64_t)installAttribution | *((void *)v4 + 36)
    && !-[APPBInstallAttribution isEqual:](installAttribution, "isEqual:"))
  {
    goto LABEL_185;
  }
  specificatiouint64_t n = self->_specification;
  if ((unint64_t)specification | *((void *)v4 + 50))
  {
    if (!-[APPBAdSpecification isEqual:](specification, "isEqual:")) {
      goto LABEL_185;
    }
  }
  __int16 v42 = *((_WORD *)v4 + 246);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v42 & 2) == 0 || self->_minimumIntervalBetweenPresentations != *((double *)v4 + 2)) {
      goto LABEL_185;
    }
  }
  else if ((v42 & 2) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x1000) == 0) {
      goto LABEL_185;
    }
    if (self->_doesNotResetListeningTime)
    {
      if (!*((unsigned char *)v4 + 488)) {
        goto LABEL_185;
      }
    }
    else if (*((unsigned char *)v4 + 488))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x1000) != 0)
  {
    goto LABEL_185;
  }
  merchant = self->_merchant;
  if ((unint64_t)merchant | *((void *)v4 + 43) && !-[APPBMerchant isEqual:](merchant, "isEqual:")) {
    goto LABEL_185;
  }
  nativeMetadatas = self->_nativeMetadatas;
  if ((unint64_t)nativeMetadatas | *((void *)v4 + 45))
  {
    if (!-[NSMutableArray isEqual:](nativeMetadatas, "isEqual:")) {
      goto LABEL_185;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x100) == 0 || self->_desiredPosition != *((_DWORD *)v4 + 50)) {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x100) != 0)
  {
    goto LABEL_185;
  }
  actions = self->_actions;
  if ((unint64_t)actions | *((void *)v4 + 8) && !-[NSMutableArray isEqual:](actions, "isEqual:")) {
    goto LABEL_185;
  }
  iTunesMetadatas = self->_iTunesMetadatas;
  if ((unint64_t)iTunesMetadatas | *((void *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](iTunesMetadatas, "isEqual:")) {
      goto LABEL_185;
    }
  }
  transparencyDetails = self->_transparencyDetails;
  if ((unint64_t)transparencyDetails | *((void *)v4 + 56))
  {
    if (!-[APPBTransparencyDetails isEqual:](transparencyDetails, "isEqual:")) {
      goto LABEL_185;
    }
  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  if ((unint64_t)nativeMediaCreativeMetadata | *((void *)v4 + 44))
  {
    if (!-[APPBNativeMediaCreativeMetadata isEqual:](nativeMediaCreativeMetadata, "isEqual:")) {
      goto LABEL_185;
    }
  }
  adTagContentString = self->_adTagContentString;
  if ((unint64_t)adTagContentString | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](adTagContentString, "isEqual:")) {
      goto LABEL_185;
    }
  }
  __int16 v50 = (__int16)self->_has;
  __int16 v51 = *((_WORD *)v4 + 246);
  if ((v50 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x400) == 0 || self->_maximumPretapRequestCount != *((_DWORD *)v4 + 82)) {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x400) != 0)
  {
    goto LABEL_185;
  }
  if ((v50 & 0x20) != 0)
  {
    if ((v51 & 0x20) == 0 || self->_adPrivacyMarkPosition != *((_DWORD *)v4 + 28)) {
      goto LABEL_185;
    }
  }
  else if ((v51 & 0x20) != 0)
  {
    goto LABEL_185;
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if ((unint64_t)adDataResponseIdentifier | *((void *)v4 + 9))
  {
    if (-[NSString isEqual:](adDataResponseIdentifier, "isEqual:"))
    {
      __int16 v50 = (__int16)self->_has;
      goto LABEL_160;
    }
LABEL_185:
    unsigned __int8 v63 = 0;
    goto LABEL_186;
  }
LABEL_160:
  if ((v50 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x800) == 0 || self->_unfilledReasonCode != *((_DWORD *)v4 + 114)) {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x800) != 0)
  {
    goto LABEL_185;
  }
  unfilledReasonInfo = self->_unfilledReasonInfo;
  if ((unint64_t)unfilledReasonInfo | *((void *)v4 + 58)
    && !-[NSString isEqual:](unfilledReasonInfo, "isEqual:"))
  {
    goto LABEL_185;
  }
  adOriginalRequesterId = self->_adOriginalRequesterId;
  if ((unint64_t)adOriginalRequesterId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](adOriginalRequesterId, "isEqual:")) {
      goto LABEL_185;
    }
  }
  expressionToEvaluate = self->_expressionToEvaluate;
  if ((unint64_t)expressionToEvaluate | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](expressionToEvaluate, "isEqual:")) {
      goto LABEL_185;
    }
  }
  journeyStartRelayValues = self->_journeyStartRelayValues;
  if ((unint64_t)journeyStartRelayValues | *((void *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](journeyStartRelayValues, "isEqual:")) {
      goto LABEL_185;
    }
  }
  adLayoutDatas = self->_adLayoutDatas;
  if ((unint64_t)adLayoutDatas | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](adLayoutDatas, "isEqual:")) {
      goto LABEL_185;
    }
  }
  adType = self->_adType;
  if ((unint64_t)adType | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](adType, "isEqual:")) {
      goto LABEL_185;
    }
  }
  adFormatType = self->_adFormatType;
  if ((unint64_t)adFormatType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](adFormatType, "isEqual:")) {
      goto LABEL_185;
    }
  }
  adFrequencyCapData = self->_adFrequencyCapData;
  if ((unint64_t)adFrequencyCapData | *((void *)v4 + 11))
  {
    if (!-[APPBAdFrequencyCapData isEqual:](adFrequencyCapData, "isEqual:")) {
      goto LABEL_185;
    }
  }
  policyData = self->_policyData;
  if ((unint64_t)policyData | *((void *)v4 + 46))
  {
    if (!-[APPBPolicyData isEqual:](policyData, "isEqual:")) {
      goto LABEL_185;
    }
  }
  targetingDimensions = self->_targetingDimensions;
  if ((unint64_t)targetingDimensions | *((void *)v4 + 53)) {
    unsigned __int8 v63 = -[APPBTargetingDimensions isEqual:](targetingDimensions, "isEqual:");
  }
  else {
    unsigned __int8 v63 = 1;
  }
LABEL_186:

  return v63;
}

- (unint64_t)hash
{
  NSUInteger v99 = [(NSString *)self->_bannerURL hash];
  NSUInteger v98 = [(NSString *)self->_bannerWebArchiveURL hash];
  NSUInteger v97 = [(NSString *)self->_uniqueIdentifier hash];
  unint64_t v96 = (unint64_t)[(NSData *)self->_impressionIdentifierData hash];
  NSUInteger v3 = [(NSString *)self->_humanReadableName hash];
  uint64_t impressionCount = self->_impressionCount;
  NSUInteger v95 = v3;
  if (*(_WORD *)&self->_has)
  {
    double expirationDate = self->_expirationDate;
    double v6 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v6 = self->_expirationDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v93 = v4;
  unint64_t v92 = (unint64_t)[(NSMutableArray *)self->_trackingURLs hash];
  NSUInteger v91 = [(NSString *)self->_trackingURLSubstitutionParameter hash];
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    uint64_t v90 = 2654435761 * self->_unbranded;
  }
  else {
    uint64_t v90 = 0;
  }
  NSUInteger v89 = [(NSString *)self->_accessibilityDescription hash];
  unint64_t v88 = (unint64_t)[(NSMutableArray *)self->_confirmedClickPixelURLs hash];
  NSUInteger v87 = [(NSString *)self->_bannerQueryString hash];
  unint64_t v86 = (unint64_t)[(NSMutableArray *)self->_videoAssets hash];
  unint64_t v85 = [(APPBMediaFiles *)self->_mediaFiles hash];
  NSUInteger v84 = [(NSString *)self->_audioURL hash];
  NSUInteger v83 = [(NSString *)self->_slateImageURL hash];
  NSUInteger v82 = [(NSString *)self->_aTVTunerImageURL hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    uint64_t v81 = 2654435761 * self->_downloadWebArchivesBeforeShowingBanner;
    if ((has & 0x40) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    unint64_t v14 = 0;
    goto LABEL_22;
  }
  uint64_t v81 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  float bannerImpressionThreshold = self->_bannerImpressionThreshold;
  float v11 = -bannerImpressionThreshold;
  if (bannerImpressionThreshold >= 0.0) {
    float v11 = self->_bannerImpressionThreshold;
  }
  float v12 = floorf(v11 + 0.5);
  float v13 = (float)(v11 - v12) * 1.8447e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabsf(v13);
  }
LABEL_22:
  unint64_t v80 = v14;
  if ((has & 0x80) != 0)
  {
    float bannerNewContentCandidacyThreshold = self->_bannerNewContentCandidacyThreshold;
    float v17 = -bannerNewContentCandidacyThreshold;
    if (bannerNewContentCandidacyThreshold >= 0.0) {
      float v17 = self->_bannerNewContentCandidacyThreshold;
    }
    float v18 = floorf(v17 + 0.5);
    float v19 = (float)(v17 - v18) * 1.8447e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v79 = v15;
  unint64_t v78 = (unint64_t)[(NSMutableArray *)self->_screenSaverImageURLs hash];
  unint64_t v77 = (unint64_t)[(NSMutableArray *)self->_excludeTags hash];
  NSUInteger v76 = [(NSString *)self->_iAdJSVersion hash];
  NSUInteger v75 = [(NSString *)self->_iAdJSURL hash];
  unint64_t v74 = (unint64_t)[(NSMutableArray *)self->_rewardTokens hash];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    rewardTokensExpiratiouint64_t n = self->_rewardTokensExpiration;
    double v22 = -rewardTokensExpiration;
    if (rewardTokensExpiration >= 0.0) {
      double v22 = self->_rewardTokensExpiration;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  unint64_t v73 = v20;
  unint64_t v72 = (unint64_t)[(NSMutableArray *)self->_matchTagClauses hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    double skipThreshold = self->_skipThreshold;
    double v27 = -skipThreshold;
    if (skipThreshold >= 0.0) {
      double v27 = self->_skipThreshold;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  unint64_t v71 = v25;
  NSUInteger v70 = [(NSString *)self->_logoImageURL hash];
  NSUInteger v69 = [(NSString *)self->_headlineForLCD hash];
  NSUInteger v68 = [(NSString *)self->_descriptionForLCD hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    unint64_t v67 = 2654435761u * self->_priority;
  }
  else {
    unint64_t v67 = 0;
  }
  unint64_t v66 = (unint64_t)[(NSMutableArray *)self->_geofences hash];
  NSUInteger v65 = [(NSString *)self->_targetAppBundleID hash];
  NSUInteger v64 = [(NSString *)self->_targetAppURLScheme hash];
  unint64_t v63 = (unint64_t)[(NSMutableArray *)self->_creativeSizes hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v62 = 2654435761 * self->_letterboxCreativeColor;
  }
  else {
    uint64_t v62 = 0;
  }
  unint64_t v61 = [(APPBInstallAttribution *)self->_installAttribution hash];
  unint64_t v60 = [(APPBAdSpecification *)self->_specification hash];
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 2) != 0)
  {
    double minimumIntervalBetweenPresentations = self->_minimumIntervalBetweenPresentations;
    double v33 = -minimumIntervalBetweenPresentations;
    if (minimumIntervalBetweenPresentations >= 0.0) {
      double v33 = self->_minimumIntervalBetweenPresentations;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  if ((v30 & 0x1000) != 0) {
    uint64_t v59 = 2654435761 * self->_doesNotResetListeningTime;
  }
  else {
    uint64_t v59 = 0;
  }
  unint64_t v58 = [(APPBMerchant *)self->_merchant hash];
  unint64_t v57 = (unint64_t)[(NSMutableArray *)self->_nativeMetadatas hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v56 = 2654435761 * self->_desiredPosition;
  }
  else {
    uint64_t v56 = 0;
  }
  unint64_t v36 = (unint64_t)[(NSMutableArray *)self->_actions hash];
  unint64_t v37 = (unint64_t)[(NSMutableArray *)self->_iTunesMetadatas hash];
  unint64_t v38 = [(APPBTransparencyDetails *)self->_transparencyDetails hash];
  unint64_t v39 = [(APPBNativeMediaCreativeMetadata *)self->_nativeMediaCreativeMetadata hash];
  NSUInteger v40 = [(NSString *)self->_adTagContentString hash];
  __int16 v41 = (__int16)self->_has;
  if ((v41 & 0x400) != 0)
  {
    uint64_t v42 = 2654435761 * self->_maximumPretapRequestCount;
    if ((v41 & 0x20) != 0) {
      goto LABEL_68;
    }
  }
  else
  {
    uint64_t v42 = 0;
    if ((v41 & 0x20) != 0)
    {
LABEL_68:
      uint64_t v43 = 2654435761 * self->_adPrivacyMarkPosition;
      goto LABEL_71;
    }
  }
  uint64_t v43 = 0;
LABEL_71:
  NSUInteger v44 = [(NSString *)self->_adDataResponseIdentifier hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v45 = 2654435761 * self->_unfilledReasonCode;
  }
  else {
    uint64_t v45 = 0;
  }
  unint64_t v46 = v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ v44 ^ v45 ^ [(NSString *)self->_unfilledReasonInfo hash];
  unint64_t v47 = v46 ^ [(NSString *)self->_adOriginalRequesterId hash];
  unint64_t v48 = v47 ^ [(NSString *)self->_expressionToEvaluate hash];
  unint64_t v49 = v98 ^ v99 ^ v97 ^ v96 ^ v95 ^ v93 ^ (2654435761 * impressionCount) ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v31 ^ v59 ^ v58 ^ v57 ^ v56 ^ v36 ^ v37 ^ v48 ^ (unint64_t)[(NSMutableArray *)self->_journeyStartRelayValues hash];
  unint64_t v50 = (unint64_t)[(NSMutableArray *)self->_adLayoutDatas hash];
  unint64_t v51 = v50 ^ [(NSString *)self->_adType hash];
  unint64_t v52 = v51 ^ [(NSString *)self->_adFormatType hash];
  unint64_t v53 = v52 ^ [(APPBAdFrequencyCapData *)self->_adFrequencyCapData hash];
  unint64_t v54 = v53 ^ [(APPBPolicyData *)self->_policyData hash];
  return v49 ^ v54 ^ [(APPBTargetingDimensions *)self->_targetingDimensions hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 20)) {
    -[APPBAdData setBannerURL:](self, "setBannerURL:");
  }
  if (*((void *)v4 + 21)) {
    -[APPBAdData setBannerWebArchiveURL:](self, "setBannerWebArchiveURL:");
  }
  if (*((void *)v4 + 59)) {
    -[APPBAdData setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
  if (*((void *)v4 + 35)) {
    -[APPBAdData setImpressionIdentifierData:](self, "setImpressionIdentifierData:");
  }
  if (*((void *)v4 + 30)) {
    -[APPBAdData setHumanReadableName:](self, "setHumanReadableName:");
  }
  self->_uint64_t impressionCount = *((_DWORD *)v4 + 68);
  if (*((unsigned char *)v4 + 492))
  {
    self->_double expirationDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v5 = *((id *)v4 + 55);
  id v6 = [v5 countByEnumeratingWithState:&v148 objects:v165 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v149;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v149 != v8) {
          objc_enumerationMutation(v5);
        }
        [(APPBAdData *)self addTrackingURL:*(void *)(*((void *)&v148 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v148 objects:v165 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 54)) {
    -[APPBAdData setTrackingURLSubstitutionParameter:](self, "setTrackingURLSubstitutionParameter:");
  }
  if ((*((_WORD *)v4 + 246) & 0x4000) != 0)
  {
    self->_unbranded = *((unsigned char *)v4 + 490);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 7)) {
    -[APPBAdData setAccessibilityDescription:](self, "setAccessibilityDescription:");
  }
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v10 = *((id *)v4 + 22);
  id v11 = [v10 countByEnumeratingWithState:&v144 objects:v164 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v145;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v145 != v13) {
          objc_enumerationMutation(v10);
        }
        [(APPBAdData *)self addConfirmedClickPixelURLs:*(void *)(*((void *)&v144 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v144 objects:v164 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 19)) {
    -[APPBAdData setBannerQueryString:](self, "setBannerQueryString:");
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v15 = *((id *)v4 + 60);
  id v16 = [v15 countByEnumeratingWithState:&v140 objects:v163 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v141;
    do
    {
      for (uint64_t k = 0; k != v17; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v141 != v18) {
          objc_enumerationMutation(v15);
        }
        [(APPBAdData *)self addVideoAsset:*(void *)(*((void *)&v140 + 1) + 8 * (void)k)];
      }
      id v17 = [v15 countByEnumeratingWithState:&v140 objects:v163 count:16];
    }
    while (v17);
  }

  mediaFiles = self->_mediaFiles;
  uint64_t v21 = *((void *)v4 + 42);
  if (mediaFiles)
  {
    if (v21) {
      -[APPBMediaFiles mergeFrom:](mediaFiles, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[APPBAdData setMediaFiles:](self, "setMediaFiles:");
  }
  if (*((void *)v4 + 17)) {
    -[APPBAdData setAudioURL:](self, "setAudioURL:");
  }
  if (*((void *)v4 + 49)) {
    -[APPBAdData setSlateImageURL:](self, "setSlateImageURL:");
  }
  if (*((void *)v4 + 6)) {
    -[APPBAdData setATVTunerImageURL:](self, "setATVTunerImageURL:");
  }
  __int16 v22 = *((_WORD *)v4 + 246);
  if ((v22 & 0x2000) != 0)
  {
    self->_downloadWebArchivesBeforeShowingBanner = *((unsigned char *)v4 + 489);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v22 = *((_WORD *)v4 + 246);
    if ((v22 & 0x40) == 0)
    {
LABEL_55:
      if ((v22 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((v22 & 0x40) == 0)
  {
    goto LABEL_55;
  }
  self->_float bannerImpressionThreshold = *((float *)v4 + 36);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 246) & 0x80) != 0)
  {
LABEL_56:
    self->_float bannerNewContentCandidacyThreshold = *((float *)v4 + 37);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_57:
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v23 = *((id *)v4 + 48);
  id v24 = [v23 countByEnumeratingWithState:&v136 objects:v162 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v137;
    do
    {
      for (uint64_t m = 0; m != v25; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v137 != v26) {
          objc_enumerationMutation(v23);
        }
        [(APPBAdData *)self addScreenSaverImageURL:*(void *)(*((void *)&v136 + 1) + 8 * (void)m)];
      }
      id v25 = [v23 countByEnumeratingWithState:&v136 objects:v162 count:16];
    }
    while (v25);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v28 = *((id *)v4 + 26);
  id v29 = [v28 countByEnumeratingWithState:&v132 objects:v161 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v133;
    do
    {
      for (uint64_t n = 0; n != v30; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v133 != v31) {
          objc_enumerationMutation(v28);
        }
        [(APPBAdData *)self addExcludeTag:*(void *)(*((void *)&v132 + 1) + 8 * (void)n)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v132 objects:v161 count:16];
    }
    while (v30);
  }

  if (*((void *)v4 + 32)) {
    -[APPBAdData setIAdJSVersion:](self, "setIAdJSVersion:");
  }
  if (*((void *)v4 + 31)) {
    -[APPBAdData setIAdJSURL:](self, "setIAdJSURL:");
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v33 = *((id *)v4 + 47);
  id v34 = [v33 countByEnumeratingWithState:&v128 objects:v160 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v129;
    do
    {
      for (iuint64_t i = 0; ii != v35; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v129 != v36) {
          objc_enumerationMutation(v33);
        }
        [(APPBAdData *)self addRewardTokens:*(void *)(*((void *)&v128 + 1) + 8 * (void)ii)];
      }
      id v35 = [v33 countByEnumeratingWithState:&v128 objects:v160 count:16];
    }
    while (v35);
  }

  if ((*((_WORD *)v4 + 246) & 8) != 0)
  {
    self->_rewardTokensExpiratiouint64_t n = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v38 = *((id *)v4 + 40);
  id v39 = [v38 countByEnumeratingWithState:&v124 objects:v159 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v125;
    do
    {
      for (juint64_t j = 0; jj != v40; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v125 != v41) {
          objc_enumerationMutation(v38);
        }
        [(APPBAdData *)self addMatchTagClause:*(void *)(*((void *)&v124 + 1) + 8 * (void)jj)];
      }
      id v40 = [v38 countByEnumeratingWithState:&v124 objects:v159 count:16];
    }
    while (v40);
  }

  if ((*((_WORD *)v4 + 246) & 0x10) != 0)
  {
    self->_double skipThreshold = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 39)) {
    -[APPBAdData setLogoImageURL:](self, "setLogoImageURL:");
  }
  if (*((void *)v4 + 29)) {
    -[APPBAdData setHeadlineForLCD:](self, "setHeadlineForLCD:");
  }
  if (*((void *)v4 + 24)) {
    -[APPBAdData setDescriptionForLCD:](self, "setDescriptionForLCD:");
  }
  if ((*((_WORD *)v4 + 246) & 4) != 0)
  {
    self->_priority = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v43 = *((id *)v4 + 28);
  id v44 = [v43 countByEnumeratingWithState:&v120 objects:v158 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v121;
    do
    {
      for (kuint64_t k = 0; kk != v45; kuint64_t k = (char *)kk + 1)
      {
        if (*(void *)v121 != v46) {
          objc_enumerationMutation(v43);
        }
        [(APPBAdData *)self addGeofences:*(void *)(*((void *)&v120 + 1) + 8 * (void)kk)];
      }
      id v45 = [v43 countByEnumeratingWithState:&v120 objects:v158 count:16];
    }
    while (v45);
  }

  if (*((void *)v4 + 51)) {
    -[APPBAdData setTargetAppBundleID:](self, "setTargetAppBundleID:");
  }
  if (*((void *)v4 + 52)) {
    -[APPBAdData setTargetAppURLScheme:](self, "setTargetAppURLScheme:");
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v48 = *((id *)v4 + 23);
  id v49 = [v48 countByEnumeratingWithState:&v116 objects:v157 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v117;
    do
    {
      for (muint64_t m = 0; mm != v50; muint64_t m = (char *)mm + 1)
      {
        if (*(void *)v117 != v51) {
          objc_enumerationMutation(v48);
        }
        [(APPBAdData *)self addCreativeSizes:*(void *)(*((void *)&v116 + 1) + 8 * (void)mm)];
      }
      id v50 = [v48 countByEnumeratingWithState:&v116 objects:v157 count:16];
    }
    while (v50);
  }

  if ((*((_WORD *)v4 + 246) & 0x200) != 0)
  {
    self->_letterboxCreativeColor = *((_DWORD *)v4 + 76);
    *(_WORD *)&self->_has |= 0x200u;
  }
  installAttributiouint64_t n = self->_installAttribution;
  uint64_t v54 = *((void *)v4 + 36);
  if (installAttribution)
  {
    if (v54) {
      -[APPBInstallAttribution mergeFrom:](installAttribution, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[APPBAdData setInstallAttribution:](self, "setInstallAttribution:");
  }
  specificatiouint64_t n = self->_specification;
  uint64_t v56 = *((void *)v4 + 50);
  if (specification)
  {
    if (v56) {
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
    }
  }
  else if (v56)
  {
    -[APPBAdData setSpecification:](self, "setSpecification:");
  }
  __int16 v57 = *((_WORD *)v4 + 246);
  if ((v57 & 2) != 0)
  {
    self->_double minimumIntervalBetweenPresentations = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v57 = *((_WORD *)v4 + 246);
  }
  if ((v57 & 0x1000) != 0)
  {
    self->_doesNotResetListeningTime = *((unsigned char *)v4 + 488);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  merchant = self->_merchant;
  uint64_t v59 = *((void *)v4 + 43);
  if (merchant)
  {
    if (v59) {
      -[APPBMerchant mergeFrom:](merchant, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[APPBAdData setMerchant:](self, "setMerchant:");
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v60 = *((id *)v4 + 45);
  id v61 = [v60 countByEnumeratingWithState:&v112 objects:v156 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v113;
    do
    {
      for (nuint64_t n = 0; nn != v62; nuint64_t n = (char *)nn + 1)
      {
        if (*(void *)v113 != v63) {
          objc_enumerationMutation(v60);
        }
        [(APPBAdData *)self addNativeMetadata:*(void *)(*((void *)&v112 + 1) + 8 * (void)nn)];
      }
      id v62 = [v60 countByEnumeratingWithState:&v112 objects:v156 count:16];
    }
    while (v62);
  }

  if ((*((_WORD *)v4 + 246) & 0x100) != 0)
  {
    self->_int desiredPosition = *((_DWORD *)v4 + 50);
    *(_WORD *)&self->_has |= 0x100u;
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v65 = *((id *)v4 + 8);
  id v66 = [v65 countByEnumeratingWithState:&v108 objects:v155 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v109;
    do
    {
      for (uint64_t i1 = 0; i1 != v67; uint64_t i1 = (char *)i1 + 1)
      {
        if (*(void *)v109 != v68) {
          objc_enumerationMutation(v65);
        }
        [(APPBAdData *)self addActions:*(void *)(*((void *)&v108 + 1) + 8 * (void)i1)];
      }
      id v67 = [v65 countByEnumeratingWithState:&v108 objects:v155 count:16];
    }
    while (v67);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v70 = *((id *)v4 + 33);
  id v71 = [v70 countByEnumeratingWithState:&v104 objects:v154 count:16];
  if (v71)
  {
    id v72 = v71;
    uint64_t v73 = *(void *)v105;
    do
    {
      for (uint64_t i2 = 0; i2 != v72; uint64_t i2 = (char *)i2 + 1)
      {
        if (*(void *)v105 != v73) {
          objc_enumerationMutation(v70);
        }
        [(APPBAdData *)self addITunesMetadata:*(void *)(*((void *)&v104 + 1) + 8 * (void)i2)];
      }
      id v72 = [v70 countByEnumeratingWithState:&v104 objects:v154 count:16];
    }
    while (v72);
  }

  transparencyDetails = self->_transparencyDetails;
  uint64_t v76 = *((void *)v4 + 56);
  if (transparencyDetails)
  {
    if (v76) {
      -[APPBTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
    }
  }
  else if (v76)
  {
    -[APPBAdData setTransparencyDetails:](self, "setTransparencyDetails:");
  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  uint64_t v78 = *((void *)v4 + 44);
  if (nativeMediaCreativeMetadata)
  {
    if (v78) {
      -[APPBNativeMediaCreativeMetadata mergeFrom:](nativeMediaCreativeMetadata, "mergeFrom:");
    }
  }
  else if (v78)
  {
    -[APPBAdData setNativeMediaCreativeMetadata:](self, "setNativeMediaCreativeMetadata:");
  }
  if (*((void *)v4 + 15)) {
    -[APPBAdData setAdTagContentString:](self, "setAdTagContentString:");
  }
  __int16 v79 = *((_WORD *)v4 + 246);
  if ((v79 & 0x400) != 0)
  {
    self->_maximumPretapRequestCount = *((_DWORD *)v4 + 82);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v79 = *((_WORD *)v4 + 246);
  }
  if ((v79 & 0x20) != 0)
  {
    self->_uint64_t adPrivacyMarkPosition = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 9)) {
    -[APPBAdData setAdDataResponseIdentifier:](self, "setAdDataResponseIdentifier:");
  }
  if ((*((_WORD *)v4 + 246) & 0x800) != 0)
  {
    self->_unfilledReasonCode = *((_DWORD *)v4 + 114);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((void *)v4 + 58)) {
    -[APPBAdData setUnfilledReasonInfo:](self, "setUnfilledReasonInfo:");
  }
  if (*((void *)v4 + 13)) {
    -[APPBAdData setAdOriginalRequesterId:](self, "setAdOriginalRequesterId:");
  }
  if (*((void *)v4 + 27)) {
    -[APPBAdData setExpressionToEvaluate:](self, "setExpressionToEvaluate:");
  }
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v80 = *((id *)v4 + 37);
  id v81 = [v80 countByEnumeratingWithState:&v100 objects:v153 count:16];
  if (v81)
  {
    id v82 = v81;
    uint64_t v83 = *(void *)v101;
    do
    {
      for (uint64_t i3 = 0; i3 != v82; uint64_t i3 = (char *)i3 + 1)
      {
        if (*(void *)v101 != v83) {
          objc_enumerationMutation(v80);
        }
        [(APPBAdData *)self addJourneyStartRelayValues:*(void *)(*((void *)&v100 + 1) + 8 * (void)i3)];
      }
      id v82 = [v80 countByEnumeratingWithState:&v100 objects:v153 count:16];
    }
    while (v82);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v85 = *((id *)v4 + 12);
  id v86 = [v85 countByEnumeratingWithState:&v96 objects:v152 count:16];
  if (v86)
  {
    id v87 = v86;
    uint64_t v88 = *(void *)v97;
    do
    {
      for (uint64_t i4 = 0; i4 != v87; uint64_t i4 = (char *)i4 + 1)
      {
        if (*(void *)v97 != v88) {
          objc_enumerationMutation(v85);
        }
        -[APPBAdData addAdLayoutData:](self, "addAdLayoutData:", *(void *)(*((void *)&v96 + 1) + 8 * (void)i4), (void)v96);
      }
      id v87 = [v85 countByEnumeratingWithState:&v96 objects:v152 count:16];
    }
    while (v87);
  }

  if (*((void *)v4 + 16)) {
    -[APPBAdData setAdType:](self, "setAdType:");
  }
  if (*((void *)v4 + 10)) {
    -[APPBAdData setAdFormatType:](self, "setAdFormatType:");
  }
  adFrequencyCapData = self->_adFrequencyCapData;
  uint64_t v91 = *((void *)v4 + 11);
  if (adFrequencyCapData)
  {
    if (v91) {
      -[APPBAdFrequencyCapData mergeFrom:](adFrequencyCapData, "mergeFrom:");
    }
  }
  else if (v91)
  {
    -[APPBAdData setAdFrequencyCapData:](self, "setAdFrequencyCapData:");
  }
  policyData = self->_policyData;
  uint64_t v93 = *((void *)v4 + 46);
  if (policyData)
  {
    if (v93) {
      -[APPBPolicyData mergeFrom:](policyData, "mergeFrom:");
    }
  }
  else if (v93)
  {
    -[APPBAdData setPolicyData:](self, "setPolicyData:");
  }
  targetingDimensions = self->_targetingDimensions;
  uint64_t v95 = *((void *)v4 + 53);
  if (targetingDimensions)
  {
    if (v95) {
      -[APPBTargetingDimensions mergeFrom:](targetingDimensions, "mergeFrom:");
    }
  }
  else if (v95)
  {
    -[APPBAdData setTargetingDimensions:](self, "setTargetingDimensions:");
  }
}

- (NSString)bannerURL
{
  return self->_bannerURL;
}

- (void)setBannerURL:(id)a3
{
}

- (NSString)bannerWebArchiveURL
{
  return self->_bannerWebArchiveURL;
}

- (void)setBannerWebArchiveURL:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)impressionIdentifierData
{
  return self->_impressionIdentifierData;
}

- (void)setImpressionIdentifierData:(id)a3
{
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
}

- (int)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(int)a3
{
  self->_uint64_t impressionCount = a3;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (NSMutableArray)trackingURLs
{
  return self->_trackingURLs;
}

- (void)setTrackingURLs:(id)a3
{
}

- (NSString)trackingURLSubstitutionParameter
{
  return self->_trackingURLSubstitutionParameter;
}

- (void)setTrackingURLSubstitutionParameter:(id)a3
{
}

- (BOOL)unbranded
{
  return self->_unbranded;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSMutableArray)confirmedClickPixelURLs
{
  return self->_confirmedClickPixelURLs;
}

- (void)setConfirmedClickPixelURLs:(id)a3
{
}

- (NSString)bannerQueryString
{
  return self->_bannerQueryString;
}

- (void)setBannerQueryString:(id)a3
{
}

- (NSMutableArray)videoAssets
{
  return self->_videoAssets;
}

- (void)setVideoAssets:(id)a3
{
}

- (APPBMediaFiles)mediaFiles
{
  return self->_mediaFiles;
}

- (void)setMediaFiles:(id)a3
{
}

- (NSString)audioURL
{
  return self->_audioURL;
}

- (void)setAudioURL:(id)a3
{
}

- (NSString)slateImageURL
{
  return self->_slateImageURL;
}

- (void)setSlateImageURL:(id)a3
{
}

- (NSString)aTVTunerImageURL
{
  return self->_aTVTunerImageURL;
}

- (void)setATVTunerImageURL:(id)a3
{
}

- (BOOL)downloadWebArchivesBeforeShowingBanner
{
  return self->_downloadWebArchivesBeforeShowingBanner;
}

- (float)bannerImpressionThreshold
{
  return self->_bannerImpressionThreshold;
}

- (float)bannerNewContentCandidacyThreshold
{
  return self->_bannerNewContentCandidacyThreshold;
}

- (NSMutableArray)screenSaverImageURLs
{
  return self->_screenSaverImageURLs;
}

- (void)setScreenSaverImageURLs:(id)a3
{
}

- (NSMutableArray)excludeTags
{
  return self->_excludeTags;
}

- (void)setExcludeTags:(id)a3
{
}

- (NSString)iAdJSVersion
{
  return self->_iAdJSVersion;
}

- (void)setIAdJSVersion:(id)a3
{
}

- (NSString)iAdJSURL
{
  return self->_iAdJSURL;
}

- (void)setIAdJSURL:(id)a3
{
}

- (NSMutableArray)rewardTokens
{
  return self->_rewardTokens;
}

- (void)setRewardTokens:(id)a3
{
}

- (double)rewardTokensExpiration
{
  return self->_rewardTokensExpiration;
}

- (NSMutableArray)matchTagClauses
{
  return self->_matchTagClauses;
}

- (void)setMatchTagClauses:(id)a3
{
}

- (double)skipThreshold
{
  return self->_skipThreshold;
}

- (NSString)logoImageURL
{
  return self->_logoImageURL;
}

- (void)setLogoImageURL:(id)a3
{
}

- (NSString)headlineForLCD
{
  return self->_headlineForLCD;
}

- (void)setHeadlineForLCD:(id)a3
{
}

- (NSString)descriptionForLCD
{
  return self->_descriptionForLCD;
}

- (void)setDescriptionForLCD:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSMutableArray)geofences
{
  return self->_geofences;
}

- (void)setGeofences:(id)a3
{
}

- (NSString)targetAppBundleID
{
  return self->_targetAppBundleID;
}

- (void)setTargetAppBundleID:(id)a3
{
}

- (NSString)targetAppURLScheme
{
  return self->_targetAppURLScheme;
}

- (void)setTargetAppURLScheme:(id)a3
{
}

- (NSMutableArray)creativeSizes
{
  return self->_creativeSizes;
}

- (void)setCreativeSizes:(id)a3
{
}

- (unsigned)letterboxCreativeColor
{
  return self->_letterboxCreativeColor;
}

- (APPBInstallAttribution)installAttribution
{
  return self->_installAttribution;
}

- (void)setInstallAttribution:(id)a3
{
}

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (double)minimumIntervalBetweenPresentations
{
  return self->_minimumIntervalBetweenPresentations;
}

- (APPBMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (NSMutableArray)nativeMetadatas
{
  return self->_nativeMetadatas;
}

- (void)setNativeMetadatas:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSMutableArray)iTunesMetadatas
{
  return self->_iTunesMetadatas;
}

- (void)setITunesMetadatas:(id)a3
{
}

- (APPBTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
}

- (APPBNativeMediaCreativeMetadata)nativeMediaCreativeMetadata
{
  return self->_nativeMediaCreativeMetadata;
}

- (void)setNativeMediaCreativeMetadata:(id)a3
{
}

- (NSString)adTagContentString
{
  return self->_adTagContentString;
}

- (void)setAdTagContentString:(id)a3
{
}

- (int)maximumPretapRequestCount
{
  return self->_maximumPretapRequestCount;
}

- (NSString)adDataResponseIdentifier
{
  return self->_adDataResponseIdentifier;
}

- (void)setAdDataResponseIdentifier:(id)a3
{
}

- (NSString)unfilledReasonInfo
{
  return self->_unfilledReasonInfo;
}

- (void)setUnfilledReasonInfo:(id)a3
{
}

- (NSString)adOriginalRequesterId
{
  return self->_adOriginalRequesterId;
}

- (void)setAdOriginalRequesterId:(id)a3
{
}

- (NSString)expressionToEvaluate
{
  return self->_expressionToEvaluate;
}

- (void)setExpressionToEvaluate:(id)a3
{
}

- (NSMutableArray)journeyStartRelayValues
{
  return self->_journeyStartRelayValues;
}

- (void)setJourneyStartRelayValues:(id)a3
{
}

- (NSMutableArray)adLayoutDatas
{
  return self->_adLayoutDatas;
}

- (void)setAdLayoutDatas:(id)a3
{
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(id)a3
{
}

- (NSString)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(id)a3
{
}

- (APPBAdFrequencyCapData)adFrequencyCapData
{
  return self->_adFrequencyCapData;
}

- (void)setAdFrequencyCapData:(id)a3
{
}

- (APPBPolicyData)policyData
{
  return self->_policyData;
}

- (void)setPolicyData:(id)a3
{
}

- (APPBTargetingDimensions)targetingDimensions
{
  return self->_targetingDimensions;
}

- (void)setTargetingDimensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAssets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_unfilledReasonInfo, 0);
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
  objc_storeStrong((id *)&self->_trackingURLs, 0);
  objc_storeStrong((id *)&self->_trackingURLSubstitutionParameter, 0);
  objc_storeStrong((id *)&self->_targetingDimensions, 0);
  objc_storeStrong((id *)&self->_targetAppURLScheme, 0);
  objc_storeStrong((id *)&self->_targetAppBundleID, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_slateImageURL, 0);
  objc_storeStrong((id *)&self->_screenSaverImageURLs, 0);
  objc_storeStrong((id *)&self->_rewardTokens, 0);
  objc_storeStrong((id *)&self->_policyData, 0);
  objc_storeStrong((id *)&self->_nativeMetadatas, 0);
  objc_storeStrong((id *)&self->_nativeMediaCreativeMetadata, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_mediaFiles, 0);
  objc_storeStrong((id *)&self->_matchTagClauses, 0);
  objc_storeStrong((id *)&self->_logoImageURL, 0);
  objc_storeStrong((id *)&self->_journeyStartRelayValues, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_impressionIdentifierData, 0);
  objc_storeStrong((id *)&self->_iTunesMetadatas, 0);
  objc_storeStrong((id *)&self->_iAdJSVersion, 0);
  objc_storeStrong((id *)&self->_iAdJSURL, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_headlineForLCD, 0);
  objc_storeStrong((id *)&self->_geofences, 0);
  objc_storeStrong((id *)&self->_expressionToEvaluate, 0);
  objc_storeStrong((id *)&self->_excludeTags, 0);
  objc_storeStrong((id *)&self->_descriptionForLCD, 0);
  objc_storeStrong((id *)&self->_creativeSizes, 0);
  objc_storeStrong((id *)&self->_confirmedClickPixelURLs, 0);
  objc_storeStrong((id *)&self->_bannerWebArchiveURL, 0);
  objc_storeStrong((id *)&self->_bannerURL, 0);
  objc_storeStrong((id *)&self->_bannerQueryString, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_adTagContentString, 0);
  objc_storeStrong((id *)&self->_adOriginalRequesterId, 0);
  objc_storeStrong((id *)&self->_adLayoutDatas, 0);
  objc_storeStrong((id *)&self->_adFrequencyCapData, 0);
  objc_storeStrong((id *)&self->_adFormatType, 0);
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);

  objc_storeStrong((id *)&self->_aTVTunerImageURL, 0);
}

@end