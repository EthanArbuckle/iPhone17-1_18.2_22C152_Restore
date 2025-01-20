@interface PGCameraLibrarySwitchQuestionFactory
+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3;
+ (id)_libraryScopeFromPhotoLibrary:(id)a3;
- (id)_assetsFetchResultFromMoment:(id)a3;
- (id)_momentsForQuestions;
- (id)collidingQuestionTypes;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGCameraLibrarySwitchQuestionFactory

+ (id)_libraryScopeFromPhotoLibrary:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [a3 librarySpecificFetchOptions];
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v16[0] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v16[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v3 setSortDescriptors:v6];

  v7 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v3];
  if ([v7 count])
  {
    v8 = [v7 firstObject];
    if ((unint64_t)[v7 count] < 2) {
      goto LABEL_9;
    }
    v9 = +[PGLogging sharedLogging];
    v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 localIdentifier];
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGCameraLibrarySwitchQuestionFactory] more than 1 scope configured, using first one: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    v10 = [v12 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] no active scope", (uint8_t *)&v14, 2u);
    }
    v8 = 0;
  }

LABEL_9:
  return v8;
}

+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3
{
  v3 = [a1 _libraryScopeFromPhotoLibrary:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_assetsFetchResultFromMoment:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGSurveyQuestionFactory *)self workingContext];
  v6 = [v5 photoLibrary];

  v7 = [v6 librarySpecificFetchOptions];
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v7 setSortDescriptors:v10];

  uint64_t v11 = *MEMORY[0x1E4F394C0];
  v16[0] = *MEMORY[0x1E4F39448];
  v16[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v7 setFetchPropertySets:v12];

  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K== %d", @"additionalAttributes.importedBy", 1, @"additionalAttributes.importedBy", 2);
  [v7 setInternalPredicate:v13];

  [v7 setWantsIncrementalChangeDetails:0];
  int v14 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v7];

  return v14;
}

