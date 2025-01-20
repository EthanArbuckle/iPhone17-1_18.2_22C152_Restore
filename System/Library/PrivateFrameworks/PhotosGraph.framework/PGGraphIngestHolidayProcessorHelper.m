@interface PGGraphIngestHolidayProcessorHelper
+ (id)keyboardLanguageCodesForInfoNode:(id)a3 holidayService:(id)a4;
- (BOOL)isCelebratingForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9;
- (BOOL)momentTraitsMatchesHolidayTraits:(id)a3 momentNode:(id)a4 loggingConnection:(id)a5;
- (PGGraphIngestHolidayProcessorHelper)init;
- (double)_calculateSceneScores:(id)a3;
- (double)_dateScoreForEventRule:(id)a3 localeCode:(id)a4 holidayDate:(id)a5 momentDate:(id)a6;
- (double)dateScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentDate:(id)a7;
- (double)locationScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6;
- (double)sceneScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentNode:(id)a7;
- (id)holidayCalendarEventRuleTraitsForMomentNode:(id)a3;
- (id)momentsCelebratingRule:(id)a3 localDates:(id)a4 userCountryCode:(id)a5 keyboardLanguageCodes:(id)a6 graph:(id)a7 loggingConnection:(id)a8;
- (unint64_t)_eventRuleLocationTraitForMomentNode:(id)a3 graph:(id)a4;
- (unint64_t)_eventRulePeopleTraitForPersonNodes:(id)a3 graph:(id)a4;
- (void)prepareIfNeededWithGraph:(id)a3;
@end

@implementation PGGraphIngestHolidayProcessorHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSexByPartnerPersonNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonAcquaintancePersonNodes, 0);
  objc_storeStrong((id *)&self->_coworkerPersonNodes, 0);
  objc_storeStrong((id *)&self->_friendPersonNodes, 0);
  objc_storeStrong((id *)&self->_motherPersonNodes, 0);
  objc_storeStrong((id *)&self->_fatherPersonNodes, 0);
  objc_storeStrong((id *)&self->_childPersonNodes, 0);
  objc_storeStrong((id *)&self->_familyPersonNodes, 0);
  objc_storeStrong((id *)&self->_partnerPersonNodes, 0);
  objc_storeStrong((id *)&self->_meNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_holidayClassifier, 0);
}

- (unint64_t)_eventRuleLocationTraitForMomentNode:(id)a3 graph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasAddressNodes])
  {
    v7 = [v6 supersetCityNodes];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v8 = [v5 bestAddressNode];
    v9 = [v8 location];
    v10 = [v5 collection];
    v11 = [v10 cityNodes];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke;
    v23 = &unk_1E68E80D8;
    v26 = &v32;
    id v12 = v7;
    id v24 = v12;
    id v13 = v9;
    id v25 = v13;
    v27 = &v28;
    [v11 enumerateNodesUsingBlock:&v20];

    if (*((unsigned char *)v33 + 24))
    {
      unint64_t v14 = 7;
    }
    else if (*((unsigned char *)v29 + 24))
    {
      unint64_t v14 = 14;
    }
    else
    {
      v15 = objc_msgSend(v6, "supersetCountryNodes", v20, v21, v22, v23, v24);
      v16 = [v5 collection];
      v17 = [v16 addressNodes];
      v18 = [v17 countryNodes];

      if ([v18 intersectsCollection:v15]) {
        unint64_t v14 = 20;
      }
      else {
        unint64_t v14 = 48;
      }
    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

void __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) containsNode:a2];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke_2;
      v9[3] = &unk_1E68E80B0;
      id v7 = v5;
      uint64_t v8 = *(void *)(a1 + 56);
      id v10 = v7;
      uint64_t v11 = v8;
      id v12 = a3;
      [v6 enumerateNodesUsingBlock:v9];
    }
  }
}

void __82__PGGraphIngestHolidayProcessorHelper__eventRuleLocationTraitForMomentNode_graph___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 collection];
  v4 = [v3 addressNodes];
  id v7 = [v4 anyNode];

  id v5 = [v7 location];
  if (v5)
  {
    [*(id *)(a1 + 32) distanceFromLocation:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6 <= *MEMORY[0x1E4F76DD8];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      **(unsigned char **)(a1 + 48) = 1;
    }
  }
}

