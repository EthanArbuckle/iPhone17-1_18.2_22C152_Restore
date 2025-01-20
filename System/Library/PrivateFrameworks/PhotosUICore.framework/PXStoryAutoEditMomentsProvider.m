@interface PXStoryAutoEditMomentsProvider
- (NSArray)moments;
- (NSError)error;
- (PFStoryAutoEditConfiguration)configuration;
- (PFStoryClusteringProperties)clusteringProperties;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryAutoEditMomentsProvider)initWithConfiguration:(id)a3 assetCollection:(id)a4 displayAssets:(id)a5;
- (PXStoryAutoEditMomentsStatistics)statistics;
- (id)_diagnosticSwiftCodeForMomentsUnitTest;
- (id)_faceprintDatasByAssetUUIDWithAssets:(id)a3;
- (id)_faceprintsByAssetUUIDWithAssets:(id)a3;
- (id)_faceprintsByAssetUUIDWithAssets:(id)a3 faceprintDatas:(id)a4;
- (id)_locationsByAssetUUIDWithAssets:(id)a3;
- (id)momentForDisplayAssetIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)_computeClustering;
- (void)enumerateMomentsUsingBlock:(id)a3;
- (void)setAssetCollection:(id)a3;
- (void)setClusteringProperties:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisplayAssets:(id)a3;
@end

@implementation PXStoryAutoEditMomentsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clusteringProperties, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

