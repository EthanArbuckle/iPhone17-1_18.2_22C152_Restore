@interface PGPublicEventCriteriaFactory
+ (id)publicEventCriteriaByCategoryForGraph:(id)a3 sceneTaxonomy:(id)a4;
- (NSDictionary)disambiguationCriteriaByEventCategory;
- (NSDictionary)highConfidenceCriteriaByEventCategory;
- (NSDictionary)prohibitedCriteriaByEventCategory;
- (PGPublicEventCriteriaFactory)initWithGraph:(id)a3 sceneTaxonomy:(id)a4;
- (id)_appleEventsCriteriaArray;
- (id)_artsAndMuseumsCriteriaArray;
- (id)_danceCriteriaArray;
- (id)_festivalsAndFairsCriteriaArray;
- (id)_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:(id)a3 inferenceType:(unint64_t)a4;
- (id)_musicConcertsCriteriaArray;
- (id)_nightLifeCriteriaArray;
- (id)_publicEventCriteriaByCategory;
- (id)_sportsCriteriaArray;
- (id)_theaterCriteriaArray;
@end

@implementation PGPublicEventCriteriaFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_highConfidenceCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_disambiguationCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)_appleEventsCriteriaArray
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F76D68] appleEvents];
  v3 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v3 setEventCategory:v2];
  [(PGPublicEventCriteria *)v3 setMinimumTimeAttendance:300.0];
  [(PGPublicEventCriteria *)v3 setMaximumDistance:2000.0];
  [(PGPublicEventCriteria *)v3 setAllowsExpandingTimeAttendance:1];
  [(PGPublicEventCriteria *)v3 setPromoteToHighConfidenceBasedOnCategory:1];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_festivalsAndFairsCriteriaArray
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  v4 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v4 setEventCategory:v3];
  [(PGPublicEventCriteria *)v4 setMinimumTimeAttendance:12600.0];
  [(PGPublicEventCriteria *)v4 setMaximumDistance:1000.0];
  [(PGPublicEventCriteria *)v4 setMinimumAttendance:15000];
  v5 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v6 = [v5 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setHighConfidenceCriteria:v6];

  v7 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v8 = [v7 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setProhibitedCriteria:v8];

  [(PGPublicEventCriteria *)v4 setPromoteToHighConfidenceBasedOnCategory:1];
  v11[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_artsAndMuseumsCriteriaArray
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  v4 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v4 setEventCategory:v3];
  [(PGPublicEventCriteria *)v4 setMinimumTimeAttendance:3600.0];
  [(PGPublicEventCriteria *)v4 setMaximumDistance:100.0];
  v5 = [(PGPublicEventCriteriaFactory *)self disambiguationCriteriaByEventCategory];
  v6 = [v5 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setDisambiguationCriteria:v6];

  v7 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v8 = [v7 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setHighConfidenceCriteria:v8];

  v9 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v10 = [v9 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setProhibitedCriteria:v10];

  [(PGPublicEventCriteria *)v4 setPromoteToHighConfidenceBasedOnCategory:1];
  v13[0] = v4;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (id)_nightLifeCriteriaArray
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] nightLife];
  v4 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v5 = [v4 objectForKeyedSubscript:v3];

  v6 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v7 = [v6 objectForKeyedSubscript:v3];

  v8 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v8 setEventCategory:v3];
  [(PGPublicEventCriteria *)v8 setMinimumTimeAttendance:2700.0];
  [(PGPublicEventCriteria *)v8 setMaximumDistance:100.0];
  [(PGPublicEventCriteria *)v8 setHighConfidenceCriteria:v5];
  [(PGPublicEventCriteria *)v8 setProhibitedCriteria:v7];
  [(PGPublicEventCriteria *)v8 setPromoteToHighConfidenceBasedOnCategory:0];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_danceCriteriaArray
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] dance];
  v4 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v4 setEventCategory:v3];
  [(PGPublicEventCriteria *)v4 setMinimumTimeAttendance:2700.0];
  [(PGPublicEventCriteria *)v4 setMaximumDistance:100.0];
  [(PGPublicEventCriteria *)v4 setAllowsExpandingTimeAttendance:1];
  v5 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v6 = [v5 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setHighConfidenceCriteria:v6];

  v7 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v8 = [v7 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setProhibitedCriteria:v8];

  [(PGPublicEventCriteria *)v4 setPromoteToHighConfidenceBasedOnCategory:0];
  v11[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_theaterCriteriaArray
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] theater];
  v4 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v4 setEventCategory:v3];
  [(PGPublicEventCriteria *)v4 setMinimumTimeAttendance:2700.0];
  [(PGPublicEventCriteria *)v4 setMaximumDistance:100.0];
  [(PGPublicEventCriteria *)v4 setAllowsExpandingTimeAttendance:1];
  v5 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v6 = [v5 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setHighConfidenceCriteria:v6];

  v7 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v8 = [v7 objectForKeyedSubscript:v3];
  [(PGPublicEventCriteria *)v4 setProhibitedCriteria:v8];

  [(PGPublicEventCriteria *)v4 setPromoteToHighConfidenceBasedOnCategory:0];
  v11[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_musicConcertsCriteriaArray
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] musicConcerts];
  v4 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v5 = [v4 objectForKeyedSubscript:v3];

  v6 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v7 = [v6 objectForKeyedSubscript:v3];

  v8 = objc_alloc_init(PGPublicEventCriteria);
  [(PGPublicEventCriteria *)v8 setEventCategory:v3];
  [(PGPublicEventCriteria *)v8 setMinimumTimeAttendance:2700.0];
  [(PGPublicEventCriteria *)v8 setMaximumDistance:100.0];
  [(PGPublicEventCriteria *)v8 setAllowsExpandingTimeAttendance:1];
  [(PGPublicEventCriteria *)v8 setHighConfidenceCriteria:v5];
  [(PGPublicEventCriteria *)v8 setProhibitedCriteria:v7];
  [(PGPublicEventCriteria *)v8 setPromoteToHighConfidenceBasedOnCategory:0];
  v9 = [(PGPublicEventCriteriaFactory *)self disambiguationCriteriaByEventCategory];
  v10 = [v9 objectForKeyedSubscript:v3];

  if ([v10 count])
  {
    v11 = objc_alloc_init(PGPublicEventCriteria);
    [(PGPublicEventCriteria *)v11 setEventCategory:v3];
    [(PGPublicEventCriteria *)v11 setMinimumTimeAttendance:1200.0];
    [(PGPublicEventCriteria *)v11 setMaximumDistance:250.0];
    [(PGPublicEventCriteria *)v11 setAllowsExpandingTimeAttendance:1];
    [(PGPublicEventCriteria *)v11 setDisambiguationCriteria:v10];
    [(PGPublicEventCriteria *)v11 setHighConfidenceCriteria:v5];
    [(PGPublicEventCriteria *)v11 setProhibitedCriteria:v7];
    [(PGPublicEventCriteria *)v11 setPromoteToHighConfidenceBasedOnCategory:0];
    v12 = objc_alloc_init(PGPublicEventCriteria);
    [(PGPublicEventCriteria *)v12 setEventCategory:v3];
    [(PGPublicEventCriteria *)v12 setMinimumTimeAttendance:1200.0];
    [(PGPublicEventCriteria *)v12 setMaximumDistance:750.0];
    [(PGPublicEventCriteria *)v12 setAllowsExpandingTimeAttendance:1];
    [(PGPublicEventCriteria *)v12 setDisambiguationCriteria:v10];
    [(PGPublicEventCriteria *)v12 setHighConfidenceCriteria:v5];
    [(PGPublicEventCriteria *)v12 setProhibitedCriteria:v7];
    [(PGPublicEventCriteria *)v12 setMinimumAttendance:10000];
    [(PGPublicEventCriteria *)v12 setPromoteToHighConfidenceBasedOnCategory:0];
    v15[0] = v8;
    v15[1] = v11;
    v15[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  }
  else
  {
    v16[0] = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }

  return v13;
}

