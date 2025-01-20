@interface NSPCoreData
+ (BOOL)triggerProactiveTokenFetch:(id)a3 lowerTokenCountThreshold:(unint64_t)a4;
+ (id)NSPEventsCacheGet;
+ (id)NSPEventsCacheUpdate:(id)a3;
+ (id)childCoreDataContext;
+ (id)compareModelVersion:(id)a3 model2:(id)a4;
+ (id)computeStats:(id)a3;
+ (id)fetchEvents;
+ (id)fetchEvents:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5;
+ (id)fetchLatestEvents:(unint64_t)a3 vendors:(id)a4;
+ (id)getMinMaxDate;
+ (id)getModelVersion:(id)a3;
+ (id)getNSPEventStatsForSingleWindow:(id)a3 eventType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 windowStartTime:(id)a7 windowDuration:(id)a8;
+ (id)getNSPEventsDenormalizer;
+ (id)getNSPEventsNormalizer;
+ (id)getNSPEventsPredictor;
+ (id)getNSPEventsProbability:(id)a3 count:(int64_t)a4;
+ (id)getNSPTokenStatsForSingleWindow:(id)a3 startDate:(id)a4 endDate:(id)a5 windowStartTime:(id)a6 windowDuration:(id)a7 statsCategory:(int64_t)a8;
+ (id)getProactiveTokenFetchConfiguration;
+ (id)getTokenCountStatsForMultipleWindows:(id)a3 minDate:(id)a4 maxDate:(id)a5 windowDuration:(id)a6;
+ (id)getVendorDictionary;
+ (id)getVendorIdFromDictionary:(id)a3;
+ (id)getVendorNameById:(int64_t)a3;
+ (id)initNSPEventsModelPredictor;
+ (id)normalizeData:(id)a3;
+ (id)prepareInputForPrediction:(id)a3 vendor:(id)a4;
+ (id)prepareInputForTraining;
+ (id)prepareMLData:(id)a3 startAt:(unsigned int)a4 dataShape:(id)a5;
+ (id)prepareTokenEventsFromPrediction:(id)a3;
+ (id)sharedCoreDataContext;
+ (id)tokenTypeEnumToString:(int)a3;
+ (id)updateProactiveTokenFetchConfiguration:(id)a3 statsDuration:(id)a4 lowerTokenCountThreshold:(id)a5 lowerTokenCountProbability:(id)a6 upperLWMCountThreshold:(id)a7 upperLWMCountProbabilityOffset:(id)a8;
+ (id)updateVendorDictionaryFromModel:(id)a3;
+ (void)handleNSPEventsPredictions:(id)a3;
+ (void)predictNSPEvent:(id)a3;
+ (void)prepareModelInputWithFeatures:(id)a3 keyedSubscripts:(id)a4 features:(id)a5;
+ (void)printMLMultiArray:(id)a3;
+ (void)purgeEventsOlderThanDate:(id)a3;
+ (void)purgeEventsOlderThanDays:(int64_t)a3;
+ (void)saveTokenEvent:(id)a3 eventType:(int)a4 vendor:(id)a5 tokenCount:(unint64_t)a6;
+ (void)trainModel;
- (NSPCoreData)init;
- (NSPPersistentContainer)persistentContainer;
- (void)setPersistentContainer:(id)a3;
@end

@implementation NSPCoreData

+ (id)sharedCoreDataContext
{
  if (qword_100123278 != -1) {
    dispatch_once(&qword_100123278, &stru_1001066C0);
  }
  if (qword_100123270)
  {
    v2 = [(id)qword_100123270 persistentContainer];
    v3 = [v2 viewContext];
  }
  else
  {
    v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      v7 = "+[NSPCoreData sharedCoreDataContext]";
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s called with null coreData", (uint8_t *)&v6, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)childCoreDataContext
{
  if (qword_100123230)
  {
    id v2 = (id)qword_100123230;
    goto LABEL_10;
  }
  v3 = +[NSPCoreData sharedCoreDataContext];
  if (!v3)
  {
    int v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", (uint8_t *)&v8, 2u);
    }
    goto LABEL_8;
  }
  id v4 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  v5 = (void *)qword_100123230;
  qword_100123230 = (uint64_t)v4;

  if (!qword_100123230)
  {
    int v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "+[NSPCoreData childCoreDataContext]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null childContext", (uint8_t *)&v8, 0xCu);
    }
LABEL_8:

    id v2 = 0;
    goto LABEL_9;
  }
  [(id)qword_100123230 setParentContext:v3];
  id v2 = (id)qword_100123230;
LABEL_9:

LABEL_10:

  return v2;
}

- (NSPCoreData)init
{
  v16.receiver = self;
  v16.super_class = (Class)NSPCoreData;
  id v2 = [(NSPCoreData *)&v16 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/NetworkServiceProxy.framework"];
    id v4 = v3;
    if (!v3)
    {
      v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[NSPCoreData init]";
        _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s called with null frameworkBundle", buf, 0xCu);
      }
      v12 = 0;
      goto LABEL_10;
    }
    v5 = [v3 URLForResource:@"NSPCoreDataModel" withExtension:@"momd"];
    int v6 = nplog_obj();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v18 = @"NSPCoreDataModel";
        __int16 v19 = 2112;
        v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "URL for %@: %@", buf, 0x16u);
      }

      int v8 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v5];
      if (v8)
      {
        v7 = v8;
        v9 = [[NSPPersistentContainer alloc] initWithName:@"NSPCoreDataModel" managedObjectModel:v8];
        [(NSPCoreData *)v2 setPersistentContainer:v9];

        v10 = [(NSPCoreData *)v2 persistentContainer];

        if (v10)
        {
          v11 = [(NSPCoreData *)v2 persistentContainer];
          [v11 loadPersistentStoresWithCompletionHandler:&stru_100106700];

          v12 = v2;
LABEL_9:

LABEL_10:
          goto LABEL_11;
        }
        v15 = nplog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[NSPCoreData init]";
          _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null self.persistentContainer", buf, 0xCu);
        }
      }
      else
      {
        v14 = nplog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[NSPCoreData init]";
          _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null model", buf, 0xCu);
        }

        v7 = 0;
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[NSPCoreData init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null modelURL", buf, 0xCu);
    }
    v12 = 0;
    goto LABEL_9;
  }
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)getProactiveTokenFetchConfiguration
{
  if (qword_100123238)
  {
LABEL_16:
    v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      objc_super v16 = (const char *)qword_100123238;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "ProactiveTokenFetch Params %@", (uint8_t *)&v15, 0xCu);
    }

    id v13 = (id)qword_100123238;
    goto LABEL_19;
  }
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)qword_100123238;
  qword_100123238 = (uint64_t)v2;

  uint64_t v4 = qword_100123238;
  v5 = nplog_obj();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting default values for ProactiveFetchConfiguration", (uint8_t *)&v15, 2u);
    }

    [(id)qword_100123238 setObject:&__kCFBooleanTrue forKey:@"NSPEventsKeyProactiveTokenFetchEnabled"];
    v7 = +[NSNumber numberWithInt:30];
    if (v7) {
      [(id)qword_100123238 setObject:v7 forKey:@"NSPEventsKeyStatsDuration"];
    }
    int v8 = +[NSNumber numberWithInt:40];
    if (v8) {
      [(id)qword_100123238 setObject:v8 forKey:@"NSPEventsKeyLowerTokenCountThreshold"];
    }
    v9 = +[NSNumber numberWithDouble:0.6];
    if (v9) {
      [(id)qword_100123238 setObject:v9 forKey:@"NSPEventsKeyLowerTokenCountProbability"];
    }
    v10 = +[NSNumber numberWithInt:3];
    if (v10) {
      [(id)qword_100123238 setObject:v10 forKey:@"NSPEventsKeyUpperLWMCountThreshold"];
    }
    v11 = +[NSNumber numberWithDouble:0.1];
    if (v11) {
      [(id)qword_100123238 setObject:v11 forKey:@"NSPEventsKeyUpperLWMCountProbabilityOffset"];
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v15 = 136315138;
    objc_super v16 = "+[NSPCoreData getProactiveTokenFetchConfiguration]";
    _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null config", (uint8_t *)&v15, 0xCu);
  }

  id v13 = 0;
LABEL_19:

  return v13;
}

+ (id)updateProactiveTokenFetchConfiguration:(id)a3 statsDuration:(id)a4 lowerTokenCountThreshold:(id)a5 lowerTokenCountProbability:(id)a6 upperLWMCountThreshold:(id)a7 upperLWMCountProbabilityOffset:(id)a8
{
  id v13 = a3;
  v14 = (char *)a4;
  int v15 = (char *)a5;
  objc_super v16 = (char *)a6;
  v17 = (char *)a7;
  v18 = (char *)a8;
  __int16 v19 = +[NSPCoreData getProactiveTokenFetchConfiguration];
  v20 = v19;
  if (v19)
  {
    if (v13)
    {
      [v19 setObject:v13 forKey:@"NSPEventsKeyProactiveTokenFetchEnabled"];
      v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        unsigned int v22 = [v13 BOOLValue];
        v23 = "NO";
        if (v22) {
          v23 = "YES";
        }
        int v35 = 136315138;
        v36 = v23;
        v24 = "updated NSPEventsKeyProactiveTokenFetchEnabled %s";
        v25 = v21;
        uint32_t v26 = 12;
        goto LABEL_9;
      }
    }
    else
    {
      v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v35) = 0;
        v24 = "NSPEventsKeyProactiveTokenFetchEnabled not found";
        v25 = v21;
        uint32_t v26 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v35, v26);
      }
    }

    if (v14)
    {
      [v20 setObject:v14 forKey:@"NSPEventsKeyStatsDuration"];
      v27 = nplog_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "updated NSPEventsKeyStatsDuration %@", (uint8_t *)&v35, 0xCu);
      }
    }
    if (v15)
    {
      [v20 setObject:v15 forKey:@"NSPEventsKeyLowerTokenCountThreshold"];
      v28 = nplog_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "updated NSPEventsKeyLowerTokenCountThreshold %@", (uint8_t *)&v35, 0xCu);
      }
    }
    if (v16)
    {
      [v20 setObject:v16 forKey:@"NSPEventsKeyLowerTokenCountProbability"];
      v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "updated NSPEventsKeyLowerTokenCountProbability %@", (uint8_t *)&v35, 0xCu);
      }
    }
    if (v17)
    {
      [v20 setObject:v17 forKey:@"NSPEventsKeyUpperLWMCountThreshold"];
      v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "updated NSPEventsKeyUpperLWMCountThreshold %@", (uint8_t *)&v35, 0xCu);
      }
    }
    if (v18)
    {
      [v20 setObject:v18 forKey:@"NSPEventsKeyUpperLWMCountProbabilityOffset"];
      v31 = nplog_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v35 = 138412290;
        v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "updated NSPEventsKeyUpperLWMCountProbabilityOffset %@", (uint8_t *)&v35, 0xCu);
      }
    }
    id v32 = v20;
    goto LABEL_31;
  }
  v34 = nplog_obj();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
  {
    int v35 = 136315138;
    v36 = "+[NSPCoreData updateProactiveTokenFetchConfiguration:statsDuration:lowerTokenCountThreshold:lowerTokenCountPro"
          "bability:upperLWMCountThreshold:upperLWMCountProbabilityOffset:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "%s called with null config", (uint8_t *)&v35, 0xCu);
  }

