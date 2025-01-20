@interface PGMeaningQuestionFactory
- (NSSet)meaningLabelsForWhichToGenerateQuestions;
- (id)_dateNodesFromStartDate:(id)a3 toEndDate:(id)a4 inGraph:(id)a5;
- (id)_expandedDateNodesFromDateNode:(id)a3;
- (id)_expandedDateNodesFromDateNodes:(id)a3;
- (id)_inferMeaningLabelsForMomentNode:(id)a3 meaningLabels:(id)a4 graph:(id)a5 sceneTaxonomy:(id)a6 cache:(id)a7;
- (id)_looseCriteriasForCriteria:(id)a3 graph:(id)a4;
- (id)_meaningLabelsByParentMeaningLabels;
- (id)_questionsToAddFromMomentNodes:(id)a3 useRepresentativeAssets:(BOOL)a4 localFactoryScore:(double)a5 alreadyGeneratedQuestions:(id)a6 limit:(unint64_t)a7 graph:(id)a8 sceneTaxonomy:(id)a9 progressBlock:(id)a10;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)_updateMeaningQuestionsIfNeededWithProgressBlock:(id)a3;
- (void)setMeaningLabelsForWhichToGenerateQuestions:(id)a3;
@end

@implementation PGMeaningQuestionFactory

- (void).cxx_destruct
{
}

- (void)setMeaningLabelsForWhichToGenerateQuestions:(id)a3
{
}

- (id)_dateNodesFromStartDate:(id)a3 toEndDate:(id)a4 inGraph:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F28C18];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithStartDate:v10 endDate:v9];

  v12 = [v8 dateNodesForLocalDateInterval:v11];

  return v12;
}

- (id)_expandedDateNodesFromDateNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 localDate];
  if ([MEMORY[0x1E4F76C80] isWeekendDate:v5])
  {
    id v18 = 0;
    double v19 = 0.0;
    [MEMORY[0x1E4F76C80] rangeOfWeekendLocalStartDate:&v18 interval:&v19 containingDate:v5];
    double v6 = v19;
    id v7 = v18;
    id v8 = [v7 dateByAddingTimeInterval:v6];
    id v9 = [MEMORY[0x1E4F76C68] dateByAddingDays:-2 toDate:v7];

    id v10 = [MEMORY[0x1E4F76C68] dateByAddingDays:3 toDate:v8];
  }
  else
  {
    double v19 = 0.0;
    id v17 = 0;
    [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v17 interval:&v19 options:4 afterDate:v5];
    id v9 = v17;
    id v15 = 0;
    double v16 = 0.0;
    [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v15 interval:&v16 options:0 afterDate:v5];
    id v10 = [v15 dateByAddingTimeInterval:v16];
  }
  v11 = [v4 graph];

  v12 = [(PGMeaningQuestionFactory *)self _dateNodesFromStartDate:v9 toEndDate:v10 inGraph:v11];

  v13 = [v12 set];

  return v13;
}

