@interface PGHighlightStatisticsEstimator
- (BOOL)_isUtilityAsset:(id)a3;
- (PGHighlightStatisticsEstimator)initWithWorkingContext:(id)a3;
- (id)_collectDetailsForAggregations:(id)a3 inGraph:(id)a4 curationContext:(id)a5;
- (id)_collectDetailsForTripsAndWeekends:(id)a3 inGraph:(id)a4 curationContext:(id)a5;
- (id)_createHighlightEstimatesDictionaryWithCurationContext:(id)a3;
- (id)_highlightEstimatesDescriptionWithData:(id)a3;
- (id)_stringDescriptionForHomeWorkAggregations:(id)a3;
- (id)_stringDescriptionForMomentsDetails:(id)a3;
- (id)_stringDescriptionForTripWeekendDetails:(id)a3;
- (id)highlightEstimatesDescriptionWithCurationContext:(id)a3;
- (id)highlightEstimatesDictionaryWithCurationContext:(id)a3;
- (unint64_t)_numberOfUtilityAssetsForAssetCollection:(id)a3;
@end

@implementation PGHighlightStatisticsEstimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightEstimatesDictionary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (id)_stringDescriptionForMomentsDetails:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\tmomentName\tassets\tcurated assets\tutility assets\tinteresting\tmeanings"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"name"];
        v10 = [v8 objectForKeyedSubscript:@"assetCount"];
        uint64_t v11 = [v10 unsignedIntegerValue];

        v12 = [v8 objectForKeyedSubscript:@"curatedAssetCount"];
        uint64_t v13 = [v12 unsignedIntegerValue];

        v14 = [v8 objectForKeyedSubscript:@"utilityAssetCount"];
        uint64_t v15 = [v14 unsignedIntegerValue];

        v16 = [v8 objectForKeyedSubscript:@"isInteresting"];
        int v17 = [v16 BOOLValue];
        v18 = @"NO";
        if (v17) {
          v18 = @"YES";
        }
        v19 = v18;

        v20 = [v8 objectForKeyedSubscript:@"meanings"];
        v21 = [v20 componentsJoinedByString:@","];

        [v24 appendFormat:@"\n\t%@\t%lu\t%lu\t%lu\t%@\t%@", v9, v11, v13, v15, v19, v21];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  return v24;
}

- (id)_stringDescriptionForHomeWorkAggregations:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v27 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\t  aggregation identifier\t\t\tassets\tcurated assets\tutility assets\tmoments\tassets per moment"];
  unint64_t v25 = [v3 count];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v29;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"name"];
        v12 = [v10 objectForKeyedSubscript:@"assetCount"];
        unint64_t v13 = [v12 unsignedIntegerValue];

        v14 = [v10 objectForKeyedSubscript:@"curatedAssetCount"];
        uint64_t v15 = [v14 unsignedIntegerValue];

        v16 = [v10 objectForKeyedSubscript:@"aggregationAvgAssetCountPerMoment"];
        [v16 doubleValue];
        uint64_t v18 = v17;

        v19 = [v10 objectForKeyedSubscript:@"momentCount"];
        uint64_t v20 = [v19 unsignedIntegerValue];

        v21 = [v10 objectForKeyedSubscript:@"utilityAssetCount"];
        uint64_t v22 = [v21 unsignedIntegerValue];

        v6 += v20;
        double v8 = v8 + (double)v13;
        [v27 appendFormat:@"\n\t- %@\t%lu\t%lu\t%lu\t%lu\t%.1f", v11, v13, v15, v22, v20, v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    double v8 = 0.0;
  }

  v23 = [NSString stringWithFormat:@"\n- number of aggregations: %lu\n- number of moments: %lu\n- avg number of assets per aggregation: %f\n\nDetails:\n%@", v25, v6, v8 / (double)v25, v27];

  return v23;
}

