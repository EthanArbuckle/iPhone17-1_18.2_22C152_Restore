@interface PGExhaustiveMomentLabellingQuestionFactory
- (id)_inferMeaningLabelsForMomentNode:(id)a3 graph:(id)a4 cache:(id)a5 meaningLabels:(id)a6 sceneTaxonomy:(id)a7;
- (id)_meaningLabelsForWhichToGenerateQuestions;
- (id)_questionsToAddWithMomentNodes:(id)a3 graph:(id)a4 localFactoryScore:(double)a5 limit:(unint64_t)a6 sceneTaxonomy:(id)a7 alreadyGeneratedQuestions:(id)a8 progressBlock:(id)a9;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGExhaustiveMomentLabellingQuestionFactory

- (id)_meaningLabelsForWhichToGenerateQuestions
{
  v4[24] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Wedding";
  v4[1] = @"Birthday";
  v4[2] = @"Anniversary";
  v4[3] = @"Celebration";
  v4[4] = @"Concert";
  v4[5] = @"Festival";
  v4[6] = @"Theater";
  v4[7] = @"Dance";
  v4[8] = @"Museum";
  v4[9] = @"AmusementPark";
  v4[10] = @"Performance";
  v4[11] = @"Hiking";
  v4[12] = @"Climbing";
  v4[13] = @"Beaching";
  v4[14] = @"SportEvent";
  v4[15] = @"WinterSport";
  v4[16] = @"Diving";
  v4[17] = @"Lunch";
  v4[18] = @"Dinner";
  v4[19] = @"Breakfast";
  v4[20] = @"Restaurant";
  v4[21] = @"NightOut";
  v4[22] = @"Entertainment";
  v4[23] = @"HolidayEvent";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:24];
  return v2;
}

- (id)_inferMeaningLabelsForMomentNode:(id)a3 graph:(id)a4 cache:(id)a5 meaningLabels:(id)a6 sceneTaxonomy:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v12 = a6;
  id v41 = a7;
  v39 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [(PGSurveyQuestionFactory *)self workingContext];
  v14 = [v13 serviceManager];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v59 count:16];
  obuint64_t j = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v58 = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        v22 = +[PGMeaningfulEventLooseRequiredCriteriaFactory requiredCriteriaForIdentifiers:v21 graph:v43 sceneTaxonomy:v41];

        v23 = +[PGMeaningfulEventProcessor processRequiredCriteria:v22 forMoment:v44 meaningfulEventProcessorCache:v42 serviceManager:v14];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v50;
          double v27 = -2147483650.0;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v50 != v26) {
                objc_enumerationMutation(v23);
              }
              [*(id *)(*((void *)&v49 + 1) + 8 * j) score];
              if (v27 < v29) {
                double v27 = v29;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v25);
          if (v27 != -2147483650.0)
          {
            v30 = [NSNumber numberWithDouble:v27];
            [v39 setObject:v30 forKeyedSubscript:v20];
          }
        }
      }
      id v15 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v17);
  }

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ([v39 count])
  {
    v32 = [v39 keysSortedByValueUsingSelector:sel_compare_];
    v33 = [v32 reverseObjectEnumerator];
    v34 = [v33 allObjects];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke;
    v47[3] = &unk_1E68E8350;
    id v48 = v31;
    [v34 enumerateObjectsUsingBlock:v47];
  }
  if ((unint64_t)[v31 count] <= 4)
  {
    do
    {
      v35 = objc_msgSend(obj, "objectAtIndex:", arc4random_uniform(objc_msgSend(obj, "count")));
      [v31 addObject:v35];
    }
    while ((unint64_t)[v31 count] < 5);
  }
  v36 = [obj sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke_2;
  v45[3] = &unk_1E68E8350;
  id v37 = v31;
  id v46 = v37;
  [v36 enumerateObjectsUsingBlock:v45];

  [v37 addObject:PGExhaustiveMomentLabellingNoneOfTheseAnswerString];
  return v37;
}

uint64_t __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result == 5) {
    *a4 = 1;
  }
  return result;
}

