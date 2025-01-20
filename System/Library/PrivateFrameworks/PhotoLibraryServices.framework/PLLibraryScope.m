@interface PLLibraryScope
+ (BOOL)_preflightChecksForFiringParticipantAssetTrashNotificationWithPhotoLibrary:(id)a3;
+ (BOOL)_queryIsShareEverythingInternalQuery:(id)a3;
+ (BOOL)libraryScopeIsActiveWithScopeSyncingState:(signed __int16)a3;
+ (BOOL)libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:(id)a3;
+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)supportsCPLScopeType:(int64_t)a3;
+ (id)_computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:(id)a3 outPhotoCount:(unint64_t *)a4 outVideoCount:(unint64_t *)a5 outItemCount:(unint64_t *)a6;
+ (id)_libraryForEnumerationFromBundle:(id)a3 withName:(const char *)a4;
+ (id)_nearestDateSetToHour:(int64_t)a3 minute:(int64_t)a4;
+ (id)_shareEverythingInternalQuery;
+ (id)activeLibraryScopeInManagedObjectContext:(id)a3;
+ (id)compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:(id)a3;
+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 unitTestMode:(BOOL)a6 inPhotoLibrary:(id)a7;
+ (id)entityName;
+ (id)fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:(id)a3 forceNotification:(BOOL)a4;
+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4;
+ (id)localOnlySharedSyncScopeIdentifierPrefix;
+ (id)predicateForActiveLibraryScope;
+ (id)predicateForPreviewLibraryScope;
+ (id)predicateToExcludeExitingLibraryScopes;
+ (id)resetLibraryScopeAssetStatesWithManagedObjectContext:(id)a3;
+ (id)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:(id)a3;
+ (id)scopeIdentifierPrefix;
+ (signed)activeSyncingStateToUse;
+ (signed)participationStateFromLibraryScope:(id)a3;
+ (unint64_t)_immediateNotificationAssetThresholdToUseWithPhotoLibrary:(id)a3;
+ (void)_cleanupLocalPreviewLibraryScopesInManagedObjectContext:(id)a3;
+ (void)informRapportToAddShareParticipantUUIDs:(id)a3 photoLibrary:(id)a4;
+ (void)informRapportToRemoveShareParticipantUUIDs:(id)a3 photoLibraryBundle:(id)a4;
+ (void)updateLibraryScopeActiveDefaultsWithManagedObjectContext:(id)a3;
- (BOOL)_libraryScopeWasCreatedInLocalOnlyMode;
- (BOOL)confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 databaseContext:(id)a4 withError:(id *)a5;
- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3;
- (BOOL)isSyncableChange;
- (BOOL)libraryScopeIsActive;
- (BOOL)removePeopleRulesForPersonUUID:(id)a3;
- (BOOL)shouldEnableRulesChangeTracker;
- (BOOL)supportsCloudUpload;
- (BOOL)updatePeopleRulesForAllTombstonedPersons;
- (BOOL)updatePeopleRulesForTombstonePersonUUID:(id)a3 replaceWithPersonUUID:(id)a4;
- (id)_cplShare;
- (id)activateScopeWithCompletionHandler:(id)a3;
- (id)cloudSyncableRulesData;
- (id)cplScopeChange;
- (id)markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:(id)a3 completionHandler:(id)a4;
- (id)scopedIdentifier;
- (void)_confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 photoLibrary:(id)a4;
- (void)_insertOwnedParticipantInLibrary:(id)a3 unitTestMode:(BOOL)a4;
- (void)_verifyCurrentUserParticipantExists;
- (void)acceptWithCompletionHandler:(id)a3;
- (void)deactivateScopeWithCompletionHandler:(id)a3;
- (void)didSave;
- (void)prepareForDeletion;
- (void)publishWithCompletionHandler:(id)a3;
- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(unsigned __int16)a6 completionHandler:(id)a7;
- (void)setScopeSyncingState:(signed __int16)a3;
- (void)startExitWithRetentionPolicy:(int64_t)a3 exitSource:(unsigned __int16)a4 completionHandler:(id)a5;
- (void)startTrackingParticipantAssetTrashStateIfNeeded;
- (void)stopTrackingParticipantAssetTrashedStateIfNeeded;
- (void)updateRulesDataWithCloudSyncableRulesData:(id)a3;
- (void)userViewedAssetTrashNotificationWithManagedObjectContext:(id)a3;
- (void)willSave;
@end

@implementation PLLibraryScope

+ (id)predicateForPreviewLibraryScope
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"previewState", 1);
}

+ (id)predicateForActiveLibraryScope
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"scopeSyncingState", 1, @"scopeSyncingState", 2);
}

+ (id)predicateToExcludeExitingLibraryScopes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"exitState", 0);
}

+ (void)informRapportToRemoveShareParticipantUUIDs:(id)a3 photoLibraryBundle:(id)a4
{
  id v5 = a3;
  id v6 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "+[PLLibraryScope informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:]", a4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F94728]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke;
  v11[3] = &unk_1E5873A50;
  id v12 = v5;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  [v9 performBlock:v11];
}

void __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[PLShareParticipant participantsWithUUIDs:a1[4] inPhotoLibrary:a1[5]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 138412290;
    long long v13 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "description", v13);
        id v10 = [v8 emailAddress];
        if (v10 || ([v8 phoneNumber], (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = (void *)a1[6];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke_2;
          v14[3] = &unk_1E5873440;
          id v15 = v9;
          [v11 removeAppleID:v10 completion:v14];
        }
        else
        {
          id v10 = PLBackendGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v21 = v9;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to remove share participant in unexpected state with nil phone/email %@ via -[RPPeopleDiscovery addAppleID:completion:]", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v12 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v5 = v12;
    }
    while (v12);
  }
}

void __80__PLLibraryScope_informRapportToRemoveShareParticipantUUIDs_photoLibraryBundle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = PLBackendGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      uint64_t v7 = "Failed to remove share participant %@ via -[RPPeopleDiscovery removeAppleID:completion:]: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    uint64_t v7 = "Successfully removed share participant %@ via -[RPPeopleDiscovery removeAppleID:completion:]";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

+ (void)informRapportToAddShareParticipantUUIDs:(id)a3 photoLibrary:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F94728]);
  long long v19 = v6;
  v20 = v5;
  id v8 = +[PLShareParticipant participantsWithUUIDs:v5 inPhotoLibrary:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        __int16 v14 = [v13 description];
        id v15 = [v13 emailAddress];
        if (v15 || ([v13 phoneNumber], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v16 = [v13 description];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __71__PLLibraryScope_informRapportToAddShareParticipantUUIDs_photoLibrary___block_invoke;
          v21[3] = &unk_1E5873440;
          id v22 = v16;
          id v17 = v16;
          [v7 addAppleID:v15 completion:v21];
        }
        else
        {
          id v15 = PLBackendGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v14;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to add share participant in unexpected state with nil phone/email %@ via -[RPPeopleDiscovery addAppleID:completion:]", buf, 0xCu);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v18 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
      uint64_t v10 = v18;
    }
    while (v18);
  }
}

void __71__PLLibraryScope_informRapportToAddShareParticipantUUIDs_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = PLBackendGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      id v7 = "Failed to add share participant %@ via -[RPPeopleDiscovery addAppleID:completion:]: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    id v7 = "Successfully added share participant %@ via -[RPPeopleDiscovery addAppleID:completion:]";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

+ (BOOL)_queryIsShareEverythingInternalQuery:(id)a3
{
  id v3 = a3;
  if ([v3 hasFirst] & 1) != 0 || (objc_msgSend(v3, "hasSecond"))
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 singleQueries];
    if ([v5 count]) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = [v3 conjunction] == 0;
    }
  }
  return v4;
}

+ (id)_shareEverythingInternalQuery
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8B9A0]);
  [v2 setConjunction:0];
  return v2;
}

+ (id)resetLibraryScopeAssetStatesWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Resetting libraryScopeShareState for assets...", buf, 2u);
  }

  *(void *)buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__8651;
  long long v25 = __Block_byref_object_dispose__8652;
  id v26 = 0;
  id v7 = objc_msgSend(v5, "pl_libraryBundle");
  id v8 = [v7 libraryServicesManager];
  os_log_type_t v9 = [v8 databaseContext];
  uint32_t v10 = (void *)[v9 newShortLivedCplLibraryWithNameSuffix:"+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]"];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke;
  v15[3] = &unk_1E5873D70;
  id v11 = v5;
  id v16 = v11;
  uint64_t v18 = buf;
  id v19 = a1;
  SEL v20 = a2;
  id v12 = v10;
  id v17 = v12;
  [v12 performTransactionAndWait:v15];
  id v13 = *((id *)v22 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v34 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PLTransactionScopeMomentGeneration"];
  id v2 = [*(id *)(a1 + 32) pathManager];
  id v3 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v34, v2, "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke");

  BOOL v4 = [v3 transactionToken];
  id v5 = [*(id *)(a1 + 32) pathManager];
  uint64_t v6 = +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v4, v34, v5, "+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke");

  [v3 completeTransaction];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    id v8 = +[PLManagedAsset entityName];
    os_log_type_t v9 = (void *)[v7 initWithEntityName:v8];

    v33 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"libraryScopeShareState", 0);
    [v9 setPredicate:v33];
    [v9 setFetchBatchSize:100];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    uint32_t v10 = objc_opt_class();
    id v11 = [*(id *)(a1 + 32) photoLibrary];
    id v12 = [v11 libraryBundle];
    id v13 = [v10 _libraryForEnumerationFromBundle:v12 withName:"+[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:]_block_invoke"];

    __int16 v14 = [v13 managedObjectContext];
    id v15 = [PLEnumerateAndSaveController alloc];
    id v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v17 = [v14 pathManager];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_2;
    v42[3] = &unk_1E586FB88;
    id v18 = v14;
    id v43 = v18;
    id v19 = [(PLEnumerateAndSaveController *)v15 initWithName:v16 fetchRequest:v9 context:v18 pathManager:v17 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v42 didFetchObjectIDsBlock:0 processResultsBlock:&__block_literal_global_8660];

    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    SEL v20 = +[PLConcurrencyLimiter sharedLimiter];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_4;
    v36[3] = &unk_1E5875A90;
    v38 = v40;
    v21 = v19;
    v37 = v21;
    p_long long buf = &buf;
    [v20 sync:v36 identifyingBlock:0 library:v13];

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&buf, 8);

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v22 = objc_alloc(MEMORY[0x1E4F1C038]);
      uint64_t v23 = +[PLPhotosHighlight entity];
      long long v24 = (void *)[v22 initWithEntity:v23];

      [v24 setResultType:2];
      v44[0] = @"photoAssetsSuggestedByPhotosCount";
      v44[1] = @"videoAssetsSuggestedByPhotosCount";
      v45[0] = &unk_1EEBED380;
      v45[1] = &unk_1EEBED380;
      long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
      [v24 setPropertiesToUpdate:v25];

      id v26 = [*(id *)(a1 + 40) managedObjectContext];
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v27 + 40);
      v28 = [v26 executeRequest:v24 error:&obj];
      objc_storeStrong((id *)(v27 + 40), obj);

      v29 = PLBackendSharingGetLog();
      uint64_t v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [v28 result];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Reset [photo/video]assetsSuggestedByPhotosCount for %@ highlights", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v32;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to reset [photo/video]assetsSuggestedByPhotosCount for highlights: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  [v6 completeTransactionScope:@"PLTransactionScopeMomentGeneration"];
}

id __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_4(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  id v12 = 0;
  char v3 = [v2 processObjectsWithError:&v12];
  id v4 = v12;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3;
  int v5 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v6 = PLBackendSharingGetLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(*(void *)(a1[6] + 8) + 24);
      *(_DWORD *)long long buf = 134217984;
      id v14 = v8;
      os_log_type_t v9 = "ResetLibraryScopeAssetStates: Successfully reset %lu assets";
      uint32_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v10, v11, v9, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v4;
    os_log_type_t v9 = "ResetLibraryScopeAssetStates: Failed to reset assets %@";
    uint32_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

void __71__PLLibraryScope_resetLibraryScopeAssetStatesWithManagedObjectContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setLibraryScopeShareState:0];
        [v8 removeLibraryScopeAndContributors];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (id)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithManagedObjectContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Removing all local only LibraryScopes", buf, 2u);
  }

  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  id v7 = [a1 sharesWithPredicate:v6 fetchLimit:0 inManagedObjectContext:v4];

  if ([v7 count])
  {
    id v13 = 0;
    BOOL v8 = +[PLShare incrementallyDeleteAndSaveShares:v7 logMessagePrefix:@"local only" error:&v13];
    id v9 = v13;
    if (v8)
    {
      id v10 = (id)[a1 resetLibraryScopeAssetStatesWithManagedObjectContext:v4];
    }
    else
    {
      long long v11 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Failed to delete local only scopes: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)_cleanupLocalPreviewLibraryScopesInManagedObjectContext:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() predicateForPreviewLibraryScope];
  v12[0] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [(id)objc_opt_class() predicateForActiveLibraryScope];
  BOOL v8 = [v6 notPredicateWithSubpredicate:v7];
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = [v3 andPredicateWithSubpredicates:v9];

  long long v11 = [(id)objc_opt_class() sharesWithPredicate:v10 fetchLimit:0 inManagedObjectContext:v4];

  if ([v11 count]) {
    +[PLShare incrementallyDeleteAndSaveShares:v11 logMessagePrefix:@"preview" error:0];
  }
}