LABEL_31:

  return v20;
}

+ (BOOL)triggerProactiveTokenFetch:(id)a3 lowerTokenCountThreshold:(unint64_t)a4
{
  double v90 = COERCE_DOUBLE(a3);
  v5 = +[NSPCoreData getProactiveTokenFetchConfiguration];
  int v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"NSPEventsKeyProactiveTokenFetchEnabled"];
    int v8 = v7;
    if (v7)
    {
      if ([v7 BOOLValue])
      {
        if (qword_100123240
          || (id v9 = objc_alloc_init((Class)NSMutableDictionary),
              v10 = (void *)qword_100123240,
              qword_100123240 = (uint64_t)v9,
              v10,
              qword_100123240))
        {
          v11 = [v6 objectForKey:@"NSPEventsKeyStatsDuration"];
          if (!v11)
          {
            v12 = nplog_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null statsDuration", buf, 0xCu);
            }
            LOBYTE(v27) = 0;
            goto LABEL_76;
          }
          v12 = [(id)qword_100123240 objectForKey:*(void *)&v90];
          if (v12)
          {
            id v13 = +[NSDate now];
            [v13 timeIntervalSinceDate:v12];
            double v15 = v14;

            if (v15 < (double)(60 * (uint64_t)[v11 integerValue]))
            {
              objc_super v16 = nplog_obj();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                double v97 = (double)(60 * (uint64_t)[v11 integerValue]) - v15;
                __int16 v98 = 2112;
                double v99 = v90;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%f seconds left before next trigger checkpoint for vendor %@", buf, 0x16u);
              }
              LOBYTE(v27) = 0;
              goto LABEL_75;
            }
            [(id)qword_100123240 removeObjectForKey:*(void *)&v90];
          }
          objc_super v16 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
          if (!v16)
          {
            v69 = nplog_obj();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
            }
            LOBYTE(v27) = 0;
            goto LABEL_74;
          }
          uint64_t v79 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
          -[NSObject setTimeZone:](v16, "setTimeZone:");
          v17 = +[NSPCoreData getMinMaxDate];
          v80 = v17;
          if (!v17)
          {
            __int16 v19 = nplog_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s called with null dict", buf, 0xCu);
            }
            LOBYTE(v27) = 0;
            v69 = v79;
            goto LABEL_73;
          }
          v18 = v17;
          __int16 v19 = [v17 objectForKey:@"minDate"];
          uint64_t v20 = [v18 objectForKey:@"maxDate"];
          v21 = (void *)v20;
          if (v19)
          {
            if (v20)
            {
              unsigned int v22 = +[NSDate now];
              uint64_t v23 = [v16 components:736 fromDate:v22];

              v24 = [v16 dateFromComponents:v23];
              [v11 doubleValue];
              v88 = v24;
              v87 = [v24 dateByAddingTimeInterval:v25 * 60.0];
              p_vtable = &OBJC_METACLASS___NSPEventsPredictor.vtable;
              os_log_t log = (os_log_t)v23;
              uint64_t v27 = +[NSPCoreData getNSPEventStatsForSingleWindow:*(void *)&v90 eventType:0 startDate:v19 endDate:v21 windowStartTime:v23 windowDuration:v11];
              v82 = v21;
              v83 = v19;
              v77 = v12;
              v78 = v16;
              v81 = (void *)v27;
              if (v27)
              {
                v89 = +[NSPCoreData getNSPEventsProbability:v27 count:0];
                if (v89)
                {
                  v28 = nplog_obj();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    double v29 = COERCE_DOUBLE([v11 integerValue]);
                    [v89 doubleValue];
                    *(_DWORD *)buf = 134218498;
                    double v97 = v29;
                    __int16 v98 = 2112;
                    double v99 = v90;
                    __int16 v100 = 2048;
                    double v101 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Probability of 0 LWM events in next %ld mins for vendor:%@ is %f", buf, 0x20u);
                  }

                  v31 = [v6 objectForKey:@"NSPEventsKeyUpperLWMCountThreshold"];
                  if (!v31)
                  {
                    id v32 = nplog_obj();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                      v72 = "%s called with null upperLWMCount";
                      goto LABEL_110;
                    }
LABEL_103:
                    LOBYTE(v27) = 0;
                    goto LABEL_71;
                  }
                  id v32 = v31;
                  uint64_t v33 = +[NSPCoreData getNSPEventsProbability:v27 count:[v31 integerValue]];
                  v34 = (void *)v33;
                  if (v33)
                  {
                    v85 = (void *)v33;
                    int v35 = nplog_obj();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      double v36 = COERCE_DOUBLE([v32 integerValue]);
                      id v37 = [v11 integerValue];
                      [v85 doubleValue];
                      *(_DWORD *)buf = 134218754;
                      double v97 = v36;
                      __int16 v98 = 2048;
                      double v99 = *(double *)&v37;
                      __int16 v100 = 2112;
                      double v101 = v90;
                      __int16 v102 = 2048;
                      double v103 = 1.0 - v38;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Probability of seeing atleast %ld LWM events in next %ld mins for vendor:%@ is %f", buf, 0x2Au);
                    }

                    v39 = [v6 objectForKey:@"NSPEventsKeyUpperLWMCountProbabilityOffset"];
                    LOBYTE(v27) = v39 != 0;
                    if (!v39)
                    {
                      v74 = nplog_obj();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                        _os_log_fault_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_FAULT, "%s called with null probabilityOffset", buf, 0xCu);
                      }

                      v34 = v85;
                      goto LABEL_41;
                    }
                    v34 = v85;
                    [v85 doubleValue];
                    double v41 = 1.0 - v40;
                    [v89 doubleValue];
                    double v43 = v42;
                    [v39 doubleValue];
                    double v45 = v43 + v44;
                    if (v41 <= v45)
                    {
                      int v48 = 0;
                    }
                    else
                    {
                      v46 = nplog_obj();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        double v97 = v90;
                        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Trigger Token fetch for vendor:%@", buf, 0xCu);
                      }

                      v47 = +[NSDate now];
                      [(id)qword_100123240 setObject:v47 forKey:*(void *)&v90];

                      int v48 = 1;
                    }
                    v49 = objc_alloc_init(NSPProactiveTokenFetchAnalytics);
                    v50 = v49;
                    if (v49)
                    {
                      [(NSPProactiveTokenFetchAnalytics *)v49 setStats:v81];
                      [(NSPProactiveTokenFetchAnalytics *)v50 setType:@"TokenEventLWM"];
                      [(NSPProactiveTokenFetchAnalytics *)v50 setFromDate:v88];
                      [(NSPProactiveTokenFetchAnalytics *)v50 setToDate:v87];
                      v34 = v85;
                      [(NSPProactiveTokenFetchAnalytics *)v50 setTokenFetchTriggered:v41 > v45];
                      [(NSPProactiveTokenFetchAnalytics *)v50 setVendor:*(void *)&v90];
                      [(NSPProxyAnalytics *)v50 sendAnalytics];
                    }

                    if (v41 > v45)
                    {
LABEL_41:

LABEL_70:
                      v12 = v77;
LABEL_71:
                      v69 = v79;

                      objc_super v16 = v78;
                      v21 = v82;
                      __int16 v19 = v83;
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_75:
LABEL_76:

                      goto LABEL_77;
                    }
                  }
                  else
                  {
                    int v48 = 0;
                  }

                  v21 = v82;
                  __int16 v19 = v83;
                  p_vtable = &OBJC_METACLASS___NSPEventsPredictor.vtable;
                }
                else
                {
                  int v48 = 0;
                }

                LOBYTE(v27) = v48 != 0;
              }
              v89 = [v6 objectForKey:@"NSPEventsKeyLowerTokenCountProbability"];
              if (v89)
              {
                v51 = +[NSPCoreData getNSPTokenStatsForSingleWindow:*(void *)&v90 startDate:v19 endDate:v21 windowStartTime:log windowDuration:v11 statsCategory:9];
                if (v51)
                {
                  v86 = v11;
                  v75 = v8;
                  v76 = v6;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  id v32 = v51;
                  id v52 = [v32 countByEnumeratingWithState:&v91 objects:v95 count:16];
                  if (v52)
                  {
                    id v53 = v52;
                    uint64_t v54 = *(void *)v92;
                    while (2)
                    {
                      for (i = 0; i != v53; i = (char *)i + 1)
                      {
                        if (*(void *)v92 != v54) {
                          objc_enumerationMutation(v32);
                        }
                        uint64_t v56 = *(void *)(*((void *)&v91 + 1) + 8 * i);
                        if (v56)
                        {
                          v57 = [p_vtable + 472 getNSPEventsProbability:*(void *)(*((void *)&v91 + 1) + 8 * i) count:a4];
                          if (v57)
                          {
                            v58 = nplog_obj();
                            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                            {
                              id v59 = [v86 integerValue];
                              [v57 doubleValue];
                              *(_DWORD *)buf = 134218754;
                              double v97 = *(double *)&a4;
                              __int16 v98 = 2048;
                              double v99 = *(double *)&v59;
                              __int16 v100 = 2112;
                              double v101 = v90;
                              __int16 v102 = 2048;
                              double v103 = v60;
                              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Probability of reaching less than %ld tokens in next %ld mins for vendor:%@ is %f", buf, 0x2Au);
                            }

                            [v57 doubleValue];
                            double v62 = v61;
                            [v89 doubleValue];
                            double v64 = v63;
                            if (v62 > v63)
                            {
                              v65 = nplog_obj();
                              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 138412290;
                                double v97 = v90;
                                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Trigger Token fetch for vendor:%@", buf, 0xCu);
                              }

                              v66 = +[NSDate now];
                              [(id)qword_100123240 setObject:v66 forKey:*(void *)&v90];
                            }
                            v67 = objc_alloc_init(NSPProactiveTokenFetchAnalytics);
                            v68 = v67;
                            if (v67)
                            {
                              [(NSPProactiveTokenFetchAnalytics *)v67 setStats:v56];
                              [(NSPProactiveTokenFetchAnalytics *)v68 setType:@"TokenCount"];
                              [(NSPProactiveTokenFetchAnalytics *)v68 setFromDate:v88];
                              [(NSPProactiveTokenFetchAnalytics *)v68 setToDate:v87];
                              [(NSPProactiveTokenFetchAnalytics *)v68 setTokenFetchTriggered:v62 > v64];
                              [(NSPProactiveTokenFetchAnalytics *)v68 setVendor:*(void *)&v90];
                              [(NSPProxyAnalytics *)v68 sendAnalytics];
                            }

                            if (v62 > v64)
                            {

                              LOBYTE(v27) = 1;
                              goto LABEL_69;
                            }
                            LOBYTE(v27) = 0;
                            p_vtable = (void **)(&OBJC_METACLASS___NSPEventsPredictor + 24);
                          }
                        }
                      }
                      id v53 = [v32 countByEnumeratingWithState:&v91 objects:v95 count:16];
                      if (v53) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_69:

                  int v8 = v75;
                  int v6 = v76;
                  v11 = v86;
                }
                else
                {
                  v73 = nplog_obj();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                    _os_log_fault_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_FAULT, "%s called with null tokenStatsArray", buf, 0xCu);
                  }

                  id v32 = 0;
                  LOBYTE(v27) = 0;
                }
                goto LABEL_70;
              }
              id v32 = nplog_obj();
              v12 = v77;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                v72 = "%s called with null lowTokenCountProbability";
