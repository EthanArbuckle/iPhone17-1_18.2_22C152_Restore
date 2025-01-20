@interface PGRelationshipQuestionFactory
+ (id)displayStringForRelationshipLabel:(id)a3;
+ (id)initialQuestionRelationshipLabelByRelationship;
+ (id)localFactoryScoreByRelationshipLabels;
+ (id)relationshipLabelsRequiringInitialQuestion;
+ (id)relationshipTypesByRelationshipLabel;
+ (unint64_t)relationshipTagForRelatationshipType:(unint64_t)a3;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (id)initialQuestionForRelationshipLabel:(id)a3;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)updateInitialQuestion:(id)a3;
- (void)updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded;
@end

@implementation PGRelationshipQuestionFactory

+ (id)displayStringForRelationshipLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHILD"])
  {
    v4 = @"👶";
  }
  else if ([v3 isEqualToString:@"SIBLING"])
  {
    v4 = @"👧 👦";
  }
  else
  {
    v4 = &stru_1F283BC78;
  }

  return v4;
}

+ (id)relationshipLabelsRequiringInitialQuestion
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"CHILD";
  v6[1] = @"DAUGHTER";
  v6[2] = @"SON";
  v6[3] = @"SIBLING";
  v6[4] = @"SISTER";
  v6[5] = @"BROTHER";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return v4;
}

+ (unint64_t)relationshipTagForRelatationshipType:(unint64_t)a3
{
  if (a3 > 0x11) {
    return 10;
  }
  else {
    return qword_1D1F50078[a3];
  }
}

+ (id)localFactoryScoreByRelationshipLabels
{
  v44[13] = *MEMORY[0x1E4F143B8];
  v41[0] = &unk_1F28D2CA0;
  v41[1] = &unk_1F28D2CB8;
  v42[0] = &unk_1F28D5858;
  v42[1] = &unk_1F28D5868;
  v43[0] = @"PARTNER";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v44[0] = v16;
  v43[1] = @"FAMILY";
  v39[0] = &unk_1F28D2CA0;
  v39[1] = &unk_1F28D2CB8;
  v40[0] = &unk_1F28D5878;
  v40[1] = &unk_1F28D5888;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v44[1] = v15;
  v43[2] = @"CHILD";
  v37[0] = &unk_1F28D2CA0;
  v37[1] = &unk_1F28D2CB8;
  v38[0] = &unk_1F28D5868;
  v38[1] = &unk_1F28D5898;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v44[2] = v14;
  v43[3] = @"SON";
  v35[0] = &unk_1F28D2CA0;
  v35[1] = &unk_1F28D2CB8;
  v36[0] = &unk_1F28D5898;
  v36[1] = &unk_1F28D58A8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v44[3] = v13;
  v43[4] = @"DAUGHTER";
  v33[0] = &unk_1F28D2CA0;
  v33[1] = &unk_1F28D2CB8;
  v34[0] = &unk_1F28D5898;
  v34[1] = &unk_1F28D58A8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v44[4] = v12;
  v43[5] = @"FRIEND";
  v31[0] = &unk_1F28D2CA0;
  v31[1] = &unk_1F28D2CB8;
  v32[0] = &unk_1F28D58B8;
  v32[1] = &unk_1F28D58C8;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v44[5] = v11;
  v43[6] = @"PARENT";
  v29[0] = &unk_1F28D2CA0;
  v29[1] = &unk_1F28D2CB8;
  v30[0] = &unk_1F28D58D8;
  v30[1] = &unk_1F28D58C8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v44[6] = v2;
  v43[7] = @"FATHER";
  v27[0] = &unk_1F28D2CA0;
  v27[1] = &unk_1F28D2CB8;
  v28[0] = &unk_1F28D58E8;
  v28[1] = &unk_1F28D58E8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v44[7] = v3;
  v43[8] = @"MOTHER";
  v25[0] = &unk_1F28D2CA0;
  v25[1] = &unk_1F28D2CB8;
  v26[0] = &unk_1F28D58E8;
  v26[1] = &unk_1F28D58E8;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v44[8] = v4;
  v43[9] = @"SIBLING";
  v23[0] = &unk_1F28D2CA0;
  v23[1] = &unk_1F28D2CB8;
  v24[0] = &unk_1F28D58F8;
  v24[1] = &unk_1F28D5908;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v44[9] = v5;
  v43[10] = @"BROTHER";
  v21[0] = &unk_1F28D2CA0;
  v21[1] = &unk_1F28D2CB8;
  v22[0] = &unk_1F28D5918;
  v22[1] = &unk_1F28D5928;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v44[10] = v6;
  v43[11] = @"SISTER";
  v19[0] = &unk_1F28D2CA0;
  v19[1] = &unk_1F28D2CB8;
  v20[0] = &unk_1F28D5918;
  v20[1] = &unk_1F28D5928;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v44[11] = v7;
  v43[12] = @"COWORKER";
  v17[0] = &unk_1F28D2CA0;
  v17[1] = &unk_1F28D2CB8;
  v18[0] = &unk_1F28D5938;
  v18[1] = &unk_1F28D5948;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v44[12] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:13];

  return v9;
}

