@interface FMCoreData
- (BOOL)deleteCongestionAreas:(id)a3 andAssociatedEntitiesWithContext:(id)a4;
- (BOOL)deleteOutOfServiceAreas:(id)a3 AndAssociatedEntitiesWithContext:(id)a4;
- (BOOL)deleteTSAnomalies:(id)a3 andAssociatedEntitiesWithContext:(id)a4;
- (BOOL)isFMCongestionCell:(id)a3 equalToCongestionCell:(id)a4;
- (BOOL)isRushHourAtDate:(id)a3;
- (BOOL)isRushHourAtDayOfWeek:(signed __int16)a3 andTimeOfDay:(signed __int16)a4;
- (BOOL)updateStoredConfigurationFrom:(id)a3 to:(id)a4;
- (FMCoreData)init;
- (FMCoreData)initWithStoreURL:(id)a3 WithModelURL:(id)a4;
- (NSPersistentContainer)container;
- (dispatch_queue_s)queue;
- (dispatch_source_s)databaseMaintenanceTimer;
- (double)compareFMTSEventTimestamp:(id)a3 withTSEventTimeUntilAnomaly:(id)a4 usingBaseTimestamp:(unint64_t)a5 withTimeDistanceMaxTime:(int)a6 withPredictionAdvanceTime:(int)a7 withContext:(id)a8;
- (id)compareObservedEvents:(id)a3 withStoredEvents:(id)a4 ofType:(signed __int16)a5 withPredictionAdvanceTime:(int)a6 atCurrentTimestamp:(unint64_t)a7 withContext:(id)a8;
- (id)compareObservedEvents:(id)a3 withStoredEvents:(id)a4 withPredictionAdvanceTime:(int)a5 atCurrentTimestamp:(unint64_t)a6 withContext:(id)a7 withEventComparator:(id)a8;
- (id)congestionArea:(id)a3 toFMCongestionPredictionWithContext:(id)a4;
- (id)congestionCell:(id)a3 toFMCongestionCellWithContext:(id)a4;
- (id)congestionCells:(id)a3 toFMCongestionCellsWithContext:(id)a4;
- (id)convertFMCongestionCells:(id)a3 toUpdatedCongestionPrevCellsWithContext:(id)a4;
- (id)createCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 startTime:(id)a6;
- (id)createCongestionCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 congestionMetric:(id)a10 timestamp:(id)a11;
- (id)createCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 timestamp:(id)a10;
- (id)createLocationOfInterestAt:(id)a3 WithContext:(id)a4;
- (id)createOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 entryLocation:(id)a9 exitLocation:(id)a10 startTime:(id)a11;
- (id)createServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14 timestamp:(id)a15;
- (id)createTSAnomalyWithContext:(id)a3 anomaly:(id)a4 homePLMN:(id)a5;
- (id)createTSEventWithContext:(id)a3 type:(signed __int16)a4 timeUntilAnomaly:(int)a5 details:(id)a6 eventOf:(id)a7;
- (id)createTSPredictionWithContext:(id)a3 prediction:(id)a4;
- (id)deleteCongestionAreasOverThresholdCount:(unint64_t)a3 withContext:(id)a4;
- (id)deleteOutOfServiceAreasOverThresholdCount:(unint64_t)a3 WithContext:(id)a4;
- (id)deleteTSAnomaliesOverThresholdCount:(unint64_t)a3 withContext:(id)a4;
- (id)filterCongestionAreasWithContext:(id)a3 unfilteredCongestionAreas:(id)a4 withExactPrevCells:(id)a5;
- (id)filterOutOfServiceAreasWithContext:(id)a3 unfilteredOutOfServiceAreas:(id)a4 WithExactPrevCells:(id)a5;
- (id)fmCongestionCellsToExistingCongestionPrevCellsWithContext:(id)a3 cells:(id)a4;
- (id)fmServingCellsToExistingServingCellsWithContext:(id)a3 cells:(id)a4;
- (id)fmServingCellsToServingCellsWithContext:(id)a3 cells:(id)a4;
- (id)getAnomalyPredictionsForHomePLMN:(id)a3 andEvents:(id)a4 atCurrentTimestamp:(unint64_t)a5;
- (id)getCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 timeOfDay:(signed __int16)a6 dayOfWeek:(signed __int16)a7;
- (id)getCongestionCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 atTime:(id)a10;
- (id)getCongestionPredictionsForSubscriptionID:(id)a3 andPrevCells:(id)a4 atTime:(id)a5;
- (id)getCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9;
- (id)getFMTSPredictionsFromRelevantTSAnomalies:(id)a3 atCurrentTimestamp:(unint64_t)a4 withContext:(id)a5;
- (id)getLatestStoredConfiguration;
- (id)getLocationOfInterestAt:(id)a3 WithContext:(id)a4;
- (id)getNewBackgroundContext;
- (id)getOrCreateAndUpdateCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 timestamp:(id)a10;
- (id)getOrCreateLocationOfInterestAt:(id)a3 WithContext:(id)a4;
- (id)getOrCreateServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14 timestamp:(id)a15;
- (id)getOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 timeOfDay:(signed __int16)a9;
- (id)getOutOfServiceAreasWithoutNextVisitWithContext:(id)a3 After:(id)a4;
- (id)getPreviouslyStoredMatchingFMCongestionCell:(id)a3;
- (id)getServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14;
- (id)handleCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 startTime:(id)a6;
- (id)handleOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 startTime:(id)a9 entryLocation:(id)a10 exitLocation:(id)a11;
- (id)sortObjects:(id)a3 byKey:(id)a4;
- (int64_t)getDifferenceBetweenMinutesSinceMidnight:(int64_t)a3 b:(int64_t)a4;
- (int64_t)getMinutesSinceMidnightFrom:(int64_t)a3 addingOffset:(int64_t)a4;
- (signed)NSDate:(id)a3 toTimeOfDayInTimeZone:(id)a4;
- (signed)NSDateToTimeOfDay:(id)a3;
- (signed)getDayOfWeekFromDate:(id)a3;
- (signed)getTimeOfDayFromDate:(id)a3;
- (unint64_t)deleteOutOfServiceAreasOlderThan:(id)a3 WithContext:(id)a4;
- (void)clearDatabase;
- (void)dealloc;
- (void)deleteCongestionAreasOlderThan:(id)a3 withContext:(id)a4;
- (void)deleteCongestionOccurrencesOlderThan:(id)a3 withContext:(id)a4;
- (void)deleteOrphanedCongestionCellsWithContext:(id)a3;
- (void)deleteOrphanedCongestionPrevCellsWithContext:(id)a3;
- (void)deleteOrphanedTSPredictionsWithContext:(id)a3;
- (void)deleteOutOfServiceDurationsOlderThan:(id)a3 WithContext:(id)a4;
- (void)deleteTSAnomaliesWithContext:(id)a3 olderThan:(id)a4;
- (void)deletedOrphanedLocationsOfInterestWithContext:(id)a3;
- (void)deletedOrphanedServingCellsWithContext:(id)a3;
- (void)finalizedCongestionArea:(id)a3 withSubscriptionID:(id)a4;
- (void)leftOutOfServiceArea:(double)a3 startTime:(id)a4 prevVisit:(id)a5 curVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 nextCell:(id)a9 entryLocation:(id)a10 exitLocation:(id)a11;
- (void)performDatabaseMaintenance;
- (void)sendOnDeviceDBTelemetryEventWithContext:(id)a3 andNumberOfDeletedOOSAreasStale:(unint64_t)a4;
- (void)setContainer:(id)a3;
- (void)setDatabaseMaintenanceTimer:(dispatch_source_s *)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)storeAnomaly:(id)a3 forHomePLMN:(id)a4;
- (void)storePrediction:(id)a3;
- (void)updateCongestionAreaAfterLeavingWithContext:(id)a3 congestionArea:(id)a4 startTime:(id)a5 goodCells:(id)a6 badCells:(id)a7 secondsUntilCongestion:(double)a8 secondsCongestionDuration:(double)a9;
- (void)updateCongestionCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5 congestionMetric:(id)a6;
- (void)updateCongestionPrevCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5;
- (void)updateOutOfServiceAreaAfterLeavingWithContext:(id)a3 outOfServiceArea:(id)a4 startTime:(id)a5 nextCell:(id)a6 duration:(double)a7 entryLocation:(id)a8 exitLocation:(id)a9;
- (void)updateOutOfServiceAreasWithNextVisit:(id)a3;
- (void)updateServingCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5;
- (void)waitForDeviceUnlockAndLoadDataStore;
@end

@implementation FMCoreData

- (id)getPreviouslyStoredMatchingFMCongestionCell:(id)a3
{
  id v4 = a3;
  v5 = [(FMCoreData *)self getNewBackgroundContext];
  v6 = v5;
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = sub_100040868;
    v17 = sub_100040878;
    id v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000059F8;
    v9[3] = &unk_1001B6810;
    v9[4] = self;
    id v10 = v5;
    id v11 = v4;
    v12 = &v13;
    [v10 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001424C0();
    }
    id v7 = 0;
  }

  return v7;
}

- (id)getCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9
{
  id v27 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v26 = v14;
  v20 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionPrevCell"];
  v21 = +[NSPredicate predicateWithFormat:@"(subscriptionID == %@) AND (gci == %@) AND (mcc == %@) AND (mnc == %@) AND (radioAccessTechnology == %@) AND (arfcnOrUarfcn == %@)", v14, v15, v16, v17, v18, v19];
  [v20 setPredicate:v21];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v21 description];
    objc_claimAutoreleasedReturnValue();
    sub_10014AE40();
  }
  id v28 = 0;
  v22 = [v27 executeFetchRequest:v20 error:&v28];
  id v23 = v28;
  if (v23)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v23 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014ADFC();
    }
LABEL_6:
    v24 = 0;
    goto LABEL_12;
  }
  if (![v22 count])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014AD90();
    }
    goto LABEL_6;
  }
  if ((unint64_t)[v22 count] >= 2
    && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_10014ADC4();
  }
  v24 = [v22 firstObject];
LABEL_12:

  return v24;
}

- (id)getCongestionPredictionsForSubscriptionID:(id)a3 andPrevCells:(id)a4 atTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FMConfiguration sharedInstance];
  v12 = [v11 congestionPrevCellsInDatabase];

  if ([v9 count] <= v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = (char *)((unsigned char *)[v9 count] - v12);
  }
  if ([v9 count] < v12) {
    v12 = [v9 count];
  }
  id v14 = objc_msgSend(v9, "subarrayWithRange:", v13, v12);
  id v15 = [(FMCoreData *)self getNewBackgroundContext];
  if (v15)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100040868;
    v33 = sub_100040878;
    id v34 = 0;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001424F4();
    }
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100002E20;
    v22 = &unk_1001B67E8;
    id v23 = self;
    id v24 = v10;
    id v25 = v15;
    id v26 = v14;
    id v28 = &v29;
    id v27 = v8;
    [v25 performBlockAndWait:&v19];
    id v16 = (void *)v30[5];
    if (v16) {
      id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22, v23, v24, v25, v26);
    }
    else {
      id v17 = 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001424C0();
    }
    id v17 = 0;
  }

  return v17;
}

- (id)fmCongestionCellsToExistingCongestionPrevCellsWithContext:(id)a3 cells:(id)a4
{
  id v22 = a3;
  id v18 = a4;
  id v21 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v18;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v9 = [v8 subscriptionID];
        id v10 = [v8 gci];
        id v11 = [v8 mcc];
        v12 = [v8 mnc];
        uint64_t v13 = [v8 rat];
        id v14 = [v8 arfcnOrUarfcn];
        id v15 = -[FMCoreData getCongestionPrevCellWithContext:subscriptionID:gci:mcc:mnc:rat:arfcnOrUarfcn:](self, "getCongestionPrevCellWithContext:subscriptionID:gci:mcc:mnc:rat:arfcnOrUarfcn:", v22, v9, v10, v11, v12, v13, v14, v18);

        if (!v15)
        {

          id v16 = 0;
          goto LABEL_11;
        }
        [v21 addObject:v15];
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v16 = [v21 copy];
LABEL_11:

  return v16;
}

- (id)getCongestionCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 atTime:(id)a10
{
  id v39 = a3;
  id v40 = a4;
  id v41 = a5;
  id v42 = a6;
  id v43 = a7;
  id v44 = a8;
  id v45 = a9;
  id v35 = a10;
  uint64_t v16 = [(FMCoreData *)self getTimeOfDayFromDate:v35];
  uint64_t v17 = [(FMCoreData *)self getDayOfWeekFromDate:v35];
  v47 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionCell"];
  v37 = +[NSPredicate predicateWithFormat:@"(subscriptionID == %@) AND (gci == %@) AND (mcc == %@) AND (mnc == %@) AND (radioAccessTechnology == %@) AND (arfcnOrUarfcn == %@)", v40, v41, v42, v43, v44, v45];
  objc_msgSend(v47, "setPredicate:");
  id v18 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastSeen" ascending:0];
  id v56 = v18;
  id v19 = +[NSArray arrayWithObjects:&v56 count:1];
  [v47 setSortDescriptors:v19];

  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v37 description];
    objc_claimAutoreleasedReturnValue();
    sub_10014ACD4();
  }
  id v52 = 0;
  v38 = [v39 executeFetchRequest:v47 error:&v52];
  id v36 = v52;
  if (v36)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v36 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014AC90();
    }
    goto LABEL_29;
  }
  if (![v38 count])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014AC2C();
    }
    goto LABEL_29;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v38;
  id v20 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v20) {
    goto LABEL_25;
  }
  uint64_t v21 = *(void *)v49;
  do
  {
    id v22 = 0;
    do
    {
      if (*(void *)v49 != v21) {
        objc_enumerationMutation(obj);
      }
      long long v23 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v22);
      long long v24 = [v23 goodCellOf];
      if (v24)
      {
      }
      else
      {
        long long v25 = [v23 badCellOf];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
            sub_10014AC60(&v54, v55);
          }
          goto LABEL_20;
        }
      }
      id v27 = [v23 goodCellOf];
      id v28 = v27;
      if (v27)
      {
        id v29 = v27;
      }
      else
      {
        id v29 = [v23 badCellOf];
      }
      v30 = v29;

      unsigned int v31 = [(FMCoreData *)self isRushHourAtDayOfWeek:v17 andTimeOfDay:v16];
      if (v31 == -[FMCoreData isRushHourAtDayOfWeek:andTimeOfDay:](self, "isRushHourAtDayOfWeek:andTimeOfDay:", [v30 dayOfWeek], objc_msgSend(v30, "timeOfDay")))
      {
        id v33 = v23;

        goto LABEL_30;
      }

LABEL_20:
      id v22 = (char *)v22 + 1;
    }
    while (v20 != v22);
    id v32 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    id v20 = v32;
  }
  while (v32);
LABEL_25:

LABEL_29:
  id v33 = 0;
LABEL_30:

  return v33;
}

- (int64_t)getMinutesSinceMidnightFrom:(int64_t)a3 addingOffset:(int64_t)a4
{
  int64_t v4 = (a4 + a3) % 1440;
  if (v4 >= 0) {
    return (a4 + a3) % 1440;
  }
  else {
    return v4 + 1440;
  }
}