+ (id)compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:(id)a3
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F8BA10];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "predicateForIncludeMask:useIndex:", objc_msgSend(v3, "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders"), 0);
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v5;
  id v7 = +[PLManagedAsset predicateToExcludeTrashedAssets];
  v14[1] = v7;
  BOOL v8 = +[PLManagedAsset predicateToExcludeHiddenAssets];
  v14[2] = v8;
  v14[3] = v4;
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 10);
  void v14[4] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 103);
  v14[5] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
  long long v12 = [v6 andPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!_os_feature_enabled_impl())
  {
    BOOL v8 = [v6 scopeIdentifier];
    id v10 = [v7 managedObjectContext];
    id v11 = [a1 shareWithScopeIdentifier:v8 includeTrashed:1 inManagedObjectContext:v10];

    if ([v11 _libraryScopeWasCreatedInLocalOnlyMode])
    {
      long long v12 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v11 debugDescription];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "+[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:]";
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring %@ in %s since it was created in local only mode", buf, 0x16u);
      }
      id v9 = 0;
    }
    else
    {
      if (![a1 validateCPLScopeChange:v6])
      {
        id v9 = 0;
LABEL_80:

        goto LABEL_81;
      }
      if (!v11)
      {
        uint64_t v14 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Creating library scope share with scope identifier %@", buf, 0xCu);
        }

        id v11 = [a1 insertInPhotoLibrary:v7];
        [v11 setStatus:2];
        [v11 setScopeIdentifier:v8];
      }
      id v15 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v11 uuid];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Updating library scope %@ with CPLlibraryScopeScopeChange %@", buf, 0x16u);
      }
      uint64_t v17 = [v6 scopeType];
      switch(v17)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 6:
          id v18 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v6;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unexpected scopeType for library scope from scopeChange %@", buf, 0xCu);
          }

          goto LABEL_20;
        case 4:
        case 5:
          uint64_t v19 = 2;
          break;
        default:
LABEL_20:
          uint64_t v19 = 0;
          break;
      }
      [v11 setScopeType:v17];
      [v11 setLocalPublishState:v19];
      int v20 = [v6 isActivated];
      int v21 = [v11 scopeSyncingState];
      if (v20)
      {
        if (v21 != 1)
        {
          [v11 setScopeSyncingState:1];
          [v11 untrash];
          if (PLShouldLogRegisteredEvent())
          {
            v79 = @"PhotoSharingEnabled";
            v80[0] = MEMORY[0x1E4F1CC38];
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
            PLLogRegisteredEvent();
          }
        }
        [v11 setPreviewState:0];
        [v11 startTrackingParticipantAssetTrashStateIfNeeded];
      }
      else
      {
        if (v21)
        {
          [v11 setScopeSyncingState:0];
          if (PLShouldLogRegisteredEvent())
          {
            v77 = @"PhotoSharingEnabled";
            uint64_t v78 = MEMORY[0x1E4F1CC28];
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            PLLogRegisteredEvent();
          }
        }
        [v11 stopTrackingParticipantAssetTrashedStateIfNeeded];
      }
      long long v12 = [v6 assetCountPerType];
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      int v76 = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      int v70 = 0;
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x2020000000;
      int v66 = 0;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke;
      v62[3] = &unk_1E5864038;
      v62[4] = buf;
      v62[5] = &v67;
      v62[6] = &v63;
      [v12 enumerateKeysAndObjectsUsingBlock:v62];
      [v11 setCloudPhotoCount:*(unsigned int *)(*(void *)&buf[8] + 24)];
      [v11 setCloudVideoCount:*((unsigned int *)v68 + 6)];
      [v11 setCloudItemCount:*((unsigned int *)v64 + 6)];
      id v22 = [v6 title];
      [v11 setTitle:v22];

      uint64_t v23 = [v6 share];
      if (v23)
      {
        [v11 updateShareWithCPLShare:v23 inPhotoLibrary:v7];
        long long v24 = [v23 creationDate];
        [v11 setCreationDate:v24];
      }
      else
      {
        long long v24 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v71 = 138412290;
          *(void *)v72 = v6;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "CPLShare missing on scopeChange %@", v71, 0xCu);
        }
      }

      id v25 = v6;
      if ([MEMORY[0x1E4F598A8] serverSupportsLibraryShareSettingsRecordSyncing])
      {
        id v26 = [v25 userDefinedRules];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          v28 = [v25 userDefinedRules];
          [v11 updateRulesDataWithCloudSyncableRulesData:v28];
        }
      }
      if ([MEMORY[0x1E4F598A8] serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing])
      {
        v29 = [v25 userViewedParticipantTrashNotificationDate];
        BOOL v30 = v29 == 0;

        if (!v30)
        {
          v31 = [v11 lastParticipantAssetTrashNotificationViewedDate];
          uint64_t v32 = [v25 userViewedParticipantTrashNotificationDate];
          char v33 = [v31 isEqualToDate:v32];

          if ((v33 & 1) == 0)
          {
            v34 = [v25 userViewedParticipantTrashNotificationDate];
            [v11 setLastParticipantAssetTrashNotificationViewedDate:v34];

            v35 = [v25 userViewedParticipantTrashNotificationDate];
            [v11 setLastParticipantAssetTrashNotificationDate:v35];

            v36 = [v11 lastParticipantAssetTrashNotificationViewedDate];
            v37 = [v11 lastParticipantAssetTrashNotificationDate];
            BOOL v38 = [v36 compare:v37] == -1;

            if (!v38)
            {
              v39 = +[PLNotificationManager sharedManager];
              [v39 removeNotificationForSharedLibraryParticipantAssetTrash];
            }
          }
        }
      }
      if ([v25 isActivated])
      {
        uint64_t v40 = [v25 exitState];
        if (v40 == 2) {
          uint64_t v41 = 2;
        }
        else {
          uint64_t v41 = v40 == 1;
        }
        [v11 setExitState:v41];
        uint64_t v42 = [v25 exitSource];
        uint64_t v43 = 0;
        if (v42 > 2)
        {
          if (v42 == 3)
          {
            uint64_t v43 = 3;
          }
          else if (v42 == 1000)
          {
            uint64_t v43 = 1000;
          }
        }
        else if (v42 == 1)
        {
          uint64_t v43 = 1;
        }
        else if (v42 == 2)
        {
          uint64_t v43 = 2;
        }
        [v11 setExitSource:v43];
      }
      if ([v25 areSomeUsersExiting])
      {
        v44 = +[PLShareParticipant participantsWithScope:v11 inPhotoLibrary:v7];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke_229;
        v60[3] = &unk_1E5864060;
        id v61 = v25;
        [v44 enumerateObjectsUsingBlock:v60];
      }
      if ([v11 scopeType] == 5 && objc_msgSend(v11, "exitState") == 2)
      {
        v45 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v71 = 138412290;
          *(void *)v72 = v25;
          _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_INFO, "Exiting accepted scope with scope change: %@", v71, 0xCu);
        }

        unint64_t v46 = [v25 exitType];
        char v47 = v46;
        BOOL v58 = v46 > 3;
        if (v46 <= 3) {
          unsigned __int16 v48 = v46;
        }
        else {
          unsigned __int16 v48 = 0;
        }
        int v49 = v48;
        uint64_t v50 = (__int16)v48;
        if (v49 != (unsigned __int16)[v11 exitType]
          && [v11 exitSource] != 2)
        {
          uint64_t v57 = [v25 exitRetentionPolicy];
          if (((v58 | (3u >> (v47 & 0xF))) & 1) == 0)
          {
            v56 = [v11 owner];
            v59 = [v56 shortName];
            if (v59)
            {
              v51 = PLBackendSharingGetLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v71 = 67109634;
                *(_DWORD *)v72 = v49;
                *(_WORD *)&v72[4] = 2048;
                *(void *)&v72[6] = v57;
                __int16 v73 = 2112;
                v74 = v59;
                _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_INFO, "Posting notification for non-self-initiated exit process with exit type: %d, retention policy: %ld, owner: %@", v71, 0x1Cu);
              }

              v52 = +[PLNotificationManager sharedManager];
              v53 = [MEMORY[0x1E4F1C9C8] date];
              [v52 postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:v50 retentionPolicy:v57 ownerName:v59 notificationDeliveryDate:v53];
            }
            else
            {
              v52 = PLBackendSharingGetLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                v54 = [v56 uuid];
                *(_DWORD *)v71 = 138543362;
                *(void *)v72 = v54;
                _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "Owner participant does not have a short name for exit notification: %{public}@", v71, 0xCu);
              }
            }
          }
        }
        [v11 setExitType:v50];
      }
      id v11 = v11;

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(buf, 8);
      id v9 = v11;
    }

    goto LABEL_80;
  }
  BOOL v8 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "+[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:]";
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring %s since we are in GoldilocksLocalMode", buf, 0xCu);
  }
  id v9 = 0;
LABEL_81:

  return v9;
}

void __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  if ([v5 conformsToType:*MEMORY[0x1E4F44400]])
  {
    int v6 = [v9 integerValue];
    uint64_t v7 = a1[4];
  }
  else
  {
    int v8 = [v5 conformsToType:*MEMORY[0x1E4F44448]];
    int v6 = [v9 integerValue];
    if (v8) {
      uint64_t v7 = a1[5];
    }
    else {
      uint64_t v7 = a1[6];
    }
  }
  *(_DWORD *)(*(void *)(v7 + 8) + 24) += v6;
}

void __71__PLLibraryScope_insertOrUpdateShareWithCPLScopeChange_inPhotoLibrary___block_invoke_229(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  uint64_t v5 = [v3 userIdentifier];
  LODWORD(v4) = [v4 isUserWithIdentifierExiting:v5];

  if (v4)
  {
    if ([v7 isCurrentUser]) {
      __int16 v6 = [*(id *)(a1 + 32) exitState];
    }
    else {
      __int16 v6 = 1;
    }
  }
  else
  {
    __int16 v6 = 0;
  }
  [v7 setExitState:v6];
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_os_feature_enabled_impl())
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F59778];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Unable to fetch shares from URL while in GoldilocksLocalMode";
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = (__CFString **)v32;
    id v13 = &v31;
LABEL_7:
    uint64_t v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    uint64_t v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = 33;
    goto LABEL_8;
  }
  if (([v8 isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F59778];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    BOOL v30 = @"iCloud Photo Library is not enabled";
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = &v30;
    id v13 = &v29;
    goto LABEL_7;
  }
  if ([v7 scopeType] == 4)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = @"Not allowed to url fetch owned LibraryScopes";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = 81001;
  }
  else
  {
    if (+[PLShareParticipant isCurrentUserInScopeChange:v7])
    {
      BOOL v21 = 1;
      goto LABEL_11;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F8C500];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v26 = @"Unable to fetch shares from URL while not a participant.";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v19 = 81003;
    uint64_t v17 = v23;
    uint64_t v18 = v24;
  }
LABEL_8:
  id v20 = [v17 errorWithDomain:v18 code:v19 userInfo:v16];
  if (a5)
  {
    id v20 = v20;
    *a5 = v20;
  }

  BOOL v21 = 0;
LABEL_11:

  return v21;
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

+ (id)_nearestDateSetToHour:(int64_t)a3 minute:(int64_t)a4
{
  __int16 v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v8 = [v7 components:-1 fromDate:v6];
  [v8 setHour:a3];
  [v8 setMinute:a4];
  [v8 setSecond:0];
  id v9 = [v7 dateFromComponents:v8];
  if ([v6 compare:v9] == -1)
  {
    id v11 = v9;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v10 setDay:1];
    id v11 = [v7 dateByAddingComponents:v10 toDate:v9 options:0];
  }
  return v11;
}

