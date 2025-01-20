@interface PGPeopleWallpaperSuggester
+ (BOOL)enableSettlingEffect;
+ (BOOL)filtersForTopSuggestions;
+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6;
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
- (PGPeopleWallpaperSuggester)initWithSession:(id)a3;
- (PGPeopleWallpaperSuggesterFilteringContext)primaryFilteringContext;
- (PGPeopleWallpaperSuggesterFilteringContext)secondaryFilteringContext;
- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)_buildSuggestersWithProgress:(id)a3;
- (void)setPrimaryFilteringContext:(id)a3;
- (void)setSecondaryFilteringContext:(id)a3;
- (void)setupFilteringContexts;
@end

@implementation PGPeopleWallpaperSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_suggesterByPersonLocalIdentifier, 0);
}

- (void)setSecondaryFilteringContext:(id)a3
{
}

- (PGPeopleWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
}

- (PGPeopleWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3
{
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  v6 = [v5 curationContext];
  v7 = [v5 loggingConnection];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  primaryFilteringContext = self->_primaryFilteringContext;
  if (primaryFilteringContext)
  {
    v10 = primaryFilteringContext;
  }
  else
  {
    v11 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
    uint64_t v12 = [(id)objc_opt_class() filtersForTopSuggestions];
    int64_t v13 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)self->_primaryFilteringContext orientation];
    v10 = [(PGPeopleWallpaperSuggesterFilteringContext *)v11 initForTopPeople:v12 withDictionary:MEMORY[0x1E4F1CC08] orientation:v13];
  }
  v14 = v10;
  v15 = [v5 workingContext];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke;
  v24[3] = &unk_1E68ED368;
  id v25 = v6;
  id v26 = v7;
  v27 = v14;
  id v29 = v4;
  id v16 = v8;
  id v28 = v16;
  id v17 = v4;
  v18 = v14;
  id v19 = v7;
  id v20 = v6;
  [v15 performSynchronousConcurrentGraphReadUsingBlock:v24];

  v21 = v28;
  id v22 = v16;

  return v22;
}

void __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PGPeopleWallpaperSuggesterPersonImportanceAnalyzer alloc];
  v5 = [v3 graph];

  v6 = [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)v4 initWithGraph:v5 curationContext:*(void *)(a1 + 32) loggingConnection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) normalizedDeviationForVeryImportantPersons];
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForVeryImportantPersons:](v6, "setNormalizedDeviationForVeryImportantPersons:");
  [*(id *)(a1 + 48) normalizedDeviationForImportantPersons];
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForImportantPersons:](v6, "setNormalizedDeviationForImportantPersons:");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setFavoritePersonsAreVIPs:](v6, "setFavoritePersonsAreVIPs:", [*(id *)(a1 + 48) favoritePersonsAreVIPs]);
  v7 = [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)v6 personInformationsWithProgress:*(void *)(a1 + 64)];
  uint64_t v8 = [*(id *)(a1 + 48) minimumPersonImportance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke_2;
  v9[3] = &unk_1E68ED340;
  uint64_t v11 = v8;
  id v10 = *(id *)(a1 + 56);
  [v7 enumerateObjectsUsingBlock:v9];
}

void __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 importance] >= *(void *)(a1 + 40) && objc_msgSend(v6, "importance") != 3)
  {
    id v3 = [v6 personLocalIdentifier];
    id v4 = [v6 dupedPersonLocalIdentifiers];
    v5 = [v4 setByAddingObject:v3];

    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v3];
  }
}