- (id)_sportsCriteriaArray
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F76D68] sports];
  v4 = [(PGPublicEventCriteriaFactory *)self disambiguationCriteriaByEventCategory];
  v5 = [v4 objectForKeyedSubscript:v3];

  v6 = [(PGPublicEventCriteriaFactory *)self highConfidenceCriteriaByEventCategory];
  v7 = [v6 objectForKeyedSubscript:v3];

  v8 = [(PGPublicEventCriteriaFactory *)self prohibitedCriteriaByEventCategory];
  v9 = [v8 objectForKeyedSubscript:v3];

  uint64_t v10 = [v5 count];
  if (v10)
  {
    unint64_t v11 = v10;
    if (v10 != 2)
    {
      v12 = +[PGLogging sharedLogging];
      v13 = [v12 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = 2;
        _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Number of sports disambiguation criteria must be %lu", buf, 0xCu);
      }
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
    v15 = objc_alloc_init(PGPublicEventCriteria);
    [(PGPublicEventCriteria *)v15 setEventCategory:v3];
    [(PGPublicEventCriteria *)v15 setMinimumTimeAttendance:1200.0];
    [(PGPublicEventCriteria *)v15 setMaximumDistance:500.0];
    [(PGPublicEventCriteria *)v15 setAllowsExpandingTimeAttendance:1];
    v16 = [v5 objectAtIndexedSubscript:0];
    v23 = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [(PGPublicEventCriteria *)v15 setDisambiguationCriteria:v17];

    [(PGPublicEventCriteria *)v15 setHighConfidenceCriteria:v7];
    [(PGPublicEventCriteria *)v15 setProhibitedCriteria:v9];
    [(PGPublicEventCriteria *)v15 setPromoteToHighConfidenceBasedOnCategory:1];
    [v14 addObject:v15];
    if (v11 >= 2)
    {
      v18 = objc_alloc_init(PGPublicEventCriteria);
      [(PGPublicEventCriteria *)v18 setEventCategory:v3];
      [(PGPublicEventCriteria *)v18 setMinimumTimeAttendance:300.0];
      [(PGPublicEventCriteria *)v18 setMaximumDistance:750.0];
      [(PGPublicEventCriteria *)v18 setAllowsExpandingTimeAttendance:1];
      v19 = [v5 objectAtIndexedSubscript:1];
      v22 = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [(PGPublicEventCriteria *)v18 setDisambiguationCriteria:v20];

      [(PGPublicEventCriteria *)v18 setHighConfidenceCriteria:v7];
      [(PGPublicEventCriteria *)v18 setProhibitedCriteria:v9];
      [(PGPublicEventCriteria *)v18 setPromoteToHighConfidenceBasedOnCategory:1];
      [v14 addObject:v18];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (id)_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:(id)a3 inferenceType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:v7 inferenceType:a4 graph:self->_graph sceneTaxonomy:self->_sceneTaxonomy];

  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__PGPublicEventCriteriaFactory__meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories_inferenceType___block_invoke;
  void v15[3] = &unk_1E68EB3C8;
  id v16 = v6;
  id v10 = v9;
  id v17 = v10;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  v12 = v17;
  id v13 = v10;

  return v13;
}

void __115__PGPublicEventCriteriaFactory__meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories_inferenceType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSDictionary)prohibitedCriteriaByEventCategory
{
  v51[5] = *MEMORY[0x1E4F143B8];
  prohibitedCriteriaByEventCategory = self->_prohibitedCriteriaByEventCategory;
  if (!prohibitedCriteriaByEventCategory)
  {
    v50[0] = @"Dinner";
    v44 = self;
    v43 = [MEMORY[0x1E4F76D68] theater];
    v49[0] = v43;
    v42 = [MEMORY[0x1E4F76D68] musicConcerts];
    v49[1] = v42;
    v41 = [MEMORY[0x1E4F76D68] dance];
    v49[2] = v41;
    v40 = [MEMORY[0x1E4F76D68] sports];
    v49[3] = v40;
    v39 = [MEMORY[0x1E4F76D68] nightLife];
    v49[4] = v39;
    v38 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    v49[5] = v38;
    v37 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v49[6] = v37;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:7];
    v51[0] = v36;
    v50[1] = @"Lunch";
    v35 = [MEMORY[0x1E4F76D68] theater];
    v48[0] = v35;
    v34 = [MEMORY[0x1E4F76D68] musicConcerts];
    v48[1] = v34;
    v33 = [MEMORY[0x1E4F76D68] dance];
    v48[2] = v33;
    v32 = [MEMORY[0x1E4F76D68] sports];
    v48[3] = v32;
    v31 = [MEMORY[0x1E4F76D68] nightLife];
    v48[4] = v31;
    v30 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    v48[5] = v30;
    v29 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v48[6] = v29;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:7];
    v51[1] = v28;
    v50[2] = @"Breakfast";
    v27 = [MEMORY[0x1E4F76D68] theater];
    v47[0] = v27;
    uint64_t v26 = [MEMORY[0x1E4F76D68] musicConcerts];
    v47[1] = v26;
    uint64_t v25 = [MEMORY[0x1E4F76D68] dance];
    v47[2] = v25;
    v24 = [MEMORY[0x1E4F76D68] sports];
    v47[3] = v24;
    v23 = [MEMORY[0x1E4F76D68] nightLife];
    v47[4] = v23;
    v22 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    v47[5] = v22;
    v21 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v47[6] = v21;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:7];
    v51[2] = v20;
    v50[3] = @"Wedding";
    v18 = [MEMORY[0x1E4F76D68] theater];
    v46[0] = v18;
    id v17 = [MEMORY[0x1E4F76D68] musicConcerts];
    v46[1] = v17;
    v4 = [MEMORY[0x1E4F76D68] dance];
    v46[2] = v4;
    id v5 = [MEMORY[0x1E4F76D68] sports];
    v46[3] = v5;
    id v6 = [MEMORY[0x1E4F76D68] nightLife];
    v46[4] = v6;
    uint64_t v7 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    v46[5] = v7;
    uint64_t v8 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v46[6] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
    v51[3] = v9;
    v50[4] = @"Celebration";
    uint64_t v10 = [MEMORY[0x1E4F76D68] theater];
    v45[0] = v10;
    long long v11 = [MEMORY[0x1E4F76D68] sports];
    v45[1] = v11;
    long long v12 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v45[2] = v12;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    v51[4] = v13;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];

    uint64_t v14 = [(PGPublicEventCriteriaFactory *)v44 _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:v19 inferenceType:0];
    v15 = v44->_prohibitedCriteriaByEventCategory;
    v44->_prohibitedCriteriaByEventCategory = (NSDictionary *)v14;

    prohibitedCriteriaByEventCategory = v44->_prohibitedCriteriaByEventCategory;
  }
  return prohibitedCriteriaByEventCategory;
}

