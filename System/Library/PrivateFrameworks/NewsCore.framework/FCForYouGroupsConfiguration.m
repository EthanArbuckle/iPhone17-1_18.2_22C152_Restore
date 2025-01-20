@interface FCForYouGroupsConfiguration
+ (id)_groupIdentifiersByType;
- (BOOL)_defaultAllowsNativeAdsValueForGroupType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (FCForYouGroupsConfiguration)initWithJSONConfiguration:(id)a3;
- (NSDictionary)groupConfigurationsByIdentifier;
- (double)weekendGreatStoriesYouMissedTimeRange;
- (id)_identifierForGroupType:(int64_t)a3;
- (id)configurationForGroupType:(int64_t)a3;
- (unint64_t)_defaultGroupPositionValueForGroupType:(int64_t)a3;
- (unint64_t)_defaultPrecedingGroupsCount:(int64_t)a3;
- (unint64_t)hash;
- (void)setGroupConfigurationsByIdentifier:(id)a3;
@end

@implementation FCForYouGroupsConfiguration

void __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v18 = a3;
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectForKeyedSubscript:v18];
  uint64_t v8 = [v6 integerValue];

  v9 = objc_alloc_init(FCForYouGroupConfiguration);
  [(FCForYouGroupConfiguration *)v9 setIdentifier:v18];
  [(FCForYouGroupConfiguration *)v9 setGroupType:v8];
  v10 = [v7 objectForKeyedSubscript:@"position"];
  if (v10)
  {
    v11 = [v7 objectForKeyedSubscript:@"position"];
    -[FCForYouGroupConfiguration setGroupPosition:](v9, "setGroupPosition:", [v11 integerValue]);
  }
  else
  {
    -[FCForYouGroupConfiguration setGroupPosition:](v9, "setGroupPosition:", [*(id *)(a1 + 40) _defaultGroupPositionValueForGroupType:v8]);
  }

  v12 = [v7 objectForKeyedSubscript:@"precedingGroupsCount"];
  if (v12)
  {
    v13 = [v7 objectForKeyedSubscript:@"precedingGroupsCount"];
    -[FCForYouGroupConfiguration setPrecedingGroupsCount:](v9, "setPrecedingGroupsCount:", [v13 integerValue]);
  }
  else
  {
    -[FCForYouGroupConfiguration setPrecedingGroupsCount:](v9, "setPrecedingGroupsCount:", [*(id *)(a1 + 40) _defaultPrecedingGroupsCount:v8]);
  }

  v14 = [v7 objectForKeyedSubscript:@"precedingGroupsCountForFirstGroup"];
  if (v14)
  {
    v15 = [v7 objectForKeyedSubscript:@"precedingGroupsCountForFirstGroup"];
    -[FCForYouGroupConfiguration setPrecedingGroupsCountForFirstGroup:](v9, "setPrecedingGroupsCountForFirstGroup:", [v15 integerValue]);
  }
  else
  {
    [(FCForYouGroupConfiguration *)v9 setPrecedingGroupsCountForFirstGroup:[(FCForYouGroupConfiguration *)v9 precedingGroupsCount]];
  }

  v16 = [v7 objectForKeyedSubscript:@"allowsNativeAds"];
  if (v16)
  {
    v17 = [v7 objectForKeyedSubscript:@"allowsNativeAds"];
    -[FCForYouGroupConfiguration setAllowsNativeAds:](v9, "setAllowsNativeAds:", [v17 BOOLValue]);
  }
  else
  {
    -[FCForYouGroupConfiguration setAllowsNativeAds:](v9, "setAllowsNativeAds:", [*(id *)(a1 + 40) _defaultAllowsNativeAdsValueForGroupType:v8]);
  }

  [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v18];
}

- (BOOL)_defaultAllowsNativeAdsValueForGroupType:(int64_t)a3
{
  return ((unint64_t)a3 > 0x26) | (0x2120uLL >> a3) & 1;
}

- (unint64_t)_defaultPrecedingGroupsCount:(int64_t)a3
{
  unint64_t v3 = 2;
  uint64_t v4 = 2;
  if (a3 != 23) {
    uint64_t v4 = 0;
  }
  if (a3 != 15) {
    unint64_t v3 = v4;
  }
  unint64_t v5 = 2;
  uint64_t v6 = 2;
  if (a3 != 12) {
    uint64_t v6 = 0;
  }
  if (a3 != 6) {
    unint64_t v5 = v6;
  }
  if (a3 <= 14) {
    return v5;
  }
  else {
    return v3;
  }
}

