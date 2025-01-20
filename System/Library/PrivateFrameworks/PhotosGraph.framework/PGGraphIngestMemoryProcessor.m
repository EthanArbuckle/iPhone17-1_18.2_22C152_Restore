@interface PGGraphIngestMemoryProcessor
+ (id)memoryCategoriesWithGraphUpdate:(id)a3;
+ (void)regenerateMemoriesOfCategory:(unint64_t)a3 withGraphBuilder:(id)a4 progressReporter:(id)a5;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (NSDate)localDate;
- (PGGraphIngestMemoryProcessor)initWithGraphBuilder:(id)a3;
- (id)insertMemoriesForCategories:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5;
- (id)memoryGeneratorsForMemoryCategory:(unint64_t)a3 memoryGenerationContext:(id)a4 controller:(id)a5;
- (void)deleteWithMemoryCategories:(id)a3;
- (void)insertProcessorDependentMomentFeaturesForMomentNodes:(id)a3 featureProvider:(id)a4 progressBlock:(id)a5;
- (void)insertSingletonFeatureNodes;
- (void)resetMemoryNodesWithMemoryUniqueIdentifiers:(id)a3 loggingConnection:(id)a4;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
- (void)setLocalDate:(id)a3;
@end

@implementation PGGraphIngestMemoryProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDate, 0);
  objc_storeStrong((id *)&self->_memoryController, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (void)setLocalDate:(id)a3
{
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (id)memoryGeneratorsForMemoryCategory:(unint64_t)a3 memoryGenerationContext:(id)a4 controller:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v11 = 1;
  switch(a3)
  {
    case 0uLL:
      v12 = [[PGYearInReviewMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v12];

      char v11 = 0;
      goto LABEL_3;
    case 1uLL:
      v53 = PGSingleMomentMemoryGenerator;
      goto LABEL_40;
    case 3uLL:
      v54 = [[PGPersonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v54];
      v55 = PGMePersonMemoryGenerator;
      goto LABEL_23;
    case 4uLL:
      v56 = [(PGMemoryGenerator *)[PGEarlyMomentsWithPeopleMemoryGenerator alloc] initWithController:v9];
      [(PGEarlyMomentsWithPeopleMemoryGenerator *)v56 setShouldGenerateAllMemories:1];
      goto LABEL_41;
    case 6uLL:
      v57 = PGSocialGroupMemoryGenerator;
      goto LABEL_33;
    case 8uLL:
      v57 = PGYearInReviewMemoryGenerator;
      goto LABEL_33;
    case 9uLL:
LABEL_3:
      v13 = [[PGFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v13];

      v14 = [[PGPersonFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v14];

      v15 = [(PGFoodieMemoryGenerator *)[PGRestaurantFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v15];

      v16 = [(PGFoodieMemoryGenerator *)[PGHomeFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v16];

      v17 = [(PGFoodieMemoryGenerator *)[PGCityFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v17];

      v18 = [(PGMemoryGenerator *)[PGTripFoodieMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v18];

      if (v11) {
        goto LABEL_42;
      }
      v19 = [[PGMyPetMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v19];
      v20 = [[PGMyPetAndPersonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v20];

      v21 = [[PGMyPetOutdoorMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v21];

      v22 = [[PGPersonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v22];
      v23 = [[PGMePersonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v23];

      v24 = [(PGMemoryGenerator *)[PGEarlyMomentsWithPeopleMemoryGenerator alloc] initWithController:v9];
      [(PGEarlyMomentsWithPeopleMemoryGenerator *)v24 setShouldGenerateAllMemories:1];
      [v10 addObject:v24];

      v25 = [[PGPlaceLocationMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v25];

      v26 = [[PGPlaceRegionMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v26];

      v27 = [(PGMemoryGenerator *)[PGMeaningfulEventMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v27];

      char v11 = 0;
      goto LABEL_5;
    case 0xAuLL:
      v54 = [[PGMyPetMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v54];
      v55 = PGMyPetAndPersonMemoryGenerator;
LABEL_23:
      v58 = (void *)[[v55 alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v58];

      goto LABEL_34;
    case 0xCuLL:
      v57 = PGPlaceLocationMemoryGenerator;
      goto LABEL_33;
    case 0xDuLL:
      v53 = PGPlaceRegionMemoryGenerator;
      goto LABEL_40;
    case 0xEuLL:
      v53 = PGPlaceAreaMemoryGenerator;
      goto LABEL_40;
    case 0x10uLL:
      v57 = PGMeaningfulEventMemoryGenerator;
      goto LABEL_33;
    case 0x11uLL:
LABEL_5:
      v28 = +[PGMeaningAggregationMemoryGenerator allMeaningAggregationMemoryGeneratorClasses];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v64 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = (void *)[objc_alloc(*(Class *)(*((void *)&v63 + 1) + 8 * i)) initWithMemoryGenerationContext:v8];
            [v10 addObject:v33];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v30);
      }

      if (v11) {
        goto LABEL_42;
      }
      v34 = [[PGSocialGroupMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v34];

      v35 = [(PGMemoryGenerator *)[PGRecurrentTripMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v35];

      v36 = [(PGMemoryGenerator *)[PGTripMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v36];

      v37 = [(PGMemoryGenerator *)[PGOngoingTripMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v37];

      v38 = [(PGMemoryGenerator *)[PGPastSupersetMemoryGenerator alloc] initWithController:v9];
      [(PGPastSupersetMemoryGenerator *)v38 setLocalDate:self->_localDate];
      [v10 addObject:v38];

      v39 = [(PGMemoryGenerator *)[PGSingleMomentMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v39];

      v40 = [[PGSeasonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v40];

      v41 = [[PGPlaceAreaMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v41];

      v42 = [[PGChildActivityMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v42];

      v43 = [[PGExcitingMomentsMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v43];

      char v11 = 0;
      goto LABEL_14;
    case 0x12uLL:
      v53 = PGRecurrentTripMemoryGenerator;
      goto LABEL_40;
    case 0x13uLL:
      v57 = PGTripMemoryGenerator;
      goto LABEL_33;
    case 0x14uLL:
      v59 = [(PGMemoryGenerator *)[PGPastSupersetMemoryGenerator alloc] initWithController:v9];
      [(PGPastSupersetMemoryGenerator *)v59 setLocalDate:self->_localDate];
      [v10 addObject:v59];

      goto LABEL_42;
    case 0x15uLL:
      v57 = PGSeasonMemoryGenerator;
      goto LABEL_33;
    case 0x17uLL:
      goto LABEL_16;
    case 0x19uLL:
      v57 = PGChildActivityMemoryGenerator;
LABEL_33:
      v54 = (PGPersonMemoryGenerator *)[[v57 alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v54];
LABEL_34:

      goto LABEL_42;
    case 0x1AuLL:
      v53 = PGExcitingMomentsMemoryGenerator;
      goto LABEL_40;
    case 0x1BuLL:
LABEL_14:
      v44 = +[PGTrendsMemoryGenerator trendsConfigurations];
      v62 = [[PGTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v44];
      v61 = [[PGPersonTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v44];
      v45 = [[PGLocationTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v44];
      [v10 addObject:v62];
      [v10 addObject:v61];
      [v10 addObject:v45];
      v46 = +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations];
      v47 = [[PGCLIPTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v46];
      id v48 = v9;
      v49 = [[PGPersonCLIPTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v46];
      v50 = [[PGLocationCLIPTrendsMemoryGenerator alloc] initWithMemoryGenerationContext:v8 configurations:v46];
      [v10 addObject:v47];
      [v10 addObject:v49];
      [v10 addObject:v50];

      id v9 = v48;
      if (v11) {
        goto LABEL_42;
      }
      v51 = [[PGChildAndPersonMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v51];

      v52 = [[PGChildOutdoorMemoryGenerator alloc] initWithMemoryGenerationContext:v8];
      [v10 addObject:v52];

LABEL_16:
      v53 = PGDayInHistoryAggregationMemoryGenerator;
LABEL_40:
      v56 = (PGEarlyMomentsWithPeopleMemoryGenerator *)[[v53 alloc] initWithMemoryGenerationContext:v8];
LABEL_41:
      objc_msgSend(v10, "addObject:", v56, v61);

LABEL_42:
      return v10;
    case 0x1CuLL:
      v53 = PGMyPetOutdoorMemoryGenerator;
      goto LABEL_40;
    case 0x1DuLL:
      v53 = PGChildAndPersonMemoryGenerator;
      goto LABEL_40;
    case 0x1EuLL:
      v53 = PGChildOutdoorMemoryGenerator;
      goto LABEL_40;
    case 0x1FuLL:
      v53 = PGOngoingTripMemoryGenerator;
      goto LABEL_40;
    default:
      goto LABEL_42;
  }
}

- (id)insertMemoriesForCategories:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v8 = a4;
  id aBlock = a5;
  id v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v78 count];
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert memories for %d categories", buf, 8u);
  }
  v81 = v9;

  v97 = [(PGGraphBuilder *)self->_graphBuilder graph];
  v86 = self->_memoryController;
  id v10 = [PGMemoryGenerationContext alloc];
  char v11 = [(PGMemoryController *)v86 photoLibrary];
  v12 = [(PGGraphBuilder *)self->_graphBuilder curationContext];
  v13 = [v12 userFeedbackCalculator];
  v14 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
  v85 = [(PGMemoryGenerationContext *)v10 initWithPhotoLibrary:v11 userFeedbackCalculator:v13 graph:v97 serviceManager:v14 loggingConnection:v81];

  [(PGMemoryController *)v86 setMemoryGenerationContext:v85];
  v82 = _Block_copy(aBlock);
  v91 = [MEMORY[0x1E4F1CAD0] set];
  *(void *)buf = 0;
  v139 = buf;
  uint64_t v140 = 0x2020000000;
  char v141 = 0;
  uint64_t v127 = 0;
  v128 = (double *)&v127;
  uint64_t v129 = 0x2020000000;
  uint64_t v130 = 0;
  if (v82
    && (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v128[3] >= 0.01)
    && (v128[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v82 + 2))(v82, &info, 0.0),
        uint8_t v16 = v139[24] | LOBYTE(info.numer),
        (v139[24] = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v132 = 67109378;
      *(_DWORD *)v133 = 292;
      *(_WORD *)&v133[4] = 2080;
      *(void *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
    }
    id v17 = v91;
  }
  else
  {
    v18 = v81;
    os_signpost_id_t v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    unint64_t v75 = v19 - 1;
    os_signpost_id_t spid = v19;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v132 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "InsertMemories", "", v132, 2u);
    }
    oslog = v21;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v74 = mach_absolute_time();
    v22 = (void *)MEMORY[0x1E4F71F08];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke;
    v121[3] = &unk_1E68F03F8;
    id v93 = v82;
    id v122 = v93;
    v123 = &v127;
    uint64_t v125 = 0x3F847AE147AE147BLL;
    v124 = buf;
    v77 = [v22 progressReporterWithProgressBlock:v121];
    v23 = [(PGMemoryGenerationContext *)v85 momentNodesWithBlockedFeatureCache];
    [v23 prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:v97 progressReporter:v77];

    if (v139[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v132 = 67109378;
        *(_DWORD *)v133 = 300;
        *(_WORD *)&v133[4] = 2080;
        *(void *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
      }
      id v17 = v91;
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA80] set];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      obuint64_t j = v78;
      uint64_t v25 = [obj countByEnumeratingWithState:&v117 objects:v137 count:16];
      if (v25)
      {
        uint64_t v84 = *(void *)v118;
        while (2)
        {
          uint64_t v89 = 0;
          uint64_t v83 = v25;
          do
          {
            if (*(void *)v118 != v84) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v117 + 1) + 8 * v89);
            context = (void *)MEMORY[0x1D25FED50]();
            uint64_t v27 = [v26 unsignedIntValue];
            v92 = [MEMORY[0x1E4F39160] stringForCategory:v27];
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v132 = 138412290;
              *(void *)v133 = v92;
              _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert memories for category %@", v132, 0xCu);
            }
            v88 = [(PGGraphIngestMemoryProcessor *)self memoryGeneratorsForMemoryCategory:v27 memoryGenerationContext:v85 controller:v86];
            unint64_t v28 = [v88 count];
            if (v28)
            {
              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v90 = v88;
              uint64_t v29 = oslog;
              uint64_t v95 = [v90 countByEnumeratingWithState:&v113 objects:v136 count:16];
              if (v95)
              {
                double v30 = 0.9 / (double)v28;
                uint64_t v94 = *(void *)v114;
                double v31 = 0.1;
                while (2)
                {
                  for (uint64_t i = 0; i != v95; ++i)
                  {
                    if (*(void *)v114 != v94) {
                      objc_enumerationMutation(v90);
                    }
                    v32 = *(void **)(*((void *)&v113 + 1) + 8 * i);
                    v33 = v29;
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      v34 = (objc_class *)objc_opt_class();
                      v35 = NSStringFromClass(v34);
                      *(_DWORD *)v132 = 138412546;
                      *(void *)v133 = v35;
                      *(_WORD *)&v133[8] = 2112;
                      *(void *)&v133[10] = v92;
                      _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[PGGraphIngestMemoryProcessor] Starting to generate memories with %@ for category %@", v132, 0x16u);
                    }
                    v36 = v33;
                    os_signpost_id_t v37 = os_signpost_id_generate(v36);
                    v38 = v36;
                    v39 = v38;
                    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
                    {
                      *(_WORD *)v132 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "MemoryGeneration", "", v132, 2u);
                    }

                    mach_timebase_info v112 = 0;
                    mach_timebase_info(&v112);
                    uint64_t v40 = mach_absolute_time();
                    v105[0] = MEMORY[0x1E4F143A8];
                    v105[1] = 3221225472;
                    v105[2] = __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke_301;
                    v105[3] = &unk_1E68ECB50;
                    double v109 = v31;
                    double v110 = v30;
                    id v106 = v93;
                    v107 = &v127;
                    uint64_t v111 = 0x3F847AE147AE147BLL;
                    v108 = buf;
                    v99 = [v32 generateAllPotentialMemoriesWithGraph:v97 progressBlock:v105];
                    uint64_t v41 = mach_absolute_time();
                    mach_timebase_info v42 = v112;
                    v43 = v39;
                    v44 = v43;
                    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
                    {
                      v45 = (objc_class *)objc_opt_class();
                      v46 = NSStringFromClass(v45);
                      *(_DWORD *)v132 = 138412290;
                      *(void *)v133 = v46;
                      _os_signpost_emit_with_name_impl(&dword_1D1805000, v44, OS_SIGNPOST_INTERVAL_END, v37, "MemoryGeneration", "Memory Generator: %@", v132, 0xCu);
                    }
                    v47 = v44;
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                    {
                      id v48 = NSString;
                      v49 = (objc_class *)objc_opt_class();
                      v50 = NSStringFromClass(v49);
                      v51 = [v48 stringWithFormat:@"Memory Generator: %@", v50];
                      *(_DWORD *)v132 = 136315650;
                      *(void *)v133 = "MemoryGeneration";
                      *(_WORD *)&v133[8] = 2112;
                      *(void *)&v133[10] = v51;
                      __int16 v134 = 2048;
                      double v135 = (float)((float)((float)((float)(v41 - v40) * (float)v42.numer) / (float)v42.denom)
                                   / 1000000.0);
                      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v132, 0x20u);
                    }
                    int v98 = v139[24];
                    if (v139[24])
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v132 = 67109378;
                        *(_DWORD *)v133 = 326;
                        *(_WORD *)&v133[4] = 2080;
                        *(void *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
                      }
                      id v52 = v91;
                    }
                    else
                    {
                      v53 = v47;
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        v54 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v54);
                        id v55 = (id)objc_claimAutoreleasedReturnValue();
                        int v56 = [v99 count];
                        *(_DWORD *)v132 = 138412546;
                        *(void *)v133 = v55;
                        *(_WORD *)&v133[8] = 1024;
                        *(_DWORD *)&v133[10] = v56;
                        _os_log_impl(&dword_1D1805000, v53, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] %@ generated %d potential Memories", v132, 0x12u);
                      }
                      id v57 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
                      long long v103 = 0u;
                      long long v104 = 0u;
                      long long v101 = 0u;
                      long long v102 = 0u;
                      id v58 = v99;
                      uint64_t v59 = [v58 countByEnumeratingWithState:&v101 objects:v131 count:16];
                      if (v59)
                      {
                        uint64_t v60 = *(void *)v102;
                        do
                        {
                          for (uint64_t j = 0; j != v59; ++j)
                          {
                            if (*(void *)v102 != v60) {
                              objc_enumerationMutation(v58);
                            }
                            v62 = [(PGGraphBuilder *)self->_graphBuilder insertMemoryNodeFromMemory:*(void *)(*((void *)&v101 + 1) + 8 * j) changeRequest:v57];
                            long long v63 = [v62 uniqueMemoryIdentifier];
                            [v24 addObject:v63];
                          }
                          uint64_t v59 = [v58 countByEnumeratingWithState:&v101 objects:v131 count:16];
                        }
                        while (v59);
                      }

                      [v97 executeGraphChangeRequest:v57];
                      double v31 = v30 + v31;
                    }

                    if (v98)
                    {
                      int v64 = 1;
                      goto LABEL_61;
                    }
                    uint64_t v29 = oslog;
                  }
                  uint64_t v95 = [v90 countByEnumeratingWithState:&v113 objects:v136 count:16];
                  if (v95) {
                    continue;
                  }
                  break;
                }
              }
              int v64 = 0;
LABEL_61:
            }
            else
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v132 = 134217984;
                *(void *)v133 = v27;
                _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphIngestMemoryProcessor] No memory generators found for memory category %lu", v132, 0xCu);
              }
              int v64 = 3;
            }

            if (v64 != 3 && v64)
            {

              id v17 = v91;
              goto LABEL_80;
            }
            ++v89;
          }
          while (v89 != v83);
          uint64_t v25 = [obj countByEnumeratingWithState:&v117 objects:v137 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v65 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v68 = oslog;
      v69 = v68;
      if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        *(_WORD *)v132 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v69, OS_SIGNPOST_INTERVAL_END, spid, "InsertMemories", "", v132, 2u);
      }

      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v132 = 136315394;
        *(void *)v133 = "InsertMemories";
        *(_WORD *)&v133[8] = 2048;
        *(double *)&v133[10] = (float)((float)((float)((float)(v65 - v74) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v69, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v132, 0x16u);
      }
      if (v82
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v128[3] >= 0.01)
        && (v128[3] = Current,
            LOBYTE(v112.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v93 + 2))(v93, &v112, 1.0),
            uint8_t v71 = v139[24] | LOBYTE(v112.numer),
            (v139[24] = v71) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v132 = 67109378;
          *(_DWORD *)v133 = 342;
          *(_WORD *)&v133[4] = 2080;
          *(void *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
        }
        id v72 = v91;
      }
      else
      {
        id v72 = v24;
      }
      id v17 = v72;
LABEL_80:
    }
  }
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

void __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke_301(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + a3 * v7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)resetMemoryNodesWithMemoryUniqueIdentifiers:(id)a3 loggingConnection:(id)a4
{
  id v9 = a3;
  if ([v9 count])
  {
    v5 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    double v6 = [v9 allObjects];
    double v7 = +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:v6 inPhotoLibrary:v5];

    if ([v7 count])
    {
      id v8 = [v7 allValues];
      +[PGGraphMemoryProcessorHelper resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:v8 inPhotoLibrary:v5];
    }
  }
}

- (void)deleteWithMemoryCategories:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 containsObject:&unk_1F28D1728])
  {
    [(PGGraphBuilder *)self->_graphBuilder deleteAllMemoryNodesAndEdges];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
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
          objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "unsignedIntValue", (void)v11));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(PGGraphBuilder *)self->_graphBuilder deleteAllMemoryNodesAndEdgesForMemoryCategories:v5];
  }
}

- (void)insertProcessorDependentMomentFeaturesForMomentNodes:(id)a3 featureProvider:(id)a4 progressBlock:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a4;
  id v9 = a5;
  uint64_t v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v44 = [v8 count];
    _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert processor-dependent features for %d moments", buf, 8u);
  }

  double v11 = 0.0;
  os_signpost_id_t v37 = (void (**)(void *, unsigned char *, double))_Block_copy(v9);
  if (v37)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v42 = 0;
      v37[2](v37, &v42, 0.0);
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v44 = 154;
          __int16 v45 = 2080;
          v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          long long v13 = MEMORY[0x1E4F14500];
LABEL_29:
          _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      double v11 = Current;
    }
  }
  oslog = v10;
  id v31 = v9;
  unint64_t v14 = [v8 count];
  double v15 = CFAbsoluteTimeGetCurrent();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v32 = v8;
  obuint64_t j = v8;
  uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0;
    double v19 = 1.0 / (double)v14;
    uint64_t v35 = *(void *)v39;
    double v20 = 0.0;
    uint64_t v30 = 67109632;
    while (2)
    {
      uint64_t v21 = 0;
      unint64_t v22 = v18;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * v21);
        v24 = (void *)MEMORY[0x1D25FED50]();
        if (v37)
        {
          double v25 = CFAbsoluteTimeGetCurrent();
          if (v25 - v11 >= 0.01)
          {
            char v42 = 0;
            v37[2](v37, &v42, v20);
            if (v42)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v44 = 162;
                __int16 v45 = 2080;
                v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v9 = v31;
              id v8 = v32;
              uint64_t v10 = oslog;
              goto LABEL_33;
            }
            double v11 = v25;
          }
        }
        if (v18 + v21 == 25 * (v22 / 0x19))
        {
          double v26 = CFAbsoluteTimeGetCurrent();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            int v44 = v18 + v21;
            __int16 v45 = 1024;
            LODWORD(v46[0]) = 25;
            WORD2(v46[0]) = 2048;
            *(double *)((char *)v46 + 6) = v26 - v15;
            _os_log_debug_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEBUG, "[PGGraphIngestMemoryProcessor] Processed %d moments, batch of %d took %.2f seconds", buf, 0x18u);
          }
          double v15 = v26;
        }
        double v20 = v19 + v20;
        ++v22;
        graphBuilder = self->_graphBuilder;
        unint64_t v28 = [(PGGraphBuilder *)graphBuilder photoLibrary];
        uint64_t v29 = [(PGGraphBuilder *)self->_graphBuilder curationContext];
        [(PGGraphBuilder *)graphBuilder insertMomentFeaturesForMomentNode:v23 momentEnvelope:0 photoLibrary:v28 featureProvider:v36 atMomentIngest:0 curationContext:v29];

        ++v21;
      }
      while (v17 != v21);
      v18 += v21;
      uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v9 = v31;
  id v8 = v32;
  uint64_t v10 = oslog;
  if (v37)
  {
    if (CFAbsoluteTimeGetCurrent() - v11 >= 0.01)
    {
      char v42 = 0;
      v37[2](v37, &v42, 1.0);
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v44 = 175;
          __int16 v45 = 2080;
          v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          long long v13 = MEMORY[0x1E4F14500];
          goto LABEL_29;
        }
      }
    }
  }
LABEL_33:
}