- (unint64_t)_eventRulePeopleTraitForPersonNodes:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PGGraphIngestHolidayProcessorHelper *)self prepareIfNeededWithGraph:v7];
  unint64_t v8 = [v6 intersectsCollection:self->_partnerPersonNodes];
  if ([v6 intersectsCollection:self->_familyPersonNodes]) {
    v8 |= 2uLL;
  }
  if ([v6 intersectsCollection:self->_friendPersonNodes]) {
    v8 |= 4uLL;
  }
  if (![(MAElementCollection *)self->_nonAcquaintancePersonNodes containsCollection:v6]) {
    v8 |= 0x10uLL;
  }
  if ([v6 intersectsCollection:self->_coworkerPersonNodes]) {
    v8 |= 8uLL;
  }
  if ([v6 intersectsCollection:self->_motherPersonNodes]) {
    v8 |= 0x20uLL;
  }
  if ([v6 intersectsCollection:self->_fatherPersonNodes]) {
    v8 |= 0x40uLL;
  }
  if ([v6 intersectsCollection:self->_childPersonNodes])
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v9 = [v6 elementIdentifiers];
    id v10 = [(MAElementCollection *)self->_partnerPersonNodes elementIdentifiers];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PGGraphIngestHolidayProcessorHelper__eventRulePeopleTraitForPersonNodes_graph___block_invoke;
    v14[3] = &unk_1E68EFB60;
    id v11 = v9;
    id v15 = v11;
    v16 = self;
    v17 = &v23;
    v18 = &v19;
    [v10 enumerateIdentifiersWithBlock:v14];

    unint64_t meBiologicalSex = self->_meBiologicalSex;
    if (meBiologicalSex == 1 || *((unsigned char *)v24 + 24)) {
      v8 |= 0x20uLL;
    }
    if (meBiologicalSex == 2 || *((unsigned char *)v20 + 24)) {
      v8 |= 0x40uLL;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

void __81__PGGraphIngestHolidayProcessorHelper__eventRulePeopleTraitForPersonNodes_graph___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) containsIdentifier:a2])
  {
    v4 = *(void **)(*(void *)(a1 + 40) + 96);
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 unsignedIntegerValue];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v7 == 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v7 == 2;
  }
}

- (id)holidayCalendarEventRuleTraitsForMomentNode:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F76CB0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [v5 collection];
  unint64_t v8 = [v7 personNodes];

  v9 = [v5 graph];
  objc_msgSend(v6, "setPeopleTrait:", -[PGGraphIngestHolidayProcessorHelper _eventRulePeopleTraitForPersonNodes:graph:](self, "_eventRulePeopleTraitForPersonNodes:graph:", v8, v9));

  objc_msgSend(v6, "setContainsMePerson:", objc_msgSend(v8, "containsMeNode"));
  id v10 = [v5 collection];

  id v11 = [v10 personNodes];
  objc_msgSend(v6, "setNumberOfPeople:", objc_msgSend(v11, "count"));

  return v6;
}

- (BOOL)momentTraitsMatchesHolidayTraits:(id)a3 momentNode:(id)a4 loggingConnection:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PGGraphIngestHolidayProcessorHelper *)self holidayCalendarEventRuleTraitsForMomentNode:v9];
  int v12 = [v8 evaluateOnlyTraits:v11 evaluateLocationTraits:0];
  id v13 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [v9 uuid];
    if (v12) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    v17 = [v8 name];
    v18 = [v8 requiredTraits];
    int v19 = 138413314;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    char v22 = v16;
    __int16 v23 = 2112;
    id v24 = v17;
    __int16 v25 = 2112;
    char v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v18;
    _os_log_debug_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEBUG, "[HolidayProcessor] Moment (UUID: %@) traits match? (%@) event rule traits for holiday %@\n %@\n %@", (uint8_t *)&v19, 0x34u);
  }
  return v12;
}

- (double)_dateScoreForEventRule:(id)a3 localeCode:(id)a4 holidayDate:(id)a5 momentDate:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [a3 requiredTraits];
  int v11 = [v10 allowApproximateDateCalculation];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F76C68] numberOfDaysBetweenDate:v9 andDate:v8];

    return (double)v12 / -3.0 + 1.0;
  }
  else
  {
    uint64_t v14 = [v9 compare:v8];

    double result = 0.0;
    if (!v14) {
      return 1.0;
    }
  }
  return result;
}

