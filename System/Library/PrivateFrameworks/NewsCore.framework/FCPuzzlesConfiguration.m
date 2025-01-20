@interface FCPuzzlesConfiguration
- (BOOL)allowLowerProgressOnCompletedPuzzles;
- (BOOL)puzzleLeaderboardsEnabled;
- (BOOL)puzzlesArchiveAPIEnabled;
- (BOOL)puzzlesEnabled;
- (FCPuzzlesConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 defaultSupportedStorefronts:(id)a5;
- (NSArray)puzzleTypes;
- (NSDictionary)difficultyDescriptions;
- (NSDictionary)puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
- (NSDictionary)puzzleRanksByPuzzleTypeID;
- (NSDictionary)puzzleTypeLeaderboards;
- (NSString)puzzleFullArchiveTagID;
- (NSString)puzzleHubTagID;
- (NSString)streakNotificationBodyMultipleStreaks;
- (NSString)streakNotificationBodyOneStreak;
- (NSString)streakNotificationBodyTwoStreaks;
- (NSString)streakNotificationTitle;
- (double)autoDisableNotificationEngagementInterval;
- (double)autoEnableNotificationPlayTimeInterval;
- (double)badgingUpdateQuiesenceInterval;
- (double)progressUpdateTimeInterval;
- (double)puzzleHistoryPrewarmTimeInterval;
- (double)puzzlesCacheLifetime;
- (double)puzzlesEngineRefreshTimeInterval;
- (double)puzzlesPrewarmTimeInterval;
- (double)recentPuzzlesCacheLifetime;
- (double)streakCheckLocalTimeInterval;
- (int64_t)autoEnableNotificationMinimumPlayCount;
- (int64_t)numberOfHistoryPuzzlesToPrewarm;
- (int64_t)streakLapseNotificationMinimumStreakCount;
- (int64_t)streakNotificationDeliveryLocalTime;
@end

@implementation FCPuzzlesConfiguration

- (NSDictionary)puzzleRanksByPuzzleTypeID
{
  return self->_puzzleRanksByPuzzleTypeID;
}

- (NSArray)puzzleTypes
{
  return self->_puzzleTypes;
}

- (double)puzzlesPrewarmTimeInterval
{
  return self->_puzzlesPrewarmTimeInterval;
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[FCPuzzleTypeLeaderboard alloc] initWithDictionary:v5];

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

- (BOOL)puzzleLeaderboardsEnabled
{
  return self->_puzzleLeaderboardsEnabled;
}

- (BOOL)allowLowerProgressOnCompletedPuzzles
{
  return self->_allowLowerProgressOnCompletedPuzzles;
}

- (FCPuzzlesConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 defaultSupportedStorefronts:(id)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v89.receiver = self;
  v89.super_class = (Class)FCPuzzlesConfiguration;
  v11 = [(FCPuzzlesConfiguration *)&v89 init];
  if (v11)
  {
    id v71 = v10;
    id v73 = v9;
    if ([v10 containsObject:v9]) {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v12 = 0;
    }
    v11->_puzzlesEnabled = +[FCFeatureEnablementChecker enabledInConfig:v8 forKey:@"puzzlesEnabled" withDefaultLevel:v12];
    v11->_puzzlesArchiveAPIEnabled = +[FCFeatureEnablementChecker enabledInConfig:v8 forKey:@"puzzlesArchiveAPIEnabled" withDefaultLevel:v12];
    v11->_puzzleLeaderboardsEnabled = +[FCFeatureEnablementChecker enabledInConfig:v8 forKey:@"puzzleLeaderboardsEnabled" withDefaultLevel:v12];
    uint64_t v13 = FCAppConfigurationStringValue(v8, @"puzzleHubTagId", 0);
    puzzleHubTagID = v11->_puzzleHubTagID;
    v11->_puzzleHubTagID = (NSString *)v13;

    uint64_t v15 = FCAppConfigurationStringValue(v8, @"puzzleFullArchiveTagId", 0);
    puzzleFullArchiveTagID = v11->_puzzleFullArchiveTagID;
    v11->_puzzleFullArchiveTagID = (NSString *)v15;

    v74 = v8;
    v17 = FCAppConfigurationArrayValueWithDefaultValue(v8, @"puzzleTypes", 0);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v86 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = FCAppConfigurationStringValue(*(void **)(*((void *)&v85 + 1) + 8 * i), @"identifier", 0);
          if (v24) {
            [v18 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v21);
    }

    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v18];
    puzzleTypes = v11->_puzzleTypes;
    v11->_puzzleTypes = (NSArray *)v25;

    v11->_autoEnableNotificationMinimumPlayCount = FCAppConfigurationIntegerValue(v74, @"autoEnableNotificationMinimumPlayCount", 0x7FFFFFFFFFFFFFFFLL);
    v11->_autoEnableNotificationPlayTimeInterval = (double)FCAppConfigurationIntegerValue(v74, @"autoEnableNotificationPlayTimeInterval", 0);
    v11->_autoDisableNotificationEngagementInterval = (double)FCAppConfigurationIntegerValue(v74, @"autoDisableNotificationEngagementInterval", 2592000);
    v11->_progressUpdateTimeInterval = (double)FCAppConfigurationIntegerValue(v74, @"progressUpdateTimeInterval", 5);
    v11->_badgingUpdateQuiesenceInterval = (double)FCAppConfigurationIntegerValue(v74, @"badgingUpdateQuiesenceInterval", 21600);
    v11->_numberOfHistoryPuzzlesToPrewarm = FCAppConfigurationIntegerValue(v74, @"numberOfHistoryPuzzlesToPrewarm", 5);
    v11->_puzzleHistoryPrewarmTimeInterval = FCAppConfigurationDoubleValue(v74, @"puzzleHistoryPrewarmTimeInterval", 604800.0);
    v11->_puzzlesPrewarmTimeInterval = FCAppConfigurationDoubleValue(v74, @"puzzlesPrewarmTimeInterval", 43200.0);
    v11->_puzzlesEngineRefreshTimeInterval = FCAppConfigurationDoubleValue(v74, @"puzzlesEngineRefreshTimeInterval", 86400.0);
    v11->_puzzlesCacheLifetime = FCAppConfigurationDoubleValue(v74, @"puzzlesCacheLifetime", 21600.0);
    v72 = v11;
    v11->_recentPuzzlesCacheLifetime = FCAppConfigurationDoubleValue(v74, @"recentPuzzlesCacheLifetime", 3600.0);
    v27 = FCAppConfigurationArrayValueWithDefaultValue(v74, @"puzzleDifficulties", 0);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v27, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v29 = v27;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v82 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          v35 = FCAppConfigurationNumberValue(v34, @"index", 0);
          v36 = FCAppConfigurationStringValue(v34, @"label", 0);
          objc_msgSend(v28, "fc_safelySetObjectAllowingNil:forKeyAllowingNil:", v36, v35);
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v31);
    }

    uint64_t v37 = [v28 copy];
    difficultyDescriptions = v72->_difficultyDescriptions;
    v72->_difficultyDescriptions = (NSDictionary *)v37;

    id v8 = v74;
    v70 = FCAppConfigurationDictionaryValueWithDefaultValue(v74, @"puzzlesFullArchiveMenuConfig", 0);
    v39 = [MEMORY[0x1E4F1CA60] dictionary];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke;
    v79[3] = &unk_1E5B54168;
    v40 = v39;
    v80 = v40;
    [v70 enumerateKeysAndObjectsUsingBlock:v79];
    puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID = v72->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
    v72->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID = v40;
    v69 = v40;

    v42 = [MEMORY[0x1E4F1CA60] dictionary];
    v43 = FCAppConfigurationDictionaryValueWithDefaultValue(v74, @"puzzleTypeLeaderboards", 0);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_3;
    v77[3] = &unk_1E5B54168;
    v44 = v42;
    v78 = v44;
    [v43 enumerateKeysAndObjectsUsingBlock:v77];
    puzzleTypeLeaderboards = v72->_puzzleTypeLeaderboards;
    v72->_puzzleTypeLeaderboards = v44;
    v46 = v44;

    v47 = FCAppConfigurationDictionaryValueWithDefaultValue(v74, @"puzzleTypeRanks", 0);
    v48 = [MEMORY[0x1E4F1CA60] dictionary];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_4;
    v75[3] = &unk_1E5B4F600;
    v49 = v48;
    v76 = v49;
    [v47 enumerateKeysAndObjectsUsingBlock:v75];
    puzzleRanksByPuzzleTypeID = v72->_puzzleRanksByPuzzleTypeID;
    v72->_puzzleRanksByPuzzleTypeID = v49;
    v51 = v49;

    v11 = v72;
    id v9 = v73;
    id v10 = v71;
  }
  v11->_streakCheckLocalTimeInterval = (double)FCAppConfigurationIntegerValue(v8, @"streakCheckLocalTimeInterval", 66600);
  v11->_streakNotificationDeliveryLocalTime = FCAppConfigurationIntegerValue(v8, @"streakNotificationDeliveryLocalTime", 68400);
  v11->_streakLapseNotificationMinimumStreakCount = FCAppConfigurationIntegerValue(v8, @"streakLapseNotificationMinimumStreakCount", 7);
  v52 = FCBundle();
  v53 = [v52 localizedStringForKey:@"Apple News+ Puzzles" value:&stru_1EF8299B8 table:0];
  uint64_t v54 = FCAppConfigurationStringValue(v8, @"streakNotificationTitle", v53);
  streakNotificationTitle = v11->_streakNotificationTitle;
  v11->_streakNotificationTitle = (NSString *)v54;

  v56 = FCBundle();
  v57 = [v56 localizedStringForKey:@"Keep your streak going by solving today’s %@." value:&stru_1EF8299B8 table:0];
  uint64_t v58 = FCAppConfigurationStringValue(v8, @"streakNotificationBodyOneStreak", v57);
  streakNotificationBodyOneStreak = v11->_streakNotificationBodyOneStreak;
  v11->_streakNotificationBodyOneStreak = (NSString *)v58;

  v60 = FCBundle();
  v61 = [v60 localizedStringForKey:@"Keep your streaks going by solving today’s %@ and %@." value:&stru_1EF8299B8 table:0];
  uint64_t v62 = FCAppConfigurationStringValue(v8, @"streakNotificationBodyTwoStreaks", v61);
  streakNotificationBodyTwoStreaks = v11->_streakNotificationBodyTwoStreaks;
  v11->_streakNotificationBodyTwoStreaks = (NSString *)v62;

  v64 = FCBundle();
  v65 = [v64 localizedStringForKey:@"Keep your streaks going by solving today’s puzzles." value:&stru_1EF8299B8 table:0];
  uint64_t v66 = FCAppConfigurationStringValue(v8, @"streakNotificationBodyMultipleStreaks", v65);
  streakNotificationBodyMultipleStreaks = v11->_streakNotificationBodyMultipleStreaks;
  v11->_streakNotificationBodyMultipleStreaks = (NSString *)v66;

  v11->_allowLowerProgressOnCompletedPuzzles = FCAppConfigurationBoolValue(v8, @"allowLowerProgressOnCompletedPuzzles", 0);
  return v11;
}

