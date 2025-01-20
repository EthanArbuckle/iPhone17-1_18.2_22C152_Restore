@interface MOTimeAtHomeAnomalyManager
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)fUniverse;
- (MORoutineServiceManager)routineServiceManager;
- (MOTimeAtHomeAnomalyManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (double)emotionAttachmentBundleDurationThreshold;
- (double)photosCurationScoreThreshold;
- (double)photosDistanceFromHomeThreshold;
- (float)mediaDurationThreshold;
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

@implementation MOTimeAtHomeAnomalyManager

- (MOTimeAtHomeAnomalyManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MOTimeAtHomeAnomalyManager;
  v6 = [(MOTimeAtHomeAnomalyManager *)&v27 init];
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
  v17 = [(MOTimeAtHomeAnomalyManager *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
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

void __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002CA140;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 _performAnnotationWithEvents:v2 withPatternEvents:v3 withBundleWindowStart:v4 withBundleWindowEnd:v5 handler:v6];
}

uint64_t __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id v126 = a3;
  id v119 = a4;
  id v146 = a5;
  id v136 = a6;
  v118 = (void (**)(id, id, void))a7;
  v124 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions];
  v132 = [v126 filteredArrayUsingPredicate:v124];
  v123 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  v122 = [v126 filteredArrayUsingPredicate:v123];
  v121 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
  v131 = [v122 filteredArrayUsingPredicate:v121];
  v120 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  v125 = [v119 filteredArrayUsingPredicate:v120];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = [v125 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "T@H: Found %lu visit pattern events", buf, 0xCu);
  }

  if ([v125 count])
  {
    v117 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K = %lu"];
    v116 = +[NSPredicate predicateWithFormat:v117, @"category", 1, @"placeUserType", 1];
    v115 = [v126 filteredArrayUsingPredicate:v116];
    id v114 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v203 = v114;
    id v12 = +[NSArray arrayWithObjects:&v203 count:1];
    v134 = [v115 sortedArrayUsingDescriptors:v12];

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v134 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "T@H: Found %lu visit events", buf, 0xCu);
    }

    if ([v134 count])
    {
      v129 = objc_opt_new();
      long long v187 = 0u;
      long long v188 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      id obj = v125;
      id v15 = [obj countByEnumeratingWithState:&v185 objects:v202 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v186;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v186 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v185 + 1) + 8 * i);
            id v19 = [v18 patterns];
            id v20 = [v19 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
            if ([v20 unsignedIntValue] == 5)
            {
              id v21 = [v18 startDate];
              if ([v21 isOnOrAfter:v146])
              {
                id v22 = [v18 endDate];
                unsigned int v23 = [v22 isOnOrBefore:v136];

                if (v23) {
                  [v129 addObject:v18];
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
          id v15 = [obj countByEnumeratingWithState:&v185 objects:v202 count:16];
        }
        while (v15);
      }

      id v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v129 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "T@H: Found %lu T@H pattern events with complete context available for bundling", buf, 0xCu);
      }

      if ([v129 count])
      {
        id v26 = [(MOTimeAtHomeAnomalyManager *)self fUniverse];
        id v27 = (objc_class *)objc_opt_class();
        id v28 = NSStringFromClass(v27);
        v29 = [v26 getService:v28];

        v130 = objc_opt_new();
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        id v128 = v129;
        id v135 = [v128 countByEnumeratingWithState:&v181 objects:v201 count:16];
        if (!v135) {
          goto LABEL_73;
        }
        uint64_t v133 = *(void *)v182;
        v127 = v29;
        while (1)
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v182 != v133)
            {
              uint64_t v31 = v30;
              objc_enumerationMutation(v128);
              uint64_t v30 = v31;
            }
            uint64_t v144 = v30;
            v32 = *(void **)(*((void *)&v181 + 1) + 8 * v30);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v198 = __Block_byref_object_copy__14;
            v199 = __Block_byref_object_dispose__14;
            id v200 = (id)objc_opt_new();
            v33 = [v32 startDate];
            v34 = [v32 endDate];
            v180[0] = _NSConcreteStackBlock;
            v180[1] = 3221225472;
            v180[2] = __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
            v180[3] = &unk_1002CB938;
            v180[4] = buf;
            +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:v134 rangeStart:v33 rangeEnd:v34 handler:v180];

            if ([*(id *)(*(void *)&buf[8] + 40) count])
            {
              v35 = objc_opt_new();
              [v35 addObject:v32];
              [v35 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
              v143 = v35;
              v36 = [MOEventBundle alloc];
              v37 = +[NSUUID UUID];
              v38 = +[NSDate date];
              v39 = [(MOEventBundle *)v36 initWithBundleIdentifier:v37 creationDate:v38];

              [(MOEventBundle *)v39 setEvents:v143];
              [(MOEventBundle *)v39 setInterfaceType:7];
              [(MOEventBundle *)v39 setBundleSubType:501];
              [(MOEventBundle *)v39 setBundleSuperType:5];
              v40 = [v32 startDate];
              [(MOEventBundle *)v39 setStartDate:v40];

              v41 = [v32 endDate];
              [(MOEventBundle *)v39 setEndDate:v41];

              v42 = [v32 endDate];
              v43 = +[MOTime timeForDate:v42 timeZoneManager:v29];
              [(MOEventBundle *)v39 setTime:v43];

              v44 = [[MOAction alloc] initWithActionName:@"Time at Home" actionType:1 actionSubtype:1];
              [(MOEventBundle *)v39 setAction:v44];

              v45 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v46 = [v45 eventIdentifier];
              v47 = [(MOEventBundle *)v39 action];
              [v47 setSourceEventIdentifier:v46];

              v48 = [MOPlace alloc];
              v49 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v50 = [v49 location];
              v51 = [(MOPlace *)v48 initWithPlaceName:@"Home" placeType:1 placeUserType:1 location:v50 locationMode:1 poiCategory:0 distanceToHomeInMiles:-1.0 placeNameConfidence:-1.0 familiarityIndexLOI:0.0];
              [(MOEventBundle *)v39 setPlace:v51];

              v52 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
              v53 = [v52 eventIdentifier];
              v54 = [(MOEventBundle *)v39 place];
              [v54 setSourceEventIdentifier:v53];

              v55 = [(MOEventBundle *)v39 startDate];
              v56 = [(MOEventBundle *)v39 endDate];
              v142 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:v55 endData:v56];

              v138 = [v132 filteredArrayUsingPredicate:v142];
              if ([v138 count])
              {
                *(float *)&double v57 = self->_mediaDurationThreshold;
                v58 = +[MOContextAnnotationUtilities annotateEventBundle:v39 dateIntervalEvents:*(void *)(*(void *)&buf[8] + 40) playbackMediaEvents:v138 mediaDurationThreshold:v57];
                if ([v58 count]) {
                  [(MOEventBundle *)v39 addEvents:v58];
                }
              }
              v59 = [(MOEventBundle *)v39 startDate];
              v60 = [(MOEventBundle *)v39 endDate];
              v141 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v59 endDate:v60];

              v140 = [v131 filteredArrayUsingPredicate:v141];
              uint64_t v61 = *(void *)(*(void *)&buf[8] + 40);
              [(MOTimeAtHomeAnomalyManager *)self emotionAttachmentBundleDurationThreshold];
              *(float *)&double v62 = v62;
              uint64_t v63 = +[MOContextAnnotationUtilities annotateEventBundle:v39 dateIntervalEvents:v61 emotionEvents:v140 bundleDurationThreshold:v62];
              [(MOEventBundle *)v39 addEvents:v63];
              id obja = (id)v63;
              v64 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                v65 = [v32 startDate];
                v66 = [v32 endDate];
                *(_DWORD *)v193 = 138412546;
                *(void *)&v193[4] = v65;
                *(_WORD *)&v193[12] = 2112;
                *(void *)&v193[14] = v66;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "T@H: Created bundle for range %@ to %@", v193, 0x16u);
              }
              *(void *)v193 = 0;
              *(void *)&v193[8] = v193;
              *(void *)&v193[16] = 0x3032000000;
              v194 = __Block_byref_object_copy__14;
              v195 = __Block_byref_object_dispose__14;
              id v196 = (id)objc_opt_new();
              uint64_t v176 = 0;
              v177 = &v176;
              uint64_t v178 = 0x2020000000;
              uint64_t v179 = 0;
              uint64_t v170 = 0;
              v171 = &v170;
              uint64_t v172 = 0x3032000000;
              v173 = __Block_byref_object_copy__14;
              v174 = __Block_byref_object_dispose__14;
              id v175 = (id)objc_opt_new();
              uint64_t v164 = 0;
              v165 = &v164;
              uint64_t v166 = 0x3032000000;
              v167 = __Block_byref_object_copy__14;
              v168 = __Block_byref_object_dispose__14;
              id v169 = 0;
              uint64_t v158 = 0;
              v159 = &v158;
              uint64_t v160 = 0x3032000000;
              v161 = __Block_byref_object_copy__14;
              v162 = __Block_byref_object_dispose__14;
              id v163 = 0;
              fUniverse = self->_fUniverse;
              v157[0] = _NSConcreteStackBlock;
              v157[1] = 3221225472;
              v157[2] = __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_165;
              v157[3] = &unk_1002CB960;
              v157[4] = v193;
              v157[5] = &v176;
              v157[6] = &v170;
              v157[7] = &v164;
              v157[8] = &v158;
              +[MOContextAnnotationUtilities addPhotoResources:v39 universe:fUniverse handler:v157];
              [(MOEventBundle *)v39 setPhotoSource:v177[3]];
              id v68 = [(id)v171[5] copy];
              [(MOEventBundle *)v39 setPhotoTraits:v68];

              double photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
              *(float *)&double photosCurationScoreThreshold = photosCurationScoreThreshold;
              v70 = +[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:*(void *)(*(void *)&v193[8] + 40) withPhotoCurationScore:self->_photosFaceCountThreshold andFaceCount:self->_photosCountThreshold numPhotosThreshold:photosCurationScoreThreshold];
              [(MOEventBundle *)v39 setResources:v70];

              long long v155 = 0u;
              long long v156 = 0u;
              long long v153 = 0u;
              long long v154 = 0u;
              v71 = [(MOEventBundle *)v39 resources];
              id v72 = [v71 countByEnumeratingWithState:&v153 objects:v192 count:16];
              if (v72)
              {
                uint64_t v73 = *(void *)v154;
                float v74 = 0.0;
                do
                {
                  for (j = 0; j != v72; j = (char *)j + 1)
                  {
                    if (*(void *)v154 != v73) {
                      objc_enumerationMutation(v71);
                    }
                    v76 = [*(id *)(*((void *)&v153 + 1) + 8 * (void)j) photoCurationScore];
                    [v76 floatValue];
                    float v78 = v77;

                    float v74 = v74 + v78;
                  }
                  id v72 = [v71 countByEnumeratingWithState:&v153 objects:v192 count:16];
                }
                while (v72);
              }
              else
              {
                float v74 = 0.0;
              }

              v79 = [(MOEventBundle *)v39 resources];
              BOOL v80 = [v79 count] == 0;

              if (!v80)
              {
                v82 = [(MOEventBundle *)v39 resources];
                id v83 = [v82 count];

                float v74 = v74 / (float)(unint64_t)v83;
              }
              *(float *)&double v81 = v74;
              v84 = +[NSNumber numberWithFloat:v81];
              [(MOEventBundle *)v39 addMetaDataForRankForKey:@"PhotosAtHomeCurationScore" value:v84];

              if ([obja count])
              {
                +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v39 withEmotionEvents:obja];
                +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v39 withEmotionEvents:obja];
              }
              uint64_t v85 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 2];
              v86 = [(MOEventBundle *)v39 resources];
              v139 = [v86 filteredArrayUsingPredicate:v85];
              v137 = (void *)v85;

              v87 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 3];
              v88 = [(MOEventBundle *)v39 resources];
              v89 = [v88 filteredArrayUsingPredicate:v87];

              v90 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 16];
              v91 = [(MOEventBundle *)v39 resources];
              v92 = [v91 filteredArrayUsingPredicate:v90];

              +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:v39 withMediaResources:v89 withPhotoResources:v139 withEmotionResources:v92];
              if (v165[5] && v159[5])
              {
                -[MOEventBundle setStartDate:](v39, "setStartDate:");
                v93 = (void *)v165[5];
                if (v93 == (void *)v159[5])
                {
                  v94 = [v93 dateByAddingTimeInterval:5.0];
                  [(MOEventBundle *)v39 setEndDate:v94];
                }
                else
                {
                  -[MOEventBundle setEndDate:](v39, "setEndDate:");
                }
              }
              CFStringRef v190 = @"TimeAtHomeDuration";
              v95 = [v32 patterns];
              v96 = [v95 objectForKeyedSubscript:@"kEventPatternFeatureValue"];
              v191 = v96;
              v97 = +[NSDictionary dictionaryWithObjects:&v191 forKeys:&v190 count:1];
              [(MOEventBundle *)v39 setMetaDataForRank:v97];

              if (+[MOContextAnnotationUtilities isEvergreenBundle:v39])
              {
                uint64_t v98 = 504;
              }
              else
              {
                uint64_t v98 = 501;
              }
              [(MOEventBundle *)v39 setBundleSubType:v98];
              v99 = [(MOEventBundle *)v39 resources];
              BOOL v100 = [v99 count] == 0;

              if (v100) {
                goto LABEL_69;
              }
              long long v151 = 0u;
              long long v152 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              v101 = [(MOEventBundle *)v39 resources];
              id v102 = [v101 countByEnumeratingWithState:&v149 objects:v189 count:16];
              if (!v102)
              {

                goto LABEL_69;
              }
              int v103 = 0;
              uint64_t v104 = *(void *)v150;
              do
              {
                for (k = 0; k != v102; k = (char *)k + 1)
                {
                  if (*(void *)v150 != v104) {
                    objc_enumerationMutation(v101);
                  }
                  if ([*(id *)(*((void *)&v149 + 1) + 8 * (void)k) type] == (id)2) {
                    ++v103;
                  }
                }
                id v102 = [v101 countByEnumeratingWithState:&v149 objects:v189 count:16];
              }
              while (v102);

              v29 = v127;
              if (!v103) {
LABEL_69:
              }
                [(MOEventBundle *)v39 setIsAggregatedAndSuppressed:1];
              [v130 addObject:v39];

              _Block_object_dispose(&v158, 8);
              _Block_object_dispose(&v164, 8);

              _Block_object_dispose(&v170, 8);
              _Block_object_dispose(&v176, 8);
              _Block_object_dispose(v193, 8);
            }
            _Block_object_dispose(buf, 8);

            uint64_t v30 = v144 + 1;
          }
          while ((id)(v144 + 1) != v135);
          id v135 = [v128 countByEnumeratingWithState:&v181 objects:v201 count:16];
          if (!v135)
          {
LABEL_73:

            v106 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              v107 = (objc_class *)objc_opt_class();
              v108 = NSStringFromClass(v107);
              id v109 = [v130 count];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v108;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v109;
              _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "T@H(%@): Event Bundles, %lu", buf, 0x16u);
            }
            id v110 = [v130 copy];
            v118[2](v118, v110, 0);

            goto LABEL_85;
          }
        }
      }
      v113 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no pattern events with complete context available for bundling", buf, 2u);
      }

      v118[2](v118, &__NSArray0__struct, 0);
LABEL_85:
    }
    else
    {
      v112 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no visit events", buf, 2u);
      }

      v118[2](v118, &__NSArray0__struct, 0);
    }
  }
  else
  {
    v111 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no visit pattern events", buf, 2u);
    }

    v118[2](v118, &__NSArray0__struct, 0);
  }
}

void __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      id v6 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "T@H: Found %lu visit events overlapping anomaly time range", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:v3];
  }
}

void __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_165(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a5);
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a6);
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(*(void *)(a1[5] + 8) + 24);
    int v18 = 134218754;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    __int16 v24 = 2048;
    id v25 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "T@H, photoSource, %lu, startDate, %@, endDate, %@, count, %lu", (uint8_t *)&v18, 0x2Au);
  }
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