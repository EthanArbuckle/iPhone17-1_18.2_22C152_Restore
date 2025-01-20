@interface PGUpNextMusicCurator
+ (id)_appleMusicCurationWithFeaturesByMemory:(id)a3 musicCuratorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)_baseMemoryFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)_flexMusicCurationWithFeaturesByMemory:(id)a3 musicCurationOptions:(id)a4 musicCuratorContext:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)_photosGraphPropertiesForMemory:(id)a3 musicCurationFeatures:(id)a4 appleMusicCuration:(id)a5 flexMusicCuration:(id)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8;
- (BOOL)curateMusicForUpNextMemoriesWithLocalIdentifiers:(id)a3 musicCurationOptions:(id)a4 photoLibrary:(id)a5 managerContext:(id)a6 error:(id *)a7;
- (PGUpNextMusicCurator)initWithLoggingConnection:(id)a3;
- (id)_appleMusicCurationForMemories:(id)a3 curatorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7;
- (id)_flexMusicCurationForMemories:(id)a3 curatorContext:(id)a4 musicCurationOptions:(id)a5 managerContext:(id)a6 progressReporter:(id)a7 error:(id *)a8;
- (id)_musicCurationFeaturesForMemories:(id)a3 musicExtractionContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7;
@end

@implementation PGUpNextMusicCurator

- (void).cxx_destruct
{
}

- (id)_musicCurationFeaturesForMemories:(id)a3 musicExtractionContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self->_loggingConnection;
  os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)v15);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PGUpNextMusicCurator_MusicCurationFeatureExtraction", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v19 = mach_absolute_time();
  *(void *)buf = 0;
  v45 = buf;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__17518;
  v48 = __Block_byref_object_dispose__17519;
  id v49 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__17518;
  v42 = __Block_byref_object_dispose__17519;
  id v43 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__PGUpNextMusicCurator__musicCurationFeaturesForMemories_musicExtractionContext_managerContext_progressReporter_error___block_invoke;
  v32[3] = &unk_1E68E8500;
  id v20 = v11;
  id v33 = v20;
  id v21 = v14;
  id v34 = v21;
  id v22 = v12;
  id v35 = v22;
  v36 = &v38;
  v37 = buf;
  [v13 performSynchronousConcurrentGraphReadUsingBlock:v32];
  if (!*((void *)v45 + 5))
  {
    if (a7)
    {
      v23 = (void *)v39[5];
      if (v23) {
        *a7 = v23;
      }
    }
  }
  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v27 = v18;
  v28 = v27;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v16, "PGUpNextMusicCurator_MusicCurationFeatureExtraction", "", v51, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v51 = 136315394;
    v52 = "PGUpNextMusicCurator_MusicCurationFeatureExtraction";
    __int16 v53 = 2048;
    double v54 = (float)((float)((float)((float)(v24 - v19) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
  }
  id v29 = *((id *)v45 + 5);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  return v29;
}

void __119__PGUpNextMusicCurator__musicCurationFeaturesForMemories_musicExtractionContext_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 graph];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
      v6 = objc_msgSend(*(id *)(a1 + 40), "childProgressReporterForStep:outOf:", v4, objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v8 + 40);
      v9 = +[PGMusicCurator extractMusicCurationFeaturesForMemory:v5 graph:v3 context:v7 progressReporter:v6 error:&obj];
      objc_storeStrong((id *)(v8 + 40), obj);
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(void **)(v10 + 40);
      if (!v9) {
        break;
      }
      [v11 setObject:v9 forKeyedSubscript:v5];

      if (++v4 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_7;
      }
    }
    *(void *)(v10 + 40) = 0;
  }
LABEL_7:
}

