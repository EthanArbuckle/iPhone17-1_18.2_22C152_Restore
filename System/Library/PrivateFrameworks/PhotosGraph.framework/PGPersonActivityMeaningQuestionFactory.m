@interface PGPersonActivityMeaningQuestionFactory
- (NSSet)personActivityMeaningLabelsForWhichToGenerateQuestions;
- (id)_questionsToAddFromMomentNodes:(id)a3 localFactoryScore:(double)a4 alreadyGeneratedQuestions:(id)a5 limit:(unint64_t)a6 graph:(id)a7 progressBlock:(id)a8;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)setPersonActivityMeaningLabelsForWhichToGenerateQuestions:(id)a3;
@end

@implementation PGPersonActivityMeaningQuestionFactory

- (void).cxx_destruct
{
}

- (void)setPersonActivityMeaningLabelsForWhichToGenerateQuestions:(id)a3
{
}

- (NSSet)personActivityMeaningLabelsForWhichToGenerateQuestions
{
  v9[6] = *MEMORY[0x1E4F143B8];
  personActivityMeaningLabelsForWhichToGenerateQuestions = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
  if (!personActivityMeaningLabelsForWhichToGenerateQuestions)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v9[0] = @"PersonBeachWater";
    v9[1] = @"PersonToys";
    v9[2] = @"PersonPlayground";
    v9[3] = @"PersonActionSwimming";
    v9[4] = @"PersonActionPlayingOnASwing";
    v9[5] = @"PersonActionPlayingOnASlide";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
    v6 = [v4 setWithArray:v5];
    v7 = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
    self->_personActivityMeaningLabelsForWhichToGenerateQuestions = v6;

    personActivityMeaningLabelsForWhichToGenerateQuestions = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
  }
  return personActivityMeaningLabelsForWhichToGenerateQuestions;
}

- (id)_questionsToAddFromMomentNodes:(id)a3 localFactoryScore:(double)a4 alreadyGeneratedQuestions:(id)a5 limit:(unint64_t)a6 graph:(id)a7 progressBlock:(id)a8
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v54 = a5;
  id v47 = a7;
  v13 = (void (**)(void *, unsigned char *, double))_Block_copy(a8);
  v41 = [MEMORY[0x1E4F1CAD0] set];
  double v14 = 0.0;
  if (v13)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      unsigned __int8 v63 = 0;
      v13[2](v13, &v63, 0.0);
      if (v63)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v67 = 85;
          __int16 v68 = 2080;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = v41;
        goto LABEL_70;
      }
      double v14 = Current;
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (![v12 count])
  {
    if (!v13 || CFAbsoluteTimeGetCurrent() - v14 < 0.01 || (unsigned __int8 v63 = 0, v13[2](v13, &v63, 1.0), !v63))
    {
      id v38 = [MEMORY[0x1E4F1CAD0] set];
      goto LABEL_68;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 67109378;
    int v67 = 91;
    __int16 v68 = 2080;
    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
    v37 = MEMORY[0x1E4F14500];
    goto LABEL_65;
  }
  uint64_t v18 = [v54 count];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [(PGPersonActivityMeaningQuestionFactory *)self personActivityMeaningLabelsForWhichToGenerateQuestions];
  uint64_t v46 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v46)
  {
    char v51 = 0;
    uint64_t v45 = *(void *)v60;
    *(void *)&long long v19 = 67109378;
    long long v40 = v19;
    id v43 = v12;
    id v44 = v41;
    while (2)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v22 = +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabel:inGraph:", v21, v47, v40);
        v23 = [v22 featureNodeCollection];
        v24 = +[PGGraphMomentFeaturesEdgeCollection momentFeaturesEdgesFromMomentNodes:v12 toFeatureNodes:v23];

        v50 = v24;
        v25 = [v24 allRelevantAssetUUIDs];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          v48 = v22;
          uint64_t v49 = i;
          uint64_t v29 = *(void *)v56;
LABEL_16:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = [[PGPersonActivityMeaningQuestion alloc] initWithMeaningLabel:v21 assetUUID:*(void *)(*((void *)&v55 + 1) + 8 * v30) localFactoryScore:a4];
            if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v31 toAlreadyGeneratedQuestions:v54])
            {
              [v17 addObject:v31];
            }
            uint64_t v32 = [v17 count];
            if (v13)
            {
              unint64_t v33 = v32;
              double v34 = CFAbsoluteTimeGetCurrent();
              if (v34 - v14 >= 0.01)
              {
                unsigned __int8 v63 = 0;
                v13[2](v13, &v63, (double)v33 / (double)a6);
                if (v63 | v51 & 1)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v40;
                    int v67 = 110;
                    __int16 v68 = 2080;
                    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  id v44 = v41;
                  char v51 = 1;
                  goto LABEL_47;
                }
                char v51 = 0;
              }
              else
              {
                double v34 = v14;
              }
              if ([v17 count] + v18 >= a6)
              {
                double v14 = CFAbsoluteTimeGetCurrent();
                if (v14 - v34 < 0.01)
                {
                  double v14 = v34;
                  goto LABEL_45;
                }
                unsigned __int8 v63 = 0;
                v13[2](v13, &v63, 1.0);
                if (v63 | v51 & 1)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v40;
                    int v67 = 113;
                    __int16 v68 = 2080;
                    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  id v44 = v41;
                  char v51 = 1;
                }
                else
                {
                  char v51 = 0;
LABEL_45:
                  id v44 = v17;
                }
                double v34 = v14;