+ (id)fireParticipantAssetTrashNotificationIfNeededWithPhotoLibrary:(id)a3 forceNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4
    || ([a1 _preflightChecksForFiringParticipantAssetTrashNotificationWithPhotoLibrary:v6] & 1) != 0)
  {
    id v7 = objc_opt_class();
    id v8 = [v6 managedObjectContext];
    id v9 = [v7 activeLibraryScopeInManagedObjectContext:v8];

    uint64_t v32 = 0;
    char v33 = 0;
    uint64_t v31 = 0;
    id v10 = [a1 _computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:v9 outPhotoCount:&v33 outVideoCount:&v32 outItemCount:&v31];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 localizedDescription];
    }
    else
    {
      if (!&v33[v32 + v31])
      {
        id v13 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v9 compactDescription];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v35 = (uint64_t)v14;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Ran fetch and there were 0 assets to notify user: %@", buf, 0xCu);
        }
        uint64_t v15 = @"Ran fetch and there were 0 assets to notify user";
        goto LABEL_23;
      }
      uint64_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v17 = [v16 integerForKey:@"PLLibraryScopeAssetTrashNotificationPostingHour"];

      if (v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v19 = [v18 integerForKey:@"PLLibraryScopeAssetTrashNotificationPostingMinute"];

        id v20 = [a1 _nearestDateSetToHour:v17 minute:v19];
        BOOL v21 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v35 = v17;
          __int16 v36 = 2048;
          uint64_t v37 = v19;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom PLLibraryScopeAssetTrashNotificationPostingHour set: %lu hour, %lu minute", buf, 0x16u);
        }
      }
      else
      {
        id v20 = [a1 _nearestDateSetToHour:9 minute:0];
      }
      if (v4)
      {
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];

        id v20 = (void *)v22;
      }
      uint64_t v23 = +[PLNotificationManager sharedManager];
      [v23 postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:v33 videoCount:v32 itemCount:v31 withNotificationDeliveryDate:v20];

      uint64_t v24 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = v32;
        uint64_t v25 = (uint64_t)v33;
        uint64_t v27 = v31;
        v28 = [v9 compactDescription];
        *(_DWORD *)long long buf = 134219010;
        uint64_t v35 = v25;
        __int16 v36 = 2048;
        uint64_t v37 = v26;
        __int16 v38 = 2048;
        uint64_t v39 = v27;
        __int16 v40 = 2112;
        uint64_t v41 = v20;
        __int16 v42 = 2112;
        uint64_t v43 = v28;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Ran fetch and posted notification about %lu photos %lu videos %lu items to notify user. Notification to be posted at %@: %@", buf, 0x34u);
      }
      uint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
      [v9 setLastParticipantAssetTrashNotificationDate:v29];

      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Ran fetch and posted notification about %lu photos %lu videos %lu items to notify user", v33, v32, v31);
    }
    uint64_t v15 = (__CFString *)v12;
LABEL_23:

    goto LABEL_24;
  }
  id v9 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight checks failed", buf, 2u);
  }
  uint64_t v15 = @"Preflight checks failed";
LABEL_24:

  return v15;
}

+ (id)_computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:(id)a3 outPhotoCount:(unint64_t *)a4 outVideoCount:(unint64_t *)a5 outItemCount:(unint64_t *)a6
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v26 = [v6 currentUserParticipant];
  uint64_t v27 = [v6 lastParticipantAssetTrashNotificationDate];
  uint64_t v25 = +[PLManagedAsset predicateToIncludeOnlyContentContributedByCurrentUser];
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 1);
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", @"trashedDate", v27];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"trashedByParticipant", v26];
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v47[0] = v25;
  v47[1] = v7;
  v47[2] = v8;
  v47[3] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
  uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

  id v13 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v14 = +[PLManagedAsset entityName];
  uint64_t v15 = [v13 fetchRequestWithEntityName:v14];

  [v15 setPredicate:v12];
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  BOOL v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v16 = [v6 managedObjectContext];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __157__PLLibraryScope__computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope_outPhotoCount_outVideoCount_outItemCount___block_invoke;
  v28[3] = &unk_1E5863FC0;
  v28[4] = &v37;
  v28[5] = &v33;
  v28[6] = &v29;
  uint64_t v17 = [v16 enumerateObjectsFromFetchRequest:v15 usingDefaultBatchSizeWithBlock:v28];

  if (v17)
  {
    uint64_t v18 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v6 compactDescription];
      *(_DWORD *)long long buf = 138412802;
      __int16 v42 = v17;
      __int16 v43 = 2112;
      uint64_t v44 = v19;
      __int16 v45 = 2112;
      unint64_t v46 = v12;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Fetch failed: %@ libraryScope %@, Predicate %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v18 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v20 = [v6 compactDescription];
      *(_DWORD *)long long buf = 138412546;
      __int16 v42 = v20;
      __int16 v43 = 2112;
      uint64_t v44 = v12;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: LibraryScope %@, Predicate %@", buf, 0x16u);
    }
  }

  if (a4) {
    *a4 = v38[3];
  }
  if (a5) {
    *a5 = v34[3];
  }
  if (a6) {
    *a6 = v30[3];
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

void __157__PLLibraryScope__computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope_outPhotoCount_outVideoCount_outItemCount___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isPhoto])
  {
    uint64_t v3 = a1 + 32;
  }
  else
  {
    int v4 = [v5 isVideo];
    uint64_t v3 = a1 + 48;
    if (v4) {
      uint64_t v3 = a1 + 40;
    }
  }
  ++*(void *)(*(void *)(*(void *)v3 + 8) + 24);
}

+ (BOOL)_preflightChecksForFiringParticipantAssetTrashNotificationWithPhotoLibrary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled() & 1) != 0
    || ([v4 isUnitTesting] & 1) != 0)
  {
    id v5 = objc_opt_class();
    id v6 = [v4 managedObjectContext];
    id v7 = [v5 activeLibraryScopeInManagedObjectContext:v6];

    if (!v7)
    {
      id v8 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: No active LibraryScope", buf, 2u);
      }
      BOOL v17 = 0;
      goto LABEL_42;
    }
    id v8 = [v7 currentUserParticipant];
    if (v8)
    {
      uint64_t v9 = [v7 lastParticipantAssetTrashNotificationDate];
      if (v9)
      {
        id v10 = v9;
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v28 = 0;
        unint64_t v11 = [a1 _immediateNotificationAssetThresholdToUseWithPhotoLibrary:v4];
        id v12 = (id)[a1 _computeCountOfContributedAssetsTrashedByOtherParticipantsSinceLastNotificationDateInLibraryScope:v7 outPhotoCount:&v30 outVideoCount:&v29 outItemCount:&v28];
        if (v29 + v30 + v28 >= v11)
        {
          BOOL v21 = PLBackendSharingGetLog();
          BOOL v17 = 1;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 134218240;
            unint64_t v32 = v29 + v30 + v28;
            __int16 v33 = 2048;
            unint64_t v34 = v11;
            _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight passed: Based on high asset trash count: %lu, threshold: %lu", buf, 0x16u);
          }
        }
        else
        {
          id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          unint64_t v14 = [v13 integerForKey:@"PLLibraryScopeAssetTrashNotificationThreshold"];

          if (v14)
          {
            uint64_t v15 = PLBackendSharingGetLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 134217984;
              unint64_t v32 = v14;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom PLLibraryScopeAssetTrashNotificationThreshold set: %lu seconds", buf, 0xCu);
            }

            double v16 = (double)v14;
          }
          else
          {
            double v16 = 604800.0;
          }
          id v22 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
          BOOL v21 = [v22 initWithTimeInterval:v23 sinceDate:-v16];

          if ([v10 compare:v21] == 1)
          {
            uint64_t v24 = PLBackendSharingGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              unint64_t v32 = (unint64_t)v10;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: lastNotificationDate is within threshold: %@", buf, 0xCu);
            }
            BOOL v17 = 0;
          }
          else
          {
            uint64_t v25 = [v7 lastParticipantAssetTrashNotificationViewedDate];
            uint64_t v24 = v25;
            if (v25
              && [v25 compare:v10] != -1
              && [v24 compare:v21] == 1)
            {
              uint64_t v26 = PLBackendSharingGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                unint64_t v32 = (unint64_t)v24;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: lastNotificationViewedDate is within threshold: %@", buf, 0xCu);
              }
              BOOL v17 = 0;
            }
            else
            {
              uint64_t v26 = PLBackendSharingGetLog();
              BOOL v17 = 1;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight passed: Reach end of preflight checks", buf, 2u);
              }
            }
          }
        }

        goto LABEL_41;
      }
      uint64_t v19 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v7 compactDescription];
        *(_DWORD *)long long buf = 138412290;
        unint64_t v32 = (unint64_t)v20;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Preflight failed: Active LibraryScope has nil lastParticipantAssetTrashNotificationDate: %@", buf, 0xCu);
      }
      [v7 startTrackingParticipantAssetTrashStateIfNeeded];
      id v10 = 0;
    }
    else
    {
      id v10 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v7 compactDescription];
        *(_DWORD *)long long buf = 138412290;
        unint64_t v32 = (unint64_t)v18;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "PostParticipantAssetTrashNotification: Preflight failed: Active LibraryScope has no current user: %@", buf, 0xCu);
      }
    }
    BOOL v17 = 0;
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  id v7 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Preflight failed: Setting is disabled", buf, 2u);
  }
  BOOL v17 = 0;
LABEL_43:

  return v17;
}

+ (unint64_t)_immediateNotificationAssetThresholdToUseWithPhotoLibrary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 libraryServicesManager];
  id v4 = [v3 cloudPhotoLibraryManager];
  id v5 = [v4 cplConfiguration];

  id v6 = [v5 valueForKey:@"feature.version.sharedlibrarytrashnotificationassetthreshold"];
  if (v6)
  {
    id v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      unint64_t v11 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "PostParticipantAssetTrashNotification: Custom immediateNotificationAssetThresholdPreflight set: %@", (uint8_t *)&v10, 0xCu);
    }

    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v8 = 50;
  }

  return v8;
}

+ (BOOL)libraryScopeIsActiveWithScopeSyncingState:(signed __int16)a3
{
  return (unsigned __int16)a3 - 1 < 2;
}

+ (void)updateLibraryScopeActiveDefaultsWithManagedObjectContext:(id)a3
{
  uint64_t v3 = [a1 activeLibraryScopeInManagedObjectContext:a3];
  if (([v3 isDeleted] & 1) != 0 || !objc_msgSend(v3, "libraryScopeIsActive"))
  {
    CFPreferencesSetAppValue(@"PhotosSharedLibrarySyncingIsActive", 0, @"com.apple.mobileslideshow");
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    id v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v7 = 0;
      id v5 = "Removing PhotosSharedLibrarySyncingIsActive user default";
      id v6 = (uint8_t *)&v7;
      goto LABEL_7;
    }
  }
  else
  {
    CFPreferencesSetAppValue(@"PhotosSharedLibrarySyncingIsActive", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.mobileslideshow");
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    id v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = 0;
      id v5 = "Writing PhotosSharedLibrarySyncingIsActive user default";
      id v6 = (uint8_t *)&v8;
LABEL_7:
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
}

+ (id)entityName
{
  return @"LibraryScope";
}

+ (id)scopeIdentifierPrefix
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [a1 localOnlySharedSyncScopeIdentifierPrefix];
  }
  else
  {
    uint64_t v3 = @"SharedSync-";
  }
  return v3;
}

+ (id)localOnlySharedSyncScopeIdentifierPrefix
{
  return @"LocalOnlySharedSync-";
}

+ (signed)participationStateFromLibraryScope:(id)a3
{
  return a3 != 0;
}

+ (BOOL)libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 localOnlySharedSyncScopeIdentifierPrefix];
  char v6 = [v4 hasPrefix:v5];

  return v6;
}

+ (signed)activeSyncingStateToUse
{
  if (_os_feature_enabled_impl()) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)activeLibraryScopeInManagedObjectContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = NSNumber;
  id v6 = a3;
  __int16 v7 = objc_msgSend(v5, "numberWithShort:", objc_msgSend((id)objc_opt_class(), "activeSyncingStateToUse"));
  __int16 v8 = [v4 predicateWithFormat:@"%K == %@", @"scopeSyncingState", v7];

  uint64_t v9 = [a1 sharesWithPredicate:v8 fetchLimit:1 inManagedObjectContext:v6];

  int v10 = [v9 firstObject];

  return v10;
}

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 unitTestMode:(BOOL)a6 inPhotoLibrary:(id)a7
{
  BOOL v7 = a6;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PLLibraryScope;
  id v11 = a7;
  uint64_t v12 = objc_msgSendSuper2(&v14, sel_createOwnedShareWithUUID_creationDate_title_inPhotoLibrary_, a3, a4, a5, v11);
  objc_msgSend(v12, "setScopeType:", 4, v14.receiver, v14.super_class);
  [v12 setPublicPermission:1];
  [v12 _insertOwnedParticipantInLibrary:v11 unitTestMode:v7];

  return v12;
}

