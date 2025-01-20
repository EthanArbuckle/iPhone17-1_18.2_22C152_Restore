@interface FCSportsEvent
+ (BOOL)isSportsEventIdentifier:(id)a3;
- (BOOL)disableBlock;
- (BOOL)disableFollow;
- (BOOL)hasEvergreenArticleList;
- (BOOL)hideAccessoryText;
- (BOOL)hideLocationInMasthead;
- (BOOL)isArticleReadCountReportingEnabled;
- (BOOL)isAuthenticationSetup;
- (BOOL)isAutoDarkModeEnabled;
- (BOOL)isBlockedExplicitContent;
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
- (BOOL)isRouteable;
- (BOOL)isSandbox;
- (BOOL)isSensitiveTopic;
- (BOOL)isSports;
- (BOOL)isSportsEvent;
- (BOOL)isSportsRecommendable;
- (BOOL)isSubscribable;
- (BOOL)publisherPaidLeakyPaywallOptOut;
- (BOOL)publisherPaidWebAccessOptIn;
- (BOOL)sponsoredFeedEligible;
- (BOOL)useCompactNameForPersonalizedPaywall;
- (FCAssetHandle)coverImageAssetHandle;
- (FCAssetHandle)feedNavImageAssetHandle;
- (FCAssetHandle)feedNavImageHQAssetHandle;
- (FCAssetHandle)nameImageCompactAssetHandle;
- (FCAssetHandle)nameImageLargeAssetHandle;
- (FCAssetHandle)nameImageLargeMaskAssetHandle;
- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle;
- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle;
- (FCAssetHandle)sportsLogoAltImageAssetHandle;
- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle;
- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle;
- (FCAssetHandle)sportsLogoImageAssetHandle;
- (FCAssetHandle)sportsLogoImageCompactAssetHandle;
- (FCAssetHandle)sportsLogoImageLargeAssetHandle;
- (FCChannelProviding)asChannel;
- (FCColor)groupDarkStyleTitleColor;
- (FCColor)groupTitleColor;
- (FCColor)sportsEventNavigationForegroundColor;
- (FCColor)sportsPrimaryColor;
- (FCColor)sportsSecondaryColor;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (FCFeedTheming)theme;
- (FCPaywallConfiguration)paidBundlePaywallConfiguration;
- (FCPuzzleTypeProviding)asPuzzleType;
- (FCSectionProviding)asSection;
- (FCSectionSupergroupKnobs)supergroupKnobs;
- (FCSportsEvent)initWithSportsEventRecord:(id)a3 eventCompetitorTags:(id)a4 eventLeagueTag:(id)a5 assetManager:(id)a6 interestToken:(id)a7;
- (FCSportsProviding)eventLeagueTag;
- (FCSportsRecommendationMappings)sportsRecommendationMappings;
- (FCTagStocksFields)stocksFields;
- (NSArray)adTargetingKeywords;
- (NSArray)allowedStorefrontIDs;
- (NSArray)blockedStorefrontIDs;
- (NSArray)eventCompetitorTags;
- (NSArray)iAdCategories;
- (NSArray)iAdKeywords;
- (NSArray)publisherPaidBundlePurchaseIDs;
- (NSArray)publisherPaidFeldsparablePurchaseIDs;
- (NSArray)publisherPaidOfferableConfigurations;
- (NSArray)publisherSpecifiedArticleIDs;
- (NSArray)sportsParentTagIdentifiers;
- (NSArray)topLevelGroupsTagIdentifiers;
- (NSData)sportsRecommendationMappingsJSON;
- (NSDate)fetchDate;
- (NSDate)lastModifiedDate;
- (NSDate)loadDate;
- (NSDate)publisherSpecifiedArticleIDsModifiedDate;
- (NSDate)sportsEventStartTime;
- (NSDictionary)publisherSpecifiedArticles;
- (NSDictionary)rosterResourceIDs;
- (NSString)UMCCanonicalID;
- (NSString)articleRecirculationConfigJSON;
- (NSString)eventArticleListID;
- (NSString)highlightsArticleListID;
- (NSString)identifier;
- (NSString)language;
- (NSString)magazineGenre;
- (NSString)nameCompact;
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
- (NSString)subtitle;
- (NSString)superfeedConfigResourceID;
- (NSString)supergroupConfigJson;
- (NSString)supergroupKnobsJson;
- (NSString)titleDisplayPrefix;
- (NSString)titleDisplaySuffix;
- (NSString)topLevelSportTagIdentifier;
- (NSString)versionKey;
- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings;
- (double)subscriptionRate;
- (id)authorizationURL;
- (id)feedIDForBin:(int64_t)a3;
- (id)freeFeedIDForBin:(int64_t)a3;
- (id)paidFeedIDForBin:(int64_t)a3;
- (id)prefetchPurchaseOffer;
- (int64_t)contentProvider;
- (int64_t)minimumNewsVersion;
- (int64_t)score;
- (int64_t)sportsLogoMastheadHorizontalPaddingOffset;
- (int64_t)sportsLogoMastheadLeadingOffset;
- (unint64_t)groupingEligibility;
- (unint64_t)sportsLeagueType;
- (unint64_t)sportsLogoMastheadVisibility;
- (unint64_t)sportsType;
- (unint64_t)tagType;
- (unint64_t)userFacingTagType;
- (void)_inflateSportsDataFromJSONDictionary:(id)a3;
- (void)_inflateSportsThemeFromJSONDictionary:(id)a3;
- (void)setTitleDisplayPrefix:(id)a3;
- (void)setTitleDisplaySuffix:(id)a3;
@end