+ (id)relationshipTypesByRelationshipLabel
{
  v5[13] = *MEMORY[0x1E4F143B8];
  v4[0] = @"FAMILY";
  v4[1] = @"PARENT";
  v5[0] = &unk_1F28D4C20;
  v5[1] = &unk_1F28D4C38;
  v4[2] = @"FATHER";
  v4[3] = @"MOTHER";
  v5[2] = &unk_1F28D4C50;
  v5[3] = &unk_1F28D4C68;
  v4[4] = @"CHILD";
  v4[5] = @"SON";
  v5[4] = &unk_1F28D4C80;
  v5[5] = &unk_1F28D4C98;
  v4[6] = @"DAUGHTER";
  v4[7] = @"FRIEND";
  v5[6] = &unk_1F28D4CB0;
  v5[7] = &unk_1F28D4CC8;
  v4[8] = @"COWORKER";
  v4[9] = @"PARTNER";
  v5[8] = &unk_1F28D4CE0;
  v5[9] = &unk_1F28D4CF8;
  v4[10] = @"SIBLING";
  v4[11] = @"SISTER";
  v5[10] = &unk_1F28D4D10;
  v5[11] = &unk_1F28D4D28;
  v4[12] = @"BROTHER";
  v5[12] = &unk_1F28D4D40;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

+ (id)initialQuestionRelationshipLabelByRelationship
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SIBLING";
  v4[1] = @"SISTER";
  v5[0] = @"SIBLING";
  v5[1] = @"SIBLING";
  v4[2] = @"BROTHER";
  v4[3] = @"SON";
  v5[2] = @"SIBLING";
  v5[3] = @"CHILD";
  v4[4] = @"DAUGHTER";
  v4[5] = @"CHILD";
  v5[4] = @"CHILD";
  v5[5] = @"CHILD";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

- (void)updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded
{
  v46[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PGSurveyQuestionFactory *)self workingContext];
  id v3 = [v2 photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 5);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"entityType", 1);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"state", 2);
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v29 = (void *)v7;
  v30 = (void *)v6;
  v46[0] = v7;
  v46[1] = v6;
  v31 = (void *)v5;
  v46[2] = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  v10 = [v8 andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  v32 = v4;
  v11 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v4 validQuestionsOnly:0];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    uint64_t v15 = *MEMORY[0x1E4F8EA28];
    uint64_t v34 = *MEMORY[0x1E4F8E920];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D25FED50]();
        v19 = [v17 additionalInfo];
        v20 = [v19 objectForKeyedSubscript:v15];
        if ([v20 isEqualToString:@"CHILD"])
        {
          v21 = [v19 objectForKeyedSubscript:v34];

          if (!v21) {
            [v33 addObject:v17];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v13);
  }

  if ([v33 count])
  {
    v22 = [(PGSurveyQuestionFactory *)self workingContext];
    v23 = [v22 photoLibrary];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __92__PGRelationshipQuestionFactory_updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded__block_invoke;
    v37[3] = &unk_1E68F0B18;
    id v38 = v33;
    id v36 = 0;
    char v24 = [v23 performChangesAndWait:v37 error:&v36];
    id v25 = v36;

    if ((v24 & 1) == 0)
    {
      v26 = +[PGLogging sharedLogging];
      v27 = [v26 loggingConnection];

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v25;
        _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "[Questions] Failed to perform library changes for relationship inital question with error: %@", buf, 0xCu);
      }
    }
  }
}