- (double)dateScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentDate:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [MEMORY[0x1E4F76C68] yearFromDate:v15];
  v17 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
  v18 = v17;
  if (v12) {
    [v17 addObject:v12];
  }
  if ([v18 count])
  {
    id v44 = v12;
    v45 = v14;
    id v43 = v13;
    unint64_t v41 = [v18 count];
    v42 = v18;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v53;
      double v22 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v53 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          __int16 v25 = [v11 localDateByEvaluatingRuleForYear:v16 countryCode:v24];
          if (v25)
          {
            [(PGGraphIngestHolidayProcessorHelper *)self _dateScoreForEventRule:v11 localeCode:v24 holidayDate:v25 momentDate:v15];
            double v22 = v22 + v26;
          }
          else
          {
            __int16 v27 = +[PGLogging sharedLogging];
            uint64_t v28 = [v27 loggingConnection];

            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = [v11 name];
              *(_DWORD *)buf = 138412802;
              v58 = v29;
              __int16 v59 = 2112;
              uint64_t v60 = v24;
              __int16 v61 = 2048;
              uint64_t v62 = v16;
              _os_log_error_impl(&dword_1D1805000, v28, OS_LOG_TYPE_ERROR, "Holiday %@ has no default data rule or dateRuleOverride for countryCode %@, year %ld", buf, 0x20u);
            }
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v20);
    }
    else
    {
      double v22 = 0.0;
    }
    double v31 = (double)v41;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v32 = v45;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v48 + 1) + 8 * j);
          v38 = [v11 localDateByEvaluatingRuleForYear:v16 languageCode:v37];
          if (v38)
          {
            [(PGGraphIngestHolidayProcessorHelper *)self _dateScoreForEventRule:v11 localeCode:v37 holidayDate:v38 momentDate:v15];
            if (v39 == 0.0) {
              double v39 = -0.0;
            }
            else {
              double v31 = v31 + 1.0;
            }
            double v22 = v22 + v39;
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v34);
    }

    double v30 = v22 / v31;
    id v13 = v43;
    id v12 = v44;
    id v14 = v45;
    v18 = v42;
  }
  else
  {
    double v30 = 0.0;
  }

  return v30;
}

- (double)_calculateSceneScores:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PGHolidayClassifier *)self->_holidayClassifier scoreForHolidayDetectedScenes:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v8 < v10) {
          double v8 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)sceneScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6 momentNode:(id)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v56 = a6;
  id v14 = a7;
  if (![v11 skipSceneCriteriaIfInteresting]
    || (double v15 = 1.0, ([v14 isInterestingForMemories] & 1) == 0))
  {
    v58 = v14;
    uint64_t v16 = [v14 collection];
    uint64_t v17 = [v16 sceneNodes];

    long long v53 = v17;
    v18 = [v17 sceneNames];
    id v54 = v13;
    uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    uint64_t v20 = v19;
    if (v12) {
      [v19 addObject:v12];
    }
    id v55 = v12;
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v20;
    uint64_t v22 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    __int16 v23 = self;
    if (v22)
    {
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(obj);
          }
          __int16 v27 = [v11 scoreForCountryCode:*(void *)(*((void *)&v65 + 1) + 8 * i) sceneNames:v18];
          [(PGHolidayClassifier *)v23->_holidayClassifier scoreForHolidayDetectedScenes:v27];
          if (v28 > 0.0)
          {
            double v29 = v28;
            double v30 = +[PGLogging sharedLogging];
            double v31 = [v30 loggingConnection];

            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              id v32 = [v58 uuid];
              uint64_t v33 = [v11 name];
              *(_DWORD *)buf = 138412802;
              v71 = v32;
              __int16 v72 = 2112;
              v73 = v33;
              __int16 v74 = 2048;
              double v75 = v29;
              _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[HolidayProcessor] MomentUUID: %@, Holiday: %@, calculatedSceneScoreForCountryCode: %f", buf, 0x20u);

              __int16 v23 = self;
            }
          }
          [v21 addObject:v27];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v24);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v34 = v56;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v62;
      do
      {
        uint64_t v38 = 0;
        uint64_t v57 = v36;
        do
        {
          if (*(void *)v62 != v37) {
            objc_enumerationMutation(v34);
          }
          double v39 = [v11 scoreForLanguageCode:*(void *)(*((void *)&v61 + 1) + 8 * v38) sceneNames:v18];
          [(PGHolidayClassifier *)v23->_holidayClassifier scoreForHolidayDetectedScenes:v39];
          if (v40 > 0.0)
          {
            double v41 = v40;
            v42 = +[PGLogging sharedLogging];
            id v43 = [v42 loggingConnection];

            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              id v44 = [v58 uuid];
              [v11 name];
              uint64_t v45 = v37;
              id v46 = v21;
              id v47 = v11;
              long long v48 = v18;
              v50 = id v49 = v34;
              *(_DWORD *)buf = 138412802;
              v71 = v44;
              __int16 v72 = 2112;
              v73 = v50;
              __int16 v74 = 2048;
              double v75 = v41;
              _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[HolidayProcessor] MomentUUID: %@, Holiday: %@, calculatedSceneScoreForLanguageCode: %f", buf, 0x20u);

              id v34 = v49;
              v18 = v48;
              id v11 = v47;
              id v21 = v46;
              uint64_t v37 = v45;
              uint64_t v36 = v57;
            }
            __int16 v23 = self;
          }
          [v21 addObject:v39];

          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v36);
    }

    [(PGGraphIngestHolidayProcessorHelper *)v23 _calculateSceneScores:v21];
    double v15 = v51;

    id v13 = v54;
    id v12 = v55;
    id v14 = v58;
  }

  return v15;
}