LABEL_110:
                _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, v72, buf, 0xCu);
                goto LABEL_103;
              }
              goto LABEL_103;
            }
            nplog_obj();
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
LABEL_96:
              LOBYTE(v27) = 0;
              v69 = v79;
              goto LABEL_72;
            }
            *(_DWORD *)buf = 136315138;
            double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
            v71 = "%s called with null maxDate";
          }
          else
          {
            nplog_obj();
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(log, OS_LOG_TYPE_FAULT)) {
              goto LABEL_96;
            }
            *(_DWORD *)buf = 136315138;
            double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
            v71 = "%s called with null minDate";
          }
          _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, v71, buf, 0xCu);
          goto LABEL_96;
        }
        v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to allocate dictionary for previous triggers", buf, 2u);
        }
      }
      else
      {
        v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Proactive Token Fetch is disabled", buf, 2u);
        }
      }
    }
    else
    {
      v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null enabled", buf, 0xCu);
      }
    }
    LOBYTE(v27) = 0;
LABEL_77:

    goto LABEL_78;
  }
  int v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v97 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
  }
  LOBYTE(v27) = 0;
LABEL_78:

  return v27 & 1;
}

+ (id)getNSPEventsProbability:(id)a3 count:(int64_t)a4
{
  id v5 = a3;
  int v6 = [v5 objectForKey:@"mean"];
  if (!v6)
  {
    int v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "+[NSPCoreData getNSPEventsProbability:count:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null mean", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_7;
  }
  v7 = [v5 objectForKey:@"stdDev"];
  if (!v7)
  {
    objc_super v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "+[NSPCoreData getNSPEventsProbability:count:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null stdDev", (uint8_t *)&v17, 0xCu);
    }

    int v8 = 0;
    goto LABEL_7;
  }
  int v8 = v7;
  [v7 doubleValue];
  if (v9 == 0.0)
  {
    v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Standard Deviation is 0", (uint8_t *)&v17, 2u);
    }

LABEL_7:
    v11 = 0;
    goto LABEL_9;
  }
  [v6 doubleValue];
  double v13 = (double)a4 - v12;
  [v8 doubleValue];
  v11 = +[NSNumber numberWithDouble:(double)((erf(v13 / v14 / 1.41421356) + 1.0) * 0.5)];
LABEL_9:

  return v11;
}

+ (id)getMinMaxDate
{
  id v2 = +[NSPCoreData sharedCoreDataContext];
  v3 = v2;
  if (v2)
  {
    *(void *)buf = 0;
    v11 = buf;
    uint64_t v12 = 0x3032000000;
    double v13 = sub_100005DAC;
    double v14 = sub_10007D8B0;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007D8B8;
    v7[3] = &unk_100105460;
    id v8 = v2;
    double v9 = buf;
    [v8 performBlockAndWait:v7];
    id v4 = *((id *)v11 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)computeStats:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    int v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v32 = "+[NSPCoreData computeStats:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null data", buf, 0xCu);
    }
    goto LABEL_5;
  }
  id v5 = (const char *)[v3 count];
  if ((unint64_t)v5 <= 4)
  {
    int v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v32 = v5;
      __int16 v33 = 1024;
      int v34 = 5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Insufficient number of data points to compute stats. (%lu vs %d)", buf, 0x12u);
    }
LABEL_5:
    v7 = 0;
    goto LABEL_18;
  }
  int v6 = [v4 valueForKeyPath:@"@sum.self"];
  [v6 doubleValue];
  double v8 = (double)(unint64_t)v5;
  v10 = +[NSNumber numberWithDouble:v9 / (double)(unint64_t)v5];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    double v15 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) doubleValue:v24];
        double v18 = v17;
        [v10 doubleValue];
        double v15 = v15 + (v18 - v19) * (v18 - v19);
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  [v10 doubleValue];
  uint64_t v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v21 = +[NSNumber numberWithDouble:sqrt(v15 / v8)];
  v28[0] = @"mean";
  v28[1] = @"stdDev";
  v29[0] = v20;
  v29[1] = v21;
  v7 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  unsigned int v22 = nplog_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Data stats dict:%@", buf, 0xCu);
  }

LABEL_18:

  return v7;
}

+ (id)getNSPEventStatsForSingleWindow:(id)a3 eventType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 windowStartTime:(id)a7 windowDuration:(id)a8
{
  id v27 = a3;
  id v13 = a5;
  id v14 = a6;
  id v28 = a7;
  id v15 = a8;
  objc_super v16 = +[NSPCoreData sharedCoreDataContext];
  if (!v16)
  {
    double v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v13)
  {
    double v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      long long v25 = "%s called with null startDate";
LABEL_29:
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    }
LABEL_12:
    unsigned int v22 = 0;
    goto LABEL_22;
  }
  if (!v14)
  {
    double v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      long long v25 = "%s called with null endDate";
      goto LABEL_29;
    }
    goto LABEL_12;
  }
  double v17 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  if (v17)
  {
    double v18 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [v17 setTimeZone:v18];
    double v19 = [v17 components:16 fromDate:v13 toDate:v14 options:0];
    uint64_t v20 = v19;
    if (v19)
    {
      uint64_t v41 = 0;
      double v42 = &v41;
      uint64_t v43 = 0x2020000000;
      id v44 = 0;
      id v44 = [v19 day];
      if ((unint64_t)v42[3] < 0x1F)
      {
        [v20 setDay:1];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v46 = sub_100005DAC;
        v47 = sub_10007D8B0;
        id v48 = +[NSMutableArray array];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10007E720;
        v30[3] = &unk_100106728;
        id v31 = v13;
        double v38 = &v41;
        id v32 = v17;
        id v33 = v20;
        id v34 = v28;
        id v35 = v15;
        id v36 = v27;
        int64_t v40 = a4;
        id v37 = v16;
        v39 = buf;
        [v37 performBlockAndWait:v30];
        if ([*(id *)(*(void *)&buf[8] + 40) count])
        {
          unsigned int v22 = +[NSPCoreData computeStats:*(void *)(*(void *)&buf[8] + 40)];
        }
        else
        {
          uint64_t v23 = nplog_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)double v29 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No records found", v29, 2u);
          }

          unsigned int v22 = 0;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v21 = nplog_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Invalid dates. startDate:%@ endDate:%@", buf, 0x16u);
        }

        unsigned int v22 = 0;
      }
      _Block_object_dispose(&v41, 8);
    }
    else
    {
      long long v26 = nplog_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "%s called with null dayComponents", buf, 0xCu);
      }

      unsigned int v22 = 0;
    }
  }
  else
  {
    double v18 = nplog_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
    }
    unsigned int v22 = 0;
  }

LABEL_22:

  return v22;
}