- (NSDictionary)disambiguationCriteriaByEventCategory
{
  v18[3] = *MEMORY[0x1E4F143B8];
  disambiguationCriteriaByEventCategory = self->_disambiguationCriteriaByEventCategory;
  if (!disambiguationCriteriaByEventCategory)
  {
    v17[0] = @"SportEvent";
    v4 = [MEMORY[0x1E4F76D68] sports];
    uint64_t v16 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v18[0] = v5;
    v17[1] = @"Concert";
    id v6 = [MEMORY[0x1E4F76D68] musicConcerts];
    v15 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v18[1] = v7;
    v17[2] = @"Museum";
    uint64_t v8 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    uint64_t v14 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v18[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

    long long v11 = [(PGPublicEventCriteriaFactory *)self _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:v10 inferenceType:1];
    long long v12 = self->_disambiguationCriteriaByEventCategory;
    self->_disambiguationCriteriaByEventCategory = v11;

    disambiguationCriteriaByEventCategory = self->_disambiguationCriteriaByEventCategory;
  }
  return disambiguationCriteriaByEventCategory;
}

- (NSDictionary)highConfidenceCriteriaByEventCategory
{
  v28[6] = *MEMORY[0x1E4F143B8];
  highConfidenceCriteriaByEventCategory = self->_highConfidenceCriteriaByEventCategory;
  if (!highConfidenceCriteriaByEventCategory)
  {
    v27[0] = @"Performance";
    v20 = [MEMORY[0x1E4F76D68] theater];
    v26[0] = v20;
    v19 = [MEMORY[0x1E4F76D68] dance];
    v26[1] = v19;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v28[0] = v18;
    v27[1] = @"Concert";
    id v17 = [MEMORY[0x1E4F76D68] musicConcerts];
    uint64_t v25 = v17;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v28[1] = v16;
    v27[2] = @"Festival";
    v4 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    v24 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v28[2] = v5;
    v27[3] = @"SportEvent";
    id v6 = [MEMORY[0x1E4F76D68] sports];
    v23 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v28[3] = v7;
    v27[4] = @"NightOut";
    uint64_t v8 = [MEMORY[0x1E4F76D68] nightLife];
    v22 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v28[4] = v9;
    v27[5] = @"Museum";
    uint64_t v10 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    v21 = v10;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v28[5] = v11;
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];

    long long v13 = [(PGPublicEventCriteriaFactory *)self _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:v12 inferenceType:0];
    uint64_t v14 = self->_highConfidenceCriteriaByEventCategory;
    self->_highConfidenceCriteriaByEventCategory = v13;

    highConfidenceCriteriaByEventCategory = self->_highConfidenceCriteriaByEventCategory;
  }
  return highConfidenceCriteriaByEventCategory;
}

