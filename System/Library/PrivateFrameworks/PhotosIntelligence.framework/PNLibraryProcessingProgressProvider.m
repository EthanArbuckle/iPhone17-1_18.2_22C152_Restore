@interface PNLibraryProcessingProgressProvider
+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)faceProcessingProgressForLibrary:(SEL)a3;
+ (void)requestHighlightEnrichmentProgressForLibrary:(id)a3 result:(id)a4;
+ (void)requestProcessingProgressForLibrary:(id)a3 result:(id)a4;
+ (void)requestSyndicationProgressForLibrary:(id)a3 result:(id)a4;
@end

@implementation PNLibraryProcessingProgressProvider

+ (void)requestSyndicationProgressForLibrary:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _AnalysisProgressQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__PNLibraryProcessingProgressProvider_requestSyndicationProgressForLibrary_result___block_invoke;
  v10[3] = &unk_26544F3F0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __83__PNLibraryProcessingProgressProvider_requestSyndicationProgressForLibrary_result___block_invoke(uint64_t a1)
{
  v51[3] = *MEMORY[0x263EF8340];
  v2 = &_os_log_internal;
  id v3 = &_os_log_internal;
  os_signpost_id_t v4 = os_signpost_id_generate(v2);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v5 = v2;
  unint64_t v31 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SyndicationReport", "", buf, 2u);
  }
  os_signpost_id_t spid = v4;

  uint64_t v29 = mach_absolute_time();
  uint64_t v33 = a1;
  id v6 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  uint64_t v7 = *MEMORY[0x263F14FF0];
  v51[0] = *MEMORY[0x263F15028];
  v51[1] = v7;
  v51[2] = *MEMORY[0x263F14FC0];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
  [v6 setFetchPropertySets:v8];

  id v9 = +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  [v6 setInternalPredicate:v9];

  [v6 setIncludeGuestAssets:1];
  [v6 setWantsIncrementalChangeDetails:0];
  v32 = v6;
  v10 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v6];
  uint64_t v30 = [v10 count];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v34 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v11);
        }
        switch([*(id *)(*((void *)&v37 + 1) + 8 * i) syndicationEligibility])
        {
          case -6:
            ++v36;
            break;
          case -5:
            ++v35;
            break;
          case -4:
            ++v34;
            break;
          case -3:
            ++v14;
            break;
          case -2:
            ++v15;
            break;
          case -1:
            ++v16;
            break;
          case 0:
            ++v17;
            break;
          case 1:
            ++v18;
            break;
          case 2:
            ++v19;
            break;
          default:
            continue;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v34 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }

  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v25 = &_os_log_internal;
  if (v31 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, spid, "SyndicationReport", "", buf, 2u);
  }
  v26 = &_os_log_internal;

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "SyndicationReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v22 - v29) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v27 = *(void (**)(void))(*(void *)(v33 + 40) + 16);
  *(void *)buf = v30;
  *(void *)&buf[8] = v36;
  *(void *)&buf[16] = v35;
  uint64_t v43 = v34;
  uint64_t v44 = v14;
  uint64_t v45 = v15;
  uint64_t v46 = v16;
  uint64_t v47 = v17;
  uint64_t v48 = v18;
  uint64_t v49 = v19;
  v27();
}

+ (void)requestHighlightEnrichmentProgressForLibrary:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _AnalysisProgressQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__PNLibraryProcessingProgressProvider_requestHighlightEnrichmentProgressForLibrary_result___block_invoke;
  v10[3] = &unk_26544F3F0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __91__PNLibraryProcessingProgressProvider_requestHighlightEnrichmentProgressForLibrary_result___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = &_os_log_internal;
  id v3 = &_os_log_internal;
  os_signpost_id_t v4 = os_signpost_id_generate(v2);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v5 = v2;
  unint64_t v6 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HighlightEnrichmentReport", "", buf, 2u);
  }
  os_signpost_id_t spid = v4;

  uint64_t v28 = mach_absolute_time();
  uint64_t v7 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  id v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"category", 1);
  [v7 setPredicate:v8];

  [v7 setWantsIncrementalChangeDetails:0];
  uint64_t v29 = v7;
  id v9 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v7];
  unint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v27 = a1;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v9 objectAtIndexedSubscript:v11];
      switch([v17 enrichmentState])
      {
        case 0u:
          ++v12;
          break;
        case 1u:
          ++v13;
          break;
        case 2u:
          ++v14;
          break;
        case 3u:
          ++v15;
          break;
        case 4u:
          ++v16;
          break;
        default:
          break;
      }

      ++v11;
    }
    while (v10 != v11);
    double v18 = (double)v16 * 100.0 / (double)v10;
    double v19 = (double)(v15 + v16 + v14 + v13) * 100.0 / (double)v10;
    a1 = v27;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    double v18 = 0.0;
    double v19 = 0.0;
  }
  uint64_t v20 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v23 = &_os_log_internal;
  if (v6 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, spid, "HighlightEnrichmentReport", "", buf, 2u);
  }
  v24 = &_os_log_internal;

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "HighlightEnrichmentReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v20 - v28) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  *(void *)buf = v10;
  *(void *)&buf[8] = v16;
  *(void *)&buf[16] = v15;
  uint64_t v32 = v14;
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  double v35 = v18;
  double v36 = v19;
  v25();
}

