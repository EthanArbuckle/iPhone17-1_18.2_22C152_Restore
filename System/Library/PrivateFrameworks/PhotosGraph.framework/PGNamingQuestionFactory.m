@interface PGNamingQuestionFactory
- (BOOL)_persistQuestions:(id)a3 questionsToRemove:(id)a4;
- (BOOL)_shouldAddNewNamingQuestionForPersonUUID:(id)a3;
- (PHFetchResult)persons;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)setPersons:(id)a3;
@end

@implementation PGNamingQuestionFactory

- (void).cxx_destruct
{
}

- (void)setPersons:(id)a3
{
}

- (BOOL)_persistQuestions:(id)a3 questionsToRemove:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    v8 = [(PGSurveyQuestionFactory *)self workingContext];
    v9 = [v8 photoLibrary];

    v10 = [MEMORY[0x1E4F1C9C8] date];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__PGNamingQuestionFactory__persistQuestions_questionsToRemove___block_invoke;
    v19[3] = &unk_1E68EF730;
    id v20 = v7;
    id v21 = v6;
    id v11 = v10;
    id v22 = v11;
    v23 = self;
    id v18 = 0;
    char v12 = [v9 performChangesAndWait:v19 error:&v18];
    id v13 = v18;
    v14 = +[PGLogging sharedLogging];
    v15 = [v14 loggingConnection];

    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting naming questions", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [v13 description];
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for naming questions: %@", buf, 0xCu);
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