- (double)locationScoreForEventRule:(id)a3 localeCountryCode:(id)a4 momentCountryCodes:(id)a5 keyboardLanguageCodes:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [v10 locationScoreForCountryCode:a4];
  double v14 = v13;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    double v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [v10 locationScoreForCountryCode:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        double v19 = v19 + v21;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v17);
  }
  else
  {
    double v19 = 0.0;
  }

  if ([v15 count])
  {
    double v22 = v19 / (double)(unint64_t)[v15 count];
    [(PGHolidayClassifier *)self->_holidayClassifier localeLocationWeight];
    double v24 = v23;
    [(PGHolidayClassifier *)self->_holidayClassifier momentLocationWeight];
    long long v34 = 0u;
    long long v35 = 0u;
    double v14 = v22 * v25 + v24 * v14;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = v12;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      double v30 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(v10, "languageScoreForLanguageCode:", *(void *)(*((void *)&v34 + 1) + 8 * j), (void)v34);
          double v30 = v30 + v32;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);

      if (v30 > 0.0) {
        double v14 = (v14 + v30 / (double)(unint64_t)[v26 count]) * 0.5;
      }
    }
    else
    {
    }
  }

  return v14;
}

- (BOOL)isCelebratingForEventRule:(id)a3 momentNode:(id)a4 momentLocalDate:(id)a5 withGraph:(id)a6 loggingConnection:(id)a7 localeCountryCode:(id)a8 keyboardLanguageCodes:(id)a9
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if ([v14 isCelebration])
  {
    long long v39 = v17;
    uint64_t v20 = [v15 collection];
    double v21 = [v20 addressNodes];
    double v22 = [v21 countryNodes];
    uint64_t v23 = [v22 names];

    double v24 = (void *)v23;
    [(PGGraphIngestHolidayProcessorHelper *)self dateScoreForEventRule:v14 localeCountryCode:v18 momentCountryCodes:v23 keyboardLanguageCodes:v19 momentDate:v16];
    if (v25 == 0.0)
    {
      LOBYTE(v26) = 0;
      id v17 = v39;
    }
    else
    {
      double v27 = v25;
      id v17 = v39;
      if ([(PGGraphIngestHolidayProcessorHelper *)self momentTraitsMatchesHolidayTraits:v14 momentNode:v15 loggingConnection:v39])
      {
        [(PGGraphIngestHolidayProcessorHelper *)self sceneScoreForEventRule:v14 localeCountryCode:v18 momentCountryCodes:v24 keyboardLanguageCodes:v19 momentNode:v15];
        double v29 = v28;
        [(PGGraphIngestHolidayProcessorHelper *)self locationScoreForEventRule:v14 localeCountryCode:v18 momentCountryCodes:v24 keyboardLanguageCodes:v19];
        double v31 = v30;
        BOOL v26 = [(PGHolidayClassifier *)self->_holidayClassifier isCelebratingForDateScore:v27 sceneScore:v29 locationScore:v30];
        double v32 = v39;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          long long v34 = [v15 uuid];
          uint64_t v35 = [v14 name];
          long long v36 = v24;
          long long v37 = (void *)v35;
          *(_DWORD *)buf = 138414082;
          long long v38 = "NO";
          long long v41 = v34;
          if (v26) {
            long long v38 = "YES";
          }
          __int16 v42 = 2112;
          uint64_t v43 = v35;
          __int16 v44 = 2112;
          id v45 = v18;
          __int16 v46 = 2112;
          id v47 = v36;
          __int16 v48 = 2048;
          double v49 = v27;
          __int16 v50 = 2048;
          double v51 = v29;
          __int16 v52 = 2048;
          double v53 = v31;
          __int16 v54 = 2080;
          id v55 = v38;
          _os_log_debug_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEBUG, "[HolidayProcessor] MomentUUID: %@, holiday name: %@\nuserCountryCode: %@, momentCountryCode: %@\ndateScore: %f, sceneScore: %f, locationScore: %f, isCelebrating: %s", buf, 0x52u);

          double v24 = v36;
          id v17 = v39;
        }
      }
      else
      {
        LOBYTE(v26) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v26) = 0;
  }

  return v26;
}