- (id)_stringDescriptionForTripWeekendDetails:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\tname\tassets\tcurated assets\tutility assets\tmoments"];
  unint64_t v22 = [v3 count];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"name"];
        v12 = [v10 objectForKeyedSubscript:@"assetCount"];
        unint64_t v13 = [v12 unsignedIntegerValue];

        v14 = [v10 objectForKeyedSubscript:@"curatedAssetCount"];
        uint64_t v15 = [v14 unsignedIntegerValue];

        v16 = [v10 objectForKeyedSubscript:@"utilityAssetCount"];
        uint64_t v17 = [v16 unsignedIntegerValue];

        uint64_t v18 = [v10 objectForKeyedSubscript:@"momentCount"];
        uint64_t v19 = [v18 unsignedIntegerValue];

        [v4 appendFormat:@"\n\t%@\t%lu\t%lu\t%lu\t%lu", v11, v13, v15, v17, v19];
        double v8 = v8 + (double)v13;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  uint64_t v20 = [MEMORY[0x1E4F28E78] stringWithFormat:@"(count %lu, avg assets per trip %f)\n%@", v22, v8 / (double)v22, v4];

  return v20;
}

- (id)_highlightEstimatesDescriptionWithData:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"generalInfo"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"assetCount"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  double v8 = [v5 objectForKeyedSubscript:@"utilityAssetCount"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v5 objectForKeyedSubscript:@"momentCount"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [v5 objectForKeyedSubscript:@"highlightCount"];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = [v5 objectForKeyedSubscript:@"avgAssetCountPerMoment"];
  [v14 doubleValue];
  uint64_t v16 = v15;

  v67 = v5;
  uint64_t v17 = [v5 objectForKeyedSubscript:@"avgCuratedAssetCountPerMoment"];
  [v17 doubleValue];
  uint64_t v19 = v18;

  objc_msgSend(v4, "appendFormat:", @"\nnumber of assets: %lu", v7);
  objc_msgSend(v4, "appendFormat:", @"\nnumber of utility assets: %lu", v9);
  objc_msgSend(v4, "appendFormat:", @"\nnumber of moments: %lu", v11);
  objc_msgSend(v4, "appendFormat:", @"\nnumber of highlights: %lu", v13);
  objc_msgSend(v4, "appendFormat:", @"\navg assets per moment: %f", v16);
  v69 = v4;
  objc_msgSend(v4, "appendFormat:", @"\navg curated assets per moment: %f", v19);
  uint64_t v20 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\nmoments count per year:"];
  v21 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\navg assets per moment per year:"];
  unint64_t v22 = [v3 objectForKeyedSubscript:@"momentsByYear"];
  v68 = v3;
  v72 = [v3 objectForKeyedSubscript:@"avgAssetsPerMomentByYear"];
  v73 = v22;
  v23 = [v22 allKeys];
  long long v24 = [v23 sortedArrayUsingSelector:sel_compare_];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v65 = v24;
  id obj = [v24 reverseObjectEnumerator];
  uint64_t v25 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v75 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        long long v30 = [v73 objectForKeyedSubscript:v29];
        uint64_t v31 = [v30 unsignedIntegerValue];

        [v20 appendFormat:@"\n %@: %lu", v29, v31];
        v32 = [v72 objectForKeyedSubscript:v29];
        [v32 doubleValue];
        uint64_t v34 = v33;

        [v21 appendFormat:@"\n %@: %f", v29, v34];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v26);
  }

  v64 = v20;
  [v69 appendString:v20];
  v60 = v21;
  [v69 appendString:v21];
  id obja = [v68 objectForKeyedSubscript:@"trips"];
  v35 = NSString;
  v36 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForTripWeekendDetails:obja];
  v62 = [v35 stringWithFormat:@"\n\n################################\n\nTrip Statistics: %@", v36];

  v63 = [v68 objectForKeyedSubscript:@"weekends"];
  v37 = NSString;
  v38 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForTripWeekendDetails:v63];
  v61 = [v37 stringWithFormat:@"\n\n################################\n\nWeekend Statistics: %@", v38];

  [v69 appendString:v62];
  [v69 appendString:v61];
  v59 = [v68 objectForKeyedSubscript:@"homeAggregations"];
  v39 = NSString;
  v40 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForHomeWorkAggregations:v59];
  v56 = [v39 stringWithFormat:@"\n\n################################\n\nHome Aggregation Statistics:%@", v40];

  v58 = [v68 objectForKeyedSubscript:@"homeSupersetAggregations"];
  v41 = NSString;
  v42 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForHomeWorkAggregations:v58];
  v43 = [v41 stringWithFormat:@"\n\n################################\n\nHome Superset Aggregation Statistics:%@", v42];

  v57 = [v68 objectForKeyedSubscript:@"workAggregations"];
  v44 = NSString;
  v45 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForHomeWorkAggregations:v57];
  v46 = [v44 stringWithFormat:@"\n\n################################\n\nWork Aggregation Statistics:%@", v45];

  [v69 appendString:v56];
  [v69 appendString:v46];
  [v69 appendString:v43];
  v47 = [v68 objectForKeyedSubscript:@"singleMoments"];
  v48 = NSString;
  v49 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForMomentsDetails:v47];
  v50 = [v48 stringWithFormat:@"Moments that are not in Trips/Weekends/Aggregations: %@", v49];

  [v69 appendFormat:@"\n\n################################\n\n%@", v50];
  v51 = [v68 objectForKeyedSubscript:@"moments"];
  v52 = NSString;
  v53 = [(PGHighlightStatisticsEstimator *)self _stringDescriptionForMomentsDetails:v51];
  v54 = [v52 stringWithFormat:@"Moment Statistics: %@", v53];

  [v69 appendFormat:@"\n\n################################\n\n%@", v54];
  return v69;
}