- (id)_expandedDateNodesFromDateNodes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[PGMeaningQuestionFactory _expandedDateNodesFromDateNode:](self, "_expandedDateNodesFromDateNode:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 unionSet:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_looseCriteriasForCriteria:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = [v6 identifier];
  id v10 = [v6 scenesTrait];
  if ([v10 isMatchingRequired])
  {
    v11 = [PGMeaningfulEventSceneCollectionTrait alloc];
    v12 = [v10 nodes];
    long long v13 = [(PGMeaningfulEventSceneCollectionTrait *)v11 initWithNodes:v12];

    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:1];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfNegativeHighConfidenceAssets:0];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumRatioOfHighConfidenceAssets:0.0];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.00001];
    long long v14 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v14 setScenesTrait:v13];
    [(PGMeaningfulEventRequiredCriteria *)v14 setMustBeInteresting:0];
    [v8 addObject:v14];
  }
  long long v15 = [v6 roisTrait];
  int v16 = [v15 isMatchingRequired];

  if (v16)
  {
    id v17 = [PGMeaningfulEventCollectionTrait alloc];
    uint64_t v18 = [v6 roisTrait];
    double v19 = [v18 nodes];
    v20 = [(PGMeaningfulEventCollectionTrait *)v17 initWithNodes:v19];

    [(PGMeaningfulEventTrait *)v20 setMinimumScore:0.00001];
    v21 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v21 setRoisTrait:v20];
    [(PGMeaningfulEventRequiredCriteria *)v21 setMustBeInteresting:0];
    [v8 addObject:v21];
  }
  v22 = [v6 poisTrait];
  int v23 = [v22 isMatchingRequired];

  if (v23)
  {
    v24 = [PGMeaningfulEventCollectionTrait alloc];
    v25 = [v6 poisTrait];
    v26 = [v25 nodes];
    v27 = [(PGMeaningfulEventCollectionTrait *)v24 initWithNodes:v26];

    [(PGMeaningfulEventTrait *)v27 setMinimumScore:0.00001];
    v28 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v28 setPoisTrait:v27];
    [(PGMeaningfulEventRequiredCriteria *)v28 setMustBeInteresting:0];
    [v8 addObject:v28];
  }
  v29 = [v6 datesTrait];
  if ([v29 isMatchingRequired])
  {
    v30 = [v6 peopleTrait];
    int v31 = [v30 isMatchingRequired];

    if (!v31) {
      goto LABEL_11;
    }
    v32 = [v6 datesTrait];
    v33 = [v32 nodes];
    v34 = [v33 set];
    v29 = [(PGMeaningQuestionFactory *)self _expandedDateNodesFromDateNodes:v34];

    v35 = [PGMeaningfulEventCollectionTrait alloc];
    v36 = [(MAElementCollection *)[PGGraphDateNodeCollection alloc] initWithSet:v29 graph:v7];
    v37 = [(PGMeaningfulEventCollectionTrait *)v35 initWithNodes:v36];

    [(PGMeaningfulEventTrait *)v37 setMinimumScore:0.00001];
    v38 = [PGMeaningfulEventCollectionTrait alloc];
    v39 = [v6 peopleTrait];
    v40 = [v39 nodes];
    v41 = [(PGMeaningfulEventCollectionTrait *)v38 initWithNodes:v40];

    [(PGMeaningfulEventTrait *)v41 setMinimumScore:0.00001];
    v42 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v42 setDatesTrait:v37];
    [(PGMeaningfulEventCriteria *)v42 setPeopleTrait:v41];
    [(PGMeaningfulEventRequiredCriteria *)v42 setMustBeInteresting:0];
    [v8 addObject:v42];
  }
LABEL_11:
  v43 = [v6 socialGroupsTrait];
  int v44 = [v43 isMatchingRequired];

  if (v44)
  {
    v45 = [PGMeaningfulEventCollectionTrait alloc];
    v46 = [v6 socialGroupsTrait];
    v47 = [v46 nodes];
    v48 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v47];

    [(PGMeaningfulEventTrait *)v48 setMinimumScore:0.00001];
    v49 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v49 setSocialGroupsTrait:v48];
    [(PGMeaningfulEventRequiredCriteria *)v49 setMustBeInteresting:0];
    [v8 addObject:v49];
  }
  v50 = [v6 locationMobilityTrait];
  int v51 = [v50 isMatchingRequired];

  if (v51)
  {
    v52 = [PGMeaningfulEventLocationMobilityTrait alloc];
    v53 = [v6 locationMobilityTrait];
    v54 = -[PGMeaningfulEventLocationMobilityTrait initWithMobility:](v52, "initWithMobility:", [v53 value]);

    [(PGMeaningfulEventTrait *)v54 setMinimumScore:0.00001];
    v55 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v55 setLocationMobilityTrait:v54];
    [(PGMeaningfulEventRequiredCriteria *)v55 setMustBeInteresting:0];
    [v8 addObject:v55];
  }
  v56 = [v6 publicEventCategoriesTrait];
  int v57 = [v56 isMatchingRequired];

  if (v57)
  {
    v58 = [PGMeaningfulEventCollectionTrait alloc];
    v59 = [v6 publicEventCategoriesTrait];
    v60 = [v59 nodes];
    v61 = [(PGMeaningfulEventCollectionTrait *)v58 initWithNodes:v60];

    [(PGMeaningfulEventTrait *)v61 setMinimumScore:0.00001];
    v62 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:v7 graph:0.00001];
    [(PGMeaningfulEventCriteria *)v62 setPublicEventCategoriesTrait:v61];
    [(PGMeaningfulEventRequiredCriteria *)v62 setMustBeInteresting:0];
    [v8 addObject:v62];
  }
  return v8;
}