void __63__PGNamingQuestionFactory__persistQuestions_questionsToRemove___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39258] deleteQuestions:*(void *)(a1 + 32)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "questionVersion", (void)v7));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_shouldAddNewNamingQuestionForPersonUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PGSurveyQuestionFactory *)self existingQuestionsForEntityIdentifier:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "state", (void)v10) == 2)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  long long v7 = [MEMORY[0x1E4F1CA80] set];
  BOOL v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  long long v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    double v6 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_51;
    }
    goto LABEL_10;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = 0.0;
  if (Current >= 0.01)
  {
    double v7 = Current;
    char v71 = 0;
    v4[2](v4, &v71, 0.0);
    if (v71)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v75 = 60;
        __int16 v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Deprecated/Naming/PGNamingQuestionFactory.m";
        BOOL v8 = MEMORY[0x1E4F14500];
LABEL_42:
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
    double v6 = v7;
  }
  if (*(void *)(a1 + 56))
  {
LABEL_10:
    v54 = v4;
    id v51 = v3;
    id v9 = [v3 graph];
    id v10 = [*(id *)(a1 + 32) persons];
    long long v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          id v18 = [v17 localIdentifier];
          [v11 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v14);
    }

    v53 = [MEMORY[0x1E4F1CA80] set];
    v52 = [MEMORY[0x1E4F1CA80] set];
    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    unint64_t v20 = [v11 allKeys];
    v50 = v9;
    id v21 = [v9 personNodesForPersonLocalIdentifiers:v20];
    id v22 = [v19 setWithArray:v21];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v22;
    uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v57)
    {
      uint64_t v56 = *(void *)v64;
      uint64_t v4 = v54;
      while (2)
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v64 != v56) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          uint64_t v25 = [*(id *)(a1 + 40) count];
          if (v4)
          {
            unint64_t v26 = v25;
            unint64_t v27 = *(void *)(a1 + 56);
            double v28 = CFAbsoluteTimeGetCurrent();
            if (v28 - v6 >= 0.01)
            {
              char v71 = 0;
              v4[2](v4, &v71, (double)v26 / (double)v27);
              if (v71)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v75 = 87;
                  __int16 v76 = 2080;
                  v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Deprecated/Naming/PGNamingQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v49 = v50;
                id v3 = v51;
                goto LABEL_50;
              }
              double v6 = v28;
            }
          }
          v29 = [v24 localIdentifier];
          v30 = [v11 objectForKeyedSubscript:v29];
          v31 = v30;
          if (v30)
          {
            v32 = *(void **)(a1 + 32);
            v33 = [v30 uuid];
            LODWORD(v32) = [v32 _shouldAddNewNamingQuestionForPersonUUID:v33];

            if (v32)
            {
              v34 = [v24 contactIdentifier];
              if ([v34 length])
              {
                v35 = [PGNamingQuestion alloc];
                v36 = [*(id *)(a1 + 32) workingContext];
                v37 = [v36 serviceManager];
                v38 = [(PGNamingQuestion *)v35 initWithConfirmedPerson:v31 contactIdentifier:v34 localFactoryScore:v37 serviceManager:1.0];

                [v52 addObject:v38];
                v39 = *(void **)(a1 + 32);
                v40 = [v31 uuid];
                v41 = [v39 existingQuestionsForEntityIdentifier:v40];
                [v53 addObjectsFromArray:v41];
              }
              else
              {
                v58[0] = MEMORY[0x1E4F143A8];
                v58[1] = 3221225472;
                v58[2] = __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_195;
                v58[3] = &unk_1E68E4F98;
                id v42 = v31;
                uint64_t v43 = *(void *)(a1 + 32);
                v44 = *(void **)(a1 + 40);
                id v59 = v42;
                uint64_t v60 = v43;
                id v45 = v44;
                uint64_t v46 = *(void *)(a1 + 56);
                id v61 = v45;
                uint64_t v62 = v46;
                [v24 enumerateContactSuggestionsSortedByConfidenceMatchingQuery:1 usingBlock:v58];
                unint64_t v47 = [*(id *)(a1 + 40) count];
                unint64_t v48 = *(void *)(a1 + 56);

                if (v47 >= v48)
                {

                  goto LABEL_44;
                }
              }

              uint64_t v4 = v54;
            }
          }
        }
        uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
        if (v57) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_44:
      uint64_t v4 = v54;
    }

    [*(id *)(a1 + 32) _persistQuestions:v52 questionsToRemove:v53];
    v49 = v50;
    id v3 = v51;
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v71 = 0;
        v4[2](v4, &v71, 1.0);
        if (v71)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v75 = 133;
            __int16 v76 = 2080;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Deprecated/Naming/PGNamingQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_50:

    goto LABEL_51;
  }
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    char v71 = 0;
    v4[2](v4, &v71, 1.0);
    if (v71)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v75 = 64;
        __int16 v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Deprecated/Naming/PGNamingQuestionFactory.m";
        BOOL v8 = MEMORY[0x1E4F14500];
        goto LABEL_42;
      }
    }
  }
LABEL_51:
}

void __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_195(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v16 = a3;
  BOOL v8 = [a2 contactIdentifier];
  if ([v8 length])
  {
    id v9 = [PGNamingQuestion alloc];
    uint64_t v10 = *(void *)(a1 + 32);
    [v16 confidence];
    double v12 = v11;
    uint64_t v13 = [*(id *)(a1 + 40) workingContext];
    uint64_t v14 = [v13 serviceManager];
    uint64_t v15 = [(PGNamingQuestion *)v9 initWithPerson:v10 contactIdentifier:v8 localFactoryScore:v14 serviceManager:v12];

    if ([*(id *)(a1 + 40) shouldAddQuestion:v15 toAlreadyGeneratedQuestions:*(void *)(a1 + 48)])
    {
      [*(id *)(a1 + 48) addObject:v15];
      if ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 56)) {
        *a5 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 1;
}

- (unsigned)questionType
{
  return 1;
}

- (PHFetchResult)persons
{
  persons = self->_persons;
  if (!persons)
  {
    uint64_t v4 = [(PGSurveyQuestionFactory *)self workingContext];
    uint64_t v5 = [v4 photoLibrary];
    double v6 = +[PGPeopleQuestionFactoryUtils personsWithPeopleHomeContextForPhotoLibrary:v5];
    double v7 = self->_persons;
    self->_persons = v6;

    persons = self->_persons;
  }
  return persons;
}

@end