void __92__PGRelationshipQuestionFactory_updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39258], "changeRequestForQuestion:", *(void *)(*((void *)&v8 + 1) + 8 * v5), (void)v8);
        [v6 setState:0];
        uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
        [v6 setCreationDate:v7];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)updateInitialQuestion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v6 = [v5 photoLibrary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PGRelationshipQuestionFactory_updateInitialQuestion___block_invoke;
  v13[3] = &unk_1E68F0B18;
  id v7 = v4;
  id v14 = v7;
  id v12 = 0;
  char v8 = [v6 performChangesAndWait:v13 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    long long v10 = +[PGLogging sharedLogging];
    long long v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[Questions] Failed to perform library changes for relationship inital question with error: %@", buf, 0xCu);
    }
  }
}

void __55__PGRelationshipQuestionFactory_updateInitialQuestion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39258] changeRequestForQuestion:*(void *)(a1 + 32)];
  [v2 setState:0];
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setCreationDate:v1];
}

- (id)initialQuestionForRelationshipLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v6 = [v5 photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  [v7 setFetchLimit:1];
  char v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type = %d AND entityType = %d AND entityIdentifier = %@", 5, 4, v4];

  [v7 setPredicate:v8];
  id v9 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v7 validQuestionsOnly:0];
  long long v10 = [v9 firstObject];

  return v10;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  [(PGRelationshipQuestionFactory *)self updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  char v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  id v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  uint64_t v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  long long v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v110 = a2;
  v137 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v137)
  {
    double v4 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_159;
    }
    goto LABEL_10;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = 0.0;
  if (Current >= 0.01)
  {
    double v5 = Current;
    unsigned __int8 v166 = 0;
    v137[2](v137, &v166, 0.0);
    if (v166)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v173 = 63;
        *(_WORD *)&v173[4] = 2080;
        *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
        id v6 = MEMORY[0x1E4F14500];
LABEL_44:
        _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_159;
      }
      goto LABEL_159;
    }
    double v4 = v5;
  }
  if (*(void *)(a1 + 56))
  {
LABEL_10:
    id v7 = [v110 graph];
    v111 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v7];
    v112 = v7;
    char v8 = [v7 meNode];
    id v9 = (void *)MEMORY[0x1E4F391F0];
    id v10 = [v8 localIdentifier];
    uint64_t v11 = [v9 uuidFromLocalIdentifier:v10];

    v125 = v8;
    v109 = (void *)v11;
    if (v8 && v11)
    {
      id v12 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:@"ME" confirmedPersonUUID:v11];
      if ([*(id *)(a1 + 32) shouldAddQuestion:v12 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
      {
        uint64_t v13 = v12;
        [*(id *)(a1 + 40) addObject:v12];
        if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
        {
          if (v137)
          {
            uint64_t v14 = v109;
            if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
            {
              unsigned __int8 v166 = 0;
              v137[2](v137, &v166, 1.0);
              if (v166)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v173 = 117;
                  *(_WORD *)&v173[4] = 2080;
                  *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
            }
          }
          else
          {
            uint64_t v14 = v109;
          }
LABEL_158:

          goto LABEL_159;
        }
      }
      else
      {
        uint64_t v13 = v12;
      }
    }
    else
    {
      uint64_t v15 = [v112 meNode];
      id v16 = [v15 inferredPersonNode];

      uint64_t v13 = v16;
      if (v16)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F391F0];
        id v18 = [(PGRelationshipQuestion *)v16 localIdentifier];
        id v19 = [v17 uuidFromLocalIdentifier:v18];

        unint64_t v20 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:@"ME" personUUID:v19 localFactoryScore:1.0];
        if ([*(id *)(a1 + 32) shouldAddQuestion:v20 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
        {
          [*(id *)(a1 + 40) addObject:v20];
          if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
          {
            uint64_t v14 = v109;
            if (v137)
            {
              if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
              {
                unsigned __int8 v166 = 0;
                v137[2](v137, &v166, 1.0);
                if (v166)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v173 = 87;
                    *(_WORD *)&v173[4] = 2080;
                    *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                }
              }
            }
LABEL_157:

            goto LABEL_158;
          }
        }
      }
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id v19 = [v111 localIdentifiers];
      uint64_t v21 = [v19 countByEnumeratingWithState:&v162 objects:v171 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v163;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v163 != v23) {
              objc_enumerationMutation(v19);
            }
            id v25 = *(void **)(*((void *)&v162 + 1) + 8 * i);
            uint64_t v26 = [(PGRelationshipQuestion *)v13 localIdentifier];
            if (v26)
            {
              v27 = (void *)v26;
              v28 = [(PGRelationshipQuestion *)v13 localIdentifier];
              char v29 = [v25 isEqualToString:v28];

              if (v29) {
                continue;
              }
            }
            unint64_t v20 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v25];
            v30 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:@"ME" personUUID:v20 localFactoryScore:0.99];
            if ([*(id *)(a1 + 32) shouldAddQuestion:v30 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
            {
              [*(id *)(a1 + 40) addObject:v30];
              if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
              {
                uint64_t v14 = v109;
                if (v137)
                {
                  if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
                  {
                    unsigned __int8 v166 = 0;
                    v137[2](v137, &v166, 1.0);
                    if (v166)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v173 = 101;
                        *(_WORD *)&v173[4] = 2080;
                        *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                    }
                  }
                }
                goto LABEL_156;
              }
            }
            uint64_t v31 = [*(id *)(a1 + 40) count];
            if (v137)
            {
              unint64_t v32 = v31;
              unint64_t v33 = *(void *)(a1 + 56);
              double v34 = CFAbsoluteTimeGetCurrent();
              if (v34 - v4 >= 0.01)
              {
                unsigned __int8 v166 = 0;
                v137[2](v137, &v166, (double)v32 / (double)v33);
                if (v166)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v173 = 106;
                    *(_WORD *)&v173[4] = 2080;
                    *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  uint64_t v14 = v109;
LABEL_156:

                  goto LABEL_157;
                }
                double v4 = v34;
              }
            }
          }
          uint64_t v22 = [v19 countByEnumeratingWithState:&v162 objects:v171 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
    }
    v35 = [(id)objc_opt_class() localFactoryScoreByRelationshipLabels];
    v114 = [(id)objc_opt_class() relationshipTypesByRelationshipLabel];
    id v36 = [v35 allKeys];
    v160[0] = MEMORY[0x1E4F143A8];
    v160[1] = 3221225472;
    v160[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_194;
    v160[3] = &unk_1E68EF618;
    v115 = v35;
    v161 = v115;
    v37 = [v36 sortedArrayUsingComparator:v160];

    id v38 = +[PGGraphNodeCollection nodesInGraph:v112];
    long long v39 = [v38 relationshipTagNodes];

    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_198;
    v157[3] = &unk_1E68EF668;
    id v124 = v41;
    id v158 = v124;
    id v123 = v40;
    id v159 = v123;
    v108 = v39;
    [v39 enumerateNodesUsingBlock:v157];
    v119 = [(id)objc_opt_class() relationshipLabelsRequiringInitialQuestion];
    v113 = [(id)objc_opt_class() initialQuestionRelationshipLabelByRelationship];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id obj = v37;
    uint64_t v118 = [obj countByEnumeratingWithState:&v153 objects:v170 count:16];
    if (v118)
    {
      char v135 = 0;
      uint64_t v117 = *(void *)v154;
      while (1)
      {
        for (uint64_t j = 0; j != v118; ++j)
        {
          if (*(void *)v154 != v117) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void *)(*((void *)&v153 + 1) + 8 * j);
          context = (void *)MEMORY[0x1D25FED50]();
          if ([v119 containsObject:v43])
          {
            id v44 = [v113 objectForKeyedSubscript:v43];
            v45 = [*(id *)(a1 + 32) initialQuestionForRelationshipLabel:v44];
            v46 = v45;
            if (!v45)
            {
              [(id)objc_opt_class() displayStringForRelationshipLabel:v44];
              v52 = uint64_t v51 = j;
              v53 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:v44 personUUID:v44 displayString:v52 localFactoryScore:1.0];
              [*(id *)(a1 + 40) addObject:v53];

              uint64_t j = v51;
LABEL_59:

              continue;
            }
            if (![v45 state]) {
              goto LABEL_59;
            }
            if ([v46 state] == 3 || objc_msgSend(v46, "state") == 1)
            {
              [v46 creationDate];
              v48 = uint64_t v47 = j;
              [v48 timeIntervalSinceNow];
              double v50 = v49;

              uint64_t j = v47;
              if (v50 < -15778800.0) {
                [*(id *)(a1 + 32) updateInitialQuestion:v46];
              }
              goto LABEL_59;
            }
          }
          uint64_t v120 = j;
          v133 = [(PGRelationshipQuestion *)v115 objectForKeyedSubscript:v43];
          v54 = [v133 objectForKeyedSubscript:&unk_1F28D2CB8];
          [v54 doubleValue];
          double v56 = v55;

          uint64_t v136 = v43;
          v57 = [v114 objectForKeyedSubscript:v43];
          id v128 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v122 = v57;
          uint64_t v127 = [v122 countByEnumeratingWithState:&v149 objects:v169 count:16];
          if (!v127) {
            goto LABEL_102;
          }
          uint64_t v126 = *(void *)v150;
          while (2)
          {
            uint64_t v58 = 0;
LABEL_64:
            if (*(void *)v150 != v126) {
              objc_enumerationMutation(v122);
            }
            uint64_t v59 = [*(id *)(*((void *)&v149 + 1) + 8 * v58) unsignedIntegerValue];
            id v60 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v146[0] = MEMORY[0x1E4F143A8];
            v146[1] = 3221225472;
            v146[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_203;
            v146[3] = &unk_1E68EF690;
            id v62 = v60;
            id v147 = v62;
            id v63 = v61;
            id v148 = v63;
            [v125 enumeratePersonNodesWithRelationship:v59 matchingQuery:3 usingBlock:v146];
            v64 = +[PGGraphPersonRelationshipTagNode labelForRelationshipTag:](PGGraphPersonRelationshipTagNode, "labelForRelationshipTag:", [(id)objc_opt_class() relationshipTagForRelatationshipType:v59]);
            uint64_t v65 = [v123 objectForKeyedSubscript:v64];
            uint64_t v66 = [v124 objectForKeyedSubscript:v64];
            id v67 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            [v67 unionSet:v62];
            [v67 unionSet:v63];
            v134 = (void *)v65;
            [v67 unionSet:v65];
            v132 = (void *)v66;
            [v67 unionSet:v66];
            [v128 unionSet:v67];
            long long v144 = 0u;
            long long v145 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            id v68 = v67;
            uint64_t v69 = [v68 countByEnumeratingWithState:&v142 objects:v168 count:16];
            if (!v69) {
              goto LABEL_84;
            }
            uint64_t v70 = v69;
            uint64_t v71 = *(void *)v143;
            uint64_t v130 = v58;
            id v131 = v63;
            v129 = v64;
LABEL_68:
            uint64_t v72 = 0;
            while (1)
            {
              if (*(void *)v143 != v71) {
                objc_enumerationMutation(v68);
              }
              v73 = *(void **)(*((void *)&v142 + 1) + 8 * v72);
              v74 = (void *)MEMORY[0x1E4F391F0];
              v75 = [v73 localIdentifier];
              v76 = [v74 uuidFromLocalIdentifier:v75];

              if (!v76)
              {
                v90 = +[PGLogging sharedLogging];
                p_super = [v90 loggingConnection];

                if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v173 = v73;
                  _os_log_error_impl(&dword_1D1805000, p_super, OS_LOG_TYPE_ERROR, "Cannot get uuid for person %@", buf, 0xCu);
                }
                v76 = 0;
                double v85 = v4;
                goto LABEL_98;
              }
              if (([v62 containsObject:v73] & 1) != 0
                || [v134 containsObject:v73])
              {
                v77 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:v136 confirmedPersonUUID:v76];
              }
              else
              {
                v78 = [v133 objectForKeyedSubscript:&unk_1F28D2CA0];
                [v78 doubleValue];
                double v80 = v79;

                v77 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:v136 personUUID:v76 localFactoryScore:v80];
              }
              p_super = &v77->super.super;
              if ([*(id *)(a1 + 32) shouldAddQuestion:v77 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
              {
                [*(id *)(a1 + 40) addObject:p_super];
                if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56)) {
                  break;
                }
              }
              uint64_t v82 = [*(id *)(a1 + 40) count];
              if (v137)
              {
                unint64_t v83 = v82;
                unint64_t v84 = *(void *)(a1 + 56);
                double v85 = CFAbsoluteTimeGetCurrent();
                if (v85 - v4 >= 0.01)
                {
                  unsigned __int8 v166 = 0;
                  v137[2](v137, &v166, (double)v83 / (double)v84);
                  if (v166 | v135 & 1)
                  {
                    v91 = MEMORY[0x1E4F14500];
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v173 = 224;
                      *(_WORD *)&v173[4] = 2080;
                      *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                      _os_log_impl(&dword_1D1805000, v91, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                    char v135 = 1;
LABEL_98:
                    id v63 = v131;

                    int v87 = 0;
                    int v88 = 0;
                    int v89 = 1;
                    double v4 = v85;
                    v64 = v129;
                    uint64_t v58 = v130;
                    goto LABEL_99;
                  }
                  char v135 = 0;
                  double v4 = v85;
                }
              }

              if (v70 == ++v72)
              {
                uint64_t v70 = [v68 countByEnumeratingWithState:&v142 objects:v168 count:16];
                uint64_t v58 = v130;
                id v63 = v131;
                v64 = v129;
                if (v70) {
                  goto LABEL_68;
                }
LABEL_84:

                if ((v135 & 1) == 0) {
                  goto LABEL_92;
                }
LABEL_85:
                char v135 = 1;
                v86 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v173 = 227;
                  *(_WORD *)&v173[4] = 2080;
                  *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                  char v135 = 1;
                  _os_log_impl(&dword_1D1805000, v86, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                int v87 = 0;
                int v88 = 0;
                int v89 = 1;
                goto LABEL_99;
              }
            }

            uint64_t v58 = v130;
            id v63 = v131;
            v64 = v129;
            if (v135) {
              goto LABEL_85;
            }
LABEL_92:
            char v135 = 0;
            if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
            {
              int v87 = 0;
              int v89 = 6;
              int v88 = 1;
            }
            else
            {
              int v88 = 0;
              int v89 = 0;
              int v87 = 1;
            }
LABEL_99:

            if (v87)
            {
              if (++v58 == v127)
              {
                uint64_t v127 = [v122 countByEnumeratingWithState:&v149 objects:v169 count:16];
                if (!v127)
                {
LABEL_102:

                  goto LABEL_104;
                }
                continue;
              }
              goto LABEL_64;
            }
            break;
          }

          if (!v88) {
            goto LABEL_131;
          }
LABEL_104:
          if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
          {

            goto LABEL_140;
          }
          v92 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:v128 graph:v112];
          v93 = [v111 collectionBySubtracting:v92];
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          v94 = [v93 uuids];
          uint64_t v95 = [v94 countByEnumeratingWithState:&v138 objects:v167 count:16];
          if (v95)
          {
            uint64_t v96 = v95;
            uint64_t v97 = *(void *)v139;
            while (2)
            {
              for (uint64_t k = 0; k != v96; ++k)
              {
                if (*(void *)v139 != v97) {
                  objc_enumerationMutation(v94);
                }
                v99 = [[PGRelationshipQuestion alloc] initWithRelationshipLabel:v136 personUUID:*(void *)(*((void *)&v138 + 1) + 8 * k) localFactoryScore:v56];
                if ([*(id *)(a1 + 32) shouldAddQuestion:v99 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
                {
                  [*(id *)(a1 + 40) addObject:v99];
                  if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
                  {

                    goto LABEL_120;
                  }
                }
                uint64_t v100 = [*(id *)(a1 + 40) count];
                if (v137)
                {
                  unint64_t v101 = v100;
                  unint64_t v102 = *(void *)(a1 + 56);
                  double v103 = CFAbsoluteTimeGetCurrent();
                  if (v103 - v4 >= 0.01)
                  {
                    unsigned __int8 v166 = 0;
                    v137[2](v137, &v166, (double)v101 / (double)v102);
                    if (v166 | v135 & 1)
                    {
                      v107 = MEMORY[0x1E4F14500];
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v173 = 251;
                        *(_WORD *)&v173[4] = 2080;
                        *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                        _os_log_impl(&dword_1D1805000, v107, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      char v105 = 1;
                      goto LABEL_129;
                    }
                    char v135 = 0;
                    double v4 = v103;
                  }
                }
              }
              uint64_t v96 = [v94 countByEnumeratingWithState:&v138 objects:v167 count:16];
              if (v96) {
                continue;
              }
              break;
            }
          }
LABEL_120:

          BOOL v104 = (unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56);
          char v105 = v104 & v135;
          int v89 = 4 * v104;
          if (v104 || (v106 = MEMORY[0x1E4F14500], (v135 & 1) == 0))
          {
            double v103 = v4;
          }
          else
          {
            char v105 = 1;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v173 = 258;
              *(_WORD *)&v173[4] = 2080;
              *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, v106, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v103 = v4;
LABEL_129:
            int v89 = 1;
          }

          double v4 = v103;
          char v135 = v105;
LABEL_131:

          if (v89 == 5)
          {
            uint64_t j = v120;
          }
          else
          {
            uint64_t j = v120;
            if (v89)
            {

              uint64_t v14 = v109;
              uint64_t v13 = v115;
              if (v89 != 4) {
                goto LABEL_152;
              }
              goto LABEL_141;
            }
          }
        }
        uint64_t v118 = [obj countByEnumeratingWithState:&v153 objects:v170 count:16];
        if (!v118) {
          goto LABEL_140;
        }
      }
    }
    char v135 = 0;
LABEL_140:

    uint64_t v14 = v109;
    uint64_t v13 = v115;
LABEL_141:
    if (v137)
    {
      if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
      {
        unsigned __int8 v166 = 0;
        v137[2](v137, &v166, 1.0);
        if (v166 | v135 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v173 = 261;
            *(_WORD *)&v173[4] = 2080;
            *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_152:

    goto LABEL_158;
  }
  if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
  {
    unsigned __int8 v166 = 0;
    v137[2](v137, &v166, 1.0);
    if (v166)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v173 = 67;
        *(_WORD *)&v173[4] = 2080;
        *(void *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
        id v6 = MEMORY[0x1E4F14500];
        goto LABEL_44;
      }
    }
  }
LABEL_159:
}

BOOL __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_194(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  char v8 = [v7 objectForKeyedSubscript:&unk_1F28D2CA0];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v12 = [v11 objectForKeyedSubscript:&unk_1F28D2CA0];
  [v12 doubleValue];
  double v14 = v13;

  return v10 <= v14;
}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_198(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2;
  v5[3] = &unk_1E68EF640;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  [v4 enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:v5];
}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 status];
  uint64_t v6 = 40;
  if (!v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 confidence];
  double v4 = v3;
  id v9 = [*(id *)(a1 + 40) collection];
  uint64_t v5 = [v9 personNodes];
  uint64_t v6 = [v5 set];
  if (v4 >= 1.0) {
    id v7 = *(void **)(a1 + 48);
  }
  else {
    id v7 = *(void **)(a1 + 32);
  }
  id v8 = [*(id *)(a1 + 40) label];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (int64_t)questionOptions
{
  return 16;
}

- (unsigned)questionType
{
  return 5;
}

@end