- (void)_buildSuggestersWithProgress:(id)a3
{
  buf[5] = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v4 = _Block_copy(v49);
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v72 = 0;
  v73 = (double *)&v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  if (!v4
    || (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v73[3] < 0.01)
    || (v73[3] = v5,
        LOBYTE(v80) = 0,
        (*((void (**)(void *, int *, double))v4 + 2))(v4, &v80, 0.0),
        char v6 = *((unsigned char *)v77 + 24) | v80,
        (*((unsigned char *)v77 + 24) = v6) == 0))
  {
    v7 = [(PGAbstractSuggester *)self session];
    v48 = [v7 curationContext];
    v47 = v7;
    uint64_t v8 = [v7 loggingConnection];
    os_signpost_id_t v9 = os_signpost_id_generate(v8);
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGPeopleWallpaperSuggesterAnalyzer", "", (uint8_t *)buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v12 = mach_absolute_time();
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke;
    v66[3] = &unk_1E68F03F8;
    id v13 = v4;
    id v67 = v13;
    v68 = &v72;
    v69 = &v76;
    uint64_t v70 = 0x3F847AE147AE147BLL;
    v50 = [(PGPeopleWallpaperSuggester *)self personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:v66];
    if (*((unsigned char *)v77 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_41:

        goto LABEL_42;
      }
      buf[0] = 0x10804000202;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v14 = MEMORY[0x1E4F14500];
LABEL_12:
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
      goto LABEL_41;
    }
    uint64_t v15 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v18 = v11;
    id v19 = v18;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGPeopleWallpaperSuggesterAnalyzer", "", (uint8_t *)buf, 2u);
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 136315394;
      *(void *)((char *)buf + 4) = "PGPeopleWallpaperSuggesterAnalyzer";
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v15 - v12) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
    }
    if (v4)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v73[3] >= 0.01)
      {
        v73[3] = Current;
        LOBYTE(v80) = 0;
        (*((void (**)(id, int *, double))v13 + 2))(v13, &v80, 0.5);
        char v21 = *((unsigned char *)v77 + 24) | v80;
        *((unsigned char *)v77 + 24) = v21;
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          buf[0] = 0x10B04000202;
          LOWORD(buf[1]) = 2080;
          *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
          v14 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
      }
    }
    id v22 = v19;
    os_signpost_id_t v23 = os_signpost_id_generate(v22);
    v24 = v22;
    id v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PGPeopleWallpaperSuggesterCandidateComputation", "", (uint8_t *)buf, 2u);
    }

    mach_timebase_info v65 = 0;
    mach_timebase_info(&v65);
    uint64_t v43 = mach_absolute_time();
    unint64_t v44 = v23 - 1;
    buf[0] = 0;
    buf[1] = buf;
    buf[2] = 0x2020000000;
    buf[3] = 0x3FE0000000000000;
    unint64_t v26 = [v50 count];
    id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v50, "count"));
    os_signpost_id_t spid = v23;
    v27 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", [(id)objc_opt_class() filtersForTopSuggestions]);
    id v28 = [v47 forbiddenAssetUUIDs];
    double v29 = 0.5 / (double)v26;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_284;
    v52[3] = &unk_1E68ED318;
    id v53 = v48;
    v30 = v25;
    v54 = v30;
    v55 = self;
    id v45 = v27;
    id v56 = v45;
    id v31 = v28;
    id v57 = v31;
    id v32 = v13;
    id v59 = v32;
    v60 = &v72;
    uint64_t v63 = 0x3F847AE147AE147BLL;
    double v64 = v29;
    v61 = buf;
    v62 = &v76;
    id v33 = obj;
    id v58 = v33;
    [v50 enumerateKeysAndObjectsUsingBlock:v52];
    if (*((unsigned char *)v77 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_40:

        _Block_object_dispose(buf, 8);
        goto LABEL_41;
      }
      int v80 = 67109378;
      LODWORD(v81[0]) = 303;
      WORD2(v81[0]) = 2080;
      *(void *)((char *)v81 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v34 = MEMORY[0x1E4F14500];
    }
    else
    {
      uint64_t v35 = mach_absolute_time();
      uint32_t v37 = v65.numer;
      uint32_t v36 = v65.denom;
      v38 = v30;
      v39 = v38;
      if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        LOWORD(v80) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_END, spid, "PGPeopleWallpaperSuggesterCandidateComputation", "", (uint8_t *)&v80, 2u);
      }

      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        int v80 = 136315394;
        v81[0] = "PGPeopleWallpaperSuggesterCandidateComputation";
        LOWORD(v81[1]) = 2048;
        *(double *)((char *)&v81[1] + 2) = (float)((float)((float)((float)(v35 - v43) * (float)v37) / (float)v36)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v80, 0x16u);
      }
      objc_storeStrong((id *)&self->_suggesterByPersonLocalIdentifier, obj);
      if (!v4) {
        goto LABEL_40;
      }
      double v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v73[3] < 0.01) {
        goto LABEL_40;
      }
      v73[3] = v40;
      char v51 = 0;
      (*((void (**)(id, char *, double))v32 + 2))(v32, &v51, 1.0);
      char v41 = *((unsigned char *)v77 + 24) | v51;
      *((unsigned char *)v77 + 24) = v41;
      if (!v41 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_40;
      }
      int v80 = 67109378;
      LODWORD(v81[0]) = 308;
      WORD2(v81[0]) = 2080;
      *(void *)((char *)v81 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v34 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v80, 0x12u);
    goto LABEL_40;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    buf[0] = 0xFE04000202;
    LOWORD(buf[1]) = 2080;
    *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
  }
