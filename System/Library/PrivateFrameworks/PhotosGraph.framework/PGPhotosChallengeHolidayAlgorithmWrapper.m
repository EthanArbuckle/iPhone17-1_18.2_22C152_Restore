@interface PGPhotosChallengeHolidayAlgorithmWrapper
- (PGGraph)graph;
- (PGPhotosChallengeHolidayAlgorithmWrapper)initWithEvaluationContext:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)debugInformationForHolidayName:(id)a3 assetUUID:(id)a4;
- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 holidayName:(id)a4;
@end

@implementation PGPhotosChallengeHolidayAlgorithmWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (id)debugInformationForHolidayName:(id)a3 assetUUID:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PGGraph *)self->_graph infoNode];
  v9 = [v8 locale];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v9];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v11 = [v10 eventRules];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v82 = v8;
      v83 = v10;
      id v80 = v7;
      v81 = v9;
      uint64_t v14 = *(void *)v86;
      v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v86 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v85 + 1) + 8 * v16);
        v18 = [v17 name];
        char v19 = [v18 isEqualToString:v6];

        if (v19) {
          break;
        }
        if (v13 == ++v16)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v85 objects:v92 count:16];
          if (v13) {
            goto LABEL_4;
          }
          id v20 = v11;
          id v7 = v80;
          v9 = v81;
          v8 = v82;
          v10 = v83;
          goto LABEL_31;
        }
      }
      id v20 = v17;

      if (!v20)
      {
        v15 = (void *)MEMORY[0x1E4F1CC08];
        id v7 = v80;
        v9 = v81;
        v8 = v82;
        v10 = v83;
        goto LABEL_32;
      }
      v21 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      v22 = (void *)MEMORY[0x1E4F38EB8];
      id v7 = v80;
      id v91 = v80;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
      v24 = [v22 fetchAssetsWithUUIDs:v23 options:v21];
      uint64_t v25 = [v24 firstObject];

      v26 = (void *)v25;
      v10 = v83;
      if (v25)
      {
        v27 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v25 withType:3 options:v21];
        uint64_t v28 = [v27 firstObject];

        v79 = (void *)v28;
        if (v28)
        {
          v78 = [(PGGraph *)self->_graph momentNodeForMoment:v28];
          if (v78)
          {
            v29 = [v78 collection];
            [v29 sceneNodes];
            v30 = v68 = v26;
            [v30 sceneNames];
            v31 = v69 = v21;
            v67 = [v31 allObjects];

            v77 = objc_msgSend(v67, "componentsJoinedByString:");
            v32 = [v78 collection];
            v33 = [v32 addressNodes];
            v34 = [v33 countryNodes];
            v73 = [v34 names];

            v76 = [v73 componentsJoinedByString:@","];
            v71 = [v81 countryCode];
            v35 = [v20 requiredTraits];
            v66 = [v35 defaultScenesWithImportanceString];

            id v84 = 0;
            v64 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v66 options:0 error:&v84];
            id v65 = v84;
            v75 = (void *)[[NSString alloc] initWithData:v64 encoding:4];
            v63 = [v20 explicitlySupportedCountryCodes];
            v74 = [v63 componentsJoinedByString:@","];
            v70 = +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:v82 holidayService:v83];
            v62 = [v70 componentsJoinedByString:@","];
            v36 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
            v72 = [(PGGraphIngestHolidayProcessorHelper *)v36 holidayCalendarEventRuleTraitsForMomentNode:v78];
            BOOL v56 = [(PGGraphIngestHolidayProcessorHelper *)v36 momentTraitsMatchesHolidayTraits:v20 momentNode:v78 loggingConnection:MEMORY[0x1E4F14500]];
            v37 = [v78 collection];
            v38 = [v37 dateNodes];
            v39 = [v38 anyNode];
            v61 = [v39 localDate];

            v59 = objc_alloc_init(PGHolidayClassifier);
            v60 = v36;
            [(PGGraphIngestHolidayProcessorHelper *)v36 dateScoreForEventRule:v20 localeCountryCode:v71 momentCountryCodes:v73 keyboardLanguageCodes:v70 momentDate:v61];
            double v41 = v40;
            [(PGGraphIngestHolidayProcessorHelper *)v36 sceneScoreForEventRule:v20 localeCountryCode:v71 momentCountryCodes:v73 keyboardLanguageCodes:v70 momentNode:v78];
            double v43 = v42;
            [(PGGraphIngestHolidayProcessorHelper *)v36 locationScoreForEventRule:v20 localeCountryCode:v71 momentCountryCodes:v73 keyboardLanguageCodes:v70];
            double v45 = v44;
            BOOL v46 = [(PGHolidayClassifier *)v59 isCelebratingForDateScore:v41 sceneScore:v43 locationScore:v44];
            v89[0] = @"momentSceneNames";
            v89[1] = @"momentCountryCodes";
            v90[0] = v77;
            v90[1] = v76;
            v90[2] = v71;
            v89[2] = @"localeCountryCode";
            v89[3] = @"momentTraits";
            uint64_t v47 = [v72 description];
            v58 = (void *)v47;
            if (v56) {
              v48 = @"YES";
            }
            else {
              v48 = @"NO";
            }
            v90[3] = v47;
            v90[4] = v48;
            v89[4] = @"allRequiredRulesApplyForMomentNode";
            v89[5] = @"holidaySceneCriteria";
            v90[5] = v75;
            v90[6] = v74;
            v89[6] = @"holidayCriteriaSupportedCountryCodes";
            v89[7] = @"isCelebrating";
            if (v46) {
              v49 = @"YES";
            }
            else {
              v49 = @"NO";
            }
            v90[7] = v49;
            v89[8] = @"dateScore";
            v57 = [NSNumber numberWithDouble:v41];
            v50 = [v57 stringValue];
            v90[8] = v50;
            v89[9] = @"sceneScore";
            v51 = [NSNumber numberWithDouble:v43];
            v52 = [v51 stringValue];
            v90[9] = v52;
            v89[10] = @"locationScore";
            v53 = [NSNumber numberWithDouble:v45];
            v54 = [v53 stringValue];
            v89[11] = @"keyboardLanguageCodes";
            v90[10] = v54;
            v90[11] = v62;
            v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:12];

            v21 = v69;
            v26 = v68;

            v10 = v83;
          }
          else
          {
            v15 = (void *)MEMORY[0x1E4F1CC08];
          }
        }
        else
        {
          v15 = (void *)MEMORY[0x1E4F1CC08];
        }
        v9 = v81;
        v8 = v82;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E4F1CC08];
        v9 = v81;
        v8 = v82;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1CC08];
      id v20 = v11;
    }