- (void)setDisplayAssets:(id)a3
{
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (void)setAssetCollection:(id)a3
{
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setConfiguration:(id)a3
{
}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (NSError)error
{
  return self->_error;
}

- (void)setClusteringProperties:(id)a3
{
}

- (PFStoryClusteringProperties)clusteringProperties
{
  return self->_clusteringProperties;
}

- (id)_diagnosticSwiftCodeForMomentsUnitTest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v74 = [(PXStoryAutoEditMomentsProvider *)self count];
  uint64_t v4 = [(PXDisplayAssetFetchResult *)self->_displayAssets count];
  v82 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  v81 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  v83 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  uint64_t v73 = v4;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  v77 = [(PXStoryAutoEditMomentsProvider *)self _faceprintDatasByAssetUUIDWithAssets:self->_displayAssets];
  v76 = [(PXStoryAutoEditMomentsProvider *)self _locationsByAssetUUIDWithAssets:self->_displayAssets];
  v80 = v5;
  if ([(PXDisplayAssetFetchResult *)self->_displayAssets count])
  {
    unint64_t v6 = 0;
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    v75 = self;
    do
    {
      v8 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndex:v6];
      v9 = [v8 uuid];
      v10 = [v76 objectForKeyedSubscript:v9];

      v78 = v10;
      if (v10)
      {
        [v10 coordinate];
        double v12 = v11;
        v13 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v82 addObject:v13];

        v14 = [NSNumber numberWithDouble:v12];
        [v81 addObject:v14];
      }
      else
      {
        [v82 addObject:&unk_1F02DA280];
        [v81 addObject:&unk_1F02DA280];
      }
      v15 = [v8 creationDate];
      [v83 addObject:v15];
      v16 = [v8 uuid];
      uint64_t v17 = [v77 objectForKeyedSubscript:v16];
      v18 = (void *)v17;
      v19 = v7;
      if (v17) {
        v20 = (void *)v17;
      }
      else {
        v20 = v7;
      }
      id v21 = v20;

      v22 = [MEMORY[0x1E4F1CA48] array];
      if ([v21 count])
      {
        unint64_t v23 = 0;
        do
        {
          v24 = [v21 objectAtIndexedSubscript:v23];
          v25 = [v24 base64EncodedStringWithOptions:34];
          if (v25) {
            [v22 addObject:v25];
          }

          ++v23;
        }
        while (v23 < [v21 count]);
      }
      v7 = v19;
      if (v22) {
        v26 = v22;
      }
      else {
        v26 = v19;
      }
      v5 = v80;
      [v80 addObject:v26];

      ++v6;
      self = v75;
    }
    while (v6 < [(PXDisplayAssetFetchResult *)v75->_displayAssets count]);
  }
  v27 = [(PXStoryAutoEditMomentsProvider *)self statistics];
  [v3 appendFormat:@"    func testFromTTR() throws {\n"];
  [v3 appendFormat:@"        let dictionary: [AnyHashable : Any] = [\n"];
  [v3 appendFormat:@"            \"version\" : PFStoryAutoEditConfiguration.currentVersion,\n"];
  [v3 appendFormat:@"            \"memoryCategories\" : [\n"];
  v28 = [v27 memoryCategoryName];
  [v3 appendFormat:@"                \"%@\" : [\n", v28];

  [v3 appendFormat:@"                    \"clustering\" : [\n"];
  v29 = [v27 clusteringProperties];
  v30 = [v29 algorithm];
  [v3 appendFormat:@"                        \"algorithm\" : \"%@\",\n", v30];

  [v3 appendFormat:@"                        \"algorithmProperties\" : [\n"];
  v31 = [v27 clusteringProperties];
  v32 = [v31 algorithmProperties];
  uint64_t v33 = [v32 objectForKeyedSubscript:@"minimumNumberOfObjects"];
  v34 = (void *)v33;
  if (v33) {
    v35 = (void *)v33;
  }
  else {
    v35 = &unk_1F02D7618;
  }
  [v3 appendFormat:@"                            \"minimumNumberOfObjects\" : %@,\n", v35];

  v36 = [v27 clusteringProperties];
  v37 = [v36 algorithmProperties];
  uint64_t v38 = [v37 objectForKeyedSubscript:@"maximumDistance"];
  v39 = (void *)v38;
  if (v38) {
    v40 = (void *)v38;
  }
  else {
    v40 = &unk_1F02D7618;
  }
  [v3 appendFormat:@"                            \"maximumDistance\" : %@\n", v40];

  [v3 appendFormat:@"                        ],\n"];
  [v3 appendFormat:@"                        \"distanceWeights\" : [\n"];
  v41 = [v27 clusteringProperties];
  v42 = [v41 distanceWeights];
  uint64_t v43 = [v42 objectForKeyedSubscript:@"time"];
  v44 = (void *)v43;
  if (v43) {
    v45 = (void *)v43;
  }
  else {
    v45 = &unk_1F02D7630;
  }
  [v3 appendFormat:@"                            \"time\" : %@,\n", v45];

  v46 = [v27 clusteringProperties];
  v47 = [v46 distanceWeights];
  uint64_t v48 = [v47 objectForKeyedSubscript:@"location"];
  v49 = (void *)v48;
  if (v48) {
    v50 = (void *)v48;
  }
  else {
    v50 = &unk_1F02D7630;
  }
  [v3 appendFormat:@"                            \"location\" : %@,\n", v50];

  v79 = v27;
  v51 = [v27 clusteringProperties];
  v52 = [v51 distanceWeights];
  uint64_t v53 = [v52 objectForKeyedSubscript:@"face"];
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = &unk_1F02D7630;
  }
  [v3 appendFormat:@"                            \"face\" : %@,\n", v55];

  [v3 appendFormat:@"                        ]\n"];
  [v3 appendFormat:@"                    ]\n"];
  [v3 appendFormat:@"                ]\n"];
  [v3 appendFormat:@"            ]\n"];
  [v3 appendFormat:@"        ]\n"];
  [v3 appendFormat:@"        \n"];
  [v3 appendFormat:@"        let config = PFStoryAutoEditConfiguration(configurationDictionary: dictionary)\n"];
  [v3 appendFormat:@"        XCTAssertNotNil(config)\n"];
  [v3 appendFormat:@"        \n"];
  [v3 appendFormat:@"        let faceStrings : [[String]] = ["];
  if ([v5 count])
  {
    unint64_t v56 = 0;
    do
    {
      v57 = [v5 objectAtIndexedSubscript:v56];
      [v3 appendFormat:@"[\n            "];
      if ([v57 count])
      {
        unint64_t v58 = 0;
        do
        {
          [v3 appendString:@"\"\"\"\n            "];
          v59 = [v57 objectAtIndexedSubscript:v58];
          v60 = [v59 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n            "];

          [v3 appendString:v60];
          [v3 appendString:@"\n            \"\"\","];

          ++v58;
        }
        while (v58 < [v57 count]);
      }
      [v3 appendFormat:@"],"];

      ++v56;
      v5 = v80;
    }
    while (v56 < [v80 count]);
  }
  [v3 appendFormat:@"        ]\n"];
  [v3 appendFormat:@"        \n"];
  [v3 appendFormat:@"        let assets : [PXDisplayAsset] = [\n"];
  if (v73)
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      v62 = [v82 objectAtIndexedSubscript:i];
      [v62 doubleValue];
      CLLocationDegrees v64 = v63;
      v65 = [v81 objectAtIndexedSubscript:i];
      [v65 doubleValue];
      CLLocationCoordinate2D v67 = CLLocationCoordinate2DMake(v64, v66);

      v68 = [v83 objectAtIndex:i];
      [v68 timeIntervalSince1970];
      [v3 appendFormat:@"            PXSyntheticPHAsset(date: Date(timeIntervalSince1970:%f), location: CLLocationCoordinate2D(latitude: %f, longitude: %f), faceStrings: faceStrings[%lu]), ", v69, *(void *)&v67.latitude, *(void *)&v67.longitude, i];
      v70 = [v68 description];
      [v3 appendFormat:@"// %@ ", v70];

      if (!CLLocationCoordinate2DIsValid(v67)) {
        [v3 appendFormat:@"// Invalid location information"];
      }
      [v3 appendFormat:@"\n"];
    }
  }
  [v3 appendFormat:@"        ]\n"];
  [v3 appendFormat:@"        \n"];
  [v3 appendFormat:@"        let assetCollection = MockPHAssetCollection() { collection in\n"];
  [v3 appendFormat:@"            collection.testAssetCollectionType = .memory\n"];
  v71 = [v79 memoryCategoryName];
  [v3 appendFormat:@"            collection.testCategory = .%@\n", v71];

  [v3 appendFormat:@"        }\n"];
  [v3 appendFormat:@"        let displayAssets = PXDisplayAssetFetchResultFromArray(assets)\n"];
  [v3 appendFormat:@"        let provider = PXStoryAutoEditMomentsProvider(configuration: config!, assetCollection: assetCollection, displayAssets:displayAssets)\n"];
  [v3 appendFormat:@"        \n"];
  [v3 appendFormat:@"        let momentCount = provider.count\n"];
  [v3 appendFormat:@"        let stats = provider.statistics\n"];
  objc_msgSend(v3, "appendFormat:", @"        XCTAssert(momentCount == %ld)\n", v74);
  [v3 appendFormat:@"        XCTAssertLessThan(stats.clusteringDuration, 0.2)\n"];
  [v3 appendFormat:@"    }\n\n"];

  return v3;
}