LABEL_42:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_284(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  os_signpost_id_t v9 = [[PGSinglePersonWallpaperAssetSuggester alloc] initWithPersonLocalIdentifiers:v8 curationContext:*(void *)(a1 + 32) loggingConnection:*(void *)(a1 + 40)];

  [(PGSinglePersonWallpaperAssetSuggester *)v9 setPrimaryFilteringContext:*(void *)(*(void *)(a1 + 48) + 80)];
  [(PGSinglePersonWallpaperAssetSuggester *)v9 setSecondaryFilteringContext:*(void *)(*(void *)(a1 + 48) + 88)];
  [(PGSinglePersonWallpaperAssetSuggester *)v9 setScoringContext:*(void *)(*(void *)(a1 + 48) + 56)];
  [(PGSinglePersonWallpaperAssetSuggester *)v9 setDistancingContext:*(void *)(*(void *)(a1 + 48) + 64)];
  [(PGSinglePersonWallpaperAssetSuggester *)v9 setAssetFetchPropertySets:*(void *)(a1 + 56)];
  [(PGSinglePersonWallpaperAssetSuggester *)v9 setForbiddenAssetUUIDs:*(void *)(a1 + 64)];
  id v10 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGPeopleWallpaperSuggester] Processing person %@", buf, 0xCu);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_286;
  id v19 = &unk_1E68F0380;
  id v20 = *(id *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 88);
  long long v23 = *(_OWORD *)(a1 + 112);
  uint64_t v22 = *(void *)(a1 + 104);
  [(PGSinglePersonWallpaperAssetSuggester *)v9 computeSuggestedAssetsWithProgress:&v16];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
    || (*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                + 24),
        *(void *)(a1 + 80))
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(*(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
  {
    *a4 = 1;
  }
  else
  {
    unint64_t v13 = [(PGSinglePersonWallpaperAssetSuggester *)v9 expectedNumberOfSuggestedAssets];
    if (v13 >= [*(id *)(*(void *)(a1 + 48) + 80) minimumNumberOfCandidatesForEligiblePerson])
    {
      [*(id *)(a1 + 72) setObject:v9 forKeyedSubscript:v7];
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v13;
        uint64_t v15 = "[PGPeopleWallpaperSuggester] Found %d candidates";
        goto LABEL_14;
      }
    }
    else
    {
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v13;
        uint64_t v15 = "[PGPeopleWallpaperSuggester] Found only %d candidates, dropping";
LABEL_14:
        _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 8u);
      }
    }
  }
}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_286(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                               + 24) + *(double *)(a1 + 72) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 0;
  uint64_t v92 = 0;
  v93 = (double *)&v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  id v67 = _Block_copy(v7);
  v62 = v7;
  if (!v67
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v93[3] < 0.01)
    || (v93[3] = v8,
        LOBYTE(v100) = 0,
        (*((void (**)(void *, int *, double))v67 + 2))(v67, &v100, 0.0),
        char v9 = *((unsigned char *)v97 + 24) | v100,
        (*((unsigned char *)v97 + 24) = v9) == 0))
  {
    uint64_t v11 = [(PGAbstractSuggester *)self session];
    [v11 loggingConnection];
    v61 = v11;
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);
    v14 = v12;
    uint64_t v15 = v14;
    unint64_t v59 = v13 - 1;
    os_signpost_id_t spid = v13;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGPeopleWallpaperSuggester", "", (uint8_t *)&buf, 2u);
    }
    oslog = v15;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v58 = mach_absolute_time();
    uint64_t v64 = [v6 maximumNumberOfSuggestions];
    mach_timebase_info v65 = [v6 additionalOptions];
    v66 = [v65 objectForKeyedSubscript:@"filteringContext"];
    [(PGPeopleWallpaperSuggesterFilteringContext *)self->_primaryFilteringContext updateFilteringContextWithDictionary:v66];
    [(PGPeopleWallpaperSuggesterFilteringContext *)self->_secondaryFilteringContext updateFilteringContextWithDictionary:v66];
    uint64_t v16 = [PGSinglePersonWallpaperAssetSuggesterScoringContext alloc];
    uint64_t v17 = [v65 objectForKeyedSubscript:@"scoringContext"];
    v18 = [(PGSinglePersonWallpaperAssetSuggesterScoringContext *)v16 initWithDictionary:v17];
    scoringContext = self->_scoringContext;
    self->_scoringContext = v18;

    id v20 = [PGSinglePersonWallpaperAssetSuggesterDistancingContext alloc];
    long long v21 = [v65 objectForKeyedSubscript:@"distancingContext"];
    uint64_t v22 = [(PGSinglePersonWallpaperAssetSuggesterDistancingContext *)v20 initWithDictionary:v21];
    distancingContext = self->_distancingContext;
    self->_distancingContext = v22;

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v64;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Starting to generate %d suggestions per person.", (uint8_t *)&buf, 8u);
    }
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!self->_suggesterByPersonLocalIdentifier)
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
      v86[3] = &unk_1E68F03F8;
      v87 = v67;
      v88 = &v92;
      v89 = &v96;
      uint64_t v90 = 0x3F847AE147AE147BLL;
      [(PGPeopleWallpaperSuggester *)self _buildSuggestersWithProgress:v86];
      if (*((unsigned char *)v97 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t buf = 0x8104000202;
          LOWORD(v103) = 2080;
          *(void *)((char *)&v103 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        id v10 = (id)MEMORY[0x1E4F1CBF0];
        v38 = v87;
        goto LABEL_51;
      }
    }
    v24 = oslog;
    os_signpost_id_t v25 = os_signpost_id_generate(v24);
    uint64_t v26 = v24;
    v27 = v26;
    os_signpost_id_t v56 = v25;
    unint64_t v57 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PGPeopleWallpaperSuggesterSuggestionAccumulation", "", (uint8_t *)&buf, 2u);
    }

    mach_timebase_info v85 = 0;
    mach_timebase_info(&v85);
    uint64_t v55 = mach_absolute_time();
    if (self->_assetGater) {
      uint64_t v28 = 5;
    }
    else {
      uint64_t v28 = 0;
    }
    if (self->_assetGater) {
      uint64_t v29 = 2 * v64;
    }
    else {
      uint64_t v29 = 0;
    }
    v30 = [(id)objc_opt_class() suggestionTypes];
    __int16 v31 = [v30 firstIndex];

    id v32 = [(id)objc_opt_class() suggestionSubtypes];
    __int16 v33 = [v32 firstIndex];

    NSUInteger v34 = [(NSDictionary *)self->_suggesterByPersonLocalIdentifier count];
    if (v34 <= 1) {
      unint64_t v35 = 1;
    }
    else {
      unint64_t v35 = v34;
    }
    uint64_t buf = 0;
    *(void *)&long long v103 = &buf;
    *((void *)&v103 + 1) = 0x2020000000;
    suggesterByPersonLocalIdentifier = self->_suggesterByPersonLocalIdentifier;
    uint64_t v104 = 0;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_255;
    v70[3] = &unk_1E68ED2F0;
    double v37 = 0.25 / (double)v35;
    uint64_t v78 = v64;
    uint64_t v79 = v28;
    uint64_t v80 = v29;
    v38 = v27;
    p_uint64_t buf = &buf;
    double v81 = v37;
    __int16 v83 = v31;
    __int16 v84 = v33;
    v71 = v38;
    uint64_t v72 = self;
    id v39 = v67;
    id v74 = v39;
    uint64_t v76 = &v92;
    uint64_t v82 = 0x3F847AE147AE147BLL;
    v77 = &v96;
    id v40 = v63;
    id v73 = v40;
    [(NSDictionary *)suggesterByPersonLocalIdentifier enumerateKeysAndObjectsUsingBlock:v70];
    if (*((unsigned char *)v97 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v100 = 67109378;
        LODWORD(v101[0]) = 241;
        WORD2(v101[0]) = 2080;
        *(void *)((char *)v101 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
        char v41 = MEMORY[0x1E4F14500];
LABEL_28:
        _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v100, 0x12u);
      }
    }
    else
    {
      uint64_t v42 = mach_absolute_time();
      uint32_t numer = v85.numer;
      uint32_t denom = v85.denom;
      id v45 = v38;
      v46 = v45;
      if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        LOWORD(v100) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v46, OS_SIGNPOST_INTERVAL_END, v56, "PGPeopleWallpaperSuggesterSuggestionAccumulation", "", (uint8_t *)&v100, 2u);
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        int v100 = 136315394;
        v101[0] = "PGPeopleWallpaperSuggesterSuggestionAccumulation";
        LOWORD(v101[1]) = 2048;
        *(double *)((char *)&v101[1] + 2) = (float)((float)((float)((float)(v42 - v55) * (float)numer) / (float)denom)
                                                  / 1000000.0);
        _os_log_impl(&dword_1D1805000, v46, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v100, 0x16u);
      }
      uint64_t v47 = mach_absolute_time();
      uint32_t v49 = info.numer;
      uint32_t v48 = info.denom;
      v50 = v46;
      char v51 = v50;
      if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        LOWORD(v100) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v51, OS_SIGNPOST_INTERVAL_END, spid, "PGPeopleWallpaperSuggester", "", (uint8_t *)&v100, 2u);
      }

      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        int v100 = 136315394;
        v101[0] = "PGPeopleWallpaperSuggester";
        LOWORD(v101[1]) = 2048;
        *(double *)((char *)&v101[1] + 2) = (float)((float)((float)((float)(v47 - v58) * (float)v49) / (float)v48)
                                                  / 1000000.0);
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v100, 0x16u);
      }
      if (!v67
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v93[3] < 0.01)
        || (v93[3] = Current,
            char v69 = 0,
            (*((void (**)(id, char *, double))v39 + 2))(v39, &v69, 1.0),
            char v53 = *((unsigned char *)v97 + 24) | v69,
            (*((unsigned char *)v97 + 24) = v53) == 0))
      {
        id v10 = v40;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v100 = 67109378;
        LODWORD(v101[0]) = 247;
        WORD2(v101[0]) = 2080;
        *(void *)((char *)v101 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
        char v41 = MEMORY[0x1E4F14500];
        goto LABEL_28;
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_50:

    _Block_object_dispose(&buf, 8);
LABEL_51:

    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x6904000202;
    LOWORD(v103) = 2080;
    *(void *)((char *)&v103 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_52:
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);

  return v10;
}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_255(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v67 = a3;
  uint64_t v7 = [[PGWallpaperSuggestionAccumulator alloc] initWithTargetNumberOfSuggestions:*(void *)(a1 + 88) targetMinimumNumberOfGatedSuggestions:*(void *)(a1 + 96) maximumNumberOfSuggestionsToTryForGating:*(void *)(a1 + 104) loggingConnection:*(void *)(a1 + 32)];
  double v8 = [MEMORY[0x1E4F1C9C8] date];
  v68 = [v8 dateByAddingTimeInterval:480.0];
  char v9 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 96);
    uint64_t v12 = NSNumber;
    os_signpost_id_t v13 = v9;
    v14 = [v12 numberWithDouble:480.0];
    *(_DWORD *)uint64_t buf = 67110402;
    *(_DWORD *)v77 = v10;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v11;
    *(_WORD *)&v77[10] = 2112;
    *(void *)&v77[12] = v6;
    *(_WORD *)&v77[20] = 2112;
    uint64_t v78 = v8;
    __int16 v79 = 2112;
    uint64_t v80 = v14;
    __int16 v81 = 2112;
    uint64_t v82 = v68;
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Starting to generate %d suggestions (%d gated) for person %@. StartingDate: %@, MaxProcessingTime: %@s, MaxProcessingDate: %@", buf, 0x36u);
  }
  mach_timebase_info v65 = v8;
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v16 = *(void *)(v15 + 24);
  double v17 = *(double *)(a1 + 112);
  *(void *)(v15 + 24) = v16 + 1;
  if (![(PGWallpaperSuggestionAccumulator *)v7 accumulationIsComplete])
  {
    uint64_t v20 = 0;
    int v19 = 0;
    int v66 = 0;
    uint64_t v64 = 0;
    unint64_t v21 = 0;
    double v22 = v17 * (double)v16;
    *(void *)&long long v18 = 138412546;
    long long v62 = v18;
    while (1)
    {
      long long v23 = objc_msgSend(v67, "nextSuggestedAsset", v62);
      if (!v23) {
        goto LABEL_39;
      }
      v24 = [[PGPeopleWallpaperSuggestion alloc] initWithPersonLocalIdentifier:v6 type:*(unsigned __int16 *)(a1 + 128) subtype:*(unsigned __int16 *)(a1 + 130) asset:v23];
      if (!*(void *)(*(void *)(a1 + 40) + 72)) {
        break;
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "setEnableSettlingEffect:", +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:subtype:](PGSettlingEffectWallpaperSuggesterFilteringContext, "shouldRunSettlingEffectForAsset:subtype:", v23, 602));
      os_signpost_id_t v25 = *(void **)(*(void *)(a1 + 40) + 72);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_261;
      v71[3] = &unk_1E68F0420;
      id v72 = *(id *)(a1 + 56);
      uint64_t v74 = *(void *)(a1 + 120);
      double v75 = v22;
      long long v73 = *(_OWORD *)(a1 + 72);
      uint64_t v26 = [v25 gateAsset:v23 progressBlock:v71];
      -[PGSingleAssetSuggestion setAvailableFeatures:](v24, "setAvailableFeatures:", [v26 availableFeatures]);
      char v27 = [v26 passesAnyGating];
      v21 += [v26 didTimeout];

      ++v20;
      unsigned __int8 v70 = 0;
      double v69 = 1.0;
      if (v27) {
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E4F8E858], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v23, 1, &v70, &v69, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "orientation"));
      double v29 = v28;
      double v30 = v69;
      [*(id *)(*(void *)(a1 + 40) + 80) maximumCropZoomRatio];
      double v32 = v31;
      BOOL v33 = v30 <= v31;
      [*(id *)(*(void *)(a1 + 40) + 80) minimumCropScore];
      int v35 = v70;
      if (v70)
      {
        if (v30 <= v32 && v29 >= v34)
        {
          uint32_t v36 = *(void **)(*(void *)(a1 + 40) + 88);
          if (!v36) {
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x1E4F8E858], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v23, 1, &v70, &v69, objc_msgSend(v36, "orientation"));
          double v38 = v37;
          double v39 = v69;
          [*(id *)(*(void *)(a1 + 40) + 88) maximumCropZoomRatio];
          double v41 = v40;
          BOOL v33 = v39 <= v40;
          [*(id *)(*(void *)(a1 + 40) + 88) minimumCropScore];
          int v35 = v70;
          if (v70)
          {
            if (v39 <= v41 && v38 >= v42)
            {
LABEL_16:
              uint64_t v43 = 0;
              goto LABEL_19;
            }
          }
        }
      }
      if (v35)
      {
        if (v33)
        {
          ++HIDWORD(v64);
          v50 = @"low crop score";
        }
        else
        {
          LODWORD(v64) = v64 + 1;
          v50 = @"low resolution";
        }
      }
      else
      {
        ++v66;
        v50 = @"clock overlap";
      }
      char v51 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = v62;
        *(void *)v77 = @"non-gated";
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v50;
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Rejecting %@ suggestion because of %@.", buf, 0x16u);
      }