@implementation FCSportsEvent

- (FCSportsEvent)initWithSportsEventRecord:(id)a3 eventCompetitorTags:(id)a4 eventLeagueTag:(id)a5 assetManager:(id)a6 interestToken:(id)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v75 = a7;
  v80.receiver = self;
  v80.super_class = (Class)FCSportsEvent;
  v17 = [(FCSportsEvent *)&v80 init];
  if (v17)
  {
    id v74 = v16;
    context = (void *)MEMORY[0x1A6260FD0]();
    objc_storeStrong((id *)&v17->_sportsEventRecord, a3);
    objc_storeStrong((id *)&v17->_interestToken, a7);
    v18 = [v13 base];
    uint64_t v19 = [v18 identifier];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v19;

    v21 = [v13 base];
    uint64_t v22 = [v21 changeTag];
    versionKey = v17->_versionKey;
    v17->_versionKey = (NSString *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    loadDate = v17->_loadDate;
    v17->_loadDate = (NSDate *)v24;

    v26 = (void *)MEMORY[0x1E4F1C9C8];
    v27 = [v13 base];
    v28 = [v27 fetchDate];
    uint64_t v29 = [v26 dateWithPBDate:v28];
    fetchDate = v17->_fetchDate;
    v17->_fetchDate = (NSDate *)v29;

    v31 = (void *)MEMORY[0x1E4F1C9C8];
    v32 = [v13 base];
    v33 = [v32 modificationDate];
    uint64_t v34 = [v31 dateWithPBDate:v33];
    lastModifiedDate = v17->_lastModifiedDate;
    v17->_lastModifiedDate = (NSDate *)v34;

    uint64_t v36 = [v13 allowedStorefrontIDs];
    allowedStorefrontIDs = v17->_allowedStorefrontIDs;
    v17->_allowedStorefrontIDs = (NSArray *)v36;

    uint64_t v38 = [v13 blockedStorefrontIDs];
    blockedStorefrontIDs = v17->_blockedStorefrontIDs;
    v17->_blockedStorefrontIDs = (NSArray *)v38;

    v17->_minimumNewsVersion = [v13 minimumNewsVersion];
    uint64_t v40 = [v13 highlightsArticleListID];
    highlightsArticleListID = v17->_highlightsArticleListID;
    v17->_highlightsArticleListID = (NSString *)v40;

    uint64_t v42 = [v13 superfeedConfigResourceID];
    superfeedConfigResourceID = v17->_superfeedConfigResourceID;
    v17->_superfeedConfigResourceID = (NSString *)v42;

    objc_storeStrong((id *)&v17->_eventCompetitorTags, a4);
    objc_storeStrong((id *)&v17->_eventLeagueTag, a5);
    uint64_t v44 = [v13 eventArticleListID];
    eventArticleListID = v17->_eventArticleListID;
    v17->_eventArticleListID = (NSString *)v44;

    v17->_isDeprecated = [v13 isDeprecated];
    v46 = [v13 sportsData];
    uint64_t v47 = [v46 length];

    if (v47)
    {
      id v71 = v15;
      uint64_t v48 = [v13 sportsData];
      sportsData = v17->_sportsData;
      v17->_sportsData = (NSString *)v48;

      v50 = (void *)MEMORY[0x1E4F1C9E8];
      id v72 = v13;
      v51 = [v13 sportsData];
      v52 = objc_msgSend(v50, "fc_dictionaryFromJSON:", v51);

      [(FCSportsEvent *)v17 _inflateSportsDataFromJSONDictionary:v52];
      v53 = [MEMORY[0x1E4F1CA60] dictionary];
      v70 = v52;
      v54 = [v52 objectForKeyedSubscript:@"competitorRosters"];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v77 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            v60 = [v59 objectForKeyedSubscript:@"competitorTagID"];
            if (v60)
            {
              v61 = [v59 objectForKeyedSubscript:@"rosterResourceID"];
              [v53 setObject:v61 forKeyedSubscript:v60];
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v56);
      }
      uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v53];
      rosterResourceIDs = v17->_rosterResourceIDs;
      v17->_rosterResourceIDs = (NSDictionary *)v62;

      id v13 = v72;
      id v15 = v71;
    }
    v64 = [v13 sportsTheme];
    uint64_t v65 = [v64 length];

    if (v65)
    {
      v66 = (void *)MEMORY[0x1E4F1C9E8];
      v67 = [v13 sportsTheme];
      v68 = objc_msgSend(v66, "fc_dictionaryFromJSON:", v67);

      [(FCSportsEvent *)v17 _inflateSportsThemeFromJSONDictionary:v68];
    }
    id v16 = v74;
  }

  return v17;
}