+ (id)_libraryForEnumerationFromBundle:(id)a3 withName:(const char *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v6 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v6 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v6 setAutomaticallyPinToFirstFetch:0];
  id v11 = 0;
  id v7 = +[PLPhotoLibrary newPhotoLibraryWithName:a4 loadedFromBundle:v5 options:v6 error:&v11];

  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error creating context for library enumeration: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (BOOL)removePeopleRulesForPersonUUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLLibraryScope *)self autoSharePolicy] >= 2)
  {
    id v6 = [(PLLibraryScope *)self rulesData];
    id v7 = +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:v6];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    BOOL v5 = v9 != 0;
    int v10 = v8;
    if (v9)
    {
      uint64_t v11 = v9;
      int v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          double v16 = (void *)MEMORY[0x19F38D3B0](v9);
          BOOL v17 = objc_msgSend(v15, "personCondition", (void)v20);
          v12 |= [v17 removePersonUUID:v4];

          ++v14;
        }
        while (v11 != v14);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
        uint64_t v11 = v9;
      }
      while (v9);

      if ((v12 & 1) == 0)
      {
        BOOL v5 = 0;
        goto LABEL_16;
      }
      uint64_t v18 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v25 = v4;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "LibraryScope custom rules updated: person %{public}@ removed", buf, 0xCu);
      }

      int v10 = +[PLLibraryScopeRule dataForLibraryScopeRules:v8];
      [(PLLibraryScope *)self setRulesData:v10];
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v5 = 0;
LABEL_17:

  return v5;
}

- (BOOL)updatePeopleRulesForAllTombstonedPersons
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(PLLibraryScope *)self autoSharePolicy] >= 2)
  {
    id v4 = [(PLLibraryScope *)self rulesData];
    BOOL v5 = +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:v4];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v5;
    uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    int v3 = 0;
    if (v26)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
          id v8 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v9 = [v7 personCondition];
          int v10 = [v9 personUUIDs];

          if ([v10 count])
          {
            uint64_t v28 = v8;
            uint64_t v29 = v6;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v27 = v10;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v31;
              do
              {
                uint64_t v15 = 0;
                do
                {
                  if (*(void *)v31 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
                  BOOL v17 = [(PLManagedObject *)self photoLibrary];
                  uint64_t v18 = [v17 managedObjectContext];
                  uint64_t v19 = +[PLPerson personWithUUID:v16 inManagedObjectContext:v18];

                  if ([v19 verifiedType] == -2)
                  {
                    long long v20 = [v19 finalMergeTargetPerson];
                    if (v20)
                    {
                      long long v21 = [v19 personUUID];
                      long long v22 = [v20 personUUID];
                      v3 |= [(PLLibraryScope *)self updatePeopleRulesForTombstonePersonUUID:v21 replaceWithPersonUUID:v22];
                    }
                  }

                  ++v15;
                }
                while (v13 != v15);
                uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v13);
            }

            id v8 = v28;
            uint64_t v6 = v29;
            int v10 = v27;
          }

          ++v6;
        }
        while (v6 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v26);
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (BOOL)updatePeopleRulesForTombstonePersonUUID:(id)a3 replaceWithPersonUUID:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PLLibraryScope *)self autoSharePolicy] >= 2)
  {
    uint64_t v9 = [(PLLibraryScope *)self rulesData];
    int v10 = +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:v9];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    BOOL v8 = v12 != 0;
    uint64_t v13 = v11;
    if (v12)
    {
      uint64_t v14 = v12;
      BOOL v23 = v12 != 0;
      int v15 = 0;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x19F38D3B0]();
          long long v20 = [v18 personCondition];
          v15 |= [v20 replaceTombstonePersonUUID:v6 withPersonUUID:v7];
        }
        uint64_t v14 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v14);

      if ((v15 & 1) == 0)
      {
        BOOL v8 = 0;
        goto LABEL_16;
      }
      long long v21 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "LibraryScope custom rules updated: tombstone person %{public}@ replaced with %{public}@", buf, 0x16u);
      }

      uint64_t v13 = +[PLLibraryScopeRule dataForLibraryScopeRules:v11];
      [(PLLibraryScope *)self setRulesData:v13];
      BOOL v8 = v23;
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (id)cloudSyncableRulesData
{
  int v3 = [(PLLibraryScope *)self autoSharePolicy];
  if (v3 == 2)
  {
    BOOL v5 = [(PLLibraryScope *)self rulesData];
  }
  else if (v3 == 1)
  {
    id v4 = +[PLLibraryScope _shareEverythingInternalQuery];
    BOOL v5 = +[PLQueryHandler dataFromQuery:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)updateRulesDataWithCloudSyncableRulesData:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    BOOL v5 = +[PLQueryHandler constructQueryFromData:v4];
    if (v5)
    {
      if (+[PLLibraryScope _queryIsShareEverythingInternalQuery:v5])
      {
        [(PLLibraryScope *)self setAutoSharePolicy:1];
        id v6 = self;
        id v7 = 0;
      }
      else
      {
        [(PLLibraryScope *)self setAutoSharePolicy:2];
        id v6 = self;
        id v7 = v8;
      }
      [(PLLibraryScope *)v6 setRulesData:v7];
    }
  }
  else
  {
    [(PLLibraryScope *)self setAutoSharePolicy:0];
    [(PLLibraryScope *)self setRulesData:0];
  }
}

- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)&self->super.super._willSaveCallCount + 3) = 1;
  id v6 = [(PLLibraryScope *)self managedObjectContext];
  id v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Preparing assets for library scope deletion...", buf, 2u);
  }

  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = +[PLManagedAsset entityName];
  int v10 = [v8 fetchRequestWithEntityName:v9];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"libraryScope", self];
  [v10 setPredicate:v11];

  *(void *)long long buf = 0;
  long long v27 = buf;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v12 = [PLEnumerateAndSaveController alloc];
  uint64_t v13 = NSStringFromSelector(a2);
  uint64_t v14 = [v6 pathManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke;
  v24[3] = &unk_1E586FB88;
  id v15 = v6;
  id v25 = v15;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke_2;
  v23[3] = &unk_1E5864148;
  v23[4] = buf;
  uint64_t v16 = [(PLEnumerateAndSaveController *)v12 initWithName:v13 fetchRequest:v10 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v24 didFetchObjectIDsBlock:0 processResultsBlock:v23];

  id v22 = 0;
  LOBYTE(v12) = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&v22];
  id v17 = v22;
  if ((v12 & 1) == 0)
  {
    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v30 = 138412290;
      id v31 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to prepare assets for share deletion: %@", v30, 0xCu);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PLLibraryScope;
  BOOL v19 = [(PLShare *)&v21 incrementallyDeleteAndSaveWithError:a3];

  _Block_object_dispose(buf, 8);
  return v19;
}

id __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __54__PLLibraryScope_incrementallyDeleteAndSaveWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 removeLibraryScopeAndContributors];
        [v9 setLibraryScopeShareState:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 count];
}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(unsigned __int16)a6 completionHandler:(id)a7
{
  int v8 = a6;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(PLManagedObject *)self photoLibrary];
  BOOL v16 = [(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode];
  if (v16 || [v15 isUnitTesting])
  {
    id v17 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(PLLibraryScope *)self debugDescription];
      BOOL v19 = "for unit testing";
      *(_DWORD *)long long buf = 138412802;
      id v51 = v18;
      v53 = "-[PLLibraryScope removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitS"
            "ource:completionHandler:]";
      __int16 v52 = 2080;
      if (v16) {
        BOOL v19 = "in local only mode";
      }
      __int16 v54 = 2080;
      uint64_t v55 = (uint64_t)v19;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created %s", buf, 0x20u);
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    void v45[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
    v45[3] = &unk_1E5875E18;
    id v46 = v12;
    char v47 = self;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
    v43[3] = &unk_1E5875198;
    id v44 = v14;
    [v15 performTransaction:v45 completionHandler:v43];

    long long v20 = v46;
  }
  else
  {
    long long v20 = [(PLShare *)self compactDescription];
    objc_super v21 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = 0;
      if (v8 > 2)
      {
        if (v8 == 3)
        {
          uint64_t v22 = 3;
        }
        else if (v8 == 1000)
        {
          uint64_t v22 = 1000;
        }
      }
      else if (v8 == 1)
      {
        uint64_t v22 = 1;
      }
      else if (v8 == 2)
      {
        uint64_t v22 = 2;
      }
      *(_DWORD *)long long buf = 138544130;
      id v51 = v12;
      __int16 v52 = 2048;
      v53 = (const char *)a5;
      __int16 v54 = 2048;
      uint64_t v55 = v22;
      __int16 v56 = 2114;
      uint64_t v57 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "RemoveParticipants: Removing participants with UUIDs %{public}@ using retentionPolicy: %ld, exitSource: %ld for library scope %{public}@", buf, 0x2Au);
    }
    id v35 = v13;

    BOOL v23 = [(PLManagedObject *)self photoLibrary];
    long long v24 = [v23 libraryServicesManager];
    id v25 = [v24 cloudPhotoLibraryManager];

    if (v25)
    {
      uint64_t v26 = 3;
      uint64_t v27 = 1000;
      if (v8 != 1000) {
        uint64_t v27 = 0;
      }
      if (v8 != 3) {
        uint64_t v26 = v27;
      }
      uint64_t v28 = 1;
      uint64_t v29 = 2;
      if (v8 != 2) {
        uint64_t v29 = 0;
      }
      if (v8 != 1) {
        uint64_t v28 = v29;
      }
      if (v8 <= 2) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = v26;
      }
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_294;
      v36[3] = &unk_1E5864100;
      id v37 = v12;
      id v38 = v20;
      id v42 = v14;
      id v39 = v25;
      id v40 = v15;
      uint64_t v41 = self;
      [v39 removeParticipantsWithParticipantUUIDs:v37 fromLibraryScopeWithIdentifier:v35 retentionPolicy:a5 exitSource:v30 completionHandler:v36];

      id v31 = v37;
    }
    else
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      uint64_t v33 = [NSString stringWithFormat:@"no CPLManager"];
      int v49 = v33;
      long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v31 = [v32 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v34];

      (*((void (**)(id, void *))v14 + 2))(v14, v31);
    }

    id v13 = v35;
  }
}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) photoLibrary];
  id v4 = +[PLShareParticipant participantsWithUUIDs:v2 inPhotoLibrary:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        long long v11 = objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", (void)v12);
        [v11 deleteObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

uint64_t __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v9;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "RemoveParticipants: Failed to remove participants with UUIDs %@ for library scope %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v10 = PLBackendSharingGetLog();
    long long v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v31 = v12;
        __int16 v32 = 2112;
        uint64_t v33 = v13;
        __int16 v34 = 2112;
        id v35 = v5;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "RemoveParticipants: Successfully removed participants with UUIDs %@ for library scope %@, updated scope change: %@", buf, 0x20u);
      }

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_295;
      v24[3] = &unk_1E5874818;
      long long v14 = *(void **)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      id v25 = v15;
      uint64_t v26 = v16;
      id v27 = v5;
      id v17 = *(id *)(a1 + 72);
      id v28 = 0;
      id v29 = v17;
      [v14 performTransactionOnLibraryScopeSynchronizationQueue:v24];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v31 = v18;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "RemoveParticipants: Received nil CPLLibraryShareScopeChange back from CPLLibraryManager for library scope %@", buf, 0xCu);
      }

      uint64_t v19 = *(void *)(a1 + 72);
      long long v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      objc_super v21 = [NSString stringWithFormat:@"Received nil CPLLibraryShareScopeChange back from CPLLibraryManager"];
      v37[0] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      BOOL v23 = [v20 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v22];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v23);
    }
  }
}

void __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_295(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2_296;
  v7[3] = &unk_1E5873A50;
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v4[3] = &unk_1E58742F0;
  id v6 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 56);
  [v2 performTransactionAndWait:v7 completionHandler:v4];
}

id __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2_296(uint64_t a1)
{
  return (id)[(id)objc_opt_class() insertOrUpdateShareWithCPLScopeChange:*(void *)(a1 + 40) inPhotoLibrary:*(void *)(a1 + 48)];
}