- (id)_inferMeaningLabelsForMomentNode:(id)a3 meaningLabels:(id)a4 graph:(id)a5 sceneTaxonomy:(id)a6 cache:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v12 = a4;
  id v28 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = [(PGSurveyQuestionFactory *)self workingContext];
  int v16 = [v15 serviceManager];

  id v27 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v34 = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        int v23 = +[PGMeaningfulEventLooseRequiredCriteriaFactory requiredCriteriaForIdentifiers:v22 graph:v28 sceneTaxonomy:v13];

        v24 = +[PGMeaningfulEventProcessor processRequiredCriteria:v23 forMoment:v29 meaningfulEventProcessorCache:v14 serviceManager:v16];
        if ([v24 count]) {
          [v27 addObject:v21];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v18);
  }

  return v27;
}

- (NSSet)meaningLabelsForWhichToGenerateQuestions
{
  v9[24] = *MEMORY[0x1E4F143B8];
  meaningLabelsForWhichToGenerateQuestions = self->_meaningLabelsForWhichToGenerateQuestions;
  if (!meaningLabelsForWhichToGenerateQuestions)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    v9[0] = @"Wedding";
    v9[1] = @"Birthday";
    v9[2] = @"Anniversary";
    v9[3] = @"Celebration";
    v9[4] = @"Concert";
    v9[5] = @"Festival";
    v9[6] = @"Theater";
    v9[7] = @"Dance";
    v9[8] = @"Museum";
    v9[9] = @"AmusementPark";
    v9[10] = @"Performance";
    v9[11] = @"Hiking";
    v9[12] = @"Climbing";
    v9[13] = @"Beaching";
    v9[14] = @"SportEvent";
    v9[15] = @"WinterSport";
    v9[16] = @"Diving";
    v9[17] = @"Lunch";
    v9[18] = @"Dinner";
    v9[19] = @"Breakfast";
    v9[20] = @"Restaurant";
    v9[21] = @"NightOut";
    v9[22] = @"Entertainment";
    v9[23] = @"HolidayEvent";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:24];
    id v6 = [v4 setWithArray:v5];
    id v7 = self->_meaningLabelsForWhichToGenerateQuestions;
    self->_meaningLabelsForWhichToGenerateQuestions = v6;

    meaningLabelsForWhichToGenerateQuestions = self->_meaningLabelsForWhichToGenerateQuestions;
  }
  return meaningLabelsForWhichToGenerateQuestions;
}