- (id)momentForDisplayAssetIndex:(unint64_t)a3
{
  unint64_t v6 = [(PXStoryAutoEditMomentsProvider *)self moments];
  v7 = [v6 firstObject];
  if ([v7 firstGlobalIndex] > a3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAutoEditMomentsProvider.m", 591, @"Invalid asset index: %lu", a3);
  }
  if ([v7 lastGlobalIndex] >= a3)
  {
    id v12 = v7;
  }
  else
  {
    v8 = [v6 lastObject];
    if ([v8 lastGlobalIndex] < a3)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAutoEditMomentsProvider.m", 597, @"Invalid asset index: %lu", a3);
    }
    if ([v8 firstGlobalIndex] <= a3)
    {
      id v13 = v8;
    }
    else
    {
      unint64_t v9 = [v6 count] - 1;
      if (v9 >= 2)
      {
        unint64_t v10 = 0;
        while (1)
        {
          double v11 = [v6 objectAtIndexedSubscript:(v9 + v10) >> 1];
          if ([v11 firstGlobalIndex] <= a3)
          {
            if ([v11 lastGlobalIndex] >= a3)
            {

              unint64_t v10 = (v9 + v10) >> 1;
              goto LABEL_21;
            }
            unint64_t v10 = (v9 + v10) >> 1;
          }
          else
          {
            unint64_t v9 = (v9 + v10) >> 1;
          }

          if (v10 + 1 >= v9) {
            goto LABEL_18;
          }
        }
      }
      unint64_t v10 = 0;
LABEL_18:
      if (v10 != v9) {
        PXAssertGetLog();
      }
LABEL_21:
      id v13 = [v6 objectAtIndexedSubscript:v10];
    }
    id v12 = v13;
  }
  return v12;
}