- (NSString)puzzleHubTagID
{
  return self->_puzzleHubTagID;
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v7 = [[FCPuzzleRank alloc] initWithDictionary:v5 index:a3];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    id v6 = v7;
  }
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[FCPuzzleFullArchiveMenuOptionsConfiguration alloc] initWithConfigDictionary:v3];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (BOOL)puzzlesEnabled
{
  return self->_puzzlesEnabled;
}

- (double)autoDisableNotificationEngagementInterval
{
  return self->_autoDisableNotificationEngagementInterval;
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = FCAppConfigurationDictionaryValueWithDefaultValue(a3, @"sections", 0);
  objc_opt_class();
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_2;
  v11[3] = &unk_1E5B4E468;
  id v12 = v9;
  id v10 = v9;
  [v8 enumerateObjectsUsingBlock:v11];
  [*(id *)(a1 + 32) setObject:v10 forKey:v5];
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = FCAppConfigurationArrayValueWithDefaultValue(a3, @"puzzleRanks", 0);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_5;
  v9[3] = &unk_1E5B4E468;
  id v10 = v7;
  id v8 = v7;
  [v6 enumerateObjectsUsingBlock:v9];
  [*(id *)(a1 + 32) setObject:v8 forKey:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleRanksByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_puzzleTypeLeaderboards, 0);
  objc_storeStrong((id *)&self->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyMultipleStreaks, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyTwoStreaks, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyOneStreak, 0);
  objc_storeStrong((id *)&self->_streakNotificationTitle, 0);
  objc_storeStrong((id *)&self->_difficultyDescriptions, 0);
  objc_storeStrong((id *)&self->_puzzleTypes, 0);
  objc_storeStrong((id *)&self->_puzzleFullArchiveTagID, 0);
  objc_storeStrong((id *)&self->_puzzleHubTagID, 0);
}