+ (id)getNSPTokenStatsForSingleWindow:(id)a3 startDate:(id)a4 endDate:(id)a5 windowStartTime:(id)a6 windowDuration:(id)a7 statsCategory:(int64_t)a8
{
  char v8 = a8;
  id v33 = a3;
  id v13 = a4;
  id v14 = a5;
  id v35 = a6;
  id v34 = a7;
  id v15 = +[NSPCoreData sharedCoreDataContext];
  if (v15)
  {
    objc_super v16 = +[NSPTokenEvent fetchRequest];
    double v17 = v16;
    if (v16)
    {
      if (v13)
      {
        if (v14)
        {
          [v16 setPropertiesToFetch:&off_10010FDA0];
          [v17 setResultType:2];
          double v18 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
          if (v18)
          {
            osos_log_t log = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
            [v18 setTimeZone:oslog];
            double v19 = [v18 components:16 fromDate:v13 toDate:v14 options:0];
            uint64_t v20 = v19;
            if (v19)
            {
              uint64_t v62 = 0;
              double v63 = &v62;
              uint64_t v64 = 0x2020000000;
              id v65 = 0;
              id v65 = [v19 day];
              if ((unint64_t)v63[3] < 0x1F)
              {
                [v20 setDay:1];
                id v23 = [v35 weekday];
                *(void *)buf = 0;
                *(void *)&uint8_t buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000;
                v67 = sub_100005DAC;
                v68 = sub_10007D8B0;
                id v69 = +[NSMutableArray array];
                uint64_t v56 = 0;
                v57 = &v56;
                uint64_t v58 = 0x3032000000;
                id v59 = sub_100005DAC;
                double v60 = sub_10007D8B0;
                id v61 = +[NSMutableArray array];
                uint64_t v50 = 0;
                v51 = &v50;
                uint64_t v52 = 0x3032000000;
                id v53 = sub_100005DAC;
                uint64_t v54 = sub_10007D8B0;
                id v55 = +[NSMutableArray array];
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472;
                v36[2] = sub_10007F3BC;
                v36[3] = &unk_100106750;
                id v37 = v13;
                double v45 = &v62;
                double v38 = v18;
                id v39 = v20;
                id v40 = v35;
                id v41 = v34;
                id v42 = v33;
                uint64_t v43 = v17;
                id v44 = v15;
                v46 = &v56;
                id v48 = &v50;
                id v49 = v23;
                v47 = buf;
                [v44 performBlockAndWait:v36];
                unsigned int v22 = +[NSMutableArray array];
                if (v8)
                {
                  long long v24 = +[NSMutableArray array];
                  [v24 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
                  [v24 addObjectsFromArray:v57[5]];
                  long long v25 = +[NSPCoreData computeStats:v24];
                  if (v25) {
                    [v22 addObject:v25];
                  }
                }
                if ((v8 & 2) != 0)
                {
                  long long v26 = +[NSPCoreData computeStats:*(void *)(*(void *)&buf[8] + 40)];
                  if (v26) {
                    [v22 addObject:v26];
                  }
                }
                if ((v8 & 4) != 0)
                {
                  id v27 = +[NSPCoreData computeStats:v57[5]];
                  if (v27) {
                    [v22 addObject:v27];
                  }
                }
                if ((v8 & 8) != 0)
                {
                  id v28 = +[NSPCoreData computeStats:v51[5]];
                  if (v28) {
                    [v22 addObject:v28];
                  }
                }
                _Block_object_dispose(&v50, 8);

                _Block_object_dispose(&v56, 8);
                _Block_object_dispose(buf, 8);
              }
              else
              {
                v21 = nplog_obj();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v13;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v14;
                  _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Invalid dates. startDate: %@  endDate: %@", buf, 0x16u);
                }

                unsigned int v22 = 0;
              }
              _Block_object_dispose(&v62, 8);
            }
            else
            {
              id v31 = nplog_obj();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:win"
                                     "dowDuration:statsCategory:]";
                _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null dayComponents", buf, 0xCu);
              }

              unsigned int v22 = 0;
            }
          }
          else
          {
            osos_log_t log = nplog_obj();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windo"
                                   "wDuration:statsCategory:]";
              _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
            }
            unsigned int v22 = 0;
          }

          goto LABEL_34;
        }
        double v18 = nplog_obj();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
LABEL_43:
          unsigned int v22 = 0;
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        double v30 = "%s called with null endDate";
      }
      else
      {
        double v18 = nplog_obj();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        double v30 = "%s called with null startDate";
      }
    }
    else
    {
      double v18 = nplog_obj();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuratio"
                           "n:statsCategory:]";
      double v30 = "%s called with null fetchRequest";
    }
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_43;
  }
  double v17 = nplog_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
  }
  unsigned int v22 = 0;
LABEL_35:

  return v22;
}

+ (id)getTokenCountStatsForMultipleWindows:(id)a3 minDate:(id)a4 maxDate:(id)a5 windowDuration:(id)a6
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  if (v10)
  {
    id v11 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    if (v11)
    {
      id v31 = v11;
      [v10 setTimeZone:v11];
      id v12 = +[NSDate date];
      id v13 = [v10 components:28 fromDate:v12];
      [v13 setHour:0];
      [v13 setMinute:0];
      [v13 setSecond:0];
      double v30 = v13;
      id v14 = [v10 dateFromComponents:v13];

      id v15 = [v14 dateByAddingTimeInterval:86400.0];
      [v9 doubleValue];
      double v17 = v16;
      double v18 = +[NSMutableArray array];
      double v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        double v38 = (const char *)v14;
        __int16 v39 = 2112;
        id v40 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "currentDate: %@  endDate: %@", buf, 0x16u);
      }

      v35[0] = @"mean";
      uint64_t v20 = +[NSNumber numberWithDouble:0.0];
      v35[1] = @"stdDev";
      v36[0] = v20;
      v21 = +[NSNumber numberWithDouble:-1.0];
      v36[1] = v21;
      unsigned int v22 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

      if ([v10 compareDate:v14 toDate:v15 toUnitGranularity:16] == (id)-1)
      {
        double v24 = v17 * 60.0;
        do
        {
          long long v25 = [v10 components:96 fromDate:v14];
          long long v26 = +[NSPCoreData getNSPTokenStatsForSingleWindow:v34 startDate:v33 endDate:v32 windowStartTime:v25 windowDuration:v9 statsCategory:1];
          id v27 = v26;
          if (v26 && [v26 count])
          {
            id v28 = [v27 objectAtIndexedSubscript:0];
            [v18 addObject:v28];
          }
          else
          {
            [v18 addObject:v22];
          }
          id v23 = [v14 dateByAddingTimeInterval:v24];

          id v14 = v23;
        }
        while ([v10 compareDate:v23 toDate:v15 toUnitGranularity:16] == (id)-1);
      }
      else
      {
        id v23 = v14;
      }

      id v11 = v31;
    }
    else
    {
      id v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v38 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null timeZone", buf, 0xCu);
      }
      double v18 = 0;
    }
  }
  else
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v38 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
    }
    double v18 = 0;
  }

  return v18;
}

+ (void)saveTokenEvent:(id)a3 eventType:(int)a4 vendor:(id)a5 tokenCount:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = +[NSPCoreData sharedCoreDataContext];
  id v12 = v11;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007FE6C;
    v14[3] = &unk_100106778;
    id v15 = v11;
    id v16 = v9;
    int v19 = a4;
    id v17 = v10;
    unint64_t v18 = a6;
    [v15 performBlockAndWait:v14];

    id v13 = v15;
  }
  else
  {
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
  }
}

+ (void)purgeEventsOlderThanDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPCoreData sharedCoreDataContext];
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100080200;
    v6[3] = &unk_100105AB8;
    v7 = v3;
    id v8 = v4;
    [v8 performBlockAndWait:v6];

    id v5 = v7;
  }
  else
  {
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
  }
}

+ (void)purgeEventsOlderThanDays:(int64_t)a3
{
  id v4 = +[NSCalendar currentCalendar];
  id v5 = +[NSDate date];
  id v6 = [v4 dateByAddingUnit:16 value:-a3 toDate:v5 options:0];

  +[NSPCoreData purgeEventsOlderThanDate:v6];
}

+ (id)fetchEvents
{
  id v2 = +[NSPCoreData sharedCoreDataContext];
  id v3 = v2;
  if (v2)
  {
    *(void *)buf = 0;
    id v11 = buf;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_100005DAC;
    id v14 = sub_10007D8B0;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100080768;
    v7[3] = &unk_1001067A0;
    id v9 = buf;
    id v8 = v2;
    [v8 performBlockAndWait:v7];
    id v4 = *((id *)v11 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)NSPEventsCacheGet
{
  id v2 = (void *)qword_100123248;
  if (!qword_100123248)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = (void *)qword_100123248;
    qword_100123248 = (uint64_t)v3;

    id v2 = (void *)qword_100123248;
  }

  return v2;
}

+ (id)NSPEventsCacheUpdate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPCoreData NSPEventsCacheGet];
  if (v4)
  {
    id v5 = [v3 vendor];
    id v6 = +[NSPCoreData getVendorIdFromDictionary:v5];

    if (v6)
    {
      if ((unint64_t)[v4 count] >= 6) {
        [v4 removeObjectAtIndex:0];
      }
      [v4 addObject:v3];
      id v6 = v4;
    }
  }
  else
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      id v10 = "+[NSPCoreData NSPEventsCacheUpdate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null cache", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)fetchLatestEvents:(unint64_t)a3 vendors:(id)a4
{
  id v5 = a4;
  id v6 = +[NSPCoreData sharedCoreDataContext];
  if (v6)
  {
    v7 = +[NSPCoreData NSPEventsCacheGet];
    if ((unint64_t)[v7 count] >= a3)
    {
      int v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Using NSP events from the cache", buf, 2u);
      }

      v7 = v7;
      id v8 = v7;
    }
    else
    {
      *(void *)buf = 0;
      id v17 = buf;
      uint64_t v18 = 0x3032000000;
      int v19 = sub_100005DAC;
      uint64_t v20 = sub_10007D8B0;
      id v21 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100080DDC;
      v11[3] = &unk_1001067C8;
      unint64_t v15 = a3;
      id v12 = v5;
      id v14 = buf;
      id v13 = v6;
      [v13 performBlockAndWait:v11];
      id v8 = *((id *)v17 + 5);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)fetchEvents:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5
{
  id v7 = a3;
  id v8 = +[NSPCoreData sharedCoreDataContext];
  if (v8)
  {
    *(void *)buf = 0;
    int v19 = buf;
    uint64_t v20 = 0x3032000000;
    id v21 = sub_100005DAC;
    unsigned int v22 = sub_10007D8B0;
    id v23 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081634;
    v12[3] = &unk_1001067F0;
    BOOL v17 = a4;
    unint64_t v15 = buf;
    unint64_t v16 = a5;
    id v13 = v7;
    id v14 = v8;
    [v14 performBlockAndWait:v12];
    id v9 = *((id *)v19 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)prepareInputForTraining
{
  id v2 = +[NSPCoreData getNSPEventsNormalizer];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 model];
    id v5 = [v4 modelDescription];
    id v6 = [v5 inputDescriptionsByName];
    id v7 = [v6 objectForKeyedSubscript:@"normalizer_input"];

    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v24 = [v7 multiArrayConstraint];
      long long v25 = [v24 shape];
      int v29 = 138412290;
      double v30 = v25;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "input shape %@", (uint8_t *)&v29, 0xCu);
    }
    id v9 = [v7 multiArrayConstraint];
    id v10 = [v9 shape];

    if (!v10)
    {
      id v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        double v30 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null inputShape", (uint8_t *)&v29, 0xCu);
      }
      id v22 = 0;
      goto LABEL_13;
    }
    id v11 = +[NSPCoreData getNSPEventsDenormalizer];
    id v12 = v11;
    if (!v11)
    {
      unint64_t v16 = nplog_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        double v30 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null denormalizer", (uint8_t *)&v29, 0xCu);
      }
      id v22 = 0;
      goto LABEL_12;
    }
    id v13 = [v11 model];
    id v14 = [v13 modelDescription];
    unint64_t v15 = [v14 inputDescriptionsByName];
    unint64_t v16 = [v15 objectForKeyedSubscript:@"denormalizer_input"];

    BOOL v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v26 = [v16 multiArrayConstraint];
      id v27 = [v26 shape];
      int v29 = 138412290;
      double v30 = v27;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "target shape %@", (uint8_t *)&v29, 0xCu);
    }
    uint64_t v18 = [v16 multiArrayConstraint];
    int v19 = [v18 shape];

    if (v19)
    {
      uint64_t v20 = +[NSPCoreData fetchEvents];
      if (v20)
      {
        id v21 = v20;
        id v22 = [[NSPEventsPredictorTrainingBatchProvider alloc] init:v20 inputShape:v10 targetShape:v19];
LABEL_11:

LABEL_12:
LABEL_13:

        goto LABEL_14;
      }
      id v28 = nplog_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        double v30 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s called with null events", (uint8_t *)&v29, 0xCu);
      }

      id v21 = 0;
    }
    else
    {
      id v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v29 = 136315138;
        double v30 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null targetShape", (uint8_t *)&v29, 0xCu);
      }
    }
    id v22 = 0;
    goto LABEL_11;
  }
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v29 = 136315138;
    double v30 = "+[NSPCoreData prepareInputForTraining]";
    _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null normalizer", (uint8_t *)&v29, 0xCu);
  }
  id v22 = 0;