- (PXStoryAutoEditMomentsStatistics)statistics
{
  return (PXStoryAutoEditMomentsStatistics *)self->_statistics;
}

- (unint64_t)count
{
  v2 = [(PXStoryAutoEditMomentsProvider *)self moments];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)enumerateMomentsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryAutoEditMomentsProvider *)self moments];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PXStoryAutoEditMomentsProvider_enumerateMomentsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DB7F90;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __61__PXStoryAutoEditMomentsProvider_enumerateMomentsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)moments
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_moments) {
    [(PXStoryAutoEditMomentsProvider *)v2 _computeClustering];
  }
  objc_sync_exit(v2);

  moments = v2->_moments;
  return moments;
}

- (void)_computeClustering
{
  v114[8] = *MEMORY[0x1E4F143B8];
  if ([(PXDisplayAssetFetchResult *)self->_displayAssets count] >= 1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    v5 = [(PXStoryAutoEditMomentsProvider *)self assetCollection];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 category];
      v7 = @"singleMoment";
      switch(v6)
      {
        case 1:
          break;
        case 2:
          v7 = @"personOverTime";
          break;
        case 3:
          v7 = @"person";
          break;
        case 4:
          v7 = @"earlyMomentsWithPerson";
          break;
        case 5:
          v7 = @"socialGroupOverTime";
          break;
        case 6:
          v7 = @"socialGroup";
          break;
        case 7:
          v7 = @"lastMonthAtHome";
          break;
        case 8:
          v7 = @"lastYearInReview";
          break;
        case 9:
          v7 = @"foodie";
          break;
        case 10:
          v7 = @"pet";
          break;
        case 11:
          v7 = @"baby";
          break;
        case 12:
          v7 = @"cityLocation";
          break;
        case 13:
          v7 = @"regionLocation";
          break;
        case 14:
          v7 = @"areaLocation";
          break;
        case 15:
          v7 = @"businessLocation";
          break;
        case 16:
        case 17:
          v7 = @"meaningfulEvent";
          break;
        case 18:
        case 19:
        case 31:
          v7 = @"trip";
          break;
        case 20:
        case 22:
        case 30:
          goto LABEL_6;
        case 21:
          v7 = @"season";
          break;
        case 23:
          goto LABEL_68;
        case 24:
          v7 = @"recentHighlights";
          break;
        case 25:
          v7 = @"childActivity";
          break;
        case 26:
          v7 = @"excitingMoments";
          break;
        case 27:
          v7 = @"trends";
          break;
        case 28:
          v7 = @"petOutdoor";
          break;
        case 29:
          v7 = @"childAndPerson";
          break;
        default:
          if (v6 == 202)
          {
LABEL_68:
            v7 = @"dayInHistory";
          }
          else
          {
            if (v6 != 216) {
              goto LABEL_6;
            }
            v7 = @"lastSeason";
          }
          break;
      }
    }
    else
    {
      uint64_t v6 = 0;
LABEL_6:
      v7 = @"default";
    }
    uint64_t v87 = v6;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
    unint64_t v9 = self->_log;
    unint64_t v10 = v9;
    unint64_t v90 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
    {
      uint64_t v11 = [(PXDisplayAssetFetchResult *)self->_displayAssets count];
      *(_DWORD *)buf = 134218242;
      uint64_t v101 = v11;
      __int16 v102 = 2114;
      uint64_t v103 = (uint64_t)v7;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryAutoEditMomentsClustering", "count: %ld, category: %{public}@", buf, 0x16u);
    }

    id v12 = [(PFStoryAutoEditConfiguration *)self->_configuration clusteringPropertiesForMemoryCategoryName:v7];
    id v13 = [(PXStoryAutoEditMomentsProvider *)self clusteringProperties];

    v94 = v5;
    v92 = v7;
    os_signpost_id_t spid = v8;
    if (v13)
    {
      uint64_t v14 = [(PXStoryAutoEditMomentsProvider *)self clusteringProperties];

      id v12 = (void *)v14;
    }
    v15 = self->_displayAssets;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](v15, "count"));
    if ([(PXDisplayAssetFetchResult *)v15 count] >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        v18 = [NSNumber numberWithInt:v17];
        [v16 addObject:v18];

        ++v17;
      }
      while ([(PXDisplayAssetFetchResult *)v15 count] > v17);
    }
    uint64_t v19 = [(PXStoryAutoEditMomentsProvider *)self _locationsByAssetUUIDWithAssets:v15];
    v93 = self;
    uint64_t v20 = [(PXStoryAutoEditMomentsProvider *)self _faceprintsByAssetUUIDWithAssets:v15];
    id v21 = [PXStoryMemoryMomentConcreteClusteringDistanceCalculator alloc];
    v22 = [v12 distanceWeights];
    v88 = (void *)v20;
    v89 = (void *)v19;
    v99 = [(PXStoryMemoryMomentConcreteClusteringDistanceCalculator *)v21 initWithWeights:v22 locationsByAssetUUID:v19 faceprintsByAssetUUID:v20];

    unint64_t v23 = [v12 algorithm];
    v114[0] = objc_opt_class();
    v114[1] = objc_opt_class();
    v114[2] = objc_opt_class();
    v114[3] = objc_opt_class();
    v114[4] = objc_opt_class();
    v114[5] = objc_opt_class();
    v114[6] = objc_opt_class();
    v114[7] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:8];
    id v25 = v23;
    id v26 = v24;
    v98 = v15;
    if ([v26 count])
    {
      v27 = v16;
      uint64_t v28 = 0;
      while (1)
      {
        v29 = (objc_class *)[v26 objectAtIndexedSubscript:v28];
        v30 = NSStringFromClass(v29);
        int v31 = [v25 isEqualToString:v30];

        if (v31) {
          break;
        }
        if ([v26 count] <= (unint64_t)++v28)
        {
          v32 = 0;
          goto LABEL_22;
        }
      }
      v32 = v29;
LABEL_22:
      v15 = v98;
      v16 = v27;
    }
    else
    {
      v32 = 0;
    }

    if ([(PXDisplayAssetFetchResult *)v15 count] > 1000)
    {
      v32 = (objc_class *)objc_opt_class();
      uint64_t v33 = PLStoryGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = [(PXDisplayAssetFetchResult *)v15 count];
        [v12 algorithm];
        v36 = v35 = v32;
        v37 = [v12 algorithm];
        *(_DWORD *)buf = 134218498;
        uint64_t v101 = v34;
        __int16 v102 = 2112;
        uint64_t v103 = (uint64_t)v36;
        __int16 v104 = 2112;
        unint64_t v105 = (unint64_t)v37;
        _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_INFO, "Moments clustering has %ld assets, using algorithm %@ instead of %@", buf, 0x20u);

        v32 = v35;
      }
    }
    v95 = v12;
    aClass = v32;
    if (v32)
    {
      uint64_t v38 = [(PXStoryMemoryMomentConcreteClusteringDistanceCalculator *)v99 densityClusteringDistanceBlockForAssets:v15];
      v39 = (void *)[[v32 alloc] initWithDistanceBlock:v38];
      v40 = [v12 algorithmProperties];
      [v39 setValuesForKeysWithDictionary:v40];

      v41 = [v39 performWithDataset:v16 progressBlock:&__block_literal_global_87159];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1C978] array];
    }
    v91 = v16;
    v96 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v41, "count"));
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](v15, "count"));
    if ([(PXDisplayAssetFetchResult *)v15 count] >= 1)
    {
      uint64_t v43 = 0;
      do
      {
        [v42 addObject:&unk_1F02D7600];
        ++v43;
      }
      while (v43 < [(PXDisplayAssetFetchResult *)v15 count]);
    }
    v97 = v41;
    if ([v41 count])
    {
      unint64_t v44 = 0;
      do
      {
        v45 = [v41 objectAtIndexedSubscript:v44];
        v46 = [v45 objects];

        if ([v46 count])
        {
          unint64_t v47 = 0;
          do
          {
            uint64_t v48 = [v46 objectAtIndexedSubscript:v47];
            uint64_t v49 = [v48 integerValue];

            v50 = [v42 objectAtIndexedSubscript:v49];
            char v51 = [v50 isEqual:&unk_1F02D7600];

            if ((v51 & 1) == 0)
            {
              v52 = PLStoryGetLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                uint64_t v53 = [v42 objectAtIndexedSubscript:v49];
                uint64_t v54 = [v53 integerValue];
                *(_DWORD *)buf = 134218496;
                uint64_t v101 = v49;
                __int16 v102 = 2048;
                uint64_t v103 = v54;
                __int16 v104 = 2048;
                unint64_t v105 = v44;
                _os_log_impl(&dword_1A9AE7000, v52, OS_LOG_TYPE_INFO, "Moments clustering reused asset %lu in multiple clusters, cluster %ld and %lu", buf, 0x20u);
              }
            }
            v55 = [NSNumber numberWithInteger:v44];
            [v42 setObject:v55 atIndexedSubscript:v49];

            ++v47;
          }
          while (v47 < [v46 count]);
        }

        ++v44;
        v41 = v97;
      }
      while (v44 < [v97 count]);
    }
    unint64_t v56 = 0;
    if ([v42 count])
    {
      unint64_t v57 = 0;
      unint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        unint64_t v59 = v57;
        v60 = [v42 objectAtIndexedSubscript:v57];
        uint64_t v61 = [v60 integerValue];

        unint64_t v62 = v59 + 1;
        do
        {
          unint64_t v57 = v62;
          if (v62 >= [v42 count]) {
            break;
          }
          double v63 = [v42 objectAtIndexedSubscript:v57];
          uint64_t v64 = [v63 integerValue];

          unint64_t v62 = v57 + 1;
        }
        while (v61 == v64);
        v65 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v59, v57 - v59);
        CLLocationDegrees v66 = v98;
        CLLocationCoordinate2D v67 = [[PXStoryMemoryMoment alloc] initWithDisplayAssets:v98 indexSet:v65 diagnosticDistanceCalculator:v99];
        unint64_t v68 = [(PXStoryMemoryMoment *)v67 count];
        if (v58 >= v68) {
          unint64_t v58 = v68;
        }
        unint64_t v69 = [(PXStoryMemoryMoment *)v67 count];
        if (v56 <= v69) {
          unint64_t v56 = v69;
        }
        [v96 addObject:v67];
      }
      while (v57 < [v42 count]);
    }
    else
    {
      unint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
      CLLocationDegrees v66 = v98;
    }
    double v70 = (double)[(PXDisplayAssetFetchResult *)v66 count];
    double v71 = v70 / (double)(unint64_t)[v96 count];
    v72 = PLStoryGetLog();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v73 = [v94 localizedTitle];
      unint64_t v74 = [MEMORY[0x1E4F39160] stringForCategory:v87];
      uint64_t v75 = [v96 count];
      *(_DWORD *)buf = 138413826;
      uint64_t v101 = (uint64_t)v73;
      __int16 v102 = 2112;
      uint64_t v103 = (uint64_t)v74;
      __int16 v104 = 2112;
      unint64_t v105 = (unint64_t)v92;
      __int16 v106 = 2048;
      uint64_t v107 = v75;
      __int16 v108 = 2048;
      double v109 = *(double *)&v58;
      __int16 v110 = 2048;
      unint64_t v111 = v56;
      __int16 v112 = 2048;
      double v113 = v71;
      _os_log_impl(&dword_1A9AE7000, v72, OS_LOG_TYPE_DEFAULT, "clustering collection '%@' with category '%@' (%@) has %ld moments (min: %ld, max: %ld, avg: %.2f)", buf, 0x48u);
    }
    uint64_t v76 = [v96 copy];
    moments = v93->_moments;
    v93->_moments = (NSArray *)v76;

    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setMinimumAssetCount:v58];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setMaximumAssetCount:v56];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setAverageAssetCount:v71];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setMemoryCategoryName:v92];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setClusteringDuration:v78 - v4];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setClusteringProperties:v95];
    [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics setClusteringDistanceCalculator:v99];
    v79 = v93->_log;
    v80 = v79;
    if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      v81 = NSStringFromClass(aClass);
      uint64_t v82 = [v96 count];
      *(_DWORD *)buf = 138544386;
      uint64_t v101 = (uint64_t)v81;
      __int16 v102 = 2048;
      uint64_t v103 = v82;
      __int16 v104 = 2048;
      unint64_t v105 = v58;
      __int16 v106 = 2048;
      uint64_t v107 = v56;
      __int16 v108 = 2048;
      double v109 = v71;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v80, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditMomentsClustering", "alg: %{public}@, moments: %ld (min: %ld, max: %ld, avg: %.2f)", buf, 0x34u);
    }
    v83 = PLStoryGetLog();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      [(PXStoryAutoEditConcreteMomentsStatistics *)v93->_statistics clusteringDuration];
      *(_DWORD *)buf = 134217984;
      uint64_t v101 = v84;
      _os_log_impl(&dword_1A9AE7000, v83, OS_LOG_TYPE_DEFAULT, "clustering finished in %.3fs", buf, 0xCu);
    }
  }
}

