@interface MOHostingAtHomeManager
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)fUniverse;
- (MOHostingAtHomeManager)initWithUniverse:(id)a3;
- (MORoutineServiceManager)routineServiceManager;
- (OS_dispatch_queue)queue;
- (double)emotionAttachmentBundleDurationThreshold;
- (double)photosCurationScoreThreshold;
- (double)photosDistanceFromHomeThreshold;
- (float)mediaDurationThreshold;
- (id)dedupeHostingAtHomeBundles:(id)a3 withEvents:(id)a4 withCalendar:(id)a5;
- (unint64_t)photosCountThreshold;
- (unint64_t)photosFaceCountThreshold;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7;
- (void)setConfigurationManager:(id)a3;
- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3;
- (void)setMediaDurationThreshold:(float)a3;
- (void)setPhotosCountThreshold:(unint64_t)a3;
- (void)setPhotosCurationScoreThreshold:(double)a3;
- (void)setPhotosDistanceFromHomeThreshold:(double)a3;
- (void)setPhotosFaceCountThreshold:(unint64_t)a3;
- (void)setRoutineServiceManager:(id)a3;
@end

@implementation MOHostingAtHomeManager

- (MOHostingAtHomeManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MOHostingAtHomeManager;
  v6 = [(MOHostingAtHomeManager *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [v5 getService:v15];
    routineServiceManager = v7->_routineServiceManager;
    v7->_routineServiceManager = (MORoutineServiceManager *)v16;

    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = [v5 getService:v19];
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v20;

    [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"Photos_ThresholdForCurationScore" withFallback:0.0];
    v7->_photosCurationScoreThreshold = v22;
    v7->_photosFaceCountThreshold = [(MOConfigurationManagerBase *)v7->_configurationManager getIntegerSettingForKey:@"Photos_ThresholdForFaceCount" withFallback:1];
    v7->_photosCountThreshold = [(MOConfigurationManagerBase *)v7->_configurationManager getIntegerSettingForKey:@"Photos_ThresholdNumberOfPhotos" withFallback:1];
    [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"Media_DurationThreshold" withFallback:0.0];
    v7->_mediaDurationThreshold = v23;
    LODWORD(v24) = 1202241536;
    [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"EmotionAttachmentTAHBundleDurationThreshold" withFallback:v24];
    v7->_emotionAttachmentBundleDurationThreshold = v25;
  }

  return v7;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(MOHostingAtHomeManager *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
  v23[3] = &unk_1002CB910;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

void __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002CA140;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 _performAnnotationWithEvents:v2 withPatternEvents:v3 withBundleWindowStart:v4 withBundleWindowEnd:v5 handler:v6];
}

uint64_t __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id v132 = a3;
  id v125 = a4;
  id v152 = a5;
  id v143 = a6;
  v124 = (void (**)(id, id, void))a7;
  v130 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions];
  v139 = [v132 filteredArrayUsingPredicate:v130];
  v129 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  v128 = [v132 filteredArrayUsingPredicate:v129];
  v127 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
  v138 = [v128 filteredArrayUsingPredicate:v127];
  v126 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  v131 = [v125 filteredArrayUsingPredicate:v126];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = [v131 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "H@H: Found %lu visit pattern events", buf, 0xCu);
  }

  if ([v131 count])
  {
    id v12 = [(MOHostingAtHomeManager *)self fUniverse];
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    v137 = [v12 getService:v14];

    v123 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K = %lu"];
    v122 = +[NSPredicate predicateWithFormat:v123, @"category", 1, @"placeUserType", 1];
    v121 = [v132 filteredArrayUsingPredicate:v122];
    id v120 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v209 = v120;
    id v15 = +[NSArray arrayWithObjects:&v209 count:1];
    v141 = [v121 sortedArrayUsingDescriptors:v15];

    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v141 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "H@H: Found %lu visit events", buf, 0xCu);
    }

    if ([v141 count])
    {
      v135 = objc_opt_new();
      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      id obj = v131;
      id v18 = [obj countByEnumeratingWithState:&v191 objects:v208 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v192;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v192 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(void **)(*((void *)&v191 + 1) + 8 * i);
            id v22 = [v21 patterns];
            float v23 = [v22 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
            if ([v23 unsignedIntValue] == 4)
            {
              id v24 = [v21 startDate];
              if ([v24 isOnOrAfter:v152])
              {
                id v25 = [v21 endDate];
                unsigned int v26 = [v25 isOnOrBefore:v143];

                if (v26) {
                  [v135 addObject:v21];
                }
              }
              else
              {
              }
            }
            else
            {
            }
          }
          id v18 = [obj countByEnumeratingWithState:&v191 objects:v208 count:16];
        }
        while (v18);
      }

      id v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v135 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "H@H: Found %lu H@H pattern events with complete context available for bundling", buf, 0xCu);
      }

      if ([v135 count])
      {
        v136 = objc_opt_new();
        long long v189 = 0u;
        long long v190 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        id v134 = v135;
        id v142 = [v134 countByEnumeratingWithState:&v187 objects:v207 count:16];
        if (!v142) {
          goto LABEL_75;
        }
        uint64_t v140 = *(void *)v188;
        while (1)
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v188 != v140)
            {
              uint64_t v30 = v29;
              objc_enumerationMutation(v134);
              uint64_t v29 = v30;
            }
            uint64_t v150 = v29;
            v31 = *(void **)(*((void *)&v187 + 1) + 8 * v29);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v204 = __Block_byref_object_copy__31;
            v205 = __Block_byref_object_dispose__31;
            id v206 = (id)objc_opt_new();
            v32 = [v31 startDate];
            v33 = [v31 endDate];
            v186[0] = _NSConcreteStackBlock;
            v186[1] = 3221225472;
            v186[2] = __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
            v186[3] = &unk_1002CB938;
            v186[4] = buf;
            +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:v141 rangeStart:v32 rangeEnd:v33 handler:v186];

            if ([*(id *)(*(void *)&buf[8] + 40) count])
            {
              v34 = objc_opt_new();
              [v34 addObject:v31];
              [v34 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
              v149 = v34;
              v35 = [MOEventBundle alloc];
              v36 = +[NSUUID UUID];
              v37 = +[NSDate date];
              v38 = [(MOEventBundle *)v35 initWithBundleIdentifier:v36 creationDate:v37];

              [(MOEventBundle *)v38 setEvents:v149];
              [(MOEventBundle *)v38 setInterfaceType:7];
              [(MOEventBundle *)v38 setBundleSubType:503];
              [(MOEventBundle *)v38 setBundleSuperType:5];
              v39 = [v31 startDate];
              v40 = [v39 dateByAddingTimeInterval:-7200.0];
              [(MOEventBundle *)v38 setStartDate:v40];

              v41 = [v31 endDate];
              v42 = [v41 dateByAddingTimeInterval:7200.0];
              [(MOEventBundle *)v38 setEndDate:v42];

              v43 = [v31 startDate];
              v44 = +[MOTime timeForDate:v43 timeZoneManager:v137];
              [(MOEventBundle *)v38 setTime:v44];

              v45 = [[MOAction alloc] initWithActionName:@"Hosting at Home" actionType:1 actionSubtype:9];
              [(MOEventBundle *)v38 setAction:v45];

              v46 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v47 = [v46 eventIdentifier];
              v48 = [(MOEventBundle *)v38 action];
              [v48 setSourceEventIdentifier:v47];

              v49 = [MOPlace alloc];
              v50 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v51 = [v50 location];
              v52 = [(MOPlace *)v49 initWithPlaceName:@"Home" placeType:1 placeUserType:1 location:v51 locationMode:1 poiCategory:0 distanceToHomeInMiles:-1.0 placeNameConfidence:-1.0 familiarityIndexLOI:0.0];
              [(MOEventBundle *)v38 setPlace:v52];

              v53 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v54 = [v53 eventIdentifier];
              v55 = [(MOEventBundle *)v38 place];
              [v55 setSourceEventIdentifier:v54];

              v56 = [(MOEventBundle *)v38 startDate];
              v57 = [(MOEventBundle *)v38 endDate];
              v148 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:v56 endData:v57];

              v145 = [v139 filteredArrayUsingPredicate:v148];
              if ([v145 count])
              {
                *(float *)&double v58 = self->_mediaDurationThreshold;
                v59 = +[MOContextAnnotationUtilities annotateEventBundle:v38 dateIntervalEvents:*(void *)(*(void *)&buf[8] + 40) playbackMediaEvents:v145 mediaDurationThreshold:v58];
                if ([v59 count]) {
                  [(MOEventBundle *)v38 addEvents:v59];
                }
              }
              v60 = [(MOEventBundle *)v38 startDate];
              v61 = [(MOEventBundle *)v38 endDate];
              v147 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v60 endDate:v61];

              v146 = [v138 filteredArrayUsingPredicate:v147];
              uint64_t v62 = *(void *)(*(void *)&buf[8] + 40);
              [(MOHostingAtHomeManager *)self emotionAttachmentBundleDurationThreshold];
              *(float *)&double v63 = v63;
              uint64_t v64 = +[MOContextAnnotationUtilities annotateEventBundle:v38 dateIntervalEvents:v62 emotionEvents:v146 bundleDurationThreshold:v63];
              [(MOEventBundle *)v38 addEvents:v64];
              id obja = (id)v64;
              v65 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                v66 = [v31 startDate];
                v67 = [v31 endDate];
                *(_DWORD *)v199 = 138412546;
                *(void *)&v199[4] = v66;
                *(_WORD *)&v199[12] = 2112;
                *(void *)&v199[14] = v67;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "H@H: Created bundle for range %@ to %@", v199, 0x16u);
              }
              *(void *)v199 = 0;
              *(void *)&v199[8] = v199;
              *(void *)&v199[16] = 0x3032000000;
              v200 = __Block_byref_object_copy__31;
              v201 = __Block_byref_object_dispose__31;
              id v202 = (id)objc_opt_new();
              uint64_t v182 = 0;
              v183 = &v182;
              uint64_t v184 = 0x2020000000;
              uint64_t v185 = 0;
              uint64_t v176 = 0;
              v177 = &v176;
              uint64_t v178 = 0x3032000000;
              v179 = __Block_byref_object_copy__31;
              v180 = __Block_byref_object_dispose__31;
              id v181 = (id)objc_opt_new();
              uint64_t v170 = 0;
              v171 = &v170;
              uint64_t v172 = 0x3032000000;
              v173 = __Block_byref_object_copy__31;
              v174 = __Block_byref_object_dispose__31;
              id v175 = 0;
              uint64_t v164 = 0;
              v165 = &v164;
              uint64_t v166 = 0x3032000000;
              v167 = __Block_byref_object_copy__31;
              v168 = __Block_byref_object_dispose__31;
              id v169 = 0;
              id v68 = [(MOEventBundle *)v38 copy];
              fUniverse = self->_fUniverse;
              v163[0] = _NSConcreteStackBlock;
              v163[1] = 3221225472;
              v163[2] = __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_165;
              v163[3] = &unk_1002CB960;
              v163[4] = v199;
              v163[5] = &v182;
              v163[6] = &v176;
              v163[7] = &v170;
              v163[8] = &v164;
              +[MOContextAnnotationUtilities addPhotoResources:v68 universe:fUniverse handler:v163];

              [(MOEventBundle *)v38 setPhotoSource:v183[3]];
              id v70 = [(id)v177[5] copy];
              [(MOEventBundle *)v38 setPhotoTraits:v70];

              v71 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                uint64_t v72 = v183[3];
                *(_DWORD *)v197 = 134217984;
                uint64_t v198 = v72;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "H@H: photoSource, %lu", v197, 0xCu);
              }

              v73 = [v31 startDate];
              [(MOEventBundle *)v38 setStartDate:v73];

              v74 = [v31 endDate];
              [(MOEventBundle *)v38 setEndDate:v74];

              double photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
              *(float *)&double photosCurationScoreThreshold = photosCurationScoreThreshold;
              v76 = +[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:*(void *)(*(void *)&v199[8] + 40) withPhotoCurationScore:self->_photosFaceCountThreshold andFaceCount:self->_photosCountThreshold numPhotosThreshold:photosCurationScoreThreshold];
              [(MOEventBundle *)v38 setResources:v76];

              long long v161 = 0u;
              long long v162 = 0u;
              long long v159 = 0u;
              long long v160 = 0u;
              v77 = [(MOEventBundle *)v38 resources];
              id v78 = [v77 countByEnumeratingWithState:&v159 objects:v196 count:16];
              if (v78)
              {
                uint64_t v79 = *(void *)v160;
                float v80 = 0.0;
                do
                {
                  for (j = 0; j != v78; j = (char *)j + 1)
                  {
                    if (*(void *)v160 != v79) {
                      objc_enumerationMutation(v77);
                    }
                    v82 = [*(id *)(*((void *)&v159 + 1) + 8 * (void)j) photoCurationScore];
                    [v82 floatValue];
                    float v84 = v83;

                    float v80 = v80 + v84;
                  }
                  id v78 = [v77 countByEnumeratingWithState:&v159 objects:v196 count:16];
                }
                while (v78);
              }
              else
              {
                float v80 = 0.0;
              }

              v85 = [(MOEventBundle *)v38 resources];
              BOOL v86 = [v85 count] == 0;

              if (!v86)
              {
                v88 = [(MOEventBundle *)v38 resources];
                id v89 = [v88 count];

                float v80 = v80 / (float)(unint64_t)v89;
              }
              *(float *)&double v87 = v80;
              v90 = +[NSNumber numberWithFloat:v87];
              [(MOEventBundle *)v38 addMetaDataForRankForKey:@"PhotosAtHomeCurationScore" value:v90];

              if ([obja count])
              {
                +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v38 withEmotionEvents:obja];
                +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v38 withEmotionEvents:obja];
              }
              v91 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 2];
              v92 = [(MOEventBundle *)v38 resources];
              v93 = [v92 filteredArrayUsingPredicate:v91];

              uint64_t v94 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 3];
              v95 = [(MOEventBundle *)v38 resources];
              v96 = [v95 filteredArrayUsingPredicate:v94];
              v144 = (void *)v94;

              v97 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 16];
              v98 = [(MOEventBundle *)v38 resources];
              v99 = [v98 filteredArrayUsingPredicate:v97];

              +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:v38 withMediaResources:v96 withPhotoResources:v93 withEmotionResources:v99];
              if (+[MOContextAnnotationUtilities isEvergreenBundle:v38])
              {
                uint64_t v100 = 504;
              }
              else
              {
                uint64_t v100 = 503;
              }
              [(MOEventBundle *)v38 setBundleSubType:v100];
              if (v171[5] && v165[5])
              {
                -[MOEventBundle setStartDate:](v38, "setStartDate:");
                v101 = (void *)v171[5];
                if (v101 == (void *)v165[5])
                {
                  v102 = [v101 dateByAddingTimeInterval:5.0];
                  [(MOEventBundle *)v38 setEndDate:v102];
                }
                else
                {
                  -[MOEventBundle setEndDate:](v38, "setEndDate:");
                }
              }
              v103 = [(MOEventBundle *)v38 resources];
              BOOL v104 = [v103 count] == 0;

              if (v104) {
                goto LABEL_71;
              }
              long long v157 = 0u;
              long long v158 = 0u;
              long long v155 = 0u;
              long long v156 = 0u;
              v105 = [(MOEventBundle *)v38 resources];
              id v106 = [v105 countByEnumeratingWithState:&v155 objects:v195 count:16];
              if (!v106)
              {

                goto LABEL_71;
              }
              v133 = v93;
              int v107 = 0;
              uint64_t v108 = *(void *)v156;
              do
              {
                for (k = 0; k != v106; k = (char *)k + 1)
                {
                  if (*(void *)v156 != v108) {
                    objc_enumerationMutation(v105);
                  }
                  if ([*(id *)(*((void *)&v155 + 1) + 8 * (void)k) type] == (id)2) {
                    ++v107;
                  }
                }
                id v106 = [v105 countByEnumeratingWithState:&v155 objects:v195 count:16];
              }
              while (v106);

              v93 = v133;
              if (!v107) {
LABEL_71:
              }
                [(MOEventBundle *)v38 setIsAggregatedAndSuppressed:1];
              [v136 addObject:v38];

              _Block_object_dispose(&v164, 8);
              _Block_object_dispose(&v170, 8);

              _Block_object_dispose(&v176, 8);
              _Block_object_dispose(&v182, 8);
              _Block_object_dispose(v199, 8);
            }
            _Block_object_dispose(buf, 8);

            uint64_t v29 = v150 + 1;
          }
          while ((id)(v150 + 1) != v142);
          id v142 = [v134 countByEnumeratingWithState:&v187 objects:v207 count:16];
          if (!v142)
          {
LABEL_75:

            id v110 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            v111 = [(MOHostingAtHomeManager *)self dedupeHostingAtHomeBundles:v136 withEvents:v132 withCalendar:v110];
            v112 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
            {
              v113 = (objc_class *)objc_opt_class();
              v114 = NSStringFromClass(v113);
              id v115 = [v111 count];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v114;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v115;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "H@H(%@): Event Bundles, %lu", buf, 0x16u);
            }
            id v116 = [v111 copy];
            v124[2](v124, v116, 0);

            goto LABEL_87;
          }
        }
      }
      v119 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no pattern events with complete context available for bundling", buf, 2u);
      }

      v124[2](v124, &__NSArray0__struct, 0);
