@interface ML3MaintenanceTasksOperation
- (ML3MaintenanceTasksOperation)initWithLibrary:(id)a3 activity:(id)a4;
- (ML3MusicLibrary)library;
- (OS_xpc_object)activity;
- (void)main;
@end

@implementation ML3MaintenanceTasksOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (void)main
{
  uint64_t v268 = *MEMORY[0x1E4F143B8];
  v187 = [(ML3MusicLibrary *)self->_library databasePath];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:v187];

  if (v3)
  {
    v4 = [(ML3MusicLibrary *)self->_library valueForDatabaseProperty:@"MLMaintenanceTaskOperationDate"];
    [v4 doubleValue];
    double v6 = v5;

    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    v8 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up missing foreign keys", buf, 2u);
    }

    v9 = self->_library;
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Checking library %{public}@", buf, 0xCu);
    }

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck_block_invoke;
    v263 = &unk_1E5FB4608;
    v11 = v9;
    v264 = v11;
    LOBYTE(v265) = 1;
    [(ML3MusicLibrary *)v11 performDatabaseTransactionWithBlock:buf];
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v226 = 138543362;
      *(void *)&v226[4] = v11;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesPerformForeignKeyConstraintCheck: Finished checking library %{public}@", v226, 0xCu);
    }

    v13 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing cached playlists not played since %{public}@", buf, 0xCu);
    }

    v210 = self->_library;
    id v14 = v7;
    v15 = +[ML3ComparisonPredicate predicateWithProperty:@"is_hidden" equalToInt64:1];
    *(void *)&long long v231 = v15;
    v16 = +[ML3ComparisonPredicate predicateWithProperty:@"cloud_is_subscribed" equalToInt64:1];
    *((void *)&v231 + 1) = v16;
    v17 = +[ML3ComparisonPredicate predicateWithProperty:@"store_cloud_id" equalToInt64:0];
    *(void *)&long long v232 = v17;
    v18 = +[ML3ComparisonPredicate predicateWithProperty:@"cloud_global_id" value:&stru_1F08D4D70 comparison:2];
    *((void *)&v232 + 1) = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v231 count:4];
    v20 = +[ML3CompoundPredicate predicateMatchingPredicates:v19];

    v21 = NSNumber;
    [v14 timeIntervalSinceReferenceDate];
    v22 = objc_msgSend(v21, "numberWithDouble:");
    v23 = +[ML3ComparisonPredicate predicateWithProperty:@"date_played_local" value:v22 comparison:6];

    *(void *)&long long v250 = 0;
    *((void *)&v250 + 1) = &v250;
    uint64_t v251 = 0x2020000000;
    LODWORD(v252) = 0;
    *(void *)v257 = v20;
    *(void *)&v257[8] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v257 count:2];
    v25 = +[ML3CompoundPredicate predicateMatchingPredicates:v24];

    v26 = +[ML3Entity allItemsQueryWithLibrary:v210 predicate:v25 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0];
    v27 = [MEMORY[0x1E4F1CA80] set];
    v244 = @"name";
    uint64_t v245 = @"cloud_global_id";
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:2];
    *(void *)&long long v218 = MEMORY[0x1E4F143A8];
    *((void *)&v218 + 1) = 3221225472;
    *(void *)&long long v219 = __ML3MaintenanceUtilitiesRemoveCachedPlaylistsNotPlayedSinceDate_block_invoke;
    *((void *)&v219 + 1) = &unk_1E5FB4788;
    *((void *)&v220 + 1) = &v250;
    id v29 = v27;
    *(void *)&long long v220 = v29;
    [v26 enumeratePersistentIDsAndProperties:v28 usingBlock:&v218];

    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v29 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_DEFAULT, "[Maintenance] Found %lu total cached playlists to purge", buf, 0xCu);
    }

    if ([v29 count])
    {
      v199 = v26;
      v32 = malloc_type_malloc(8 * [v29 count], 0x100004000313F17uLL);
      obuint64_t j = v25;
      v33 = v20;
      id v34 = v14;
      long long v227 = 0u;
      long long v228 = 0u;
      memset(v226, 0, sizeof(v226));
      id v35 = v29;
      uint64_t v36 = [v35 countByEnumeratingWithState:v226 objects:buf count:16];
      if (v36)
      {
        uint64_t v37 = 0;
        uint64_t v38 = **(void **)&v226[16];
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (**(void **)&v226[16] != v38) {
              objc_enumerationMutation(v35);
            }
            v32[v37 + i] = [*(id *)(*(void *)&v226[8] + 8 * i) longLongValue];
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:v226 objects:buf count:16];
          v37 += i;
        }
        while (v36);
      }

      v25 = obj;
      id v14 = v34;
      v20 = v33;
      +[ML3Container deleteFromLibrary:deletionType:persistentIDs:count:](ML3Container, "deleteFromLibrary:deletionType:persistentIDs:count:", v210, 2, v32, [v35 count]);
      free(v32);
      v26 = v199;
    }

    _Block_object_dispose(&v250, 8);
    v40 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing orphaned tracks before %{public}@", buf, 0xCu);
    }

    v191 = self->_library;
    v185 = v14;
    v181 = +[ML3ComparisonPredicate predicateWithProperty:@"remote_location_id" equalToInt64:50];
    v41 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id" equalToInt64:0];
    v261[0] = v41;
    v42 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.sync_id" equalToInt64:0];
    v261[1] = v42;
    v43 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.purchase_history_id" equalToInt64:0];
    v261[2] = v43;
    v44 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_ota_purchased" equalToInt64:0];
    v261[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v261 count:4];
    v188 = +[ML3CompoundPredicate predicateMatchingPredicates:v45];

    v46 = NSNumber;
    [v185 timeIntervalSinceReferenceDate];
    v47 = objc_msgSend(v46, "numberWithDouble:");
    v186 = +[ML3ComparisonPredicate predicateWithProperty:@"date_added" value:v47 comparison:6];

    v260[0] = v186;
    v260[1] = v188;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v260 count:2];
    v183 = +[ML3CompoundPredicate predicateMatchingPredicates:v48];

    v189 = +[ML3Entity allItemsQueryWithLibrary:v191 predicate:v183 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0];
    uint64_t v49 = [v189 countOfEntities];
    log = os_log_create("com.apple.amp.medialibrary", "Default");
    BOOL v50 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v49)
    {
      if (v50)
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v189;
        _os_log_impl(&dword_1B022D000, log, OS_LOG_TYPE_DEFAULT, "Found %lu potential orphan tracks to evaluate using query: %{public}@", buf, 0x16u);
      }

      v51 = [MEMORY[0x1E4F1CA80] setWithCapacity:v49];
      *(void *)v257 = MEMORY[0x1E4F143A8];
      *(void *)&v257[8] = 3221225472;
      *(void *)&v257[16] = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke;
      v258 = &unk_1E5FB7EE0;
      id v52 = v51;
      id v259 = v52;
      [v189 enumeratePersistentIDsUsingBlock:v257];
      v53 = +[ML3PropertyPredicate predicateWithProperty:@"cloud_is_subscribed"];
      v256[0] = v53;
      v54 = +[ML3PropertyPredicate predicateWithProperty:@"cloud_is_curator_playlist"];
      v256[1] = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v256 count:2];
      v178 = +[ML3CompoundPredicate predicateMatchingPredicates:v55];

      v176 = +[ML3Entity allItemsQueryWithLibrary:v191 predicate:v178 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0];
      v56 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v56, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from subscribed containers...", buf, 2u);
      }

      *(void *)&long long v250 = MEMORY[0x1E4F143A8];
      *((void *)&v250 + 1) = 3221225472;
      uint64_t v251 = (uint64_t)__ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_9;
      v252 = &unk_1E5FB4568;
      v211 = v191;
      v253 = v211;
      id v200 = v181;
      id v254 = v200;
      id v57 = v52;
      id v255 = v57;
      [v176 enumeratePersistentIDsUsingBlock:&v250];
      v174 = [(ML3MusicLibrary *)v211 currentDevicePlaybackHistoryPlaylist];
      v173 = +[ML3Track containerQueryWithContainer:v174 predicate:v200];
      v58 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v58, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from playback history...", buf, 2u);
      }

      v249 = @"item_extra.title";
      v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v249 count:1];
      v244 = (__CFString *)MEMORY[0x1E4F143A8];
      uint64_t v245 = 3221225472;
      v246 = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_11;
      v247 = &unk_1E5FB5218;
      id v196 = v57;
      id v248 = v196;
      [v173 enumeratePersistentIDsAndProperties:v59 usingBlock:&v244];

      id obja = [v196 allObjects];
      long long v221 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v218 = 0u;
      uint64_t v60 = [obja countByEnumeratingWithState:&v218 objects:buf count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v219;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v219 != v61) {
              objc_enumerationMutation(obja);
            }
            id v63 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", [*(id *)(*((void *)&v218 + 1) + 8 * j) longLongValue], v211);
            v64 = [v63 valueForProperty:@"base_location_id"];
            BOOL v65 = [v64 longLongValue] > 0;

            if (v65)
            {
              v66 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v67 = [v63 persistentID];
                v68 = [v63 valueForProperty:@"item_extra.title"];
                *(_DWORD *)v226 = 134218242;
                *(void *)&v226[4] = v67;
                *(_WORD *)&v226[12] = 2114;
                *(void *)&v226[14] = v68;
                _os_log_impl(&dword_1B022D000, v66, OS_LOG_TYPE_DEFAULT, "Removing assets for track: %lld - %{public}@", v226, 0x16u);
              }
            }
          }
          uint64_t v60 = [obja countByEnumeratingWithState:&v218 objects:buf count:16];
        }
        while (v60);
      }
      +[ML3Track unlinkRedownloadableAssetsFromLibrary:v211 persistentIDs:obja deletionType:2 deletedFileSize:0];
      v69 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.liked_state" value:&unk_1F0910FA8 comparison:2];
      v243[0] = v69;
      v243[1] = v200;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:2];
      v172 = +[ML3CompoundPredicate predicateMatchingPredicates:v70];

      v171 = +[ML3Entity allItemsQueryWithLibrary:v211 predicate:v172 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0];
      v71 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v226 = 0;
        _os_log_impl(&dword_1B022D000, v71, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks from the love cache...", v226, 2u);
      }

      v242 = @"item_extra.title";
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v242 count:1];
      v237 = (void *)MEMORY[0x1E4F143A8];
      uint64_t v238 = 3221225472;
      v239 = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_13;
      v240 = &unk_1E5FB5218;
      id v73 = v196;
      id v241 = v73;
      [v171 enumeratePersistentIDsAndProperties:v72 usingBlock:&v237];

      v74 = +[ML3ComparisonPredicate predicateWithProperty:@"album.liked_state" value:&unk_1F0910FA8 comparison:2];
      v236[0] = v74;
      v236[1] = v200;
      v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v236 count:2];
      v170 = +[ML3CompoundPredicate predicateMatchingPredicates:v75];

      v169 = +[ML3Entity allItemsQueryWithLibrary:v211 predicate:v170 orderingTerms:MEMORY[0x1E4F1CBF0] usingSections:0];
      v76 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v226 = 0;
        _os_log_impl(&dword_1B022D000, v76, OS_LOG_TYPE_DEFAULT, "Keeping the following tracks that are in albums from the love cache...", v226, 2u);
      }

      v235[0] = @"item_extra.title";
      v235[1] = @"album.album";
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v235 count:2];
      v216[0] = MEMORY[0x1E4F143A8];
      v216[1] = 3221225472;
      v216[2] = __ML3MaintenanceUtilitiesRemoveOrphanTracksAddedBeforeDate_block_invoke_14;
      v216[3] = &unk_1E5FB5218;
      id v78 = v73;
      id v217 = v78;
      [v169 enumeratePersistentIDsAndProperties:v77 usingBlock:v216];

      uint64_t v180 = [v78 count];
      v79 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v226 = 134217984;
        *(void *)&v226[4] = v180;
        _os_log_impl(&dword_1B022D000, v79, OS_LOG_TYPE_DEFAULT, "Found %lu orphan tracks to delete.", v226, 0xCu);
      }

      xpc_activity_t activity = (xpc_activity_t)malloc_type_malloc(8 * v180, 0x100004000313F17uLL);
      long long v233 = 0u;
      long long v234 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      log = v78;
      uint64_t v80 = [log countByEnumeratingWithState:&v231 objects:v226 count:16];
      if (v80)
      {
        uint64_t v81 = 0;
        uint64_t v82 = *(void *)v232;
        do
        {
          uint64_t v83 = 0;
          uint64_t v197 = v81;
          v84 = (char *)activity + 8 * v81;
          do
          {
            if (*(void *)v232 != v82) {
              objc_enumerationMutation(log);
            }
            uint64_t v85 = objc_msgSend(*(id *)(*((void *)&v231 + 1) + 8 * v83), "longLongValue", v169);
            *(void *)&v84[8 * v83] = v85;
            v86 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              id v87 = +[ML3Entity newWithPersistentID:v85 inLibrary:v211];
              v88 = [v87 valueForProperty:@"item_extra.title"];
              *(_DWORD *)v222 = 134218242;
              uint64_t v223 = v85;
              __int16 v224 = 2114;
              v225 = v88;
              _os_log_impl(&dword_1B022D000, v86, OS_LOG_TYPE_DEFAULT, "Deleting track: %lld - %{public}@", v222, 0x16u);
            }
            ++v83;
          }
          while (v80 != v83);
          uint64_t v80 = [log countByEnumeratingWithState:&v231 objects:v226 count:16];
          uint64_t v81 = v197 + v83;
        }
        while (v80);
      }

      +[ML3Track deleteFromLibrary:v211 deletionType:2 persistentIDs:activity count:v180];
      free(activity);
    }
    else if (v50)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, log, OS_LOG_TYPE_DEFAULT, "No potential orphan tracks to evaluate at this time.", buf, 2u);
    }

    v90 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v90, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Removing orphaned assets", buf, 2u);
    }

    +[ML3MusicLibrary removeOrphanedTracks];
    v91 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v91, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up artwork for maintenance activity.", buf, 2u);
    }

    [(ML3MusicLibrary *)self->_library cleanupArtworkWithOptions:30];
    v92 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v92, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Start maintenance activity to convert existing artwork to ASTC.", buf, 2u);
    }

    v93 = self->_activity;
    v184 = self->_library;
    activitya = v93;
    LOBYTE(v93) = CFPreferencesGetAppBooleanValue(@"EnableASTCEncoding", @"com.apple.mobileipod", 0) == 0;
    v182 = [(ML3MusicLibrary *)v184 valueForDatabaseProperty:@"MLArtworkShouldConvertToASTC"];
    if ((v93 & 1) == 0 && [v182 integerValue] == 1)
    {
      v177 = [(ML3MusicLibrary *)v184 artworkDirectory];
      v190 = [MEMORY[0x1E4F1CA48] array];
      v179 = +[ML3MusicLibrary pathForResourceFileOrFolder:18];
      v192 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v192 fileExistsAtPath:v179])
      {
        v94 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v179];
      }
      else
      {
        v94 = 0;
      }
      v175 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v177, 1, v169);
      uint64_t loga = *MEMORY[0x1E4F1C628];
      *(void *)v257 = *MEMORY[0x1E4F1C628];
      v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v257 count:1];
      v96 = [v192 enumeratorAtURL:v175 includingPropertiesForKeys:v95 options:4 errorHandler:0];

      *(void *)&long long v231 = 0;
      *((void *)&v231 + 1) = &v231;
      *(void *)&long long v232 = 0x2020000000;
      BYTE8(v232) = 0;
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v97 = v96;
      uint64_t v98 = [v97 countByEnumeratingWithState:&v218 objects:buf count:16];
      if (v98)
      {
        int v198 = 0;
        id objb = *(id *)v219;
        while (2)
        {
          uint64_t v212 = v98;
          for (uint64_t k = 0; k != v212; ++k)
          {
            if (*(id *)v219 != objb) {
              objc_enumerationMutation(v97);
            }
            v100 = *(void **)(*((void *)&v218 + 1) + 8 * k);
            v244 = 0;
            [v100 getResourceValue:&v244 forKey:loga error:0];
            v101 = v244;
            if (([(__CFString *)v101 BOOLValue] & 1) == 0)
            {
              v102 = [v100 absoluteString];
              int v103 = [v94 containsObject:v102];

              if (v103)
              {
                v104 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v250) = 138543362;
                  *(void *)((char *)&v250 + 4) = v100;
                  _os_log_impl(&dword_1B022D000, v104, OS_LOG_TYPE_DEFAULT, "URL %{public}@ is in known list of paths that could not be converted to ASTC .. skipping.", (uint8_t *)&v250, 0xCu);
                }
              }
              else
              {
                v105 = [v100 lastPathComponent];
                v106 = [MEMORY[0x1E4F29128] UUID];
                v107 = [v106 UUIDString];
                v201 = [v107 stringByAppendingString:v105];

                v108 = [v100 URLByDeletingLastPathComponent];
                v109 = [v108 URLByAppendingPathComponent:v201];

                v110 = v97;
                v111 = v94;
                v112 = (void *)[objc_alloc(MEMORY[0x1E4F77938]) initWithSourceURL:v100 destinationURL:v109 destinationFormat:2];
                dispatch_semaphore_t v113 = dispatch_semaphore_create(0);
                v114 = [MEMORY[0x1E4F77928] sharedService];
                *(void *)v226 = MEMORY[0x1E4F143A8];
                *(void *)&v226[8] = 3221225472;
                *(void *)&v226[16] = __ML3MaintenanceUtilitiesConvertExistingArtworkToASTC_block_invoke;
                *(void *)&v226[24] = &unk_1E5FB4590;
                *(void *)&long long v227 = v190;
                *((void *)&v227 + 1) = v100;
                v230 = &v231;
                *(void *)&long long v228 = v192;
                id v115 = v109;
                *((void *)&v228 + 1) = v115;
                v116 = v113;
                v229 = v116;
                [v114 sendRequest:v112 completionHandler:v226];

                v94 = v111;
                id v97 = v110;
                dispatch_semaphore_wait(v116, 0xFFFFFFFFFFFFFFFFLL);

                int v117 = v198 + 1;
                BOOL v118 = v198 != 4 || activitya == 0;
                if (v198 == 4) {
                  int v117 = 0;
                }
                if (v118)
                {
                  int v198 = v117;
                }
                else
                {
                  if (xpc_activity_should_defer(activitya))
                  {
                    if (!xpc_activity_set_state(activitya, 3))
                    {
                      v122 = os_log_create("com.apple.amp.medialibrary", "Default");
                      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                      {
                        LOWORD(v250) = 0;
                        _os_log_impl(&dword_1B022D000, v122, OS_LOG_TYPE_DEFAULT, "Error deferring artwork conversion activity as the conditions have changed.", (uint8_t *)&v250, 2u);
                      }
                    }
                    goto LABEL_109;
                  }
                  int v198 = 0;
                }
              }
            }
          }
          uint64_t v98 = [v97 countByEnumeratingWithState:&v218 objects:buf count:16];
          if (v98) {
            continue;
          }
          break;
        }
      }

      if (*(unsigned char *)(*((void *)&v231 + 1) + 24))
      {
LABEL_109:
        if ([v190 count])
        {
          v123 = [v179 stringByDeletingLastPathComponent];
          int v124 = [v192 createDirectoryAtPath:v123 withIntermediateDirectories:1 attributes:0 error:0];

          if (v124)
          {
            if (v94) {
              [v190 addObjectsFromArray:v94];
            }
            [v190 writeToFile:v179 atomically:1];
          }
        }
      }
      else
      {
        v119 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v250) = 0;
          _os_log_impl(&dword_1B022D000, v119, OS_LOG_TYPE_DEFAULT, "All artwork are converted to ASTC", (uint8_t *)&v250, 2u);
        }

        if (![(ML3MusicLibrary *)v184 deleteDatabaseProperty:@"MLArtworkShouldConvertToASTC"])
        {
          v120 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v250) = 0;
            _os_log_impl(&dword_1B022D000, v120, OS_LOG_TYPE_DEFAULT, "Error removing MLArtworkShouldConvertToASTC key.", (uint8_t *)&v250, 2u);
          }
        }
        if (([v192 removeItemAtPath:v179 error:0] & 1) == 0)
        {
          v121 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v250) = 138543362;
            *(void *)((char *)&v250 + 4) = v179;
            _os_log_impl(&dword_1B022D000, v121, OS_LOG_TYPE_DEFAULT, "Error removing failed assets plist at %{public}@.", (uint8_t *)&v250, 0xCu);
          }
        }
      }
      _Block_object_dispose(&v231, 8);
    }
    v125 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v125, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Start maintenance activity to prune unused metadata", buf, 2u);
    }

    library = self->_library;
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = __36__ML3MaintenanceTasksOperation_main__block_invoke;
    v215[3] = &unk_1E5FB7AB8;
    v215[4] = self;
    [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v215];
    v127 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v127, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Reconciling HLS Asset Size", buf, 2u);
    }

    if (v6 > 3600.0) {
      double v6 = v6 + -3600.0;
    }
    v128 = self->_library;
    v129 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v6;
      _os_log_impl(&dword_1B022D000, v129, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: Starting reconcile. reconcileStartInterval=%f", buf, 0xCu);
    }

    v130 = [MEMORY[0x1E4F28CB8] defaultManager];
    v131 = @"base_location.path";
    *(void *)&long long v231 = @"base_location.path";
    v132 = @"item_extra.location";
    *((void *)&v231 + 1) = @"item_extra.location";
    v133 = @"item_extra.file_size";
    *(void *)&long long v232 = @"item_extra.file_size";
    v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v231 count:3];
    v135 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F0910FC0 comparison:6];
    v136 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F0910FD8 comparison:4];
    v244 = v135;
    uint64_t v245 = (uint64_t)v136;
    v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:2];
    logb = +[ML3CompoundPredicate predicateMatchingPredicates:v137];

    v138 = [NSNumber numberWithDouble:v6];
    v213 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.date_played" value:v138 comparison:4];

    v139 = [NSNumber numberWithDouble:v6];
    id objc = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.date_accessed" value:v139 comparison:4];

    v237 = v213;
    uint64_t v238 = (uint64_t)objc;
    v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v237 count:2];
    v202 = +[ML3CompoundPredicate predicateMatchingPredicates:v140];

    v141 = +[ML3ComparisonPredicate predicateWithProperty:@"item_video.hls_asset_traits" value:&unk_1F0910FA8 comparison:2];
    *(void *)&long long v250 = logb;
    *((void *)&v250 + 1) = v141;
    uint64_t v251 = (uint64_t)v202;
    v142 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:3];
    v143 = +[ML3CompoundPredicate predicateMatchingPredicates:v142];

    v144 = +[ML3Entity queryWithLibrary:v128 predicate:v143];
    *(void *)v226 = 0;
    *(void *)&v226[8] = v226;
    *(void *)&v226[16] = 0x2020000000;
    *(void *)&v226[24] = 0;
    *(void *)&long long v218 = 0;
    *((void *)&v218 + 1) = &v218;
    long long v219 = 0x2020000000uLL;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __ML3MaintenanceUtilitiesReconcileHLSAssetSize_block_invoke;
    v263 = &unk_1E5FB4640;
    v145 = v128;
    v264 = v145;
    id v146 = v130;
    id v265 = v146;
    v266 = v226;
    v267 = &v218;
    [v144 enumeratePersistentIDsAndProperties:v134 usingBlock:buf];
    v147 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v148 = *(void *)(*((void *)&v218 + 1) + 24);
      uint64_t v149 = *(void *)(*(void *)&v226[8] + 24);
      *(_DWORD *)v257 = 134218240;
      *(void *)&v257[4] = v148;
      *(_WORD *)&v257[12] = 2048;
      *(void *)&v257[14] = v149;
      _os_log_impl(&dword_1B022D000, v147, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: Finished! Reconciled %llu tracks for a total discrepancy of %lld bytes", v257, 0x16u);
    }

    _Block_object_dispose(&v218, 8);
    _Block_object_dispose(v226, 8);

    for (uint64_t m = 16; m != -8; m -= 8)
    v151 = self->_library;
    v152 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v153 = objc_msgSend(v152, "numberWithDouble:");
    [(ML3MusicLibrary *)v151 setValue:v153 forDatabaseProperty:@"MLMaintenanceTaskOperationDate"];

    v154 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v154, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Cleaning up old Cache", buf, 2u);
    }

    v155 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:@"CloudAssets"];
    id v156 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v157 = [v156 enumeratorAtPath:v155];
    v158 = [v157 nextObject];
    if (v158)
    {
      v159 = 0;
      do
      {
        v160 = objc_msgSend(v155, "stringByAppendingPathComponent:", v158, v169);
        id v214 = v159;
        char v161 = [v156 removeItemAtPath:v160 error:&v214];
        id v162 = v214;

        if ((v161 & 1) == 0)
        {
          v163 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v158;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v162;
            _os_log_impl(&dword_1B022D000, v163, OS_LOG_TYPE_ERROR, "Failed to remove cached asset %{public}@ error %{public}@", buf, 0x16u);
          }
        }
        uint64_t v164 = [v157 nextObject];

        v158 = (void *)v164;
        v159 = v162;
      }
      while (v164);
    }
    else
    {
      id v162 = 0;
    }
    v165 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v165, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Marking Purgeable Artwork", buf, 2u);
    }

    ML3MaintenanceUtilitiesMarkArtworkPurgeable(self->_library);
    v166 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v166, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] All maintenance completed.", buf, 2u);
    }

    v167 = self->_activity;
    if (v167 && !xpc_activity_set_state(v167, 5))
    {
      v168 = os_log_create("com.apple.amp.medialibrary", "Service");
      if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v168, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Failed to set state of maintenance activity to DONE.", buf, 2u);
      }
    }
    v89 = v185;
  }
  else
  {
    v89 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v187;
      _os_log_impl(&dword_1B022D000, v89, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Skipping maintenance because no file exists at path '%{public}@'", buf, 0xCu);
    }
  }
}

