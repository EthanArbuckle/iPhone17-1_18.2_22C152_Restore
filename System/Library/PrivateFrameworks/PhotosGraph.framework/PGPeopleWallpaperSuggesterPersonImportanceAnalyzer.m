@interface PGPeopleWallpaperSuggesterPersonImportanceAnalyzer
- (BOOL)_isVeryImportantPersonWithPersonNode:(id)a3;
- (BOOL)favoritePersonsAreVIPs;
- (PGPeopleWallpaperSuggesterPersonImportanceAnalyzer)initWithGraph:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5;
- (double)normalizedDeviationForImportantPersons;
- (double)normalizedDeviationForVeryImportantPersons;
- (id)personInformationsWithProgress:(id)a3;
- (void)computePersonImportancesWithProgress:(id)a3;
- (void)gatherMomentInformationWithProgress:(id)a3;
- (void)gatherPersonInformationWithProgress:(id)a3;
- (void)setFavoritePersonsAreVIPs:(BOOL)a3;
- (void)setNormalizedDeviationForImportantPersons:(double)a3;
- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3;
@end

@implementation PGPeopleWallpaperSuggesterPersonImportanceAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentLocalIdentifiersByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personInformationByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_earliestDateForBasePersons, 0);
  objc_storeStrong((id *)&self->_earliestDateForCandidates, 0);
  objc_storeStrong((id *)&self->_latestLibraryDate, 0);
  objc_storeStrong((id *)&self->_mePersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (void)setFavoritePersonsAreVIPs:(BOOL)a3
{
  self->_favoritePersonsAreVIPs = a3;
}

- (BOOL)favoritePersonsAreVIPs
{
  return self->_favoritePersonsAreVIPs;
}

- (void)setNormalizedDeviationForImportantPersons:(double)a3
{
  self->_normalizedDeviationForImportantPersons = a3;
}

- (double)normalizedDeviationForImportantPersons
{
  return self->_normalizedDeviationForImportantPersons;
}

- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3
{
  self->_normalizedDeviationForVeryImportantPersons = a3;
}

- (double)normalizedDeviationForVeryImportantPersons
{
  return self->_normalizedDeviationForVeryImportantPersons;
}

- (id)personInformationsWithProgress:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _Block_copy(v4);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v42 = 0;
  v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  if (!v5
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v43[3] < 0.01)
    || (v43[3] = v6,
        char v41 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v41, 0.0),
        char v7 = *((unsigned char *)v47 + 24) | v41,
        (*((unsigned char *)v47 + 24) = v7) == 0))
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke;
    v36[3] = &unk_1E68F03F8;
    id v9 = v5;
    id v37 = v9;
    v38 = &v42;
    v39 = &v46;
    uint64_t v40 = 0x3F847AE147AE147BLL;
    [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)self gatherPersonInformationWithProgress:v36];
    if (*((unsigned char *)v47 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v52 = 227;
        __int16 v53 = 2080;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_37;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_258;
    v31[3] = &unk_1E68F03F8;
    id v10 = v9;
    id v32 = v10;
    v33 = &v42;
    v34 = &v46;
    uint64_t v35 = 0x3F847AE147AE147BLL;
    [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)self gatherMomentInformationWithProgress:v31];
    if (*((unsigned char *)v47 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v52 = 232;
        __int16 v53 = 2080;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v8 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_36;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_259;
    v26[3] = &unk_1E68F03F8;
    id v11 = v10;
    id v27 = v11;
    v28 = &v42;
    v29 = &v46;
    uint64_t v30 = 0x3F847AE147AE147BLL;
    [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)self computePersonImportancesWithProgress:v26];
    if (*((unsigned char *)v47 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v52 = 237;
        __int16 v53 = 2080;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        v12 = MEMORY[0x1E4F14500];
LABEL_18:
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Merge candidate mapping:", buf, 2u);
      }
      personInformationByPersonLocalIdentifier = self->_personInformationByPersonLocalIdentifier;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_260;
      v25[3] = &unk_1E68EECE8;
      v25[4] = self;
      [(NSMutableDictionary *)personInformationByPersonLocalIdentifier enumerateKeysAndObjectsUsingBlock:v25];
      if (!v5
        || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v43[3] < 0.01)
        || (v43[3] = v15,
            char v41 = 0,
            (*((void (**)(id, char *, double))v11 + 2))(v11, &v41, 0.9),
            char v16 = *((unsigned char *)v47 + 24) | v41,
            (*((unsigned char *)v47 + 24) = v16) == 0))
      {
        v17 = [(NSMutableDictionary *)self->_personInformationByPersonLocalIdentifier allValues];
        v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"importance" ascending:0];
        v50[0] = v18;
        v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"personLocalIdentifier" ascending:0];
        v50[1] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
        v21 = [v17 sortedArrayUsingDescriptors:v20];

        if (v5
          && (double Current = CFAbsoluteTimeGetCurrent(), Current - v43[3] >= 0.01)
          && (v43[3] = Current,
              char v41 = 0,
              (*((void (**)(id, char *, double))v11 + 2))(v11, &v41, 1.0),
              char v23 = *((unsigned char *)v47 + 24) | v41,
              (*((unsigned char *)v47 + 24) = v23) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v52 = 254;
            __int16 v53 = 2080;
            v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v8 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          id v8 = v21;
        }

        goto LABEL_35;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v52 = 247;
        __int16 v53 = 2080;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        v12 = MEMORY[0x1E4F14500];
        goto LABEL_18;
      }
    }
    id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_35:

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v52 = 222;
    __int16 v53 = 2080;
    v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_38:
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v8;
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_258(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_259(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3 + 0.6);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] \t%@", buf, 0xCu);
  }
  v17 = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v6 dupedPersonLocalIdentifiers];
  id v9 = [v8 allObjects];
  id v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          char v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          *(_DWORD *)buf = 138412290;
          id v24 = v16;
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] \t\t%@", buf, 0xCu);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)computePersonImportancesWithProgress:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _Block_copy(v4);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  if (!v5
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v22[3] < 0.01)
    || (v22[3] = v6,
        char v20 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v20, 0.0),
        char v7 = *((unsigned char *)v26 + 24) | v20,
        (*((unsigned char *)v26 + 24) = v7) == 0))
  {
    id v8 = (void *)MEMORY[0x1E4F76C60];
    id v9 = [(NSMutableDictionary *)self->_momentLocalIdentifiersByPersonLocalIdentifier allKeys];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke;
    v19[3] = &unk_1E68EEC98;
    v19[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke_2;
    v14[3] = &unk_1E68EECC0;
    id v10 = v5;
    uint64_t v18 = 0x3F847AE147AE147BLL;
    char v16 = &v21;
    v17 = &v25;
    v14[4] = self;
    id v15 = v10;
    [v8 calculateStandardDeviationForItems:v9 valueBlock:v19 result:v14];

    if (*((unsigned char *)v26 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      int v30 = 215;
      __int16 v31 = 2080;
      id v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
      uint64_t v11 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v5) {
        goto LABEL_15;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v22[3] < 0.01) {
        goto LABEL_15;
      }
      v22[3] = Current;
      char v20 = 0;
      (*((void (**)(id, char *, double))v10 + 2))(v10, &v20, 1.0);
      char v13 = *((unsigned char *)v26 + 24) | v20;
      *((unsigned char *)v26 + 24) = v13;
      if (!v13 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 67109378;
      int v30 = 217;
      __int16 v31 = 2080;
      id v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
      uint64_t v11 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v30 = 185;
    __int16 v31 = 2080;
    id v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

double __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:a2];
  double v3 = (double)(unint64_t)[v2 count];

  return v3;
}

void __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 40)
    || (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8),
        Current - *(double *)(v7 + 24) < *(double *)(a1 + 64))
    || (*(double *)(v7 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24)) == 0))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v32 = a3;
      __int16 v33 = 2048;
      double v34 = a2;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Mean = %f, stdev = %f", buf, 0x16u);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(NSObject **)(v8 + 24);
    }
    double v10 = a3 + *(double *)(v8 + 96) * a2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v32 = v10;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Frequency for very important persons: %f", buf, 0xCu);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(NSObject **)(v8 + 24);
    }
    double v11 = a3 + *(double *)(v8 + 104) * a2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v32 = v11;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Frequency for important persons: %f", buf, 0xCu);
      uint64_t v8 = *(void *)(a1 + 32);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [*(id *)(v8 + 80) allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v28;
      *(void *)&long long v14 = 138412802;
      long long v26 = v14;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          double v18 = *(double *)(*((void *)&v27 + 1) + 8 * i);
          long long v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKeyedSubscript:", *(void *)&v18, v26);
          double v20 = (double)(unint64_t)[v19 count];

          uint64_t v21 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v21 + 40) || v10 > v20)
          {
            if (v11 <= v20)
            {
              uint64_t v22 = 1;
              uint64_t v23 = @"Important Person";
            }
            else
            {
              uint64_t v22 = 0;
              uint64_t v23 = @"Other";
            }
          }
          else
          {
            uint64_t v22 = 2;
            uint64_t v23 = @"Very Important Person";
          }
          uint64_t v24 = *(NSObject **)(v21 + 24);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            double v32 = v18;
            __int16 v33 = 2048;
            double v34 = v20;
            __int16 v35 = 2112;
            v36 = v23;
            _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Person %@: frequency = %f, importance %@", buf, 0x20u);
            uint64_t v21 = *(void *)(a1 + 32);
          }
          uint64_t v25 = [*(id *)(v21 + 72) objectForKeyedSubscript:*(void *)&v18];
          [v25 mergeImportance:v22];
        }
        uint64_t v15 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v15);
    }
  }
}