- (id)_momentsForQuestions
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PGSurveyQuestionFactory *)self workingContext];
  v3 = [v2 photoLibrary];

  id v4 = [(id)objc_opt_class() _libraryScopeFromPhotoLibrary:v3];
  if (v4)
  {
    v5 = [v3 librarySpecificFetchOptions];
    [v5 setFetchLimit:1];
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v31[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v5 setSortDescriptors:v7];

    v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %i) != 0", @"libraryScopeShareState", 8);
    [v5 setInternalPredicate:v8];

    v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInLibraryScope:v4 options:v5];
    if ([v9 count])
    {
      v10 = [v9 firstObject];
      uint64_t v11 = [v10 creationDate];

      v12 = +[PGLogging sharedLogging];
      v13 = [v12 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [v4 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        __int16 v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] getting moments from active scope: %@, first smart share date: %@", buf, 0x16u);
      }
      v15 = [v3 librarySpecificFetchOptions];
      uint64_t v26 = *MEMORY[0x1E4F394A8];
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v15 setFetchPropertySets:v16];

      [v15 setFetchLimit:100];
      v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
      v25[0] = v17;
      v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
      v25[1] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      [v15 setSortDescriptors:v19];

      v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"endDate >= %@", v11];
      [v15 setPredicate:v20];

      [v15 setWantsIncrementalChangeDetails:0];
      v21 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v15];
    }
    else
    {
      v22 = +[PGLogging sharedLogging];
      uint64_t v11 = [v22 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v23 = [v4 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] no smart sharing assets in library scope: %@", buf, 0xCu);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void (**)(void *, unsigned char *, double))_Block_copy(v5);
  double v7 = 0.0;
  if (!v6 || (double v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_8:
    v10 = [(PGSurveyQuestionFactory *)self workingContext];
    uint64_t v11 = [v10 photoLibrary];

    if ([(id)objc_opt_class() isSharedLibraryQuestionsEnabledForPhotoLibrary:v11])
    {
      if (a3)
      {
        v12 = [(id)objc_opt_class() _libraryScopeFromPhotoLibrary:v11];
        v13 = v12;
        if (!v12)
        {
          v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_104:

          goto LABEL_105;
        }
        v90 = [v12 uuid];
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v15 = [(PGCameraLibrarySwitchQuestionFactory *)self _momentsForQuestions];
        uint64_t v16 = [v15 count];
        if (v16)
        {
          unint64_t v17 = v16;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v18 = v15;
          uint64_t v79 = [v18 countByEnumeratingWithState:&v104 objects:v114 count:16];
          if (v79)
          {
            double v19 = 1.0 / (double)v17;
            uint64_t v20 = *(void *)v105;
            double v21 = 0.0;
            v77 = v6;
            id v78 = v5;
            v75 = v13;
            v76 = v11;
            v85 = v14;
            id v73 = v18;
            v74 = v15;
            v89 = self;
            uint64_t v72 = *(void *)v105;
LABEL_14:
            uint64_t v22 = 0;
LABEL_15:
            if (*(void *)v105 != v20)
            {
              uint64_t v23 = v22;
              objc_enumerationMutation(v18);
              uint64_t v22 = v23;
            }
            uint64_t v80 = v22;
            uint64_t v24 = *(void *)(*((void *)&v104 + 1) + 8 * v22);
            if (!v6) {
              goto LABEL_21;
            }
            double Current = CFAbsoluteTimeGetCurrent();
            if (Current - v7 < 0.01) {
              goto LABEL_21;
            }
            char v108 = 0;
            v6[2](v6, &v108, v21);
            if (!v108)
            {
              double v7 = Current;
LABEL_21:
              context = (void *)MEMORY[0x1D25FED50]();
              uint64_t v26 = [(PGCameraLibrarySwitchQuestionFactory *)self _assetsFetchResultFromMoment:v24];
              v97 = [MEMORY[0x1E4F1C9C8] distantPast];
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              v27 = v26;
              uint64_t v28 = [(__CFString *)v27 countByEnumeratingWithState:&v100 objects:v113 count:16];
              if (!v28)
              {
                v67 = v27;
                goto LABEL_72;
              }
              unsigned __int8 v29 = 0;
              BOOL v30 = 0;
              BOOL v31 = 0;
              int v32 = 0;
              int v91 = 0;
              v33 = 0;
              v95 = 0;
              v99 = 0;
              uint64_t v34 = *(void *)v101;
              uint64_t v35 = v28;
              uint64_t v82 = *(void *)v101;
              v83 = v27;
LABEL_23:
              uint64_t v36 = 0;
              uint64_t v84 = v35;
              while (1)
              {
                if (*(void *)v101 != v34) {
                  objc_enumerationMutation(v27);
                }
                v37 = *(void **)(*((void *)&v100 + 1) + 8 * v36);
                if (([v37 isCloudPhotoLibraryAsset] & 1) == 0) {
                  break;
                }
LABEL_68:
                if (v35 == ++v36)
                {
                  uint64_t v35 = [(__CFString *)v27 countByEnumeratingWithState:&v100 objects:v113 count:16];
                  if (v35) {
                    goto LABEL_23;
                  }

                  v6 = v77;
                  id v5 = v78;
                  v13 = v75;
                  uint64_t v11 = v76;
                  v67 = v33;
                  id v14 = v85;
                  id v18 = v73;
                  v15 = v74;
                  self = v89;
LABEL_72:

                  double v21 = v19 + v21;
                  uint64_t v22 = v80 + 1;
                  uint64_t v20 = v72;
                  if (v80 + 1 == v79)
                  {
                    uint64_t v68 = [v18 countByEnumeratingWithState:&v104 objects:v114 count:16];
                    uint64_t v20 = v72;
                    uint64_t v79 = v68;
                    if (!v68) {
                      goto LABEL_95;
                    }
                    goto LABEL_14;
                  }
                  goto LABEL_15;
                }
              }
              int v87 = v32;
              BOOL v38 = v31;
              v39 = [v37 libraryScopeProperties];
              int v40 = [v39 suggestedByClientType];
              BOOL v94 = v40 == 3;
              int v41 = [v39 assetRejectedByCamera];
              BOOL v93 = v40 == 2;
              if (v40 == -1)
              {
                HIDWORD(v96) = [v39 assetManuallyRejectedByUser];
              }
              else
              {
                uint64_t v96 = 0;
                v42 = @"auto on";
                if (v40 == 3)
                {
LABEL_41:
                  v98 = v42;
                  v44 = [v37 creationDate];
                  [v44 timeIntervalSinceDate:v97];
                  if (v45 >= 180.0
                    || (v29 & ((v40 & 0xFFFFFFFE) == 2)) != 0
                    || (v30 & (HIDWORD(v96) | v41) & 1) != 0
                    || (v40 == 3 ? (int v46 = 1) : (int v46 = v41),
                        ((v38 | v87) & v46 & 1) != 0
                     || (v96 & (v91 ^ 1) & 1) != 0
                     || (v91 & (v96 ^ 1)) != 0))
                  {
                    v92 = v44;
                    v47 = @"none";
                    if (v33) {
                      v47 = v33;
                    }
                    v48 = v47;
                    v49 = [PGCameraLibrarySwitchQuestion alloc];
                    v50 = [v37 uuid];
                    v51 = [(PGCameraLibrarySwitchQuestion *)v49 initWithAssetUUID:v50 libraryScopeUUID:v90 previousSwitchState:v48 currentSwitchState:v98];

                    id v14 = v85;
                    if ([(PGSurveyQuestionFactory *)v89 shouldAddQuestion:v51 toAlreadyGeneratedQuestions:v85])
                    {
                      v52 = v33;
                      v53 = +[PGLogging sharedLogging];
                      v54 = [v53 loggingConnection];

                      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                      {
                        v55 = [v37 uuid];
                        *(_DWORD *)buf = 138412802;
                        *(void *)v110 = v55;
                        *(_WORD *)&v110[8] = 2112;
                        *(void *)&v110[10] = v48;
                        __int16 v111 = 2112;
                        v112 = v98;
                        _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] question for asset %@, camera library switch state: %@ -> %@", buf, 0x20u);
                      }
                      [v85 addObject:v51];
                      v33 = v52;
                      if ([v85 count] >= a3) {
                        goto LABEL_94;
                      }
                    }
                    if (v99)
                    {
                      v56 = @"none";
                      if (v95) {
                        v56 = v95;
                      }
                      v57 = v56;
                      v58 = [[PGCameraLibrarySwitchQuestion alloc] initWithAssetUUID:v99 libraryScopeUUID:v90 previousSwitchState:v57 currentSwitchState:v48];
                      if ([(PGSurveyQuestionFactory *)v89 shouldAddQuestion:v58 toAlreadyGeneratedQuestions:v85])
                      {
                        v88 = v33;
                        v59 = +[PGLogging sharedLogging];
                        v60 = [v59 loggingConnection];

                        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412802;
                          *(void *)v110 = v99;
                          *(_WORD *)&v110[8] = 2112;
                          *(void *)&v110[10] = v57;
                          __int16 v111 = 2112;
                          v112 = v48;
                          _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] question for previous asset %@, camera library switch state: %@ -> %@", buf, 0x20u);
                        }

                        id v14 = v85;
                        [v85 addObject:v58];
                        v33 = v88;
                        if ([v85 count] >= a3)
                        {

LABEL_94:
                          v6 = v77;
                          id v5 = v78;
                          v13 = v75;
                          uint64_t v11 = v76;
                          id v18 = v73;
                          v15 = v74;
                          goto LABEL_95;
                        }
                      }
                    }
                    v44 = v92;
                  }
                  id v61 = v44;

                  v62 = @"none";
                  if (v33) {
                    v62 = v33;
                  }
                  v63 = v62;

                  v64 = v98;
                  v65 = v33;
                  v33 = v64;

                  uint64_t v66 = [v37 uuid];

                  v97 = v61;
                  unsigned __int8 v29 = v41;
                  BOOL v31 = v93;
                  BOOL v30 = v94;
                  int v32 = HIDWORD(v96);
                  int v91 = v96;
                  v95 = v63;
                  v99 = (void *)v66;
                  uint64_t v34 = v82;
                  v27 = v83;
                  uint64_t v35 = v84;
                  goto LABEL_68;
                }
              }
              if (v40 == 2) {
                char v43 = 1;
              }
              else {
                char v43 = v41;
              }
              v42 = @"user on";
              if (v41) {
                v42 = @"auto off";
              }
              if (v43)
              {
                LODWORD(v96) = 0;
              }
              else
              {
                v42 = @"default off";
                if (HIDWORD(v96)) {
                  v42 = @"user off";
                }
                LODWORD(v96) = HIDWORD(v96) ^ 1;
              }
              goto LABEL_41;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v110 = 78;
              *(_WORD *)&v110[4] = 2080;
              *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_101;
          }
LABEL_95:

          if (!v6 || CFAbsoluteTimeGetCurrent() - v7 < 0.01 || (char v108 = 0, v6[2](v6, &v108, 1.0), !v108))
          {
            v9 = [v14 allObjects];
            goto LABEL_103;
          }
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_101:
            v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_103:

            goto LABEL_104;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v110 = 179;
          *(_WORD *)&v110[4] = 2080;
          *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
          v70 = MEMORY[0x1E4F14500];
        }
        else
        {
          if (!v6) {
            goto LABEL_101;
          }
          if (CFAbsoluteTimeGetCurrent() - v7 < 0.01) {
            goto LABEL_101;
          }
          char v108 = 0;
          v6[2](v6, &v108, 1.0);
          if (!v108 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_101;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v110 = 69;
          *(_WORD *)&v110[4] = 2080;
          *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
          v70 = MEMORY[0x1E4F14500];
        }
        _os_log_impl(&dword_1D1805000, v70, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_101;
      }
      if (!v6
        || CFAbsoluteTimeGetCurrent() - v7 < 0.01
        || (char v108 = 0, v6[2](v6, &v108, 1.0), !v108)
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_86:
        v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_105:

        goto LABEL_106;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v110 = 54;
      *(_WORD *)&v110[4] = 2080;
      *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
      v69 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v6) {
        goto LABEL_86;
      }
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01) {
        goto LABEL_86;
      }
      char v108 = 0;
      v6[2](v6, &v108, 1.0);
      if (!v108 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_86;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v110 = 49;
      *(_WORD *)&v110[4] = 2080;
      *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
      v69 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v69, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_86;
  }
  char v108 = 0;
  v6[2](v6, &v108, 0.0);
  if (!v108)
  {
    double v7 = v8;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v110 = 45;
    *(_WORD *)&v110[4] = 2080;
    *(void *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_106:

  return v9;
}

- (int64_t)questionOptions
{
  return 0x200000;
}

- (id)collidingQuestionTypes
{
  return &unk_1F28D3DC8;
}

- (unsigned)questionType
{
  return 23;
}

@end