- (id)_locationsByAssetUUIDWithAssets:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x1AD10CB00]();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v3 count] >= 2)
  {
    uint64_t v6 = [v3 firstObject];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      if ([v3 count])
      {
        unint64_t v8 = 0;
        do
        {
          unint64_t v9 = [v3 objectAtIndex:v8];
          unint64_t v10 = [v9 location];
          uint64_t v11 = [v9 uuid];
          id v12 = (void *)v11;
          if (v10)
          {
            if (v11)
            {
              [v10 coordinate];
              double latitude = v18.latitude;
              double longitude = v18.longitude;
              if (CLLocationCoordinate2DIsValid(v18))
              {
                v15 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
                [v5 setObject:v15 forKeyedSubscript:v12];
              }
            }
          }

          ++v8;
        }
        while (v8 < [v3 count]);
      }
    }
  }

  return v5;
}

- (id)_faceprintsByAssetUUIDWithAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count] >= 2)
  {
    uint64_t v6 = [(PXStoryAutoEditMomentsProvider *)self _faceprintDatasByAssetUUIDWithAssets:v4];
    id v5 = [(PXStoryAutoEditMomentsProvider *)self _faceprintsByAssetUUIDWithAssets:v4 faceprintDatas:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_faceprintDatasByAssetUUIDWithAssets:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1AD10CB00]();
  if ([v3 count] < 2)
  {
    id v29 = 0;
    goto LABEL_23;
  }
  id v5 = [v3 firstObject];
  if (objc_opt_respondsToSelector())
  {
    id v29 = (id)objc_opt_new();
    if ([v3 count] >= 1)
    {
      v27 = v5;
      uint64_t v6 = 0;
      id v28 = v3;
      do
      {
        char v7 = (void *)MEMORY[0x1AD10CB00]();
        unint64_t v8 = [v3 objectAtIndexedSubscript:v6];
        unint64_t v9 = [v8 uuid];
        if (objc_opt_respondsToSelector())
        {
          v30 = v7;
          id v10 = v8;
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v12 = [v10 faceStrings];
          if ([v12 count])
          {
            unint64_t v13 = 0;
            do
            {
              uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
              v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:1];
              if (v15) {
                [v11 addObject:v15];
              }

              ++v13;
            }
            while (v13 < [v12 count]);
          }
          [v29 setObject:v11 forKeyedSubscript:v9];

          id v3 = v28;
          char v7 = v30;
        }

        ++v6;
      }
      while (v6 < [v3 count]);
      id v5 = v27;
    }
    goto LABEL_22;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v17 = 0;
LABEL_20:
    id v29 = 0;
    goto LABEL_21;
  }
  v16 = [v5 photoLibrary];
  uint64_t v17 = v16;
  if (!v16) {
    goto LABEL_20;
  }
  CLLocationCoordinate2D v18 = [v16 photoLibraryForCurrentQueueQoS];

  if (!v18) {
    goto LABEL_20;
  }
  uint64_t v19 = [v17 librarySpecificFetchOptions];
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v19 setIncludedDetectionTypes:v20];

  v33[0] = *MEMORY[0x1E4F39608];
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [v19 setFetchPropertySets:v21];

  v22 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  unint64_t v23 = [v3 objectsAtIndexes:v22];
  v24 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v23 options:v19];
  id v25 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __71__PXStoryAutoEditMomentsProvider__faceprintDatasByAssetUUIDWithAssets___block_invoke;
  v31[3] = &unk_1E5DB7F48;
  id v29 = v25;
  id v32 = v29;
  [v24 enumerateKeysAndObjectsUsingBlock:v31];