- (id)_flexMusicCurationForMemories:(id)a3 curatorContext:(id)a4 musicCurationOptions:(id)a5 managerContext:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = (objc_class *)MEMORY[0x1E4F71F10];
  id v18 = a6;
  id v19 = a3;
  id v20 = (void *)[[v17 alloc] initWithProgressReporter:v16];
  uint64_t v21 = [v20 childProgressReporterToCheckpoint:0.7];
  v50 = [v20 childProgressReporterToCheckpoint:0.95];
  id v22 = [(id)objc_opt_class() flexMusicFeatureExtractionContextWithCuratorContext:v14];
  id v49 = (void *)v21;
  v23 = [(PGUpNextMusicCurator *)self _musicCurationFeaturesForMemories:v19 musicExtractionContext:v22 managerContext:v18 progressReporter:v21 error:a8];

  if (v23)
  {
    v47 = v16;
    id v48 = v15;
    uint64_t v24 = self->_loggingConnection;
    os_signpost_id_t v25 = os_signpost_id_generate((os_log_t)v24);
    v26 = v24;
    v27 = v26;
    unint64_t v28 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PGUpNextMusicCurator_FlexMusicCuration", "", buf, 2u);
    }
    os_signpost_id_t spid = v25;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v46 = mach_absolute_time();
    id v29 = [(id)objc_opt_class() _flexMusicCurationWithFeaturesByMemory:v23 musicCurationOptions:v48 musicCuratorContext:v14 progressReporter:v50 error:a8];
    if (v29)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v29, "count"));
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __128__PGUpNextMusicCurator__flexMusicCurationForMemories_curatorContext_musicCurationOptions_managerContext_progressReporter_error___block_invoke;
      v51[3] = &unk_1E68E6960;
      id v52 = v23;
      id v31 = v30;
      id v53 = v31;
      [v29 enumerateKeysAndObjectsUsingBlock:v51];
      [v47 isCancelledWithProgress:1.0];
      uint64_t v32 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      id v35 = v27;
      v36 = v35;
      if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_FlexMusicCuration", "", buf, 2u);
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "PGUpNextMusicCurator_FlexMusicCuration";
        __int16 v57 = 2048;
        double v58 = (float)((float)((float)((float)(v32 - v46) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v37 = v53;
      id v38 = v31;

      id v15 = v48;
    }
    else
    {
      uint64_t v39 = mach_absolute_time();
      uint32_t v41 = info.numer;
      uint32_t v40 = info.denom;
      v42 = v27;
      id v43 = v42;
      if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v43, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_FlexMusicCuration", "", buf, 2u);
      }

      id v15 = v48;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "PGUpNextMusicCurator_FlexMusicCuration";
        __int16 v57 = 2048;
        double v58 = (float)((float)((float)((float)(v39 - v46) * (float)v41) / (float)v40) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v38 = 0;
    }

    id v16 = v47;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

void __128__PGUpNextMusicCurator__flexMusicCurationForMemories_curatorContext_musicCurationOptions_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  uint64_t v8 = [[PGMusicCurationAndFeatures alloc] initWithFlexMusicCuration:v6 features:v9];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

- (id)_appleMusicCurationForMemories:(id)a3 curatorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x1E4F71F10];
  id v16 = a3;
  v17 = (void *)[[v15 alloc] initWithProgressReporter:v14];
  id v18 = [v17 childProgressReporterToCheckpoint:0.7];
  id v19 = [v17 childProgressReporterToCheckpoint:0.95];
  v47 = [(id)objc_opt_class() appleMusicFeatureExtractionContextWithCuratorContext:v12];
  id v20 = -[PGUpNextMusicCurator _musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:](self, "_musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:", v16);

  if (v20)
  {
    v45 = v14;
    uint64_t v46 = v19;
    v44 = v18;
    uint64_t v21 = self->_loggingConnection;
    os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)v21);
    v23 = v21;
    uint64_t v24 = v23;
    unint64_t v25 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PGUpNextMusicCurator_AppleMusicCuration", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v43 = mach_absolute_time();
    v26 = [(id)objc_opt_class() _appleMusicCurationWithFeaturesByMemory:v20 musicCuratorContext:v12 managerContext:v13 progressReporter:v46 error:a7];
    if (v26)
    {
      os_signpost_id_t spid = v22;
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v26, "count"));
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __108__PGUpNextMusicCurator__appleMusicCurationForMemories_curatorContext_managerContext_progressReporter_error___block_invoke;
      v48[3] = &unk_1E68E6938;
      id v49 = v20;
      id v28 = v27;
      id v50 = v28;
      [v26 enumerateKeysAndObjectsUsingBlock:v48];
      [v45 isCancelledWithProgress:1.0];
      uint64_t v29 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v32 = v24;
      id v33 = v32;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_AppleMusicCuration", "", buf, 2u);
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v53 = "PGUpNextMusicCurator_AppleMusicCuration";
        __int16 v54 = 2048;
        double v55 = (float)((float)((float)((float)(v29 - v43) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v34 = v50;
      id v35 = v28;

      id v14 = v45;
    }
    else
    {
      uint64_t v36 = mach_absolute_time();
      uint32_t v38 = info.numer;
      uint32_t v37 = info.denom;
      uint64_t v39 = v24;
      uint32_t v40 = v39;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v40, OS_SIGNPOST_INTERVAL_END, v22, "PGUpNextMusicCurator_AppleMusicCuration", "", buf, 2u);
      }

      id v14 = v45;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v53 = "PGUpNextMusicCurator_AppleMusicCuration";
        __int16 v54 = 2048;
        double v55 = (float)((float)((float)((float)(v36 - v43) * (float)v38) / (float)v37) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v35 = 0;
    }
    id v18 = v44;

    id v19 = v46;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

void __108__PGUpNextMusicCurator__appleMusicCurationForMemories_curatorContext_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  uint64_t v8 = [[PGMusicCurationAndFeatures alloc] initWithAppleMusicCuration:v6 features:v9];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)curateMusicForUpNextMemoriesWithLocalIdentifiers:(id)a3 musicCurationOptions:(id)a4 photoLibrary:(id)a5 managerContext:(id)a6 error:(id *)a7
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = v13;
  id v16 = a5;
  id v125 = a6;
  v17 = self->_loggingConnection;
  os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)v17);
  id v19 = v17;
  id v20 = v19;
  unint64_t v118 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PGUpNextMusicCurator", "", buf, 2u);
  }
  os_signpost_id_t v113 = v18;
  v124 = v20;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v115 = mach_absolute_time();
  v123 = v14;
  v121 = v16;
  v120 = [(id)objc_opt_class() _baseMemoryFetchOptionsWithPhotoLibrary:v16];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F39160], "fetchAssetCollectionsWithLocalIdentifiers:options:", v12);
  os_signpost_id_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v139 objects:v149 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v140 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v139 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v22 addObject:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v139 objects:v149 count:16];
    }
    while (v25);
  }

  if (![v22 count])
  {
    char v74 = 1;
    v75 = v125;
    goto LABEL_100;
  }
  uint64_t v29 = [MEMORY[0x1E4F71F08] ignoreProgress];
  uint64_t v30 = [v125 musicCuratorContextWithCurationOptions:v15 error:a7];
  v114 = (void *)v30;
  if (!v30)
  {
    v76 = (void *)v29;
    uint64_t v77 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v80 = v124;
    v81 = v80;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v81, OS_SIGNPOST_INTERVAL_END, v18, "PGUpNextMusicCurator", "", buf, 2u);
    }

    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      __int16 v147 = 2048;
      double v148 = (float)((float)((float)((float)(v77 - v115) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v81, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    char v74 = 0;
    v75 = v125;
    goto LABEL_99;
  }
  uint64_t v31 = v30;
  uint64_t v32 = v123;
  v130 = [(PGUpNextMusicCurator *)v123 _appleMusicCurationForMemories:v22 curatorContext:v30 managerContext:v125 progressReporter:v29 error:a7];
  if (!v130)
  {
    loggingConnection = v123->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      if (a7) {
        v104 = (__CFString *)*a7;
      }
      else {
        v104 = @"no error";
      }
      *(_DWORD *)buf = 138412290;
      v146 = (const char *)v104;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to curate music for memories, error: %@", buf, 0xCu);
    }
    v76 = (void *)v29;
    uint64_t v83 = mach_absolute_time();
    uint32_t v84 = info.numer;
    uint32_t v85 = info.denom;
    v86 = v124;
    v87 = v86;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v87, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", "", buf, 2u);
    }

    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      __int16 v147 = 2048;
      double v148 = (float)((float)((float)((float)(v83 - v115) * (float)v84) / (float)v85) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    char v74 = 0;
    v75 = v125;
    goto LABEL_98;
  }
  uint64_t v33 = [(PGUpNextMusicCurator *)v123 _flexMusicCurationForMemories:v22 curatorContext:v31 musicCurationOptions:v15 managerContext:v125 progressReporter:v29 error:a7];
  id v34 = v123->_loggingConnection;
  v129 = (void *)v33;
  if (!v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      if (a7) {
        v105 = (__CFString *)*a7;
      }
      else {
        v105 = @"no error";
      }
      *(_DWORD *)buf = 138412290;
      v146 = (const char *)v105;
      _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to curate flex music for memories, error: %@", buf, 0xCu);
    }
    v76 = (void *)v29;
    uint64_t v88 = mach_absolute_time();
    uint32_t v89 = info.numer;
    uint32_t v90 = info.denom;
    v91 = v124;
    v92 = v91;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v92, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", "", buf, 2u);
    }

    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      __int16 v147 = 2048;
      double v148 = (float)((float)((float)((float)(v88 - v115) * (float)v89) / (float)v90) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v92, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    char v74 = 0;
    v75 = v125;
    goto LABEL_97;
  }
  v110 = (void *)v29;
  id v35 = v34;
  os_signpost_id_t v36 = os_signpost_id_generate(v35);
  uint32_t v37 = v35;
  uint32_t v38 = v37;
  unint64_t v109 = v36 - 1;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PGUpNextMusicCurator_BuildAndPersistRecipe", "", buf, 2u);
  }
  os_signpost_id_t spid = v36;
  id v111 = v12;
  v112 = v38;

  mach_timebase_info v138 = 0;
  mach_timebase_info(&v138);
  uint64_t v108 = mach_absolute_time();
  v117 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  v116 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v39 = v22;
  uint64_t v128 = [v39 countByEnumeratingWithState:&v134 objects:v144 count:16];
  if (!v128)
  {

    goto LABEL_85;
  }
  id obj = v39;
  id v107 = v15;
  uint64_t v127 = *(void *)v135;
  char v122 = 1;
  v126 = a7;
  do
  {
    uint64_t v40 = 0;
    do
    {
      if (*(void *)v135 != v127) {
        objc_enumerationMutation(obj);
      }
      uint32_t v41 = *(void **)(*((void *)&v134 + 1) + 8 * v40);
      v42 = [v130 objectForKeyedSubscript:v41];
      uint64_t v43 = [v42 appleMusicCuration];

      v44 = [v129 objectForKeyedSubscript:v41];
      v45 = [v44 flexMusicCuration];

      uint64_t v46 = [v130 objectForKeyedSubscript:v41];
      v47 = [v46 features];

      if (v43) {
        BOOL v48 = v45 == 0;
      }
      else {
        BOOL v48 = 1;
      }
      if (!v48 && v47 != 0)
      {
        __int16 v54 = [(id)objc_opt_class() _photosGraphPropertiesForMemory:v41 musicCurationFeatures:v47 appleMusicCuration:v43 flexMusicCuration:v45 isAppleMusicSubscriber:v32->_isAppleMusicSubscriber error:a7];
        uint64_t v55 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v54 requiringSecureCoding:1 error:a7];
        if (v55)
        {
          id v53 = (void *)v55;
          [v117 setObject:v55 forKeyedSubscript:v41];
          [v116 setObject:v54 forKeyedSubscript:v41];
          int v56 = 0;
LABEL_41:

          a7 = v126;
          goto LABEL_42;
        }
        __int16 v57 = v32->_loggingConnection;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          uint64_t v60 = [v41 uuid];
          v61 = (void *)v60;
          *(double *)&v62 = COERCE_DOUBLE(@"no error");
          if (v126) {
            v62 = *(__CFString **)v126;
          }
          *(_DWORD *)buf = 138412546;
          v146 = (const char *)v60;
          __int16 v147 = 2112;
          double v148 = *(double *)&v62;
          _os_log_error_impl(&dword_1D1805000, v57, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Unable to create photosGraphData for memory (%@), error: %@", buf, 0x16u);
        }
        id v53 = 0;
        char v122 = 0;
LABEL_40:
        int v56 = 4;
        goto LABEL_41;
      }
      id v50 = v32->_loggingConnection;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        double v58 = v50;
        uint64_t v59 = [v41 uuid];
        *(_DWORD *)buf = 138412290;
        v146 = v59;
        _os_log_error_impl(&dword_1D1805000, v58, OS_LOG_TYPE_ERROR, "[MemoriesMusic] one or both music curations or music features missing for memory (%@)", buf, 0xCu);

        a7 = v126;
        if (v126)
        {
LABEL_35:
          v51 = a7;
          id v52 = NSString;
          __int16 v54 = [v41 uuid];
          id v53 = [v52 stringWithFormat:@"One or both music curations missing for asset collection (%@)", v54];
          +[PGError errorWithCode:-1 description:v53];
          char v122 = 0;
          id *v51 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = v123;
          goto LABEL_40;
        }
      }
      else if (a7)
      {
        goto LABEL_35;
      }
      char v122 = 0;
      int v56 = 4;