uint64_t __133__PLLibraryScope_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startExitWithRetentionPolicy:(int64_t)a3 exitSource:(unsigned __int16)a4 completionHandler:(id)a5
{
  int v5 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(PLShare *)self compactDescription];
  uint64_t v10 = [(PLManagedObject *)self photoLibrary];
  if (![(PLLibraryScope *)self libraryScopeIsActive])
  {
    qos_class_t v14 = qos_class_self();
    id v15 = dispatch_get_global_queue(v14, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke;
    block[3] = &unk_1E58742F0;
    id v50 = v9;
    id v51 = v8;
    dispatch_async(v15, block);

    uint64_t v13 = v50;
LABEL_7:

    goto LABEL_8;
  }
  if ([v10 isUnitTesting])
  {
    long long v11 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(PLLibraryScope *)self debugDescription];
      *(_DWORD *)long long buf = 138412546;
      int64_t v55 = (int64_t)v12;
      __int16 v56 = 2080;
      uint64_t v57 = "-[PLLibraryScope startExitWithRetentionPolicy:exitSource:completionHandler:]";
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created for unit testing", buf, 0x16u);
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_282;
    v48[3] = &unk_1E5875CE0;
    v48[4] = self;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2;
    v46[3] = &unk_1E5875198;
    id v47 = v8;
    [v10 performTransaction:v48 completionHandler:v46];
    uint64_t v13 = v47;
    goto LABEL_7;
  }
  BOOL v16 = [(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode];
  id v17 = PLBackendSharingGetLog();
  uint64_t v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(PLLibraryScope *)self debugDescription];
      *(_DWORD *)long long buf = 138412546;
      int64_t v55 = (int64_t)v19;
      __int16 v56 = 2080;
      uint64_t v57 = "-[PLLibraryScope startExitWithRetentionPolicy:exitSource:completionHandler:]";
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);
    }
    id v45 = 0;
    [(PLLibraryScope *)self incrementallyDeleteAndSaveWithError:&v45];
    long long v20 = (char *)v45;
    if (v20)
    {
      objc_super v21 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        int64_t v55 = (int64_t)v9;
        __int16 v56 = 2112;
        uint64_t v57 = v20;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "StartExit: Failed to start exit for local only mode library scope %@, %@", buf, 0x16u);
      }
    }
    qos_class_t v22 = qos_class_self();
    BOOL v23 = dispatch_get_global_queue(v22, 0);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_283;
    v43[3] = &unk_1E5875198;
    id v44 = v8;
    dispatch_async(v23, v43);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = 0;
      if (v5 > 2)
      {
        if (v5 == 3)
        {
          uint64_t v24 = 3;
        }
        else if (v5 == 1000)
        {
          uint64_t v24 = 1000;
        }
      }
      else if (v5 == 1)
      {
        uint64_t v24 = 1;
      }
      else if (v5 == 2)
      {
        uint64_t v24 = 2;
      }
      *(_DWORD *)long long buf = 134218498;
      int64_t v55 = a3;
      __int16 v56 = 2048;
      uint64_t v57 = (const char *)v24;
      __int16 v58 = 2114;
      v59 = v9;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "StartExit: Starting exit using retentionPolicy: %ld, exitSource: %ld for library scope %{public}@", buf, 0x20u);
    }

    id v25 = [v10 libraryServicesManager];
    uint64_t v26 = [v25 cloudPhotoLibraryManager];

    if (v26)
    {
      id v27 = [(PLLibraryScope *)self scopeIdentifier];
      uint64_t v28 = 3;
      uint64_t v29 = 1000;
      if (v5 != 1000) {
        uint64_t v29 = 0;
      }
      if (v5 != 3) {
        uint64_t v28 = v29;
      }
      uint64_t v30 = 1;
      uint64_t v31 = 2;
      if (v5 != 2) {
        uint64_t v31 = 0;
      }
      if (v5 != 1) {
        uint64_t v30 = v31;
      }
      if (v5 <= 2) {
        uint64_t v32 = v30;
      }
      else {
        uint64_t v32 = v28;
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      void v37[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_284;
      v37[3] = &unk_1E58640D8;
      id v38 = v9;
      id v42 = v8;
      id v39 = v26;
      id v40 = v10;
      uint64_t v41 = self;
      [v39 startExitFromLibraryScopeWithIdentifier:v27 retentionPolicy:a3 exitSource:v32 completionHandler:v37];

      uint64_t v33 = v38;
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      id v35 = [NSString stringWithFormat:@"no CPLManager"];
      v53 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      uint64_t v33 = [v34 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v36];

      (*((void (**)(id, void *))v8 + 2))(v8, v33);
    }
  }
LABEL_8:
}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  int v3 = [NSString stringWithFormat:@"Unable to start exit on a LibraryScope that's not actively syncing"];
  v11[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v5 = [v2 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v4];

  id v6 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "StartExit: Unable to start exit on a LibraryScope that's not actively syncing %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_282(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExitState:2];
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_283(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v30 = v8;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "StartExit: Failed to start exit for library scope %@, %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v9 = PLBackendSharingGetLog();
    uint64_t v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F598A8], "descriptionForExitState:", objc_msgSend(v5, "exitState"));
        *(_DWORD *)long long buf = 138412802;
        uint64_t v30 = v11;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        __int16 v34 = v12;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "StartExit: Successfully started exit for library scope %@, updated scope change: %@, updated exit state: %@", buf, 0x20u);
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_288;
      v23[3] = &unk_1E5874818;
      uint64_t v13 = *(void **)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      id v24 = v14;
      uint64_t v25 = v15;
      id v26 = v5;
      id v16 = *(id *)(a1 + 64);
      id v27 = 0;
      id v28 = v16;
      [v13 performTransactionOnLibraryScopeSynchronizationQueue:v23];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v17;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "StartExit: Received nil CPLLibraryShareScopeChange back from CPLLibraryManager for library scope %@", buf, 0xCu);
      }

      uint64_t v18 = *(void *)(a1 + 64);
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      long long v20 = [NSString stringWithFormat:@"Received nil CPLLibraryShareScopeChange back from CPLLibraryManager"];
      v36[0] = v20;
      objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      qos_class_t v22 = [v19 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v21];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);
    }
  }
}

void __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_288(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2_289;
  v7[3] = &unk_1E5873A50;
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_3;
  v4[3] = &unk_1E58742F0;
  id v6 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 56);
  [v2 performTransactionAndWait:v7 completionHandler:v4];
}

id __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_2_289(uint64_t a1)
{
  return (id)[(id)objc_opt_class() insertOrUpdateShareWithCPLScopeChange:*(void *)(a1 + 40) inPhotoLibrary:*(void *)(a1 + 48)];
}

uint64_t __76__PLLibraryScope_startExitWithRetentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 databaseContext:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v11 = (void *)[v10 newShortLivedLibraryWithName:"-[PLLibraryScope confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke;
  v15[3] = &unk_1E5874728;
  id v12 = v11;
  uint64_t v19 = &v22;
  long long v20 = a5;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  uint64_t v18 = self;
  SEL v21 = a2;
  [v12 performTransactionAndWait:v15];
  LOBYTE(a2) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)a2;
}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke(uint64_t a1)
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  int v3 = +[PLManagedAsset entityName];
  id v4 = (void *)[v2 initWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 1);
  id v6 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders"), 1);
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v48[0] = v6;
  v48[1] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  __int16 v31 = [v7 andPredicateWithSubpredicates:v8];

  [v4 setPredicate:v31];
  [v4 setFetchBatchSize:100];
  id v9 = [*(id *)(a1 + 32) managedObjectContext];
  id v42 = 0;
  uint64_t v10 = [v9 countForFetchRequest:v4 error:&v42];
  id v11 = v42;

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ConfirmAllRemainingOnboardingPreviewAssets: Count fetch failed: %@", (uint8_t *)&buf, 0xCu);
    }

    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"count fetch failed: %@", v11];
    id v47 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v16 = [v13 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v15];

    id v17 = *(void **)(a1 + 64);
    if (v17) {
      *id v17 = v16;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    [*(id *)(a1 + 40) setTotalUnitCount:v10];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [*(id *)(a1 + 48) photoLibrary];
    long long v20 = [v19 libraryBundle];
    SEL v21 = [v18 _libraryForEnumerationFromBundle:v20 withName:"-[PLLibraryScope confirmAllRemainingOnboardingPreviewAssetsWithProgress:databaseContext:withError:]_block_invoke"];

    uint64_t v22 = [v21 managedObjectContext];
    [v22 setNonCoalescing:1];
    uint64_t v30 = [PLEnumerateAndSaveController alloc];
    BOOL v23 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v24 = [v22 pathManager];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_2;
    void v40[3] = &unk_1E586FB88;
    id v25 = v22;
    id v41 = v25;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_3;
    v37[3] = &unk_1E5868628;
    p_long long buf = &buf;
    id v38 = *(id *)(a1 + 40);
    id v26 = [(PLEnumerateAndSaveController *)v30 initWithName:v23 fetchRequest:v4 context:v25 pathManager:v24 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v40 didFetchObjectIDsBlock:0 processResultsBlock:v37];

    id v27 = +[PLConcurrencyLimiter sharedLimiter];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_4;
    v32[3] = &unk_1E5873E60;
    uint64_t v34 = *(void *)(a1 + 56);
    id v28 = v26;
    __int16 v33 = v28;
    uint64_t v35 = &buf;
    uint64_t v36 = *(void *)(a1 + 64);
    uint64_t v29 = [v25 photoLibrary];
    [v27 sync:v32 identifyingBlock:0 library:v29];

    _Block_object_dispose(&buf, 8);
  }
}

id __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v11 libraryScopeShareState] & 0x1F) == 1
          || ([v11 libraryScopeShareState] & 0x200000) != 0)
        {
          PLLibraryScopeAssetSetAddToSharedZoneState(1, v11);
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  if ([*(id *)(a1 + 32) isCancelled]) {
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v6, "count") + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
}

void __99__PLLibraryScope_confirmAllRemainingOnboardingPreviewAssetsWithProgress_databaseContext_withError___block_invoke_4(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  id v10 = 0;
  char v3 = [v2 processObjectsWithError:&v10];
  id v4 = v10;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3;
  int v5 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
  id v6 = PLBackendSharingGetLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(*(void *)(a1[6] + 8) + 24);
      *(_DWORD *)long long buf = 134217984;
      id v12 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "ConfirmAllRemainingOnboardingPreviewAssets: Successfully confirmed %lu remaining onboarding preview assets", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "ConfirmAllRemainingOnboardingPreviewAssets: Failed to confirm remaining onboarding preview assets %@", buf, 0xCu);
    }

    uint64_t v9 = (void *)a1[7];
    if (v9) {
      *uint64_t v9 = v4;
    }
  }
}

- (void)_confirmAllRemainingOnboardingPreviewAssetsWithProgress:(id)a3 photoLibrary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 libraryServicesManager];
  uint64_t v8 = [v7 databaseContext];
  id v17 = 0;
  BOOL v9 = [(PLLibraryScope *)self confirmAllRemainingOnboardingPreviewAssetsWithProgress:v6 databaseContext:v8 withError:&v17];

  id v10 = v17;
  id v11 = PLBackendSharingGetLog();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v13 = "Successfully confirmed remaining onboarding preview assets";
      long long v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 2;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v10;
    uint64_t v13 = "Failed to confirm remaining onboarding preview assets %@";
    long long v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 12;
    goto LABEL_6;
  }
}