- (signed)NSDateToTimeOfDay:(id)a3
{
  id v4 = a3;
  id v5 = +[NSTimeZone timeZoneWithName:@"UTC"];
  if (v5)
  {
    signed __int16 v6 = [(FMCoreData *)self NSDate:v4 toTimeOfDayInTimeZone:v5];
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100144CC4();
    }
    signed __int16 v6 = -1;
  }

  return v6;
}

- (id)getNewBackgroundContext
{
  v3 = [(FMCoreData *)self container];
  id v4 = [v3 newBackgroundContext];

  id v5 = [(FMCoreData *)self container];
  signed __int16 v6 = [v5 persistentStoreCoordinator];
  id v7 = [v6 persistentStores];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = v4;
  }
  else
  {
    id v10 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I No persistent stores loaded, returning nil context", v12, 2u);
    }
    id v9 = 0;
  }

  return v9;
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (signed)getTimeOfDayFromDate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSTimeZone localTimeZone];
  if (v5)
  {
    signed __int16 v6 = [(FMCoreData *)self NSDate:v4 toTimeOfDayInTimeZone:v5];
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014B498();
    }
    signed __int16 v6 = -1;
  }

  return v6;
}

- (signed)getDayOfWeekFromDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
  if (v4)
  {
    id v5 = +[NSTimeZone localTimeZone];
    if (!v5)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_10014B500();
      }
      LOWORD(v8) = -1;
      goto LABEL_17;
    }
    [v4 setTimeZone:v5];
    signed __int16 v6 = [v4 components:512 fromDate:v3];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = (uint64_t)[v6 weekday];
      if (v8 < 0x8000)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      id v9 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10014B568(v8, v9);
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_10014B534();
    }
    LOWORD(v8) = -1;
    goto LABEL_16;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014B4CC();
  }
  LOWORD(v8) = -1;
LABEL_18:

  return v8;
}

- (signed)NSDate:(id)a3 toTimeOfDayInTimeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 setTimeZone:v6];
    id v9 = [v8 components:96 fromDate:v5];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 hour];
      uint64_t v12 = (uint64_t)[v10 minute] + 60 * (void)v11;
      if (v12 < 0x8000)
      {
LABEL_12:

        goto LABEL_13;
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100144D60();
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_100144D2C();
    }
    LOWORD(v12) = -1;
    goto LABEL_12;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100144CF8();
  }
  LOWORD(v12) = -1;
LABEL_13:

  return v12;
}

- (id)fmServingCellsToExistingServingCellsWithContext:(id)a3 cells:(id)a4
{
  id v25 = a3;
  id v19 = a4;
  id v24 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v19;
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v22 = *(void *)v30;
    while (2)
    {
      id v21 = v5;
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v27 = [v7 subscriptionID];
        BOOL v26 = [v7 radioAccessTechnology];
        id v28 = [v7 cellID];
        uint64_t v8 = [v7 mnc];
        id v9 = [v7 mcc];
        id v10 = [v7 bandInfo];
        id v11 = [v7 tacOrLac];
        uint64_t v12 = [v7 arfcnOrUarfcn];
        uint64_t v13 = [v7 bandwidth];
        id v14 = [v7 pci];
        id v15 = [v7 deploymentType];
        uint64_t v16 = -[FMCoreData getServingCellWithContext:subscriptionID:radioAccessTechnology:cellID:mnc:mcc:bandInfo:tacOrLac:arfcnOrUarfcn:bandwidth:pci:deploymentType:](self, "getServingCellWithContext:subscriptionID:radioAccessTechnology:cellID:mnc:mcc:bandInfo:tacOrLac:arfcnOrUarfcn:bandwidth:pci:deploymentType:", v25, v27, v26, v28, v8, v9, v10, v11, v12, v13, v14, v15, v19);

        if (!v16)
        {

          id v17 = 0;
          goto LABEL_11;
        }
        [v24 addObject:v16];
      }
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v17 = [v24 copy];
LABEL_11:

  return v17;
}

- (id)getServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14
{
  id v37 = a3;
  id v38 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v33 = v19;
  id v34 = v23;
  id v35 = v24;
  id v36 = a14;
  id v39 = +[NSFetchRequest fetchRequestWithEntityName:@"ServingCell"];
  id v28 = +[NSPredicate predicateWithFormat:@"(subscriptionID == %@) AND (radioAccessTechnology == %@) AND (cellID == %@) AND (mnc == %@) AND (mcc == %@) AND (bandInfo == %@) AND (tacOrLac == %@) AND (arfcnOrUarfcn == %@) AND (bandwidth == %@) AND (pci == %@) AND (deploymentType == %@)", v38, v19, v20, v21, v22, v23, v24, v25, v26, v27, v36];
  [v39 setPredicate:v28];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v28 description];
    objc_claimAutoreleasedReturnValue();
    sub_1001443C4();
  }
  id v40 = 0;
  long long v29 = [v37 executeFetchRequest:v39 error:&v40];
  id v30 = v40;
  if (v30)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v30 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144380();
    }
LABEL_6:
    long long v31 = 0;
    goto LABEL_12;
  }
  if (![v29 count])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100144318();
    }
    goto LABEL_6;
  }
  if ((unint64_t)[v29 count] >= 2
    && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_10014434C();
  }
  long long v31 = [v29 firstObject];
LABEL_12:

  return v31;
}

- (void)leftOutOfServiceArea:(double)a3 startTime:(id)a4 prevVisit:(id)a5 curVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 nextCell:(id)a9 entryLocation:(id)a10 exitLocation:(id)a11
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = [(FMCoreData *)self getNewBackgroundContext];
  id v27 = v26;
  if (v26)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000317F8;
    v28[3] = &unk_1001B6670;
    v28[4] = self;
    id v29 = v26;
    id v30 = v22;
    id v31 = v19;
    id v32 = v20;
    id v33 = v21;
    id v34 = v18;
    id v35 = v24;
    id v36 = v25;
    id v37 = v23;
    double v38 = a3;
    [v29 performBlockAndWait:v28];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100141994();
  }
}

- (void)updateOutOfServiceAreasWithNextVisit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FMCoreData *)self getNewBackgroundContext];
    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100031D28;
      v6[3] = &unk_1001B6698;
      v6[4] = self;
      id v7 = v4;
      id v8 = v5;
      [v8 performBlockAndWait:v6];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      sub_100141994();
    }
  }
}

- (void)finalizedCongestionArea:(id)a3 withSubscriptionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMCoreData *)self getNewBackgroundContext];
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000405A0;
    v9[3] = &unk_1001B6780;
    v9[4] = self;
    id v10 = v6;
    id v11 = v8;
    id v12 = v7;
    [v11 performBlockAndWait:v9];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100142458();
  }
}

- (id)congestionArea:(id)a3 toFMCongestionPredictionWithContext:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  id v26 = v6;
  id v7 = [v6 congestionOccurrences];
  unint64_t v8 = (unint64_t)[v7 count];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [v6 congestionOccurrences];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  id v11 = self;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  if (v10)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v16 secondsUntilCongestion] & 0x80000000) != 0
          || ([v16 secondsCongestionDuration] & 0x80000000) != 0)
        {
          --v8;
        }
        else
        {
          v12 += (int)[v16 secondsUntilCongestion];
          v13 += (int)[v16 secondsCongestionDuration];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  if (v8)
  {
    id v17 = [FMCongestionPrediction alloc];
    id v18 = [v26 seenCount];
    id v19 = [v26 badCells];
    id v20 = [(FMCoreData *)v11 congestionCells:v19 toFMCongestionCellsWithContext:v25];
    id v21 = [v26 goodCells];
    id v22 = [(FMCoreData *)v11 congestionCells:v21 toFMCongestionCellsWithContext:v25];
    id v23 = [(FMCongestionPrediction *)v17 initWithSeenCount:v18 predictedBadCells:v20 predictedGoodCells:v22 predictedTimeUntilCongestion:v12 / v8 predictedTimeInCongestion:v13 / v8];
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100142674();
    }
    id v23 = 0;
  }

  return v23;
}

- (id)congestionCells:(id)a3 toFMCongestionCellsWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = -[FMCoreData congestionCell:toFMCongestionCellWithContext:](self, "congestionCell:toFMCongestionCellWithContext:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v13) {
          [v8 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [v8 copy];

  return v14;
}

- (id)congestionCell:(id)a3 toFMCongestionCellWithContext:(id)a4
{
  id v4 = a3;
  id v5 = [FMCongestionCell alloc];
  id v6 = [v4 lastSeen];
  id v7 = [v4 subscriptionID];
  id v8 = [v4 mcc];
  id v9 = [v4 mnc];
  id v10 = [v4 gci];
  uint64_t v11 = [v4 radioAccessTechnology];
  unint64_t v12 = [v4 arfcnOrUarfcn];
  id v13 = [(FMCongestionCell *)v5 init:v6 subscriptionID:v7 mcc:v8 mnc:v9 gci:v10 rat:v11 arfcnOrUarfcn:v12];

  if (v13)
  {
    id v39 = [FMCongestionMetric alloc];
    id v42 = [v4 lastSeen];
    [v42 timeIntervalSince1970];
    double v15 = v14;
    id v41 = [v4 gci];
    id v40 = [v4 arfcnOrUarfcn];
    unsigned int v38 = [v40 intValue];
    unsigned int v37 = [v4 rsrp];
    unsigned int v36 = [v4 rsrq];
    unsigned int v35 = [v4 sinr];
    unsigned int v34 = [v4 dlBottleneckScoreInvalid];
    unsigned int v33 = [v4 dlBottleneckScoreNo];
    unsigned int v32 = [v4 dlBottleneckScoreLow];
    unsigned int v31 = [v4 dlBottleneckScoreMedium];
    unsigned int v30 = [v4 dlBottleneckScoreHigh];
    unsigned int v29 = [v4 ulBottleneckScoreInvalid];
    unsigned int v28 = [v4 ulBottleneckScoreNo];
    unsigned int v27 = [v4 ulBottleneckScoreLow];
    unsigned int v16 = [v4 ulBottleneckScoreMedium];
    unsigned int v17 = [v4 ulBottleneckScoreHigh];
    unsigned int v18 = [v4 dataStallIndicatorAVS];
    unsigned int v19 = [v4 dataStallIndicatorUL];
    unsigned int v20 = [v4 isSubway];
    unsigned int v21 = [v4 psPref];
    id v22 = [v4 subscriptionID];
    LODWORD(v26) = [v22 intValue];
    id v23 = -[FMCongestionMetric init:gci:arfnc:rsrp:rsrq:sinr:dlBottleneckScoreInvalid:dlBottleneckScoreNo:dlBottleneckScoreLow:dlBottleneckScoreMedium:dlBottleneckScoreHigh:ulBottleneckScoreInvalid:ulBottleneckScoreNo:ulBottleneckScoreLow:ulBottleneckScoreMedium:ulBottleneckScoreHigh:dataStallIndicatorAVS:dataStallIndicatorUL:isSubway:psPref:subsId:](v39, "init:gci:arfnc:rsrp:rsrq:sinr:dlBottleneckScoreInvalid:dlBottleneckScoreNo:dlBottleneckScoreLow:dlBottleneckScoreMedium:dlBottleneckScoreHigh:ulBottleneckScoreInvalid:ulBottleneckScoreNo:ulBottleneckScoreLow:ulBottleneckScoreMedium:ulBottleneckScoreHigh:dataStallIndicatorAVS:dataStallIndicatorUL:isSubway:psPref:subsId:", llround(v15), v41, v38, v37, v36, v35, __PAIR64__(v33, v34), __PAIR64__(v31, v32), __PAIR64__(v29, v30), __PAIR64__(v27, v28), __PAIR64__(v17, v16), __PAIR64__(v19, v18), __PAIR64__(v21, v20), v26);

    [v13 setCongestionMetric:v23];
    id v24 = v13;
  }

  return v13;
}

- (BOOL)isRushHourAtDate:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(FMCoreData *)self isRushHourAtDayOfWeek:[(FMCoreData *)self getDayOfWeekFromDate:v4] andTimeOfDay:[(FMCoreData *)self getTimeOfDayFromDate:v4]];

  return (char)self;
}

- (void)storeAnomaly:(id)a3 forHomePLMN:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 events];
  id v9 = [v8 count];
  id v10 = +[FMConfiguration sharedInstance];
  id v11 = [v10 FMTSAnomalyStoringMinNumObservedEvents];

  if (v9 >= v11)
  {
    id v13 = [(FMCoreData *)self getNewBackgroundContext];
    double v14 = v13;
    if (v13)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10005BCF4;
      v15[3] = &unk_1001B6780;
      v15[4] = self;
      id v16 = v13;
      id v17 = v6;
      id v18 = v7;
      [v16 performBlockAndWait:v15];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      sub_1001438F8();
    }
  }
  else
  {
    unint64_t v12 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100143870((uint64_t)v6, (uint64_t)v7, v12);
    }
  }
}

- (id)sortObjects:(id)a3 byKey:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = v6[2](v6, v12);
        id v14 = [v7 objectForKey:v13];
        if (!v14)
        {
          id v14 = objc_alloc_init((Class)NSMutableArray);
          [v7 setObject:v14 forKey:v13];
        }
        [v14 addObject:v12];
      }
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)getFMTSPredictionsFromRelevantTSAnomalies:(id)a3 atCurrentTimestamp:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v23 = a5;
  id v24 = objc_alloc_init((Class)NSMutableArray);
  id v9 = +[NSDate now];
  uint64_t v10 = [(FMCoreData *)self sortObjects:v8 byKey:&stru_1001B74E0];
  id v11 = +[FMConfiguration sharedInstance];
  id v12 = [v11 FMTSAnomalyPredictionTimeToAnomalyConfidenceRangeSeconds];
  id v13 = [v11 FMTSAnomalyPredictionDurationConfidenceRangeSeconds];
  [v11 FMTSAnomalyBaseConfidence];
  uint64_t v15 = v14;
  id v16 = [v11 FMTSAnomalyConfidenceMinPredictionCount];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005C1E4;
  v25[3] = &unk_1001B7508;
  id v17 = v8;
  id v26 = v17;
  id v18 = v23;
  id v27 = v18;
  id v30 = v12;
  id v31 = v13;
  uint64_t v32 = v15;
  id v33 = v16;
  id v19 = v9;
  id v28 = v19;
  unint64_t v34 = a4;
  id v20 = v24;
  id v29 = v20;
  [v10 enumerateKeysAndObjectsUsingBlock:v25];
  id v21 = [v20 copy];

  return v21;
}