- (id)momentsCelebratingRule:(id)a3 localDates:(id)a4 userCountryCode:(id)a5 keyboardLanguageCodes:(id)a6 graph:(id)a7 loggingConnection:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([v14 isCelebration])
  {
    uint64_t v20 = [v14 explicitlySupportedCountryCodes];
    char v21 = [v20 containsObject:v16];

    double v22 = +[PGGraphDateNodeCollection dateNodesForLocalDates:v15 inGraph:v18];
    if ([v22 count])
    {
      long long v41 = objc_alloc_init(PGHolidayDetectionCache);
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v43 = v17;
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke;
      v58[3] = &unk_1E68ED880;
      char v37 = v21;
      id v24 = v23;
      id v59 = v24;
      [v22 enumerateNodesUsingBlock:v58];
      uint64_t v35 = self;
      double v25 = (void *)MEMORY[0x1E4F71E88];
      BOOL v26 = +[PGGraphDateNode momentOfDate];
      long long v36 = [v25 adjacencyWithSources:v22 relation:v26 targetsClass:objc_opt_class()];

      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v28 = [v36 targets];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_2;
      v56[3] = &unk_1E68EF578;
      id v29 = v27;
      id v57 = v29;
      [v28 enumerateNodesUsingBlock:v56];

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_3;
      v44[3] = &unk_1E68E8088;
      id v45 = v24;
      id v46 = v29;
      id v47 = v35;
      id v48 = v14;
      id v49 = v18;
      id v50 = v19;
      id v51 = v16;
      id v52 = v17;
      char v55 = v37;
      double v30 = v41;
      double v53 = v30;
      id v54 = v39;
      id v42 = v39;
      id v38 = v29;
      id v40 = v24;
      [v36 enumerateTargetsBySourceWithBlock:v44];
      double v31 = v54;
      double v32 = v30;
      id v17 = v43;
      uint64_t v33 = v32;
    }
    else
    {
      uint64_t v33 = 0;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:v5];
}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:v5];
}