- (id)markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:(id)a3 completionHandler:(id)a4
{
  v121[1] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  v83 = (void (**)(id, void *))a4;
  v82 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:0 userInfo:0];
  if ([(PLLibraryScope *)self autoSharePolicy] != 1)
  {
    BOOL v23 = [(PLLibraryScope *)self rulesData];

    if (v23)
    {
      uint64_t v24 = [(PLLibraryScope *)self rulesData];
      id v25 = +[PLQueryHandler constructQueryFromData:v24];

      if (v25)
      {
        id v26 = [(PLLibraryScope *)self rulesData];
        id v27 = +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:v26];

        BOOL v28 = [v27 count] == 0;
        uint64_t v29 = PLBackendSharingGetLog();
        uint64_t v30 = v29;
        if (v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: rule object generated from rulesData is nil", (uint8_t *)&buf, 2u);
          }

          v68 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v116 = *MEMORY[0x1E4F28568];
          uint64_t v69 = [NSString stringWithFormat:@"rule object generated from query is nil"];
          v117 = v69;
          int v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
          uint64_t v71 = [v68 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v70];
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v27;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Rule object being used for marking onboarding preview: %@", (uint8_t *)&buf, 0xCu);
          }

          if ([v81 count])
          {
            __int16 v31 = PLBackendSharingGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v81;
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Exclude people for marking onboarding preview: %@", (uint8_t *)&buf, 0xCu);
            }

            id v32 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A8]) initWithConjunction:0];
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id v33 = v81;
            uint64_t v34 = [v33 countByEnumeratingWithState:&v103 objects:v115 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v104;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v104 != v35) {
                    objc_enumerationMutation(v33);
                  }
                  [v32 addPersonUUIDQuery:*(void *)(*((void *)&v103 + 1) + 8 * i) comparator:22];
                }
                uint64_t v34 = [v33 countByEnumeratingWithState:&v103 objects:v115 count:16];
              }
              while (v34);
            }

            id v37 = (void *)MEMORY[0x1E4F8B9A8];
            id v38 = [v32 query];
            id v39 = [v37 notQuery:v38];

            uint64_t v40 = [MEMORY[0x1E4F8B9A8] andCombineFirstQuery:v25 secondQuery:v39];

            id v25 = (void *)v40;
          }
          id v41 = [(PLManagedObject *)self photoLibrary];
          id v42 = objc_opt_new();
          uint64_t v80 = +[PLQueryHandler predicateForQuery:v25 inLibrary:v41 changeDetectionCriteria:v42];

          if (v80)
          {

            goto LABEL_3;
          }
          v72 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: predicate generated from query is nil", (uint8_t *)&buf, 2u);
          }

          __int16 v73 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v113 = *MEMORY[0x1E4F28568];
          uint64_t v69 = [NSString stringWithFormat:@"predicate generated from rule object is nil"];
          v114 = v69;
          int v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
          uint64_t v71 = [v73 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v70];
        }
        v74 = (void *)v71;

        v83[2](v83, v74);
      }
      else
      {
        v64 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19B3C7000, v64, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: query generated from rulesData is nil", (uint8_t *)&buf, 2u);
        }

        uint64_t v65 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v118 = *MEMORY[0x1E4F28568];
        int v66 = [NSString stringWithFormat:@"query generated from rulesData is nil"];
        v119 = v66;
        uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        id v25 = [v65 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v67];

        v83[2](v83, v25);
      }
    }
    else
    {
      uint64_t v60 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: rulesData is not set on LibraryScope", (uint8_t *)&buf, 2u);
      }

      id v61 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v120 = *MEMORY[0x1E4F28568];
      v62 = [NSString stringWithFormat:@"rulesData is not set on LibraryScope"];
      v121[0] = v62;
      uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:&v120 count:1];
      id v25 = [v61 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v63];

      v83[2](v83, v25);
    }
    id v22 = 0;
    goto LABEL_46;
  }
  uint64_t v80 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
LABEL_3:
  id v7 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v8 = +[PLManagedAsset entityName];
  BOOL v9 = (void *)[v7 initWithEntityName:v8];

  id v10 = [(id)objc_opt_class() compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:v80];
  [v9 setPredicate:v10];

  [v9 setFetchBatchSize:100];
  v112[0] = @"additionalAttributes";
  v112[1] = @"libraryScope";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  id v12 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v9 predicate];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Predicate being used for marking onboarding preview assets: %@", (uint8_t *)&buf, 0xCu);
  }
  long long v14 = [(PLManagedObject *)self photoLibrary];
  os_log_type_t v15 = [v14 managedObjectContext];
  id v102 = 0;
  uint64_t v16 = [v15 countForFetchRequest:v9 error:&v102];
  id v79 = v102;

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v79;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Count fetch failed: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v110 = *MEMORY[0x1E4F28568];
    id v19 = [NSString stringWithFormat:@"count fetch failed: %@", v79];
    v111 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    SEL v21 = [v18 errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:41003 userInfo:v20];

    v83[2](v83, v21);
    id v22 = 0;
  }
  else
  {
    [v82 setTotalUnitCount:v16];
    __int16 v43 = objc_opt_class();
    uint64_t v44 = [(PLManagedObject *)self photoLibrary];
    uint64_t v45 = [v44 libraryBundle];
    SEL v21 = [v43 _libraryForEnumerationFromBundle:v45 withName:"-[PLLibraryScope markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs:completionHandler:]"];

    uint64_t v46 = [v21 managedObjectContext];
    [v46 setChangeSource:1];

    if (v21)
    {
      id v47 = [v21 managedObjectContext];
      v77 = [(PLLibraryScope *)self objectID];
      uint64_t v48 = [(PLShare *)self currentUserParticipant];
      int v49 = [v48 objectID];

      objc_initWeak(&location, self);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v108 = 0x2020000000;
      uint64_t v109 = 0;
      id v50 = [PLEnumerateAndSaveController alloc];
      id v51 = NSStringFromSelector(a2);
      uint64_t v52 = [v47 pathManager];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke;
      v99[3] = &unk_1E586FB88;
      id v53 = v47;
      id v100 = v53;
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_2;
      v93[3] = &unk_1E58640B0;
      objc_copyWeak(&v98, &location);
      id v76 = v77;
      id v94 = v76;
      id v78 = v49;
      id v95 = v78;
      p_long long buf = &buf;
      id v54 = v82;
      id v96 = v54;
      int64_t v55 = [(PLEnumerateAndSaveController *)v50 initWithName:v51 fetchRequest:v9 context:v53 pathManager:v52 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v99 didFetchObjectIDsBlock:0 processResultsBlock:v93];

      v91[0] = 0;
      v91[1] = v91;
      v91[2] = 0x2020000000;
      char v92 = 0;
      __int16 v56 = +[PLConcurrencyLimiter sharedLimiter];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_274;
      v84[3] = &unk_1E5870370;
      v89 = v91;
      uint64_t v57 = v55;
      v85 = v57;
      id v58 = v54;
      id v86 = v58;
      v90 = &buf;
      v87 = self;
      v88 = v83;
      v59 = [v53 photoLibrary];
      [v56 async:v84 identifyingBlock:0 library:v59];

      id v22 = v58;
      _Block_object_dispose(v91, 8);

      objc_destroyWeak(&v98);
      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);
    }
    else
    {
      id v53 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:45001 userInfo:0];
      v83[2](v83, v53);
      id v22 = 0;
    }
  }
  id v25 = (void *)v80;
LABEL_46:

  return v22;
}

id __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v34 = 0;
    id v11 = [v7 existingObjectWithID:v10 error:&v34];
    id v12 = v34;
    uint64_t v13 = *(void *)(a1 + 40);
    id v33 = v12;
    long long v14 = [v7 existingObjectWithID:v13 error:&v33];
    id v15 = v33;

    if (v14 && v11)
    {
      id v25 = v15;
      id v26 = a4;
      id v27 = WeakRetained;
      id v28 = v8;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v8;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            SEL v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
            [v21 setLibraryScope:v11 withContributors:v22];

            [v21 setLibraryScopeShareState:0];
            id v23 = v21;
            objc_msgSend(v23, "setLibraryScopeShareState:", objc_msgSend(v23, "libraryScopeShareState") | 1);

            ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v18);
      }

      id v8 = v28;
      a4 = v26;
      id WeakRetained = v27;
      id v15 = v25;
    }
    else
    {
      uint64_t v24 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v36 = v15;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Failed to load current user/scope: %@", buf, 0xCu);
      }

      *a4 = 1;
    }
    if ([*(id *)(a1 + 48) isCancelled]) {
      *a4 = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(v8, "count") + objc_msgSend(*(id *)(a1 + 48), "completedUnitCount"));
}

void __103__PLLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithExcludePersonUUIDs_completionHandler___block_invoke_274(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v18 = 0;
  char v3 = [v2 processObjectsWithError:&v18];
  id v4 = v18;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    id v16 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)long long buf = 134217984;
      id v22 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "MarkOnboardingPreviewAssets: Successfully set %lu assets as onboarding preview assets", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (![*(id *)(a1 + 40) isCancelled])
  {
    id v16 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "MarkOnboardingPreviewAssets: Failed to set onboarding preview assets %@", buf, 0xCu);
    }
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_13;
  }
  int v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F8C500];
  uint64_t v19 = *MEMORY[0x1E4F28568];
  id v7 = NSString;
  id v8 = [*(id *)(a1 + 40) localizedDescription];
  BOOL v9 = [v7 stringWithFormat:@"MarkOnboardingPreviewAssets: Cancelled! Going to reset all asset states... progress: %@", v8];
  uint64_t v20 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v11 = [v5 errorWithDomain:v6 code:41031 userInfo:v10];

  id v12 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v22 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v13 = [*(id *)(a1 + 48) photoLibrary];
  long long v14 = [v13 managedObjectContext];
  id v15 = +[PLLibraryScope resetLibraryScopeAssetStatesWithManagedObjectContext:v14];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_13:
}

- (void)deactivateScopeWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PLManagedObject *)self photoLibrary];
  if ([(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode])
  {
    uint64_t v6 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PLLibraryScope *)self debugDescription];
      *(_DWORD *)long long buf = 138412546;
      long long v29 = v7;
      __int16 v30 = 2080;
      long long v31 = "-[PLLibraryScope deactivateScopeWithCompletionHandler:]";
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke;
    v25[3] = &unk_1E5875CE0;
    v25[4] = self;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E58742F0;
    void v23[4] = self;
    id v24 = v4;
    [v5 performTransaction:v25 completionHandler:v23];
  }
  else
  {
    id v8 = [(PLManagedObject *)self photoLibrary];
    BOOL v9 = [v8 libraryServicesManager];
    uint64_t v10 = [v9 cloudPhotoLibraryManager];

    if (v10)
    {
      [(PLLibraryScope *)self setLocalPublishState:1];
      id v11 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [(PLShare *)self compactDescription];
        *(_DWORD *)long long buf = 138412290;
        long long v29 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Deactivating library scope %@", buf, 0xCu);
      }
      uint64_t v13 = [(PLLibraryScope *)self scopeIdentifier];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_235;
      v18[3] = &unk_1E5875AB8;
      id v19 = v10;
      id v20 = v5;
      SEL v21 = self;
      id v22 = v4;
      [v19 deactivateScopeWithIdentifier:v13 completionHandler:v18];

      id v14 = v19;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F8C500];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      id v27 = @"PLCloudPhotoLibraryManager is not available";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v17 = [v15 errorWithDomain:v16 code:41004 userInfo:v14];
      (*((void (**)(id, void *))v4 + 2))(v4, v17);
    }
  }
}

uint64_t __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLocalPublishState:0];
  [*(id *)(a1 + 32) trash];
  [*(id *)(a1 + 32) setScopeSyncingState:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 stopTrackingParticipantAssetTrashedStateIfNeeded];
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  char v3 = [v2 libraryServicesManager];
  id v4 = [v3 cloudPhotoLibraryManager];

  [v4 stopLibraryScopeRulesChangeTracker];
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_235(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2_236;
  v7[3] = &unk_1E58710F0;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  int v5 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = v5;
  id v6 = v3;
  [v4 performTransactionOnLibraryScopeSynchronizationQueue:v7];
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_2_236(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E5875E18;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_237;
  v5[3] = &unk_1E58742F0;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v2 performTransaction:v8 completionHandler:v5 withPriority:1];
}