LABEL_20:
      unint64_t v44 = [MEMORY[0x1E4F1C9C8] date];
      [v68 timeIntervalSinceDate:v44];
      double v46 = v45;
      uint64_t v47 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109632;
        *(_DWORD *)v77 = v20;
        *(_WORD *)&v77[4] = 1024;
        *(_DWORD *)&v77[6] = v19;
        *(_WORD *)&v77[10] = 2048;
        *(double *)&v77[12] = v46;
        _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Tried %d candidates. %d passed. %.3fs processing time left.", buf, 0x18u);
      }
      if (v21 > 1 || v46 < 0.0)
      {
        v52 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109632;
          *(_DWORD *)v77 = v21;
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = 1;
          *(_WORD *)&v77[10] = 2048;
          *(double *)&v77[12] = v46;
          _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Reached (%d/%d) timeouts allowed. %.3fs processing time left.", buf, 0x18u);
        }

LABEL_39:
        goto LABEL_40;
      }

      if (*(void *)(a1 + 56))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
        if (Current - *(double *)(v49 + 24) >= *(double *)(a1 + 120))
        {
          *(double *)(v49 + 24) = Current;
          buf[0] = 0;
          (*(void (**)(double))(*(void *)(a1 + 56) + 16))(v22 + 0.75);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
          {
            *a4 = 1;
            goto LABEL_48;
          }
        }
      }

      if ([(PGWallpaperSuggestionAccumulator *)v7 accumulationIsComplete]) {
        goto LABEL_40;
      }
    }
    ++v20;
    unsigned __int8 v70 = 0;
    double v69 = 1.0;