LABEL_42:

      if (v56) {
        goto LABEL_51;
      }
      ++v40;
    }
    while (v128 != v40);
    uint64_t v63 = [obj countByEnumeratingWithState:&v134 objects:v144 count:16];
    uint64_t v128 = v63;
  }
  while (v63);
LABEL_51:

  id v15 = v107;
  if ((v122 & 1) == 0)
  {
    uint64_t v64 = mach_absolute_time();
    uint32_t v65 = v138.numer;
    uint32_t v66 = v138.denom;
    v67 = v112;
    v68 = v67;
    if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v68, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_BuildAndPersistRecipe", "", buf, 2u);
    }

    id v12 = v111;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator_BuildAndPersistRecipe";
      __int16 v147 = 2048;
      double v148 = (float)((float)((float)((float)(v64 - v108) * (float)v65) / (float)v66) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v68, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    uint64_t v69 = mach_absolute_time();
    uint32_t v70 = info.numer;
    uint32_t v71 = info.denom;
    v72 = v124;
    v73 = v72;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v73, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", "", buf, 2u);
    }

    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      __int16 v147 = 2048;
      double v148 = (float)((float)((float)((float)(v69 - v115) * (float)v70) / (float)v71) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v73, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    char v74 = 0;
    goto LABEL_96;
  }
