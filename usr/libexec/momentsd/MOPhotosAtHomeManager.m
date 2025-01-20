@interface MOPhotosAtHomeManager
+ (id)chooseResourcesWithGoodPhotos:(id)a3 withPhotoCurationScore:(float)a4 andFaceCount:(unint64_t)a5 numPhotosThreshold:(unint64_t)a6;
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)fUniverse;
- (MOPhotosAtHomeManager)initWithUniverse:(id)a3;
- (MORoutineServiceManager)routineServiceManager;
- (OS_dispatch_queue)queue;
- (double)emotionAttachmentBundleDurationThreshold;
- (double)photosCurationScoreThreshold;
- (double)photosDistanceFromHomeThreshold;
- (double)photosDurationAtHomeSecThreshold;
- (unint64_t)photosCountThreshold;
- (unint64_t)photosFaceCountThreshold;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7;
- (void)setConfigurationManager:(id)a3;
- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3;
- (void)setPhotosCountThreshold:(unint64_t)a3;
- (void)setPhotosCurationScoreThreshold:(double)a3;
- (void)setPhotosDistanceFromHomeThreshold:(double)a3;
- (void)setPhotosDurationAtHomeSecThreshold:(double)a3;
- (void)setPhotosFaceCountThreshold:(unint64_t)a3;
- (void)setRoutineServiceManager:(id)a3;
@end

@implementation MOPhotosAtHomeManager