- (id)_collectDetailsForAggregations:(id)a3 inGraph:(id)a4 curationContext:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v58 = a4;
  id v56 = a5;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  v67 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v59 = v8;
  uint64_t v9 = [v8 allKeys];
  v10 = [v9 sortedArrayUsingSelector:sel_localizedCompare_];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v10;
  uint64_t v60 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v60)
  {
    uint64_t v55 = *(void *)v86;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v86 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v85 + 1) + 8 * v11);
        uint64_t v13 = MEMORY[0x1D25FED50]();
        v14 = [v59 objectForKeyedSubscript:v12];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          unint64_t v18 = 0;
          uint64_t v19 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v82 != v19) {
                objc_enumerationMutation(v15);
              }
              v18 += [*(id *)(*((void *)&v81 + 1) + 8 * i) numberOfAssets];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }
          while (v17);
        }
        else
        {
          unint64_t v18 = 0;
        }

        [v15 count];
        double v21 = (double)v18;
        double v22 = (double)(unint64_t)[v15 count];
        v23 = [v58 momentsResultForMomentNodes:v15 inPhotoLibrary:v67 sortChronologically:0];
        v72 = [MEMORY[0x1E4F1CA48] array];
        v71 = [v67 librarySpecificFetchOptions];
        [v71 setIncludeGuestAssets:1];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v68 = v23;
        uint64_t v24 = [v68 countByEnumeratingWithState:&v77 objects:v93 count:16];
        context = (void *)v13;
        uint64_t v66 = v11;
        uint64_t v63 = v12;
        v64 = v15;
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = 0;
          uint64_t v69 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v78 != v69) {
                objc_enumerationMutation(v68);
              }
              uint64_t v28 = *(void *)(*((void *)&v77 + 1) + 8 * j);
              uint64_t v29 = (void *)MEMORY[0x1D25FED50]();
              long long v30 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v28 options:v71];
              uint64_t v31 = [v30 fetchedObjects];
              [v72 addObjectsFromArray:v31];

              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v32 = v30;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v73 objects:v92 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v74;
                do
                {
                  for (uint64_t k = 0; k != v34; ++k)
                  {
                    if (*(void *)v74 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    v26 += [(PGHighlightStatisticsEstimator *)self _isUtilityAsset:*(void *)(*((void *)&v73 + 1) + 8 * k)];
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v73 objects:v92 count:16];
                }
                while (v34);
              }
            }
            uint64_t v25 = [v68 countByEnumeratingWithState:&v77 objects:v93 count:16];
          }
          while (v25);
        }
        else
        {
          uint64_t v26 = 0;
        }

        v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        v91 = v37;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
        [v72 sortUsingDescriptors:v38];

        v70 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v72 title:0 identifier:0 photoLibrary:v67];
        v62 = [[PGCurationOptions alloc] initWithDuration:2];
        v39 = [(PGManagerWorkingContext *)self->_workingContext curationManager];
        v40 = [v39 curatedAssetsForAssetCollection:v70 options:v62 curationContext:v56 progressBlock:0];
        uint64_t v61 = [v40 count];

        v41 = NSString;
        v42 = [v64 firstObject];
        v43 = [v42 name];
        v44 = [v64 lastObject];
        v45 = [v44 name];
        v46 = [v41 stringWithFormat:@"%@ (%@ - %@)", v63, v43, v45];

        v90[0] = v46;
        v89[0] = @"name";
        v89[1] = @"assetCount";
        v47 = [NSNumber numberWithUnsignedInteger:v18];
        v90[1] = v47;
        v89[2] = @"curatedAssetCount";
        v48 = [NSNumber numberWithUnsignedInteger:v61];
        v90[2] = v48;
        v89[3] = @"utilityAssetCount";
        v49 = [NSNumber numberWithUnsignedInteger:v26];
        v90[3] = v49;
        v89[4] = @"aggregationAvgAssetCountPerMoment";
        v50 = [NSNumber numberWithDouble:v21 / v22];
        v90[4] = v50;
        v89[5] = @"momentCount";
        v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
        v90[5] = v51;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:6];

        [v57 addObject:v52];
        uint64_t v11 = v66 + 1;
      }
      while (v66 + 1 != v60);
      uint64_t v60 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
    }
    while (v60);
  }

  return v57;
}