LABEL_47:
                id v12 = v43;
                uint64_t i = v49;
                v36 = v50;

                int v35 = 0;
                double v14 = v34;
                v22 = v48;
                goto LABEL_48;
              }
              double v14 = v34;
            }
            else if ([v17 count] + v18 >= a6)
            {
              goto LABEL_45;
            }

            if (v28 == ++v30)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
              if (v28) {
                goto LABEL_16;
              }
              int v35 = 1;
              id v12 = v43;
              v22 = v48;
              uint64_t i = v49;
              goto LABEL_34;
            }
          }
        }
        int v35 = 1;
LABEL_34:
        v36 = v50;
LABEL_48:

        if (!v35)
        {

          id v16 = v44;
          goto LABEL_69;
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v51 = 0;
  }

  if (v13)
  {
    if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
    {
      unsigned __int8 v63 = 0;
      v13[2](v13, &v63, 1.0);
      if (v63 | v51 & 1)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_66:
          id v38 = v41;
          goto LABEL_68;
        }
        *(_DWORD *)buf = 67109378;
        int v67 = 119;
        __int16 v68 = 2080;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        v37 = MEMORY[0x1E4F14500];
LABEL_65:
        _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_66;
      }
    }
  }
  id v38 = v17;
LABEL_68:
  id v16 = v38;
LABEL_69:

LABEL_70:
  return v16;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  id v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  id v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  id v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v30 = (void (**)(void, void, double))v4;
  if (!v4)
  {
    id v7 = (void *)(a1 + 56);
    if (!*(void *)(a1 + 56)) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v38[3] < 0.01)
  {
    if (*((unsigned char *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v46 = 48;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        id v6 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  v38[3] = Current;
  char v36 = 0;
  ((void (**)(void, char *, double))v30)[2](v30, &v36, 0.0);
  char v8 = *((unsigned char *)v42 + 24) | v36;
  *((unsigned char *)v42 + 24) = v8;
  if (!v8)
  {
LABEL_12:
    id v7 = (void *)(a1 + 56);
    if (!*(void *)(a1 + 56))
    {
      double v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v38[3] >= 0.01)
      {
        v38[3] = v24;
        char v36 = 0;
        ((void (**)(void, char *, double))v30)[2](v30, &v36, 1.0);
        char v25 = *((unsigned char *)v42 + 24) | v36;
        *((unsigned char *)v42 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v46 = 51;
            __int16 v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
            id v6 = MEMORY[0x1E4F14500];
            goto LABEL_11;
          }
        }
      }
      goto LABEL_18;
    }
LABEL_13:
    id v9 = [v3 graph];
    uint64_t v10 = +[PGMeaningfulEventRequiredCriteriaFactory availablePersonActivityMeaningLabels];
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    id v12 = +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabels:v11 inGraph:v9];

    uint64_t v29 = (void *)v10;
    id v13 = v3;
    uint64_t v14 = v12;
    v15 = [v12 momentNodes];
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 56);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_260;
    v31[3] = &unk_1E68F03F8;
    id v28 = v30;
    id v32 = v28;
    unint64_t v33 = &v37;
    double v34 = &v41;
    uint64_t v35 = 0x3F847AE147AE147BLL;
    id v19 = [v16 _questionsToAddFromMomentNodes:v15 localFactoryScore:v17 alreadyGeneratedQuestions:v18 limit:v9 graph:v31 progressBlock:1.0];
    if (*((unsigned char *)v42 + 24))
    {
      id v3 = v13;
      unint64_t v20 = v29;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109378;
      int v46 = 65;
      __int16 v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
      uint64_t v21 = MEMORY[0x1E4F14500];
    }
    else
    {
      [*(id *)(a1 + 40) unionSet:v19];
      id v3 = v13;
      if ((unint64_t)[*(id *)(a1 + 40) count] >= *v7)
      {
        unint64_t v20 = v29;
        if (!v30) {
          goto LABEL_17;
        }
        double v26 = CFAbsoluteTimeGetCurrent();
        if (v26 - v38[3] < 0.01) {
          goto LABEL_17;
        }
        v38[3] = v26;
        char v36 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v36, 1.0);
        char v27 = *((unsigned char *)v42 + 24) | v36;
        *((unsigned char *)v42 + 24) = v27;
        if (!v27 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109378;
        int v46 = 68;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        uint64_t v21 = MEMORY[0x1E4F14500];
      }
      else
      {
        unint64_t v20 = v29;
        if (!v30) {
          goto LABEL_17;
        }
        double v22 = CFAbsoluteTimeGetCurrent();
        if (v22 - v38[3] < 0.01) {
          goto LABEL_17;
        }
        v38[3] = v22;
        char v36 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v36, 1.0);
        char v23 = *((unsigned char *)v42 + 24) | v36;
        *((unsigned char *)v42 + 24) = v23;
        if (!v23 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109378;
        int v46 = 72;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        uint64_t v21 = MEMORY[0x1E4F14500];
      }
    }
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v46 = 47;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
    id v6 = MEMORY[0x1E4F14500];
    goto LABEL_11;
  }
LABEL_18:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

void __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_260(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 0x40000;
}

- (unsigned)questionType
{
  return 19;
}

@end