- (MOPhotosAtHomeManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MOPhotosAtHomeManager;
  v6 = [(MOPhotosAtHomeManager *)&v28 init];
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
    LODWORD(v23) = 1163984896;
    [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"Photos_DurationAtHomeSecThreshold" withFallback:v23];
    double v25 = v24;
    v7->_photosDurationAtHomeSecThreshold = v25;
    LODWORD(v25) = 1202241536;
    [(MOConfigurationManagerBase *)v7->_configurationManager getFloatSettingForKey:@"EmotionAttachmentTAHBundleDurationThreshold" withFallback:v25];
    v7->_emotionAttachmentBundleDurationThreshold = v26;
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
  v17 = [(MOPhotosAtHomeManager *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
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

void __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002CA140;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 _performAnnotationWithEvents:v2 withPatternEvents:v3 withBundleWindowStart:v4 withBundleWindowEnd:v5 handler:v6];
}

uint64_t __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id v112 = a3;
  id v100 = a4;
  id v107 = a5;
  id v106 = a6;
  v108 = (void (**)(id, void *, void))a7;
  v111 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K = %lu"];
  v110 = +[NSPredicate predicateWithFormat:v111, @"category", 1, @"placeUserType", 1];
  v109 = [v112 filteredArrayUsingPredicate:v110];
  id v101 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v190 = v101;
  v11 = +[NSArray arrayWithObjects:&v190 count:1];
  v119 = [v109 sortedArrayUsingDescriptors:v11];

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = [v119 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "P@H: Found %lu visit events", buf, 0xCu);
  }

  if ([v119 count])
  {
    v99 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
    v98 = [v112 filteredArrayUsingPredicate:v99];
    v97 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
    v116 = [v98 filteredArrayUsingPredicate:v97];
    v114 = objc_opt_new();
    id v113 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v96 = v107;
    v105 = [v113 components:28 fromDate:];
    [v105 setHour:3];
    id v104 = [v113 dateFromComponents:v105];
    id v125 = v104;
    if ([v104 isBeforeDate:v96])
    {
      id v125 = +[NSDate dateWithTimeInterval:v104 sinceDate:86400.0];
    }
    id v95 = v106;
    v103 = [v113 components:28 fromDate:];
    [v103 setHour:3];
    id v102 = [v113 dateFromComponents:v103];
    v118 = v102;
    if ([v102 isAfterDate:v95])
    {
      v118 = +[NSDate dateWithTimeInterval:v102 sinceDate:-86400.0];
    }
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v119 firstObject];
      id v15 = [v14 startDate];
      id v16 = [v119 lastObject];
      v17 = [v16 endDate];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "P@H: Source event time span: range start %@, range end %@", buf, 0x16u);
    }
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v125;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v118;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "P@H: Time span for bundling: range start %@, range end %@", buf, 0x16u);
    }

    if ([v118 isOnOrBefore:v125])
    {
      id v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v125;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v118;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "P@H: Range end is on or before range start so exiting bundling: range start %@, range end %@", buf, 0x16u);
      }

      v108[2](v108, &__NSArray0__struct, 0);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v187 = __Block_byref_object_copy__36;
      v188 = __Block_byref_object_dispose__36;
      id v189 = (id)objc_opt_new();
      uint64_t v173 = 0;
      v174 = &v173;
      uint64_t v175 = 0x3032000000;
      v176 = __Block_byref_object_copy__36;
      v177 = __Block_byref_object_dispose__36;
      id v178 = (id)objc_opt_new();
      uint64_t v167 = 0;
      v168 = &v167;
      uint64_t v169 = 0x3032000000;
      v170 = __Block_byref_object_copy__36;
      v171 = __Block_byref_object_dispose__36;
      id v172 = (id)objc_opt_new();
      v165[0] = 0;
      v165[1] = v165;
      v165[2] = 0x2020000000;
      char v166 = 0;
      uint64_t v161 = 0;
      v162 = &v161;
      uint64_t v163 = 0x2020000000;
      int v164 = 0;
      v124 = +[NSDate dateWithTimeInterval:v125 sinceDate:86400.0];
      while ([v124 isOnOrBefore:v118])
      {
        double photosDurationAtHomeSecThreshold = self->_photosDurationAtHomeSecThreshold;
        v153[0] = _NSConcreteStackBlock;
        v153[1] = 3221225472;
        v153[2] = __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
        v153[3] = &unk_1002D1580;
        v156 = v165;
        v157 = buf;
        id v21 = v125;
        id v154 = v21;
        v158 = &v173;
        id v22 = v124;
        id v155 = v22;
        v159 = &v167;
        v160 = &v161;
        +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:v119 rangeStart:v21 rangeEnd:v22 eventInterval:v153 handler:photosDurationAtHomeSecThreshold];
        id v125 = v22;

        v124 = +[NSDate dateWithTimeInterval:v125 sinceDate:86400.0];
      }
      double v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = [(id)v168[5] count];
        *(_DWORD *)v182 = 134217984;
        *(void *)&v182[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "P@H: Built %lu grouped events", v182, 0xCu);
      }

      if ([(id)v168[5] count])
      {
        id v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = [(id)v168[5] count];
          id v27 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
          id v28 = [(id)v174[5] lastObject];
          *(_DWORD *)v182 = 134218498;
          *(void *)&v182[4] = v26;
          *(_WORD *)&v182[12] = 2112;
          *(void *)&v182[14] = v27;
          *(_WORD *)&v182[22] = 2112;
          v183 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "P@H: Grouped %lu events for range %@ to %@", v182, 0x20u);
        }
        v29 = [(MOPhotosAtHomeManager *)self fUniverse];
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v115 = [v29 getService:v31];

        for (unint64_t i = 0; (unint64_t)[(id)v168[5] count] > i; unint64_t i = v117 + 1)
        {
          v33 = [(id)v168[5] objectAtIndex:i];
          v122 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndex:i];
          v121 = [(id)v174[5] objectAtIndex:i];
          v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          unint64_t v117 = i;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v182 = 138412546;
            *(void *)&v182[4] = v122;
            *(_WORD *)&v182[12] = 2112;
            *(void *)&v182[14] = v121;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "P@H: Annotating grouped events for range %@ to %@", v182, 0x16u);
          }

          v35 = [MOEventBundle alloc];
          v36 = +[NSUUID UUID];
          v37 = +[NSDate date];
          v38 = [(MOEventBundle *)v35 initWithBundleIdentifier:v36 creationDate:v37];

          [(MOEventBundle *)v38 setInterfaceType:7];
          [(MOEventBundle *)v38 setStartDate:v122];
          [(MOEventBundle *)v38 setEndDate:v121];
          v39 = [(MOEventBundle *)v38 startDate];
          v40 = +[MOTime timeForDate:v39 timeZoneManager:v115];
          [(MOEventBundle *)v38 setTime:v40];

          [(MOEventBundle *)v38 setPromptLanguage:@"Photos at Home"];
          v41 = [[MOAction alloc] initWithActionName:@"Photos at Home" actionType:1 actionSubtype:8];
          [(MOEventBundle *)v38 setAction:v41];

          v42 = [v33 firstObject];
          v43 = [v42 eventIdentifier];
          v44 = [(MOEventBundle *)v38 action];
          [v44 setSourceEventIdentifier:v43];

          v45 = [MOPlace alloc];
          v46 = [v33 firstObject];
          v47 = [v46 location];
          v48 = [(MOPlace *)v45 initWithPlaceName:@"Home" placeType:1 placeUserType:1 location:v47 locationMode:1 poiCategory:0 distanceToHomeInMiles:-1.0 placeNameConfidence:-1.0 familiarityIndexLOI:0.0];
          [(MOEventBundle *)v38 setPlace:v48];

          v49 = [v33 firstObject];
          v50 = [v49 eventIdentifier];
          v51 = [(MOEventBundle *)v38 place];
          [v51 setSourceEventIdentifier:v50];

          [(MOEventBundle *)v38 setEvents:v33];
          [(MOEventBundle *)v38 setTimeAtHomeSubType:2];
          [(MOEventBundle *)v38 setBundleSubType:502];
          [(MOEventBundle *)v38 setBundleSuperType:5];
          v52 = [(MOEventBundle *)v38 startDate];
          v53 = [(MOEventBundle *)v38 endDate];
          v120 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v52 endDate:v53];

          v54 = [v116 filteredArrayUsingPredicate:v120];
          [(MOPhotosAtHomeManager *)self emotionAttachmentBundleDurationThreshold];
          *(float *)&double v55 = v55;
          v56 = +[MOContextAnnotationUtilities annotateEventBundle:v38 dateIntervalEvents:v33 emotionEvents:v54 bundleDurationThreshold:v55];
          [(MOEventBundle *)v38 addEvents:v56];
          v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v182 = 138412546;
            *(void *)&v182[4] = v122;
            *(_WORD *)&v182[12] = 2112;
            *(void *)&v182[14] = v121;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "P@H: Created bundle for range %@ to %@", v182, 0x16u);
          }

          *(void *)v182 = 0;
          *(void *)&v182[8] = v182;
          *(void *)&v182[16] = 0x3032000000;
          v183 = __Block_byref_object_copy__36;
          v184 = __Block_byref_object_dispose__36;
          id v185 = (id)objc_opt_new();
          uint64_t v149 = 0;
          v150 = &v149;
          uint64_t v151 = 0x2020000000;
          uint64_t v152 = 0;
          uint64_t v143 = 0;
          v144 = &v143;
          uint64_t v145 = 0x3032000000;
          v146 = __Block_byref_object_copy__36;
          v147 = __Block_byref_object_dispose__36;
          id v148 = (id)objc_opt_new();
          uint64_t v137 = 0;
          v138 = &v137;
          uint64_t v139 = 0x3032000000;
          v140 = __Block_byref_object_copy__36;
          v141 = __Block_byref_object_dispose__36;
          id v142 = 0;
          uint64_t v131 = 0;
          v132 = &v131;
          uint64_t v133 = 0x3032000000;
          v134 = __Block_byref_object_copy__36;
          v135 = __Block_byref_object_dispose__36;
          id v136 = 0;
          fUniverse = self->_fUniverse;
          v130[0] = _NSConcreteStackBlock;
          v130[1] = 3221225472;
          v130[2] = __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_166;
          v130[3] = &unk_1002CB960;
          v130[4] = v182;
          v130[5] = &v149;
          v130[6] = &v143;
          v130[7] = &v137;
          v130[8] = &v131;
          +[MOContextAnnotationUtilities addPhotoResources:v38 universe:fUniverse handler:v130];
          v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            uint64_t v60 = v150[3];
            *(_DWORD *)v180 = 134217984;
            uint64_t v181 = v60;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "P@H,photoSource,%lu", v180, 0xCu);
          }

          [(MOEventBundle *)v38 setPhotoSource:v150[3]];
          id v61 = [(id)v144[5] copy];
          [(MOEventBundle *)v38 setPhotoTraits:v61];

          double photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
          *(float *)&double photosCurationScoreThreshold = photosCurationScoreThreshold;
          v63 = +[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:*(void *)(*(void *)&v182[8] + 40) withPhotoCurationScore:self->_photosFaceCountThreshold andFaceCount:self->_photosCountThreshold numPhotosThreshold:photosCurationScoreThreshold];
          [(MOEventBundle *)v38 setResources:v63];

          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          v64 = [(MOEventBundle *)v38 resources];
          id v65 = [v64 countByEnumeratingWithState:&v126 objects:v179 count:16];
          if (v65)
          {
            uint64_t v66 = *(void *)v127;
            float v67 = 0.0;
            do
            {
              for (j = 0; j != v65; j = (char *)j + 1)
              {
                if (*(void *)v127 != v66) {
                  objc_enumerationMutation(v64);
                }
                v69 = [*(id *)(*((void *)&v126 + 1) + 8 * (void)j) photoCurationScore];
                [v69 floatValue];
                float v71 = v70;

                float v67 = v67 + v71;
              }
              id v65 = [v64 countByEnumeratingWithState:&v126 objects:v179 count:16];
            }
            while (v65);
          }
          else
          {
            float v67 = 0.0;
          }

          v72 = [(MOEventBundle *)v38 resources];
          BOOL v73 = [v72 count] == 0;

          if (!v73)
          {
            v75 = [(MOEventBundle *)v38 resources];
            id v76 = [v75 count];

            float v67 = v67 / (float)(unint64_t)v76;
          }
          *(float *)&double v74 = v67;
          v77 = +[NSNumber numberWithFloat:v74];
          [(MOEventBundle *)v38 addMetaDataForRankForKey:@"PhotosAtHomeCurationScore" value:v77];

          LODWORD(v78) = *((_DWORD *)v162 + 6);
          v79 = +[NSNumber numberWithFloat:v78];
          [(MOEventBundle *)v38 addMetaDataForRankForKey:@"TimeAtHomeDuration" value:v79];

          if ([v56 count])
          {
            +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v38 withEmotionEvents:v56];
            +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v38 withEmotionEvents:v56];
          }
          v80 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 2];
          v81 = [(MOEventBundle *)v38 resources];
          v82 = [v81 filteredArrayUsingPredicate:v80];

          v83 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 16];
          v84 = [(MOEventBundle *)v38 resources];
          v85 = [v84 filteredArrayUsingPredicate:v83];

          +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:v38 withMediaResources:&__NSArray0__struct withPhotoResources:v82 withEmotionResources:v85];
          if (v138[5] && v132[5])
          {
            -[MOEventBundle setStartDate:](v38, "setStartDate:");
            v86 = (void *)v138[5];
            if (v86 == (void *)v132[5])
            {
              v87 = [v86 dateByAddingTimeInterval:5.0];
              [(MOEventBundle *)v38 setEndDate:v87];
            }
            else
            {
              -[MOEventBundle setEndDate:](v38, "setEndDate:");
            }
          }
          v88 = [(MOEventBundle *)v38 resources];
          BOOL v89 = [v88 count] == 0;

          if (!v89) {
            [v114 addObject:v38];
          }

          _Block_object_dispose(&v131, 8);
          _Block_object_dispose(&v137, 8);

          _Block_object_dispose(&v143, 8);
          _Block_object_dispose(&v149, 8);
          _Block_object_dispose(v182, 8);
        }
        v90 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          v91 = (objc_class *)objc_opt_class();
          NSStringFromClass(v91);
          id v92 = (id)objc_claimAutoreleasedReturnValue();
          id v93 = [v114 count];
          *(_DWORD *)v182 = 138412546;
          *(void *)&v182[4] = v92;
          *(_WORD *)&v182[12] = 2048;
          *(void *)&v182[14] = v93;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "P@H(%@): Event Bundles, %lu", v182, 0x16u);
        }
        id v94 = [v114 copy];
        v108[2](v108, v94, 0);
      }
      else
      {
        v108[2](v108, &__NSArray0__struct, 0);
      }

      _Block_object_dispose(&v161, 8);
      _Block_object_dispose(v165, 8);
      _Block_object_dispose(&v167, 8);

      _Block_object_dispose(&v173, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v108[2](v108, &__NSArray0__struct, 0);
  }
}