- (id)getAnomalyPredictionsForHomePLMN:(id)a3 andEvents:(id)a4 atCurrentTimestamp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 count];
  id v11 = +[FMConfiguration sharedInstance];
  id v12 = [v11 FMTSAnomalyPredictionMinNumObservedEvents];

  if (v10 >= v12)
  {
    uint64_t v14 = [(FMCoreData *)self getNewBackgroundContext];
    if (v14)
    {
      unsigned int v35 = v14;
      uint64_t v15 = [(FMCoreData *)self sortObjects:v9 byKey:&stru_1001B7548];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10005CEBC;
      v63[3] = &unk_1001B7570;
      id v16 = v9;
      id v64 = v16;
      [v15 enumerateKeysAndObjectsUsingBlock:v63];
      id v17 = +[FMConfiguration sharedInstance];
      [v17 FMTSAnomalyUsedForPredictionDistanceThreshold];
      uint64_t v19 = v18;

      id v20 = +[FMConfiguration sharedInstance];
      unsigned int v21 = [v20 FMTSAnomalyPredictionAdvanceTimeSeconds];

      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = sub_10005D08C;
      v61 = sub_10005D09C;
      id v62 = 0;
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_1001439A0();
      }
      __uint64_t v22 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      uint64_t v53 = 0;
      char v54 = &v53;
      uint64_t v55 = 0x2020000000;
      uint64_t v56 = 0;
      uint64_t v49 = 0;
      long long v50 = &v49;
      uint64_t v51 = 0x2020000000;
      char v52 = 0;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10005D0A4;
      v38[3] = &unk_1001B75D8;
      id v39 = v8;
      id v43 = &v53;
      id v44 = &v49;
      id v40 = v35;
      id v41 = self;
      id v23 = v15;
      unsigned int v48 = v21;
      uint64_t v47 = v19;
      id v42 = v23;
      id v45 = &v57;
      unint64_t v46 = a5;
      [v40 performBlockAndWait:v38];
      __uint64_t v24 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v65[0] = @"fetch_duration";
      uint64_t v14 = v35;
      id v25 = +[NSNumber numberWithUnsignedLongLong:(v24 - v22) / 0xF4240];
      v66[0] = v25;
      v65[1] = @"fetch_successful";
      id v26 = +[NSNumber numberWithBool:*((unsigned __int8 *)v50 + 24)];
      v66[1] = v26;
      v65[2] = @"num_observed_events";
      id v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
      v66[2] = v27;
      v65[3] = @"num_anomalies";
      id v28 = +[NSNumber numberWithUnsignedInteger:v54[3]];
      v66[3] = v28;
      v65[4] = @"num_results";
      id v29 = (void *)v58[5];
      if (v29) {
        id v30 = [v29 count];
      }
      else {
        id v30 = 0;
      }
      id v31 = +[NSNumber numberWithUnsignedInteger:v30];
      v66[4] = v31;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:5];

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10005D874;
      v36[3] = &unk_1001B5EB8;
      id v37 = v32;
      id v33 = v32;
      sub_100005B9C(@"com.apple.Telephony.fedMobilityTimeSeriesPerPredictionFetchPerformance", v36);
      id v13 = (id)v58[5];

      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_10014396C();
      }
      id v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014392C();
    }
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

- (double)compareFMTSEventTimestamp:(id)a3 withTSEventTimeUntilAnomaly:(id)a4 usingBaseTimestamp:(unint64_t)a5 withTimeDistanceMaxTime:(int)a6 withPredictionAdvanceTime:(int)a7 withContext:(id)a8
{
  id v12 = a4;
  id v13 = [a3 timestamp];
  BOOL v14 = a5 >= (unint64_t)v13;
  unint64_t v15 = a5 - (void)v13;
  if (v14)
  {
    int v17 = v15 / 0x3B9ACA00 + a7 - [v12 timeUntilAnomaly];
    if (v17 < 0) {
      int v17 = -v17;
    }
    double v16 = fmin((double)v17 / (double)a6, 1.0);
  }
  else
  {
    double v16 = 1.0;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100143ABC();
    }
  }

  return v16;
}

- (id)compareObservedEvents:(id)a3 withStoredEvents:(id)a4 withPredictionAdvanceTime:(int)a5 atCurrentTimestamp:(unint64_t)a6 withContext:(id)a7 withEventComparator:(id)a8
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v58 = a7;
  id v13 = (double (**)(id, void *, void *))a8;
  uint64_t v49 = (void *)v12;
  uint64_t v47 = (void *)v11;
  if (!(v11 | v12))
  {
    id v43 = [AnomalyEventsComparisonResult alloc];
    double v44 = 0.0;
LABEL_35:
    id v42 = [(AnomalyEventsComparisonResult *)v43 init:&__NSArray0__struct averageEventDistance:v44];
    goto LABEL_41;
  }
  if (!v11 || !v12)
  {
    id v43 = [AnomalyEventsComparisonResult alloc];
    double v44 = 1.0;
    goto LABEL_35;
  }
  BOOL v14 = +[FMConfiguration sharedInstance];
  [v14 FMTSTimeDistanceWeight];
  double v16 = v15;

  int v17 = +[FMConfiguration sharedInstance];
  id v18 = [v17 FMTSTimeDistanceMaxTime];

  id v48 = objc_alloc_init((Class)NSMutableArray);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = (id)v11;
  id v19 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (!v19)
  {

LABEL_37:
    id v45 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "FederatedMobility[FMCoreData+TimeSeriesPredictor]:#N No observed events left", buf, 2u);
    }
    id v42 = [[AnomalyEventsComparisonResult alloc] init:&__NSArray0__struct averageEventDistance:1.0];
    goto LABEL_40;
  }
  unint64_t v50 = 0;
  uint64_t v55 = *(void *)v70;
  double v20 = 0.0;
  do
  {
    unsigned int v21 = 0;
    id v53 = v19;
    do
    {
      if (*(void *)v70 != v55) {
        objc_enumerationMutation(obj);
      }
      __uint64_t v22 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v21);
      if ((unint64_t)[v22 timestamp] <= a6)
      {
        id v24 = [v22 timestamp];
        id v25 = +[FMConfiguration sharedInstance];
        char v54 = v21;
        id v26 = [v25 FMTSWindowSizeInDatabaseSeconds];
        id v27 = +[FMConfiguration sharedInstance];
        unint64_t v52 = (a6 - (unint64_t)v24) / 0x3B9ACA00;
        LODWORD(v24) = v52 > v26 - (unsigned char *)[v27 FMTSAnomalyPredictionAdvanceTimeSeconds];

        if (v24)
        {
          id v28 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_100143B30(&v65, v66, v28);
          }
        }
        else
        {
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v29 = v49;
          id v30 = 0;
          id v31 = [v29 countByEnumeratingWithState:&v61 objects:v73 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v62;
            double v33 = 1.0;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v62 != v32) {
                  objc_enumerationMutation(v29);
                }
                unsigned int v35 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                [(FMCoreData *)self compareFMTSEventTimestamp:v22 withTSEventTimeUntilAnomaly:v35 usingBaseTimestamp:a6 withTimeDistanceMaxTime:v18 withPredictionAdvanceTime:a5 withContext:v58];
                double v37 = (1.0 - v16) * v13[2](v13, v22, v35) + v36 * v16;
                if (!v30 || v37 < v33)
                {
                  id v38 = v35;

                  double v33 = v37;
                  id v30 = v38;
                }
              }
              id v31 = [v29 countByEnumeratingWithState:&v61 objects:v73 count:16];
            }
            while (v31);
          }
          else
          {
            double v33 = 1.0;
          }

          id v39 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v30 timeUntilAnomaly] - v52);
          [v48 addObject:v39];

          double v20 = v20 + v33;
          ++v50;
        }
        id v19 = v53;
        unsigned int v21 = v54;
      }
      else
      {
        id v23 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          sub_100143AF0(&v67, v68, v23);
          id v19 = v53;
        }
      }
      unsigned int v21 = (char *)v21 + 1;
    }
    while (v21 != v19);
    id v19 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  }
  while (v19);

  if (!v50) {
    goto LABEL_37;
  }
  id v40 = [AnomalyEventsComparisonResult alloc];
  id v41 = [v48 copy];
  id v42 = [(AnomalyEventsComparisonResult *)v40 init:v41 averageEventDistance:v20 / (double)v50];

LABEL_40:
LABEL_41:

  return v42;
}

- (id)compareObservedEvents:(id)a3 withStoredEvents:(id)a4 ofType:(signed __int16)a5 withPredictionAdvanceTime:(int)a6 atCurrentTimestamp:(unint64_t)a7 withContext:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  int v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  switch(v11)
  {
    case 1:
      int v17 = +[FMConfiguration sharedInstance];
      [v17 FMTSCellChangeCrossDistance];
      uint64_t v19 = v18;

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10005E2DC;
      v27[3] = &unk_1001B75F8;
      v27[4] = v19;
      double v20 = [(FMCoreData *)self compareObservedEvents:v14 withStoredEvents:v15 withPredictionAdvanceTime:v10 atCurrentTimestamp:a7 withContext:v16 withEventComparator:v27];
      unsigned int v21 = +[FMConfiguration sharedInstance];
      [v21 FMTSEventTypeWeightCellChange];
      objc_msgSend(v20, "updateAverageEventDistanceWithWeight:");
      goto LABEL_6;
    case 2:
      __uint64_t v22 = +[FMConfiguration sharedInstance];
      [v22 FMTSSignalStrengthChangeSameDirectionDistance];
      uint64_t v24 = v23;

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10005E63C;
      v26[3] = &unk_1001B75F8;
      v26[4] = v24;
      double v20 = [(FMCoreData *)self compareObservedEvents:v14 withStoredEvents:v15 withPredictionAdvanceTime:v10 atCurrentTimestamp:a7 withContext:v16 withEventComparator:v26];
      unsigned int v21 = +[FMConfiguration sharedInstance];
      [v21 FMTSEventTypeWeightSignalStrengthChange];
      objc_msgSend(v20, "updateAverageEventDistanceWithWeight:");
      goto LABEL_6;
    case 3:
      double v20 = [(FMCoreData *)self compareObservedEvents:v14 withStoredEvents:v15 withPredictionAdvanceTime:v10 atCurrentTimestamp:a7 withContext:v16 withEventComparator:&stru_1001B7638];
      unsigned int v21 = +[FMConfiguration sharedInstance];
      [v21 FMTSEventTypeWeightVisitStart];
      objc_msgSend(v20, "updateAverageEventDistanceWithWeight:");
      goto LABEL_6;
    case 4:
      double v20 = [(FMCoreData *)self compareObservedEvents:v14 withStoredEvents:v15 withPredictionAdvanceTime:v10 atCurrentTimestamp:a7 withContext:v16 withEventComparator:&stru_1001B7658];
      unsigned int v21 = +[FMConfiguration sharedInstance];
      [v21 FMTSEventTypeWeightVisitEnd];
      objc_msgSend(v20, "updateAverageEventDistanceWithWeight:");
LABEL_6:

      break;
    default:
      double v20 = 0;
      break;
  }

  return v20;
}

- (void)storePrediction:(id)a3
{
  id v4 = a3;
  id v5 = [(FMCoreData *)self getNewBackgroundContext];
  id v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005E9A8;
    v7[3] = &unk_1001B6698;
    v7[4] = self;
    id v8 = v5;
    id v9 = v4;
    [v8 performBlockAndWait:v7];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_1001438F8();
  }
}

- (FMCoreData)init
{
  id v3 = +[NSString stringWithUTF8String:"/var/wireless/wirelessinsightsd/FederatedMobility.sqlite"];
  id v4 = +[NSURL fileURLWithPath:v3];
  id v5 = [(FMCoreData *)self initWithStoreURL:v4 WithModelURL:0];

  return v5;
}

- (FMCoreData)initWithStoreURL:(id)a3 WithModelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)FMCoreData;
  id v8 = [(FMCoreData *)&v33 init];
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_100143CDC();
        }
        id v9 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
        uint64_t v10 = +[NSString stringWithUTF8String:"WISFederatedMobility"];
        int v11 = +[NSPersistentContainer persistentContainerWithName:v10 managedObjectModel:v9];
        [(FMCoreData *)v8 setContainer:v11];
      }
      else
      {
        id v9 = +[NSString stringWithUTF8String:"WISFederatedMobility"];
        uint64_t v10 = +[NSPersistentContainer persistentContainerWithName:v9];
        [(FMCoreData *)v8 setContainer:v10];
      }

      unint64_t v12 = [(FMCoreData *)v8 container];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        id v14 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v6];
        [v14 setOption:NSFileProtectionCompleteUnlessOpen forKey:NSPersistentStoreFileProtectionKey];
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_100143CA8();
        }
        id v15 = [(FMCoreData *)v8 container];
        unint64_t v34 = v14;
        id v16 = +[NSArray arrayWithObjects:&v34 count:1];
        [v15 setPersistentStoreDescriptions:v16];

        [(FMCoreData *)v8 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.FMCoreData", 0)];
        if (![(FMCoreData *)v8 queue])
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
            sub_100143BD8();
          }
          id v28 = 0;
          goto LABEL_35;
        }
        [(FMCoreData *)v8 waitForDeviceUnlockAndLoadDataStore];
        int v17 = [(FMCoreData *)v8 getLatestStoredConfiguration];
        uint64_t v18 = +[FMConfiguration sharedInstance];
        uint64_t v19 = [v17 values];
        unsigned __int8 v20 = [v18 isCompatibleToConfig:v19];

        if ((v20 & 1) == 0)
        {
          unsigned int v21 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Database and current config are incompatible, pruning database", (uint8_t *)buf, 2u);
          }
          [(FMCoreData *)v8 clearDatabase];
        }
        __uint64_t v22 = +[FMConfiguration sharedInstance];
        uint64_t v23 = [v22 configAsDict];
        unsigned __int8 v24 = [(FMCoreData *)v8 updateStoredConfigurationFrom:v17 to:v23];

        if (v24)
        {
          [(FMCoreData *)v8 setDatabaseMaintenanceTimer:dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[(FMCoreData *)v8 queue])];
          if ([(FMCoreData *)v8 databaseMaintenanceTimer])
          {
            id v25 = [(FMCoreData *)v8 databaseMaintenanceTimer];
            id v26 = +[FMConfiguration sharedInstance];
            dispatch_source_set_timer(v25, 0, 1000000000 * (void)[v26 OOSTimeBetweenDatabaseMaintenance], 0xDF8475800uLL);

            objc_initWeak(buf, v8);
            id v27 = [(FMCoreData *)v8 databaseMaintenanceTimer];
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100061B04;
            handler[3] = &unk_1001B6880;
            objc_copyWeak(&v31, buf);
            dispatch_source_set_event_handler(v27, handler);
            dispatch_resume((dispatch_object_t)[(FMCoreData *)v8 databaseMaintenanceTimer]);
            if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
              sub_100143C40();
            }
            id v28 = v8;
            objc_destroyWeak(&v31);
            objc_destroyWeak(buf);
            goto LABEL_34;
          }
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
            sub_100143C0C();
          }
        }
        else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
        {
          sub_100143C74();
        }
        id v28 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_100143BA4();
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      sub_100143B70();
    }
  }
  id v28 = 0;