- (void)gatherMomentInformationWithProgress:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v27 = 0;
      v4[2](v4, &v27, 0.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v29 = 138;
          __int16 v30 = 2080;
          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_23;
      }
      double v5 = Current;
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Gathering Moment Information", buf, 2u);
  }
  if (self->_latestLibraryDate
    && (uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:self->_earliestDateForBasePersons endDate:self->_latestLibraryDate]) != 0)
  {
    id v9 = (void *)v8;
    double v10 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v8 inGraph:self->_graph];
  }
  else
  {
    double v10 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
  }
  if (self->_latestLibraryDate
    && (uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:self->_earliestDateForCandidates endDate:self->_latestLibraryDate]) != 0)
  {
    uint64_t v12 = (void *)v11;
    id v13 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v11 inGraph:self->_graph];
  }
  else
  {
    id v13 = v10;
  }
  long long v14 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v15 = +[PGGraphMomentNode consolidatedPersonInMoment];
  uint64_t v16 = [v14 adjacencyWithSources:v10 relation:v15 targetsClass:objc_opt_class()];

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  momentLocalIdentifiersByPersonLocalIdentifier = self->_momentLocalIdentifiersByPersonLocalIdentifier;
  self->_momentLocalIdentifiersByPersonLocalIdentifier = v17;

  long long v19 = [v16 transposed];
  double v20 = [v19 intersectingTargetsWith:v13];
  uint64_t v21 = [v19 sources];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherMomentInformationWithProgress___block_invoke;
  v24[3] = &unk_1E68EEC70;
  v24[4] = self;
  id v25 = v20;
  id v26 = v19;
  id v22 = v19;
  id v23 = v20;
  [v21 enumerateNodesUsingBlock:v24];

  if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      char v27 = 0;
      v4[2](v4, &v27, 1.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v29 = 180;
          __int16 v30 = 2080;
          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_23:
}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherMomentInformationWithProgress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  double v5 = NSString;
  double v6 = [v3 name];
  uint64_t v7 = [v5 stringWithFormat:@"[PersonImportanceAnalyzer] Person (%@, %@)", v6, v4];

  if ([v4 length])
  {
    uint64_t v8 = [v3 localIdentifier];
    int v9 = [v8 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)];

    if (v9)
    {
      double v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v7;
        uint64_t v11 = "%@: Me, ignoring";
LABEL_7:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
      }
    }
    else
    {
      if ((([v3 isMyCoworker] & 1) != 0 || objc_msgSend(v3, "isMyInferredCoworker"))
        && ([v3 isMemberOfMyFamily] & 1) == 0
        && ([v3 isInferredMemberOfMyFamily] & 1) == 0
        && ([v3 isFavorite] & 1) == 0)
      {
        double v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v7;
        uint64_t v11 = "%@: Coworker and not family or favorite, ignoring";
        goto LABEL_7;
      }
      uint64_t v12 = [v3 identifier];
      id v13 = [*(id *)(a1 + 40) targetsForSourceIdentifier:v12];
      long long v14 = [v13 localIdentifiers];

      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v14];
      [*(id *)(*(void *)(a1 + 32) + 80) setObject:v15 forKeyedSubscript:v4];

      uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = v16;
        int v18 = [v14 count];
        long long v19 = [*(id *)(a1 + 48) targetsForSourceIdentifier:v12];
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = v7;
        __int16 v22 = 1024;
        int v23 = v18;
        __int16 v24 = 1024;
        int v25 = [v19 count];
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "%@: %d very recent moments, %d recent moments", buf, 0x18u);
      }
    }
  }
  else
  {
    double v10 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v7;
      uint64_t v11 = "%@: no localIdentifier, ignoring";
      goto LABEL_7;
    }
  }