void __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)_questionsToAddWithMomentNodes:(id)a3 graph:(id)a4 localFactoryScore:(double)a5 limit:(unint64_t)a6 sceneTaxonomy:(id)a7 alreadyGeneratedQuestions:(id)a8 progressBlock:(id)a9
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v34 = a9;
  v19 = _Block_copy(v34);
  v35 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  long long v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v21 = [v18 count];
  v22 = [[PGMeaningfulEventProcessorCache alloc] initWithMomentNodes:v36];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __161__PGExhaustiveMomentLabellingQuestionFactory__questionsToAddWithMomentNodes_graph_localFactoryScore_limit_sceneTaxonomy_alreadyGeneratedQuestions_progressBlock___block_invoke;
  v38[3] = &unk_1E68E8328;
  v38[4] = self;
  id v23 = v16;
  id v39 = v23;
  uint64_t v24 = v22;
  v40 = v24;
  id v25 = v17;
  id v41 = v25;
  double v47 = a5;
  id v26 = v18;
  id v42 = v26;
  id v27 = v20;
  id v43 = v27;
  unint64_t v48 = a6;
  id v28 = v19;
  id v44 = v28;
  v45 = &v51;
  uint64_t v49 = 0x3F847AE147AE147BLL;
  id v46 = &v55;
  uint64_t v50 = v21;
  [v36 enumerateNodesUsingBlock:v38];
  if (v28
    && (double Current = CFAbsoluteTimeGetCurrent(), Current - v52[3] >= 0.01)
    && (v52[3] = Current,
        char v37 = 0,
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v37, 1.0),
        char v30 = *((unsigned char *)v56 + 24) | v37,
        (*((unsigned char *)v56 + 24) = v30) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      buf[0] = 67109378;
      buf[1] = 128;
      __int16 v60 = 2080;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    id v31 = v35;
  }
  else
  {
    id v31 = v27;
  }
  v32 = v31;

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v32;
}

void __161__PGExhaustiveMomentLabellingQuestionFactory__questionsToAddWithMomentNodes_graph_localFactoryScore_limit_sceneTaxonomy_alreadyGeneratedQuestions_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = a2;
  v9 = [v5 _meaningLabelsForWhichToGenerateQuestions];
  v10 = [v5 _inferMeaningLabelsForMomentNode:v8 graph:v6 cache:v7 meaningLabels:v9 sceneTaxonomy:*(void *)(a1 + 56)];

  v11 = [PGExhaustiveMomentLabellingQuestion alloc];
  id v12 = [v8 uuid];

  v13 = [(PGExhaustiveMomentLabellingQuestion *)v11 initWithMomentUUID:v12 localFactoryScore:v10 meaningLabels:*(double *)(a1 + 104)];
  if ([*(id *)(a1 + 32) shouldAddQuestion:v13 toAlreadyGeneratedQuestions:*(void *)(a1 + 64)])objc_msgSend(*(id *)(a1 + 72), "addObject:", v13); {
  uint64_t v14 = [*(id *)(a1 + 72) count];
  }
  if (*(void *)(a1 + 80))
  {
    unint64_t v15 = v14;
    unint64_t v16 = *(void *)(a1 + 112);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
    if (Current - *(double *)(v18 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v18 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 80) + 16))((double)v15 / (double)v16);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v19 = *(void *)(a1 + 128);
  if ((unint64_t)([*(id *)(a1 + 72) count] + v19) >= *(void *)(a1 + 112))
  {
    if (*(void *)(a1 + 80))
    {
      double v20 = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
      if (v20 - *(double *)(v21 + 24) >= *(double *)(a1 + 120))
      {
        *(double *)(v21 + 24) = v20;
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(1.0);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
LABEL_10:
        }
          *a3 = 1;
      }
    }
  }
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  unint64_t v16 = &unk_1E68F0568;
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