LABEL_36:

  return v28;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100143D7C();
  }
  if ([(FMCoreData *)self databaseMaintenanceTimer]) {
    dispatch_release((dispatch_object_t)[(FMCoreData *)self databaseMaintenanceTimer]);
  }
  if ([(FMCoreData *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMCoreData *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FMCoreData;
  [(FMCoreData *)&v3 dealloc];
}

- (void)waitForDeviceUnlockAndLoadDataStore
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100061CBC;
  v2[3] = &unk_1001B78A8;
  v2[4] = self;
  +[FMUtil waitForDeviceUnlockAndRunBlock:v2];
}

- (void)clearDatabase
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100143F08();
  }
  objc_super v3 = [(FMCoreData *)self container];
  id v4 = [v3 persistentStoreCoordinator];

  id v5 = [v4 persistentStores];
  BOOL v6 = (unint64_t)[v5 count] > 1;

  if (v6)
  {
    id v7 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = [v4 persistentStores];
      *(_DWORD *)buf = 134217984;
      id v18 = [v12 count];
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData]:Unexpected number of stores in the coordinator: %lu", buf, 0xCu);
    }
  }
  id v8 = [v4 persistentStores];
  id v9 = [v8 firstObject];

  uint64_t v10 = [v9 URL];
  int v11 = [v9 type];

  if (v10 && v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000621B8;
    v13[3] = &unk_1001B78D0;
    id v14 = v10;
    id v15 = v11;
    id v16 = v4;
    +[FMUtil waitForDeviceUnlockAndRunBlock:v13];
    [(FMCoreData *)self waitForDeviceUnlockAndLoadDataStore];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100143E84();
  }
}

- (id)getLatestStoredConfiguration
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = sub_1000624E0;
  BOOL v13 = sub_1000624F0;
  id v14 = 0;
  v2 = [(FMCoreData *)self getNewBackgroundContext];
  objc_super v3 = v2;
  if (v2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000624F8;
    v6[3] = &unk_1001B78F8;
    id v7 = v2;
    id v8 = &v9;
    [v7 performBlockAndWait:v6];
    id v4 = (id)v10[5];
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100143FC4();
    }
    id v4 = 0;
  }

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (BOOL)updateStoredConfigurationFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMCoreData *)self getNewBackgroundContext];
  if (v8)
  {
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006298C;
    v11[3] = &unk_1001B6810;
    id v12 = v6;
    id v13 = v7;
    id v14 = v8;
    id v15 = &v16;
    [v14 performBlockAndWait:v11];
    BOOL v9 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001440A4();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)updateServingCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 setLastSeen:v9];
  objc_msgSend(v8, "setSeenCount:", objc_msgSend(v8, "seenCount") + 1);
  id v11 = 0;
  [v7 save:&v11];
  id v10 = v11;
  if (v10 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    [v10 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10014425C();
  }
}

- (id)fmServingCellsToServingCellsWithContext:(id)a3 cells:(id)a4
{
  id v24 = a3;
  id v19 = a4;
  id v21 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v19;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      id v25 = v5;
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v29 = [v7 subscriptionID];
        id v28 = [v7 radioAccessTechnology];
        id v27 = [v7 cellID];
        id v26 = [v7 mnc];
        id v8 = [v7 mcc];
        id v9 = [v7 bandInfo];
        id v10 = [v7 tacOrLac];
        id v11 = [v7 arfcnOrUarfcn];
        id v12 = [v7 bandwidth];
        id v13 = [v7 pci];
        id v14 = [v7 deploymentType];
        id v15 = [v7 timestamp];
        uint64_t v16 = -[FMCoreData getOrCreateServingCellWithContext:subscriptionID:radioAccessTechnology:cellID:mnc:mcc:bandInfo:tacOrLac:arfcnOrUarfcn:bandwidth:pci:deploymentType:timestamp:](self, "getOrCreateServingCellWithContext:subscriptionID:radioAccessTechnology:cellID:mnc:mcc:bandInfo:tacOrLac:arfcnOrUarfcn:bandwidth:pci:deploymentType:timestamp:", v24, v29, v28, v27, v26, v8, v9, v10, v11, v12, v13, v14, v15, v19);

        if (v16) {
          [v21 addObject:v16];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  id v17 = [v21 copy];

  return v17;
}

- (id)getOrCreateServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14 timestamp:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v50 = a5;
  id v22 = a6;
  id v23 = a7;
  id v41 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v29 = a14;
  id v46 = v25;
  id v47 = a15;
  id v43 = v29;
  id v44 = v27;
  id v45 = v26;
  id v40 = v24;
  id v48 = v24;
  long long v30 = v20;
  long long v31 = v21;
  uint64_t v49 = v23;
  long long v32 = [(FMCoreData *)self getServingCellWithContext:v30 subscriptionID:v21 radioAccessTechnology:v50 cellID:v22 mnc:v23 mcc:v41 bandInfo:v40 tacOrLac:v25 arfcnOrUarfcn:v26 bandwidth:v27 pci:v28 deploymentType:v29];
  long long v33 = v32;
  if (v32)
  {
    id v34 = v32;
    double v36 = v26;
    unsigned int v35 = v46;
    double v37 = v44;
    id v38 = v43;
  }
  else
  {
    unsigned int v35 = v25;
    id v38 = v43;
    double v37 = v44;
    double v36 = v45;
    id v34 = [(FMCoreData *)self createServingCellWithContext:v30 subscriptionID:v31 radioAccessTechnology:v50 cellID:v22 mnc:v49 mcc:v41 bandInfo:v48 tacOrLac:v25 arfcnOrUarfcn:v45 bandwidth:v44 pci:v28 deploymentType:v43 timestamp:v47];
  }

  return v34;
}

- (id)createServingCellWithContext:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14 timestamp:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v32 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v22 = v21;
  id v34 = a9;
  id v33 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001442E4();
  }
  id v28 = +[NSEntityDescription insertNewObjectForEntityForName:@"ServingCell", v20, a13 inManagedObjectContext];
  [v28 setLastSeen:v27];
  [v28 setSeenCount:0];
  [v28 setSubscriptionID:v21];
  [v28 setRadioAccessTechnology:v32];
  [v28 setCellID:v37];
  [v28 setMnc:v36];
  [v28 setMcc:v35];
  [v28 setBandInfo:v34];
  [v28 setTacOrLac:v33];
  [v28 setArfcnOrUarfcn:v23];
  [v28 setBandwidth:v24];
  [v28 setPci:v25];
  [v28 setDeploymentType:v26];
  id v38 = 0;
  [v20 save:&v38];
  id v29 = v38;
  if (v29)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v29 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001442A0();
    }
    id v30 = 0;
  }
  else
  {
    id v30 = v28;
  }

  return v30;
}

- (id)filterOutOfServiceAreasWithContext:(id)a3 unfilteredOutOfServiceAreas:(id)a4 WithExactPrevCells:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "prevCells", (void)v18);
        id v15 = [v14 count];
        LOBYTE(v15) = v15 == [v7 count];

        if (v15) {
          [v8 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = [v8 copy];

  return v16;
}

- (id)getOutOfServiceAreasWithoutNextVisitWithContext:(id)a3 After:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  id v8 = +[NSPredicate predicateWithFormat:@"(nextVisit == nil) AND (lastSeen >= %@)", v6];
  [v7 setPredicate:v8];
  id v9 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 description];
    *(_DWORD *)buf = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Fetching OutOfServiceArea with predicate %@", buf, 0xCu);
  }
  id v15 = 0;
  uint64_t v11 = [v5 executeFetchRequest:v7 error:&v15];
  id v12 = v15;
  if (v12)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v12 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144408();
    }
    id v13 = 0;
  }
  else
  {
    id v13 = v11;
  }

  return v13;
}

- (void)updateOutOfServiceAreaAfterLeavingWithContext:(id)a3 outOfServiceArea:(id)a4 startTime:(id)a5 nextCell:(id)a6 duration:(double)a7 entryLocation:(id)a8 exitLocation:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v52 = a6;
  id v53 = a8;
  id v18 = a9;
  uint64_t v51 = v17;
  if (v16)
  {
    [v16 setLastSeen:v17];
    objc_msgSend(v16, "setSeenCount:", objc_msgSend(v16, "seenCount") + 1);
    id v50 = +[NSEntityDescription insertNewObjectForEntityForName:@"OutOfServiceDuration" inManagedObjectContext:v15];
    [v50 setSeconds:llround(a7)];
    [v50 setTimestamp:v17];
    [v16 addDurationsObject:v50];
    long long v19 = [v16 durations];
    id v20 = [v19 count];
    long long v21 = +[FMConfiguration sharedInstance];
    id v22 = [v21 OOSDurationsInDatabase];

    if (v20 > v22)
    {
      id v23 = [v16 durations];
      id v24 = [v23 copy];
      id v25 = [v16 durations];
      id v26 = [v25 count];
      id v27 = +[FMConfiguration sharedInstance];
      id v28 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v26 - (unsigned char *)[v27 OOSDurationsInDatabase]);
      id v29 = [v24 objectsAtIndexes:v28];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v30 = v29;
      id v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v56;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v56 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            [v16 removeDurationsObject:v34];
            [v15 deleteObject:v34];
          }
          id v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
        }
        while (v31);
      }
    }
    if (v52) {
      [v16 addNextCellsObject:v52];
    }
    if (v53)
    {
      id v35 = [v16 entryAccuracy];
      if (!v35) {
        goto LABEL_16;
      }
      id v36 = [v16 entryAccuracy];
      [v53 accuracy];
      id v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      BOOL v38 = [v36 compare:v37] == (id)1;

      if (v38)
      {
LABEL_16:
        [v53 latitude];
        id v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setEntryLatitude:v39];

        [v53 longitude];
        id v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setEntryLongitude:v40];

        [v53 accuracy];
        id v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setEntryAccuracy:v41];
      }
    }
    if (v18)
    {
      id v42 = [v16 exitAccuracy];
      if (!v42) {
        goto LABEL_20;
      }
      id v43 = [v16 exitAccuracy];
      [v18 accuracy];
      id v44 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      BOOL v45 = [v43 compare:v44] == (id)1;

      if (v45)
      {
LABEL_20:
        [v18 latitude];
        id v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setExitLatitude:v46];

        [v18 longitude];
        id v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setExitLongitude:v47];

        [v18 accuracy];
        id v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setExitAccuracy:v48];
      }
    }
    id v54 = 0;
    [v15 save:&v54];
    id v49 = v54;
    if (v49 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v49 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144480();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_10014444C();
  }
}

- (id)handleOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 startTime:(id)a9 entryLocation:(id)a10 exitLocation:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v40 = a10;
  id v24 = a11;
  id v39 = v24;
  LOWORD(v36) = [(FMCoreData *)self NSDateToTimeOfDay:v23];
  id v25 = [(FMCoreData *)self getOutOfServiceAreaWithContext:v17 prevVisit:v18 curVisit:v19 nextVisit:v20 subscriptionID:v21 prevCells:v22 timeOfDay:v36];
  id v26 = v25;
  if (v25)
  {
    id v27 = v25;
    goto LABEL_11;
  }
  BOOL v38 = [(FMCoreData *)self createOutOfServiceAreaWithContext:v17 prevVisit:v18 curVisit:v19 nextVisit:v20 subscriptionID:v21 prevCells:v22 entryLocation:v40 exitLocation:v24 startTime:v23];
  id v28 = +[FMConfiguration sharedInstance];
  id v29 = -[FMCoreData deleteOutOfServiceAreasOverThresholdCount:WithContext:](self, "deleteOutOfServiceAreasOverThresholdCount:WithContext:", [v28 OOSMaxOOSAreasInDatabase], v17);

  id v37 = v21;
  if (v29)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100064758;
    v41[3] = &unk_1001B7920;
    id v42 = v38;
    if ([v29 indexOfObjectPassingTest:v41] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v30 = v20;
      id v31 = v17;
      id v32 = v19;
      id v33 = v18;
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_1001444C4();
      }

      id v27 = 0;
      uint64_t v34 = v38;
      goto LABEL_10;
    }
  }
  id v30 = v20;
  id v31 = v17;
  id v32 = v19;
  id v33 = v18;
  uint64_t v34 = v38;
  id v27 = v38;
LABEL_10:

  id v18 = v33;
  id v19 = v32;
  id v17 = v31;
  id v20 = v30;
  id v21 = v37;
LABEL_11:

  return v27;
}

- (id)createOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 entryLocation:(id)a9 exitLocation:(id)a10 startTime:(id)a11
{
  id v52 = a3;
  id v48 = a4;
  id v49 = a5;
  id v50 = a6;
  id v51 = a7;
  id v54 = a8;
  id v16 = a9;
  id v17 = a10;
  id v53 = a11;
  id v18 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Creating new OutOfServiceArea", buf, 2u);
  }
  id v19 = +[NSEntityDescription insertNewObjectForEntityForName:@"OutOfServiceArea" inManagedObjectContext:v52];
  [v19 setLastSeen:v53];
  [v19 setSeenCount:0];
  [v19 setPrevVisit:v48];
  [v19 setCurVisit:v49];
  [v19 setNextVisit:v50];
  [v19 setSubscriptionID:v51];
  id v20 = [v54 count];
  id v21 = +[FMConfiguration sharedInstance];
  LODWORD(v20) = v20 > [v21 OOSPrevCellsInDatabase];

  if (v20)
  {
    id v22 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v54 count];
      id v24 = +[FMConfiguration sharedInstance];
      id v25 = [v24 OOSPrevCellsInDatabase];
      *(_DWORD *)buf = 134218240;
      id v62 = v23;
      __int16 v63 = 2048;
      id v64 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Received more prevCells for database than expected: %lu > %lu", buf, 0x16u);
    }
    id v26 = objc_alloc((Class)NSOrderedSet);
    id v27 = [v54 count];
    id v28 = +[FMConfiguration sharedInstance];
    id v29 = [v28 OOSPrevCellsInDatabase];
    id v30 = +[FMConfiguration sharedInstance];
    id v31 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v27 - v29, [v30 OOSPrevCellsInDatabase]);
    id v32 = [v54 objectsAtIndexes:v31];
    id v33 = [v26 initWithArray:v32];
  }
  else
  {
    id v33 = [v54 copy];
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v34 = v33;
  id v35 = [v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v57;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v57 != v36) {
          objc_enumerationMutation(v34);
        }
        [v19 addPrevCellsObject:*(void *)(*((void *)&v56 + 1) + 8 * i)];
      }
      id v35 = [v34 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v35);
  }

  if (v16)
  {
    [v16 latitude];
    BOOL v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setEntryLatitude:v38];

    [v16 longitude];
    id v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setEntryLongitude:v39];

    [v16 accuracy];
    id v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setEntryAccuracy:v40];
  }
  if (v17)
  {
    [v17 latitude];
    id v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setExitLatitude:v41];

    [v17 longitude];
    id v42 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setExitLongitude:v42];

    [v17 accuracy];
    id v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setExitAccuracy:v43];
  }
  objc_msgSend(v19, "setTimeOfDay:", -[FMCoreData NSDateToTimeOfDay:](self, "NSDateToTimeOfDay:", v53));
  id v55 = 0;
  [v52 save:&v55];
  id v44 = v55;
  if (v44)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v44 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001444F8();
    }
    id v45 = 0;
  }
  else
  {
    id v45 = v19;
  }

  return v45;
}