uint64_t __36__ML3MaintenanceTasksOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 executeQuery:@"SELECT COUNT() FROM album"];
  uint64_t v5 = [v4 int64ValueForFirstRowAndColumn];

  double v6 = [v3 executeQuery:@"SELECT COUNT(DISTINCT(album_pid)) FROM item"];
  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];

  v8 = [v3 executeQuery:@"SELECT COUNT() FROM album_artist"];
  uint64_t v9 = [v8 int64ValueForFirstRowAndColumn];

  v10 = [v3 executeQuery:@"SELECT COUNT(DISTINCT(album_artist_pid)) FROM item"];
  uint64_t v11 = [v10 int64ValueForFirstRowAndColumn];

  v12 = [v3 executeQuery:@"SELECT COUNT() FROM item_artist"];
  uint64_t v13 = [v12 int64ValueForFirstRowAndColumn];

  id v14 = [v3 executeQuery:@"SELECT COUNT(DISTINCT(item_artist_pid)) FROM item"];
  uint64_t v15 = [v14 int64ValueForFirstRowAndColumn];

  if (v5 >= 0) {
    uint64_t v16 = v5;
  }
  else {
    uint64_t v16 = v5 + 1;
  }
  if (v9 >= 0) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = v9 + 1;
  }
  if (v13 >= 0) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = v13 + 1;
  }
  if (v7 < v16 >> 1 || v11 < v17 >> 1 || v15 < v18 >> 1)
  {
    v19 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219264;
      uint64_t v34 = v7;
      __int16 v35 = 2048;
      uint64_t v36 = v5;
      __int16 v37 = 2048;
      uint64_t v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = v9;
      __int16 v41 = 2048;
      uint64_t v42 = v15;
      __int16 v43 = 2048;
      uint64_t v44 = v13;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Rebuilding collections (itemAlbumCount=%lld, totalAlbumCount=%lld, itemAlbumArtistCount=%lld, totalAlbumArtistCount=%lld, itemItemArtistCount=%lld, totalItemArtistCount=%lld)", buf, 0x3Eu);
    }

    if (!+[ML3Collection removeOrphanedCollectionsInLibrary:*(void *)(*(void *)(a1 + 32) + 248) usingConnection:v3])goto LABEL_24; {
  }
    }
  v20 = [v3 executeQuery:@"SELECT COUNT() FROM sort_map"];
  uint64_t v21 = [v20 int64ValueForFirstRowAndColumn];

  v22 = [v3 executeQuery:@"SELECT COUNT() FROM sort_map WHERE name_order IN (SELECT title_order FROM item) OR name_order IN (SELECT item_artist_order FROM item) OR name_order IN (SELECT series_name_order FROM item) OR name_order IN (SELECT album_order FROM item) OR name_order IN (SELECT album_artist_order FROM item) OR name_order IN (SELECT genre_order FROM item) OR name_order IN (SELECT composer_order FROM item) OR name_order IN (SELECT name_order FROM container) OR name_order IN (SELECT search_title FROM item_search) OR name_order IN (SELECT search_album FROM item_search) OR name_order IN (SELECT search_artist FROM item_search) OR name_order in (SELECT search_composer FROM item_search) OR name_order IN (SELECT search_album_artist FROM item_search)"];
  uint64_t v23 = [v22 int64ValueForFirstRowAndColumn];

  uint64_t v24 = v21 >= 0 ? v21 : v21 + 1;
  if (v23 >= v24 >> 1) {
    goto LABEL_25;
  }
  v25 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v34 = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Rebuilding sort map (usedSortMapEntryCount=%lld, totalSortMapEntryCount=%lld)", buf, 0x16u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 248) inTransactionUpdateSortMapOnConnection:v3 forceRebuild:1 forceUpdateOriginals:1]&& objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "inTransactionUpdateSearchMapOnConnection:", v3))
  {
LABEL_25:
    [*(id *)(*(void *)(a1 + 32) + 248) performColorAnalysisForArtworkWithConnection:v3 shouldRegenerateColorAnalysis:0];
    if (([*(id *)(*(void *)(a1 + 32) + 248) validateItemTablesEntriesUsingConnection:v3] & 1) == 0)
    {
      v27 = (void *)MSVCopySystemBuildVersion();
      v28 = [*(id *)(*(void *)(a1 + 32) + 248) valueForDatabaseProperty:@"ML3DatabaseKeyMaintenanceTaskOperationSanitizeClientBuildVersion"];
      if (!v28) {
        goto LABEL_32;
      }
      if ((_NSIsNSString() & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 248) deleteDatabaseProperty:@"ML3DatabaseKeyMaintenanceTaskOperationSanitizeClientBuildVersion"];
        id v29 = os_log_create("com.apple.amp.medialibrary", "Service");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Clearing sanitizeClientBuildVersion as it's invalid", buf, 2u);
        }
      }
      if (([v27 isEqualToString:v28] & 1) == 0)
      {
LABEL_32:
        v30 = os_log_create("com.apple.amp.medialibrary", "Service");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = (uint64_t)v28;
          __int16 v35 = 2114;
          uint64_t v36 = (uint64_t)v27;
          _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_DEFAULT, "[MaintenanceTasksOperation] Item tables are not in sync - will perform a client initiated reset lastClientInitiatedResetClientBuildVersion=%{public}@, currentDeviceBuildVersion=%{public}@", buf, 0x16u);
        }

        buf[0] = 0;
        char v32 = 0;
        [*(id *)(*(void *)(a1 + 32) + 248) setValue:v27 forDatabaseProperty:@"ML3DatabaseKeyMaintenanceTaskOperationSanitizeClientBuildVersion"];
        [*(id *)(*(void *)(a1 + 32) + 248) sanitizeDatabaseContentsUsingConnection:v3 removeOrphanedAssets:buf];
        [*(id *)(*(void *)(a1 + 32) + 248) sanitizeSortMapContentsUsingConnection:v3 didSortMapEntries:&v32];
      }
    }
    uint64_t v26 = 1;
  }
  else
  {
LABEL_24:
    uint64_t v26 = 0;
  }

  return v26;
}

- (ML3MaintenanceTasksOperation)initWithLibrary:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3MaintenanceTasksOperation;
  uint64_t v9 = [(ML3MaintenanceTasksOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

@end