- (id)_collectDetailsForTripsAndWeekends:(id)a3 inGraph:(id)a4 curationContext:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  v46 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  v10 = [PGTitleGenerationContext alloc];
  uint64_t v11 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  v49 = v9;
  v45 = [(PGTitleGenerationContext *)v10 initWithGraph:v9 serviceManager:v11];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v8;
  uint64_t v50 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v50)
  {
    uint64_t v44 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v14 = MEMORY[0x1D25FED50]();
        id v15 = [[PGHighlightTitleGenerator alloc] initWithCollection:v13 curatedAssetCollection:0 keyAsset:0 createVerboseTitle:0 titleGenerationContext:v45];
        uint64_t v16 = [(PGHighlightTitleGenerator *)v15 titleTuple];
        uint64_t v17 = [v16 title];
        unint64_t v18 = [v17 stringValue];
        uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

        id v57 = v16;
        uint64_t v20 = [v16 subtitle];
        uint64_t v21 = [v20 stringValue];

        uint64_t v55 = (void *)v21;
        id v56 = (void *)v19;
        v54 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\"%@ – %@\"", v19, v21];
        double v22 = [v13 eventCollection];
        v23 = [v22 eventMomentNodes];
        uint64_t v51 = [v23 numberOfAssets];

        uint64_t v24 = [v13 fetchAssetCollectionInPhotoLibrary:v46];
        uint64_t v25 = +[PGCurationOptions defaultOptions];
        uint64_t v26 = [(PGManagerWorkingContext *)self->_workingContext curationManager];
        v53 = (void *)v25;
        uint64_t v27 = [v26 curatedAssetsForAssetCollection:v24 options:v25 curationContext:v47 progressBlock:0];

        v52 = v27;
        uint64_t v28 = [v27 count];
        uint64_t v29 = [v13 eventEnrichmentMomentNodes];
        long long v30 = [v29 temporarySet];

        uint64_t v31 = [v49 momentsResultForMomentNodes:v30 inPhotoLibrary:v46 sortChronologically:0];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v70 count:16];
        id v58 = v15;
        context = (void *)v14;
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = 0;
          uint64_t v35 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v61 != v35) {
                objc_enumerationMutation(v31);
              }
              v34 += [(PGHighlightStatisticsEstimator *)self _numberOfUtilityAssetsForAssetCollection:*(void *)(*((void *)&v60 + 1) + 8 * j)];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v33);
        }
        else
        {
          uint64_t v34 = 0;
        }
        v69[0] = v54;
        v68[0] = @"name";
        v68[1] = @"assetCount";
        v37 = [NSNumber numberWithUnsignedInteger:v51];
        v69[1] = v37;
        v68[2] = @"curatedAssetCount";
        v38 = [NSNumber numberWithUnsignedInteger:v28];
        v69[2] = v38;
        v68[3] = @"utilityAssetCount";
        v39 = [NSNumber numberWithUnsignedInteger:v34];
        v69[3] = v39;
        v68[4] = @"momentCount";
        v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v69[4] = v40;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:5];

        [v48 addObject:v41];
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v50);
  }

  return v48;
}