LABEL_16:
}

- (void)gatherPersonInformationWithProgress:(id)a3
{
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Gathering Person Information", buf, 2u);
  }
  double v6 = [(CLSCurationContext *)self->_curationContext personUUIDByMergeCandidateUUID];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke;
  v19[3] = &unk_1E68EEC48;
  id v8 = v7;
  id v20 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v19];
  if ([(NSString *)self->_mePersonLocalIdentifier length])
  {
    int v9 = [v8 objectForKeyedSubscript:self->_mePersonLocalIdentifier];
    double v10 = [[PGPeopleWallpaperSuggesterPersonInformation alloc] initWithPersonLocalIdentifier:self->_mePersonLocalIdentifier importance:3 unverifiedMergeCandidateLocalIdentifiers:v9];
    [(NSMutableDictionary *)self->_personInformationByPersonLocalIdentifier setObject:v10 forKeyedSubscript:self->_mePersonLocalIdentifier];
  }
  uint64_t v11 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:self->_graph];
  uint64_t v12 = [(CLSCurationContext *)self->_curationContext userFeedbackCalculator];
  id v13 = [v12 personUUIDsWithNegativeFeedback];

  self->_hasFavoritedPersons = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke_2;
  v16[3] = &unk_1E68EEC70;
  v16[4] = self;
  id v17 = v13;
  id v18 = v8;
  id v14 = v8;
  id v15 = v13;
  [v11 enumerateNodesUsingBlock:v16];
}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = (void *)MEMORY[0x1E4F391F0];
  id v6 = a3;
  id v9 = [v5 localIdentifierWithUUID:a2];
  id v7 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:v6];

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
  [v8 addObject:v9];
}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  if ([v4 length]
    && ([v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)] & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 40))
    {
      char v6 = 1;
    }
    else
    {
      char v6 = [v3 isFavorite];
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v5 + 40) = v6;
    id v7 = *(void **)(a1 + 40);
    id v8 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v4];
    LODWORD(v7) = [v7 containsObject:v8];

    id v9 = *(void **)(a1 + 32);
    if (v7)
    {
      double v10 = v9[3];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = v10;
        uint64_t v12 = [v3 name];
        int v22 = 138412546;
        int v23 = v12;
        __int16 v24 = 2112;
        int v25 = v4;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] (%@, %@) is rejected because of negative feedback", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v13 = -1;
    }
    else if ([v9 _isVeryImportantPersonWithPersonNode:v3])
    {
      id v14 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = v14;
        uint64_t v16 = [v3 name];
        int v22 = 138412546;
        int v23 = v16;
        __int16 v24 = 2112;
        int v25 = v4;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] (%@, %@) is very important person", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v13 = 2;
    }
    else if ([v3 isFavorite])
    {
      id v17 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v20 = v17;
        uint64_t v21 = [v3 name];
        int v22 = 138412546;
        int v23 = v21;
        __int16 v24 = 2112;
        int v25 = v4;
        _os_log_debug_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEBUG, "[PersonImportanceAnalyzer] (%@, %@) is important person", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    long long v19 = [[PGPeopleWallpaperSuggesterPersonInformation alloc] initWithPersonLocalIdentifier:v4 importance:v13 unverifiedMergeCandidateLocalIdentifiers:v18];
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v19 forKeyedSubscript:v4];
  }
}

