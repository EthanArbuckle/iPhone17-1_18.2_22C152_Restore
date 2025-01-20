@interface PGMusicAudioCacher
+ (id)songPropertiesByAdamIDCachedForPhotosWithError:(id *)a3;
+ (void)_addSongsWithAdamIDs:(id)a3 toPlaylist:(id)a4 inLibrary:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7;
+ (void)cacheSongAudioForAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
+ (void)removeAllSongsCachedForPhotosWithProgressReporter:(id)a3 completionHandler:(id)a4;
+ (void)removeSongsCachedForPhotosWithAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
@end

@implementation PGMusicAudioCacher

+ (void)_addSongsWithAdamIDs:(id)a3 toPlaylist:(id)a4 inLibrary:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, void, id))a7;
  if ([v14 isCancelledWithProgress:0.0])
  {
    v16 = +[PGError errorForCode:-4];
    v15[2](v15, 0, v16);
  }
  else
  {
    v17 = +[PGLogging memoriesMusicLogging];
    v18 = [v17 loggingConnection];

    os_signpost_id_t v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "AddSongsToMusicAudioCache", "", buf, 2u);
    }

    *(void *)buf = 0;
    mach_timebase_info((mach_timebase_info_t)buf);
    uint64_t v22 = mach_absolute_time();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke;
    v24[3] = &unk_1E68EB260;
    id v25 = v14;
    v23 = v15;
    os_signpost_id_t v30 = v19;
    uint64_t v31 = *(void *)buf;
    id v28 = v23;
    uint64_t v29 = v22;
    v26 = v21;
    id v27 = v12;
    v16 = v21;
    [v13 addStoreItemIDs:v11 referralObject:0 andAddTracksToCloudLibrary:0 withCompletion:v24];
  }
}

void __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelledWithProgress:0.5])
  {
    uint64_t v7 = *(void *)(a1 + 56);
    v8 = +[PGError errorForCode:-4];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = *(void *)(a1 + 64);
    unsigned int v12 = *(_DWORD *)(a1 + 80);
    unsigned int v11 = *(_DWORD *)(a1 + 84);
    id v13 = *(id *)(a1 + 40);
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_END, v15, "AddSongsToMusicAudioCache", "", buf, 2u);
    }

    v16 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_13:
      *(_DWORD *)buf = 136315394;
      v33 = "AddSongsToMusicAudioCache";
      __int16 v34 = 2048;
      double v35 = (float)((float)((float)((float)(v9 - v10) * (float)v12) / (float)v11) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else if (v5)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke_24;
    v25[3] = &unk_1E68EB238;
    v17 = *(void **)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 64);
    id v26 = v18;
    uint64_t v29 = v19;
    uint64_t v31 = *(void *)(a1 + 80);
    id v20 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 72);
    id v27 = v20;
    uint64_t v30 = v21;
    [v17 addMediaItems:v5 completionHandler:v25];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) isCancelledWithProgress:1.0];
    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = *(void *)(a1 + 64);
    unsigned int v12 = *(_DWORD *)(a1 + 80);
    unsigned int v11 = *(_DWORD *)(a1 + 84);
    uint64_t v22 = *(id *)(a1 + 40);
    v23 = v22;
    os_signpost_id_t v24 = *(void *)(a1 + 72);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v24, "AddSongsToMusicAudioCache", "", buf, 2u);
    }

    v16 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
  }
}

void __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) isCancelledWithProgress:1.0];
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = *(void *)(a1 + 56);
  unsigned int v5 = *(_DWORD *)(a1 + 72);
  unsigned int v4 = *(_DWORD *)(a1 + 76);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AddSongsToMusicAudioCache", "", (uint8_t *)&v10, 2u);
  }

  uint64_t v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    unsigned int v11 = "AddSongsToMusicAudioCache";
    __int16 v12 = 2048;
    double v13 = (float)((float)((float)((float)(v2 - v3) * (float)v5) / (float)v4) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v10, 0x16u);
  }
}