void __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 setLocalPublishState:3];
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = [*(id *)(a1 + 40) compactDescription];
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to deactivate library scope %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [v2 setLocalPublishState:0];
    [*(id *)(a1 + 40) trash];
    [*(id *)(a1 + 40) setScopeSyncingState:0];
    [*(id *)(a1 + 40) stopTrackingParticipantAssetTrashedStateIfNeeded];
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) compactDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Deactivated library scope %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t __55__PLLibraryScope_deactivateScopeWithCompletionHandler___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)activateScopeWithCompletionHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:0 userInfo:0];
  uint64_t v6 = [(PLManagedObject *)self photoLibrary];
  if ([(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode])
  {
    id v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(PLLibraryScope *)self debugDescription];
      *(_DWORD *)long long buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2080;
      id v39 = "-[PLLibraryScope activateScopeWithCompletionHandler:]";
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created in local only mode", buf, 0x16u);
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke;
    v31[3] = &unk_1E5873A50;
    v31[4] = self;
    id v9 = v5;
    id v32 = v9;
    id v33 = v6;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2;
    v29[3] = &unk_1E5875198;
    id v30 = v4;
    [v33 performTransaction:v31 completionHandler:v29];
    id v10 = v9;
  }
  else
  {
    uint64_t v11 = [(PLManagedObject *)self photoLibrary];
    uint64_t v12 = [v11 libraryServicesManager];
    uint64_t v13 = [v12 cloudPhotoLibraryManager];

    if (v13)
    {
      [(PLLibraryScope *)self setLocalPublishState:1];
      id v14 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [(PLShare *)self compactDescription];
        *(_DWORD *)long long buf = 138412290;
        id v37 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Activating library scope %@", buf, 0xCu);
      }
      uint64_t v16 = [(PLLibraryScope *)self scopeIdentifier];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_232;
      v23[3] = &unk_1E5864088;
      id v24 = v13;
      id v25 = v6;
      uint64_t v26 = self;
      id v17 = v5;
      id v27 = v17;
      id v28 = v4;
      [v24 activateScopeWithIdentifier:v16 completionHandler:v23];

      id v10 = v17;
      id v18 = v24;
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F8C500];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v35 = @"PLCloudPhotoLibraryManager is not available";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      SEL v21 = [v19 errorWithDomain:v20 code:41004 userInfo:v18];
      (*((void (**)(id, void *))v4 + 2))(v4, v21);

      id v10 = 0;
    }
  }
  return v10;
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLocalPublishState:2];
  [*(id *)(a1 + 32) untrash];
  [*(id *)(a1 + 32) setScopeSyncingState:2];
  [*(id *)(a1 + 32) setPreviewState:0];
  [*(id *)(a1 + 32) _confirmAllRemainingOnboardingPreviewAssetsWithProgress:*(void *)(a1 + 40) photoLibrary:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  return [v2 startTrackingParticipantAssetTrashStateIfNeeded];
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_232(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2_233;
  v7[3] = &unk_1E58751C0;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  int v5 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = v5;
  id v13 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 32);
  id v6 = v3;
  [v4 performTransactionOnLibraryScopeSynchronizationQueue:v7];
}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_2_233(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E5875BF8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = *(void **)(a1 + 56);
  id v11 = v3;
  uint64_t v12 = v4;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_234;
  v6[3] = &unk_1E5874868;
  id v9 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  [v2 performTransaction:v10 completionHandler:v6 withPriority:1];
}

void __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 setLocalPublishState:3];
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = [*(id *)(a1 + 40) compactDescription];
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to activate library scope %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    [v2 setLocalPublishState:2];
    [*(id *)(a1 + 40) untrash];
    [*(id *)(a1 + 40) setPreviewState:0];
    [*(id *)(a1 + 40) setScopeSyncingState:1];
    [*(id *)(a1 + 40) startTrackingParticipantAssetTrashStateIfNeeded];
    id v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 40) compactDescription];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Activated library scope %@", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 40) _confirmAllRemainingOnboardingPreviewAssetsWithProgress:*(void *)(a1 + 48) photoLibrary:*(void *)(a1 + 56)];
  }
}

uint64_t __53__PLLibraryScope_activateScopeWithCompletionHandler___block_invoke_234(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);
  return [v2 startLibraryScopeRulesChangeTracker];
}

- (void)publishWithCompletionHandler:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PLManagedObject *)self photoLibrary];
  BOOL v6 = [(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode];
  if (v6
    || ([(PLManagedObject *)self photoLibrary],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isUnitTesting],
        v7,
        v8))
  {
    int v9 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(PLLibraryScope *)self debugDescription];
      __int16 v11 = "for unit testing";
      *(_DWORD *)long long buf = 138412802;
      id v41 = v10;
      __int16 v43 = "-[PLLibraryScope publishWithCompletionHandler:]";
      __int16 v42 = 2080;
      if (v6) {
        __int16 v11 = "in local only mode";
      }
      __int16 v44 = 2080;
      uint64_t v45 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Hijacking %@ in %s since it was created %s", buf, 0x20u);
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke;
    v37[3] = &unk_1E5875CE0;
    void v37[4] = self;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2;
    v35[3] = &unk_1E58742F0;
    v35[4] = self;
    id v36 = v4;
    [v5 performTransaction:v37 completionHandler:v35];
  }
  else
  {
    uint64_t v12 = [v5 libraryServicesManager];
    uint64_t v13 = [v12 cloudPhotoLibraryManager];

    if (v13)
    {
      int v14 = [(PLLibraryScope *)self localPublishState];
      id v15 = PLBackendSharingGetLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v14 == 2)
      {
        if (v16)
        {
          id v17 = [(PLShare *)self compactDescription];
          *(_DWORD *)long long buf = 138412290;
          id v41 = v17;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Updating Library scope since it's already published %@", buf, 0xCu);
        }
        id v18 = [(PLLibraryScope *)self cplScopeChange];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_219;
        v30[3] = &unk_1E5864010;
        id v31 = v13;
        id v32 = v5;
        id v33 = self;
        id v34 = v4;
        [v31 updateLibraryScopeWithCPLScopeChange:v18 completionHandler:v30];

        id v19 = v31;
      }
      else
      {
        if (v16)
        {
          uint64_t v23 = [(PLShare *)self compactDescription];
          *(_DWORD *)long long buf = 138412290;
          id v41 = v23;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Publishing library scope %@", buf, 0xCu);
        }
        [(PLLibraryScope *)self setLocalPublishState:1];
        id v19 = [(PLLibraryScope *)self _cplShare];
        id v24 = [(PLLibraryScope *)self title];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_223;
        v25[3] = &unk_1E5864010;
        id v26 = v13;
        id v27 = v5;
        id v28 = self;
        id v29 = v4;
        [v26 publishLibraryScopeWithCPLShare:v19 title:v24 completionHandler:v25];
      }
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F8C500];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      id v39 = @"PLCloudPhotoLibraryManager is not available";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v22 = [v20 errorWithDomain:v21 code:41004 userInfo:v19];
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v22);
    }
  }
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = NSString;
  id v4 = [*(id *)(a1 + 32) scopeIdentifier];
  int v5 = [v3 stringWithFormat:@"fakeShareURL://%@", v4];
  BOOL v6 = [v2 URLWithString:v5];
  [*(id *)(a1 + 32) setShareURL:v6];

  [*(id *)(a1 + 32) setLocalPublishState:2];
  [*(id *)(a1 + 32) setParticipantCloudUpdateState:2];
  [*(id *)(a1 + 32) setScopeSyncingState:2];
  [*(id *)(a1 + 32) setPreviewState:0];
  id v7 = [*(id *)(a1 + 32) currentUserParticipant];
  if (v7)
  {
    id v12 = v7;
    [v7 setAcceptanceStatus:2];
    [v12 setRole:1];
    int v8 = NSString;
    int v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    __int16 v11 = [v8 stringWithFormat:@"_fakeUserID-%@", v10];
    [v12 setUserIdentifier:v11];

    id v7 = v12;
  }
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) shareURL];
  (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, v2, 0, 0);
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 share];
  int v8 = [v7 URL];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_220;
  v15[3] = &unk_1E5863FE8;
  int v9 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = v6;
  uint64_t v10 = *(void **)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = v7;
  id v21 = v5;
  id v22 = v10;
  id v20 = v8;
  id v11 = v5;
  id v12 = v8;
  id v13 = v7;
  id v14 = v6;
  [v9 performTransactionOnLibraryScopeSynchronizationQueue:v15];
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 share];
  int v8 = [v7 URL];
  int v9 = [v5 scopeIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_224;
  v17[3] = &unk_1E586C8F0;
  uint64_t v10 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v19 = v6;
  id v11 = *(void **)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = v8;
  id v22 = v9;
  id v23 = v7;
  id v24 = v5;
  id v25 = v11;
  id v12 = v5;
  id v13 = v7;
  id v14 = v9;
  id v15 = v8;
  id v16 = v6;
  [v10 performTransactionOnLibraryScopeSynchronizationQueue:v17];
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_224(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3_225;
  v11[3] = &unk_1E5874110;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v12 = v3;
  uint64_t v13 = v4;
  id v14 = v5;
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_226;
  v6[3] = &unk_1E58710F0;
  id v10 = *(id *)(a1 + 88);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 40);
  [v2 performTransactionAndWait:v11 completionHandler:v6];
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3_225(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setLocalPublishState:3];
    id v2 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = [*(id *)(a1 + 40) compactDescription];
      uint64_t v4 = *(void *)(a1 + 32);
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Failed to publish library scope %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (!*(void *)(a1 + 48))
    {
      id v5 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [*(id *)(a1 + 40) compactDescription];
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Missing shareURL after publishing library scope %@", (uint8_t *)&v10, 0xCu);
      }
    }
    if (*(void *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "setScopeIdentifier:");
    }
    else
    {
      id v7 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [*(id *)(a1 + 40) compactDescription];
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Missing scopeIdentifier after publishing library scope %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [*(id *)(a1 + 40) updateShareWithCPLShare:*(void *)(a1 + 64) inPhotoLibrary:*(void *)(a1 + 72)];
    [*(id *)(a1 + 40) setLocalPublishState:2];
    [*(id *)(a1 + 40) setPreviewState:0];
    id v2 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 40) compactDescription];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "Published library scope %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_226(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_2_220(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E5875BF8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v12 = v3;
  uint64_t v13 = v4;
  id v14 = v5;
  id v15 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_221;
  v6[3] = &unk_1E58710F0;
  id v10 = *(id *)(a1 + 80);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  [v2 performTransactionAndWait:v11 completionHandler:v6];
}

void __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 setParticipantCloudUpdateState:3];
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) compactDescription];
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to update library scope %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [v2 updateShareWithCPLShare:*(void *)(a1 + 48) inPhotoLibrary:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) setParticipantCloudUpdateState:2];
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) compactDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "Updated library scope %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t __47__PLLibraryScope_publishWithCompletionHandler___block_invoke_221(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)acceptWithCompletionHandler:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLManagedObject *)self photoLibrary];
  char v6 = [v5 isCloudPhotoLibraryEnabled];

  if (v6)
  {
    id v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [(PLShare *)self compactDescription];
      *(_DWORD *)long long buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Accepting library scope %@", buf, 0xCu);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E58734E8;
    void v14[4] = self;
    id v15 = v4;
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryScope;
    [(PLShare *)&v13 acceptWithCompletionHandler:v14];
  }
  else if (v4)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F59778];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"iCloud Photo Library is not enabled";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:33 userInfo:v11];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

void __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) compactDescription];
      *(_DWORD *)long long buf = 138412546;
      objc_super v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to accept library scope %@: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v6 = [*(id *)(a1 + 32) photoLibrary];
    id v7 = [v6 libraryServicesManager];
    int v8 = [v7 cloudPhotoLibraryManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_202;
    v10[3] = &unk_1E58742F0;
    id v9 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 performTransactionOnLibraryScopeSynchronizationQueue:v10];
  }
}

void __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_202(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E5875CE0;
  void v5[4] = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_203;
  v3[3] = &unk_1E5875198;
  id v4 = *(id *)(a1 + 40);
  [v2 performTransaction:v5 completionHandler:v3];
}

uint64_t __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) compactDescription];
    int v7 = 138412290;
    int v8 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "Accepted library scope %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) setStatus:3];
  [*(id *)(a1 + 32) setPreviewState:0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 photoLibrary];
  [v4 _confirmAllRemainingOnboardingPreviewAssetsWithProgress:0 photoLibrary:v5];

  return [*(id *)(a1 + 32) setScopeSyncingState:1];
}

uint64_t __46__PLLibraryScope_acceptWithCompletionHandler___block_invoke_203(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_cplShare
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F59970]);
  id v4 = [(PLLibraryScope *)self shareURL];
  [v3 setURL:v4];

  objc_msgSend(v3, "setPublicPermission:", -[PLShare publicPermission](self, "publicPermission"));
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  char v6 = [(PLLibraryScope *)self participants];
  int v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v8 = [(PLLibraryScope *)self participants];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F59978]);
        id v15 = [v13 emailAddress];
        uint64_t v16 = (void *)[v14 initWithEmail:v15];

        id v17 = [v13 phoneNumber];
        [v16 setPhoneNumber:v17];

        objc_msgSend(v16, "setPermission:", objc_msgSend(v13, "permission"));
        objc_msgSend(v16, "setRole:", objc_msgSend(v13, "role"));
        uint64_t v18 = [v13 nameComponents];
        [v16 setNameComponents:v18];

        id v19 = [v13 userIdentifier];
        [v16 setUserIdentifier:v19];

        objc_msgSend(v16, "setAcceptanceStatus:", objc_msgSend(v13, "acceptanceStatus"));
        objc_msgSend(v16, "setIsCurrentUser:", objc_msgSend(v13, "isCurrentUser"));
        [v7 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  [v3 setParticipants:v7];
  return v3;
}

