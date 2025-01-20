@interface MOEventData
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)integerKeys;
+ (id)supportedMetricKeys;
+ (void)defineClassCollections;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MOEvent)event;
- (MOEventData)initWithEvent:(id)a3 islandID:(id)a4 subDate:(id)a5;
- (MOEventData)initWithLoggingEnabled:(BOOL)a3;
- (NSDate)subDate;
- (NSNumber)islandID;
- (unint64_t)provider;
- (void)setEvent:(id)a3;
- (void)setIslandID:(id)a3;
- (void)setProvider:(unint64_t)a3;
- (void)setSubDate:(id)a3;
- (void)setValues;
@end

@implementation MOEventData

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_1 != -1) {
    dispatch_once(&defineClassCollections_onceToken_1, &__block_literal_global_14);
  }
}

void __37__MOEventData_defineClassCollections__block_invoke(id a1)
{
  v1 = (void *)videoBundleIds;
  videoBundleIds = (uint64_t)&off_1002F8E28;

  v2 = (void *)mixedAudioBundleIds;
  mixedAudioBundleIds = (uint64_t)&off_1002F8E40;

  v3 = (void *)poiCategoryDictionary;
  poiCategoryDictionary = (uint64_t)&off_1002F9A50;
}

- (MOEventData)initWithEvent:(id)a3 islandID:(id)a4 subDate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventData initWithEvent:islandID:subDate:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = +[NSAssertionHandler currentHandler];
    v25 = v24;
    CFStringRef v26 = @"Invalid parameter not satisfying: event";
    SEL v27 = a2;
    v28 = self;
    uint64_t v29 = 97;
    goto LABEL_16;
  }
  if (!v11)
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOEventData initWithEvent:islandID:subDate:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    v24 = +[NSAssertionHandler currentHandler];
    v25 = v24;
    CFStringRef v26 = @"Invalid parameter not satisfying: islandID != nil";
    SEL v27 = a2;
    v28 = self;
    uint64_t v29 = 98;
    goto LABEL_16;
  }
  if (!v12)
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MOEventData initWithEvent:islandID:subDate:](v38, v39, v40, v41, v42, v43, v44, v45);
    }

    v24 = +[NSAssertionHandler currentHandler];
    v25 = v24;
    CFStringRef v26 = @"Invalid parameter not satisfying: subDate";
    SEL v27 = a2;
    v28 = self;
    uint64_t v29 = 99;
LABEL_16:
    [v24 handleFailureInMethod:v27 object:v28 file:@"MOEventData.m" lineNumber:v29 description:v26];

    v15 = 0;
    goto LABEL_17;
  }
  v14 = [(MOEventData *)self initWithLoggingEnabled:1];
  if (v14)
  {
    v14->_provider = (unint64_t)[v10 provider];
    objc_storeStrong((id *)&v14->_event, a3);
    objc_storeStrong((id *)&v14->_islandID, a4);
    objc_storeStrong((id *)&v14->_subDate, a5);
  }
  self = v14;
  v15 = self;
LABEL_17:

  return v15;
}

- (MOEventData)initWithLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  +[MOEventData defineClassCollections];
  v40.receiver = self;
  v40.super_class = (Class)MOEventData;
  v5 = [(MOMetric *)&v40 initWithLoggingEnabled:v3];
  if (v5)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v6 = [(id)objc_opt_class() BOOLeanKeys];
    id v7 = [v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v10);
          id v12 = [(MOMetric *)v5 metrics];
          [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:v11];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v8);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v13 = [(id)objc_opt_class() integerKeys];
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v17);
          uint64_t v19 = [(MOMetric *)v5 metrics];
          [v19 setObject:&off_1002F52A0 forKeyedSubscript:v18];

          uint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v15);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v20 = [objc_opt_class() bucketedKeys];
    id v21 = [v20 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v24);
          CFStringRef v26 = [(MOMetric *)v5 metrics];
          [v26 setObject:&off_1002F52A0 forKeyedSubscript:v25];

          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v22);
    }
  }
  return v5;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:@"cooccurrenceCheck", @"visitLOI", @"photoInferenceMade", @"isShared", @"isFavorited", 0];
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"islandID", @"eventID", @"sigContactPersonID", @"interactionContactScore", @"numSigContacts", @"numTexts", @"numAudioCalls", @"numVideoCalls", @"numOtherContactType", @"numMusic", @"numPodcast", @"numAudioBook", @"numAudio", @"numITunesRadio", @"numITunesU", @"numVideo", @"numOther",
           @"mediaRepetitions",
           @"visitMode",
           @"visitPOI",
           0);
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"provider", @"category", @"startTimeID", @"endTimeID", @"visitCategory", @"photoInference", @"workoutType", @"workoutTypeIHA", @"sourceApp", @"mediaType", @"mediaGenre", @"sensedLatencyBucketed", @"realLatencyBucketed", @"DayIDSubDate", @"HourIDSubDate", @"SubDateYear", @"SubDateMonth",
           @"SubDateDay",
           @"SubDateMinute",
           @"durationAudioCalls",
           @"durationVideoCalls",
           @"durationLeisureMedia",
           @"durationMediaOnRepeat",
           @"durationMusic",
           @"durationPodcast",
           @"durationAudioBook",
           @"durationAudio",
           @"durationITunesRadio",
           @"durationITunesU",
           @"durationVideo",
           @"durationOther",
           @"startTimeIDlongestDurationVideo",
           @"endTimeIDlongestDurationVideo",
           @"startTimeIDlongestDurationCall",
           @"endTimeIDlongestDurationCall",
           0);
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() integerKeys];
  BOOL v3 = +[NSMutableSet setWithSet:v2];

  v4 = [(id)objc_opt_class() BOOLeanKeys];
  v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  v6 = [(id)objc_opt_class() bucketedKeys];
  id v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  switch(self->_provider)
  {
    case 1uLL:
      v5 = MOAnalyticsEventMOEventDataWorkout;
      break;
    case 2uLL:
      v5 = MOAnalyticsEventMOEventDataStorytelling;
      break;
    case 3uLL:
      v5 = MOAnalyticsEventMOEventDataProactive;
      break;
    case 4uLL:
      v5 = MOAnalyticsEventMOEventDataRoutine;
      break;
    default:
      v5 = (char *)[(id)objc_opt_class() event];
      break;
  }
  [(MOEventData *)self setValues];
  v7.receiver = self;
  v7.super_class = (Class)MOEventData;
  return [(MOMetric *)&v7 submitMetricsWithError:a3 forEvent:v5];
}