- (id)_questionsToAddFromMomentNodes:(id)a3 useRepresentativeAssets:(BOOL)a4 localFactoryScore:(double)a5 alreadyGeneratedQuestions:(id)a6 limit:(unint64_t)a7 graph:(id)a8 sceneTaxonomy:(id)a9 progressBlock:(id)a10
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v84 = a6;
  id v78 = a8;
  id v77 = a9;
  id v15 = a10;
  int v16 = (void (**)(void *, unsigned char *, double))_Block_copy(v15);
  v60 = [MEMORY[0x1E4F1CAD0] set];
  double v17 = 0.0;
  if (v16)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      unsigned __int8 v98 = 0;
      v16[2](v16, &v98, 0.0);
      if (v98)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v104 = 225;
          __int16 v105 = 2080;
          v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Quest"
                 "ions/Survey/Meaning/PGMeaningQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v19 = v60;
        goto LABEL_82;
      }
      double v17 = Current;
    }
  }
  v20 = [MEMORY[0x1E4F1CA80] set];
  id v59 = v14;
  if ([v14 count])
  {
    uint64_t v82 = [v84 count];
    id v21 = objc_alloc(MEMORY[0x1E4F8E768]);
    v22 = [(PGSurveyQuestionFactory *)self workingContext];
    int v23 = [v22 photoLibrary];
    v66 = (void *)[v21 initWithPhotoLibrary:v23];

    v24 = [PGMeaningfulEventProcessorCache alloc];
    v25 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v14 graph:v78];
    v76 = [(PGMeaningfulEventProcessorCache *)v24 initWithMomentNodes:v25];

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v14;
    uint64_t v75 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
    if (v75)
    {
      char v81 = 0;
      uint64_t v69 = *(void *)v95;
      v26 = &selRef_cacheWithPhotoLibrary_error_;
      id v61 = v60;
      id v58 = v15;
      while (2)
      {
        uint64_t v27 = 0;
        v64 = v26[240];
        do
        {
          if (*(void *)v95 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v94 + 1) + 8 * v27);
          id v29 = (void *)MEMORY[0x1D25FED50]();
          long long v30 = [(PGMeaningQuestionFactory *)self meaningLabelsForWhichToGenerateQuestions];
          long long v31 = [(PGMeaningQuestionFactory *)self _inferMeaningLabelsForMomentNode:v28 meaningLabels:v30 graph:v78 sceneTaxonomy:v77 cache:v76];
          if ([v31 count])
          {
            uint64_t v79 = v27;
            context = v29;
            if (a4)
            {
              long long v32 = [(PGSurveyQuestionFactory *)self representativeAssetsFromMomentNode:v28 curationContext:v66];
              long long v33 = [v32 allObjects];
            }
            else
            {
              long long v33 = [(PGSurveyQuestionFactory *)self assetsFromMomentNode:v28 curationContext:v66];
            }
            int v34 = 1;
            v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
            v101 = v35;
            uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
            v37 = [v33 sortedArrayUsingDescriptors:v36];

            v38 = [v31 allObjects];
            v39 = [v38 sortedArrayUsingSelector:v64];

            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            id v40 = v37;
            uint64_t v67 = [v40 countByEnumeratingWithState:&v90 objects:v100 count:16];
            if (v67)
            {
              uint64_t v41 = *(void *)v91;
              v73 = v31;
              v74 = v30;
              v71 = v39;
              v72 = v33;
              v70 = v40;
              uint64_t v63 = *(void *)v91;
              do
              {
                uint64_t v42 = 0;
                do
                {
                  if (*(void *)v91 != v41) {
                    objc_enumerationMutation(v40);
                  }
                  uint64_t v68 = v42;
                  v43 = *(void **)(*((void *)&v90 + 1) + 8 * v42);
                  long long v86 = 0u;
                  long long v87 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  id v44 = v39;
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v86 objects:v99 count:16];
                  if (!v45) {
                    goto LABEL_41;
                  }
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v87;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v46; ++i)
                    {
                      if (*(void *)v87 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      uint64_t v49 = *(void *)(*((void *)&v86 + 1) + 8 * i);
                      v50 = [v43 uuid];
                      int v51 = [[PGMeaningQuestion alloc] initWithMeaningLabel:v49 assetUUID:v50 localFactoryScore:a5];
                      if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v51 toAlreadyGeneratedQuestions:v84])
                      {
                        [v20 addObject:v51];
                      }
                      uint64_t v52 = [v20 count];
                      if (v16)
                      {
                        unint64_t v53 = v52;
                        double v54 = CFAbsoluteTimeGetCurrent();
                        if (v54 - v17 >= 0.01)
                        {
                          unsigned __int8 v98 = 0;
                          v16[2](v16, &v98, (double)v53 / (double)a7);
                          if (v98 | v81 & 1)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 67109378;
                              int v104 = 263;
                              __int16 v105 = 2080;
                              v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                            }
                            id v61 = v60;
                            char v81 = 1;
                            goto LABEL_56;
                          }
                          char v81 = 0;
                        }
                        else
                        {
                          double v54 = v17;
                        }
                        if ([v20 count] + v82 >= a7)
                        {
                          double v17 = CFAbsoluteTimeGetCurrent();
                          if (v17 - v54 < 0.01)
                          {
                            double v17 = v54;
                            goto LABEL_54;
                          }
                          unsigned __int8 v98 = 0;
                          v16[2](v16, &v98, 1.0);
                          if (v98 | v81 & 1)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 67109378;
                              int v104 = 267;
                              __int16 v105 = 2080;
                              v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                            }
                            id v61 = v60;
                            char v81 = 1;
                          }
                          else
                          {
                            char v81 = 0;
LABEL_54:
                            id v61 = v20;
                          }
                          double v54 = v17;
LABEL_56:
                          long long v31 = v73;
                          long long v30 = v74;
                          v39 = v71;
                          long long v33 = v72;
                          id v40 = v70;

                          int v34 = 0;
                          double v17 = v54;
                          goto LABEL_57;
                        }
                        double v17 = v54;
                      }
                      else if ([v20 count] + v82 >= a7)
                      {
                        goto LABEL_54;
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v86 objects:v99 count:16];
                    if (v46) {
                      continue;
                    }
                    break;
                  }