- (void)insertSingletonFeatureNodes
{
  id v2 = [(PGGraphBuilder *)self->_graphBuilder insertOverTheYearsNode];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  *(void *)((char *)&v63[2] + 4) = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  uint64_t v7 = _Block_copy(v34);
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v54 = 0;
  id v55 = (double *)&v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  if (!v7
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v55[3] < 0.01)
    || (v55[3] = v8,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v7 + 2))(v7, &info, 0.0),
        char v9 = *((unsigned char *)v59 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v59 + 24) = v9) == 0))
  {
    v33 = [(PGGraphBuilder *)self->_graphBuilder graph];
    uint64_t v35 = [(id)objc_opt_class() memoryCategoriesWithGraphUpdate:v6];
    [(PGGraphIngestMemoryProcessor *)self deleteWithMemoryCategories:v35];
    [(PGGraphIngestMemoryProcessor *)self insertSingletonFeatureNodes];
    uint64_t v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    long long v12 = v10;
    long long v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGGraphIngestMemoryProcessor", "", (uint8_t *)&buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v32 = mach_absolute_time();
    graphBuilder = self->_graphBuilder;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v48[3] = &unk_1E68F03F8;
    id v15 = v7;
    id v49 = v15;
    v50 = &v54;
    v51 = &v58;
    uint64_t v52 = 0x3F847AE147AE147BLL;
    uint64_t v16 = [(PGGraphBuilder *)graphBuilder featureProviderWithProgressBlock:v48];
    if (*((unsigned char *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v63[0]) = 115;
        WORD2(v63[0]) = 2080;
        *(void *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_36;
    }
    uint64_t v17 = [v6 insertedMomentNodes];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_232;
    v43[3] = &unk_1E68F03F8;
    id v18 = v15;
    id v44 = v18;
    __int16 v45 = &v54;
    uint64_t v47 = 0x3F847AE147AE147BLL;
    v46 = &v58;
    [(PGGraphIngestMemoryProcessor *)self insertProcessorDependentMomentFeaturesForMomentNodes:v17 featureProvider:v16 progressBlock:v43];

    if (*((unsigned char *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v63[0]) = 121;
        WORD2(v63[0]) = 2080;
        *(void *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_35;
    }
    unint64_t v19 = [v35 count];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_233;
    v37[3] = &unk_1E68F0420;
    double v41 = 0.6 / (double)v19;
    id v20 = v18;
    id v38 = v20;
    long long v39 = &v54;
    uint64_t v42 = 0x3F847AE147AE147BLL;
    long long v40 = &v58;
    uint64_t v21 = [(PGGraphIngestMemoryProcessor *)self insertMemoriesForCategories:v35 loggingConnection:v13 progressBlock:v37];
    if (*((unsigned char *)v59 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_34:

LABEL_35:
LABEL_36:

        goto LABEL_37;
      }
      int buf = 67109378;
      LODWORD(v63[0]) = 128;
      WORD2(v63[0]) = 2080;
      *(void *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      unint64_t v22 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (v6 && ([v6 isResumingFullAnalysis] & 1) == 0)
      {
        id v31 = [MEMORY[0x1E4F1CA80] setWithSet:v21];
        if ([v6 hasDeletedMomentNodes])
        {
          uint64_t v23 = [v6 identifiersForMemoriesRelatedToDeletedMoments];
          [v31 unionSet:v23];
        }
        [(PGGraphIngestMemoryProcessor *)self resetMemoryNodesWithMemoryUniqueIdentifiers:v31 loggingConnection:v13];
      }
      uint64_t v24 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v27 = v13;
      unint64_t v28 = v27;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v11, "PGGraphIngestMemoryProcessor", "", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int buf = 136315394;
        v63[0] = "PGGraphIngestMemoryProcessor";
        LOWORD(v63[1]) = 2048;
        *(double *)((char *)&v63[1] + 2) = (float)((float)((float)((float)(v24 - v32) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (!v7) {
        goto LABEL_34;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v55[3] < 0.01) {
        goto LABEL_34;
      }
      v55[3] = Current;
      char v36 = 0;
      (*((void (**)(id, char *, double))v20 + 2))(v20, &v36, 1.0);
      char v30 = *((unsigned char *)v59 + 24) | v36;
      *((unsigned char *)v59 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      int buf = 67109378;
      LODWORD(v63[0]) = 142;
      WORD2(v63[0]) = 2080;
      *(void *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      unint64_t v22 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109378;
    LODWORD(v63[0]) = 94;
    WORD2(v63[0]) = 2080;
    *(void *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_37:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_232(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.3 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_233(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * v6 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasAnythingToDo];
  }

  return v4;
}

- (PGGraphIngestMemoryProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGGraphIngestMemoryProcessor;
  double v6 = [(PGGraphIngestMemoryProcessor *)&v17 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    uint64_t v8 = [PGMemoryController alloc];
    char v9 = [v5 graph];
    uint64_t v10 = [v5 photoLibrary];
    os_signpost_id_t v11 = [v5 loggingConnection];
    uint64_t v12 = [(PGMemoryController *)v8 initWithGraph:v9 photoLibrary:v10 loggingConnection:v11];
    memoryController = v7->_memoryController;
    v7->_memoryController = (PGMemoryController *)v12;

    uint64_t v14 = [MEMORY[0x1E4F76C68] currentLocalDate];
    localDate = v7->_localDate;
    v7->_localDate = (NSDate *)v14;
  }
  return v7;
}

+ (void)regenerateMemoriesOfCategory:(unint64_t)a3 withGraphBuilder:(id)a4 progressReporter:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  char v9 = [[PGGraphIngestMemoryProcessor alloc] initWithGraphBuilder:v7];
  if (a3) {
    [v7 deleteAllMemoryNodesAndEdgesForMemoryCategory:a3];
  }
  else {
    [v7 deleteAllMemoryNodesAndEdges];
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  v20[0] = v10;
  os_signpost_id_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v12 = [v7 loggingConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PGGraphIngestMemoryProcessor_regenerateMemoriesOfCategory_withGraphBuilder_progressReporter___block_invoke;
  v15[3] = &unk_1E68EBE50;
  objc_super v17 = v18;
  id v13 = v8;
  id v16 = v13;
  id v14 = [(PGGraphIngestMemoryProcessor *)v9 insertMemoriesForCategories:v11 loggingConnection:v12 progressBlock:v15];

  _Block_object_dispose(v18, 8);
}

uint64_t __95__PGGraphIngestMemoryProcessor_regenerateMemoriesOfCategory_withGraphBuilder_progressReporter___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

+ (id)memoryCategoriesWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis])
  {
    uint64_t v4 = &unk_1F28D3EB8;
  }
  else if (([v3 hasInsertedMomentNodes] & 1) != 0 {
         || ([v3 hasDeletedMomentNodes] & 1) != 0)
  }
  {
    uint64_t v4 = &unk_1F28D3ED0;
  }
  else if (([v3 momentUpdateTypes] & 0x13) != 0)
  {
    uint64_t v4 = &unk_1F28D3EE8;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    if (([v3 momentUpdateTypes] & 4) != 0) {
      [v4 addObjectsFromArray:&unk_1F28D3F00];
    }
    if (([v3 hasUpdatedPersonNodes] & 1) != 0
      || ([v3 hasDeletedPersonNodes] & 1) != 0
      || ([v3 momentUpdateTypes] & 8) != 0)
    {
      [v4 addObjectsFromArray:&unk_1F28D3F18];
    }
    if (([v3 hasInsertedHighlightNodes] & 1) != 0
      || ([v3 hasUpdatedHighlightNodes] & 1) != 0
      || [v3 hasDeletedHighlightNodes])
    {
      [v4 addObjectsFromArray:&unk_1F28D3F30];
    }
  }

  return v4;
}

@end