- (id)cplScopeChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode])
  {
    id v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PLLibraryScope *)self debugDescription];
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2080;
      id v17 = "-[PLLibraryScope cplScopeChange]";
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring %@ in %s since it was created in local only mode", (uint8_t *)&v14, 0x16u);
    }
    char v6 = 0;
  }
  else
  {
    int v7 = [(PLLibraryScope *)self scopeIdentifier];
    if (!v7)
    {
      objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PLLibraryScope.m" lineNumber:903 description:@"Missing scope identifier for libraryScope share"];
    }
    char v6 = objc_msgSend(MEMORY[0x1E4F598A8], "newScopeChangeWithScopeIdentifier:type:", v7, -[PLShare scopeType](self, "scopeType"));
    int v8 = [(PLLibraryScope *)self _cplShare];
    [v6 setShare:v8];
    objc_msgSend(v6, "setActivated:", -[PLLibraryScope scopeSyncingState](self, "scopeSyncingState") == 1);
    if ([MEMORY[0x1E4F598A8] serverSupportsLibraryShareSettingsRecordSyncing])
    {
      uint64_t v9 = [(PLLibraryScope *)self cloudSyncableRulesData];
      [v6 setUserDefinedRules:v9];
    }
    if ([MEMORY[0x1E4F598A8] serverSupportsLibraryShareSettingsUserViewedParticipantTrashNotificationDateSyncing])
    {
      uint64_t v10 = [(PLLibraryScope *)self lastParticipantAssetTrashNotificationViewedDate];
      [v6 setUserViewedParticipantTrashNotificationDate:v10];
    }
    uint64_t v11 = [(PLLibraryScope *)self title];
    [v6 setTitle:v11];
  }
  return v6;
}

- (id)scopedIdentifier
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PLLibraryScope.m", 892, @"%@ are synchronized as scope changes and don't have a scoped identifier", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)supportsCloudUpload
{
  if ([(PLLibraryScope *)self status] != 1
    || [(PLLibraryScope *)self localPublishState] != 2
    || (int v3 = [(PLLibraryScope *)self scopeSyncingState], v3 != 1))
  {
    LOBYTE(v3) = [(PLLibraryScope *)self status] == 3
              && [(PLLibraryScope *)self localPublishState] == 2
              && [(PLLibraryScope *)self scopeSyncingState] == 1;
  }
  return v3;
}

- (BOOL)isSyncableChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __34__PLLibraryScope_isSyncableChange__block_invoke;
  id v15 = &unk_1E5875CE0;
  __int16 v16 = self;
  pl_dispatch_once();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v3 = [(PLLibraryScope *)self changedValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([(id)isSyncableChange_syncedProperties containsObject:*(void *)(*((void *)&v8 + 1) + 8 * i)])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

void __34__PLLibraryScope_isSyncableChange__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"rulesData", @"localPublishState", @"lastParticipantAssetTrashNotificationViewedDate", 0);
  uint64_t v1 = (void *)isSyncableChange_syncedProperties;
  isSyncableChange_syncedProperties = v0;
}

- (void)userViewedAssetTrashNotificationWithManagedObjectContext:(id)a3
{
  id v4 = [(PLLibraryScope *)self lastParticipantAssetTrashNotificationDate];
  [(PLLibraryScope *)self setLastParticipantAssetTrashNotificationViewedDate:v4];
}

- (void)stopTrackingParticipantAssetTrashedStateIfNeeded
{
  int v3 = [(PLLibraryScope *)self lastParticipantAssetTrashNotificationDate];

  if (v3)
  {
    [(PLLibraryScope *)self setLastParticipantAssetTrashNotificationDate:0];
  }
}

- (void)startTrackingParticipantAssetTrashStateIfNeeded
{
  if (PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled())
  {
    int v3 = [(PLLibraryScope *)self lastParticipantAssetTrashNotificationDate];

    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] date];
      [(PLLibraryScope *)self setLastParticipantAssetTrashNotificationDate:v4];
    }
  }
}

- (void)_insertOwnedParticipantInLibrary:(id)a3 unitTestMode:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[PLAccountStore pl_sharedAccountStore];
  long long v8 = [v7 cachedPrimaryAppleAccount];
  BOOL v9 = [(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode];
  if (v4) {
    long long v10 = @"owner@unittest.com";
  }
  else {
    long long v10 = @"owner@localmode.com";
  }
  if (v4 || v9) {
    goto LABEL_8;
  }
  if (!v8)
  {
    PLBackendSharingGetLog();
    long long v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      long long v22 = [(PLShare *)self compactDescription];
      int v23 = 138412290;
      long long v24 = v22;
      _os_log_impl(&dword_19B3C7000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Failed to fetch account store to insert owner participant into libraryScope %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_13;
  }
  long long v10 = [v8 username];
  if (v10)
  {
LABEL_8:
    long long v11 = +[PLShareParticipant insertInPhotoLibrary:v6];
    [v11 setEmailAddress:v10];
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];
    [v11 setUuid:v13];

    [v11 setIsCurrentUser:1];
    [v11 setRole:1];
    [v11 setPermission:3];
    if ([(PLLibraryScope *)self _libraryScopeWasCreatedInLocalOnlyMode])
    {
      int v14 = objc_msgSend(v8, "aa_firstName");
      id v15 = objc_msgSend(v8, "aa_lastName");
      __int16 v16 = PLPersonNameComponentsWithFirstAndLastName();
      [v11 setNameComponents:v16];
    }
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = v11;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v19 = [v17 setWithArray:v18];
    [(PLLibraryScope *)self setParticipants:v19];

    uint64_t v20 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = [(PLShare *)self compactDescription];
      int v23 = 138412546;
      long long v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Inserted owner participant %@ into libraryScope %@", (uint8_t *)&v23, 0x16u);
    }
LABEL_13:
  }
}

- (BOOL)shouldEnableRulesChangeTracker
{
  if ([(PLLibraryScope *)self autoSharePolicy] == 1) {
    return 1;
  }
  if ([(PLLibraryScope *)self autoSharePolicy] != 2) {
    return 0;
  }
  BOOL v4 = [(PLLibraryScope *)self rulesData];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)libraryScopeIsActive
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(PLLibraryScope *)self scopeSyncingState];
  return [v3 libraryScopeIsActiveWithScopeSyncingState:v4];
}

- (void)prepareForDeletion
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PLLibraryScope;
  [(PLShare *)&v13 prepareForDeletion];
  uint64_t v4 = [(PLLibraryScope *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  if (MEMORY[0x19F38BDA0]() && PLIsAssetsd())
  {
    uint64_t v5 = [v4 mergePolicy];
    if (([v5 isResolvingConflicts] & 1) == 0)
    {
      id v6 = [(PLLibraryScope *)self uuid];

      if (!v6 || *((unsigned char *)&self->super.super._willSaveCallCount + 3)) {
        goto LABEL_8;
      }
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PLLibraryScope.m" lineNumber:567 description:@"Must call -[PLLibraryScope incrementallyDeleteAndSaveWithError:] prior to deleting a LibraryScope object."];
    }
  }
LABEL_8:
  if (PLShouldLogRegisteredEvent())
  {
    int v14 = @"PhotoSharingEnabled";
    v15[0] = MEMORY[0x1E4F1CC28];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    PLLogRegisteredEvent();
  }
  PLResetSharedLibraryAssetTrashedByParticipantsNotificationKey();
  int v7 = [(PLLibraryScope *)self participants];
  long long v8 = [v7 valueForKey:@"uuid"];

  if ([v8 count])
  {
    BOOL v9 = objc_opt_class();
    long long v10 = [v8 allObjects];
    long long v11 = [(PLManagedObject *)self photoLibrary];
    uint64_t v12 = [v11 libraryBundle];
    [v9 informRapportToRemoveShareParticipantUUIDs:v10 photoLibraryBundle:v12];
  }
LABEL_13:
}

- (void)_verifyCurrentUserParticipantExists
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([(PLLibraryScope *)self isDeleted] & 1) == 0)
  {
    if (MEMORY[0x19F38BDB0]())
    {
      BOOL v3 = [(PLShare *)self currentUserParticipant];

      if (!v3)
      {
        uint64_t v4 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Triggering tap to radar for LibraryScope with no current user", (uint8_t *)&v8, 2u);
        }

        uint64_t v5 = [NSString stringWithFormat:@"TTR: Inconsistent iCloud Shared Library participant state"];
        id v6 = [NSString stringWithFormat:@"Shared Library does not have a current user participant. This is an inconsistent state."];
        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Inconsistent iCloud Shared Library participant state detected" message:@"Your iCloud Shared Library has experienced an unexpected state, please file a Radar against Photos to help us diagnose the issue" radarTitle:v5 radarDescription:v6];
        int v7 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138543362;
          BOOL v9 = v6;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
        }
      }
    }
  }
}

- (void)setScopeSyncingState:(signed __int16)a3
{
  uint64_t v3 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [NSNumber numberWithShort:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PLLibraryScope_setScopeSyncingState___block_invoke;
  v6[3] = &unk_1E5863F98;
  objc_copyWeak(&v7, &location);
  __int16 v8 = v3;
  [(PLManagedObject *)self pl_safeSetValue:v5 forKey:@"scopeSyncingState" valueDidChangeHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__PLLibraryScope_setScopeSyncingState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained;
    int v4 = [(id)objc_opt_class() libraryScopeIsActiveWithScopeSyncingState:*(__int16 *)(a1 + 40)];
    uint64_t v3 = v8;
    if (v4)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = [v8 photoLibrary];
      id v7 = [v6 managedObjectContext];
      [v5 _cleanupLocalPreviewLibraryScopesInManagedObjectContext:v7];

      uint64_t v3 = v8;
    }
  }
}

- (void)didSave
{
  if (*((unsigned char *)&self->super.super._willSaveCallCount + 2))
  {
    *((unsigned char *)&self->super.super._willSaveCallCount + 2) = 0;
    uint64_t v3 = objc_opt_class();
    id v5 = [(PLLibraryScope *)self managedObjectContext];
    id v4 = (id)[v3 resetLibraryScopeAssetStatesWithManagedObjectContext:v5];
  }
}

- (void)willSave
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PLLibraryScope;
  [(PLManagedObject *)&v18 willSave];
  uint64_t v3 = [(PLLibraryScope *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(PLLibraryScope *)self isDeleted]) {
      *((unsigned char *)&self->super.super._willSaveCallCount + 2) = 1;
    }
    id v4 = [(PLLibraryScope *)self changedValues];
    id v5 = [v4 objectForKey:@"scopeSyncingState"];

    BOOL v6 = v5 != 0;
    if (v5
      && [(PLLibraryScope *)self libraryScopeIsActive]
      && [(PLLibraryScope *)self trashedState] == 1)
    {
      id v7 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        __int16 v8 = [(PLLibraryScope *)self scopeIdentifier];
        BOOL v9 = [(PLLibraryScope *)self uuid];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v20 = v8;
        __int16 v21 = 2114;
        long long v22 = v9;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "LibraryScope %{public}@ for asset %{public}@ is active but in trashed state, this is an invalid state. Untrashing LibraryScope", buf, 0x16u);
      }
      [(PLShare *)self untrash];
    }
    if (([(PLLibraryScope *)self isInserted] & 1) != 0
      || ([(PLLibraryScope *)self isDeleted] & 1) != 0
      || ([v4 objectForKey:@"participants"],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      long long v11 = [v3 delayedSaveActions];
      [v11 recordLibraryScopeParticipantsUpdateForLibraryScope:self];

      [(PLLibraryScope *)self _verifyCurrentUserParticipantExists];
      BOOL v6 = 1;
    }
    uint64_t v12 = [v4 objectForKey:@"rulesData"];
    if (v12)
    {
      objc_super v13 = (void *)v12;
      BOOL v14 = [(PLLibraryScope *)self libraryScopeIsActive];

      if (v14)
      {
        id v15 = [v3 delayedSaveActions];
        [v15 recordLibraryScopeRulesUpdated];
      }
    }
    if (v6)
    {
      __int16 v16 = [(PLManagedObject *)self photoLibrary];
      char v17 = [v16 isUnitTesting];

      if ((v17 & 1) == 0) {
        [(id)objc_opt_class() updateLibraryScopeActiveDefaultsWithManagedObjectContext:v3];
      }
    }
  }
}

- (BOOL)_libraryScopeWasCreatedInLocalOnlyMode
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PLLibraryScope *)self scopeIdentifier];
  LOBYTE(v3) = [v3 libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:v4];

  return (char)v3;
}

@end