LABEL_85:
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __128__PGUpNextMusicCurator_curateMusicForUpNextMemoriesWithLocalIdentifiers_musicCurationOptions_photoLibrary_managerContext_error___block_invoke;
  v131[3] = &unk_1E68EED30;
  id v132 = v117;
  id v133 = v116;
  char v74 = [v121 performChangesAndWait:v131 error:a7];
  uint64_t v93 = mach_absolute_time();
  uint32_t v94 = v138.numer;
  uint32_t v95 = v138.denom;
  v96 = v112;
  v97 = v96;
  if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v97, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_BuildAndPersistRecipe", "", buf, 2u);
  }

  id v12 = v111;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "PGUpNextMusicCurator_BuildAndPersistRecipe";
    __int16 v147 = 2048;
    double v148 = (float)((float)((float)((float)(v93 - v108) * (float)v94) / (float)v95) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v97, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v98 = mach_absolute_time();
  uint32_t v99 = info.numer;
  uint32_t v100 = info.denom;
  v101 = v124;
  v102 = v101;
  if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v102, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", "", buf, 2u);
  }

  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "PGUpNextMusicCurator";
    __int16 v147 = 2048;
    double v148 = (float)((float)((float)((float)(v98 - v115) * (float)v99) / (float)v100) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v102, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

LABEL_96:
  v75 = v125;
  v76 = v110;
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
  return v74;
}