- (unint64_t)_numberOfUtilityAssetsForAssetCollection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 photoLibrary];
  uint64_t v6 = [v5 librarySpecificFetchOptions];

  uint64_t v7 = +[PGCurationManager assetPropertySetsForCuration];
  [v6 addFetchPropertySets:v7];

  [v6 setIncludeGuestAssets:1];
  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 += [(PGHighlightStatisticsEstimator *)self _isUtilityAsset:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_isUtilityAsset:(id)a3
{
  [a3 clsContentScore];
  return v3 <= *MEMORY[0x1E4F8E750];
}

- (id)_createHighlightEstimatesDictionaryWithCurationContext:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__55893;
  uint64_t v20 = __Block_byref_object_dispose__55894;
  id v21 = 0;
  uint64_t v5 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  workingContext = self->_workingContext;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke;
  v11[3] = &unk_1E68EF5F0;
  id v7 = v5;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v4;
  id v14 = v8;
  long long v15 = &v16;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v62 = a2;
  uint64_t v72 = [v62 graph];
  v2 = [v72 momentNodesSortedByDate];
  long long v78 = [MEMORY[0x1E4F1CA60] dictionary];
  v92 = [MEMORY[0x1E4F1CA60] dictionary];
  id v68 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v66 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v64 = [MEMORY[0x1E4F1CA60] dictionary];
  v70 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v65 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = +[PGGraphNodeCollection nodesInGraph:v72];
  long long v77 = [v72 meNodeCollection];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v2;
  uint64_t v73 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
  if (!v73)
  {
    uint64_t v67 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    double v3 = 0.0;
    double v4 = 0.0;
    goto LABEL_33;
  }
  uint64_t v67 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v71 = *(void *)v110;
  double v3 = 0.0;
  double v4 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      if (*(void *)v110 != v71) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v109 + 1) + 8 * i);
      context = (void *)MEMORY[0x1D25FED50]();
      id v7 = [v72 momentForMomentNode:v6 inPhotoLibrary:*(void *)(a1 + 32)];
      if (v7)
      {
        unint64_t v93 = [v6 numberOfAssets];
        long long v87 = [[PGCurationOptions alloc] initWithDuration:2];
        id v8 = [*(id *)(*(void *)(a1 + 40) + 8) curationManager];
        id v9 = [v8 curatedAssetsForAssetCollection:v7 options:v87 curationContext:*(void *)(a1 + 48) progressBlock:0];
        unint64_t v83 = [v9 count];

        uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_2;
        v107[3] = &unk_1E68EDAB8;
        id v85 = v10;
        id v108 = v85;
        [v6 enumerateMeaningNodesUsingBlock:v107];
        unint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_localizedCompare_];
        v120 = v11;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
        long long v81 = [v85 sortedArrayUsingDescriptors:v12];

        uint64_t v13 = [v6 isSmartInteresting];
        uint64_t v79 = [*(id *)(a1 + 40) _numberOfUtilityAssetsForAssetCollection:v7];
        v118[0] = @"name";
        id v14 = [v6 name];
        v119[0] = v14;
        v118[1] = @"assetCount";
        long long v15 = [NSNumber numberWithUnsignedInteger:v93];
        v119[1] = v15;
        v118[2] = @"curatedAssetCount";
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v83];
        v119[2] = v16;
        v118[3] = @"utilityAssetCount";
        long long v17 = [NSNumber numberWithUnsignedInteger:v79];
        v119[3] = v17;
        v118[4] = @"isInteresting";
        uint64_t v18 = [NSNumber numberWithBool:v13];
        v118[5] = @"meanings";
        v119[4] = v18;
        v119[5] = v81;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:6];

        [v70 addObject:v19];
        uint64_t v20 = [v6 localStartDate];
        id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F76C68], "yearFromDate:", v20));
        double v22 = [v78 objectForKeyedSubscript:v21];
        uint64_t v23 = [v22 unsignedIntegerValue];

        uint64_t v24 = [NSNumber numberWithUnsignedInteger:v23 + 1];
        [v78 setObject:v24 forKeyedSubscript:v21];

        uint64_t v25 = [v92 objectForKeyedSubscript:v21];
        uint64_t v26 = [v25 unsignedIntegerValue];

        uint64_t v27 = [NSNumber numberWithUnsignedInteger:v26 + v93];
        [v92 setObject:v27 forKeyedSubscript:v21];

        uint64_t v28 = [NSString stringWithFormat:@"%@-%lu", v21, objc_msgSend(MEMORY[0x1E4F76C68], "weekOfYearFromDate:", v20)];
        int v29 = [v6 happensPartiallyAtHomeOrWorkOfPersonNodes:v77];
        int v30 = [v6 happensPartiallyAtHomeOfPersonNodes:v77];
        uint64_t v103 = 0;
        v104 = &v103;
        uint64_t v105 = 0x2020000000;
        char v106 = 0;
        if ((v30 ^ 1 | v13))
        {
          if ((v29 ^ 1 | v13))
          {
            if (v13) {
              goto LABEL_26;
            }
            uint64_t v31 = [v6 addressNodes];
            if ([v31 count] == 1)
            {
              v99[0] = MEMORY[0x1E4F143A8];
              v99[1] = 3221225472;
              v99[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_3;
              v99[3] = &unk_1E68EC6F8;
              v99[4] = v6;
              id v100 = v64;
              id v101 = v28;
              v102 = &v103;
              [v63 enumerateIdentifiersAsCollectionsWithBlock:v99];
            }
            if (v29) {
              goto LABEL_28;
            }
LABEL_22:
            char v33 = *((unsigned char *)v104 + 24) ? v13 : 1;
            if (v33) {
              goto LABEL_26;
            }
            goto LABEL_28;
          }
          uint64_t v32 = [v66 objectForKeyedSubscript:v28];
          if (!v32)
          {
            uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
            [v66 setObject:v32 forKeyedSubscript:v28];
          }
        }
        else
        {
          uint64_t v32 = [v68 objectForKeyedSubscript:v28];
          if (!v32)
          {
            uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
            [v68 setObject:v32 forKeyedSubscript:v28];
          }
        }
        [v32 addObject:v6];

        if ((v29 & 1) == 0) {
          goto LABEL_22;
        }
        if (v13)
        {
LABEL_26:
          if (([v6 isPartOfTrip] & 1) == 0)
          {
            [v65 addObject:v19];
            ++v67;
          }
        }
LABEL_28:
        _Block_object_dispose(&v103, 8);

        v75 += v93;
        v76 += v79;
        double v4 = v4 + (double)v93;
        double v3 = v3 + (double)v83;
      }
    }
    uint64_t v73 = [obj countByEnumeratingWithState:&v109 objects:v121 count:16];
  }
  while (v73);