- (id)getOutOfServiceAreaWithContext:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 nextVisit:(id)a6 subscriptionID:(id)a7 prevCells:(id)a8 timeOfDay:(signed __int16)a9
{
  id v51 = a3;
  id v15 = a4;
  id v53 = a5;
  id v54 = a6;
  id v49 = a7;
  id v50 = a8;
  id v47 = v15;
  id v16 = +[FMConfiguration sharedInstance];
  int64_t v17 = -[FMCoreData getMinutesSinceMidnightFrom:addingOffset:](self, "getMinutesSinceMidnightFrom:addingOffset:", a9, -(uint64_t)[v16 OOSTimeOfDayWindowBackMinutes]);

  id v18 = +[FMConfiguration sharedInstance];
  int64_t v19 = -[FMCoreData getMinutesSinceMidnightFrom:addingOffset:](self, "getMinutesSinceMidnightFrom:addingOffset:", a9, [v18 OOSTimeOfDayWindowForwardMinutes]);

  id v52 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  id v20 = v15;
  if (v17 >= v19)
  {
    if (!v15)
    {
      id v20 = +[NSNull null];
    }
    id v21 = v53;
    if (!v53)
    {
      id v21 = +[NSNull null];
    }
    id v22 = v54;
    if (!v54)
    {
      id v22 = +[NSNull null];
    }
    uint64_t v23 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(prevVisit == %@) AND (curVisit == %@) AND (nextVisit == %@) AND (subscriptionID == %@) AND (SUBQUERY(prevCells, $prevCell, $prevCell IN %@).@count == %d) AND ((timeOfDay >= %d) OR (timeOfDay <= %d))", v20, v21, v22, v49, v50, [v50 count], v17, v19);
  }
  else
  {
    if (!v15)
    {
      id v20 = +[NSNull null];
    }
    id v21 = v53;
    if (!v53)
    {
      id v21 = +[NSNull null];
    }
    id v22 = v54;
    if (!v54)
    {
      id v22 = +[NSNull null];
    }
    uint64_t v23 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(prevVisit == %@) AND (curVisit == %@) AND (nextVisit == %@) AND (subscriptionID == %@) AND (SUBQUERY(prevCells, $prevCell, $prevCell IN %@).@count == %d) AND (timeOfDay >= %d) AND (timeOfDay <= %d)", v20, v21, v22, v49, v50, [v50 count], v17, v19);
  }
  id v24 = (void *)v23;
  if (!v54) {

  }
  if (!v53) {
  id v25 = v52;
  }
  if (!v15) {

  }
  [v52 setPredicate:v24];
  [v52 setReturnsObjectsAsFaults:0];
  id v26 = *(NSObject **)(qword_1001D8080 + 136);
  id v27 = v51;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v28 = [v24 description];
    *(_DWORD *)buf = 138412290;
    id v62 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Fetching OutOfServiceArea with predicate %@", buf, 0xCu);

    id v27 = v51;
    id v25 = v52;
  }
  id v59 = 0;
  id v46 = v24;
  id v29 = [v27 executeFetchRequest:v25 error:&v59];
  id v30 = v59;
  id v31 = *(NSObject **)(qword_1001D8080 + 136);
  id v48 = v30;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v29 count];
    *(_DWORD *)buf = 134217984;
    id v62 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Fetch done, %lu unfiltered results", buf, 0xCu);
  }
  if (v30)
  {
    if (!os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v33 = 0;
      goto LABEL_50;
    }
    id v45 = v29;
    [v30 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_1001445A4();
    id v33 = 0;
  }
  else
  {
    id v45 = v29;
    id v34 = [(FMCoreData *)self filterOutOfServiceAreasWithContext:v27 unfilteredOutOfServiceAreas:v29 WithExactPrevCells:v50];
    if ([v34 count])
    {
      if ([v34 count] == (id)1)
      {
        id v33 = [v34 firstObject];
      }
      else
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_100144570();
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v35 = v34;
        id v44 = v34;
        id v33 = 0;
        id v36 = [v35 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v56;
          uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v56 != v37) {
                objc_enumerationMutation(v35);
              }
              id v40 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              int64_t v41 = -[FMCoreData getDifferenceBetweenMinutesSinceMidnight:b:](self, "getDifferenceBetweenMinutesSinceMidnight:b:", (int)[v40 timeOfDay], a9);
              if (v41 < v38)
              {
                id v42 = v40;

                id v33 = v42;
                uint64_t v38 = v41;
              }
            }
            id v36 = [v35 countByEnumeratingWithState:&v55 objects:v60 count:16];
          }
          while (v36);
        }

        id v34 = v44;
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_10014453C();
      }
      id v33 = 0;
    }
  }
  id v29 = v45;
LABEL_50:

  return v33;
}

- (id)getOrCreateLocationOfInterestAt:(id)a3 WithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMCoreData *)self getLocationOfInterestAt:v6 WithContext:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(FMCoreData *)self createLocationOfInterestAt:v6 WithContext:v7];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)createLocationOfInterestAt:(id)a3 WithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014462C();
  }
  id v7 = +[NSEntityDescription insertNewObjectForEntityForName:@"LocationOfInterest" inManagedObjectContext:v6];
  id v8 = [v5 timestamp];
  [v7 setLastSeen:v8];

  [v7 setSeenCount:0];
  [v5 latitude];
  objc_msgSend(v7, "setLatitude:");
  [v5 longitude];
  objc_msgSend(v7, "setLongitude:");
  [v5 accuracy];
  objc_msgSend(v7, "setAccuracy:");
  id v12 = 0;
  [v6 save:&v12];
  id v9 = v12;
  if (v9)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v9 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001445E8();
    }
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)getLocationOfInterestAt:(id)a3 WithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v56 = v6;
  [v5 accuracy];
  double v8 = v7;
  [v5 latitude];
  double v10 = cos(v9 * 3.14159265 / 180.0);
  [v5 latitude];
  double v12 = v11;
  [v5 latitude];
  double v14 = v13;
  [v5 longitude];
  double v16 = v15;
  [v5 longitude];
  double v18 = v17;
  int64_t v19 = +[NSFetchRequest fetchRequestWithEntityName:@"LocationOfInterest"];
  double v20 = v8 * 1.1 / (v10 * 6371009.0) * 180.0 / 3.14159265;
  long long v55 = v19;
  id v21 = +[NSPredicate predicateWithFormat:@"(latitude >= %lf) AND (latitude <= %lf) AND (longitude >= %lf) AND (longitude <= %lf)", v12 - v8 * 1.1 / 6371009.0 * 180.0 / 3.14159265, v8 * 1.1 / 6371009.0 * 180.0 / 3.14159265 + v14, v16 - v20, v20 + v18];
  [v19 setPredicate:v21];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v21 description];
    objc_claimAutoreleasedReturnValue();
    sub_100144750();
  }
  id v61 = 0;
  id v22 = [v6 executeFetchRequest:v19 error:&v61];
  id v23 = v61;
  if (v23)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v53 = v22;
      [v23 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014470C();
LABEL_6:
      id v24 = 0;
      id v22 = v53;
      goto LABEL_31;
    }
LABEL_12:
    id v24 = 0;
    goto LABEL_31;
  }
  if (![v22 count])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      id v53 = v22;
      [v21 description];
      objc_claimAutoreleasedReturnValue();
      sub_100144660();
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  if ([v22 count] == (id)1)
  {
    id v25 = [v22 firstObject];
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001446D8();
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v26 = v22;
    id v54 = v22;
    id v25 = 0;
    id v27 = [v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v58;
      double v29 = 1.79769313e308;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          [v5 latitude];
          double v33 = v32;
          [v5 longitude];
          double v35 = v34;
          [v31 latitude];
          double v37 = v36;
          [v31 longitude];
          +[FMCoreLocationController distanceBetween:v33 srcLongitude:v35 destLatitude:v37 destLongitude:v38];
          double v40 = v39;
          if (v39 < v29)
          {
            id v41 = v31;

            id v25 = v41;
            double v29 = v40;
          }
        }
        id v27 = [v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v27);
    }

    id v22 = v54;
  }
  [v5 latitude];
  double v43 = v42;
  [v5 longitude];
  double v45 = v44;
  [v25 latitude];
  double v47 = v46;
  [v25 longitude];
  +[FMCoreLocationController distanceBetween:v43 srcLongitude:v45 destLatitude:v47 destLongitude:v48];
  double v50 = v49;
  [v5 accuracy];
  if (v50 <= v51)
  {
    id v24 = v25;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001446A4();
    }
    id v24 = 0;
  }

LABEL_31:

  return v24;
}

- (id)deleteOutOfServiceAreasOverThresholdCount:(unint64_t)a3 WithContext:(id)a4
{
  id v6 = a4;
  double v7 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  id v19 = 0;
  double v8 = (char *)[v6 countForFetchRequest:v7 error:&v19];
  id v9 = v19;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144890();
    }
LABEL_11:
    id v16 = 0;
    goto LABEL_12;
  }
  double v11 = &v8[-a3];
  if ((unint64_t)v8 <= a3)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014480C();
    }
    id v10 = 0;
    goto LABEL_11;
  }
  double v12 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  id v13 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastSeen" ascending:1];
  id v20 = v13;
  double v14 = +[NSArray arrayWithObjects:&v20 count:1];
  [v12 setSortDescriptors:v14];

  [v12 setFetchLimit:v11];
  id v18 = 0;
  double v15 = [v6 executeFetchRequest:v12 error:&v18];
  id v10 = v18;
  if (v10)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001447C8();
    }
LABEL_19:
    id v16 = 0;
    goto LABEL_20;
  }
  if (![(FMCoreData *)self deleteOutOfServiceAreas:v15 AndAssociatedEntitiesWithContext:v6])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100144794();
    }
    goto LABEL_19;
  }
  id v16 = v15;
LABEL_20:

LABEL_12:

  return v16;
}

- (void)deletedOrphanedServingCellsWithContext:(id)a3
{
  id v3 = a3;
  id v16 = +[NSFetchRequest fetchRequestWithEntityName:@"ServingCell"];
  id v4 = +[NSPredicate predicateWithFormat:@"prevCellOf.@count == 0 AND nextCellOf.@count == 0"];
  [v16 setPredicate:v4];

  id v22 = 0;
  double v15 = [v3 executeFetchRequest:v16 error:&v22];
  id v5 = v22;
  if (v5)
  {
    id v6 = v5;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014494C();
    }
  }
  else if ([v15 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v15;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v12 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [v11 prevCellOf];
            double v14 = [v11 nextCellOf];
            *(_DWORD *)buf = 138412802;
            id v24 = v11;
            __int16 v25 = 2112;
            id v26 = v13;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData]:#D Deleting serving cell: %@ (prevCellOf: %@, nextCellOf: %@)", buf, 0x20u);
          }
          objc_msgSend(v3, "deleteObject:", v11, v15);
        }
        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v8);
    }

    id v17 = 0;
    [v3 save:&v17];
    id v6 = v17;
    if (v6 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144908();
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001448D4();
    }
    id v6 = 0;
  }
}

- (void)deletedOrphanedLocationsOfInterestWithContext:(id)a3
{
  id v17 = a3;
  id v16 = +[NSFetchRequest fetchRequestWithEntityName:@"LocationOfInterest"];
  id v3 = +[NSPredicate predicateWithFormat:@"prevVisitOf.@count == 0 AND curVisitOf.@count == 0 AND nextVisitOf.@count == 0"];
  [v16 setPredicate:v3];

  id v23 = 0;
  double v15 = [v17 executeFetchRequest:v16 error:&v23];
  id v4 = v23;
  if (v4)
  {
    id v5 = v4;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v5 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144A08();
    }
  }
  else if ([v15 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v15;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          double v11 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            double v12 = [v10 prevVisitOf];
            id v13 = [v10 curVisitOf];
            double v14 = [v10 nextVisitOf];
            *(_DWORD *)buf = 138413058;
            __int16 v25 = v10;
            __int16 v26 = 2112;
            __int16 v27 = v12;
            __int16 v28 = 2112;
            double v29 = v13;
            __int16 v30 = 2112;
            id v31 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData]:#D Deleting location of interest: %@ (prevVisitOf: %@, curVisitOf: %@, nextVisitOf: %@)", buf, 0x2Au);
          }
          objc_msgSend(v17, "deleteObject:", v10, v15);
        }
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v32 count:16];
      }
      while (v7);
    }

    id v18 = 0;
    [v17 save:&v18];
    id v5 = v18;
    if (v5 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v5 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001449C4();
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100144990();
    }
    id v5 = 0;
  }
}

- (unint64_t)deleteOutOfServiceAreasOlderThan:(id)a3 WithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  uint64_t v9 = +[NSPredicate predicateWithFormat:@"lastSeen < %@", v6];
  [v8 setPredicate:v9];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v9 description];
    objc_claimAutoreleasedReturnValue();
    sub_100144A4C();
  }
  id v14 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v14];
  id v11 = v14;
  if (v11)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v11 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001447C8();
    }
LABEL_10:
    id v12 = 0;
    goto LABEL_11;
  }
  if (![(FMCoreData *)self deleteOutOfServiceAreas:v10 AndAssociatedEntitiesWithContext:v7])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100144794();
    }
    goto LABEL_10;
  }
  id v12 = [v10 count];
LABEL_11:

  return (unint64_t)v12;
}

- (void)deleteOutOfServiceDurationsOlderThan:(id)a3 WithContext:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  long long v19 = v5;
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceDuration"];
  long long v21 = v6;
  id v7 = +[NSPredicate predicateWithFormat:@"timestamp < %@", v5];
  long long v20 = v7;
  [v6 setPredicate:v7];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v7 description];
    objc_claimAutoreleasedReturnValue();
    sub_100144B18();
  }
  id v28 = 0;
  uint64_t v8 = [v22 executeFetchRequest:v6 error:&v28];
  id v9 = v28;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v18 = v8;
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144AD4();
LABEL_18:
      uint64_t v8 = v18;
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v16 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = [v15 timestamp];
            *(_DWORD *)buf = 138412546;
            __int16 v30 = v15;
            __int16 v31 = 2112;
            double v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Deleting OOS duration: %@ (timestamp: %@)", buf, 0x16u);
          }
          [v22 deleteObject:v15];
        }
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v12);
    }

    id v23 = 0;
    [v22 save:&v23];
    id v10 = v23;
    uint64_t v8 = v18;
    if (v10 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144A90();
      goto LABEL_18;
    }
  }
}

- (void)performDatabaseMaintenance
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100144BC4();
  }
  id v3 = [(FMCoreData *)self getNewBackgroundContext];
  id v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100066EA8;
    v5[3] = &unk_1001B7948;
    v5[4] = self;
    id v6 = v3;
    [v6 performBlockAndWait:v5];
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100144B90();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100144B5C();
  }
}

- (void)sendOnDeviceDBTelemetryEventWithContext:(id)a3 andNumberOfDeletedOOSAreasStale:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
  id v27 = 0;
  id v7 = [v5 countForFetchRequest:v6 error:&v27];
  id v8 = v27;
  if (v8)
  {
    id v9 = v8;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v9 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144C80();
    }
  }
  else
  {
    id v10 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceDuration"];
    id v26 = 0;
    id v11 = [v5 countForFetchRequest:v10 error:&v26];
    id v12 = v26;
    if (v12)
    {
      id v9 = v12;
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
      {
        [v9 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_100144C3C();
      }
    }
    else
    {
      uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
      id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"seenCount" ascending:0];
      id v28 = v14;
      double v15 = +[NSArray arrayWithObjects:&v28 count:1];
      [v13 setSortDescriptors:v15];

      [v13 setFetchLimit:1];
      [v13 setReturnsObjectsAsFaults:0];
      id v25 = 0;
      long long v19 = [v5 executeFetchRequest:v13 error:&v25];
      id v9 = v25;
      if (v9)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
        {
          [v9 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100144BF8();
        }
      }
      else
      {
        id v16 = [v19 firstObject];
        id v17 = +[NSString stringWithUTF8String:"com.apple.Telephony.fedMobilityOnDeviceLearningsDB"];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10006736C;
        v20[3] = &unk_1001B6758;
        id v18 = v16;
        id v21 = v18;
        unint64_t v22 = a4;
        id v23 = v7;
        id v24 = v11;
        sub_100005B9C(v17, v20);
      }
    }
  }
}