void __135__PGGraphIngestHolidayProcessorHelper_momentsCelebratingRule_localDates_userCountryCode_keyboardLanguageCodes_graph_loggingConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v7 = [v5 elementIdentifiers];
  uint64_t v8 = [v7 firstElement];

  id v9 = *(void **)(a1 + 32);
  id v10 = [NSNumber numberWithUnsignedInteger:v8];
  id v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = [v11 localDate];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v13 = [v6 elementIdentifiers];
  id v14 = [v13 indexArray];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if ([*(id *)(a1 + 48) isCelebratingForEventRule:*(void *)(a1 + 56) momentNode:v19 momentLocalDate:v12 withGraph:*(void *)(a1 + 64) loggingConnection:*(void *)(a1 + 72) localeCountryCode:*(void *)(a1 + 80) keyboardLanguageCodes:*(void *)(a1 + 88)])
        {
          [*(id *)(a1 + 96) addHolidayWithDateNode:v11];
          [*(id *)(a1 + 104) addObject:v19];
          [*(id *)(a1 + 96) addPositivelyClassifiedMomentNode:v19];
        }
        else if (*(unsigned char *)(a1 + 112))
        {
          [*(id *)(a1 + 96) addHolidayWithDateNode:v11];
          if (([*(id *)(a1 + 56) backfillForCountryCode:*(void *)(a1 + 80)] & 1) != 0
            || [*(id *)(a1 + 56) backfillForLanguageCodes:*(void *)(a1 + 88)])
          {
            if ([v19 isInterestingForMemories]) {
              [*(id *)(a1 + 96) addNegativelyClassifiedMomentNode:v19];
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
}

- (void)prepareIfNeededWithGraph:(id)a3
{
  if (!self->_meNodeAsCollection)
  {
    id v4 = +[PGGraphNodeCollection nodesInGraph:a3];
    meNodeAsCollection = self->_meNodeAsCollection;
    self->_meNodeAsCollection = v4;

    id v6 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection partnerPersonNodes];
    partnerPersonNodes = self->_partnerPersonNodes;
    self->_partnerPersonNodes = v6;

    uint64_t v8 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection familyPersonNodes];
    familyPersonNodes = self->_familyPersonNodes;
    self->_familyPersonNodes = v8;

    id v10 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection childPersonNodes];
    childPersonNodes = self->_childPersonNodes;
    self->_childPersonNodes = v10;

    id v12 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection fatherPersonNodes];
    fatherPersonNodes = self->_fatherPersonNodes;
    self->_fatherPersonNodes = v12;

    id v14 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection motherPersonNodes];
    motherPersonNodes = self->_motherPersonNodes;
    self->_motherPersonNodes = v14;

    uint64_t v16 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection friendPersonNodes];
    friendPersonNodes = self->_friendPersonNodes;
    self->_friendPersonNodes = v16;

    id v18 = [(PGGraphPersonNodeCollection *)self->_meNodeAsCollection coworkerPersonNodes];
    coworkerPersonNodes = self->_coworkerPersonNodes;
    self->_coworkerPersonNodes = v18;

    uint64_t v20 = [(MAElementCollection *)self->_meNodeAsCollection collectionByFormingUnionWith:self->_familyPersonNodes];
    long long v21 = [v20 collectionByFormingUnionWith:self->_partnerPersonNodes];
    long long v22 = [v21 collectionByFormingUnionWith:self->_childPersonNodes];
    long long v23 = [v22 collectionByFormingUnionWith:self->_coworkerPersonNodes];
    long long v24 = [v23 collectionByFormingUnionWith:self->_friendPersonNodes];
    nonAcquaintancePersonNodes = self->_nonAcquaintancePersonNodes;
    self->_nonAcquaintancePersonNodes = v24;

    uint64_t v26 = self->_meNodeAsCollection;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke;
    v31[3] = &unk_1E68EA838;
    v31[4] = self;
    [(PGGraphPersonNodeCollection *)v26 enumerateBiologicalSexUsingBlock:v31];
    if ([(MAElementCollection *)self->_partnerPersonNodes count])
    {
      id v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      biologicalSexByPartnerPersonNodeIdentifier = self->_biologicalSexByPartnerPersonNodeIdentifier;
      self->_biologicalSexByPartnerPersonNodeIdentifier = v27;

      id v29 = self->_partnerPersonNodes;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke_2;
      v30[3] = &unk_1E68EA838;
      v30[4] = self;
      [(PGGraphPersonNodeCollection *)v29 enumerateBiologicalSexUsingBlock:v30];
    }
  }
}

uint64_t __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(result + 32) + 88) = a3;
  return result;
}

void __64__PGGraphIngestHolidayProcessorHelper_prepareIfNeededWithGraph___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = *(void **)(*(void *)(a1 + 32) + 96);
    id v6 = [NSNumber numberWithUnsignedInteger:a2];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- (PGGraphIngestHolidayProcessorHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphIngestHolidayProcessorHelper;
  v2 = [(PGGraphIngestHolidayProcessorHelper *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PGHolidayClassifier);
    holidayClassifier = v2->_holidayClassifier;
    v2->_holidayClassifier = v3;
  }
  return v2;
}

+ (id)keyboardLanguageCodesForInfoNode:(id)a3 holidayService:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [a4 supportedLanguageCodes];
  uint64_t v8 = [v6 setWithArray:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = [v5 languageIdentifiers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((unint64_t)[v15 length] >= 2)
        {
          uint64_t v16 = [v15 substringToIndex:2];
          if ([v16 length] == 2) {
            [v9 addObject:v16];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  [v9 intersectSet:v8];
  uint64_t v17 = [v9 allObjects];

  return v17;
}

@end