void __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(void *a1, void *a2, char a3, float a4)
{
  id v7 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3 ^ 1;
  [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:a1[4]];
  [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:a1[5]];
  [*(id *)(*(void *)(a1[9] + 8) + 40) addObject:v7];
  *(float *)(*(void *)(a1[10] + 8) + 24) = a4;
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 count];
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 134218498;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "P@H: Grouped %lu events for range %@ to %@", (uint8_t *)&v12, 0x20u);
  }
}

void __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_166(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
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
  __int16 v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
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
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "P@H, photoSource, %lu, startDate, %@, endDate, %@, count, %lu", (uint8_t *)&v18, 0x2Au);
  }
}

+ (id)chooseResourcesWithGoodPhotos:(id)a3 withPhotoCurationScore:(float)a4 andFaceCount:(unint64_t)a5 numPhotosThreshold:(unint64_t)a6
{
  id v8 = a3;
  id v9 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        __int16 v16 = [v15 photoCurationScore];
        [v16 floatValue];
        float v18 = v17;

        if (v18 >= a4 || (unint64_t)[v15 photoFaceCount] >= a5) {
          [v9 addObject:v15];
        }
        uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [v15 photoFaceCount];
          *(_DWORD *)buf = 134218240;
          double v29 = v18;
          __int16 v30 = 2048;
          id v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "P@H: Photo curationScore, %f, faceCount, %lu", buf, 0x16u);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v12);
  }

  if ((unint64_t)[v9 count] >= a6) {
    id v21 = v9;
  }
  else {
    id v21 = &__NSArray0__struct;
  }

  return v21;
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

- (double)photosDurationAtHomeSecThreshold
{
  return self->_photosDurationAtHomeSecThreshold;
}

- (void)setPhotosDurationAtHomeSecThreshold:(double)a3
{
  self->_double photosDurationAtHomeSecThreshold = a3;
}

- (unint64_t)photosCountThreshold
{
  return self->_photosCountThreshold;
}

- (void)setPhotosCountThreshold:(unint64_t)a3
{
  self->_photosCountThreshold = a3;
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