LABEL_87:
    }
    else
    {
      v118 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no visit events", buf, 2u);
      }

      v124[2](v124, &__NSArray0__struct, 0);
    }
  }
  else
  {
    v117 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no visit pattern events", buf, 2u);
    }

    v124[2](v124, &__NSArray0__struct, 0);
  }
}

void __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      id v6 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "H@H: Found %lu visit events overlapping anomaly time range", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:v3];
  }
}

void __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_165(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1[4] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v25 = v11;

  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v17 = *(void *)(a1[6] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v12;
  id v19 = v12;

  uint64_t v20 = *(void *)(a1[7] + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v13;
  id v22 = v13;

  uint64_t v23 = *(void *)(a1[8] + 8);
  id v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v14;
}

- (id)dedupeHostingAtHomeBundles:(id)a3 withEvents:(id)a4 withCalendar:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v52 = a5;
  if ((unint64_t)[v7 count] <= 1)
  {
    id v9 = v7;
    goto LABEL_31;
  }
  id v50 = v8;
  id v49 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v57 = v49;
  v10 = +[NSArray arrayWithObjects:&v57 count:1];
  id v51 = v7;
  id v11 = [v7 sortedArrayUsingDescriptors:v10];

  id v9 = (id)objc_opt_new();
  id v12 = [v11 firstObject];
  if ((unint64_t)[v11 count] >= 2)
  {
    uint64_t v13 = 1;
    int v14 = 1;
    do
    {
      uint64_t v15 = [v11 objectAtIndex:v13];
      id v16 = [v12 startDate];
      uint64_t v17 = [v16 dateByAddingTimeInterval:-10800.0];
      id v18 = [v15 startDate];
      id v19 = [v18 dateByAddingTimeInterval:-10800.0];
      unsigned __int8 v20 = [v52 isDate:v17 inSameDayAsDate:v19];

      if ((v20 & 1) == 0)
      {
        [v9 addObject:v12];
        id v29 = v15;
LABEL_28:
        id v47 = v29;

        id v12 = v47;
        goto LABEL_29;
      }
      id v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v54 = v12;
        __int16 v55 = 2112;
        v56 = v15;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "H@H: Found bundles on same day, %@ to %@", buf, 0x16u);
      }

      id v22 = [v15 resources];
      id v23 = [v22 count];
      id v24 = [v12 resources];
      id v25 = [v24 count];

      if (v23 > v25)
      {
        unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v15;
          id v27 = v26;
          id v28 = "H@H: Adding bundle to return array because greater resource count, %@";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      uint64_t v30 = [v12 resources];
      id v31 = [v30 count];
      v32 = [v15 resources];
      id v33 = [v32 count];

      unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      BOOL v34 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v31 <= v33)
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "H@H: Bundle resource counts are equal so de-dupe based on timespan", buf, 2u);
        }

        v37 = [v12 endDate];
        v38 = [v12 startDate];
        [v37 timeIntervalSinceDate:v38];
        double v40 = v39;

        v41 = [v15 endDate];
        v42 = [v15 startDate];
        [v41 timeIntervalSinceDate:v42];
        double v44 = v43;

        unsigned int v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        BOOL v45 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
        if (v44 > v40)
        {
          if (v45)
          {
            *(_DWORD *)buf = 138412290;
            v54 = v15;
            id v27 = v26;
            id v28 = "H@H: Adding bundle to return array because of broader timespan, %@";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
          }
LABEL_21:
          v46 = v15;
          goto LABEL_26;
        }
        if (v45)
        {
          *(_DWORD *)buf = 138412290;
          v54 = v12;
          v35 = v26;
          v36 = "H@H: Adding bundle to return array because of broader timespan, %@";
          goto LABEL_24;
        }
      }
      else if (v34)
      {
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        v35 = v26;
        v36 = "H@H: Adding bundle to return array because greater resource count, %@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v36, buf, 0xCu);
      }
      v46 = v12;