+ (BOOL)isSportsEventIdentifier:(id)a3
{
  return +[FCSportsEventRecordSource recognizesRecordID:a3];
}

- (void)_inflateSportsDataFromJSONDictionary:(id)a3
{
  id v4 = a3;
  v31 = [[FCSportsData alloc] initWithDictionary:v4];

  v5 = [(FCSportsData *)v31 UMCCanonicalID];
  UMCCanonicalID = self->_UMCCanonicalID;
  self->_UMCCanonicalID = v5;

  v7 = [(FCSportsData *)v31 sportsPrimaryName];
  sportsPrimaryName = self->_sportsPrimaryName;
  self->_sportsPrimaryName = v7;

  v9 = [(FCSportsData *)v31 sportsNameAbbreviation];
  sportsNameAbbreviation = self->_sportsNameAbbreviation;
  self->_sportsNameAbbreviation = v9;

  v11 = [(FCSportsData *)v31 sportsSecondaryName];
  sportsSecondaryName = self->_sportsSecondaryName;
  self->_sportsSecondaryName = v11;

  id v13 = [(FCSportsData *)v31 sportsSecondaryShortName];
  sportsSecondaryShortName = self->_sportsSecondaryShortName;
  self->_sportsSecondaryShortName = v13;

  id v15 = [(FCSportsData *)v31 sportsFullName];
  sportsFullName = self->_sportsFullName;
  self->_sportsFullName = v15;

  v17 = [(FCSportsData *)v31 topLevelSportTagIdentifier];
  topLevelSportTagIdentifier = self->_topLevelSportTagIdentifier;
  self->_topLevelSportTagIdentifier = v17;

  uint64_t v19 = [(FCSportsData *)v31 topLevelGroupsTagIdentifiers];
  topLevelGroupsTagIdentifiers = self->_topLevelGroupsTagIdentifiers;
  self->_topLevelGroupsTagIdentifiers = v19;

  v21 = [(FCSportsData *)v31 sportsNickname];
  sportsNickname = self->_sportsNickname;
  self->_sportsNickname = v21;

  v23 = [(FCSportsData *)v31 sportsLocation];
  sportsLocation = self->_sportsLocation;
  self->_sportsLocation = v23;

  self->_hideLocationInMasthead = [(FCSportsData *)v31 hideLocationInMasthead];
  self->_sportsType = [(FCSportsData *)v31 sportsType];
  v25 = [(FCSportsData *)v31 sportsTypeDisplayName];
  sportsTypeDisplayName = self->_sportsTypeDisplayName;
  self->_sportsTypeDisplayName = v25;

  v27 = [(FCSportsData *)v31 sportsTypePluralizedDisplayName];
  sportsTypePluralizedDisplayName = self->_sportsTypePluralizedDisplayName;
  self->_sportsTypePluralizedDisplayName = v27;

  self->_sportsLeagueType = [(FCSportsData *)v31 sportsLeagueType];
  uint64_t v29 = [(FCSportsData *)v31 sportsEventStartTime];
  sportsEventStartTime = self->_sportsEventStartTime;
  self->_sportsEventStartTime = v29;
}

- (void)_inflateSportsThemeFromJSONDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"primaryColor"];
  v6 = +[FCColor nullableColorWithHexString:v5];
  sportsPrimaryColor = self->_sportsPrimaryColor;
  self->_sportsPrimaryColor = v6;

  v8 = [v4 objectForKeyedSubscript:@"secondaryColor"];
  v9 = +[FCColor nullableColorWithHexString:v8];
  sportsSecondaryColor = self->_sportsSecondaryColor;
  self->_sportsSecondaryColor = v9;

  v11 = [v4 objectForKeyedSubscript:@"sportsLogoMastheadVisibility"];
  self->_sportsLogoMastheadVisibility = (unint64_t)FCMastheadLogoVisibilityFromString(v11);

  id v14 = [v4 objectForKeyedSubscript:@"sportsEventNavigationForegroundColor"];

  v12 = +[FCColor nullableColorWithHexString:v14];
  sportsEventNavigationForegroundColor = self->_sportsEventNavigationForegroundColor;
  self->_sportsEventNavigationForegroundColor = v12;
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__FCSportsEvent_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __31__FCSportsEvent_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 384);
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = +[FCContentArchive archiveWithRecord:v5];
  objc_msgSend(v3, "fc_safelyAddObject:", v6);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = objc_msgSend(*(id *)(a1 + 32), "eventCompetitorTags", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v12)
        {
          if ([*(id *)(*((void *)&v21 + 1) + 8 * i) conformsToProtocol:&unk_1EF8E9808]) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }
        }
        else
        {
          id v13 = 0;
        }
        id v14 = v13;
        id v15 = [v14 contentArchive];
        objc_msgSend(v3, "fc_safelyAddObject:", v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v16 = [*(id *)(a1 + 32) eventLeagueTag];
  v17 = v16;
  if (v16)
  {
    if ([v16 conformsToProtocol:&unk_1EF8E9808]) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  id v19 = v18;

  v20 = [v19 contentArchive];
  objc_msgSend(v3, "fc_safelyAddObject:", v20);
}

- (FCContentManifest)contentManifest
{
  id v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__FCSportsEvent_contentManifest__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  uint64_t v5 = [(FCContentManifest *)v3 initWithManifests:v4];

  return v5;
}

void __32__FCSportsEvent_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 384);
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [v5 base];
  v7 = [v6 contentManifest];
  objc_msgSend(v3, "fc_safelyAddObject:", v7);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "eventCompetitorTags", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v13)
        {
          if ([*(id *)(*((void *)&v22 + 1) + 8 * i) conformsToProtocol:&unk_1EF8E9808]) {
            id v14 = v13;
          }
          else {
            id v14 = 0;
          }
        }
        else
        {
          id v14 = 0;
        }
        id v15 = v14;
        id v16 = [v15 contentManifest];
        objc_msgSend(v3, "fc_safelyAddObject:", v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v17 = [*(id *)(a1 + 32) eventLeagueTag];
  v18 = v17;
  if (v17)
  {
    if ([v17 conformsToProtocol:&unk_1EF8E9808]) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }
  id v20 = v19;

  long long v21 = [v20 contentManifest];
  objc_msgSend(v3, "fc_safelyAddObject:", v21);
}