- (int64_t)getDifferenceBetweenMinutesSinceMidnight:(int64_t)a3 b:(int64_t)a4
{
  int64_t v4 = a3 - a4;
  if (a3 - a4 < 0) {
    int64_t v4 = a4 - a3;
  }
  if (v4 >= 1440 - v4) {
    return 1440 - v4;
  }
  else {
    return v4;
  }
}

- (BOOL)deleteOutOfServiceAreas:(id)a3 AndAssociatedEntitiesWithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v10 lastSeen];
          *(_DWORD *)buf = 138412546;
          double v34 = v10;
          __int16 v35 = 2112;
          double v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData]:#I Deleting OOS area: %@ (last seen: %@)", buf, 0x16u);
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v13 = [v10 durations];
        id v14 = [v13 copy];

        id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
              [v10 removeDurationsObject:v18];
              [v6 deleteObject:v18];
            }
            id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }

        [v6 deleteObject:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  id v23 = 0;
  [v6 save:&v23];
  id v19 = v23;
  if (v19)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v19 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100144DCC();
    }
  }
  else
  {
    [(FMCoreData *)self deletedOrphanedServingCellsWithContext:v6];
    [(FMCoreData *)self deletedOrphanedLocationsOfInterestWithContext:v6];
  }

  return v19 == 0;
}

- (void)setContainer:(id)a3
{
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (dispatch_source_s)databaseMaintenanceTimer
{
  return self->_databaseMaintenanceTimer;
}

- (void)setDatabaseMaintenanceTimer:(dispatch_source_s *)a3
{
  self->_databaseMaintenanceTimer = a3;
}

- (void).cxx_destruct
{
}

- (id)createTSEventWithContext:(id)a3 type:(signed __int16)a4 timeUntilAnomaly:(int)a5 details:(id)a6 eventOf:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = +[NSEntityDescription insertNewObjectForEntityForName:@"TSEvent" inManagedObjectContext:v11];
  [v14 setDetails:v12];
  [v14 setTimeUntilAnomaly:v9];
  [v14 setType:v10];
  [v14 setEventOf:v13];
  id v19 = 0;
  [v11 save:&v19];
  id v15 = v19;
  uint64_t v16 = *(NSObject **)(qword_1001D8080 + 136);
  if (v15)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v15 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001464CC();
    }
    id v17 = 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100146450(v10, v16);
    }
    id v17 = v14;
  }

  return v17;
}

- (id)createTSAnomalyWithContext:(id)a3 anomaly:(id)a4 homePLMN:(id)a5
{
  id v32 = a3;
  id v7 = a4;
  id v30 = a5;
  id v8 = [v7 startTimestamp];
  if (v8 <= [v7 endTimestamp])
  {
    double v33 = +[NSEntityDescription insertNewObjectForEntityForName:@"TSAnomaly" inManagedObjectContext:v32];
    uint64_t v10 = [v7 detailsAsDict];
    [v33 setDetails:v10];

    objc_msgSend(v33, "setDuration:", ((unsigned char *)objc_msgSend(v7, "endTimestamp") - (unsigned char *)objc_msgSend(v7, "startTimestamp")) / 0x3B9ACA00uLL);
    [v33 setHomePLMN:v30];
    id v11 = [v7 startTime];
    [v33 setStartTime:v11];

    objc_msgSend(v33, "setType:", objc_msgSend(v7, "type"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v12 = [v7 events];
    id v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v40;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v17 = [v16 timestamp];
          if (v17 <= [v7 startTimestamp])
          {
            id v19 = [v7 startTimestamp];
            long long v20 = [v16 timestamp];
            id v21 = [v16 type];
            unint64_t v22 = [v16 detailsAsDict];
            id v23 = [(FMCoreData *)self createTSEventWithContext:v32 type:v21 timeUntilAnomaly:(v19 - v20) / 0x3B9ACA00uLL details:v22 eventOf:v33];

            if (!v23)
            {
              long long v24 = *(NSObject **)(qword_1001D8080 + 136);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_100146640(&v35, v36, v24);
              }
            }
          }
          else
          {
            uint64_t v18 = *(NSObject **)(qword_1001D8080 + 136);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100146600(&buf, v38, v18);
            }
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v13);
    }

    id v34 = 0;
    [v32 save:&v34];
    id v25 = v34;
    long long v26 = *(NSObject **)(qword_1001D8080 + 136);
    if (v25)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
      {
        [v25 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_1001465BC();
      }
      id v9 = 0;
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100146544((uint64_t)v7, v26);
      }
      long long v27 = +[FMConfiguration sharedInstance];
      id v28 = -[FMCoreData deleteTSAnomaliesOverThresholdCount:withContext:](self, "deleteTSAnomaliesOverThresholdCount:withContext:", [v27 FMTSAnomaliesInDatabase], v32);

      id v9 = v33;
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100146510();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)createTSPredictionWithContext:(id)a3 prediction:(id)a4
{
  id v30 = a3;
  id v28 = a4;
  if ([v28 didAnomalyHappen])
  {
    id v5 = [v28 actualStartTimestamp];
    if (v5 > [v28 actualEndTimestamp])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_100146680();
      }
LABEL_8:
      id v7 = 0;
      goto LABEL_32;
    }
    id v6 = [v28 predictionTimestamp];
    if (v6 > [v28 actualStartTimestamp])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_1001466B4();
      }
      goto LABEL_8;
    }
  }
  id v8 = +[NSEntityDescription insertNewObjectForEntityForName:@"TSPrediction" inManagedObjectContext:v30];
  long long v29 = v8;
  [v8 setActualDuration:0];
  [v8 setActualTimeUntilAnomaly:0];
  [v8 setDidAnomalyHappen:0];
  if ([v28 didAnomalyHappen])
  {
    id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 actualDuration]);
    [v8 setActualDuration:v9];

    uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 actualTimeUntilAnomaly]);
    [v8 setActualTimeUntilAnomaly:v10];

    [v8 setDidAnomalyHappen:1];
  }
  [v28 confidenceAnomaly];
  objc_msgSend(v8, "setConfidenceAnomaly:");
  [v28 confidenceDuration];
  objc_msgSend(v8, "setConfidenceDuration:");
  [v28 confidenceTimeUntilAnomaly];
  objc_msgSend(v8, "setConfidenceTimeUntilAnomaly:");
  id v11 = [v28 detailsAsDict];
  [v8 setDetails:v11];

  objc_msgSend(v8, "setPredictedDuration:", objc_msgSend(v28, "predictedDuration"));
  objc_msgSend(v8, "setPredictedTimeUntilAnomaly:", objc_msgSend(v28, "predictedTimeUntilAnomaly"));
  id v12 = [v28 predictionTime];
  [v8 setTime:v12];

  objc_msgSend(v8, "setType:", objc_msgSend(v28, "predictedAnomalyType"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = [v28 predictionSources];
  id v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v32 = 0;
        id v19 = [v30 existingObjectWithID:v17 error:&v32];
        id v20 = v32;
        if (!v20
          && v19
          && ([v19 entity],
              id v21 = objc_claimAutoreleasedReturnValue(),
              [v21 name],
              unint64_t v22 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v23 = [v22 isEqualToString:@"TSAnomaly"],
              v22,
              v21,
              (v23 & 1) != 0))
        {
          [v29 addPredictionSourcesObject:v19];
        }
        else
        {
          long long v24 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint8_t buf = 138412546;
            double v38 = v19;
            __int16 v39 = 2112;
            id v40 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "FederatedMobility[FMCoreData+TimeSeries]:Prediction source invalid: %@ (%@)", buf, 0x16u);
          }
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v14);
  }

  id v31 = 0;
  [v30 save:&v31];
  id v25 = v31;
  long long v26 = *(NSObject **)(qword_1001D8080 + 136);
  if (v25)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v25 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100146760();
    }
    id v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001466E8((uint64_t)v29, v26);
    }
    id v7 = v29;
  }

LABEL_32:

  return v7;
}

- (id)deleteTSAnomaliesOverThresholdCount:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"TSAnomaly"];
  id v20 = 0;
  id v8 = (char *)[v6 countForFetchRequest:v7 error:&v20];
  id v9 = v20;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001468A4();
    }
    id v11 = 0;
    goto LABEL_18;
  }
  id v12 = &v8[-a3];
  if ((unint64_t)v8 > a3)
  {
    id v13 = +[NSFetchRequest fetchRequestWithEntityName:@"TSAnomaly"];
    id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startTime" ascending:1];
    id v21 = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:&v21 count:1];
    [v13 setSortDescriptors:v15];

    [v13 setFetchLimit:v12];
    id v19 = 0;
    uint64_t v16 = [v6 executeFetchRequest:v13 error:&v19];
    id v10 = v19;
    if (v10)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
      {
        [v10 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_1001467D8();
      }
    }
    else
    {
      if ([(FMCoreData *)self deleteTSAnomalies:v16 andAssociatedEntitiesWithContext:v6])
      {
        id v11 = v16;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_1001467A4();
      }
    }
    id v11 = 0;
    goto LABEL_17;
  }
  uint64_t v17 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10014681C((uint64_t)v8, a3, v17);
  }
  id v10 = 0;
  id v11 = &__NSArray0__struct;
LABEL_18:

  return v11;
}

- (BOOL)deleteTSAnomalies:(id)a3 andAssociatedEntitiesWithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v10 startTime];
          *(_DWORD *)uint8_t buf = 138412546;
          long long v34 = v10;
          __int16 v35 = 2112;
          long long v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+TimeSeries]:#I Deleting TSAnomaly: %@ (startTime: %@)", buf, 0x16u);
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = [v10 events];
        id v14 = [v13 copy];

        id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
              [v10 removeEventsObject:v18];
              [v6 deleteObject:v18];
            }
            id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }

        [v6 deleteObject:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  id v23 = 0;
  [v6 save:&v23];
  id v19 = v23;
  if (v19)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v19 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001468E8();
    }
  }
  else
  {
    [(FMCoreData *)self deleteOrphanedTSPredictionsWithContext:v6];
  }

  return v19 == 0;
}

- (void)deleteOrphanedTSPredictionsWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v16 = +[NSFetchRequest fetchRequestWithEntityName:@"TSPrediction"];
  int64_t v4 = +[NSPredicate predicateWithFormat:@"predictionSources.@count == 0"];
  [v16 setPredicate:v4];

  id v22 = 0;
  id v5 = [v3 executeFetchRequest:v16 error:&v22];
  id v6 = v22;
  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v15 = v5;
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001469B0();
LABEL_4:
      id v5 = v15;
    }
  }
  else if ([v5 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v12 predictionSources];
            *(_DWORD *)uint8_t buf = 138412546;
            long long v24 = v12;
            __int16 v25 = 2112;
            long long v26 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+TimeSeries]:#D Deleting TSPrediction: %@ (predictionSources: %@)", buf, 0x16u);
          }
          objc_msgSend(v3, "deleteObject:", v12, v15);
        }
        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v9);
    }

    id v17 = 0;
    id v5 = v15;
    [v3 save:&v17];
    id v7 = v17;
    if (v7 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014696C();
      goto LABEL_4;
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014692C();
    }
    id v7 = 0;
  }
}

- (void)deleteTSAnomaliesWithContext:(id)a3 olderThan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"TSAnomaly"];
  id v9 = +[NSPredicate predicateWithFormat:@"startTime < %@", v7];
  [v8 setPredicate:v9];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v9 description];
    objc_claimAutoreleasedReturnValue();
    sub_100146A6C();
  }
  id v12 = 0;
  uint64_t v10 = [v6 executeFetchRequest:v8 error:&v12];
  id v11 = v12;
  if (v11)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v11 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100146A28();
    }
  }
  else if (![(FMCoreData *)self deleteTSAnomalies:v10 andAssociatedEntitiesWithContext:v6]&& os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_1001469F4();
  }
}

- (void)updateCongestionCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5 congestionMetric:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_msgSend(v10, "setRsrp:", objc_msgSend(v12, "rsrp"));
  objc_msgSend(v10, "setRsrq:", objc_msgSend(v12, "rsrq"));
  objc_msgSend(v10, "setSinr:", objc_msgSend(v12, "sinr"));
  objc_msgSend(v10, "setDlBottleneckScoreInvalid:", objc_msgSend(v12, "dlBottleneckScoreInvalid"));
  objc_msgSend(v10, "setDlBottleneckScoreNo:", objc_msgSend(v12, "dlBottleneckScoreNo"));
  objc_msgSend(v10, "setDlBottleneckScoreLow:", objc_msgSend(v12, "dlBottleneckScoreLow"));
  objc_msgSend(v10, "setDlBottleneckScoreMedium:", objc_msgSend(v12, "dlBottleneckScoreMedium"));
  objc_msgSend(v10, "setDlBottleneckScoreHigh:", objc_msgSend(v12, "dlBottleneckScoreHigh"));
  objc_msgSend(v10, "setUlBottleneckScoreInvalid:", objc_msgSend(v12, "ulBottleneckScoreInvalid"));
  objc_msgSend(v10, "setUlBottleneckScoreNo:", objc_msgSend(v12, "ulBottleneckScoreNo"));
  objc_msgSend(v10, "setUlBottleneckScoreLow:", objc_msgSend(v12, "ulBottleneckScoreLow"));
  objc_msgSend(v10, "setUlBottleneckScoreMedium:", objc_msgSend(v12, "ulBottleneckScoreMedium"));
  objc_msgSend(v10, "setUlBottleneckScoreHigh:", objc_msgSend(v12, "ulBottleneckScoreHigh"));
  objc_msgSend(v10, "setDataStallIndicatorAVS:", objc_msgSend(v12, "dataStallIndicatorAVS"));
  objc_msgSend(v10, "setDataStallIndicatorUL:", objc_msgSend(v12, "dataStallIndicatorUL"));
  objc_msgSend(v10, "setIsSubway:", objc_msgSend(v12, "isSubway"));
  objc_msgSend(v10, "setPsPref:", objc_msgSend(v12, "psPref"));
  [v10 setLastSeen:v11];
  objc_msgSend(v10, "setSeenCount:", objc_msgSend(v10, "seenCount") + 1);
  id v14 = 0;
  [v9 save:&v14];
  id v13 = v14;
  if (v13 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    [v13 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10014AB70();
  }
}