LABEL_26:

      [v9 addObject:v46];
      if ((unint64_t)[v11 count] > ++v14)
      {
        id v29 = [v11 objectAtIndex:v14];
        goto LABEL_28;
      }
LABEL_29:

      uint64_t v13 = ++v14;
    }
    while ((unint64_t)[v11 count] > v14);
  }

  id v8 = v50;
  id v7 = v51;
LABEL_31:

  return v9;
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (double)photosDistanceFromHomeThreshold
{
  return self->_photosDistanceFromHomeThreshold;
}

- (void)setPhotosDistanceFromHomeThreshold:(double)a3
{
  self->_photosDistanceFromHomeThreshold = a3;
}

- (double)photosCurationScoreThreshold
{
  return self->_photosCurationScoreThreshold;
}

- (void)setPhotosCurationScoreThreshold:(double)a3
{
  self->_double photosCurationScoreThreshold = a3;
}

- (unint64_t)photosFaceCountThreshold
{
  return self->_photosFaceCountThreshold;
}

- (void)setPhotosFaceCountThreshold:(unint64_t)a3
{
  self->_photosFaceCountThreshold = a3;
}

- (unint64_t)photosCountThreshold
{
  return self->_photosCountThreshold;
}

- (void)setPhotosCountThreshold:(unint64_t)a3
{
  self->_photosCountThreshold = a3;
}

- (float)mediaDurationThreshold
{
  return self->_mediaDurationThreshold;
}

- (void)setMediaDurationThreshold:(float)a3
{
  self->_mediaDurationThreshold = a3;
}

- (double)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_fUniverse, 0);
}

@end