LABEL_33:

  unint64_t v80 = [obj count];
  unint64_t v74 = [obj count];
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v92, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v35 = v78;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v95 objects:v117 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v96 != v37) {
          objc_enumerationMutation(v35);
        }
        uint64_t v39 = *(void *)(*((void *)&v95 + 1) + 8 * j);
        v40 = [v35 objectForKeyedSubscript:v39];
        unint64_t v41 = [v40 unsignedIntegerValue];

        v42 = [v92 objectForKeyedSubscript:v39];
        [v42 doubleValue];
        double v44 = v43;

        v45 = [NSNumber numberWithDouble:v44 / (double)v41];
        [v34 setObject:v45 forKeyedSubscript:v39];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v95 objects:v117 count:16];
    }
    while (v36);
  }

  v94 = [v72 longTripNodes];
  contexta = [v72 shortTripNodes];
  long long v88 = [*(id *)(a1 + 40) _collectDetailsForTripsAndWeekends:v94 inGraph:v72 curationContext:*(void *)(a1 + 48)];
  long long v86 = [*(id *)(a1 + 40) _collectDetailsForTripsAndWeekends:contexta inGraph:v72 curationContext:*(void *)(a1 + 48)];
  long long v84 = [*(id *)(a1 + 40) _collectDetailsForAggregations:v68 inGraph:v72 curationContext:*(void *)(a1 + 48)];
  long long v82 = [*(id *)(a1 + 40) _collectDetailsForAggregations:v66 inGraph:v72 curationContext:*(void *)(a1 + 48)];
  v46 = [*(id *)(a1 + 40) _collectDetailsForAggregations:v64 inGraph:v72 curationContext:*(void *)(a1 + 48)];
  uint64_t v47 = [v94 count];
  uint64_t v48 = [contexta count];
  uint64_t v49 = [v68 count];
  uint64_t v50 = [v64 count];
  uint64_t v51 = [v66 count];
  v115[0] = @"assetCount";
  v52 = [NSNumber numberWithUnsignedInteger:v75];
  v116[0] = v52;
  v115[1] = @"momentCount";
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  v116[1] = v53;
  v115[2] = @"highlightCount";
  v54 = [NSNumber numberWithUnsignedInteger:v47 + v67 + v48 + v49 + v50 + v51];
  v116[2] = v54;
  v115[3] = @"avgAssetCountPerMoment";
  uint64_t v55 = [NSNumber numberWithDouble:v4 / (double)v80];
  v116[3] = v55;
  v115[4] = @"avgCuratedAssetCountPerMoment";
  id v56 = [NSNumber numberWithDouble:v3 / (double)v74];
  v116[4] = v56;
  v115[5] = @"utilityAssetCount";
  id v57 = [NSNumber numberWithUnsignedInteger:v76];
  v116[5] = v57;
  id v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:6];

  v113[0] = @"generalInfo";
  v113[1] = @"moments";
  v114[0] = v58;
  v114[1] = v70;
  v113[2] = @"singleMoments";
  v113[3] = @"trips";
  v114[2] = v65;
  v114[3] = v88;
  v113[4] = @"weekends";
  v113[5] = @"homeAggregations";
  v114[4] = v86;
  v114[5] = v84;
  v113[6] = @"workAggregations";
  v113[7] = @"homeSupersetAggregations";
  v114[6] = v82;
  v114[7] = v46;
  v113[8] = @"momentsByYear";
  v113[9] = @"avgAssetsPerMomentByYear";
  v114[8] = v35;
  v114[9] = v34;
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:10];
  uint64_t v60 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v61 = *(void **)(v60 + 40);
  *(void *)(v60 + 40) = v59;
}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 label];
  [v2 addObject:v3];
}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 momentNodes];
  int v7 = [v6 containsNode:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:*(void *)(a1 + 48)];
      id v8 = v9;
    }
    id v10 = v8;
    [v8 addObject:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)highlightEstimatesDescriptionWithCurationContext:(id)a3
{
  double v4 = [(PGHighlightStatisticsEstimator *)self highlightEstimatesDictionaryWithCurationContext:a3];
  uint64_t v5 = [(PGHighlightStatisticsEstimator *)self _highlightEstimatesDescriptionWithData:v4];

  return v5;
}

- (id)highlightEstimatesDictionaryWithCurationContext:(id)a3
{
  highlightEstimatesDictionary = self->_highlightEstimatesDictionary;
  if (!highlightEstimatesDictionary)
  {
    uint64_t v5 = [(PGHighlightStatisticsEstimator *)self _createHighlightEstimatesDictionaryWithCurationContext:a3];
    uint64_t v6 = self->_highlightEstimatesDictionary;
    self->_highlightEstimatesDictionary = v5;

    highlightEstimatesDictionary = self->_highlightEstimatesDictionary;
  }
  return highlightEstimatesDictionary;
}

- (PGHighlightStatisticsEstimator)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightStatisticsEstimator;
  uint64_t v6 = [(PGHighlightStatisticsEstimator *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workingContext, a3);
  }

  return v7;
}

@end