LABEL_41:

                  uint64_t v42 = v68 + 1;
                  long long v31 = v73;
                  long long v30 = v74;
                  v39 = v71;
                  long long v33 = v72;
                  id v40 = v70;
                  uint64_t v41 = v63;
                }
                while (v68 + 1 != v67);
                int v34 = 1;
                uint64_t v67 = [v70 countByEnumeratingWithState:&v90 objects:v100 count:16];
              }
              while (v67);
            }
LABEL_57:

            if (!v34)
            {

              id v15 = v58;
              goto LABEL_80;
            }
            uint64_t v27 = v79;
            id v29 = context;
          }

          ++v27;
        }
        while (v27 != v75);
        id v15 = v58;
        uint64_t v75 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
        v26 = &selRef_cacheWithPhotoLibrary_error_;
        if (v75) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v81 = 0;
    }

    if (v16 && CFAbsoluteTimeGetCurrent() - v17 >= 0.01 && (unsigned __int8 v98 = 0, v16[2](v16, &v98, 1.0), v98 | v81 & 1))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v104 = 275;
        __int16 v105 = 2080;
        v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questio"
               "ns/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v56 = v60;
    }
    else
    {
      id v56 = v20;
    }
    id v61 = v56;
LABEL_80:
  }
  else
  {
    if (v16 && CFAbsoluteTimeGetCurrent() - v17 >= 0.01 && (unsigned __int8 v98 = 0, v16[2](v16, &v98, 1.0), v98))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v104 = 232;
        __int16 v105 = 2080;
        v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questio"
               "ns/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v55 = v60;
    }
    else
    {
      id v55 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v61 = v55;
  }

  id v14 = v59;
  id v19 = v61;
LABEL_82:

  return v19;
}