+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)faceProcessingProgressForLibrary:(SEL)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var4 = 0.0;
  unint64_t v6 = &_os_log_internal;
  id v7 = &_os_log_internal;
  os_signpost_id_t v8 = os_signpost_id_generate(v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v9 = v6;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AllowedForAnalysisReport", "", buf, 2u);
  }
  unint64_t v10 = (void *)&_os_log_internal;

  uint64_t v11 = mach_absolute_time();
  int64_t v12 = [v5 fetchCountOfAssetsWithAllowedForAnalysis];
  retstr->var0 = v12;
  uint64_t v13 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v16 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v8, "AllowedForAnalysisReport", "", buf, 2u);
  }
  uint64_t v17 = &_os_log_internal;

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v35 = "AllowedForAnalysisReport";
    __int16 v36 = 2048;
    double v37 = (float)((float)((float)((float)(v13 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  double v18 = &_os_log_internal;
  id v19 = &_os_log_internal;
  os_signpost_id_t v20 = os_signpost_id_generate(v18);
  mach_timebase_info v32 = 0;
  mach_timebase_info(&v32);
  v21 = v18;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v20, "FaceAnalysisReport", "", buf, 2u);
  }

  uint64_t v22 = mach_absolute_time();
  int64_t v23 = [v5 fetchCountOfAssetsWithFacesProcessedToLatestVersion];
  retstr->var1 = v23;
  if (v12)
  {
    retstr->var3 = (double)(unint64_t)v23 * 100.0 / (double)(unint64_t)v12;
    int64_t v24 = [v5 fetchCountOfAssetsWithFacesProcessedToAnyVersion];
    double v25 = (double)(unint64_t)v24 * 100.0 / (double)(unint64_t)v12;
  }
  else
  {
    retstr->var3 = 0.0;
    int64_t v24 = [v5 fetchCountOfAssetsWithFacesProcessedToAnyVersion];
    double v25 = 0.0;
  }
  retstr->var2 = v24;
  retstr->var4 = v25;
  uint64_t v26 = mach_absolute_time();
  mach_timebase_info v27 = v32;
  id v28 = &_os_log_internal;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v20, "FaceAnalysisReport", "", buf, 2u);
  }
  uint64_t v29 = &_os_log_internal;

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v35 = "FaceAnalysisReport";
    __int16 v36 = 2048;
    double v37 = (float)((float)((float)((float)(v26 - v22) * (float)v27.numer) / (float)v27.denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v30 = (void *)&_os_log_internal;

  return result;
}

+ (void)requestProcessingProgressForLibrary:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _AnalysisProgressQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__PNLibraryProcessingProgressProvider_requestProcessingProgressForLibrary_result___block_invoke;
  v10[3] = &unk_26544F3F0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __82__PNLibraryProcessingProgressProvider_requestProcessingProgressForLibrary_result___block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v2 = &_os_log_internal;
  id v3 = &_os_log_internal;
  os_signpost_id_t v4 = os_signpost_id_generate(v2);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v5 = v2;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AllowedForAnalysisReport", "", buf, 2u);
  }
  id v6 = (void *)&_os_log_internal;

  uint64_t v7 = mach_absolute_time();
  unint64_t v8 = [*(id *)(a1 + 32) fetchCountOfAssetsWithAllowedForAnalysis];
  unint64_t v9 = [*(id *)(a1 + 32) fetchCountOfVideosWithAllowedForAnalysis];
  uint64_t v10 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v13 = v6;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v4, "AllowedForAnalysisReport", "", buf, 2u);
  }
  uint64_t v14 = &_os_log_internal;

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AllowedForAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v10 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v15 = v14;
  os_signpost_id_t v16 = os_signpost_id_generate(v14);
  mach_timebase_info v68 = 0;
  mach_timebase_info(&v68);
  uint64_t v17 = v14;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SceneAnalysisReport", "", buf, 2u);
  }

  uint64_t v18 = mach_absolute_time();
  unint64_t v19 = [*(id *)(a1 + 32) fetchCountOfAssetsWithScenesProcessed];
  unint64_t v64 = v19;
  if (v8) {
    double v20 = (double)v19 * 100.0 / (double)v8;
  }
  else {
    double v20 = 0.0;
  }
  uint64_t v21 = mach_absolute_time();
  uint32_t v23 = v68.numer;
  uint32_t v22 = v68.denom;
  id v24 = &_os_log_internal;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v16, "SceneAnalysisReport", "", buf, 2u);
  }
  double v25 = &_os_log_internal;

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "SceneAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v21 - v18) * (float)v23) / (float)v22) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v26 = v25;
  os_signpost_id_t v27 = os_signpost_id_generate(v25);
  mach_timebase_info v67 = 0;
  mach_timebase_info(&v67);
  id v28 = v25;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v27, "FaceAnalysisReport", "", buf, 2u);
  }

  uint64_t v29 = mach_absolute_time();
  unint64_t v30 = [*(id *)(a1 + 32) fetchCountOfAssetsWithFacesProcessedToLatestVersion];
  unint64_t v31 = v30;
  if (v8) {
    double v32 = (double)v30 * 100.0 / (double)v8;
  }
  else {
    double v32 = 0.0;
  }
  uint64_t v33 = mach_absolute_time();
  uint32_t v35 = v67.numer;
  uint32_t v34 = v67.denom;
  id v36 = &_os_log_internal;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v27, "FaceAnalysisReport", "", buf, 2u);
  }
  double v37 = &_os_log_internal;

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "FaceAnalysisReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v33 - v29) * (float)v35) / (float)v34) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v38 = v37;
  os_signpost_id_t v39 = os_signpost_id_generate(v37);
  mach_timebase_info v66 = 0;
  mach_timebase_info(&v66);
  long long v40 = v37;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v39, "MediaAnalysisImageReport", "", buf, 2u);
  }

  uint64_t v41 = mach_absolute_time();
  unint64_t v42 = [*(id *)(a1 + 32) fetchCountOfAssetsWithMediaAnalysisImageProcessed];
  unint64_t v43 = v42;
  if (v8) {
    double v44 = (double)v42 * 100.0 / (double)v8;
  }
  else {
    double v44 = 0.0;
  }
  uint64_t v45 = mach_absolute_time();
  uint32_t v47 = v66.numer;
  uint32_t v46 = v66.denom;
  id v48 = &_os_log_internal;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v39, "MediaAnalysisImageReport", "", buf, 2u);
  }
  uint64_t v49 = &_os_log_internal;

  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MediaAnalysisImageReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v45 - v41) * (float)v47) / (float)v46) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v50 = v49;
  os_signpost_id_t v51 = os_signpost_id_generate(v49);
  mach_timebase_info v65 = 0;
  mach_timebase_info(&v65);
  v52 = v49;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, v51, "MediaAnalysisVideoReport", "", buf, 2u);
  }

  uint64_t v53 = mach_absolute_time();
  unint64_t v54 = [*(id *)(a1 + 32) fetchCountOfAssetsWithMediaAnalysisVideoProcessed];
  unint64_t v55 = v54;
  if (v9) {
    double v56 = (double)v54 * 100.0 / (double)v9;
  }
  else {
    double v56 = 0.0;
  }
  uint64_t v57 = mach_absolute_time();
  uint32_t v59 = v65.numer;
  uint32_t v58 = v65.denom;
  id v60 = &_os_log_internal;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, v51, "MediaAnalysisVideoReport", "", buf, 2u);
  }
  v61 = &_os_log_internal;

  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MediaAnalysisVideoReport";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v57 - v53) * (float)v59) / (float)v58) / 1000000.0);
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v62 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  *(void *)buf = v8;
  *(void *)&buf[8] = v9;
  *(void *)&buf[16] = v64;
  unint64_t v71 = v31;
  unint64_t v72 = v43;
  unint64_t v73 = v55;
  double v74 = v20;
  double v75 = v32;
  double v76 = v44;
  double v77 = v56;
  v62();
  v63 = (void *)&_os_log_internal;
}

@end