LABEL_14:

  return v22;
}

+ (void)trainModel
{
}

+ (id)getModelVersion:(id)a3
{
  if (a3)
  {
    id v3 = [a3 modelDescription];
    id v4 = [v3 metadata];
    id v5 = [v4 objectForKeyedSubscript:MLModelCreatorDefinedKey];

    if (!v5)
    {
      id v7 = nplog_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315138;
        unint64_t v16 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null metadata", (uint8_t *)&v15, 0xCu);
      }
      id v13 = 0;
      goto LABEL_9;
    }
    id v6 = [v5 objectForKeyedSubscript:@"version"];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 componentsSeparatedByString:@"."];
      id v9 = [v8 valueForKey:@"intValue"];

      id v10 = nplog_obj();
      id v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          unint64_t v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "model version %@", (uint8_t *)&v15, 0xCu);
        }

        id v12 = v9;
        id v13 = v12;
        goto LABEL_8;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315138;
        unint64_t v16 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null versionComponents", (uint8_t *)&v15, 0xCu);
      }

      id v12 = 0;
    }
    else
    {
      id v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315138;
        unint64_t v16 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null versionStr", (uint8_t *)&v15, 0xCu);
      }
    }
    id v13 = 0;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v15 = 136315138;
    unint64_t v16 = "+[NSPCoreData getModelVersion:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s called with null model", (uint8_t *)&v15, 0xCu);
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

+ (id)compareModelVersion:(id)a3 model2:(id)a4
{
  id v5 = a4;
  id v6 = +[NSPCoreData getModelVersion:a3];
  uint64_t v7 = +[NSPCoreData getModelVersion:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = nplog_obj();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v11)
      {
        LOWORD(v27) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "model2 version not found", (uint8_t *)&v27, 2u);
      }

      id v12 = objc_alloc((Class)NSNumber);
      uint64_t v13 = 1;
      goto LABEL_22;
    }
    if (v8)
    {
      if (v11)
      {
        LOWORD(v27) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "model1 version not found", (uint8_t *)&v27, 2u);
      }

      id v12 = objc_alloc((Class)NSNumber);
      uint64_t v13 = 0xFFFFFFFFLL;
      goto LABEL_22;
    }
    if (v11)
    {
      LOWORD(v27) = 0;
      uint64_t v18 = "model1 and model2 version not found";
      int v19 = v10;
      uint32_t v20 = 2;
      goto LABEL_26;
    }
LABEL_27:

    id v21 = 0;
    goto LABEL_28;
  }
  id v14 = [v6 count];
  if (v14 != [v8 count])
  {
    id v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      double v30 = v8;
      uint64_t v18 = "Incompatible version strings (%@ vs %@)";
      int v19 = v10;
      uint32_t v20 = 22;
LABEL_26:
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, v20);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (![v6 count])
  {
LABEL_15:
    id v12 = objc_alloc((Class)NSNumber);
    uint64_t v13 = 0;
LABEL_22:
    id v21 = [v12 initWithInt:v13];
    goto LABEL_28;
  }
  uint64_t v15 = 0;
  while (1)
  {
    unint64_t v16 = [v6 objectAtIndex:v15];
    BOOL v17 = [v8 objectAtIndex:v15];

    if (v16 != v17) {
      break;
    }
    if (++v15 >= (unint64_t)[v6 count]) {
      goto LABEL_15;
    }
  }
  id v22 = objc_alloc((Class)NSNumber);
  id v23 = [v6 objectAtIndex:v15];
  unsigned int v24 = [v23 intValue];
  long long v25 = [v8 objectAtIndex:v15];
  id v21 = [v22 initWithInt:v24 - [v25 intValue]];

LABEL_28:

  return v21;
}

+ (id)getVendorDictionary
{
  id v2 = (void *)qword_100123250;
  if (!qword_100123250)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    id v4 = (void *)qword_100123250;
    qword_100123250 = (uint64_t)v3;

    id v2 = (void *)qword_100123250;
  }

  return v2;
}

+ (id)updateVendorDictionaryFromModel:(id)a3
{
  id v3 = [a3 modelDescription];
  id v4 = [v3 metadata];
  id v5 = [v4 objectForKeyedSubscript:MLModelCreatorDefinedKey];

  if (!v5)
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null metadata", buf, 0xCu);
    }
    BOOL v9 = 0;
    goto LABEL_13;
  }
  id v6 = [v5 objectForKeyedSubscript:@"vendors"];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"vendors"];
    id v8 = [v7 componentsSeparatedByString:@":"];

    BOOL v9 = +[NSPCoreData getVendorDictionary];
    if (v9)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v21 = v8;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v23;
        uint64_t v14 = 1;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            BOOL v17 = +[NSNumber numberWithInt:(char *)i + v14];
            [v9 setValue:v17 forKey:v16];
          }
          id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v14 = (v14 + i);
        }
        while (v12);
      }

      id v18 = v9;
      id v8 = v21;
    }
    else
    {
      uint32_t v20 = nplog_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v28 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null dictionary", buf, 0xCu);
      }
    }
LABEL_13:

    goto LABEL_15;
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

+ (id)getVendorIdFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPCoreData getVendorDictionary];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:v3];
  }
  else
  {
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      id v10 = "+[NSPCoreData getVendorIdFromDictionary:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)getVendorNameById:(int64_t)a3
{
  id v4 = +[NSPCoreData getVendorDictionary];
  id v5 = v4;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = -[NSObject objectForKey:](v6, "objectForKey:", v11, (void)v16);
          id v13 = [v12 longValue];

          if (v13 == (id)a3)
          {
            id v14 = v11;
            goto LABEL_14;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      long long v22 = (const char *)a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Vendor id %lu not found", buf, 0xCu);
    }
  }
  else
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v22 = "+[NSPCoreData getVendorNameById:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null dictionary", buf, 0xCu);
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

+ (id)initNSPEventsModelPredictor
{
  id v2 = objc_alloc_init((Class)MLModelConfiguration);
  id v3 = v2;
  if (v2)
  {
    [v2 setComputeUnits:0];
    id v4 = +[NSString stringWithFormat:@"%@/%@", @"/usr/libexec/", @"NSPEventsPredictor.mlmodelc"];
    if (!v4)
    {
      long long v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s called with null srcStr", buf, 0xCu);
      }
      id v36 = 0;
      goto LABEL_51;
    }
    uint64_t v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
    v46 = (char *)v5;
    if (!v5)
    {
      id v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null srcURL", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_50;
    }
    id v6 = (const char *)v5;
    id v7 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
    id v8 = v7;
    if (!v7)
    {
      uint64_t v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null paths", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_49;
    }
    uint64_t v9 = [v7 firstObject];
    if (!v9)
    {
      id v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null applicationSupportDirectory", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_48;
    }
    double v45 = v9;
    id v10 = +[NSString stringWithFormat:@"%@/networkserviceproxy/%@", v9, @"NSPEventsPredictor.mlmodelc"];
    if (!v10)
    {
      id v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null dstStr", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_47;
    }
    id v11 = +[NSURL fileURLWithPath:v10 isDirectory:1];
    id v12 = v11;
    if (!v11)
    {
      id v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null dstURL", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_46;
    }
    id v44 = v8;
    id v13 = [v11 path];
    id v14 = +[NSFileManager defaultManager];
    uint64_t v15 = v14;
    if (!v14)
    {
      nplog_obj();
      long long v16 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_FAULT, "%s called with null manager", buf, 0xCu);
      }
      long long v19 = 0;
      id v36 = 0;
      goto LABEL_45;
    }
    uint64_t v43 = v13;
    if ([v14 fileExistsAtPath:v13])
    {
      id v51 = 0;
      long long v16 = [[NSPEventsPredictor alloc] initWithContentsOfURL:v6 configuration:v3 error:&v51];
      long long v17 = v51;
      if (!v16)
      {
        nplog_obj();
        long long v16 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v53 = v6;
          __int16 v54 = 2112;
          id v55 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "Failed to initialize base model at %@ error with %@", buf, 0x16u);
        }
        id v36 = 0;
        long long v19 = v17;
        goto LABEL_44;
      }
      uint64_t v50 = v17;
      long long v18 = [[NSPEventsPredictor alloc] initWithContentsOfURL:v12 configuration:v3 error:&v50];
      long long v19 = v50;

      if (!v18)
      {
        id v37 = nplog_obj();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v53 = (const char *)v12;
          __int16 v54 = 2112;
          id v55 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to initialize personalized model at %@ error with %@", buf, 0x16u);
        }

        id v36 = 0;
        goto LABEL_44;
      }
      id v41 = v4;
      id v42 = v3;
      uint32_t v20 = [(NSPEventsPredictor *)v16 model];
      id v21 = [(NSPEventsPredictor *)v18 model];
      long long v22 = +[NSPCoreData compareModelVersion:v20 model2:v21];

      if (v22)
      {
        id v49 = v19;
        unsigned __int8 v23 = [v15 removeItemAtURL:v12 error:&v49];
        long long v24 = v49;

        if (v23)
        {

          id v4 = v41;
          id v6 = v46;
LABEL_16:
          long long v25 = v4;
          long long v26 = nplog_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v53 = v6;
            __int16 v54 = 2112;
            id v55 = v12;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "copy base model from %@ to %@", buf, 0x16u);
          }

          id v48 = v24;
          unsigned __int8 v27 = [v15 copyItemAtURL:v6 toURL:v12 error:&v48];
          id v28 = v48;

          if ((v27 & 1) == 0)
          {
            nplog_obj();
            long long v16 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue();
            id v13 = v43;
            if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v53 = v6;
              __int16 v54 = 2112;
              id v55 = v12;
              __int16 v56 = 2112;
              v57 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "Failed to copy model from %@ to %@ error: %@", buf, 0x20u);
            }
            id v36 = 0;
            long long v19 = v28;
            id v4 = v25;
            id v3 = v42;
            goto LABEL_45;
          }
          v47 = v28;
          long long v16 = [[NSPEventsPredictor alloc] initWithContentsOfURL:v12 configuration:v42 error:&v47];
          long long v19 = v47;

          if (v16)
          {
            __int16 v29 = [(NSPEventsPredictor *)v16 model];
            double v30 = +[NSPCoreData updateVendorDictionaryFromModel:v29];

            id v4 = v25;
            id v3 = v42;
            if (!v30)
            {
              id v31 = nplog_obj();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to update vendor dictionary from model", buf, 2u);
              }
            }
            id v32 = nplog_obj();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              id v33 = [(NSPEventsPredictor *)v16 model];
              id v34 = +[NSPCoreData getModelVersion:v33];
              *(_DWORD *)buf = 138412546;
              id v53 = (const char *)v12;
              __int16 v54 = 2112;
              id v55 = v34;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Initialized NSPEventsPredictor at URL:%@ version:%@", buf, 0x16u);
            }
            id v35 = v16;
            id v36 = v16;
            goto LABEL_44;
          }
          double v38 = nplog_obj();
          id v4 = v25;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v53 = (const char *)v12;
            __int16 v54 = 2112;
            id v55 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to initialize model at %@ error with %@", buf, 0x16u);
          }

          id v36 = 0;