void __128__PGUpNextMusicCurator_curateMusicForUpNextMemoriesWithLocalIdentifiers_musicCurationOptions_photoLibrary_managerContext_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (void)v11);
        id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
        uint64_t v10 = [MEMORY[0x1E4F39170] changeRequestForMemory:v7];
        +[PGMemoryPhotoKitPersister setStoryColorGradeKindFromPhotosGraphProperties:v9 onMemoryChangeRequest:v10];
        [v10 setPhotosGraphData:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (PGUpNextMusicCurator)initWithLoggingConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGUpNextMusicCurator;
  id v6 = [(PGUpNextMusicCurator *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_loggingConnection, a3);
    uint64_t v8 = [MEMORY[0x1E4F71F08] ignoreProgress];
    v7->_isAppleMusicSubscriber = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:v8];
  }
  return v7;
}

+ (id)_baseMemoryFetchOptionsWithPhotoLibrary:(id)a3
{
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  [v3 setWantsIncrementalChangeDetails:0];
  [v3 setIncludeLocalMemories:1];
  [v3 setIncludePendingMemories:1];
  return v3;
}

+ (id)_photosGraphPropertiesForMemory:(id)a3 musicCurationFeatures:(id)a4 appleMusicCuration:(id)a5 flexMusicCuration:(id)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a6;
  id v15 = a5;
  uint64_t v16 = [a4 shouldAvoidColorGrading];
  v17 = +[PGStoryRecipeBuilder storyRecipeForMemory:v13 appleMusicCuration:v15 flexMusicCuration:v14 shouldAvoidColorGrading:v16 isAppleMusicSubscriber:v9 error:a8];

  if (v17
    && (id v18 = objc_alloc_init(MEMORY[0x1E4F8CDB8]),
        [v18 archivedDataWithRecipe:v17],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v18,
        v19))
  {
    id v20 = [v13 photosGraphProperties];
    uint64_t v21 = (void *)[v20 mutableCopy];
    os_signpost_id_t v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v24 = v23;

    [v24 setObject:v19 forKeyedSubscript:@"storyRecipeData"];
    if ((v16 & 1) == 0)
    {
      uint64_t v25 = [v17 currentStyle];
      uint64_t v26 = [v25 originalColorGradeCategory];

      if (v26) {
        [v24 setObject:v26 forKeyedSubscript:@"storyColorGradeCategory"];
      }
    }
  }
  else if (a8)
  {
    +[PGError errorWithCode:-1 description:@"Unable to archive story recipe"];
    uint64_t v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)_flexMusicCurationWithFeaturesByMemory:(id)a3 musicCurationOptions:(id)a4 musicCuratorContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    id v15 = [v11 allKeys];
    uint64_t v16 = [v15 firstObject];
    v17 = [v16 photoLibrary];

    id v18 = [MEMORY[0x1E4F1C9C8] date];
    id v19 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v17];
    id v20 = [v12 recentlyUsedBundledSongIDs];
    [v19 addSongIDs:v20 date:v18];

    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__17518;
    uint64_t v43 = __Block_byref_object_dispose__17519;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    os_signpost_id_t v36 = __Block_byref_object_copy__17518;
    uint32_t v37 = __Block_byref_object_dispose__17519;
    id v38 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __127__PGUpNextMusicCurator__flexMusicCurationWithFeaturesByMemory_musicCurationOptions_musicCuratorContext_progressReporter_error___block_invoke;
    v26[3] = &unk_1E68E6910;
    id v21 = v19;
    id v27 = v21;
    id v28 = v13;
    id v29 = v14;
    uint64_t v31 = &v33;
    uint64_t v32 = &v39;
    id v22 = v18;
    id v30 = v22;
    [v11 enumerateKeysAndObjectsUsingBlock:v26];
    if (a7)
    {
      id v23 = (void *)v34[5];
      if (v23) {
        *a7 = v23;
      }
    }
    id v24 = (id)v40[5];

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