- (id)_publicEventCriteriaByCategory
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PGPublicEventCriteriaFactory *)self _sportsCriteriaArray];
  id v5 = [MEMORY[0x1E4F76D68] sports];
  [v3 setObject:v4 forKeyedSubscript:v5];

  id v6 = [(PGPublicEventCriteriaFactory *)self _musicConcertsCriteriaArray];
  uint64_t v7 = [MEMORY[0x1E4F76D68] musicConcerts];
  [v3 setObject:v6 forKeyedSubscript:v7];

  uint64_t v8 = [(PGPublicEventCriteriaFactory *)self _nightLifeCriteriaArray];
  uint64_t v9 = [MEMORY[0x1E4F76D68] nightLife];
  [v3 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = [(PGPublicEventCriteriaFactory *)self _festivalsAndFairsCriteriaArray];
  long long v11 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  [v3 setObject:v10 forKeyedSubscript:v11];

  long long v12 = [(PGPublicEventCriteriaFactory *)self _theaterCriteriaArray];
  long long v13 = [MEMORY[0x1E4F76D68] theater];
  [v3 setObject:v12 forKeyedSubscript:v13];

  uint64_t v14 = [(PGPublicEventCriteriaFactory *)self _danceCriteriaArray];
  v15 = [MEMORY[0x1E4F76D68] dance];
  [v3 setObject:v14 forKeyedSubscript:v15];

  uint64_t v16 = [(PGPublicEventCriteriaFactory *)self _artsAndMuseumsCriteriaArray];
  id v17 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  [v3 setObject:v16 forKeyedSubscript:v17];

  v18 = [(PGPublicEventCriteriaFactory *)self _appleEventsCriteriaArray];
  v19 = [MEMORY[0x1E4F76D68] appleEvents];
  [v3 setObject:v18 forKeyedSubscript:v19];

  return v3;
}

- (PGPublicEventCriteriaFactory)initWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPublicEventCriteriaFactory;
  uint64_t v9 = [(PGPublicEventCriteriaFactory *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_sceneTaxonomy, a4);
  }

  return v10;
}

+ (id)publicEventCriteriaByCategoryForGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PGPublicEventCriteriaFactory alloc] initWithGraph:v6 sceneTaxonomy:v5];

  id v8 = [(PGPublicEventCriteriaFactory *)v7 _publicEventCriteriaByCategory];

  return v8;
}

@end