- (id)createCongestionCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 congestionMetric:(id)a10 timestamp:(id)a11
{
  id v16 = a3;
  id v28 = a4;
  id v27 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014ABF8();
  }
  id v23 = +[NSEntityDescription insertNewObjectForEntityForName:@"CongestionCell" inManagedObjectContext:v16];
  [v23 setLastSeen:v22];
  [v23 setSeenCount:0];
  [v23 setSubscriptionID:v28];
  [v23 setGci:v27];
  [v23 setMcc:v17];
  [v23 setMnc:v18];
  [v23 setRadioAccessTechnology:v19];
  [v23 setArfcnOrUarfcn:v20];
  objc_msgSend(v23, "setRsrp:", objc_msgSend(v21, "rsrp"));
  objc_msgSend(v23, "setRsrq:", objc_msgSend(v21, "rsrq"));
  objc_msgSend(v23, "setSinr:", objc_msgSend(v21, "sinr"));
  objc_msgSend(v23, "setDlBottleneckScoreInvalid:", objc_msgSend(v21, "dlBottleneckScoreInvalid"));
  objc_msgSend(v23, "setDlBottleneckScoreNo:", objc_msgSend(v21, "dlBottleneckScoreNo"));
  objc_msgSend(v23, "setDlBottleneckScoreLow:", objc_msgSend(v21, "dlBottleneckScoreLow"));
  objc_msgSend(v23, "setDlBottleneckScoreMedium:", objc_msgSend(v21, "dlBottleneckScoreMedium"));
  objc_msgSend(v23, "setDlBottleneckScoreHigh:", objc_msgSend(v21, "dlBottleneckScoreHigh"));
  objc_msgSend(v23, "setUlBottleneckScoreInvalid:", objc_msgSend(v21, "ulBottleneckScoreInvalid"));
  objc_msgSend(v23, "setUlBottleneckScoreNo:", objc_msgSend(v21, "ulBottleneckScoreNo"));
  objc_msgSend(v23, "setUlBottleneckScoreLow:", objc_msgSend(v21, "ulBottleneckScoreLow"));
  objc_msgSend(v23, "setUlBottleneckScoreMedium:", objc_msgSend(v21, "ulBottleneckScoreMedium"));
  objc_msgSend(v23, "setUlBottleneckScoreHigh:", objc_msgSend(v21, "ulBottleneckScoreHigh"));
  objc_msgSend(v23, "setDataStallIndicatorAVS:", objc_msgSend(v21, "dataStallIndicatorAVS"));
  objc_msgSend(v23, "setDataStallIndicatorUL:", objc_msgSend(v21, "dataStallIndicatorUL"));
  objc_msgSend(v23, "setIsSubway:", objc_msgSend(v21, "isSubway"));
  objc_msgSend(v23, "setPsPref:", objc_msgSend(v21, "psPref"));
  id v29 = 0;
  [v16 save:&v29];
  id v24 = v29;
  if (v24)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v24 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014ABB4();
    }
    id v25 = 0;
  }
  else
  {
    id v25 = v23;
  }

  return v25;
}

- (void)updateCongestionPrevCellSeenWithContext:(id)a3 cell:(id)a4 atTimestamp:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 setLastSeen:v9];
  objc_msgSend(v8, "setSeenCount:", objc_msgSend(v8, "seenCount") + 1);
  id v11 = 0;
  [v7 save:&v11];
  id v10 = v11;
  if (v10 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    [v10 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10014AD18();
  }
}

- (id)convertFMCongestionCells:(id)a3 toUpdatedCongestionPrevCellsWithContext:(id)a4
{
  id v5 = a3;
  id v24 = a4;
  id v19 = v5;
  id v21 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v22 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = [v8 subscriptionID];
        id v10 = [v8 gci];
        id v11 = [v8 mcc];
        id v12 = [v8 mnc];
        id v13 = [v8 rat];
        id v14 = [v8 arfcnOrUarfcn];
        id v15 = [v8 timestamp];
        id v16 = -[FMCoreData getOrCreateAndUpdateCongestionPrevCellWithContext:subscriptionID:gci:mcc:mnc:rat:arfcnOrUarfcn:timestamp:](self, "getOrCreateAndUpdateCongestionPrevCellWithContext:subscriptionID:gci:mcc:mnc:rat:arfcnOrUarfcn:timestamp:", v24, v9, v10, v11, v12, v13, v14, v15, v19);

        if (v16) {
          [v21 addObject:v16];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  id v17 = [v21 copy];

  return v17;
}

- (id)getOrCreateAndUpdateCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 timestamp:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = [(FMCoreData *)self getCongestionPrevCellWithContext:v16 subscriptionID:v17 gci:v18 mcc:v19 mnc:v20 rat:v21 arfcnOrUarfcn:v22];
  if (v24)
  {
    [(FMCoreData *)self updateCongestionPrevCellSeenWithContext:v16 cell:v24 atTimestamp:v23];
    id v25 = v24;
  }
  else
  {
    id v25 = [(FMCoreData *)self createCongestionPrevCellWithContext:v16 subscriptionID:v17 gci:v18 mcc:v19 mnc:v20 rat:v21 arfcnOrUarfcn:v22 timestamp:v23];
  }
  long long v26 = v25;

  return v26;
}

- (id)createCongestionPrevCellWithContext:(id)a3 subscriptionID:(id)a4 gci:(id)a5 mcc:(id)a6 mnc:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9 timestamp:(id)a10
{
  id v15 = a3;
  id v26 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014AD5C();
  }
  id v22 = +[NSEntityDescription insertNewObjectForEntityForName:@"CongestionPrevCell", v15, v26 inManagedObjectContext];
  [v22 setLastSeen:v21];
  [v22 setSeenCount:0];
  [v22 setSubscriptionID:v27];
  [v22 setGci:v16];
  [v22 setMcc:v17];
  [v22 setMnc:v18];
  [v22 setRadioAccessTechnology:v19];
  [v22 setArfcnOrUarfcn:v20];
  id v28 = 0;
  [v15 save:&v28];
  id v23 = v28;
  if (v23)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v23 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014ABB4();
    }
    id v24 = 0;
  }
  else
  {
    id v24 = v22;
  }

  return v24;
}

- (id)filterCongestionAreasWithContext:(id)a3 unfilteredCongestionAreas:(id)a4 withExactPrevCells:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "prevCells", (void)v18);
        id v15 = [v14 count];
        LOBYTE(v15) = v15 == [v7 count];

        if (v15) {
          [v8 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = [v8 copy];

  return v16;
}

- (void)updateCongestionAreaAfterLeavingWithContext:(id)a3 congestionArea:(id)a4 startTime:(id)a5 goodCells:(id)a6 badCells:(id)a7 secondsUntilCongestion:(double)a8 secondsCongestionDuration:(double)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v94 = a6;
  v92 = v18;
  id v93 = a7;
  v109 = v17;
  if (v17)
  {
    [v17 setLastSeen:v18];
    objc_msgSend(v17, "setSeenCount:", objc_msgSend(v17, "seenCount") + 1);
    v91 = +[NSEntityDescription insertNewObjectForEntityForName:@"CongestionOccurrence" inManagedObjectContext:v16];
    [v91 setSecondsUntilCongestion:llround(a8)];
    [v91 setSecondsCongestionDuration:llround(a9)];
    [v91 setTimestamp:v18];
    [v17 addCongestionOccurrencesObject:v91];
    long long v19 = [v17 congestionOccurrences];
    long long v20 = [v19 count];

    long long v21 = +[FMConfiguration sharedInstance];
    id v22 = [v21 congestionOccurrencesInDatabase];

    BOOL v23 = v20 >= v22;
    int64_t v24 = v20 - v22;
    if (v24 != 0 && v23)
    {
      id v25 = [v17 congestionOccurrences];
      id v26 = [v25 copy];
      long long v27 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v24);
      id v28 = [v26 objectsAtIndexes:v27];

      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v29 = v28;
      id v30 = [v29 countByEnumeratingWithState:&v143 objects:v153 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v144;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v144 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v33 = *(void *)(*((void *)&v143 + 1) + 8 * i);
            [v17 removeCongestionOccurrencesObject:v33];
            [v16 deleteObject:v33];
          }
          id v30 = [v29 countByEnumeratingWithState:&v143 objects:v153 count:16];
        }
        while (v30);
      }
    }
    if (v94)
    {
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id obj = v94;
      id v103 = [obj countByEnumeratingWithState:&v139 objects:v152 count:16];
      if (v103)
      {
        uint64_t v101 = *(void *)v140;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v140 != v101) {
              objc_enumerationMutation(obj);
            }
            __int16 v35 = *(void **)(*((void *)&v139 + 1) + 8 * v34);
            long long v36 = [v35 congestionMetric];
            uint64_t v105 = v34;
            BOOL v37 = v36 == 0;

            if (v37)
            {
              if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
                sub_10014AF30(&v137, v138);
              }
            }
            else
            {
              double v38 = [v109 goodCells];
              v136[0] = _NSConcreteStackBlock;
              v136[1] = 3221225472;
              v136[2] = sub_1000F3AFC;
              v136[3] = &unk_1001BC930;
              v136[4] = self;
              v136[5] = v35;
              v107 = [v38 objectsPassingTest:v136];

              if ([v107 count])
              {
                long long v134 = 0u;
                long long v135 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                id v39 = v107;
                id v40 = [v39 countByEnumeratingWithState:&v132 objects:v151 count:16];
                if (v40)
                {
                  uint64_t v41 = *(void *)v133;
                  do
                  {
                    for (j = 0; j != v40; j = (char *)j + 1)
                    {
                      if (*(void *)v133 != v41) {
                        objc_enumerationMutation(v39);
                      }
                      uint64_t v43 = *(void *)(*((void *)&v132 + 1) + 8 * (void)j);
                      double v44 = [v35 timestamp];
                      double v45 = [v35 congestionMetric];
                      [(FMCoreData *)self updateCongestionCellSeenWithContext:v16 cell:v43 atTimestamp:v44 congestionMetric:v45];
                    }
                    id v40 = [v39 countByEnumeratingWithState:&v132 objects:v151 count:16];
                  }
                  while (v40);
                }
              }
              else
              {
                double v46 = [v109 badCells];
                v131[0] = _NSConcreteStackBlock;
                v131[1] = 3221225472;
                v131[2] = sub_1000F3B0C;
                v131[3] = &unk_1001BC930;
                v131[4] = self;
                v131[5] = v35;
                v99 = [v46 objectsPassingTest:v131];

                if ([v99 count])
                {
                  long long v129 = 0u;
                  long long v130 = 0u;
                  long long v127 = 0u;
                  long long v128 = 0u;
                  id v47 = v99;
                  id v48 = [v47 countByEnumeratingWithState:&v127 objects:v150 count:16];
                  if (v48)
                  {
                    uint64_t v49 = *(void *)v128;
                    do
                    {
                      for (k = 0; k != v48; k = (char *)k + 1)
                      {
                        if (*(void *)v128 != v49) {
                          objc_enumerationMutation(v47);
                        }
                        uint64_t v51 = *(void *)(*((void *)&v127 + 1) + 8 * (void)k);
                        id v52 = [v35 timestamp];
                        id v53 = [v35 congestionMetric];
                        [(FMCoreData *)self updateCongestionCellSeenWithContext:v16 cell:v51 atTimestamp:v52 congestionMetric:v53];

                        [v109 removeBadCellsObject:v51];
                        [v109 addGoodCellsObject:v51];
                      }
                      id v48 = [v47 countByEnumeratingWithState:&v127 objects:v150 count:16];
                    }
                    while (v48);
                  }
                }
                else
                {
                  v95 = [v35 subscriptionID];
                  id v54 = [v35 gci];
                  uint64_t v55 = [v35 mcc];
                  long long v56 = [v35 mnc];
                  long long v57 = [v35 rat];
                  long long v58 = [v35 arfcnOrUarfcn];
                  long long v59 = [v35 congestionMetric];
                  long long v60 = [v35 timestamp];
                  id v61 = (void *)v55;
                  id v47 = [(FMCoreData *)self createCongestionCellWithContext:v16 subscriptionID:v95 gci:v54 mcc:v55 mnc:v56 rat:v57 arfcnOrUarfcn:v58 congestionMetric:v59 timestamp:v60];

                  if (v47) {
                    [v109 addGoodCellsObject:v47];
                  }
                }
              }
            }
            uint64_t v34 = v105 + 1;
          }
          while ((id)(v105 + 1) != v103);
          id v103 = [obj countByEnumeratingWithState:&v139 objects:v152 count:16];
        }
        while (v103);
      }
    }
    if (v93)
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id obja = v93;
      id v104 = [obja countByEnumeratingWithState:&v123 objects:v149 count:16];
      if (v104)
      {
        uint64_t v102 = *(void *)v124;
        do
        {
          uint64_t v62 = 0;
          do
          {
            if (*(void *)v124 != v102) {
              objc_enumerationMutation(obja);
            }
            __int16 v63 = *(void **)(*((void *)&v123 + 1) + 8 * v62);
            id v64 = [v63 congestionMetric];
            uint64_t v106 = v62;
            BOOL v65 = v64 == 0;

            if (v65)
            {
              if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
                sub_10014AF00(&v121, v122);
              }
            }
            else
            {
              v66 = [v109 badCells];
              v120[0] = _NSConcreteStackBlock;
              v120[1] = 3221225472;
              v120[2] = sub_1000F3B1C;
              v120[3] = &unk_1001BC930;
              v120[4] = self;
              v120[5] = v63;
              v108 = [v66 objectsPassingTest:v120];

              if ([v108 count])
              {
                long long v118 = 0u;
                long long v119 = 0u;
                long long v117 = 0u;
                long long v116 = 0u;
                id v67 = v108;
                id v68 = [v67 countByEnumeratingWithState:&v116 objects:v148 count:16];
                if (v68)
                {
                  uint64_t v69 = *(void *)v117;
                  do
                  {
                    for (m = 0; m != v68; m = (char *)m + 1)
                    {
                      if (*(void *)v117 != v69) {
                        objc_enumerationMutation(v67);
                      }
                      uint64_t v71 = *(void *)(*((void *)&v116 + 1) + 8 * (void)m);
                      long long v72 = [v63 timestamp];
                      v73 = [v63 congestionMetric];
                      [(FMCoreData *)self updateCongestionCellSeenWithContext:v16 cell:v71 atTimestamp:v72 congestionMetric:v73];
                    }
                    id v68 = [v67 countByEnumeratingWithState:&v116 objects:v148 count:16];
                  }
                  while (v68);
                }
              }
              else
              {
                v74 = [v109 goodCells];
                v115[0] = _NSConcreteStackBlock;
                v115[1] = 3221225472;
                v115[2] = sub_1000F3B2C;
                v115[3] = &unk_1001BC930;
                v115[4] = self;
                v115[5] = v63;
                v100 = [v74 objectsPassingTest:v115];

                if ([v100 count])
                {
                  long long v113 = 0u;
                  long long v114 = 0u;
                  long long v111 = 0u;
                  long long v112 = 0u;
                  id v75 = v100;
                  id v76 = [v75 countByEnumeratingWithState:&v111 objects:v147 count:16];
                  if (v76)
                  {
                    uint64_t v77 = *(void *)v112;
                    do
                    {
                      for (n = 0; n != v76; n = (char *)n + 1)
                      {
                        if (*(void *)v112 != v77) {
                          objc_enumerationMutation(v75);
                        }
                        uint64_t v79 = *(void *)(*((void *)&v111 + 1) + 8 * (void)n);
                        v80 = [v63 timestamp];
                        v81 = [v63 congestionMetric];
                        [(FMCoreData *)self updateCongestionCellSeenWithContext:v16 cell:v79 atTimestamp:v80 congestionMetric:v81];

                        [v109 removeGoodCellsObject:v79];
                        [v109 addBadCellsObject:v79];
                      }
                      id v76 = [v75 countByEnumeratingWithState:&v111 objects:v147 count:16];
                    }
                    while (v76);
                  }
                }
                else
                {
                  v96 = [v63 subscriptionID];
                  v82 = [v63 gci];
                  uint64_t v83 = [v63 mcc];
                  v84 = [v63 mnc];
                  v85 = [v63 rat];
                  v86 = [v63 arfcnOrUarfcn];
                  v87 = [v63 congestionMetric];
                  v88 = [v63 timestamp];
                  v89 = (void *)v83;
                  id v75 = [(FMCoreData *)self createCongestionCellWithContext:v16 subscriptionID:v96 gci:v82 mcc:v83 mnc:v84 rat:v85 arfcnOrUarfcn:v86 congestionMetric:v87 timestamp:v88];

                  if (v75) {
                    [v109 addBadCellsObject:v75];
                  }
                }
              }
            }
            uint64_t v62 = v106 + 1;
          }
          while ((id)(v106 + 1) != v104);
          id v104 = [obja countByEnumeratingWithState:&v123 objects:v149 count:16];
        }
        while (v104);
      }
    }
    id v110 = 0;
    [v16 save:&v110];
    id v90 = v110;
    if (v90 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v90 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014AEBC();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_10014AE84();
  }
}