- (id)_meaningLabelsByParentMeaningLabels
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v15 = @"Wedding";
  v16[0] = @"Celebration";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v4 = [v2 setWithArray:v3];
  v17[0] = v4;
  v16[1] = @"Entertainment";
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = @"AmusementPark";
  v14[1] = @"Festival";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v7 = [v5 setWithArray:v6];
  v17[1] = v7;
  v16[2] = @"Performance";
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = @"Concert";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  id v10 = [v8 setWithArray:v9];
  v17[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (void)_updateMeaningQuestionsIfNeededWithProgressBlock:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGSurveyQuestionFactory *)self existingQuestionsByEntityIdentifier];
  unint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = _Block_copy(v4);
    uint64_t v56 = 0;
    int v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    unint64_t v53 = (double *)&v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    if (v7
      && (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v53[3] >= 0.01)
      && (v53[3] = v8,
          LOBYTE(v60) = 0,
          (*((void (**)(void *, int *, double))v7 + 2))(v7, &v60, 0.0),
          char v9 = *((unsigned char *)v57 + 24) | v60,
          (*((unsigned char *)v57 + 24) = v9) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x7504000202;
        LOWORD(v63) = 2080;
        *(void *)((char *)&v63 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      uint64_t buf = 0;
      *(void *)&long long v63 = &buf;
      *((void *)&v63 + 1) = 0x2020000000;
      uint64_t v64 = 0;
      id v10 = [(PGMeaningQuestionFactory *)self _meaningLabelsByParentMeaningLabels];
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      id v12 = [v10 allKeys];
      id v13 = [v11 setWithArray:v12];

      id v14 = [MEMORY[0x1E4F1CA48] array];
      id v15 = [MEMORY[0x1E4F1CA48] array];
      int v16 = [(PGSurveyQuestionFactory *)self existingQuestionsByEntityIdentifier];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke;
      v41[3] = &unk_1E68EB3A0;
      p_uint64_t buf = &buf;
      double v50 = 1.0 / (double)v6;
      id v17 = v7;
      id v46 = v17;
      uint64_t v51 = 0x3F847AE147AE147BLL;
      v48 = &v52;
      uint64_t v49 = &v56;
      id v18 = v13;
      id v42 = v18;
      id v33 = v10;
      id v43 = v33;
      id v19 = v14;
      id v44 = v19;
      id v20 = v15;
      id v45 = v20;
      [v16 enumerateKeysAndObjectsUsingBlock:v41];

      if (*((unsigned char *)v57 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v60 = 67109378;
          LODWORD(v61[0]) = 171;
          WORD2(v61[0]) = 2080;
          *(void *)((char *)v61 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v60, 0x12u);
        }
      }
      else if ([v20 count] || objc_msgSend(v19, "count"))
      {
        id v21 = [(PGSurveyQuestionFactory *)self workingContext];
        long long v32 = [v21 photoLibrary];

        v22 = [MEMORY[0x1E4F1C9C8] date];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_270;
        v36[3] = &unk_1E68EF730;
        id v37 = v20;
        id v23 = v22;
        id v38 = v23;
        v39 = self;
        id v40 = v19;
        id v35 = 0;
        char v24 = [v32 performChangesAndWait:v36 error:&v35];
        id v31 = v35;
        if (v24)
        {
          v25 = +[PGLogging sharedLogging];
          v26 = [v25 loggingConnection];

          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v60) = 0;
            _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting meaning questions", (uint8_t *)&v60, 2u);
          }
        }
        else
        {
          uint64_t v27 = +[PGLogging sharedLogging];
          v26 = [v27 loggingConnection];

          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            long long v30 = [v31 description];
            int v60 = 138412290;
            v61[0] = v30;
            _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for meaning questions: %@", (uint8_t *)&v60, 0xCu);
          }
        }

        if (v7)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v53[3] >= 0.01)
          {
            v53[3] = Current;
            char v34 = 0;
            (*((void (**)(id, char *, double))v17 + 2))(v17, &v34, 1.0);
            char v29 = *((unsigned char *)v57 + 24) | v34;
            *((unsigned char *)v57 + 24) = v29;
            if (v29)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                int v60 = 67109378;
                LODWORD(v61[0]) = 204;
                WORD2(v61[0]) = 2080;
                *(void *)((char *)v61 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v60, 0x12u);
              }
            }
          }
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
  }
}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v10 + 24) = Current,
        char v35 = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    id v23 = v7;
    v11 = [MEMORY[0x1E4F1CA80] set];
    char v24 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      uint64_t v16 = *MEMORY[0x1E4F8E9B0];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v19 = objc_msgSend(v18, "additionalInfo", v22);
          id v20 = [v19 objectForKeyedSubscript:v16];

          if (v20)
          {
            if ([v18 state] == 2)
            {
              [v11 addObject:v20];
            }
            else if ([*(id *)(a1 + 32) containsObject:v20])
            {
              [v24 setObject:v18 forKeyedSubscript:v20];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }

    id v7 = v23;
    if ([v11 count])
    {
      id v21 = *(void **)(a1 + 40);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_2;
      v25[3] = &unk_1E68EB378;
      id v26 = v11;
      id v27 = v24;
      id v28 = *(id *)(a1 + 48);
      id v29 = v23;
      id v30 = *(id *)(a1 + 56);
      [v21 enumerateKeysAndObjectsUsingBlock:v25];
    }
    id v8 = v22;
  }
}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_270(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "questionVersion"));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(MEMORY[0x1E4F39258], "changeRequestForQuestion:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        [v12 setState:2];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v9);
  }
}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v8] & 1) == 0
    && [*(id *)(a1 + 32) intersectsSet:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    if (v6)
    {
      [*(id *)(a1 + 48) addObject:v6];
    }
    else
    {
      id v7 = [[PGMeaningQuestion alloc] initWithConfirmedMeaningLabel:v8 assetUUID:*(void *)(a1 + 56)];
      [*(id *)(a1 + 64) addObject:v7];
    }
  }
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  long long v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  long long v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  uint64_t v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  char v59 = (double *)&v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  if (!v4
    || (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v59[3] < 0.01)
    || (v59[3] = v5,
        v66[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v4 + 2))(v4, v66, 0.0),
        char v6 = *((unsigned char *)v63 + 24) | v66[0],
        (*((unsigned char *)v63 + 24) = v6) == 0))
  {
    *(void *)uint64_t buf = 0;
    *(void *)&long long v71 = buf;
    *((void *)&v71 + 1) = 0x2020000000;
    uint64_t v72 = 0;
    if (([*(id *)(a1 + 32) ignoreExistingQuestions] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_257;
      v52[3] = &unk_1E68EB350;
      uint64_t v54 = buf;
      id v53 = v4;
      uint64_t v55 = &v58;
      uint64_t v56 = &v62;
      uint64_t v57 = 0x3F847AE147AE147BLL;
      [v7 _updateMeaningQuestionsIfNeededWithProgressBlock:v52];
    }
    if (*((unsigned char *)v63 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_34:
        _Block_object_dispose(buf, 8);
        goto LABEL_35;
      }
      *(_DWORD *)v66 = 67109378;
      int v67 = 63;
      __int16 v68 = 2080;
      uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      id v8 = MEMORY[0x1E4F14500];
LABEL_11:
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
      goto LABEL_34;
    }
    if (!*(void *)(a1 + 56))
    {
      if (!v4) {
        goto LABEL_34;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v59[3] < 0.01) {
        goto LABEL_34;
      }
      v59[3] = Current;
      char v51 = 0;
      (*((void (**)(void *, char *, double))v4 + 2))(v4, &v51, 1.0);
      char v22 = *((unsigned char *)v63 + 24) | v51;
      *((unsigned char *)v63 + 24) = v22;
      if (!v22 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_DWORD *)v66 = 67109378;
      int v67 = 67;
      __int16 v68 = 2080;
      uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      id v8 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
    id v37 = v3;
    id v9 = [v3 graph];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    uint64_t v11 = [v9 meaningfulMomentNodesSortedByDate];
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_260;
    v45[3] = &unk_1E68EB350;
    uint64_t v47 = buf;
    id v15 = v4;
    id v46 = v15;
    v48 = &v58;
    uint64_t v49 = &v62;
    uint64_t v50 = 0x3F847AE147AE147BLL;
    id v38 = v11;
    uint64_t v16 = v14;
    long long v17 = v9;
    id v18 = (void *)v10;
    [v13 _questionsToAddFromMomentNodes:v11 useRepresentativeAssets:1 localFactoryScore:v12 alreadyGeneratedQuestions:v16 limit:v9 graph:v10 sceneTaxonomy:1.0 progressBlock:v45];
    id v19 = v3 = v37;
    if (*((unsigned char *)v63 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v66 = 67109378;
        int v67 = 80;
        __int16 v68 = 2080;
        uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
      }
LABEL_16:
      unint64_t v20 = v17;
LABEL_33:

      goto LABEL_34;
    }
    [*(id *)(a1 + 40) unionSet:v19];
    unint64_t v23 = [*(id *)(a1 + 40) count];
    unint64_t v24 = *(void *)(a1 + 56);
    if (v23 >= v24)
    {
      if (v4)
      {
        double v31 = CFAbsoluteTimeGetCurrent();
        id v18 = (void *)v10;
        unint64_t v20 = v17;
        if (v31 - v59[3] >= 0.01)
        {
          v59[3] = v31;
          char v51 = 0;
          (*((void (**)(id, char *, double))v15 + 2))(v15, &v51, 1.0);
          char v32 = *((unsigned char *)v63 + 24) | v51;
          *((unsigned char *)v63 + 24) = v32;
          if (v32)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v66 = 67109378;
              int v67 = 84;
              __int16 v68 = 2080;
              uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Qu"
                    "estions/Survey/Meaning/PGMeaningQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
            }
          }
        }
        goto LABEL_33;
      }
      id v18 = (void *)v10;
      goto LABEL_16;
    }
    id v26 = *(void **)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_261;
    v39[3] = &unk_1E68EB350;
    uint64_t v41 = buf;
    id v27 = v15;
    id v40 = v27;
    id v42 = &v58;
    id v43 = &v62;
    uint64_t v44 = 0x3F847AE147AE147BLL;
    id v3 = v37;
    unint64_t v28 = v24;
    id v18 = (void *)v10;
    uint64_t v29 = [v26 _questionsToAddFromMomentNodes:v38 useRepresentativeAssets:0 localFactoryScore:v25 alreadyGeneratedQuestions:v28 limit:v17 graph:v10 sceneTaxonomy:0.5 progressBlock:v39];

    uint64_t v11 = v38;
    if (*((unsigned char *)v63 + 24))
    {
      unint64_t v20 = v17;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_27:

        id v19 = (void *)v29;
        goto LABEL_33;
      }
      *(_DWORD *)v66 = 67109378;
      int v67 = 92;
      __int16 v68 = 2080;
      uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      id v30 = MEMORY[0x1E4F14500];
    }
    else
    {
      [*(id *)(a1 + 40) unionSet:v29];
      unint64_t v20 = v17;
      if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56))
      {
        uint64_t v11 = v38;
        if (!v4) {
          goto LABEL_27;
        }
        double v35 = CFAbsoluteTimeGetCurrent();
        if (v35 - v59[3] < 0.01) {
          goto LABEL_27;
        }
        v59[3] = v35;
        char v51 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v51, 1.0);
        char v36 = *((unsigned char *)v63 + 24) | v51;
        *((unsigned char *)v63 + 24) = v36;
        if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
        *(_DWORD *)v66 = 67109378;
        int v67 = 96;
        __int16 v68 = 2080;
        uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        id v30 = MEMORY[0x1E4F14500];
      }
      else
      {
        uint64_t v11 = v38;
        if (!v4) {
          goto LABEL_27;
        }
        double v33 = CFAbsoluteTimeGetCurrent();
        if (v33 - v59[3] < 0.01) {
          goto LABEL_27;
        }
        v59[3] = v33;
        char v51 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v51, 1.0);
        char v34 = *((unsigned char *)v63 + 24) | v51;
        *((unsigned char *)v63 + 24) = v34;
        if (!v34 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
        *(_DWORD *)v66 = 67109378;
        int v67 = 100;
        __int16 v68 = 2080;
        uint64_t v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        id v30 = MEMORY[0x1E4F14500];
      }
    }
    _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 53;
    LOWORD(v71) = 2080;
    *(void *)((char *)&v71 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_35:
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_257(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.2;
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

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_260(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 * 0.2 + 0.2;
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

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_261(uint64_t a1, unsigned char *a2, double a3)
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
  return 4;
}

- (unsigned)questionType
{
  return 3;
}

@end