- (void)setValues
{
  v336 = +[MOMetric binsFromStart:&off_1002F4E80 toEnd:&off_1002F9740 gap:&off_1002F9750];
  v324 = +[MOMetric binsFromStart:&off_1002F4E80 toEnd:&off_1002F9760 gap:&off_1002F9770];
  uint64_t v3 = +[MOMetric binsFromStart:&off_1002F4E80 toEnd:&off_1002F9780 gap:&off_1002F9790];
  v322 = +[MOMetric binsFromStart:&off_1002F4E80 toEnd:&off_1002F9780 gap:&off_1002F97A0];
  v323 = +[MOMetric binsFromStart:&off_1002F4E80 toEnd:&off_1002F9780 gap:&off_1002F97B0];
  v320 = +[NSCalendar currentCalendar];
  v4 = [v320 components:764 fromDate:self->_subDate];
  id v5 = [v4 year];
  id v6 = [v4 month];
  id v340 = [v4 day];
  id v7 = [v4 weekday];
  id v8 = [v4 hour];
  id v9 = [v4 minute];
  v319 = v4;
  uint64_t v10 = (uint64_t)((double)(uint64_t)v9 * 60.0 + (double)(uint64_t)v8 * 3600.0 + (double)(uint64_t)[v4 second]);
  uint64_t v11 = +[NSNumber numberWithInteger:v7];
  id v12 = [(MOMetric *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"DayIDSubDate"];

  v13 = +[NSNumber numberWithLong:v10];
  v321 = (void *)v3;
  uint64_t v14 = v3;
  id v15 = self;
  uint64_t v16 = +[MOMetric binForNumber:v13 bins:v14];
  uint64_t v17 = [(MOMetric *)self metrics];
  [v17 setObject:v16 forKeyedSubscript:@"HourIDSubDate"];

  uint64_t v18 = +[NSNumber numberWithInteger:v5];
  uint64_t v19 = [(MOMetric *)self metrics];
  [v19 setObject:v18 forKeyedSubscript:@"SubDateYear"];

  uint64_t v20 = +[NSNumber numberWithInteger:v6];
  id v21 = [(MOMetric *)self metrics];
  [v21 setObject:v20 forKeyedSubscript:@"SubDateMonth"];

  id v22 = +[NSNumber numberWithInteger:v340];
  uint64_t v23 = [(MOMetric *)self metrics];
  [v23 setObject:v22 forKeyedSubscript:@"SubDateDay"];

  v24 = +[NSNumber numberWithInteger:v9];
  uint64_t v25 = [(MOMetric *)self metrics];
  [v25 setObject:v24 forKeyedSubscript:@"SubDateMinute"];

  CFStringRef v26 = +[NSNumber numberWithUnsignedInteger:[(MOEvent *)self->_event provider]];
  SEL v27 = [(MOMetric *)self metrics];
  [v27 setObject:v26 forKeyedSubscript:@"provider"];

  long long v28 = +[NSNumber numberWithUnsignedInteger:[(MOEvent *)self->_event category]];
  long long v29 = [(MOMetric *)self metrics];
  [v29 setObject:v28 forKeyedSubscript:@"category"];

  subDate = self->_subDate;
  long long v31 = [(MOEvent *)self->_event startDate];
  [(NSDate *)subDate timeIntervalSinceDate:v31];
  long long v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  long long v33 = +[MOMetric binForNumber:v32 bins:v336];
  long long v34 = [(MOMetric *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"startTimeID"];

  long long v35 = self->_subDate;
  long long v36 = [(MOEvent *)self->_event endDate];
  [(NSDate *)v35 timeIntervalSinceDate:v36];
  long long v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  long long v38 = +[MOMetric binForNumber:v37 bins:v336];
  long long v39 = [(MOMetric *)self metrics];
  [v39 setObject:v38 forKeyedSubscript:@"endTimeID"];

  islandID = self->_islandID;
  uint64_t v41 = [(MOMetric *)self metrics];
  [v41 setObject:islandID forKeyedSubscript:@"islandID"];

  uint64_t v42 = +[NSNumber numberWithUnsignedInteger:[(MOEvent *)self->_event hash] % 0x2710];
  uint64_t v43 = [(MOMetric *)self metrics];
  [v43 setObject:v42 forKeyedSubscript:@"eventID"];

  uint64_t v44 = +[NSNumber numberWithInt:[(NSNumber *)self->_islandID intValue] > 0];
  uint64_t v45 = [(MOMetric *)self metrics];
  [v45 setObject:v44 forKeyedSubscript:@"cooccurrenceCheck"];

  v46 = [(MOEvent *)self->_event endDate];

  if (v46)
  {
    v47 = [(MOEvent *)self->_event creationDate];

    if (v47)
    {
      v48 = [(MOEvent *)self->_event creationDate];
      v49 = [(MOEvent *)self->_event endDate];
      [v48 timeIntervalSinceDate:v49];
      double v51 = v50;

      v52 = +[NSNumber numberWithDouble:v51];
      v53 = +[MOMetric binForNumber:v52 bins:v324];
      v54 = [(MOMetric *)self metrics];
      [v54 setObject:v53 forKeyedSubscript:@"sensedLatencyBucketed"];
    }
    v55 = [(MOEvent *)self->_event sourceCreationDate];

    if (v55)
    {
      v56 = [(MOEvent *)self->_event sourceCreationDate];
      v57 = [(MOEvent *)self->_event endDate];
      [v56 timeIntervalSinceDate:v57];
      double v59 = v58;

      v60 = +[NSNumber numberWithDouble:v59];
      v61 = +[MOMetric binForNumber:v60 bins:v324];
      v62 = [(MOMetric *)self metrics];
      [v62 setObject:v61 forKeyedSubscript:@"realLatencyBucketed"];
    }
  }
  switch(self->_provider)
  {
    case 1uLL:
      v63 = [(MOEvent *)self->_event workoutType];
      id v64 = +[HKWorkout _workoutActivityTypeFromString:v63];

      v65 = +[NSNumber numberWithUnsignedInteger:v64];
      v66 = [(MOMetric *)self metrics];
      [v66 setObject:v65 forKeyedSubscript:@"workoutType"];

      if (objc_opt_class())
      {
        v67 = +[MCProfileConnection sharedConnection];
        unsigned int v68 = [v67 isHealthDataSubmissionAllowed];

        if (v68)
        {
          v69 = +[NSNumber numberWithUnsignedInteger:v64];
          v70 = [(MOMetric *)self metrics];
          [v70 setObject:v69 forKeyedSubscript:@"workoutTypeIHA"];
        }
      }
      goto LABEL_177;
    case 2uLL:
      v342 = +[MOPhotoMomentTags getInferenceTagMap];
      long long v348 = 0u;
      long long v349 = 0u;
      long long v350 = 0u;
      long long v351 = 0u;
      v325 = self;
      v108 = [(MOEvent *)self->_event extendedAttributes];
      v109 = [v108 photoMomentInferences];

      id obja = [v109 countByEnumeratingWithState:&v348 objects:v361 count:16];
      if (obja)
      {
        int v110 = 0;
        id v329 = v109;
        uint64_t v331 = *(void *)v349;
        while (1)
        {
          v111 = 0;
          if (v110 <= 1) {
            int v112 = 1;
          }
          else {
            int v112 = v110;
          }
          unint64_t v338 = (v112 - v110);
          do
          {
            if (*(void *)v349 != v331) {
              objc_enumerationMutation(v329);
            }
            v113 = [*(id *)(*((void *)&v348 + 1) + 8 * (void)v111) lowercaseString];
            v114 = v113;
            if (v111 == (void *)v338)
            {

              goto LABEL_74;
            }
            long long v346 = 0u;
            long long v347 = 0u;
            long long v344 = 0u;
            long long v345 = 0u;
            id v115 = v342;
            id v116 = [v115 countByEnumeratingWithState:&v344 objects:v360 count:16];
            if (v116)
            {
              id v117 = v116;
              uint64_t v118 = *(void *)v345;
              while (2)
              {
                for (i = 0; i != v117; i = (char *)i + 1)
                {
                  if (*(void *)v345 != v118) {
                    objc_enumerationMutation(v115);
                  }
                  uint64_t v120 = *(void *)(*((void *)&v344 + 1) + 8 * i);
                  v121 = [v115 objectForKeyedSubscript:v120];
                  v122 = [v121 lowercaseString];
                  if ([v114 containsString:v122])
                  {
                    v123 = [(MOMetric *)v325 metrics];
                    [v123 setObject:v120 forKeyedSubscript:@"photoInference"];

                    goto LABEL_67;
                  }
                }
                id v117 = [v115 countByEnumeratingWithState:&v344 objects:v360 count:16];
                if (v117) {
                  continue;
                }
                break;
              }
            }
LABEL_67:
            ++v110;

            v111 = (char *)v111 + 1;
          }
          while (v111 != obja);
          id obja = [v329 countByEnumeratingWithState:&v348 objects:v361 count:16];
          if (!obja)
          {

            if (!v110) {
              goto LABEL_81;
            }
LABEL_74:
            v129 = &__kCFBooleanTrue;
            goto LABEL_82;
          }
        }
      }

LABEL_81:
      v129 = &__kCFBooleanFalse;
LABEL_82:
      v135 = [(MOMetric *)v325 metrics];
      [v135 setObject:v129 forKeyedSubscript:@"photoInferenceMade"];

      v136 = [(MOMetric *)v325 metrics];
      [v136 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isShared"];

      v137 = [(MOMetric *)v325 metrics];
      [v137 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isFavorited"];

      goto LABEL_177;
    case 3uLL:
      if ((id)[(MOEvent *)self->_event category] == (id)10)
      {
        long long v358 = 0u;
        long long v359 = 0u;
        long long v356 = 0u;
        long long v357 = 0u;
        id obj = [(MOEvent *)self->_event interactions];
        id v71 = [obj countByEnumeratingWithState:&v356 objects:v363 count:16];
        if (v71)
        {
          id v72 = v71;
          unsigned int v314 = 0;
          unsigned int v317 = 0;
          uint64_t v327 = 0;
          uint64_t v73 = 0;
          int v74 = 0;
          uint64_t v75 = *(void *)v357;
          double v76 = 0.0;
          double v77 = 0.0;
          double v78 = 0.0;
          do
          {
            v79 = 0;
            id v330 = v72;
            do
            {
              if (*(void *)v357 != v75) {
                objc_enumerationMutation(obj);
              }
              v80 = *(void **)(*((void *)&v356 + 1) + 8 * (void)v79);
              v81 = [v80 bundleId];
              unsigned __int8 v82 = [v81 containsString:@"com.apple."];

              if (v82)
              {
                HIDWORD(v327) = 1;
              }
              else
              {
                v83 = [v80 bundleId];
                BOOL v84 = v83 != 0;

                v74 |= v84;
              }
              if (![v80 mechanism]
                || [v80 mechanism] == (id)8
                || [v80 mechanism] == (id)9
                || [v80 mechanism] == (id)11
                || [v80 mechanism] == (id)16)
              {
                uint64_t v73 = (v73 + 1);
                v85 = [v80 endDate];
                v86 = [v80 startDate];
                [v85 timeIntervalSinceDate:v86];
                double v88 = v87;

                double v78 = v78 + v88;
              }
              else if ([v80 mechanism] == (id)12 || objc_msgSend(v80, "mechanism") == (id)17)
              {
                LODWORD(v327) = v327 + 1;
                v103 = [v80 endDate];
                v104 = [v80 startDate];
                [v103 timeIntervalSinceDate:v104];
                double v106 = v105;

                double v77 = v77 + v106;
              }
              else if ([v80 mechanism] == (id)1 {
                     || [v80 mechanism] == (id)2
              }
                     || [v80 mechanism] == (id)3
                     || [v80 mechanism] == (id)4
                     || [v80 mechanism] == (id)13)
              {
                ++v317;
              }
              else
              {
                ++v314;
              }
              if (![v80 mechanism]
                || [v80 mechanism] == (id)8
                || [v80 mechanism] == (id)9
                || [v80 mechanism] == (id)11
                || [v80 mechanism] == (id)16
                || [v80 mechanism] == (id)12
                || [v80 mechanism] == (id)17)
              {
                v89 = [v80 endDate];
                v90 = [v80 startDate];
                [v89 timeIntervalSinceDate:v90];
                double v92 = v91;

                if (v92 > v76)
                {
                  int v337 = v74;
                  v93 = v15->_subDate;
                  [v80 startDate];
                  v94 = unsigned int v341 = v73;
                  [(NSDate *)v93 timeIntervalSinceDate:v94];
                  v95 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  v96 = +[MOMetric binForNumber:v95 bins:v336];
                  v97 = [(MOMetric *)v15 metrics];
                  [v97 setObject:v96 forKeyedSubscript:@"startTimeIDlongestDurationCall"];

                  int v74 = v337;
                  v98 = v15->_subDate;
                  v99 = [v80 endDate];
                  [(NSDate *)v98 timeIntervalSinceDate:v99];
                  v100 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                  id v72 = v330;
                  v101 = +[MOMetric binForNumber:v100 bins:v336];
                  v102 = [(MOMetric *)v15 metrics];
                  [v102 setObject:v101 forKeyedSubscript:@"endTimeIDlongestDurationCall"];

                  uint64_t v73 = v341;
                  double v76 = v92;
                }
              }
              v79 = (char *)v79 + 1;
            }
            while (v72 != v79);
            id v107 = [obj countByEnumeratingWithState:&v356 objects:v363 count:16];
            id v72 = v107;
          }
          while (v107);
        }
        else
        {
          unsigned int v314 = 0;
          unsigned int v317 = 0;
          uint64_t v327 = 0;
          uint64_t v73 = 0;
          int v74 = 0;
          double v77 = 0.0;
          double v78 = 0.0;
        }

        v153 = +[NSNumber numberWithInt:v73];
        v154 = [(MOMetric *)v15 metrics];
        [v154 setObject:v153 forKeyedSubscript:@"numAudioCalls"];

        v155 = +[NSNumber numberWithDouble:v78];
        v156 = +[MOMetric binForNumber:v155 bins:v322];
        v157 = [(MOMetric *)v15 metrics];
        [v157 setObject:v156 forKeyedSubscript:@"durationAudioCalls"];

        v158 = +[NSNumber numberWithInt:v327];
        v159 = [(MOMetric *)v15 metrics];
        [v159 setObject:v158 forKeyedSubscript:@"numVideoCalls"];

        v160 = +[NSNumber numberWithDouble:v77];
        v161 = +[MOMetric binForNumber:v160 bins:v322];
        v162 = [(MOMetric *)v15 metrics];
        [v162 setObject:v161 forKeyedSubscript:@"durationVideoCalls"];

        v163 = +[NSNumber numberWithInt:v317];
        v164 = [(MOMetric *)v15 metrics];
        [v164 setObject:v163 forKeyedSubscript:@"numTexts"];

        v165 = +[NSNumber numberWithInt:v314];
        v166 = [(MOMetric *)v15 metrics];
        [v166 setObject:v165 forKeyedSubscript:@"numOtherContactType"];

        v167 = [(MOEvent *)v15->_event interactionScoredContact];
        v168 = [v167 contact];
        v169 = [v168 identifier];
        unint64_t v170 = (unint64_t)[v169 hash] % 0x2710;

        v171 = +[NSNumber numberWithUnsignedInteger:v170];
        v172 = [(MOMetric *)v15 metrics];
        [v172 setObject:v171 forKeyedSubscript:@"sigContactPersonID"];

        v173 = [(MOEvent *)v15->_event interactionContactScore];
        [v173 floatValue];
        *(float *)&double v175 = v174 * 100.0;
        v140 = +[NSNumber numberWithFloat:v175];

        v176 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v140 intValue]);
        v177 = [(MOMetric *)v15 metrics];
        [v177 setObject:v176 forKeyedSubscript:@"interactionContactScore"];

        v178 = [(MOEvent *)v15->_event interactionContacts];
        v179 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v178 count]);
        v180 = [(MOMetric *)v15 metrics];
        [v180 setObject:v179 forKeyedSubscript:@"numSigContacts"];

        int v181 = v74 ^ 1;
        if (((HIDWORD(v327) ^ 1) & 1) == 0 && (v181 & 1) == 0)
        {
          v182 = [(MOMetric *)v15 metrics];
          [v182 setObject:&off_1002F5300 forKeyedSubscript:@"sourceApp"];
        }
        if (((HIDWORD(v327) | v181) & 1) == 0)
        {
          v183 = [(MOMetric *)v15 metrics];
          [v183 setObject:&off_1002F52E8 forKeyedSubscript:@"sourceApp"];
        }
        if (((HIDWORD(v327) ^ 1 | v74) & 1) == 0)
        {
          v184 = [(MOMetric *)v15 metrics];
          [v184 setObject:&off_1002F52B8 forKeyedSubscript:@"sourceApp"];
        }
        if (((HIDWORD(v327) | v74) & 1) == 0)
        {
          v185 = [(MOMetric *)v15 metrics];
          [v185 setObject:&off_1002F5330 forKeyedSubscript:@"sourceApp"];
        }
      }
      else
      {
        uint64_t v130 = [(MOEvent *)self->_event mediaPlayerBundleId];
        if (v130)
        {
          v131 = (void *)v130;
          v132 = [(MOEvent *)self->_event mediaPlayerBundleId];
          unsigned int v133 = [v132 containsString:@"com.apple."];

          if (v133)
          {
            v134 = [(MOMetric *)self metrics];
            [v134 setObject:&off_1002F52B8 forKeyedSubscript:@"sourceApp"];

            goto LABEL_103;
          }
        }
        v138 = [(MOEvent *)self->_event mediaPlayerBundleId];

        v139 = [(MOMetric *)self metrics];
        v140 = v139;
        if (v138) {
          v141 = &off_1002F52E8;
        }
        else {
          v141 = &off_1002F5330;
        }
        [v139 setObject:v141 forKeyedSubscript:@"sourceApp"];
      }

LABEL_103:
      v186 = [(MOEvent *)v15->_event mediaGenre];

      if (v186)
      {
        v187 = [(MOEvent *)v15->_event mediaGenre];
        v188 = [v187 lowercaseString];

        if ([v188 containsString:@"alternative"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F52B8;
        }
        else if ([v188 containsString:@"blues"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F52D0;
        }
        else if ([v188 containsString:@"children"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F52E8;
        }
        else if (([v188 containsString:@"christian"] & 1) != 0 {
               || [v188 containsString:@"gospel"])
        }
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5300;
        }
        else if ([v188 containsString:@"classical"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5318;
        }
        else if ([v188 containsString:@"comedy"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5348;
        }
        else if ([v188 containsString:@"country"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5360;
        }
        else if ([v188 containsString:@"dance"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5378;
        }
        else if ([v188 containsString:@"electronic"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5390;
        }
        else if ([v188 containsString:@"hip"] {
               && [v188 containsString:@"hop"])
        }
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F53A8;
        }
        else if ([v188 containsString:@"rap"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F53C0;
        }
        else if ([v188 containsString:@"jazz"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F53D8;
        }
        else if ([v188 containsString:@"pop"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F53F0;
        }
        else if ([v188 containsString:@"latin"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5408;
        }
        else if ([v188 containsString:@"classic"] {
               && [v188 containsString:@"rock"])
        }
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5420;
        }
        else if ([v188 containsString:@"rock"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5438;
        }
        else if (([v188 containsString:@"r&b"] & 1) != 0 {
               || [v188 containsString:@"rb"])
        }
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5450;
        }
        else if ([v188 containsString:@"soul"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5468;
        }
        else if ([v188 containsString:@"reggae"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5480;
        }
        else if ([v188 containsString:@"singer"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5498;
        }
        else if ([v188 containsString:@"songwriter"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F54B0;
        }
        else if ([v188 containsString:@"sound"] {
               && [v188 containsString:@"track"])
        }
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F54C8;
        }
        else if ([v188 containsString:@"worldwide"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F54E0;
        }
        else if ([v188 containsString:@"hits"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F54F8;
        }
        else if ([v188 containsString:@"oldie"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5510;
        }
        else if ([v188 containsString:@"indie"])
        {
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          v191 = &off_1002F5528;
        }
        else
        {
          unsigned int v311 = [v188 containsString:@"metal"];
          v189 = [(MOMetric *)v15 metrics];
          v190 = v189;
          if (v311) {
            v191 = &off_1002F5540;
          }
          else {
            v191 = &off_1002F5558;
          }
        }
        [v189 setObject:v191 forKeyedSubscript:@"mediaGenre"];
      }
      else
      {
        v188 = [(MOMetric *)v15 metrics];
        [v188 setObject:&off_1002F5330 forKeyedSubscript:@"mediaGenre"];
      }

      v193 = [(MOEvent *)v15->_event mediaType];

      if (v193)
      {
        v194 = [(MOEvent *)v15->_event mediaType];
        v195 = [v194 lowercaseString];

        if ([v195 containsString:@"music"])
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F52B8;
        }
        else if ([v195 containsString:@"podcast"])
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F52D0;
        }
        else if ([v195 containsString:@"audio"] {
               && [v195 containsString:@"book"])
        }
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F52E8;
        }
        else if ([v195 containsString:@"audio"])
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F5348;
        }
        else if ([v195 containsString:@"itune"] {
               && [v195 containsString:@"radio"])
        }
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F5318;
        }
        else if ([v195 containsString:@"itune"])
        {
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          v198 = &off_1002F5300;
        }
        else
        {
          unsigned int v310 = [v195 containsString:@"video"];
          v196 = [(MOMetric *)v15 metrics];
          v197 = v196;
          if (v310) {
            v198 = &off_1002F5360;
          }
          else {
            v198 = &off_1002F5378;
          }
        }
        [v196 setObject:v198 forKeyedSubscript:@"mediaType"];
      }
      else
      {
        v195 = [(MOMetric *)v15 metrics];
        [v195 setObject:&off_1002F5330 forKeyedSubscript:@"mediaType"];
      }

      if ((id)[(MOEvent *)v15->_event category] == (id)4)
      {
        v199 = [(MOEvent *)v15->_event mediaSumTimePlayed];
        v200 = +[MOMetric binForNumber:v199 bins:v323];
        v201 = [(MOMetric *)v15 metrics];
        [v201 setObject:v200 forKeyedSubscript:@"durationLeisureMedia"];
      }
      if ((id)[(MOEvent *)v15->_event category] == (id)3)
      {
        v202 = [(MOEvent *)v15->_event mediaSumTimePlayed];
        v203 = +[MOMetric binForNumber:v202 bins:v323];
        v204 = [(MOMetric *)v15 metrics];
        [v204 setObject:v203 forKeyedSubscript:@"durationMediaOnRepeat"];

        v205 = [(MOEvent *)v15->_event mediaRepetitions];
        v206 = [(MOMetric *)v15 metrics];
        [v206 setObject:v205 forKeyedSubscript:@"mediaRepetitions"];
      }
      if ((id)[(MOEvent *)v15->_event category] != (id)6) {
        goto LABEL_177;
      }
      long long v354 = 0u;
      long long v355 = 0u;
      long long v352 = 0u;
      long long v353 = 0u;
      v326 = v15;
      v207 = [(MOEvent *)v15->_event mediaPlaySessions];
      id v208 = [v207 countByEnumeratingWithState:&v352 objects:v362 count:16];
      if (!v208)
      {
        unsigned int objb = 0;
        unsigned int v332 = 0;
        uint64_t v328 = 0;
        unsigned int v339 = 0;
        unsigned int v313 = 0;
        unsigned int v343 = 0;
        uint64_t v210 = 0;
        double v213 = 0.0;
        double v214 = 0.0;
        double v215 = 0.0;
        double v216 = 0.0;
        double v318 = 0.0;
        double v217 = 0.0;
        double v218 = 0.0;
        double v312 = 0.0;
LABEL_175:

        v271 = +[NSNumber numberWithInt:v210];
        v272 = [(MOMetric *)v326 metrics];
        [v272 setObject:v271 forKeyedSubscript:@"numMusic"];

        v273 = +[NSNumber numberWithDouble:v213];
        v274 = +[MOMetric binForNumber:v273 bins:v323];
        v275 = [(MOMetric *)v326 metrics];
        [v275 setObject:v274 forKeyedSubscript:@"durationMusic"];

        v276 = +[NSNumber numberWithInt:v343];
        v277 = [(MOMetric *)v326 metrics];
        [v277 setObject:v276 forKeyedSubscript:@"numPodcast"];

        v278 = +[NSNumber numberWithDouble:v214];
        v279 = +[MOMetric binForNumber:v278 bins:v323];
        v280 = [(MOMetric *)v326 metrics];
        [v280 setObject:v279 forKeyedSubscript:@"durationPodcast"];

        v281 = +[NSNumber numberWithInt:objb];
        v282 = [(MOMetric *)v326 metrics];
        [v282 setObject:v281 forKeyedSubscript:@"numAudioBook"];

        v283 = +[NSNumber numberWithDouble:v215];
        v284 = +[MOMetric binForNumber:v283 bins:v323];
        v285 = [(MOMetric *)v326 metrics];
        [v285 setObject:v284 forKeyedSubscript:@"durationAudioBook"];

        v286 = +[NSNumber numberWithInt:v339];
        v287 = [(MOMetric *)v326 metrics];
        [v287 setObject:v286 forKeyedSubscript:@"numAudio"];

        v288 = +[NSNumber numberWithDouble:v217];
        v289 = +[MOMetric binForNumber:v288 bins:v323];
        v290 = [(MOMetric *)v326 metrics];
        [v290 setObject:v289 forKeyedSubscript:@"durationAudio"];

        v291 = +[NSNumber numberWithInt:v328];
        v292 = [(MOMetric *)v326 metrics];
        [v292 setObject:v291 forKeyedSubscript:@"numITunesRadio"];

        v293 = +[NSNumber numberWithDouble:v318];
        v294 = +[MOMetric binForNumber:v293 bins:v323];
        v295 = [(MOMetric *)v326 metrics];
        [v295 setObject:v294 forKeyedSubscript:@"durationITunesRadio"];

        v296 = +[NSNumber numberWithInt:v332];
        v297 = [(MOMetric *)v326 metrics];
        [v297 setObject:v296 forKeyedSubscript:@"numITunesU"];

        v298 = +[NSNumber numberWithDouble:v216];
        v299 = +[MOMetric binForNumber:v298 bins:v323];
        v300 = [(MOMetric *)v326 metrics];
        [v300 setObject:v299 forKeyedSubscript:@"durationITunesU"];

        v301 = +[NSNumber numberWithInt:HIDWORD(v328)];
        v302 = [(MOMetric *)v326 metrics];
        [v302 setObject:v301 forKeyedSubscript:@"numVideo"];

        v303 = +[NSNumber numberWithDouble:v218];
        v304 = +[MOMetric binForNumber:v303 bins:v323];
        v305 = [(MOMetric *)v326 metrics];
        [v305 setObject:v304 forKeyedSubscript:@"durationVideo"];

        v306 = +[NSNumber numberWithInt:v313];
        v307 = [(MOMetric *)v326 metrics];
        [v307 setObject:v306 forKeyedSubscript:@"numOther"];

        v125 = +[NSNumber numberWithDouble:v312];
        v308 = +[MOMetric binForNumber:v125 bins:v323];
        v309 = [(MOMetric *)v326 metrics];
        [v309 setObject:v308 forKeyedSubscript:@"durationOther"];

        goto LABEL_176;
      }
      id v209 = v208;
      unsigned int objb = 0;
      unsigned int v332 = 0;
      uint64_t v328 = 0;
      unsigned int v339 = 0;
      unsigned int v313 = 0;
      unsigned int v343 = 0;
      uint64_t v210 = 0;
      uint64_t v211 = *(void *)v353;
      double v212 = 0.0;
      double v213 = 0.0;
      double v214 = 0.0;
      double v215 = 0.0;
      double v216 = 0.0;
      double v318 = 0.0;
      double v217 = 0.0;
      double v218 = 0.0;
      double v312 = 0.0;
LABEL_142:
      uint64_t v219 = 0;
      while (1)
      {
        if (*(void *)v353 != v211) {
          objc_enumerationMutation(v207);
        }
        v220 = *(void **)(*((void *)&v352 + 1) + 8 * v219);
        v221 = [v220 mediaType];
        v222 = [v221 lowercaseString];

        if ([v222 containsString:@"music"]) {
          break;
        }
        v223 = (void *)mixedAudioBundleIds;
        v224 = [v220 bundleId];
        if ([v223 containsObject:v224])
        {
          v225 = [v220 artist];

          if (v225) {
            break;
          }
        }
        else
        {
        }
        if (([v222 containsString:@"podcast"] & 1) == 0)
        {
          v234 = (void *)mixedAudioBundleIds;
          v235 = [v220 bundleId];
          if (([v234 containsObject:v235] & 1) == 0)
          {

LABEL_156:
            if ([v222 containsString:@"audio"]
              && [v222 containsString:@"book"])
            {
              ++objb;
              v237 = [v220 endDate];
              v238 = [v220 startDate];
              [v237 timeIntervalSinceDate:v238];
              double v240 = v239;

              double v215 = v215 + v240;
            }
            else if ([v222 containsString:@"audio"])
            {
              ++v339;
              v241 = [v220 endDate];
              v242 = [v220 startDate];
              [v241 timeIntervalSinceDate:v242];
              double v244 = v243;

              double v217 = v217 + v244;
            }
            else if ([v222 containsString:@"itune"] {
                   && [v222 containsString:@"radio"])
            }
            {
              LODWORD(v328) = v328 + 1;
              v245 = [v220 endDate];
              v246 = [v220 startDate];
              [v245 timeIntervalSinceDate:v246];
              double v248 = v247;

              double v318 = v318 + v248;
            }
            else if ([v222 containsString:@"itune"])
            {
              ++v332;
              v249 = [v220 endDate];
              v250 = [v220 startDate];
              [v249 timeIntervalSinceDate:v250];
              double v252 = v251;

              double v216 = v216 + v252;
            }
            else if (([v222 containsString:@"video"] & 1) != 0 {
                   || (v253 = (void *)videoBundleIds,
            }
                       [v220 bundleId],
                       v254 = objc_claimAutoreleasedReturnValue(),
                       LODWORD(v253) = [v253 containsObject:v254],
                       v254,
                       v253))
            {
              ++HIDWORD(v328);
              v255 = [v220 endDate];
              v256 = [v220 startDate];
              [v255 timeIntervalSinceDate:v256];
              double v258 = v257;

              double v218 = v218 + v258;
              if (v258 > v212)
              {
                v259 = v326->_subDate;
                v315 = [v220 startDate];
                [(NSDate *)v259 timeIntervalSinceDate:v315];
                v260 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                v261 = +[MOMetric binForNumber:v260 bins:v336];
                v262 = [(MOMetric *)v326 metrics];
                [v262 setObject:v261 forKeyedSubscript:@"startTimeIDlongestDurationVideo"];

                v263 = v326->_subDate;
                v316 = [v220 endDate];
                [(NSDate *)v263 timeIntervalSinceDate:v316];
                v264 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                v265 = +[MOMetric binForNumber:v264 bins:v336];
                v266 = [(MOMetric *)v326 metrics];
                [v266 setObject:v265 forKeyedSubscript:@"endTimeIDlongestDurationVideo"];

                double v212 = v258;
              }
            }
            else
            {
              ++v313;
              v267 = [v220 endDate];
              v268 = [v220 startDate];
              [v267 timeIntervalSinceDate:v268];
              double v270 = v269;

              double v312 = v312 + v270;
            }
            goto LABEL_171;
          }
          v236 = [v220 artist];

          if (v236) {
            goto LABEL_156;
          }
        }
        ++v343;
        v230 = [v220 endDate];
        v231 = [v220 startDate];
        [v230 timeIntervalSinceDate:v231];
        double v233 = v232;

        double v214 = v214 + v233;
LABEL_171:

        if (v209 == (id)++v219)
        {
          id v209 = [v207 countByEnumeratingWithState:&v352 objects:v362 count:16];
          if (!v209) {
            goto LABEL_175;
          }
          goto LABEL_142;
        }
      }
      uint64_t v210 = (v210 + 1);
      v226 = [v220 endDate];
      v227 = [v220 startDate];
      [v226 timeIntervalSinceDate:v227];
      double v229 = v228;

      double v213 = v213 + v229;
      goto LABEL_171;
    case 4uLL:
      v124 = [(MOEvent *)self->_event placeName];
      v125 = [v124 lowercaseString];

      if ([v125 containsString:@"home"])
      {
        v126 = [(MOMetric *)self metrics];
        v127 = v126;
        v128 = &off_1002F52B8;
LABEL_87:
        [v126 setObject:v128 forKeyedSubscript:@"visitCategory"];
        v142 = &__kCFBooleanTrue;
        goto LABEL_88;
      }
      if ([v125 containsString:@"work"])
      {
        v126 = [(MOMetric *)self metrics];
        v127 = v126;
        v128 = &off_1002F52D0;
        goto LABEL_87;
      }
      if ([v125 containsString:@"gym"])
      {
        v126 = [(MOMetric *)self metrics];
        v127 = v126;
        v128 = &off_1002F52E8;
        goto LABEL_87;
      }
      unsigned int v192 = [v125 containsString:@"school"];
      v126 = [(MOMetric *)self metrics];
      v127 = v126;
      if (v192)
      {
        v128 = &off_1002F5300;
        goto LABEL_87;
      }
      [v126 setObject:&off_1002F5318 forKeyedSubscript:@"visitCategory"];
      v142 = &__kCFBooleanFalse;
LABEL_88:

      v143 = [(MOMetric *)self metrics];
      [v143 setObject:v142 forKeyedSubscript:@"visitLOI"];

      v144 = +[NSNumber numberWithUnsignedInteger:[(MOEvent *)self->_event mode]];
      v145 = [(MOMetric *)self metrics];
      [v145 setObject:v144 forKeyedSubscript:@"visitMode"];

      v146 = (void *)poiCategoryDictionary;
      v147 = [(MOEvent *)self->_event poiCategory];
      v148 = [v146 objectForKeyedSubscript:v147];

      if (v148)
      {
        v149 = (void *)poiCategoryDictionary;
        v150 = [(MOEvent *)self->_event poiCategory];
        v151 = [v149 objectForKeyedSubscript:v150];
        v152 = [(MOMetric *)self metrics];
        [v152 setObject:v151 forKeyedSubscript:@"visitPOI"];
      }
LABEL_176:

LABEL_177:
      return;
    default:
      goto LABEL_177;
  }
}

- (MOEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSNumber)islandID
{
  return self->_islandID;
}

- (void)setIslandID:(id)a3
{
}

- (NSDate)subDate
{
  return self->_subDate;
}

- (void)setSubDate:(id)a3
{
}

- (unint64_t)provider
{
  return self->_provider;
}

- (void)setProvider:(unint64_t)a3
{
  self->_provider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subDate, 0);
  objc_storeStrong((id *)&self->_islandID, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: islandID != nil", a5, a6, a7, a8, 0);
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end