LABEL_18:
    uint64_t v43 = 1;
LABEL_19:
    [(PGWallpaperSuggestionAccumulator *)v7 addSuggestion:v24 passingGating:v43];
    ++v19;
    goto LABEL_20;
  }
  uint64_t v64 = 0;
  int v66 = 0;
  int v19 = 0;
  LODWORD(v20) = 0;
LABEL_40:
  long long v23 = [(PGWallpaperSuggestionAccumulator *)v7 suggestions];
  [*(id *)(a1 + 48) addObjectsFromArray:v23];
  char v53 = *(NSObject **)(a1 + 32);
  uint64_t v54 = *(void *)(*(void *)(a1 + 40) + 72);
  BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_INFO);
  if (v54)
  {
    if (v55)
    {
      os_signpost_id_t v56 = v53;
      int v57 = [v23 count];
      int v58 = [(PGWallpaperSuggestionAccumulator *)v7 numberOfGatedSuggestions];
      *(_DWORD *)uint64_t buf = 67109634;
      *(_DWORD *)v77 = v57;
      *(_WORD *)&v77[4] = 1024;
      *(_DWORD *)&v77[6] = v58;
      *(_WORD *)&v77[10] = 2112;
      *(void *)&v77[12] = v6;
      _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Generated %d suggestions (%d gated) for person %@.", buf, 0x18u);

      char v53 = *(NSObject **)(a1 + 32);
    }
    unint64_t v59 = v65;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67110144;
      *(_DWORD *)v77 = v20;
      *(_WORD *)&v77[4] = 1024;
      *(_DWORD *)&v77[6] = v19;
      *(_WORD *)&v77[10] = 1024;
      *(_DWORD *)&v77[12] = v66;
      *(_WORD *)&v77[16] = 1024;
      *(_DWORD *)&v77[18] = v64;
      LOWORD(v78) = 1024;
      *(_DWORD *)((char *)&v78 + 2) = HIDWORD(v64);
      _os_log_impl(&dword_1D1805000, v53, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
    }
  }
  else
  {
    if (v55)
    {
      v60 = v53;
      int v61 = [v23 count];
      *(_DWORD *)uint64_t buf = 67109378;
      *(_DWORD *)v77 = v61;
      *(_WORD *)&v77[4] = 2112;
      *(void *)&v77[6] = v6;
      _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Generated %d suggestions for person %@.", buf, 0x12u);
    }
LABEL_48:
    unint64_t v59 = v65;
  }
}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_261(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) * a3 + 0.75);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)setupFilteringContexts
{
  v2 = self;
  id v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (PGPeopleWallpaperSuggester *)_PFAssertFailHandler();
    [(PGPeopleWallpaperSuggester *)v14 initWithSession:v16];
    return;
  }
  if (([(PGPeopleWallpaperSuggester *)v2 isMemberOfClass:v3] & 1) == 0)
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  int IsIPad = PLPhysicalDeviceIsIPad();
  double v5 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    uint64_t v6 = [(PGPeopleWallpaperSuggesterFilteringContext *)v5 initForPeopleInOrientation:2];
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPeopleWallpaperSuggesterFilteringContext *)v6;

    double v8 = [[PGPeopleWallpaperSuggesterFilteringContext alloc] initForPeopleInOrientation:1];
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    uint64_t v10 = [(PGPeopleWallpaperSuggesterFilteringContext *)v5 initForPeopleInOrientation:1];
    uint64_t v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPeopleWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }
}