- (id)handleCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 startTime:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(FMCoreData *)self getCongestionAreaWithContext:v10 subscriptionID:v11 prevCells:v12 timeOfDay:[(FMCoreData *)self getTimeOfDayFromDate:v13] dayOfWeek:[(FMCoreData *)self getDayOfWeekFromDate:v13]];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
    goto LABEL_11;
  }
  id v17 = [(FMCoreData *)self createCongestionAreaWithContext:v10 subscriptionID:v11 prevCells:v12 startTime:v13];
  id v18 = +[FMConfiguration sharedInstance];
  long long v19 = -[FMCoreData deleteCongestionAreasOverThresholdCount:withContext:](self, "deleteCongestionAreasOverThresholdCount:withContext:", [v18 congestionMaxAreasInDatabase], v10);

  if (v19)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000F3D84;
    v21[3] = &unk_1001BC958;
    id v22 = v17;
    if ([v19 indexOfObjectPassingTest:v21] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_10014AF60();
      }

      id v16 = 0;
      goto LABEL_10;
    }
  }
  id v16 = v17;
LABEL_10:

LABEL_11:

  return v16;
}

- (id)createCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 startTime:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Creating new CongestionArea", buf, 2u);
  }
  id v15 = +[NSEntityDescription insertNewObjectForEntityForName:@"CongestionArea" inManagedObjectContext:v10];
  [v15 setLastSeen:v13];
  [v15 setSeenCount:0];
  [v15 setSubscriptionID:v11];
  id v16 = +[FMConfiguration sharedInstance];
  id v17 = [v16 congestionPrevCellsInDatabase];

  if ([v12 count] <= v17)
  {
    id v23 = [v12 copy];
  }
  else
  {
    id v18 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v12 count];
      *(_DWORD *)uint8_t buf = 134218240;
      id v38 = v19;
      __int16 v39 = 2048;
      id v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Received more prevCells for database than expected: %lu > %lu", buf, 0x16u);
    }
    id v20 = objc_alloc((Class)NSOrderedSet);
    long long v21 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", (unsigned char *)[v12 count] - v17, v17);
    id v22 = [v12 objectsAtIndexes:v21];
    id v23 = [v20 initWithArray:v22];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v23;
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v33;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v24);
        }
        [v15 addPrevCellsObject:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v25);
  }

  objc_msgSend(v15, "setTimeOfDay:", -[FMCoreData getTimeOfDayFromDate:](self, "getTimeOfDayFromDate:", v13));
  objc_msgSend(v15, "setDayOfWeek:", -[FMCoreData getDayOfWeekFromDate:](self, "getDayOfWeekFromDate:", v13));
  id v31 = 0;
  [v10 save:&v31];
  id v28 = v31;
  if (v28)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v28 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014AF94();
    }
    id v29 = 0;
  }
  else
  {
    id v29 = v15;
  }

  return v29;
}

- (id)getCongestionAreaWithContext:(id)a3 subscriptionID:(id)a4 prevCells:(id)a5 timeOfDay:(signed __int16)a6 dayOfWeek:(signed __int16)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v39 = v12;
  id v40 = v14;
  long long v36 = v13;
  id v15 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionArea"];
  uint64_t v41 = v15;
  if ([(FMCoreData *)self isRushHourAtDayOfWeek:v7 andTimeOfDay:v8])
  {
    id v16 = [v14 count];
    CFStringRef v17 = @"(subscriptionID == %@) AND (SUBQUERY(prevCells, $prevCell, $prevCell IN %@).@count == %d) AND (dayOfWeek >= 2 AND dayOfWeek <= 6) AND ((timeOfDay >= 420 AND timeOfDay < 540) OR (timeOfDay >= 960 AND timeOfDay < 1080))";
  }
  else
  {
    id v16 = [v14 count];
    CFStringRef v17 = @"(subscriptionID == %@) AND (SUBQUERY(prevCells, $prevCell, $prevCell IN %@).@count == %d) AND NOT ((dayOfWeek >= 2 AND dayOfWeek <= 6) AND ((timeOfDay >= 420 AND timeOfDay < 540) OR (timeOfDay >= 960 AND timeOfDay < 1080)))";
  }
  id v18 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v17, v13, v14, v16);
  [v15 setPredicate:v18];
  [v15 setReturnsObjectsAsFaults:0];
  id v19 = *(NSObject **)(qword_1001D8080 + 136);
  id v38 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v18 description];
    *(_DWORD *)uint8_t buf = 138412290;
    id v50 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Fetching CongestionArea with predicate %@", buf, 0xCu);
  }
  id v47 = 0;
  long long v42 = [v12 executeFetchRequest:v15 error:&v47];
  id v21 = v47;
  id v22 = *(NSObject **)(qword_1001D8080 + 136);
  BOOL v37 = v21;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [v42 count];
    *(_DWORD *)uint8_t buf = 134217984;
    id v50 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Fetch done, %lu unfiltered results", buf, 0xCu);
  }
  if (v21)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v21 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B040();
    }
    id v24 = 0;
  }
  else
  {
    id v25 = [(FMCoreData *)self filterCongestionAreasWithContext:v12 unfilteredCongestionAreas:v42 withExactPrevCells:v14];
    if ([v25 count])
    {
      if ([v25 count] == (id)1)
      {
        id v24 = [v25 firstObject];
      }
      else
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_10014B00C();
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v26 = v25;
        long long v35 = v25;
        id v24 = 0;
        id v27 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v44;
          uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v44 != v28) {
                objc_enumerationMutation(v26);
              }
              id v31 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              int64_t v32 = -[FMCoreData getDifferenceBetweenMinutesSinceMidnight:b:](self, "getDifferenceBetweenMinutesSinceMidnight:b:", (int)[v31 timeOfDay], (int)v8);
              if (v32 < v29)
              {
                id v33 = v31;

                id v24 = v33;
                uint64_t v29 = v32;
              }
            }
            id v27 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v27);
        }

        id v25 = v35;
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_10014AFD8();
      }
      id v24 = 0;
    }
  }

  return v24;
}

- (void)deleteCongestionAreasOlderThan:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionArea"];
  id v9 = +[NSPredicate predicateWithFormat:@"lastSeen < %@", v6];
  [v8 setPredicate:v9];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v9 description];
    objc_claimAutoreleasedReturnValue();
    sub_10014B100();
  }
  id v12 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v12];
  id v11 = v12;
  if (v11)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v11 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B0BC();
    }
  }
  else if (![(FMCoreData *)self deleteCongestionAreas:v10 andAssociatedEntitiesWithContext:v7]&& os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_10014B084();
  }
}

- (void)deleteCongestionOccurrencesOlderThan:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  id v19 = v5;
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionOccurrence"];
  id v21 = v6;
  id v7 = +[NSPredicate predicateWithFormat:@"timestamp < %@", v5];
  id v20 = v7;
  [v6 setPredicate:v7];
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    [v7 description];
    objc_claimAutoreleasedReturnValue();
    sub_10014B1CC();
  }
  id v28 = 0;
  uint64_t v8 = [v22 executeFetchRequest:v6 error:&v28];
  id v9 = v28;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v18 = v8;
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B188();
LABEL_18:
      uint64_t v8 = v18;
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v16 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            CFStringRef v17 = [v15 timestamp];
            *(_DWORD *)uint8_t buf = 138412546;
            id v30 = v15;
            __int16 v31 = 2112;
            int64_t v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Deleting congestion occurrence: %@ (timestamp: %@)", buf, 0x16u);
          }
          [v22 deleteObject:v15];
        }
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v12);
    }

    id v23 = 0;
    [v22 save:&v23];
    id v10 = v23;
    uint64_t v8 = v18;
    if (v10 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B144();
      goto LABEL_18;
    }
  }
}

- (id)deleteCongestionAreasOverThresholdCount:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionArea"];
  id v20 = 0;
  uint64_t v8 = (char *)[v6 countForFetchRequest:v7 error:&v20];
  id v9 = v20;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B298();
    }
    id v11 = 0;
    goto LABEL_18;
  }
  id v12 = &v8[-a3];
  if ((unint64_t)v8 > a3)
  {
    uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionArea"];
    id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastSeen" ascending:1];
    id v21 = v14;
    id v15 = +[NSArray arrayWithObjects:&v21 count:1];
    [v13 setSortDescriptors:v15];

    [v13 setFetchLimit:v12];
    id v19 = 0;
    id v16 = [v6 executeFetchRequest:v13 error:&v19];
    id v10 = v19;
    if (v10)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
      {
        [v10 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10014B0BC();
      }
    }
    else
    {
      if ([(FMCoreData *)self deleteCongestionAreas:v16 andAssociatedEntitiesWithContext:v6])
      {
        id v11 = v16;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_10014B084();
      }
    }
    id v11 = 0;
    goto LABEL_17;
  }
  CFStringRef v17 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10014B210((uint64_t)v8, a3, v17);
  }
  id v10 = 0;
  id v11 = &__NSArray0__struct;
LABEL_18:

  return v11;
}

- (BOOL)deleteCongestionAreas:(id)a3 andAssociatedEntitiesWithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v10 lastSeen];
          *(_DWORD *)uint8_t buf = 138412546;
          long long v34 = v10;
          __int16 v35 = 2112;
          long long v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreData+Congestion]:#I Deleting congestion area: %@ (last seen: %@)", buf, 0x16u);
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v13 = [v10 congestionOccurrences];
        id v14 = [v13 copy];

        id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
              [v10 removeCongestionOccurrencesObject:v18];
              [v6 deleteObject:v18];
            }
            id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }

        [v6 deleteObject:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  id v23 = 0;
  [v6 save:&v23];
  id v19 = v23;
  if (v19)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v19 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B2DC();
    }
  }
  else
  {
    [(FMCoreData *)self deleteOrphanedCongestionCellsWithContext:v6];
    [(FMCoreData *)self deleteOrphanedCongestionPrevCellsWithContext:v6];
  }

  return v19 == 0;
}

- (void)deleteOrphanedCongestionCellsWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v16 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionCell"];
  int64_t v4 = +[NSPredicate predicateWithFormat:@"badCellOf.@count == 0 AND goodCellOf.@count == 0"];
  [v16 setPredicate:v4];

  id v22 = 0;
  id v15 = [v3 executeFetchRequest:v16 error:&v22];
  id v5 = v22;
  if (v5)
  {
    id v6 = v5;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B398();
    }
  }
  else if ([v15 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v15;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v13 = [v11 badCellOf];
            id v14 = [v11 goodCellOf];
            *(_DWORD *)uint8_t buf = 138412802;
            long long v24 = v11;
            __int16 v25 = 2112;
            long long v26 = v13;
            __int16 v27 = 2112;
            long long v28 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+Congestion]:#D Deleting congestion cell: %@ (badCellOf: %@, goodCellOf: %@)", buf, 0x20u);
          }
          objc_msgSend(v3, "deleteObject:", v11, v15);
        }
        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v8);
    }

    id v17 = 0;
    [v3 save:&v17];
    id v6 = v17;
    if (v6 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B354();
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014B320();
    }
    id v6 = 0;
  }
}

- (void)deleteOrphanedCongestionPrevCellsWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v16 = +[NSFetchRequest fetchRequestWithEntityName:@"CongestionPrevCell"];
  int64_t v4 = +[NSPredicate predicateWithFormat:@"prevCellOf.@count == 0"];
  [v16 setPredicate:v4];

  id v22 = 0;
  id v5 = [v3 executeFetchRequest:v16 error:&v22];
  id v6 = v22;
  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      id v15 = v5;
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B454();
LABEL_4:
      id v5 = v15;
    }
  }
  else if ([v5 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v12 prevCellOf];
            *(_DWORD *)uint8_t buf = 138412546;
            long long v24 = v12;
            __int16 v25 = 2112;
            long long v26 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCoreData+Congestion]:#D Deleting congestion prev cell: %@ (prevCellOf: %@)", buf, 0x16u);
          }
          objc_msgSend(v3, "deleteObject:", v12, v15);
        }
        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v9);
    }

    id v17 = 0;
    id v5 = v15;
    [v3 save:&v17];
    id v7 = v17;
    if (v7 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014B410();
      goto LABEL_4;
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014B3DC();
    }
    id v7 = 0;
  }
}

- (BOOL)isFMCongestionCell:(id)a3 equalToCongestionCell:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 mcc];
  id v8 = [v6 mcc];
  if ([v7 isEqualToNumber:v8])
  {
    id v9 = [v5 mnc];
    uint64_t v10 = [v6 mnc];
    if (![v9 isEqualToNumber:v10])
    {
      unsigned __int8 v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
    long long v18 = [v5 gci];
    id v17 = [v6 gci];
    if (!objc_msgSend(v18, "isEqualToString:"))
    {
      unsigned __int8 v14 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v11 = [v5 arfcnOrUarfcn];
    if (v11 || ([v6 arfcnOrUarfcn], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = [v5 arfcnOrUarfcn];
      uint64_t v13 = [v6 arfcnOrUarfcn];
      unsigned __int8 v14 = [v12 isEqualToNumber:v13];

      if (v11)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v16 = 0;
      unsigned __int8 v14 = 1;
    }
    id v11 = (void *)v16;
    goto LABEL_13;
  }
  unsigned __int8 v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)isRushHourAtDayOfWeek:(signed __int16)a3 andTimeOfDay:(signed __int16)a4
{
  BOOL v4 = (unsigned __int16)a4 - 960 < 0x78;
  if ((unsigned __int16)a4 - 420 < 0x78) {
    BOOL v4 = 1;
  }
  return (unsigned __int16)a3 - 2 <= 4 && v4;
}

@end