- (BOOL)isRouteable
{
  id v3 = [(FCSportsEvent *)self superfeedConfigResourceID];
  if (v3)
  {
    uint64_t v4 = [(FCSportsEvent *)self eventCompetitorTags];
    BOOL v5 = [v4 count] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = FCCheckedDynamicCast(v5, (uint64_t)v4);

  v7 = [(FCSportsEvent *)self versionKey];
  uint64_t v8 = [v6 versionKey];
  char v9 = [v7 isEqualToString:v8];

  return v9;
}

- (FCChannelProviding)asChannel
{
  return 0;
}

- (FCSectionProviding)asSection
{
  return 0;
}

- (BOOL)isSports
{
  return 1;
}

- (BOOL)isSportsEvent
{
  return 1;
}

- (BOOL)isMySports
{
  return 0;
}

- (BOOL)isPuzzleHub
{
  return 0;
}

- (BOOL)isPuzzleType
{
  return 0;
}

- (BOOL)hasEvergreenArticleList
{
  return 0;
}

- (FCPuzzleTypeProviding)asPuzzleType
{
  return 0;
}

- (unint64_t)tagType
{
  return 1;
}

- (NSString)nameCompact
{
  return 0;
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (NSString)language
{
  return 0;
}

- (int64_t)contentProvider
{
  return 0;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return 0;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return 0;
}

- (FCAssetHandle)feedNavImageHQAssetHandle
{
  return 0;
}

- (FCColor)groupTitleColor
{
  return 0;
}

- (FCColor)groupDarkStyleTitleColor
{
  return 0;
}

- (NSArray)iAdCategories
{
  return 0;
}

- (NSArray)iAdKeywords
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
  return 1;
}

- (BOOL)isSubscribable
{
  return 0;
}

- (NSString)magazineGenre
{
  return 0;
}

- (NSString)primaryAudience
{
  return 0;
}

- (NSString)publisherPaidAuthorizationURL
{
  return 0;
}

- (NSArray)publisherPaidFeldsparablePurchaseIDs
{
  return 0;
}

- (NSArray)publisherPaidBundlePurchaseIDs
{
  return 0;
}

- (NSArray)publisherPaidOfferableConfigurations
{
  return 0;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return 0;
}

- (NSString)publisherPaidVerificationURL
{
  return 0;
}

- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageLargeAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageLargeMaskAssetHandle
{
  return 0;
}

- (BOOL)isBlockedExplicitContent
{
  return 0;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
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

- (BOOL)disableFollow
{
  return 0;
}

- (BOOL)disableBlock
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

- (NSString)articleRecirculationConfigJSON
{
  return 0;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return 0;
}

- (NSString)publisherPaidWebAccessURL
{
  return 0;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return 0;
}

- (NSDictionary)publisherSpecifiedArticles
{
  return 0;
}

- (FCPaywallConfiguration)paidBundlePaywallConfiguration
{
  return 0;
}

- (NSDate)publisherSpecifiedArticleIDsModifiedDate
{
  return 0;
}

- (NSString)replacementID
{
  return 0;
}

- (int64_t)score
{
  return 0;
}

- (FCTagStocksFields)stocksFields
{
  return 0;
}

- (double)subscriptionRate
{
  return 0.0;
}

- (NSString)subtitle
{
  return 0;
}

- (FCFeedTheming)theme
{
  return 0;
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

- (FCSportsRecommendationMappings)sportsRecommendationMappings
{
  return 0;
}

- (NSData)sportsRecommendationMappingsJSON
{
  return 0;
}

- (BOOL)isSportsRecommendable
{
  return 0;
}

- (NSArray)sportsParentTagIdentifiers
{
  return 0;
}

- (int64_t)sportsLogoMastheadHorizontalPaddingOffset
{
  return 0;
}

- (int64_t)sportsLogoMastheadLeadingOffset
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)versionKey
{
  return self->_versionKey;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
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

- (NSArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSArray)eventCompetitorTags
{
  return self->_eventCompetitorTags;
}

- (FCSportsProviding)eventLeagueTag
{
  return self->_eventLeagueTag;
}

- (NSString)eventArticleListID
{
  return self->_eventArticleListID;
}

- (NSDictionary)rosterResourceIDs
{
  return self->_rosterResourceIDs;
}

- (NSString)sportsData
{
  return self->_sportsData;
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

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (NSDate)sportsEventStartTime
{
  return self->_sportsEventStartTime;
}

- (FCAssetHandle)sportsLogoImageAssetHandle
{
  return self->_sportsLogoImageAssetHandle;
}

- (FCAssetHandle)sportsLogoImageCompactAssetHandle
{
  return self->_sportsLogoImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoImageLargeAssetHandle
{
  return self->_sportsLogoImageLargeAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageAssetHandle
{
  return self->_sportsLogoAltImageAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle
{
  return self->_sportsLogoAltImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle
{
  return self->_sportsLogoAltImageLargeAssetHandle;
}

- (FCColor)sportsPrimaryColor
{
  return self->_sportsPrimaryColor;
}

- (FCColor)sportsSecondaryColor
{
  return self->_sportsSecondaryColor;
}

- (unint64_t)sportsLogoMastheadVisibility
{
  return self->_sportsLogoMastheadVisibility;
}

- (FCColor)sportsEventNavigationForegroundColor
{
  return self->_sportsEventNavigationForegroundColor;
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

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_sportsEventRecord, 0);
  objc_storeStrong((id *)&self->_supergroupKnobs, 0);
  objc_storeStrong((id *)&self->_supergroupKnobsJson, 0);
  objc_storeStrong((id *)&self->_supergroupConfigJson, 0);
  objc_storeStrong((id *)&self->_sportsEventNavigationForegroundColor, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryColor, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryColor, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsEventStartTime, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
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
  objc_storeStrong((id *)&self->_sportsData, 0);
  objc_storeStrong((id *)&self->_rosterResourceIDs, 0);
  objc_storeStrong((id *)&self->_eventArticleListID, 0);
  objc_storeStrong((id *)&self->_eventLeagueTag, 0);
  objc_storeStrong((id *)&self->_eventCompetitorTags, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_highlightsArticleListID, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_adTargetingKeywords, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end