- (PGPeopleWallpaperSuggester)initWithSession:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleWallpaperSuggester;
  double v5 = [(PGAbstractSuggester *)&v11 initWithSession:v4];
  if (v5)
  {
    if ([(id)objc_opt_class() filtersForTopSuggestions])
    {
      uint64_t v6 = [PGWallpaperSuggestionAssetGater alloc];
      uint64_t v7 = [v4 loggingConnection];
      uint64_t v8 = [(PGWallpaperSuggestionAssetGater *)v6 initWithType:1 loggingConnection:v7];
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

      -[PGWallpaperSuggestionAssetGater setEnableSettlingEffect:](v5->_assetGater, "setEnableSettlingEffect:", [(id)objc_opt_class() enableSettlingEffect]);
    }
    [(PGPeopleWallpaperSuggester *)v5 setupFilteringContexts];
  }

  return v5;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(id)objc_opt_class() filtersForTopSuggestions];
  BOOL v12 = +[PGSinglePersonWallpaperAssetSuggester passesFilteringWithAsset:v9 forTopWallpaperSuggestions:v11 curationContext:v10 orientation:a5 reason:a6];

  if (v11 && v12)
  {
    os_signpost_id_t v13 = [PGWallpaperSuggestionAssetGater alloc];
    LOBYTE(v12) = 1;
    v14 = [(PGWallpaperSuggestionAssetGater *)v13 initWithType:1 loggingConnection:MEMORY[0x1E4F14500]];
    [(PGWallpaperSuggestionAssetGater *)v14 setCoversTracks:1];
    [(PGWallpaperSuggestionAssetGater *)v14 setIsUserInitiated:1];
    SEL v15 = [(PGWallpaperSuggestionAssetGater *)v14 gateAsset:v9 progressBlock:&__block_literal_global_59243];
    if ([v15 passesAnyGating])
    {
      id v16 = @"Pass Segmented";
      if (!a6) {
        goto LABEL_15;
      }
    }
    else
    {
      char v26 = 0;
      double v25 = 1.0;
      [MEMORY[0x1E4F8E858] cropScoreWithAsset:v9 classification:1 passesClockOverlap:&v26 cropZoomRatio:&v25 orientation:a5];
      double v18 = v17;
      id v19 = [[PGPeopleWallpaperSuggesterFilteringContext alloc] initForTopPeopleInOrientation:a5];
      uint64_t v20 = v19;
      if (v26)
      {
        double v21 = v25;
        [v19 maximumCropZoomRatio];
        if (v21 <= v22)
        {
          [v20 minimumCropScore];
          LOBYTE(v12) = v18 >= v23;
          if (v18 < v23) {
            id v16 = @"Low Crop Score";
          }
          else {
            id v16 = @"Pass Unsegmented";
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          id v16 = @"Low Resolution";
        }
      }
      else
      {
        LOBYTE(v12) = 0;
        id v16 = @"Clock Overlap";
      }

      if (!a6) {
        goto LABEL_15;
      }
    }
    *a6 = v16;
LABEL_15:
  }
  return v12;
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (BOOL)enableSettlingEffect
{
  return 1;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:652];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:6];
}

@end