- (BOOL)_isVeryImportantPersonWithPersonNode:(id)a3
{
  id v4 = a3;
  if (([v4 isMyPartner] & 1) != 0
    || ([v4 isMyInferredPartner] & 1) != 0
    || ([v4 isMyChild] & 1) != 0)
  {
    char v5 = 1;
  }
  else if (self->_favoritePersonsAreVIPs)
  {
    char v5 = [v4 isFavorite];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (PGPeopleWallpaperSuggesterPersonImportanceAnalyzer)initWithGraph:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PGPeopleWallpaperSuggesterPersonImportanceAnalyzer;
  uint64_t v12 = [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)&v28 init];
  uint64_t v13 = v12;
  if (v12)
  {
    *(_OWORD *)&v12->_normalizedDeviationForVeryImportantPersons = xmmword_1D1F4F310;
    v12->_favoritePersonsAreVIPs = 1;
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_curationContext, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    id v14 = [(PGGraph *)v13->_graph meNodeWithFallbackInferredMeNode];
    uint64_t v15 = [v14 localIdentifier];
    mePersonLocalIdentifier = v13->_mePersonLocalIdentifier;
    v13->_mePersonLocalIdentifier = (NSString *)v15;

    id v17 = +[PGGraphNodeCollection nodesInGraph:v13->_graph];
    id v18 = [v17 universalDateInterval];
    uint64_t v19 = [v18 endDate];
    latestLibraryDate = v13->_latestLibraryDate;
    v13->_latestLibraryDate = (NSDate *)v19;

    if (v13->_latestLibraryDate)
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeInterval:sinceDate:", -63115200.0);
      earliestDateForCandidates = v13->_earliestDateForCandidates;
      v13->_earliestDateForCandidates = (NSDate *)v21;
    }
    else
    {
      earliestDateForCandidates = v13->_earliestDateForCandidates;
      v13->_earliestDateForCandidates = 0;
    }

    if (v13->_latestLibraryDate)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeInterval:sinceDate:", -220903200.0);
      earliestDateForBasePersons = v13->_earliestDateForBasePersons;
      v13->_earliestDateForBasePersons = (NSDate *)v23;
    }
    else
    {
      earliestDateForBasePersons = v13->_earliestDateForBasePersons;
      v13->_earliestDateForBasePersons = 0;
    }

    int v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    personInformationByPersonLocalIdentifier = v13->_personInformationByPersonLocalIdentifier;
    v13->_personInformationByPersonLocalIdentifier = v25;
  }
  return v13;
}

@end