void __127__PGUpNextMusicCurator__flexMusicCurationWithFeaturesByMemory_musicCurationOptions_musicCuratorContext_progressReporter_error___block_invoke(uint64_t *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 moodKeywords];
  objc_super v10 = (void *)v9;
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v11 = (void *)v9;
  }
  id v12 = v11;

  id v13 = [PGFlexMusicCurationParameters alloc];
  uint64_t v14 = [v7 suggestedMood];
  uint64_t v15 = a1[4];
  uint64_t v16 = [v7 uuid];
  v17 = [(PGFlexMusicCurationParameters *)v13 initWithMood:v14 moodKeywords:v12 recentlyUsedSongs:v15 entityUUID:v16 useMoodKeywords:0 features:v8 musicCuratorContext:a1[5]];

  uint64_t v18 = a1[6];
  uint64_t v19 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v19 + 40);
  id v20 = +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:v17 progressReporter:v18 error:&obj];
  objc_storeStrong((id *)(v19 + 40), obj);
  if (v20)
  {
    [(id)a1[4] addFlexMusicCuration:v20 date:a1[7]];
    [*(id *)(*(void *)(a1[9] + 8) + 40) setObject:v20 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v21 = *(void *)(a1[9] + 8);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;

    *a4 = 1;
  }
}

+ (id)_appleMusicCurationWithFeaturesByMemory:(id)a3 musicCuratorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy__17518;
    os_signpost_id_t v36 = __Block_byref_object_dispose__17519;
    id v37 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__17518;
    id v30 = __Block_byref_object_dispose__17519;
    id v31 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __122__PGUpNextMusicCurator__appleMusicCurationWithFeaturesByMemory_musicCuratorContext_managerContext_progressReporter_error___block_invoke;
    v20[3] = &unk_1E68E68E8;
    id v21 = v12;
    id v22 = v14;
    id v24 = &v26;
    uint64_t v25 = &v32;
    id v16 = v15;
    id v23 = v16;
    [v11 enumerateKeysAndObjectsUsingBlock:v20];
    if (a7)
    {
      v17 = (void *)v27[5];
      if (v17) {
        *a7 = v17;
      }
    }
    id v18 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F1CC08];
  }

  return v18;
}

void __122__PGUpNextMusicCurator__appleMusicCurationWithFeaturesByMemory_musicCuratorContext_managerContext_progressReporter_error___block_invoke(uint64_t *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = +[PGMusicCurator curateMusicForFeatures:a3 context:v8 progressReporter:v9 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    id v12 = [(id)a1[4] recentlyUsedSongs];
    [v12 addMusicCuration:v11 date:a1[6]];

    [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v13 = *(void *)(a1[8] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    *a4 = 1;
  }
}

@end