+ (id)songPropertiesByAdamIDCachedForPhotosWithError:(id *)a3
{
  v53[12] = *MEMORY[0x1E4F143B8];
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary])
  {
    unsigned int v4 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
    unsigned int v5 = [v4 photosMemoriesPlaylist];
    if (v5)
    {
      __int16 v34 = v4;
      uint64_t v6 = *MEMORY[0x1E4F312E8];
      v53[0] = *MEMORY[0x1E4F31538];
      v53[1] = v6;
      uint64_t v7 = *MEMORY[0x1E4F312F8];
      v53[2] = *MEMORY[0x1E4F31448];
      v53[3] = v7;
      uint64_t v8 = *MEMORY[0x1E4F31360];
      v53[4] = *MEMORY[0x1E4F31410];
      v53[5] = v8;
      uint64_t v9 = *MEMORY[0x1E4F313F8];
      v53[6] = *MEMORY[0x1E4F313E0];
      v53[7] = v9;
      uint64_t v10 = *MEMORY[0x1E4F313A0];
      v53[8] = *MEMORY[0x1E4F314D8];
      v53[9] = v10;
      uint64_t v11 = *MEMORY[0x1E4F31500];
      v53[10] = *MEMORY[0x1E4F31350];
      v53[11] = v11;
      uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:12];
      v33 = v5;
      __int16 v12 = [v5 items];
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v12;
      uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v40)
      {
        uint64_t v39 = *(void *)v47;
        uint64_t v38 = *MEMORY[0x1E4F31528];
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v47 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            uint64_t v15 = [v14 valueForProperty:v38];
            v16 = (void *)v15;
            if (v15)
            {
              v41 = (void *)v15;
              v17 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v18 = v36;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v43;
                do
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v43 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    id v23 = *(id *)(*((void *)&v42 + 1) + 8 * j);
                    id v24 = v17;
                    id v25 = [v14 valueForProperty:v23];
                    if (v25) {
                      [v24 setObject:v25 forKeyedSubscript:v23];
                    }
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
                }
                while (v20);
              }

              uint64_t v26 = [v14 existsInLibrary];
              id v27 = [NSNumber numberWithBool:v26];
              [v17 setObject:v27 forKeyedSubscript:@"ExistsInLibrary"];

              uint64_t v28 = [v14 persistentID];
              uint64_t v29 = [NSNumber numberWithUnsignedLongLong:v28];
              [v17 setObject:v29 forKeyedSubscript:@"PersistentID"];

              v16 = v41;
              uint64_t v30 = [v41 stringValue];
              [v37 setObject:v17 forKeyedSubscript:v30];
            }
          }
          uint64_t v40 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v40);
      }

      unsigned int v5 = v33;
      unsigned int v4 = v34;
    }
    else if (a3)
    {
      +[PGError errorWithCode:-3 description:@"[MemoriesMusic] Photos playlist is missing"];
      id v37 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v37 = 0;
    }
  }
  else
  {
    uint64_t v31 = +[PGLogging memoriesMusicLogging];
    unsigned int v4 = [v31 loggingConnection];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so can not read properties of any cached songs.", buf, 2u);
    }
    id v37 = (id)MEMORY[0x1E4F1CC08];
  }

  return v37;
}

+ (void)removeAllSongsCachedForPhotosWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, void *))a4;
  if ([v5 isCancelledWithProgress:0.0])
  {
    uint64_t v7 = +[PGError errorForCode:-4];
    v6[2](v6, 0, v7);
LABEL_19:

    goto LABEL_20;
  }
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary])
  {
    uint64_t v7 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
    uint64_t v8 = [v7 photosMemoriesPlaylist];
    if (v8)
    {
      uint64_t v9 = +[PGLogging memoriesMusicLogging];
      uint64_t v10 = [v9 loggingConnection];

      os_signpost_id_t v11 = os_signpost_id_generate(v10);
      __int16 v12 = v10;
      double v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RemoveAllSongsFromMusicAudioCache", "", buf, 2u);
      }

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v14 = mach_absolute_time();
      [v8 removeAllItems];
      uint64_t v15 = mach_absolute_time();
      mach_timebase_info v16 = info;
      v17 = v13;
      id v18 = v17;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_END, v11, "RemoveAllSongsFromMusicAudioCache", "", buf, 2u);
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "RemoveAllSongsFromMusicAudioCache";
        __int16 v24 = 2048;
        double v25 = (float)((float)((float)((float)(v15 - v14) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v6[2](v6, 1, 0);
      [v5 isCancelledWithProgress:1.0];
    }
    else
    {
      id v18 = +[PGError errorWithCode:-3 description:@"[MemoriesMusic] Photos playlist is missing"];
      v6[2](v6, 0, v18);
    }

    goto LABEL_19;
  }
  uint64_t v19 = +[PGLogging memoriesMusicLogging];
  uint64_t v20 = [v19 loggingConnection];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not remove all cached songs from Photos memories playlist.", buf, 2u);
  }

  v6[2](v6, 1, 0);
LABEL_20:
}

+ (void)removeSongsCachedForPhotosWithAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  if (![v8 isCancelledWithProgress:0.0])
  {
    os_signpost_id_t v11 = +[PGLogging memoriesMusicLogging];
    __int16 v12 = [v11 loggingConnection];

    if (!+[PGMusicCatalogMonitor canAccessMediaLibrary])
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not remove input cached songs from Photos memories playlist.", buf, 2u);
      }
      v9[2](v9, 1, 0);
      goto LABEL_37;
    }
    double v13 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
    uint64_t v14 = [v13 photosMemoriesPlaylist];
    if (!v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to get photosMemoriesPlaylist from MediaLibrary", buf, 2u);
      }
      __int16 v34 = +[PGError errorWithCode:-3 description:@"[MemoriesMusic] Photos playlist is missing"];
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v34);
      goto LABEL_36;
    }
    v41 = v13;
    long long v42 = v12;
    uint64_t v15 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v55 = (const char *)[v7 count];
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher will remove %lu items from Photos playlist cache", buf, 0xCu);
    }

    mach_timebase_info v16 = v15;
    os_signpost_id_t v17 = os_signpost_id_generate(v16);
    id v18 = v16;
    uint64_t v19 = v18;
    unint64_t v39 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RemoveSongsFromMusicAudioCache", "", buf, 2u);
    }
    os_signpost_id_t spid = v17;
    long long v44 = v19;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v38 = mach_absolute_time();
    id v43 = v7;
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v40 = v14;
    uint64_t v22 = [v14 items];
    if ([v22 count])
    {
      unint64_t v23 = 0;
      uint64_t v24 = *MEMORY[0x1E4F31528];
      do
      {
        double v25 = objc_msgSend(v22, "objectAtIndexedSubscript:", v23, spid);
        uint64_t v26 = [v25 valueForProperty:v24];
        id v27 = [v26 stringValue];
        if (v27 && [v20 containsObject:v27])
        {
          [v21 addObject:v25];
          [v45 addIndex:v23];
        }

        ++v23;
      }
      while (v23 < [v22 count]);
    }
    if (objc_msgSend(v21, "count", spid))
    {
      __int16 v12 = v42;
      if (![v8 isCancelledWithProgress:0.4])
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __95__PGMusicAudioCacher_removeSongsCachedForPhotosWithAdamIDs_progressReporter_completionHandler___block_invoke;
        v46[3] = &unk_1E68EB210;
        long long v49 = v9;
        id v47 = v8;
        uint64_t v50 = v38;
        mach_timebase_info v52 = info;
        long long v48 = v44;
        os_signpost_id_t v51 = spida;
        uint64_t v14 = v40;
        [v40 removeItems:v21 atFilteredIndexes:v45 completionBlock:v46];

        double v13 = v41;
        goto LABEL_35;
      }
      uint64_t v28 = +[PGError errorForCode:-4];
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v28);

      uint64_t v29 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v32 = v44;
      v33 = v32;
      uint64_t v14 = v40;
      if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, spida, "RemoveSongsFromMusicAudioCache", "", buf, 2u);
      }

      double v13 = v41;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
    }
    else
    {
      v9[2](v9, 1, 0);
      [v8 isCancelledWithProgress:1.0];
      uint64_t v29 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      double v35 = v44;
      v33 = v35;
      double v13 = v41;
      __int16 v12 = v42;
      if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, spida, "RemoveSongsFromMusicAudioCache", "", buf, 2u);
      }

      uint64_t v14 = v40;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
    }
    *(_DWORD *)buf = 136315394;
    v55 = "RemoveSongsFromMusicAudioCache";
    __int16 v56 = 2048;
    double v57 = (float)((float)((float)((float)(v29 - v38) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
LABEL_35:

    id v7 = v43;
    __int16 v34 = v44;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  uint64_t v10 = +[PGError errorForCode:-4];
  ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v10);

LABEL_38:
}

void __95__PGMusicAudioCacher_removeSongsCachedForPhotosWithAdamIDs_progressReporter_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[PGError errorWithCode:-1 description:@"[MemoriesMusic] MPMediaPlaylist -removeItems:completionBlock: call failed"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) isCancelledWithProgress:1.0];
  uint64_t v4 = mach_absolute_time();
  uint64_t v5 = *(void *)(a1 + 56);
  unsigned int v7 = *(_DWORD *)(a1 + 72);
  unsigned int v6 = *(_DWORD *)(a1 + 76);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RemoveSongsFromMusicAudioCache", "", (uint8_t *)&v12, 2u);
  }

  os_signpost_id_t v11 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    double v13 = "RemoveSongsFromMusicAudioCache";
    __int16 v14 = 2048;
    double v15 = (float)((float)((float)((float)(v4 - v5) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v12, 0x16u);
  }
}

+ (void)cacheSongAudioForAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = (void (**)(id, void, void *))a5;
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary])
  {
    os_signpost_id_t v11 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
    int v12 = [v11 photosMemoriesPlaylist];
    if (v12)
    {
      [a1 _addSongsWithAdamIDs:v8 toPlaylist:v12 inLibrary:v11 progressReporter:v9 completionHandler:v10];
    }
    else
    {
      double v15 = +[PGError errorWithCode:-3 description:@"[MemoriesMusic] Photos playlist is missing"];
      v10[2](v10, 0, v15);
    }
  }
  else
  {
    double v13 = +[PGLogging memoriesMusicLogging];
    __int16 v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16[0] = 0;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not cache songs in Photos memories playlist.", (uint8_t *)v16, 2u);
    }

    v10[2](v10, 1, 0);
  }
}

@end