LABEL_43:
          id v3 = v42;
LABEL_44:
          id v13 = v43;
LABEL_45:

          id v8 = v44;
LABEL_46:

LABEL_47:
          uint64_t v9 = v45;
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
        __int16 v39 = nplog_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = (const char *)v24;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to remove old personalized model %@", buf, 0xCu);
        }
        long long v19 = v24;
      }
      else
      {
        __int16 v39 = nplog_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
          _os_log_fault_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "%s called with null result", buf, 0xCu);
        }
      }

      id v36 = 0;
      id v4 = v41;
      goto LABEL_43;
    }
    id v42 = v3;
    long long v24 = 0;
    goto LABEL_16;
  }
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v53 = "+[NSPCoreData initNSPEventsModelPredictor]";
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
  }
  id v36 = 0;
LABEL_52:

  return v36;
}

+ (id)getNSPEventsNormalizer
{
  id v2 = (void *)qword_100123258;
  if (qword_100123258) {
    goto LABEL_9;
  }
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing NSPEventsNormalizer", buf, 2u);
  }

  id v4 = +[NSURL fileURLWithPath:@"/usr/libexec/NSPEventsNormalizer.mlmodelc" isDirectory:1];
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init((Class)MLModelConfiguration);
  if (v6)
  {
    id v7 = v6;
    [v6 setComputeUnits:0];
    id v14 = 0;
    id v8 = [[NSPEventsNormalizer alloc] initWithContentsOfURL:v4 configuration:v7 error:&v14];
    id v9 = v14;
    id v10 = (void *)qword_100123258;
    qword_100123258 = (uint64_t)v8;

    if (qword_100123258)
    {

      id v2 = (void *)qword_100123258;
LABEL_9:
      id v11 = v2;
      goto LABEL_10;
    }
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v16 = v4;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to initialize normalizer model %@ error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v16 = "+[NSPCoreData getNSPEventsNormalizer]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
    }
  }

  id v11 = 0;
LABEL_10:

  return v11;
}

+ (id)getNSPEventsDenormalizer
{
  id v2 = (void *)qword_100123260;
  if (qword_100123260) {
    goto LABEL_9;
  }
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing NSPEventsDenormalizer", buf, 2u);
  }

  id v4 = +[NSURL fileURLWithPath:@"/usr/libexec/NSPEventsDenormalizer.mlmodelc" isDirectory:1];
  uint64_t v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init((Class)MLModelConfiguration);
  if (v6)
  {
    id v7 = v6;
    [v6 setComputeUnits:0];
    id v14 = 0;
    id v8 = [[NSPEventsDenormalizer alloc] initWithContentsOfURL:v4 configuration:v7 error:&v14];
    id v9 = v14;
    id v10 = (void *)qword_100123260;
    qword_100123260 = (uint64_t)v8;

    if (qword_100123260)
    {

      id v2 = (void *)qword_100123260;
LABEL_9:
      id v11 = v2;
      goto LABEL_10;
    }
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v16 = v4;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to initialize denormalizer model %@ error:%@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v16 = "+[NSPCoreData getNSPEventsDenormalizer]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
    }
  }

  id v11 = 0;
LABEL_10:

  return v11;
}

+ (id)getNSPEventsPredictor
{
  id v2 = (void *)qword_100123268;
  if (!qword_100123268)
  {
    uint64_t v3 = +[NSPCoreData initNSPEventsModelPredictor];
    id v4 = (void *)qword_100123268;
    qword_100123268 = v3;

    id v2 = (void *)qword_100123268;
  }

  return v2;
}

+ (void)printMLMultiArray:(id)a3
{
  id v3 = a3;
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v37 = [v3 shape];
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v43 = v3;
    *(_WORD *)&v43[8] = 2112;
    id v44 = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "mlmultiarray shape %@ %@", buf, 0x16u);
  }
  uint64_t v5 = [v3 shape];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= 3)
  {
    id v7 = [v3 shape];
    id v8 = [v7 objectAtIndexedSubscript:0];
    int v9 = [v8 intValue];

    if (v9 >= 1)
    {
      signed int v39 = 0;
      *(void *)&long long v10 = 67109890;
      long long v38 = v10;
      do
      {
        id v11 = [v3 shape:v38];
        id v12 = [v11 objectAtIndexedSubscript:1];
        int v13 = [v12 intValue];

        if (v13 >= 1)
        {
          for (signed int i = 0; i < v33; ++i)
          {
            id v14 = [v3 shape];
            uint64_t v15 = [v14 objectAtIndexedSubscript:2];
            int v16 = [v15 intValue];

            if (v16 >= 1)
            {
              signed int v17 = 0;
              do
              {
                id v18 = [v3 strides];
                long long v19 = [v18 objectAtIndexedSubscript:0];
                unsigned int v41 = [v19 intValue];
                uint32_t v20 = [v3 strides];
                id v21 = [v20 objectAtIndexedSubscript:1];
                unsigned int v22 = [v21 intValue];
                unsigned __int8 v23 = [v3 strides];
                long long v24 = [v23 objectAtIndexedSubscript:2];
                unsigned int v25 = [v24 intValue];

                long long v26 = nplog_obj();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  double v30 = [v3 objectAtIndexedSubscript:(int)(v41 * v39 + v22 * i + v25 * v17)];
                  *(_DWORD *)buf = v38;
                  *(_DWORD *)uint64_t v43 = v39;
                  *(_WORD *)&v43[4] = 1024;
                  *(_DWORD *)&v43[6] = i;
                  LOWORD(v44) = 1024;
                  *(_DWORD *)((char *)&v44 + 2) = v17;
                  HIWORD(v44) = 2112;
                  double v45 = v30;
                  _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "mlmodel data (%d %d %d: %@", buf, 0x1Eu);
                }
                ++v17;
                unsigned __int8 v27 = [v3 shape];
                id v28 = [v27 objectAtIndexedSubscript:2];
                signed int v29 = [v28 intValue];
              }
              while (v17 < v29);
            }
            id v31 = [v3 shape];
            id v32 = [v31 objectAtIndexedSubscript:1];
            signed int v33 = [v32 intValue];
          }
        }
        id v34 = [v3 shape];
        id v35 = [v34 objectAtIndexedSubscript:0];
        signed int v36 = [v35 intValue];

        ++v39;
      }
      while (v39 < v36);
    }
  }
}