LABEL_21:
LABEL_22:

LABEL_23:

  return v29;
}

void __71__PXStoryAutoEditMomentsProvider__faceprintDatasByAssetUUIDWithAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:a2];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "faceClusteringProperties", (void)v16);
        uint64_t v14 = [v13 faceprint];
        v15 = [v14 faceprintData];

        if (v15) {
          [v7 addObject:v15];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_faceprintsByAssetUUIDWithAssets:(id)a3 faceprintDatas:(id)a4
{
  id v5 = a3;
  id v20 = a4;
  uint64_t v6 = (void *)MEMORY[0x1AD10CB00]();
  if ([v5 count] >= 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v5 count] >= 1)
    {
      long long v18 = v6;
      long long v19 = v5;
      uint64_t v8 = 0;
      do
      {
        uint64_t v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v18);
        uint64_t v10 = [v9 uuid];
        uint64_t v11 = [v20 objectForKeyedSubscript:v10];
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v11 count])
        {
          unint64_t v13 = 0;
          do
          {
            uint64_t v14 = [v11 objectAtIndexedSubscript:v13];
            if (v14)
            {
              id v15 = objc_alloc(NSClassFromString(&cfstr_Vnfacetorsopri.isa));
              uint64_t v21 = 0;
              long long v16 = (void *)[v15 initWithState:v14 error:&v21];
              if (v16) {
                [v12 addObject:v16];
              }
            }
            ++v13;
          }
          while (v13 < [v11 count]);
        }
        [v7 setObject:v12 forKeyedSubscript:v10];

        ++v8;
        id v5 = v19;
      }
      while (v8 < [v19 count]);
      uint64_t v6 = v18;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (PXStoryAutoEditMomentsProvider)initWithConfiguration:(id)a3 assetCollection:(id)a4 displayAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryAutoEditMomentsProvider;
  id v12 = [(PXStoryAutoEditMomentsProvider *)&v22 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_assetCollection, a4);
    objc_storeStrong((id *)&v13->_displayAssets, a5);
    uint64_t v14 = objc_alloc_init(PXStoryAutoEditConcreteMomentsStatistics);
    statistics = v13->_statistics;
    v13->_statistics = v14;

    long long v16 = (const char *)*MEMORY[0x1E4F8C518];
    long long v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    os_log_t v19 = os_log_create(v16, (const char *)[v18 UTF8String]);
    log = v13->_log;
    v13->_log = (OS_os_log *)v19;
  }
  return v13;
}

@end