- (BOOL)puzzlesArchiveAPIEnabled
{
  return self->_puzzlesArchiveAPIEnabled;
}

- (NSString)puzzleFullArchiveTagID
{
  return self->_puzzleFullArchiveTagID;
}

- (int64_t)autoEnableNotificationMinimumPlayCount
{
  return self->_autoEnableNotificationMinimumPlayCount;
}

- (double)autoEnableNotificationPlayTimeInterval
{
  return self->_autoEnableNotificationPlayTimeInterval;
}

- (double)progressUpdateTimeInterval
{
  return self->_progressUpdateTimeInterval;
}

- (double)badgingUpdateQuiesenceInterval
{
  return self->_badgingUpdateQuiesenceInterval;
}

- (NSDictionary)difficultyDescriptions
{
  return self->_difficultyDescriptions;
}

- (int64_t)numberOfHistoryPuzzlesToPrewarm
{
  return self->_numberOfHistoryPuzzlesToPrewarm;
}

- (double)puzzleHistoryPrewarmTimeInterval
{
  return self->_puzzleHistoryPrewarmTimeInterval;
}

- (double)puzzlesEngineRefreshTimeInterval
{
  return self->_puzzlesEngineRefreshTimeInterval;
}

- (double)puzzlesCacheLifetime
{
  return self->_puzzlesCacheLifetime;
}

- (double)recentPuzzlesCacheLifetime
{
  return self->_recentPuzzlesCacheLifetime;
}

- (double)streakCheckLocalTimeInterval
{
  return self->_streakCheckLocalTimeInterval;
}

- (int64_t)streakNotificationDeliveryLocalTime
{
  return self->_streakNotificationDeliveryLocalTime;
}

- (int64_t)streakLapseNotificationMinimumStreakCount
{
  return self->_streakLapseNotificationMinimumStreakCount;
}

- (NSString)streakNotificationTitle
{
  return self->_streakNotificationTitle;
}

- (NSString)streakNotificationBodyOneStreak
{
  return self->_streakNotificationBodyOneStreak;
}

- (NSString)streakNotificationBodyTwoStreaks
{
  return self->_streakNotificationBodyTwoStreaks;
}

- (NSString)streakNotificationBodyMultipleStreaks
{
  return self->_streakNotificationBodyMultipleStreaks;
}

- (NSDictionary)puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID
{
  return self->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
}

- (NSDictionary)puzzleTypeLeaderboards
{
  return self->_puzzleTypeLeaderboards;
}

@end