LABEL_31:

LABEL_32:
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v15;
}

- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 holidayName:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v9 = (void *)MEMORY[0x1E4F38EB8];
  v42[0] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  v11 = [v9 fetchAssetsWithUUIDs:v10 options:v8];
  uint64_t v12 = [v11 firstObject];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v12 withType:3 options:v8];
    uint64_t v14 = [v13 firstObject];

    if (v14)
    {
      v15 = [(PGGraph *)self->_graph momentNodeForMoment:v14];
      uint64_t v16 = v15;
      if (v15)
      {
        v17 = [v15 localStartDate];
        uint64_t v18 = [v16 localEndDate];
        char v19 = (void *)v18;
        unsigned __int16 v20 = 1;
        if (v17 && v18)
        {
          v29 = [(PGGraph *)self->_graph infoNode];
          v30 = [v29 locale];
          if (v30)
          {
            v26 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
            uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v30];
            uint64_t v25 = +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:v29 holidayService:v28];
            uint64_t v38 = 0;
            v39 = &v38;
            uint64_t v40 = 0x2020000000;
            __int16 v41 = 3;
            uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __91__PGPhotosChallengeHolidayAlgorithmWrapper_predictedQuestionStateForAssetUUID_holidayName___block_invoke;
            v31[3] = &unk_1E68E6260;
            v24 = v26;
            v32 = v24;
            id v33 = v30;
            id v27 = v25;
            id v34 = v27;
            v35 = self;
            id v36 = v16;
            v37 = &v38;
            [v28 enumerateEventRulesWithNames:v21 betweenLocalDate:v17 andLocalDate:v19 usingBlock:v31];
            v22 = (void *)v21;
            unsigned __int16 v20 = *((_WORD *)v39 + 12);

            _Block_object_dispose(&v38, 8);
          }
        }
      }
      else
      {
        unsigned __int16 v20 = 1;
      }
    }
    else
    {
      unsigned __int16 v20 = 1;
    }
  }
  else
  {
    unsigned __int16 v20 = 1;
  }

  return v20;
}

void __91__PGPhotosChallengeHolidayAlgorithmWrapper_predictedQuestionStateForAssetUUID_holidayName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a3;
  v8 = [v6 countryCode];
  v9 = [v5 momentsCelebratingRule:v14 localDates:v7 userCountryCode:v8 keyboardLanguageCodes:*(void *)(a1 + 48) graph:*(void *)(*(void *)(a1 + 56) + 8) loggingConnection:MEMORY[0x1E4F14500]];

  v10 = [v9 positivelyClassifiedMomentNodes];
  LODWORD(v8) = [v10 containsObject:*(void *)(a1 + 64)];

  if (v8) {
    goto LABEL_2;
  }
  v11 = [v9 negativelyClassifiedMomentNodes];
  if (([v11 containsObject:*(void *)(a1 + 64)] & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v12 = [*(id *)(a1 + 40) countryCode];
  if (([v14 backfillForCountryCode:v12] & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  int v13 = [*(id *)(a1 + 64) isInterestingForMemories];

  if (v13) {
LABEL_2:
  }
    *(_WORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 2;
LABEL_9:
}

- (PGPhotosChallengeHolidayAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotosChallengeHolidayAlgorithmWrapper;
  v5 = [(PGPhotosChallengeHolidayAlgorithmWrapper *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 graph];
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v6;

    uint64_t v8 = [v4 photoLibrary];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;
  }
  return v5;
}

@end