+ (id)normalizeData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPCoreData getNSPEventsNormalizer];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 model];
    id v7 = [v6 modelDescription];
    id v8 = [v7 inputDescriptionsByName];
    int v9 = [v8 objectForKeyedSubscript:@"normalizer_input"];

    long long v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v85 = [v9 multiArrayConstraint];
      v86 = [v85 shape];
      *(_DWORD *)buf = 138412290;
      __int16 v98 = v86;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "normalizer model shape %@", buf, 0xCu);
    }
    id v11 = [v9 multiArrayConstraint];
    id v12 = [v11 shape];

    if (!v12)
    {
      unsigned __int8 v27 = nplog_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v98 = "+[NSPCoreData normalizeData:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null normalizerShape", buf, 0xCu);
      }
      goto LABEL_39;
    }
    int v13 = [v3 shape];

    if (v12 == v13)
    {
      id v94 = 0;
      v81 = [v5 predictionFromNormalizer_input:v3 error:&v94];
      unsigned __int8 v27 = v94;
      if (v81)
      {
        v80 = [v81 Identity];
      }
      else
      {
        v82 = nplog_obj();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v98 = (const char *)v27;
          _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "Failed to normalize the input. error:%@", buf, 0xCu);
        }

        v80 = 0;
      }

      goto LABEL_40;
    }
    id v14 = [v3 shape];
    id v15 = [v14 count];
    id v16 = [v12 count];

    if (v15 == v16)
    {
      signed int v17 = [v3 shape];
      id v18 = [v17 count];

      if (v18)
      {
        uint64_t v19 = 0;
        unsigned int v20 = 1;
        while (1)
        {
          id v21 = [v3 shape];
          unsigned int v22 = [v21 objectAtIndexedSubscript:v19];
          unsigned __int8 v23 = [v12 objectAtIndexedSubscript:v19];

          if (v22 > v23) {
            break;
          }
          uint64_t v19 = v20;
          long long v24 = [v3 shape];
          id v25 = [v24 count];

          if ((unint64_t)v25 <= v20++) {
            goto LABEL_11;
          }
        }
        unsigned __int8 v27 = nplog_obj();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
LABEL_11:
      unsigned __int8 v27 = [objc_alloc((Class)MLMultiArray) initWithShape:v12 dataType:65568 error:0];
      if (!v27)
      {
        id v53 = nplog_obj();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v98 = "+[NSPCoreData normalizeData:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "%s called with null reshapedInput", buf, 0xCu);
        }
        v80 = 0;
        goto LABEL_48;
      }
      id v28 = [v3 shape];
      id v29 = [v28 count];

      if ((unint64_t)v29 >= 3)
      {
        long long v91 = v5;
        long long v92 = v27;
        double v90 = v9;
        double v30 = [v3 shape];
        id v31 = [v30 objectAtIndexedSubscript:1];
        unsigned int v32 = [v31 unsignedIntValue];

        if (v32)
        {
          uint64_t v33 = 0;
          do
          {
            id v34 = +[NSNumber numberWithUnsignedInt:0];
            v96[0] = v34;
            id v35 = +[NSNumber numberWithUnsignedInt:v33];
            v96[1] = v35;
            signed int v36 = +[NSNumber numberWithUnsignedInt:0];
            v96[2] = v36;
            id v37 = +[NSArray arrayWithObjects:v96 count:3];
            long long v38 = +[NSMutableArray arrayWithArray:v37];

            signed int v39 = [v3 shape];
            id v40 = [v39 objectAtIndexedSubscript:2];
            LODWORD(v35) = [v40 unsignedIntValue];

            if (v35)
            {
              uint64_t v41 = 0;
              do
              {
                id v42 = (char *)[v38 count] - 1;
                uint64_t v43 = +[NSNumber numberWithUnsignedInt:v41];
                [v38 replaceObjectAtIndex:v42 withObject:v43];

                id v44 = [v3 objectForKeyedSubscript:v38];
                [v92 setObject:v44 forKeyedSubscript:v38];

                uint64_t v41 = (v41 + 1);
                double v45 = [v3 shape];
                v46 = [v45 objectAtIndexedSubscript:2];
                unsigned int v47 = [v46 unsignedIntValue];
              }
              while (v41 < v47);
            }

            uint64_t v33 = (v33 + 1);
            id v48 = [v3 shape];
            id v49 = [v48 objectAtIndexedSubscript:1];
            unsigned int v50 = [v49 unsignedIntValue];
          }
          while (v33 < v50);
        }
        id v93 = 0;
        uint64_t v5 = v91;
        unsigned __int8 v27 = v92;
        id v51 = [v91 predictionFromNormalizer_input:v92 error:&v93];
        uint64_t v52 = v93;
        id v53 = v52;
        if (v51)
        {
          v88 = v52;
          v89 = v12;
          id v54 = objc_alloc((Class)MLMultiArray);
          id v55 = [v3 shape];
          id v56 = [v54 initWithShape:v55 dataType:65568 error:0];

          if (v56)
          {
            v57 = [v3 shape];
            uint64_t v58 = [v57 objectAtIndexedSubscript:1];
            unsigned int v59 = [v58 unsignedIntValue];

            if (v59)
            {
              uint64_t v60 = 0;
              do
              {
                id v61 = +[NSNumber numberWithUnsignedInt:0];
                v95[0] = v61;
                uint64_t v62 = +[NSNumber numberWithUnsignedInt:v60];
                v95[1] = v62;
                double v63 = +[NSNumber numberWithUnsignedInt:0];
                v95[2] = v63;
                uint64_t v64 = +[NSArray arrayWithObjects:v95 count:3];
                id v65 = +[NSMutableArray arrayWithArray:v64];

                v66 = [v3 shape];
                v67 = [v66 objectAtIndexedSubscript:2];
                LODWORD(v63) = [v67 unsignedIntValue];

                if (v63)
                {
                  uint64_t v68 = 0;
                  do
                  {
                    id v69 = (char *)[v65 count] - 1;
                    v70 = +[NSNumber numberWithUnsignedInt:v68];
                    [v65 replaceObjectAtIndex:v69 withObject:v70];

                    v71 = [v51 Identity];
                    v72 = [v71 objectForKeyedSubscript:v65];
                    [v56 setObject:v72 forKeyedSubscript:v65];

                    uint64_t v68 = (v68 + 1);
                    v73 = [v3 shape];
                    v74 = [v73 objectAtIndexedSubscript:2];
                    unsigned int v75 = [v74 unsignedIntValue];
                  }
                  while (v68 < v75);
                }

                uint64_t v60 = (v60 + 1);
                v76 = [v3 shape];
                v77 = [v76 objectAtIndexedSubscript:1];
                unsigned int v78 = [v77 unsignedIntValue];
              }
              while (v60 < v78);
            }
            uint64_t v79 = v56;
            v80 = v79;
          }
          else
          {
            v87 = nplog_obj();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              __int16 v98 = "+[NSPCoreData normalizeData:]";
              _os_log_fault_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_FAULT, "%s called with null reshapedOutput", buf, 0xCu);
            }

            uint64_t v79 = 0;
            v80 = 0;
          }
          int v9 = v90;
          uint64_t v5 = v91;
          id v53 = v88;
          id v12 = v89;
          unsigned __int8 v27 = v92;
        }
        else
        {
          uint64_t v79 = nplog_obj();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v98 = (const char *)v53;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to normalize the input. error:%@", buf, 0xCu);
          }
          v80 = 0;
          int v9 = v90;
        }

LABEL_48:
        goto LABEL_40;
      }
    }
    else
    {
      unsigned __int8 v27 = nplog_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_38:
        v83 = [v3 shape];
        *(_DWORD *)buf = 138412546;
        __int16 v98 = v83;
        __int16 v99 = 2112;
        __int16 v100 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Incompatiable shape (%@ vs %@)", buf, 0x16u);
      }
    }
LABEL_39:
    v80 = 0;
LABEL_40:

    goto LABEL_41;
  }
  int v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v98 = "+[NSPCoreData normalizeData:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null normalizer", buf, 0xCu);
  }
  v80 = 0;
LABEL_41:

  return v80;
}

+ (id)prepareMLData:(id)a3 startAt:(unsigned int)a4 dataShape:(id)a5
{
  id v58 = a3;
  id v7 = a5;
  id v8 = [objc_alloc((Class)MLMultiArray) initWithShape:v7 dataType:65568 error:0];
  if (!v8)
  {
    unsigned int v47 = nplog_obj();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v65 = "+[NSPCoreData prepareMLData:startAt:dataShape:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "%s called with null sample", buf, 0xCu);
    }

    goto LABEL_16;
  }
  int v9 = [v7 objectAtIndexedSubscript:1];
  unsigned int v10 = [v9 unsignedIntValue];

  if ((unint64_t)[v58 count] <= v10)
  {
LABEL_16:
    id v46 = 0;
    goto LABEL_17;
  }
  id v50 = v7;
  id v51 = v8;
  uint64_t v12 = v10 + a4 + 1;
  uint64_t v53 = a4 + 1;
  if (a4 + 1 < v12)
  {
    uint64_t v13 = 0;
    uint64_t v52 = v12 - v53;
    *(void *)&long long v11 = 138412290;
    long long v49 = v11;
    do
    {
      id v61 = [v58 objectAtIndexedSubscript:v53 + v13 - 1];
      id v14 = [v58 objectAtIndexedSubscript:v53 + v13];
      id v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v49;
        id v65 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Preparing input from NSPEvent :%@", buf, 0xCu);
      }

      uint64_t v16 = [v14 date];
      signed int v17 = +[NSCalendar currentCalendar];
      id v59 = [v17 component:32 fromDate:v16];

      id v18 = +[NSCalendar currentCalendar];
      id v19 = [v18 component:64 fromDate:v16];

      unsigned int v20 = +[NSCalendar currentCalendar];
      id v21 = (void *)v16;
      id v22 = [v20 component:128 fromDate:v16];

      unsigned __int8 v23 = [v14 date];
      [v23 timeIntervalSinceReferenceDate];
      double v25 = v24;
      long long v26 = [v61 date];
      [v26 timeIntervalSinceReferenceDate];
      double v28 = v27;

      id v29 = [v14 vendor];
      double v30 = +[NSPCoreData getVendorIdFromDictionary:v29];
      if (v30)
      {
        v57 = v29;
        *(float *)&double v31 = (float)(int)([v14 eventType] + 1);
        id v55 = +[NSNumber numberWithFloat:v31];
        v63[0] = v55;
        uint64_t v60 = v30;
        *(float *)&double v32 = (float)(int)[v14 tokenCount];
        id v54 = +[NSNumber numberWithFloat:v32];
        v63[1] = v54;
        uint64_t v33 = +[NSCalendar currentCalendar];
        id v56 = v21;
        *(float *)&double v34 = (float)(uint64_t)[v33 component:512 fromDate:v21];
        id v35 = +[NSNumber numberWithFloat:v34];
        v63[2] = v35;
        *(float *)&double v36 = (float)((uint64_t)v22 + 3600 * (void)v59 + 60 * (void)v19);
        id v37 = +[NSNumber numberWithFloat:v36];
        v63[3] = v37;
        *(float *)&double v38 = v25 - v28;
        signed int v39 = +[NSNumber numberWithFloat:v38];
        v63[4] = v39;
        *(float *)&double v40 = (float)[v60 unsignedIntValue];
        uint64_t v41 = +[NSNumber numberWithFloat:v40];
        v63[5] = v41;
        id v42 = +[NSArray arrayWithObjects:v63 count:6];

        uint64_t v43 = +[NSNumber numberWithInt:0];
        v62[0] = v43;
        id v44 = +[NSNumber numberWithUnsignedLong:v13];
        v62[1] = v44;
        double v45 = +[NSArray arrayWithObjects:v62 count:2];

        id v29 = v57;
        +[NSPCoreData prepareModelInputWithFeatures:v51 keyedSubscripts:v45 features:v42];

        double v30 = v60;
        id v21 = v56;
      }
      else
      {
        id v42 = nplog_obj();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v49;
          id v65 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Invalid vendor id for vendor %@", buf, 0xCu);
        }
      }

      ++v13;
    }
    while (v52 != v13);
  }
  id v8 = v51;
  id v46 = v51;
  id v7 = v50;
LABEL_17:

  return v46;
}