void __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void (**)(void *, int *, double))_Block_copy(*(const void **)(a1 + 48));
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (!v4)
  {
    id v8 = (void *)(a1 + 56);
    if (!*(void *)(a1 + 56)) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v45[3] >= 0.01)
  {
    v45[3] = Current;
    LOBYTE(v52) = 0;
    v4[2](v4, &v52, 0.0);
    char v6 = *((unsigned char *)v49 + 24) | v52;
    *((unsigned char *)v49 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x3504000202;
        LOWORD(v57) = 2080;
        *(void *)((char *)&v57 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        uint64_t v7 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  id v8 = (void *)(a1 + 56);
  if (*(void *)(a1 + 56))
  {
LABEL_13:
    v11 = [v3 graph];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v13 setDay:-30];
    uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v15 = [v14 dateByAddingComponents:v13 toDate:v12 options:0];
    id v34 = v13;

    id v36 = v4;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v12];
    id v17 = (void *)v15;
    id v18 = (void *)v12;
    v35 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v16 inGraph:v11];
    v33 = (void *)v16;
    id v19 = v3;
    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    uint64_t buf = 0;
    *(void *)&long long v57 = &buf;
    *((void *)&v57 + 1) = 0x2020000000;
    uint64_t v58 = 0;
    uint64_t v21 = *(void *)(a1 + 56);
    id v23 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_266;
    v38[3] = &unk_1E68EB350;
    p_uint64_t buf = &buf;
    v32 = v36;
    id v39 = v32;
    id v41 = &v44;
    id v42 = &v48;
    uint64_t v43 = 0x3F847AE147AE147BLL;
    uint64_t v24 = [v23 _questionsToAddWithMomentNodes:v35 graph:v11 localFactoryScore:v21 limit:v20 sceneTaxonomy:v22 alreadyGeneratedQuestions:v38 progressBlock:1.0];
    id v3 = v19;
    id v25 = v18;
    id v26 = v17;
    if (*((unsigned char *)v49 + 24))
    {
      v4 = v36;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        _Block_object_dispose(&buf, 8);
        goto LABEL_18;
      }
      int v52 = 67109378;
      int v53 = 79;
      __int16 v54 = 2080;
      uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
      id v27 = MEMORY[0x1E4F14500];
    }
    else
    {
      [*(id *)(a1 + 40) unionSet:v24];
      if ((unint64_t)[*(id *)(a1 + 40) count] >= *v8)
      {
        v4 = v36;
        if (!v36) {
          goto LABEL_17;
        }
        double v30 = CFAbsoluteTimeGetCurrent();
        if (v30 - v45[3] < 0.01) {
          goto LABEL_17;
        }
        v45[3] = v30;
        char v37 = 0;
        v32[2](v32, (int *)&v37, 1.0);
        char v31 = *((unsigned char *)v49 + 24) | v37;
        *((unsigned char *)v49 + 24) = v31;
        if (!v31 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        int v52 = 67109378;
        int v53 = 83;
        __int16 v54 = 2080;
        uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        id v27 = MEMORY[0x1E4F14500];
      }
      else
      {
        v4 = v36;
        if (!v36) {
          goto LABEL_17;
        }
        double v28 = CFAbsoluteTimeGetCurrent();
        if (v28 - v45[3] < 0.01) {
          goto LABEL_17;
        }
        v45[3] = v28;
        char v37 = 0;
        v32[2](v32, (int *)&v37, 1.0);
        char v29 = *((unsigned char *)v49 + 24) | v37;
        *((unsigned char *)v49 + 24) = v29;
        if (!v29 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        int v52 = 67109378;
        int v53 = 87;
        __int16 v54 = 2080;
        uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        id v27 = MEMORY[0x1E4F14500];
      }
    }
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v52, 0x12u);
    goto LABEL_17;
  }
  double v9 = CFAbsoluteTimeGetCurrent();
  if (v9 - v45[3] >= 0.01)
  {
    v45[3] = v9;
    LOBYTE(v52) = 0;
    v4[2](v4, &v52, 1.0);
    char v10 = *((unsigned char *)v49 + 24) | v52;
    *((unsigned char *)v49 + 24) = v10;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x3804000202;
        LOWORD(v57) = 2080;
        *(void *)((char *)&v57 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        uint64_t v7 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
  }
LABEL_18:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

void __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_266(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.2 + 0.6;
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 0x800000;
}

- (unsigned)questionType
{
  return 25;
}

@end