- (unint64_t)_defaultGroupPositionValueForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x26) {
    return 1;
  }
  else {
    return qword_1A4974910[a3];
  }
}

- (FCForYouGroupsConfiguration)initWithJSONConfiguration:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCForYouGroupsConfiguration;
  uint64_t v6 = [(FCForYouGroupsConfiguration *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:", v5);
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke;
    v22 = &unk_1E5B4CDC0;
    v10 = v7;
    v23 = v10;
    id v11 = v8;
    id v24 = v11;
    uint64_t v12 = objc_msgSend(v9, "fc_dictionary:", &v19);
    groupConfigurationsByIdentifier = v10->_groupConfigurationsByIdentifier;
    v10->_groupConfigurationsByIdentifier = (NSDictionary *)v12;

    v14 = objc_msgSend(v11, "objectForKeyedSubscript:", @"WeekendGreatStoriesYouMissed", v19, v20, v21, v22);
    v15 = [v14 objectForKeyedSubscript:@"timeRange"];
    v16 = v15;
    if (v15) {
      [v15 doubleValue];
    }
    else {
      uint64_t v17 = 0x411A5E0000000000;
    }
    *(void *)&v10->_weekendGreatStoriesYouMissedTimeRange = v17;
  }
  return v7;
}

void __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _groupIdentifiersByType];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke_2;
  v6[3] = &unk_1E5B597C8;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

+ (id)_groupIdentifiersByType
{
  if (qword_1EB5D19C0 != -1) {
    dispatch_once(&qword_1EB5D19C0, &__block_literal_global_426);
  }
  v2 = (void *)qword_1EB5D19B8;
  return v2;
}

void __54__FCForYouGroupsConfiguration__groupIdentifiersByType__block_invoke()
{
  v3[20] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF8D8268;
  v2[1] = &unk_1EF8D8280;
  v3[0] = @"TopStories";
  v3[1] = @"TrendingStories";
  v2[2] = &unk_1EF8D8298;
  v2[3] = &unk_1EF8D82B0;
  v3[2] = @"DailyBriefings";
  v3[3] = @"SavedStories";
  v2[4] = &unk_1EF8D82C8;
  v2[5] = &unk_1EF8D82E0;
  v3[4] = @"GreatStoriesYouMissed";
  v3[5] = @"Editorial";
  v2[6] = &unk_1EF8D82F8;
  v2[7] = &unk_1EF8D8310;
  v3[6] = @"Latest";
  v3[7] = @"Topic";
  v2[8] = &unk_1EF8D8328;
  v2[9] = &unk_1EF8D8340;
  v3[8] = @"MoreFromYou";
  v3[9] = @"NewFavorite";
  v2[10] = &unk_1EF8D8358;
  v2[11] = &unk_1EF8D8370;
  v3[10] = @"PaidSubscription";
  v3[11] = @"BestOfEdition";
  v2[12] = &unk_1EF8D8388;
  v2[13] = &unk_1EF8D83A0;
  v3[12] = @"AutoFavorite";
  v3[13] = @"Magazines";
  v2[14] = &unk_1EF8D83B8;
  v2[15] = &unk_1EF8D83D0;
  v3[14] = @"Spotlight";
  v3[15] = @"Curated";
  v2[16] = &unk_1EF8D83E8;
  v2[17] = &unk_1EF8D8400;
  v3[16] = @"LocalNews";
  v3[17] = @"AudioDailyBriefing";
  v2[18] = &unk_1EF8D8418;
  v2[19] = &unk_1EF8D8430;
  v3[18] = @"MagazineTrending";
  v3[19] = @"MySports";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:20];
  v1 = (void *)qword_1EB5D19B8;
  qword_1EB5D19B8 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupConfigurationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)configurationForGroupType:(int64_t)a3
{
  uint64_t v4 = [(FCForYouGroupsConfiguration *)self _identifierForGroupType:a3];
  if (v4)
  {
    id v5 = [(FCForYouGroupsConfiguration *)self groupConfigurationsByIdentifier];
    uint64_t v6 = [v5 objectForKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_identifierForGroupType:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _groupIdentifiersByType];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
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
  uint64_t v6 = v5;

  if (v6) {
    BOOL v7 = [(NSString *)self->_configuration isEqualToString:v6[1]];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_configuration hash];
}

- (double)weekendGreatStoriesYouMissedTimeRange
{
  return self->_weekendGreatStoriesYouMissedTimeRange;
}

- (NSDictionary)groupConfigurationsByIdentifier
{
  return self->_groupConfigurationsByIdentifier;
}

- (void)setGroupConfigurationsByIdentifier:(id)a3
{
}

@end