+ (id)prepareTokenEventsFromPrediction:(id)a3
{
  id v3 = a3;
  uint64_t v60 = +[NSPCoreData childCoreDataContext];
  if (!v60)
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v64 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s called with null context", buf, 0xCu);
    }
    goto LABEL_4;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (!v4)
  {
    v57 = nplog_obj();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v64 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "%s called with null array", buf, 0xCu);
    }

    uint64_t v5 = 0;
    goto LABEL_4;
  }
  uint64_t v5 = v4;
  id v6 = [v3 shape];
  id v7 = [v6 count];

  if ((unint64_t)v7 < 3)
  {
LABEL_4:
    id v8 = 0;
    goto LABEL_18;
  }
  id v59 = v5;
  int v9 = [v3 shape];
  unsigned int v10 = [v9 objectAtIndexedSubscript:0];
  int v11 = [v10 intValue];

  if (v11 < 1)
  {
LABEL_17:
    uint64_t v5 = v59;
    id v8 = v5;
  }
  else
  {
    unsigned int v61 = 0;
    *(void *)&long long v12 = 134218242;
    long long v58 = v12;
    uint64_t v62 = v3;
    while (1)
    {
      uint64_t v13 = [v3 shape:v58];
      id v14 = [v13 objectAtIndexedSubscript:1];
      int v15 = [v14 intValue];

      if (v15 >= 1) {
        break;
      }
LABEL_16:
      uint64_t v52 = [v3 shape];
      uint64_t v53 = [v52 objectAtIndexedSubscript:0];
      signed int v54 = [v53 intValue];

      if ((int)++v61 >= v54) {
        goto LABEL_17;
      }
    }
    uint64_t v16 = 0;
    while (1)
    {
      signed int v17 = [[NSPTokenEvent alloc] initWithContext:v60];
      if (!v17) {
        break;
      }
      id v18 = v17;
      id v19 = +[NSNumber numberWithInt:v61];
      v70[0] = v19;
      unsigned int v20 = +[NSNumber numberWithInt:v16];
      v70[1] = v20;
      id v21 = +[NSNumber numberWithInt:0];
      v70[2] = v21;
      id v22 = +[NSArray arrayWithObjects:v70 count:3];
      unsigned __int8 v23 = [v62 objectForKeyedSubscript:v22];
      [v23 floatValue];
      [(NSPTokenEvent *)v18 setEventType:llroundf(v24) - 1];

      double v25 = +[NSNumber numberWithInt:v61];
      v69[0] = v25;
      long long v26 = +[NSNumber numberWithInt:v16];
      v69[1] = v26;
      double v27 = +[NSNumber numberWithInt:1];
      v69[2] = v27;
      double v28 = +[NSArray arrayWithObjects:v69 count:3];
      id v29 = [v62 objectForKeyedSubscript:v28];
      [v29 floatValue];
      [(NSPTokenEvent *)v18 setTokenCount:llroundf(v30)];

      double v31 = +[NSNumber numberWithInt:v61];
      v68[0] = v31;
      double v32 = +[NSNumber numberWithInt:v16];
      v68[1] = v32;
      uint64_t v33 = +[NSNumber numberWithInt:4];
      v68[2] = v33;
      double v34 = +[NSArray arrayWithObjects:v68 count:3];
      id v35 = [v62 objectForKeyedSubscript:v34];
      [v35 floatValue];
      double v37 = v36;

      double v38 = +[NSDate date];
      signed int v39 = [v38 dateByAddingTimeInterval:v37];
      [(NSPTokenEvent *)v18 setDate:v39];

      double v40 = +[NSNumber numberWithInt:v61];
      v67[0] = v40;
      uint64_t v41 = +[NSNumber numberWithInt:v16];
      v67[1] = v41;
      id v42 = +[NSNumber numberWithInt:5];
      v67[2] = v42;
      uint64_t v43 = +[NSArray arrayWithObjects:v67 count:3];
      id v44 = [v62 objectForKeyedSubscript:v43];
      [v44 floatValue];
      unint64_t v46 = llroundf(v45);

      unsigned int v47 = +[NSPCoreData getVendorNameById:v46];
      if (v47)
      {
        [(NSPTokenEvent *)v18 setVendor:v47];
        [v59 addObject:v18];
        id v48 = nplog_obj();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v64 = (const char *)v18;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "NSP event from prediction: %@", buf, 0xCu);
        }
      }
      else
      {
        [(NSPTokenEvent *)v18 setVendor:@"Unknown"];
        id v48 = nplog_obj();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v58;
          uint64_t v64 = (const char *)v46;
          __int16 v65 = 2112;
          v66 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Incorrect prediction for Vendor %lu, event:%@", buf, 0x16u);
        }
      }

      uint64_t v16 = (v16 + 1);
      id v3 = v62;
      long long v49 = [v62 shape];
      id v50 = [v49 objectAtIndexedSubscript:1];
      int v51 = [v50 intValue];

      if ((int)v16 >= v51) {
        goto LABEL_16;
      }
    }
    id v56 = nplog_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v64 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "%s called with null event", buf, 0xCu);
    }

    id v8 = 0;
    id v3 = v62;
    uint64_t v5 = v59;
  }
LABEL_18:

  return v8;
}

+ (void)prepareModelInputWithFeatures:(id)a3 keyedSubscripts:(id)a4 features:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = +[NSMutableArray arrayWithArray:a4];
  unsigned int v10 = +[NSNumber numberWithInt:0];
  [v9 addObject:v10];

  int v11 = [v7 shape];
  id v12 = [v11 count];
  id v13 = [v9 count];

  if (v12 == v13)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v8;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v24;
      do
      {
        id v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v19);
          id v21 = +[NSNumber numberWithInt:(char *)v19 + v17];
          [v9 replaceObjectAtIndex:[v9 count] - 1 withObject:v21];
          [v7 setObject:v20 forKeyedSubscript:v9];

          id v19 = (char *)v19 + 1;
        }
        while (v16 != v19);
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v17 = (v17 + v19);
      }
      while (v16);
    }

    id v8 = v22;
  }
}

+ (id)prepareInputForPrediction:(id)a3 vendor:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 objectAtIndexedSubscript:1];
  id v6 = +[NSPCoreData getVendorDictionary];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 allKeys];
    int v9 = +[NSPCoreData fetchLatestEvents:vendors:](NSPCoreData, "fetchLatestEvents:vendors:", (char *)[v5 unsignedLongValue] + 1, v8);
    unsigned int v10 = v9;
    if (v9)
    {
      id v11 = [v9 count];
      if ((unint64_t)v11 < [v5 unsignedIntValue] + 1)
      {
        id v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
      id v13 = [objc_alloc((Class)MLMultiArray) initWithShape:v4 dataType:65568 error:0];
      if (v13)
      {
        id v14 = v13;
        id v15 = +[NSPCoreData prepareMLData:v10 startAt:0 dataShape:v4];

        id v12 = +[NSPCoreData normalizeData:v15];
LABEL_7:

        goto LABEL_8;
      }
      id v15 = nplog_obj();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
LABEL_18:
        id v12 = 0;
        goto LABEL_7;
      }
      int v18 = 136315138;
      id v19 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      uint64_t v17 = "%s called with null modelInput";
    }
    else
    {
      id v15 = nplog_obj();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        goto LABEL_18;
      }
      int v18 = 136315138;
      id v19 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      uint64_t v17 = "%s called with null events";
    }
    _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_18;
  }
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v18 = 136315138;
    id v19 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v18, 0xCu);
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

+ (void)handleNSPEventsPredictions:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (signed int i = 0; i != v5; signed int i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        int v9 = nplog_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Prediction of NSP event: %@", buf, 0xCu);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
}

+ (void)predictNSPEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPCoreData getNSPEventsPredictor];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 model];
    id v7 = [v6 modelDescription];
    uint64_t v8 = [v7 inputDescriptionsByName];
    int v9 = [v8 objectForKeyedSubscript:@"lstm_input"];

    long long v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v25 = [v9 multiArrayConstraint];
      long long v26 = [v25 shape];
      *(_DWORD *)buf = 138412290;
      double v34 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "model shape %@", buf, 0xCu);
    }
    long long v11 = [v9 multiArrayConstraint];
    long long v12 = [v11 shape];

    if (!v12)
    {
      long long v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v34 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null shape", buf, 0xCu);
      }
      goto LABEL_20;
    }
    long long v13 = +[NSPCoreData prepareInputForPrediction:v12 vendor:v3];
    if (!v13)
    {
      uint64_t v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v34 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null modelInput", buf, 0xCu);
      }
      goto LABEL_19;
    }
    +[NSPCoreData printMLMultiArray:v13];
    id v32 = 0;
    id v14 = [v5 predictionFromLstm_input:v13 error:&v32];
    uint64_t v15 = v32;
    if (!v14)
    {
      uint64_t v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v34 = (const char *)v15;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to predict next NSP event %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    id v16 = [v14 Identity];
    +[NSPCoreData printMLMultiArray:v16];

    uint64_t v17 = +[NSPCoreData getNSPEventsDenormalizer];
    if (!v17)
    {
      uint64_t v20 = nplog_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v34 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null denormalizer", buf, 0xCu);
      }
      long long v24 = v15;
      goto LABEL_17;
    }
    float v30 = v5;
    int v18 = v9;
    id v19 = [v14 Identity];
    double v31 = v15;
    uint64_t v20 = [v17 predictionFromDenormalizer_input:v19 error:&v31];
    id v29 = v31;

    if (v20)
    {
      id v28 = v3;
      id v21 = [v20 Identity];
      +[NSPCoreData printMLMultiArray:v21];

      id v22 = [v20 Identity];
      long long v23 = +[NSPCoreData prepareTokenEventsFromPrediction:v22];

      if (!v23)
      {
        double v27 = nplog_obj();
        int v9 = v18;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          double v34 = "+[NSPCoreData predictNSPEvent:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null predictedEvents", buf, 0xCu);
        }

        long long v23 = 0;
        id v3 = v28;
        goto LABEL_15;
      }
      +[NSPCoreData handleNSPEventsPredictions:v23];
      id v3 = v28;
    }
    else
    {
      long long v23 = nplog_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v24 = v29;
        double v34 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to denormalize the data %@", buf, 0xCu);
        int v9 = v18;
        id v5 = v30;
        goto LABEL_16;
      }
    }
    int v9 = v18;
LABEL_15:
    long long v24 = v29;
    id v5 = v30;
LABEL_16:

LABEL_17:
    uint64_t v15 = v24;
LABEL_18:

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  int v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v34 = "+[NSPCoreData predictNSPEvent:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null mlmodel", buf, 0xCu);
  }
LABEL_21:
}

+ (id)tokenTypeEnumToString:(int)a3
{
  if (a3 > 5) {
    return @"Unknown";
  }
  else {
    return *(&off_100106810 + a3);
  }
}

- (NSPPersistentContainer)persistentContainer
{
  return (NSPPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end