@interface SearchUIUpdateSportsFollowingStatusHandler
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIUpdateSportsFollowingStatusHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5 = a3;
  v6 = [v5 sportsItem];
  uint64_t v7 = [v5 follow];

  int v8 = [v6 type];
  if ((v8 - 1) > 1)
  {
    if (v8 == 3)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2;
      aBlock[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
      char v12 = v7;
      v9 = _Block_copy(aBlock);
      v10 = [v6 identifier];
      if (v7) {
        +[SearchUISportsKitUtilities createSessionWithCanonicalId:v10 completionBlock:v9];
      }
      else {
        +[SearchUISportsKitUtilities destroySessionWithCanonicalId:v10 completionBlock:v9];
      }
    }
  }
  else
  {
    +[SearchUITVUtilities updateSportsItemFavoriteStatusWithSportsItem:v6 shouldBeFavorite:v7 completionHandler:&__block_literal_global_7];
  }
}

void __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (unint64_t)destination
{
  return 3;
}

void __86__SearchUIUpdateSportsFollowingStatusHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = @"follow";
  if (!*(unsigned char *)(a1 + 32)) {
    id v3 = @"unfollow";
  }
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUIUpdateSportsFollowingStatusHandler: SportsKit %@ command error : %@", (uint8_t *)&v4, 0x16u);
}

@end