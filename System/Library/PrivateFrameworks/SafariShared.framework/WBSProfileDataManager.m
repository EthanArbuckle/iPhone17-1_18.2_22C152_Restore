@interface WBSProfileDataManager
- (WBSProfileDataManager)init;
- (WBSProfileDataManager)initWithProfileProvider:(id)a3;
- (WBSProfileProviding)profileProvider;
- (void)didRemoveProfile:(id)a3;
- (void)didRemoveProfileWithServerID:(id)a3 profileIdentifier:(id)a4;
- (void)ensureProfileDirectoriesExistForProfileWithServerID:(id)a3 profileIdentifier:(id)a4;
@end

@implementation WBSProfileDataManager

- (WBSProfileDataManager)initWithProfileProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSProfileDataManager;
  v6 = [(WBSProfileDataManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSProfileDataManager)init
{
  return 0;
}

- (void)ensureProfileDirectoriesExistForProfileWithServerID:(id)a3 profileIdentifier:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = (id)objc_msgSend(v6, "safari_profileDirectoryURLWithID:createIfNeeded:", v5, 1);

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = (id)objc_msgSend(v8, "safari_profileDirectoryURLWithID:createIfNeeded:", v10, 1);
}

- (void)didRemoveProfileWithServerID:(id)a3 profileIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v5)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = objc_msgSend(v8, "safari_profileDirectoryURLWithID:createIfNeeded:", v5, 0);
    id v19 = 0;
    [v7 removeItemAtURL:v9 error:&v19];
    id v10 = v19;

    if (!v10)
    {
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = 0;
  }
  v14 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[WBSProfileDataManager didRemoveProfileWithServerID:profileIdentifier:]((uint64_t)v5, v14, v10);
  }

  if (v6)
  {
LABEL_4:
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = objc_msgSend(v11, "safari_profileDirectoryURLWithID:createIfNeeded:", v6, 0);
    id v18 = 0;
    [v7 removeItemAtURL:v12 error:&v18];
    id v13 = v18;

    if (!v13) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_10:
  id v13 = 0;
LABEL_11:
  v15 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[WBSProfileDataManager didRemoveProfileWithServerID:profileIdentifier:]((uint64_t)v6, v15, v13);
  }
LABEL_13:
  v16 = +[WBSSiriIntelligenceDonor sharedInstance];
  [v16 removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:v6];

  v17 = +[WBSIgnoredSiriSuggestedSitesController sharedController];
  [v17 removeIgnoredSiriSuggestedSitesInProfile:v6];
}

- (void)didRemoveProfile:(id)a3
{
  id v4 = a3;
  id v6 = [v4 serverID];
  id v5 = [v4 identifier];

  [(WBSProfileDataManager *)self didRemoveProfileWithServerID:v6 profileIdentifier:v5];
}

- (WBSProfileProviding)profileProvider
{
  return self->_profileProvider;
}

- (void).cxx_destruct
{
}

- (void)didRemoveProfileWithServerID:(void *)a3 profileIdentifier:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v6, v7, "Failed to remove profile directory with identifier %{public}@ with error %{public}@", v8, v9, v10, v11, v12);
}

- (void)didRemoveProfileWithServerID:(void *)a3 profileIdentifier:.cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A6B5F000, v6, v7, "Failed to remove profile directory with server id %{public}@ with error %{public}@", v8, v9, v10, v11, v12);
}

@end