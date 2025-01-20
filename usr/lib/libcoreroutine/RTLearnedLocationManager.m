@interface RTLearnedLocationManager
+ (double)distanceThresholdFromUncertainty:(double)a3 otherUncertainty:(double)a4;
+ (double)maxDistanceFromInterval:(double)a3 velocity:(double)a4;
+ (id)migrateLegacyMapItemWithGeoMapItem:(id)a3 geoMapItemHandle:(id)a4 source:(unint64_t)a5 mapServiceManager:(id)a6 error:(id *)a7;
+ (id)modeToString:(int64_t)a3;
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (BOOL)_matchLocation:(id)a3 locationOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 error:(id *)a6;
- (BOOL)available;
- (BOOL)migrationComplete;
- (BOOL)validateUpdatedMapItem:(id)a3 locationOfInterest:(id)a4 error:(id *)a5;
- (RTContactsManager)contactsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationEngine)learnedLocationEngine;
- (RTLearnedLocationManager)init;
- (RTLearnedLocationManager)initWithQueue:(id)a3 contactsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 learnedPlaceTypeInferenceStore:(id)a7 mapServiceManager:(id)a8;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore;
- (RTMapServiceManager)mapServiceManager;
- (double)_estimateFamiliarityIndexForAreaWithGeohash:(id)a3 familiarPlaces:(id)a4 visitedLearnedLOI:(id)a5 statsVisits:(id)a6;
- (double)_estimateFamiliarityIndexForLearnedLOI:(id)a3 statsLOIVisits:(id)a4;
- (double)_estimateFamiliarityIndexReferenceLocationSummary:(id)a3 dwellTimePerAreas:(id)a4;
- (double)_weeksInLearnedLocationsOfInterestModel;
- (id)_checkFamiliarityIndexResultsForErrors:(id)a3;
- (id)_combineFamiliarityIndexRetrieveError:(id)a3 resultsError:(id)a4;
- (id)_getAreasGeohashesFamiliarPlacesWithGranularity:(unint64_t)a3 outError:(id *)a4;
- (id)_getDateOnlyFromLearnedVisitDate:(id)a3;
- (id)_getFamiliarityIndexResultAreaLevelForLearnedVisit:(id)a3 learnedLOI:(id)a4 geohash:(id)a5 familiarPlaces:(id)a6 statsVisits:(id)a7;
- (id)_getFamiliarityIndexResultForLearnedVisit:(id)a3 learnedLOI:(id)a4 statsLOIVisits:(id)a5;
- (id)_getFamiliarityIndexResultsAreaLevelForLearnedLOIs:(id)a3 options:(id)a4 familiarPlaces:(id)a5 outError:(id *)a6;
- (id)_getFamiliarityIndexResultsLOILevelForLOIs:(id)a3 options:(id)a4 outError:(id *)a5;
- (id)_getLearnedVisits:(id)a3 dateInterval:(id)a4;
- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5;
- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 dwellTimePercentageThreshold:(double)a6 error:(id *)a7;
- (id)_getLocationsOfInterestVisitedBeforeDate:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5;
- (id)_getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 fromLocationsOfInterest:(id)a5 error:(id *)a6;
- (id)_getMatchingLocationsOfIntrestWithLocation:(id)a3 locationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5;
- (id)_latitudeLongitudeToGeohashHelperForLatitude:(double)a3 longitude:(double)a4 hashLength:(unint64_t)a5;
- (id)_selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:(id)a3 dwellTimePercentageThreshold:(double)a4;
- (id)_updateContactsWithLearnedPlace:(id)a3 originalLearnedPlace:(id)a4 error:(id *)a5;
- (id)createAndStoreNewPlaceWithMapItem:(id)a3 customLabel:(id)a4 mapItemSource:(unint64_t)a5 outError:(id *)a6;
- (unint64_t)_getGeohashLengthForSpatialGranularity:(unint64_t)a3;
- (unint64_t)_getTotalVisitCountForPreviousDatesFromDictGeohashToDates:(id)a3 referenceDate:(id)a4;
- (unint64_t)_getTotalVisitsCountForLOI:(id)a3 dateInterval:(id)a4 outError:(id *)a5;
- (void)_addLocationOfInterest:(id)a3 handler:(id)a4;
- (void)_addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6;
- (void)_addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5;
- (void)_classifyPlaceTypesWithHandler:(id)a3;
- (void)_computeFamiliarityIndexResultsForLearnedLocationsWithVisits:(id)a3 options:(id)a4 familiarPlaces:(id)a5 error:(id)a6 handler:(id)a7;
- (void)_extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4;
- (void)_fetchAllLocationsOfInterestWithHandler:(id)a3;
- (void)_fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6;
- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4;
- (void)_fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4;
- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4;
- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4;
- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5;
- (void)_fetchModeAtLocation:(id)a3 handler:(id)a4;
- (void)_fetchRecentLocationsOfInterestWithHandler:(id)a3;
- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4;
- (void)_forceRelabeling:(id)a3;
- (void)_logLearnedState;
- (void)_migrateLegacyMapItems:(id)a3;
- (void)_migrateStateModelLegacy:(id)a3;
- (void)_onLearnedLocationStoreNotification:(id)a3;
- (void)_performLegacyMigrations:(id)a3;
- (void)_queryProvider:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_reconcileLearnedLocationsWithHandler:(id)a3;
- (void)_reconstructTransitionsWithHandler:(id)a3;
- (void)_removeAllLocationsOfInterestWithHandler:(id)a3;
- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5;
- (void)_trainLocationsOfInterestModelWithHandler:(id)a3;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8;
- (void)_visitFromLearnedVisit:(id)a3 learnedLOI:(id)a4 handler:(id)a5;
- (void)addLocationOfInterest:(id)a3 handler:(id)a4;
- (void)addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6;
- (void)addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5;
- (void)classifyPlaceTypesWithHandler:(id)a3;
- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4;
- (void)fetchAllLocationsOfInterestWithHandler:(id)a3;
- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4;
- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6;
- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5;
- (void)fetchModeAtLocation:(id)a3 handler:(id)a4;
- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3;
- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchVisitIdentifiersIn:(id)a3 handler:(id)a4;
- (void)flushToCacheWithOptions:(id)a3 handler:(id)a4;
- (void)forceRelabeling:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)learnedLocationEngineDidClear:(id)a3;
- (void)learnedLocationEngineDidFinishTraining:(id)a3;
- (void)learnedLocationEngineDidUpdate:(id)a3 intervalSinceLastUpdate:(double)a4;
- (void)learnedLocationEngineWillBeginTraining:(id)a3;
- (void)logDatabasesWithHandler:(id)a3;
- (void)onLearnedLocationStoreNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)queryProvider:(id)a3 options:(id)a4 handler:(id)a5;
- (void)reconcileLearnedLocationsWithHandler:(id)a3;
- (void)reconstructTransitionsWithHandler:(id)a3;
- (void)removeAllLocationsOfInterestWithHandler:(id)a3;
- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)setAvailable:(BOOL)a3;
- (void)setLearnedLocationEngine:(id)a3;
- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5;
- (void)trainLocationsOfInterestModelWithHandler:(id)a3;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8;
- (void)updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5;
@end

@implementation RTLearnedLocationManager

uint64_t __74__RTLearnedLocationManager_fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestWithPlaceType:*(void *)(a1 + 48) handler:*(void *)(a1 + 40)];
}

uint64_t __70__RTLearnedLocationManager_fetchLocationOfInterestAtLocation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestAtLocation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)vendedClasses
{
  v2 = (void *)vendedClasses_vendedClasses;
  if (!vendedClasses_vendedClasses)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [v3 initWithObjects:v4, objc_opt_class(), 0];
    v6 = (void *)vendedClasses_vendedClasses;
    vendedClasses_vendedClasses = v5;

    v2 = (void *)vendedClasses_vendedClasses;
  }

  return v2;
}

uint64_t __70__RTLearnedLocationManager_fetchRecentLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRecentLocationsOfInterestWithHandler:*(void *)(a1 + 40)];
}

uint64_t __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __92__RTLearnedLocationManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestVisitedBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

void __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke_2;
  v13[3] = &unk_1E6B92140;
  id v14 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v18 = v8;
  uint64_t v15 = v9;
  uint64_t v19 = *(void *)(a1 + 56);
  id v16 = v10;
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, v13);
}

void __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 visits];
  uint64_t v4 = [v3 lastObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v7);
}

void __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 visits];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v7);
}

uint64_t __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __56__RTLearnedLocationManager_fetchModeAtLocation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchModeAtLocation:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTLearnedLocationManager_fetchLocationOfInterestAtLocation_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (id)modeToString:(int64_t)a3
{
  id v3 = @"unknown";
  if (a3 == 1) {
    id v3 = @"local";
  }
  if (a3 == 2) {
    return @"tourist";
  }
  else {
    return v3;
  }
}

void __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke_2(double *a1)
{
  if (*((void *)a1 + 4))
  {
    v2 = *(void (**)(void))(*((void *)a1 + 8) + 16);
    v2();
  }
  else
  {
    double v3 = a1[9];
    uint64_t v4 = (void *)*((void *)a1 + 5);
    uint64_t v5 = *((void *)a1 + 6);
    uint64_t v6 = *((void *)a1 + 7);
    id v9 = 0;
    id v7 = [v4 _getLocationsOfInterestWithinDistance:v5 ofLocation:v6 fromLocationsOfInterest:&v9 error:v3];
    id v8 = v9;
    (*(void (**)(void))(*((void *)a1 + 8) + 16))();
  }
}

void __71__RTLearnedLocationManager__fetchLocationOfInterestAtLocation_handler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 16);
    v4();
  }
  else
  {
    uint64_t v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    id v9 = 0;
    id v7 = [v5 _getLocationOfInterestAtLocation:v6 fromLocationsOfInterest:a2 error:&v9];
    id v8 = v9;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)_getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 fromLocationsOfInterest:(id)a5 error:(id *)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v28 = a6;
    v30 = [MEMORY[0x1E4F1CA48] array];
    id v12 = [(RTLearnedLocationManager *)self distanceCalculator];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v19 = [v18 location];
          v20 = [v19 location];
          id v31 = 0;
          [v12 distanceFromLocation:v10 toLocation:v20 error:&v31];
          double v22 = v21;
          id v23 = v31;

          if (v23)
          {
            if (v28) {
              id *v28 = v23;
            }

            id v24 = 0;
            goto LABEL_16;
          }
          if (v22 <= a3) {
            [v30 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v24 = v30;
LABEL_16:
    id v11 = v29;

    goto LABEL_19;
  }
  if (a6)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"requires a valid location.";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v25 errorWithDomain:v26 code:0 userInfo:nil];
    id v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  id v24 = 0;
LABEL_20:

  return v24;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5
{
  v43 = self;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    if (a5)
    {
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F5CFE8];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52[0] = @"requires a valid location.";
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      *a5 = [v39 errorWithDomain:v40 code:0 userInfo:v41];
    }
    goto LABEL_20;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v10)
  {
LABEL_20:
    v44 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  v44 = 0;
  uint64_t v12 = *(void *)v47;
  double v13 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v47 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      [v7 longitude:v43];
      double v17 = v16;
      id v18 = [v15 location];
      uint64_t v19 = [v18 location];
      [v19 longitude];
      double v21 = vabdd_f64(v17, v20);

      if (v21 >= 180.0)
      {
        v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEBUG, "Cluster aggregation falls into DateLine ", buf, 2u);
        }
        goto LABEL_13;
      }
      double v22 = v9;
      id v23 = objc_opt_class();
      [v7 horizontalUncertainty];
      double v25 = v24;
      uint64_t v26 = [v15 location];
      v27 = [v26 location];
      [v27 horizontalUncertainty];
      [v23 distanceThresholdFromUncertainty:v25 otherUncertainty:v28];
      double v30 = v29;

      [v7 latitude];
      [v7 longitude];
      id v31 = [v15 location];
      long long v32 = [v31 location];
      [v32 latitude];
      long long v33 = [v15 location];
      long long v34 = [v33 location];
      [v34 longitude];
      RTCommonCalculateDistanceHighPrecision();
      double v36 = v35;

      if (v36 <= v30 && v36 < v13)
      {
        uint64_t v37 = v15;
        v38 = v44;
        double v13 = v36;
        v44 = v37;
        id v9 = v22;
LABEL_13:

        continue;
      }
      id v9 = v22;
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v11);
LABEL_21:

  return v44;
}

- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        if ([(RTLearnedLocationManager *)self available])
        {
          uint64_t v11 = [(RTLearnedLocationManager *)self learnedLocationStore];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __93__RTLearnedLocationManager__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
          v24[3] = &unk_1E6B914B8;
          v24[4] = self;
          id v25 = v10;
          [v11 fetchLocationsOfInterestVisitedBetweenStartDate:v8 endDate:v9 handler:v24];

          goto LABEL_11;
        }
        double v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F5CFE8];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27 = @"resource temporarily unavailable.";
        double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        id v18 = v21;
        uint64_t v19 = v22;
        uint64_t v20 = 5;
LABEL_10:
        id v23 = [v18 errorWithDomain:v19 code:v20 userInfo:v17];
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);

        goto LABEL_11;
      }
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      double v29 = @"requires a valid endDate.";
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = &v29;
      double v16 = &v28;
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"requires a valid startDate.";
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = (__CFString **)v31;
      double v16 = &v30;
    }
    double v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v18 = v12;
    uint64_t v19 = v13;
    uint64_t v20 = 0;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__RTLearnedLocationManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_fetchModeAtLocation:(id)a3 handler:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if (v6)
    {
      [v6 horizontalUncertainty];
      if (v8 > 250.0)
      {
        id v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = *MEMORY[0x1E4F5CFE8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        uint64_t v11 = NSString;
        [v6 horizontalUncertainty];
        id v13 = [v11 stringWithFormat:@"Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,", v12, 0x406F400000000000];
        double v35 = v13;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        uint64_t v15 = [v9 errorWithDomain:v10 code:7 userInfo:v14];
        v7[2](v7, 0, v15);

LABEL_11:
        goto LABEL_12;
      }
      if ([(RTLearnedLocationManager *)self available])
      {
        [(RTLearnedLocationManager *)self _weeksInLearnedLocationsOfInterestModel];
        if (v21 >= 2.0)
        {
          [(id)objc_opt_class() maxDistanceFromInterval:5400.0 velocity:20.0];
          double v26 = v25;
          v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __57__RTLearnedLocationManager__fetchModeAtLocation_handler___block_invoke;
          v29[3] = &unk_1E6B92320;
          id v30 = v27;
          id v31 = v7;
          v29[4] = self;
          id v28 = v27;
          [(RTLearnedLocationManager *)self _fetchLocationsOfInterestWithinDistance:v6 ofLocation:v29 handler:v26];
        }
        else
        {
          v7[2](v7, 0, 0);
        }
        goto LABEL_12;
      }
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F5CFE8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      long long v33 = @"resource temporarily unavailable.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v18 = v22;
      uint64_t v19 = v23;
      uint64_t v20 = 5;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"requires a valid location.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      id v18 = v16;
      uint64_t v19 = v17;
      uint64_t v20 = 0;
    }
    double v24 = [v18 errorWithDomain:v19 code:v20 userInfo:v13];
    v7[2](v7, 0, v24);

    goto LABEL_11;
  }
LABEL_12:
}

- (double)_weeksInLearnedLocationsOfInterestModel
{
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__17;
  uint64_t v32 = __Block_byref_object_dispose__17;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__17;
  double v26 = __Block_byref_object_dispose__17;
  id v27 = 0;
  double v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v4 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke;
  v19[3] = &unk_1E6B92348;
  double v21 = &v28;
  uint64_t v5 = v3;
  uint64_t v20 = v5;
  [v4 fetchLocationOfInterestVisitedFirstWithHandler:v19];

  dispatch_group_enter(v5);
  id v6 = [(RTLearnedLocationManager *)self learnedLocationStore];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __67__RTLearnedLocationManager__weeksInLearnedLocationsOfInterestModel__block_invoke_2;
  id v16 = &unk_1E6B92348;
  id v18 = &v22;
  id v7 = v5;
  uint64_t v17 = v7;
  [v6 fetchLocationOfInterestVisitedLastWithHandler:&v13];

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  double v8 = [[v23[5] exitDate:v13, v14, v15, v16];
  id v9 = [(id)v29[5] entryDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10 / 604800.0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

- (void)fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      uint64_t v5 = [(RTLearnedLocationManager *)self learnedLocationStore];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__RTLearnedLocationManager__fetchRecentLocationsOfInterestWithHandler___block_invoke;
      v10[3] = &unk_1E6B914B8;
      v10[4] = self;
      id v11 = v4;
      [v5 fetchRecentLocationsOfInterestWithHandler:v10];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F5CFE8];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"resource temporarily unavailable.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v9 = [v6 errorWithDomain:v7 code:5 userInfo:v8];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
}

- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (v8)
    {
      [v8 horizontalUncertainty];
      if (v10 > 250.0)
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F5CFE8];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        uint64_t v13 = NSString;
        [v8 horizontalUncertainty];
        uint64_t v15 = [v13 stringWithFormat:@"Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f,", v14, 0x406F400000000000];
        uint64_t v34 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v17 = [v11 errorWithDomain:v12 code:7 userInfo:v16];
        v9[2](v9, 0, v17);

LABEL_10:
        goto LABEL_11;
      }
      if ([(RTLearnedLocationManager *)self available])
      {
        uint64_t v23 = [(RTLearnedLocationManager *)self learnedLocationStore];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __87__RTLearnedLocationManager__fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke;
        v27[3] = &unk_1E6B92168;
        v27[4] = self;
        double v29 = v9;
        double v30 = a3;
        id v28 = v8;
        [v23 fetchLocationsOfInterestWithinDistance:v28 location:v27 handler:a3];

        goto LABEL_11;
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = @"resource temporarily unavailable.";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v20 = v24;
      uint64_t v21 = v25;
      uint64_t v22 = 5;
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F5CFE8];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v36[0] = @"requires a valid location.";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      uint64_t v20 = v18;
      uint64_t v21 = v19;
      uint64_t v22 = 0;
    }
    double v26 = [v20 errorWithDomain:v21 code:v22 userInfo:v15];
    v9[2](v9, 0, v26);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      uint64_t v7 = [(RTLearnedLocationManager *)self learnedLocationStore];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__RTLearnedLocationManager__fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
      v12[3] = &unk_1E6B914B8;
      v12[4] = self;
      id v13 = v6;
      [v7 fetchLocationsOfInterestWithPlaceType:a3 handler:v12];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F5CFE8];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"resource temporarily unavailable.";
      double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v11 = [v8 errorWithDomain:v9 code:5 userInfo:v10];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
    }
  }
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (BOOL)available
{
  return self->_available;
}

- (void)_fetchLocationOfInterestAtLocation:(id)a3 handler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      [v6 horizontalUncertainty];
      if (v8 <= 250.0)
      {
        [v6 horizontalUncertainty];
        double v20 = v19 + 1000.0;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __71__RTLearnedLocationManager__fetchLocationOfInterestAtLocation_handler___block_invoke;
        v21[3] = &unk_1E6B92320;
        id v23 = v7;
        v21[4] = self;
        id v22 = v6;
        [(RTLearnedLocationManager *)self _fetchLocationsOfInterestWithinDistance:v22 ofLocation:v21 handler:v20];

        id v13 = v23;
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = *MEMORY[0x1E4F5CFE8];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        id v11 = NSString;
        [v6 horizontalUncertainty];
        id v13 = [v11 stringWithFormat:@"Horizontal Uncertainity, %.2f, is greater than the Threshold, %.2f", v12, 0x406F400000000000];
        uint64_t v25 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        uint64_t v15 = [v9 errorWithDomain:v10 code:7 userInfo:v14];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"requires a valid location.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      id v18 = [v16 errorWithDomain:v17 code:0 userInfo:v13];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
    }
  }
}

- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTLearnedLocationManager_fetchRecentLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchModeAtLocation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTLearnedLocationManager_fetchModeAtLocation_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (RTLearnedLocationManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_contactsManager_distanceCalculator_learnedLocationStore_learnedPlaceTypeInferenceStore_mapServiceManager_);
}

- (RTLearnedLocationManager)initWithQueue:(id)a3 contactsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 learnedPlaceTypeInferenceStore:(id)a7 mapServiceManager:(id)a8
{
  id v28 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    id v22 = v18;
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: contactsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v15)
  {
    id v22 = v18;
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v16)
  {
    id v22 = v18;
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v17)
  {
    id v22 = v18;
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
      goto LABEL_17;
    }
LABEL_18:

    uint64_t v21 = 0;
    goto LABEL_19;
  }
  id v27 = v18;
  if (v18)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTLearnedLocationManager;
    double v19 = [(RTNotifier *)&v29 initWithQueue:v28];
    double v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_contactsManager, a4);
      objc_storeStrong((id *)&v20->_distanceCalculator, a5);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a6);
      objc_storeStrong((id *)&v20->_learnedPlaceTypeInferenceStore, a7);
      objc_storeStrong((id *)&v20->_mapServiceManager, a8);
      v20->_available = 0;
      v20->_migrationComplete = 0;
      [(RTService *)v20 setup];
    }
    self = v20;
    uint64_t v21 = self;
  }
  else
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager", buf, 2u);
    }

    uint64_t v21 = 0;
  }
  id v22 = v27;
LABEL_19:

  return v21;
}

- (void)_logLearnedState
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__17;
  v44 = __Block_byref_object_dispose__17;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__17;
  v38 = __Block_byref_object_dispose__17;
  id v39 = 0;
  uint64_t v28 = 0;
  objc_super v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__17;
  uint64_t v32 = __Block_byref_object_dispose__17;
  id v33 = 0;
  double v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__RTLearnedLocationManager__logLearnedState__block_invoke;
  v25[3] = &unk_1E6B90700;
  id v27 = &v40;
  uint64_t v5 = v3;
  uint64_t v26 = v5;
  [v4 fetchPlacesWithHandler:v25];

  dispatch_group_enter(v5);
  id v6 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__RTLearnedLocationManager__logLearnedState__block_invoke_2;
  v22[3] = &unk_1E6B90700;
  uint64_t v24 = &v34;
  id v7 = v5;
  id v23 = v7;
  [v6 fetchVisitsWithHandler:v22];

  dispatch_group_enter(v7);
  id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __44__RTLearnedLocationManager__logLearnedState__block_invoke_3;
  double v19 = &unk_1E6B90700;
  uint64_t v21 = &v28;
  id v9 = v7;
  double v20 = v9;
  [v8 fetchTransitionsWithHandler:&v16];

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v41[5] count:v16 v17 v18 v19];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = v11;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%lu places", buf, 0xCu);
  }

  [(id)v41[5] enumerateObjectsUsingBlock:&__block_literal_global_14];
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(id)v35[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%lu visits", buf, 0xCu);
  }

  [(id)v35[5] enumerateObjectsUsingBlock:&__block_literal_global_81];
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [(id)v29[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = v15;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%lu transitions", buf, 0xCu);
  }

  [(id)v29[5] enumerateObjectsUsingBlock:&__block_literal_global_85];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "place %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

void __44__RTLearnedLocationManager__logLearnedState__block_invoke_82(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "transition %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_performLegacyMigrations:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = (void (**)(void, void))v5;
  if (!self->_migrationComplete)
  {
    uint64_t v7 = NSString;
    v81 = self;
    __int16 v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    id v11 = [v7 stringWithFormat:@"%@-%@", v9, v10];
    [v11 UTF8String];
    v80 = (void *)os_transaction_create();

    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v74 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v74);
      v76 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v75;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v76;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
    }
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x2020000000;
    char v100 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__17;
    v115 = __Block_byref_object_dispose__17;
    id v116 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke;
    v93[3] = &unk_1E6B92050;
    v95 = &v97;
    v96 = buf;
    id v14 = v13;
    v94 = v14;
    [(RTLearnedLocationManager *)v81 _migrateStateModelLegacy:v93];
    uint64_t v15 = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17)) {
      goto LABEL_10;
    }
    id v18 = [MEMORY[0x1E4F1C9C8] now];
    [v18 timeIntervalSinceDate:v16];
    double v20 = v19;
    uint64_t v21 = objc_opt_new();
    id v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v24 = [v23 filteredArrayUsingPredicate:v22];
    uint64_t v25 = [v24 firstObject];

    [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v107 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v107, 2u);
    }

    id v27 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v101 = *MEMORY[0x1E4F28568];
    *(void *)v107 = @"semaphore wait timeout";
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v101 count:1];
    objc_super v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

    if (v29)
    {
      id v30 = v29;

      char v31 = 0;
    }
    else
    {
LABEL_10:
      id v30 = 0;
      char v31 = 1;
    }

    id v32 = v30;
    if ((v31 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), v30);
    }
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    *(void *)v107 = 0;
    v108 = v107;
    uint64_t v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__17;
    v111 = __Block_byref_object_dispose__17;
    id v112 = 0;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_2;
    v85[3] = &unk_1E6B908E0;
    v87 = &v89;
    v88 = v107;
    id v33 = v15;
    v86 = v33;
    [(RTLearnedLocationManager *)v81 _migrateLegacyMapItems:v85];
    uint64_t v34 = v33;
    uint64_t v35 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v36 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v34, v36)) {
      goto LABEL_18;
    }
    uint64_t v37 = [MEMORY[0x1E4F1C9C8] now];
    [v37 timeIntervalSinceDate:v35];
    double v39 = v38;
    uint64_t v40 = objc_opt_new();
    v41 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
    v43 = [v42 filteredArrayUsingPredicate:v41];
    v44 = [v43 firstObject];

    [v40 submitToCoreAnalytics:v44 type:1 duration:v39];
    id v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v101 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v101, 2u);
    }

    long long v46 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v118 = *MEMORY[0x1E4F28568];
    *(void *)v101 = @"semaphore wait timeout";
    uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v118 count:1];
    uint64_t v48 = [v46 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v47];

    if (v48)
    {
      id v49 = v48;

      char v50 = 0;
    }
    else
    {
LABEL_18:
      char v50 = 1;
      id v49 = v32;
    }

    id v51 = v49;
    if ((v50 & 1) == 0) {
      objc_storeStrong((id *)v108 + 5, v49);
    }
    uint64_t v77 = *(void *)(*(void *)&buf[8] + 40);
    v52 = _RTSafeArray();
    v53 = _RTMultiErrorCreate();

    if (v90[3] || (int v54 = *((unsigned __int8 *)v98 + 24), *((unsigned char *)v98 + 24))) {
      int v54 = v53 == 0;
    }
    *(void *)v101 = 0;
    v102 = v101;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__17;
    v105 = __Block_byref_object_dispose__17;
    id v106 = 0;
    if (v54)
    {
      v55 = [(RTLearnedLocationManager *)v81 learnedLocationEngine];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_3;
      v82[3] = &unk_1E6B90728;
      v84 = v101;
      v56 = v34;
      v83 = v56;
      [v55 trainLocationsOfInterestModelWithHandler:v82];

      v57 = v56;
      v79 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v58 = dispatch_time(0, 3600000000000);
      id v59 = v51;
      if (dispatch_semaphore_wait(v57, v58))
      {
        v78 = [MEMORY[0x1E4F1C9C8] now];
        [v78 timeIntervalSinceDate:v79];
        double v61 = v60;
        v62 = objc_opt_new();
        v63 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
        v64 = [MEMORY[0x1E4F29060] callStackSymbols];
        v65 = [v64 filteredArrayUsingPredicate:v63];
        v66 = [v65 firstObject];

        [v62 submitToCoreAnalytics:v66 type:1 duration:v61];
        v67 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v118 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v118, 2u);
        }

        v68 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v117 = *MEMORY[0x1E4F28568];
        *(void *)v118 = @"semaphore wait timeout";
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:&v117 count:1];
        v70 = [v68 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v69];

        id v59 = v51;
        if (v70)
        {
          id v59 = v70;
        }
      }

      id v71 = v59;
      id v51 = v71;
    }
    v72 = _RTSafeArray();
    v73 = _RTMultiErrorCreate();

    if (v73)
    {
      if (!v6) {
        goto LABEL_36;
      }
    }
    else
    {
      v81->_migrationComplete = 1;
      if (!v6)
      {
LABEL_36:

        _Block_object_dispose(v101, 8);
        _Block_object_dispose(v107, 8);

        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v97, 8);
        goto LABEL_37;
      }
    }
    ((void (**)(void, void *))v6)[2](v6, v73);
    goto LABEL_36;
  }
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_37:
}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__RTLearnedLocationManager__performLegacyMigrations___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "trained locationsOfInterest model after migration, error, %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)migrateLegacyMapItemWithGeoMapItem:(id)a3 geoMapItemHandle:(id)a4 source:(unint64_t)a5 mapServiceManager:(id)a6 error:(id *)a7
{
  v71[1] = *MEMORY[0x1E4F143B8];
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a6;
  if (!v12)
  {
    double v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 315;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

    if (v10 | v11)
    {
      if (a7)
      {
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v68 = @"A valid instance of RTMapSericeManager is required.";
        double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v20];
      }
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 316;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItem || geoMapItemHandle (in %s:%d)", buf, 0x12u);
    }

    if (a7)
    {
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v70 = @"requires a valid geoMapItem or geoMapItemHandle.";
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v22];
    }
LABEL_14:
    id v23 = 0;
    goto LABEL_37;
  }
  if (!(v10 | v11)) {
    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v64 = __Block_byref_object_copy__17;
  v65 = __Block_byref_object_dispose__17;
  id v66 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__17;
  v58[4] = __Block_byref_object_dispose__17;
  id v59 = 0;
  if (v10)
  {
    dispatch_semaphore_t v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    id v57 = 0;
    uint64_t v15 = [v12 mapItemWithIdentifier:v13 geoMapItem:v10 source:a5 creationDate:v14 error:&v57];
    id v16 = v57;
    dispatch_time_t v17 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v15;

    uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
  }
  else
  {
    uint64_t v18 = 0;
    id v16 = 0;
  }
  if (v18) {
    BOOL v24 = v16 == 0;
  }
  else {
    BOOL v24 = 0;
  }
  int v25 = !v24;
  if (v11 && v25)
  {
    dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
    id v27 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v28 = (objc_class *)objc_opt_class();
    objc_super v29 = NSStringFromClass(v28);
    char v50 = (void *)[v27 initWithUseBackgroundTraits:1 analyticsIdentifier:v29];

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __111__RTLearnedLocationManager_migrateLegacyMapItemWithGeoMapItem_geoMapItemHandle_source_mapServiceManager_error___block_invoke;
    void v52[3] = &unk_1E6B92078;
    int v54 = buf;
    v55 = v58;
    unint64_t v56 = a5;
    id v30 = v26;
    v53 = v30;
    [v12 fetchMapItemFromHandle:v11 options:v50 handler:v52];
    char v31 = v30;
    id v49 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v32 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v31, v32))
    {
      id v33 = [MEMORY[0x1E4F1C9C8] now];
      [v33 timeIntervalSinceDate:v49];
      double v35 = v34;
      uint64_t v48 = objc_opt_new();
      dispatch_time_t v36 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
      uint64_t v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v38 = [v37 filteredArrayUsingPredicate:v36];
      double v39 = [v38 firstObject];

      [v48 submitToCoreAnalytics:v39 type:1 duration:v35];
      uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v60 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v60, 2u);
      }

      v41 = (void *)MEMORY[0x1E4F28C58];
      v71[0] = *MEMORY[0x1E4F28568];
      *(void *)double v60 = @"semaphore wait timeout";
      uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v71 count:1];
      v43 = [v41 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v42];

      if (v43) {
    }
      }

    uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
  }
  if (!v18)
  {
    v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v60 = 136315394;
      *(void *)&v60[4] = "+[RTLearnedLocationManager migrateLegacyMapItemWithGeoMapItem:geoMapItemHandle:source:mapServ"
                           "iceManager:error:]";
      __int16 v61 = 1024;
      int v62 = 369;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Attempting to migrate a learned place with a nil map item and nil map item handle. (in %s:%d)", v60, 0x12u);
    }
  }
  id v45 = v16;
  if (a7)
  {
    long long v46 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v23 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(buf, 8);
LABEL_37:

  return v23;
}

void __111__RTLearnedLocationManager_migrateLegacyMapItemWithGeoMapItem_geoMapItemHandle_source_mapServiceManager_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 appendSource:*(void *)(a1 + 56)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_migrateLegacyMapItems:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(RTLearnedLocationManager *)self mapServiceManager];
  uint64_t v7 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__RTLearnedLocationManager__migrateLegacyMapItems___block_invoke;
  v14[3] = &unk_1E6B920A0;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v9 = v5;
  id v16 = v9;
  dispatch_time_t v17 = &v18;
  id v10 = (id)[v7 migrateLegacyMapItemsWithEnumerationBlock:v14];

  uint64_t v11 = v19[3];
  id v12 = _RTSafeArray();
  dispatch_semaphore_t v13 = _RTMultiErrorCreate();
  v4[2](v4, v11, v13);

  _Block_object_dispose(&v18, 8);
}

id __51__RTLearnedLocationManager__migrateLegacyMapItems___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = objc_opt_class();
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = 0;
  uint64_t v11 = [v9 migrateLegacyMapItemWithGeoMapItem:v8 geoMapItemHandle:v7 source:a4 mapServiceManager:v10 error:&v14];

  id v12 = v14;
  if (v12) {
    [*(id *)(a1 + 48) addObject:v12];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v11;
}

- (void)_migrateStateModelLegacy:(id)a3
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[RTStateModelLegacyController stateModelLegacyExists];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "stateModel legacy exists, %@", (uint8_t *)&buf, 0xCu);
  }

  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__17;
    v65 = __Block_byref_object_dispose__17;
    id v66 = 0;
    uint64_t v55 = 0;
    unint64_t v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __53__RTLearnedLocationManager__migrateStateModelLegacy___block_invoke;
    v51[3] = &unk_1E6B920C8;
    p_long long buf = &buf;
    int v54 = &v55;
    uint64_t v10 = v8;
    v52 = v10;
    [v9 fetchLastVisitWithHandler:v51];

    uint64_t v11 = v10;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13)) {
      goto LABEL_13;
    }
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    dispatch_time_t v17 = objc_opt_new();
    uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
    uint64_t v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v59 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
    }

    id v23 = (void *)MEMORY[0x1E4F28C58];
    v67[0] = *MEMORY[0x1E4F28568];
    *(void *)id v59 = @"semaphore wait timeout";
    BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v67 count:1];
    int v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

    if (v25)
    {
      id v26 = v25;

      char v27 = 0;
    }
    else
    {
LABEL_13:
      id v26 = 0;
      char v27 = 1;
    }

    id v28 = v26;
    if ((v27 & 1) == 0) {
      objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v26);
    }
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      objc_super v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v59 = 138412290;
        *(void *)&v59[4] = v47;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "failed to determine if locationsOfInterest model exists, %@", v59, 0xCu);
      }

      if (v4) {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
      goto LABEL_48;
    }
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      if (*((unsigned char *)v56 + 24)) {
        char v31 = @"YES";
      }
      else {
        char v31 = @"NO";
      }
      *(_DWORD *)id v59 = 138412290;
      *(void *)&v59[4] = v31;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "learned visit exists, %@", v59, 0xCu);
    }

    dispatch_time_t v32 = [RTStateModelLegacyController alloc];
    id v33 = [(RTLearnedLocationManager *)self learnedLocationStore];
    double v34 = [(RTLearnedLocationManager *)self mapServiceManager];
    double v35 = [(RTStateModelLegacyController *)v32 initWithLearnedLocationStore:v33 mapServiceManager:v34];

    if (*((unsigned char *)v56 + 24))
    {
      if (v4) {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
      id v50 = 0;
      BOOL v36 = [(RTStateModelLegacyController *)v35 removeStateModelLegacyWithError:&v50];
      uint64_t v37 = v50;
      double v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        double v39 = @"NO";
        if (v36) {
          double v39 = @"YES";
        }
        *(_DWORD *)id v59 = 138412546;
        *(void *)&v59[4] = v39;
        __int16 v60 = 2112;
        __int16 v61 = v37;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "removed stateModel legacy, %@, error, %@", v59, 0x16u);
      }
    }
    else
    {
      uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v59 = 0;
        _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "migrating stateModel legacy", v59, 2u);
      }

      id v49 = 0;
      BOOL v41 = [(RTStateModelLegacyController *)v35 migrateStateModelLegacyWithError:&v49];
      uint64_t v37 = v49;
      uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = @"NO";
        if (v41) {
          v43 = @"YES";
        }
        *(_DWORD *)id v59 = 138412546;
        *(void *)&v59[4] = v43;
        __int16 v60 = 2112;
        __int16 v61 = v37;
        _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "migrated stateModel legacy, %@, error, %@", v59, 0x16u);
      }

      [(RTLearnedLocationManager *)self _logLearnedState];
      if (!v41)
      {
        if (v4) {
          (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v37);
        }
        goto LABEL_47;
      }
      id v48 = 0;
      BOOL v44 = [(RTStateModelLegacyController *)v35 removeStateModelLegacyWithError:&v48];
      double v38 = v48;
      id v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        long long v46 = @"NO";
        if (v44) {
          long long v46 = @"YES";
        }
        *(_DWORD *)id v59 = 138412546;
        *(void *)&v59[4] = v46;
        __int16 v60 = 2112;
        __int16 v61 = v38;
        _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "removed stateModel legacy, %@, error, %@", v59, 0x16u);
      }

      if (v4) {
        (*((void (**)(id, uint64_t, NSObject *))v4 + 2))(v4, 1, v38);
      }
    }

LABEL_47:
LABEL_48:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_49;
  }
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
LABEL_49:
}

void __53__RTLearnedLocationManager__migrateStateModelLegacy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setup
{
  id v3 = [(RTLearnedLocationManager *)self learnedLocationEngine];

  if (v3)
  {
    id v4 = [(RTLearnedLocationManager *)self learnedLocationEngine];
    [v4 setDelegate:self];

    id v7 = [(RTLearnedLocationManager *)self learnedLocationStore];
    BOOL v5 = +[RTNotification notificationName];
    [v7 addObserver:self selector:sel_onLearnedLocationStoreNotification_ name:v5];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.learnedLocationEngine", buf, 2u);
    }
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  id v12 = a3;
  contactsManager = self->_contactsManager;
  self->_contactsManager = 0;

  distanceCalculator = self->_distanceCalculator;
  self->_distanceCalculator = 0;

  id v6 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  [v6 shutdown];

  learnedLocationEngine = self->_learnedLocationEngine;
  self->_learnedLocationEngine = 0;

  dispatch_semaphore_t v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
  [v8 removeObserver:self];

  learnedLocationStore = self->_learnedLocationStore;
  self->_learnedLocationStore = 0;

  mapServiceManager = self->_mapServiceManager;
  self->_mapServiceManager = 0;

  uint64_t v11 = v12;
  if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    uint64_t v11 = v12;
  }
}

- (id)createAndStoreNewPlaceWithMapItem:(id)a3 customLabel:(id)a4 mapItemSource:(unint64_t)a5 outError:(id *)a6
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v99 = a4;
  v101 = v9;
  if (v9)
  {
    v65 = self;
    unint64_t v66 = a5;
    char v100 = [MEMORY[0x1E4F1C9C8] date];
    id v67 = objc_alloc(MEMORY[0x1E4F5CD80]);
    v84 = [MEMORY[0x1E4F29128] UUID];
    v95 = [v9 address];
    v83 = [v95 geoAddressData];
    v93 = [v9 address];
    v81 = [v93 subPremises];
    uint64_t v91 = [v9 address];
    v80 = [v91 subThoroughfare];
    v90 = [v9 address];
    v78 = [v90 thoroughfare];
    uint64_t v89 = [v9 address];
    uint64_t v77 = [v89 subLocality];
    v88 = [v9 address];
    v76 = [v88 locality];
    v87 = [v9 address];
    v75 = [v87 subAdministrativeArea];
    v86 = [v9 address];
    v74 = [v86 administrativeArea];
    v85 = [v9 address];
    v73 = [v85 administrativeAreaCode];
    v82 = [v9 address];
    id v71 = [v82 postalCode];
    v79 = [v9 address];
    v64 = [v79 country];
    uint64_t v10 = [v9 address];
    uint64_t v63 = [v10 countryCode];
    uint64_t v11 = [v9 address];
    int v62 = [v11 inlandWater];
    v72 = [v9 address];
    id v12 = [v72 ocean];
    v70 = [v9 address];
    dispatch_time_t v13 = [v70 areasOfInterest];
    id v14 = [v9 address];
    char v15 = [v14 isIsland];
    double v16 = [v100 dateByAddingTimeInterval:4838400.0];
    uint64_t v69 = [v101 address];
    dispatch_time_t v17 = [v69 iso3166CountryCode];
    uint64_t v18 = [v101 address];
    double v19 = [v18 iso3166SubdivisionCode];
    LOBYTE(v61) = v15;
    v68 = objc_msgSend(v67, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v84, v83, v81, v80, v78, v77, v76, v75, v74, v73, v71, v64, v63, v62, v12,
                    v13,
                    v61,
                    v100,
                    v16,
                    v17,
                    v19);

    id v96 = objc_alloc(MEMORY[0x1E4F5CE38]);
    v94 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v92 = [v101 name];
    uint64_t v20 = [v101 category];
    uint64_t v21 = [v101 location];
    uint64_t v22 = [v101 mapItemPlaceType];
    uint64_t v23 = [v101 muid];
    uint64_t v24 = [v101 resultProviderID];
    int v25 = [v101 geoMapItemHandle];
    id v26 = [v100 dateByAddingTimeInterval:4838400.0];
    char v27 = [v101 extendedAttributes];
    id v28 = [v101 displayLanguage];
    LOBYTE(v60) = [v101 disputed];
    uint64_t v97 = (void *)[v96 initWithIdentifier:v94 name:v92 category:v20 address:v68 location:v21 source:v66 mapItemPlaceType:v22 muid:v23 resultProviderID:v24 geoMapItemHandle:v25 creationDate:v100 expirationDate:v26 extendedAttributes:v27 displayLanguage:v28 disputed:v60];

    objc_super v29 = [RTLearnedPlace alloc];
    id v30 = [MEMORY[0x1E4F29128] UUID];
    char v31 = [v100 dateByAddingTimeInterval:4838400.0];
    dispatch_time_t v32 = [(RTLearnedPlace *)v29 initWithIdentifier:v30 type:0 typeSource:0 mapItem:v97 customLabel:v99 creationDate:v100 expirationDate:v31];

    *(void *)v105 = 0;
    id v106 = v105;
    uint64_t v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__17;
    uint64_t v109 = __Block_byref_object_dispose__17;
    id v110 = 0;
    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    double v34 = [(RTLearnedLocationManager *)v65 learnedLocationStore];
    id v116 = v32;
    double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __97__RTLearnedLocationManager_createAndStoreNewPlaceWithMapItem_customLabel_mapItemSource_outError___block_invoke;
    v102[3] = &unk_1E6B90728;
    v104 = v105;
    BOOL v36 = v33;
    uint64_t v103 = v36;
    [v34 storePlaces:v35 handler:v102];

    uint64_t v37 = v36;
    double v38 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v39 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v37, v39)) {
      goto LABEL_7;
    }
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] now];
    [v40 timeIntervalSinceDate:v38];
    double v42 = v41;
    v43 = objc_opt_new();
    BOOL v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    id v45 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v46 = [v45 filteredArrayUsingPredicate:v44];
    uint64_t v47 = [v46 firstObject];

    [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
    id v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v49 = (void *)MEMORY[0x1E4F28C58];
    v117[0] = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    id v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v117 count:1];
    id v51 = [v49 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v50];

    if (v51)
    {
      id v52 = v51;

      char v53 = 0;
    }
    else
    {
LABEL_7:
      id v52 = 0;
      char v53 = 1;
    }

    id v54 = v52;
    if ((v53 & 1) == 0) {
      objc_storeStrong((id *)v106 + 5, v52);
    }
    if (*((void *)v106 + 5))
    {
      uint64_t v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v56 = *((void *)v106 + 5);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v112 = 2112;
        v113 = v101;
        __int16 v114 = 2112;
        uint64_t v115 = v56;
        _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "failed to store place, %@, on current device for mapItem, %@, error, %@.", buf, 0x20u);
      }

      uint64_t v57 = 0;
      if (a6) {
        *a6 = *((id *)v106 + 5);
      }
    }
    else
    {
      uint64_t v57 = v32;
    }

    _Block_object_dispose(v105, 8);
  }
  else
  {
    char v58 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v105 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", v105, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"mapItem");
      uint64_t v57 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v57 = 0;
    }
  }

  return v57;
}

void __97__RTLearnedLocationManager_createAndStoreNewPlaceWithMapItem_customLabel_mapItemSource_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)validateUpdatedMapItem:(id)a3 locationOfInterest:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v55 = a4;
  if (v8)
  {
    char v53 = a5;
    uint64_t v67 = 0;
    v68 = (id *)&v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__17;
    id v71 = __Block_byref_object_dispose__17;
    id v72 = 0;
    uint64_t v61 = 0;
    int v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__17;
    v65 = __Block_byref_object_dispose__17;
    id v66 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v54 = (void *)[v10 initWithUseBackgroundTraits:1 analyticsIdentifier:v12];

    dispatch_time_t v13 = [(RTLearnedLocationManager *)self mapServiceManager];
    id v14 = [v8 geoMapItemHandle];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __76__RTLearnedLocationManager_validateUpdatedMapItem_locationOfInterest_error___block_invoke;
    v57[3] = &unk_1E6B920F0;
    id v59 = &v67;
    uint64_t v60 = &v61;
    char v15 = v9;
    char v58 = v15;
    [v13 fetchMapItemFromHandle:v14 options:v54 handler:v57];

    double v16 = v15;
    dispatch_time_t v17 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v16, v18)) {
      goto LABEL_7;
    }
    double v19 = [MEMORY[0x1E4F1C9C8] now];
    [v19 timeIntervalSinceDate:v17];
    double v21 = v20;
    uint64_t v22 = objc_opt_new();
    uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v25 = [v24 filteredArrayUsingPredicate:v23];
    id v26 = [v25 firstObject];

    [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
    char v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v79 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    objc_super v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v79 count:1];
    id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

    if (v30)
    {
      id v31 = v30;

      char v32 = 0;
    }
    else
    {
LABEL_7:
      id v31 = 0;
      char v32 = 1;
    }

    id v33 = v31;
    if ((v32 & 1) == 0) {
      objc_storeStrong(v68 + 5, v31);
    }
    if (!v68[5] && ([v8 isEqualToMapItem:v62[5]] & 1) != 0)
    {
      double v34 = [(RTLearnedLocationManager *)self distanceCalculator];
      double v35 = [v8 location];
      BOOL v36 = [v55 location];
      uint64_t v37 = [v36 location];
      id v56 = 0;
      [v34 distanceFromLocation:v35 toLocation:v37 error:&v56];
      double v39 = v38;
      id v40 = v56;

      if (v40)
      {
        if (v53)
        {
          id v41 = v40;
          id v40 = v41;
LABEL_17:
          BOOL v43 = 0;
          id *v53 = v41;
LABEL_18:

LABEL_23:
          _Block_object_dispose(&v61, 8);

          _Block_object_dispose(&v67, 8);
          goto LABEL_24;
        }
      }
      else
      {
        if (v39 <= 10000.0)
        {
          id v40 = 0;
          BOOL v43 = 1;
          goto LABEL_18;
        }
        if (v53)
        {
          uint64_t v47 = NSString;
          id v48 = [v55 place];
          id v49 = [v48 identifier];
          id v50 = [v47 stringWithFormat:@"The existing location of interest with identifier %@ is too far from the updated mapItem.", v49];

          id v51 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          v74 = v50;
          id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          id *v53 = [v51 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v52];
        }
        id v40 = 0;
      }
      BOOL v43 = 0;
      goto LABEL_18;
    }
    if (!v53)
    {
      BOOL v43 = 0;
      goto LABEL_23;
    }
    [NSString stringWithFormat:@"requires a valid geoMapItemHandle; mapItem, %@, fetched mapItem from geoMapItemHandle, %@, error, %@",
      v8,
      v62[5],
    double v34 = v68[5]);
    double v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v75 = *MEMORY[0x1E4F28568];
    v76 = v34;
    id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v41 = [v42 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v40];
    goto LABEL_17;
  }
  if (a5)
  {
    BOOL v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78 = @"requires a valid mapItem.";
    id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    *a5 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v45];
  }
  BOOL v43 = 0;
LABEL_24:

  return v43;
}

void __76__RTLearnedLocationManager_validateUpdatedMapItem_locationOfInterest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLocationsOfInterestVisitedBeforeDate:(id)a3 fromLocationsOfInterest:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K <= %@", @"visits", @"entryDate", v7];
    a5 = [v8 filteredArrayUsingPredicate:v9];
  }
  else if (a5)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"requires a date date.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a5 = [v10 errorWithDomain:v11 code:0 userInfo:v12];

    a5 = 0;
  }

  return a5;
}

- (id)_getLearnedVisits:(id)a3 dateInterval:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 startDate];
  id v10 = [v6 predicateWithFormat:@"%K >= %@", @"entryDate", v9];
  v18[0] = v10;
  uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [v7 endDate];

  dispatch_time_t v13 = [v11 predicateWithFormat:@"%K <= %@", @"entryDate", v12];
  v18[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  char v15 = [v5 andPredicateWithSubpredicates:v14];

  double v16 = [v8 filteredArrayUsingPredicate:v15];

  return v16;
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __86__RTLearnedLocationManager_fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  double v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __86__RTLearnedLocationManager_fetchLocationsOfInterestWithinDistance_ofLocation_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestWithinDistance:*(void *)(a1 + 40) ofLocation:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__RTLearnedLocationManager_fetchFusionCandidatesForVisitIdentifier_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __76__RTLearnedLocationManager_fetchFusionCandidatesForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFusionCandidatesForVisitIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchFusionCandidatesForVisitIdentifier:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      if (v6)
      {
        id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke;
        v16[3] = &unk_1E6B92190;
        v16[4] = self;
        dispatch_time_t v17 = v7;
        [v8 fetchVisitWithIdentifier:v6 handler:v16];

        id v9 = v17;
        goto LABEL_10;
      }
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      double v20 = @"requires a non-nil identifier.";
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      dispatch_time_t v13 = &v20;
      id v14 = &v19;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"resource temporarily unavailable.";
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      dispatch_time_t v13 = (__CFString **)v22;
      id v14 = &v21;
    }
    id v9 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    id v15 = [v10 errorWithDomain:v11 code:5 userInfo:v9];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);

    goto LABEL_10;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:
}

void __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke_2;
    block[3] = &unk_1E6B90660;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

void __77__RTLearnedLocationManager__fetchFusionCandidatesForVisitIdentifier_handler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) learnedLocationEngine];
  [v2 fetchFusionCandidatesForVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager_fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__RTLearnedLocationManager_fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInferredMapItemForVisitIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      if (v6)
      {
        id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __76__RTLearnedLocationManager__fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
        void v18[3] = &unk_1E6B921B8;
        uint64_t v19 = v7;
        [v8 fetchInferredMapItemForVisitIdentifier:v6 handler:v18];

        id v9 = v19;
        goto LABEL_10;
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v22 = @"requires a non-nil identifier.";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v12 = v15;
      uint64_t v13 = v16;
      uint64_t v14 = 7;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = @"resource temporarily unavailable.";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v12 = v10;
      uint64_t v13 = v11;
      uint64_t v14 = 5;
    }
    dispatch_time_t v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v9];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);

    goto LABEL_10;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:
}

uint64_t __76__RTLearnedLocationManager__fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __58__RTLearnedLocationManager_queryProvider_options_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __58__RTLearnedLocationManager_queryProvider_options_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryProvider:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_queryProvider:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(RTLearnedLocationManager *)self learnedLocationEngine];
    [v11 queryMapItemProvider:v8 options:v9 handler:v10];
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v12, 2u);
    }
  }
}

- (void)_fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if ([(RTLearnedLocationManager *)self available])
      {
        id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
        void v18[3] = &unk_1E6B914B8;
        void v18[4] = self;
        id v19 = v7;
        [v8 fetchLocationsOfInterestVisitedSinceDate:v6 handler:v18];

        goto LABEL_8;
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      uint64_t v21 = @"resource temporarily unavailable.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v12 = v15;
      uint64_t v13 = v16;
      uint64_t v14 = 5;
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F5CFE8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"requires a valid sinceDate.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v12 = v9;
      uint64_t v13 = v10;
      uint64_t v14 = 7;
    }
    id v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
  }
LABEL_8:
}

void __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __78__RTLearnedLocationManager__fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTLearnedLocationManager_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __77__RTLearnedLocationManager_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestVisitedSinceDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_visitFromLearnedVisit:(id)a3 learnedLOI:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  id v12 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke;
  v16[3] = &unk_1E6B92230;
  objc_copyWeak(v20, &location);
  id v13 = v11;
  id v19 = v13;
  id v14 = v9;
  id v17 = v14;
  id v15 = v10;
  id v18 = v15;
  v20[1] = (id)a2;
  [v12 fetchFinerGranularityInferredMapItemForVisit:v14 handler:v16];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke_2;
    v17[3] = &unk_1E6B92208;
    objc_copyWeak(v23, (id *)(a1 + 56));
    id v22 = *(id *)(a1 + 48);
    id v18 = v6;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = *(void **)(a1 + 64);
    id v21 = v10;
    v23[1] = v11;
    dispatch_async(v9, v17);

    objc_destroyWeak(v23);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"swelf is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v16 = [v13 errorWithDomain:v14 code:0 userInfo:v15];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v16);
  }
}

void __70__RTLearnedLocationManager__visitFromLearnedVisit_learnedLOI_handler___block_invoke_2(uint64_t a1)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        BOOL v43 = *(void **)(a1 + 32);
        BOOL v44 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        id v50 = v43;
        __int16 v51 = 2112;
        id v52 = v44;
        _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "An error, %@, has occurred when fetching the fetchFinerGranularityInferredMapItem for visit, %@", buf, 0x16u);
      }
    }
    id v4 = [*(id *)(a1 + 48) place];
    unint64_t v5 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", [v4 type]);

    id v6 = (void *)MEMORY[0x1E4F5CE70];
    id v7 = [*(id *)(a1 + 48) place];
    id v8 = [v7 mapItem];
    uint64_t v46 = [v6 placeInferencePlaceTypeFromMapItem:v8 userType:v5 source:[*(id *)(a1 + 40) placeSource]];

    id v9 = [*(id *)(a1 + 48) place];
    id v10 = [v9 mapItem];
    id v11 = (void *)[v10 copy];

    if (v11) {
      [v11 setSource:[*(id *)(a1 + 40) placeSource]];
    }
    id v48 = WeakRetained;
    uint64_t v12 = [*(id *)(a1 + 56) mapItem];
    id v13 = (void *)[v12 copy];

    if (v13) {
      [v13 setSource:[*(id *)(a1 + 56) source]];
    }
    id v14 = objc_alloc(MEMORY[0x1E4F5CE70]);
    id v15 = [*(id *)(a1 + 48) place];
    unint64_t v16 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", [v15 typeSource]);
    id v17 = [*(id *)(a1 + 40) location];
    id v18 = [v17 location];
    [*(id *)(a1 + 40) placeConfidence];
    double v20 = v19;
    [*(id *)(a1 + 56) confidence];
    double v22 = v21;
    uint64_t v23 = [*(id *)(a1 + 48) identifier];
    uint64_t v47 = v11;
    id v45 = v13;
    uint64_t v24 = (void *)[v14 initWithMapItem:v11 finerGranularityMapItem:v13 userType:v5 userTypeSource:v16 placeType:v46 referenceLocation:v18 confidence:v20 finerGranularityMapItemConfidence:v22 loiIdentifier:v23];

    id v25 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    id v26 = [*(id *)(a1 + 40) creationDate];
    char v27 = [*(id *)(a1 + 40) location];
    id v28 = [v27 location];
    objc_super v29 = [*(id *)(a1 + 40) entryDate];
    id v30 = [*(id *)(a1 + 40) exitDate];
    id v31 = [*(id *)(a1 + 40) location];
    uint64_t v32 = [v31 dataPointCount];
    [*(id *)(a1 + 40) placeConfidence];
    id v33 = [v25 initWithDate:v26 type:3 location:v28 exit:v29 dataPointCount:v32 confidence:v24 source:3];

    double v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    id WeakRetained = v48;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      id v40 = (objc_class *)objc_opt_class();
      id v41 = NSStringFromClass(v40);
      double v42 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)long long buf = 138412802;
      id v50 = v41;
      __int16 v51 = 2112;
      id v52 = v42;
      __int16 v53 = 2112;
      id v54 = v33;
      _os_log_debug_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_DEBUG, "%@, %@, fetched hindsight visit, %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    double v35 = v47;
    BOOL v36 = v45;
  }
  else
  {
    uint64_t v37 = *(void *)(a1 + 64);
    double v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F5CFE8];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = @"anotherSwelf is nil";
    double v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    BOOL v36 = [v38 errorWithDomain:v39 code:0 userInfo:v35];
    (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v36);
  }
}

- (void)_fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if (v11)
    {
      if (v12)
      {
        if ([(RTLearnedLocationManager *)self available])
        {
          objc_initWeak(&location, self);
          id v14 = [(RTLearnedLocationManager *)self learnedLocationStore];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          void v25[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke;
          v25[3] = &unk_1E6B922D0;
          objc_copyWeak(v29, &location);
          id v28 = v13;
          id v26 = v11;
          id v15 = v12;
          BOOL v30 = a5;
          id v27 = v15;
          v29[1] = (id)a2;
          [v14 fetchLocationsOfInterestVisitedBetweenStartDate:v26 endDate:v15 handler:v25];

          objc_destroyWeak(v29);
          objc_destroyWeak(&location);
        }
        else
        {
          double v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          id v33 = @"resource temporarily unavailable.";
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v23];
          (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
        }
      }
      else
      {
        double v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        double v35 = @"requires a valid endDate.";
        double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        double v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v20];
        (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v21);
      }
    }
    else
    {
      unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"requires a valid startDate.";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      id v18 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v17];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v18);
    }
  }
}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained queue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2;
    v17[3] = &unk_1E6B922A8;
    objc_copyWeak(v23, (id *)(a1 + 56));
    void v17[4] = v8;
    id v22 = *(id *)(a1 + 48);
    id v18 = v5;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    id v10 = v6;
    char v24 = *(unsigned char *)(a1 + 72);
    id v11 = *(void **)(a1 + 64);
    id v21 = v10;
    v23[1] = v11;
    dispatch_async(v9, v17);

    objc_destroyWeak(v23);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"swelf is nil";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    unint64_t v16 = [v13 errorWithDomain:v14 code:0 userInfo:v15];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v16);
  }
}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2(uint64_t a1)
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    from = v2;
    BOOL v43 = WeakRetained;
    double v42 = objc_opt_new();
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [*(id *)(a1 + 40) count];
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 134218754;
      uint64_t v66 = v6;
      __int16 v67 = 2112;
      uint64_t v68 = v7;
      __int16 v69 = 2112;
      uint64_t v70 = v8;
      __int16 v71 = 2112;
      uint64_t v72 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "fetched %lu LOIs for visits between start date, %@, end date, %@, error, %@", buf, 0x2Au);
    }

    id v10 = (void *)MEMORY[0x1E4F28BA0];
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"entryDate", *(void *)(a1 + 48)];
    v64[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"entryDate", *(void *)(a1 + 56)];
    v64[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    uint64_t v14 = [v10 andPredicateWithSubpredicates:v13];

    id v15 = dispatch_group_create();
    id v41 = [MEMORY[0x1E4F1CA48] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v16 = a1;
    id obj = *(id *)(a1 + 40);
    uint64_t v38 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v59;
      uint64_t v37 = v14;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v59 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v17;
          id v18 = *(void **)(*((void *)&v58 + 1) + 8 * v17);
          context = (void *)MEMORY[0x1E016D870]();
          id v19 = [v18 visits];
          id v20 = [v19 filteredArrayUsingPredicate:v14];

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v55;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v55 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * v25);
                id v27 = (void *)MEMORY[0x1E016D870]();
                dispatch_group_enter(v15);
                v49[0] = MEMORY[0x1E4F143A8];
                v49[1] = 3221225472;
                v49[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_179;
                v49[3] = &unk_1E6B92258;
                id v50 = *(id *)(v16 + 64);
                id v51 = v41;
                id v52 = v42;
                __int16 v53 = v15;
                [v43 _visitFromLearnedVisit:v26 learnedLOI:v18 handler:v49];

                ++v25;
              }
              while (v23 != v25);
              uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v62 count:16];
            }
            while (v23);
          }

          uint64_t v17 = v40 + 1;
          uint64_t v14 = v37;
        }
        while (v40 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v38);
    }

    id v4 = v43;
    id v28 = [v43 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2_181;
    block[3] = &unk_1E6B92280;
    objc_copyWeak(v47, from);
    id v29 = *(id *)(v16 + 72);
    char v48 = *(unsigned char *)(v16 + 96);
    id v45 = v42;
    id v46 = v29;
    v47[1] = *(id *)(v16 + 88);
    id v30 = v42;
    dispatch_group_notify(v15, v28, block);

    objc_destroyWeak(v47);
  }
  else
  {
    uint64_t v31 = *(void *)(a1 + 72);
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v74[0] = @"swelf is nil";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
    id v15 = [v32 errorWithDomain:v33 code:0 userInfo:v14];
    (*(void (**)(uint64_t, void, NSObject *))(v31 + 16))(v31, 0, v15);
  }
}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_179(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addObject:a3];
  }
  [*(id *)(a1 + 48) addObject:v5];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __92__RTLearnedLocationManager__fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke_2_181(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entry" ascending:*(unsigned __int8 *)(a1 + 64)];
    id v4 = *(void **)(a1 + 32);
    id v21 = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v6 = [v4 sortedArrayUsingDescriptors:v5];

    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v15 = 138412802;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = [v6 count];
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, fetched hindsight visits count, %lu", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"yetAnotherSwelf is nil";
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v6 = [v10 errorWithDomain:v11 code:0 userInfo:v3];
    uint64_t v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
}

- (void)fetchHindsightVisitsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__RTLearnedLocationManager_fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke;
  block[3] = &unk_1E6B922F8;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __91__RTLearnedLocationManager_fetchHindsightVisitsBetweenStartDate_endDate_ascending_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchHindsightVisitsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) ascending:*(unsigned __int8 *)(a1 + 64) handler:*(void *)(a1 + 56)];
}

- (void)_fetchAllLocationsOfInterestWithHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      id v5 = [(RTLearnedLocationManager *)self learnedLocationStore];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke;
      v10[3] = &unk_1E6B914B8;
      v10[4] = self;
      id v11 = v4;
      [v5 fetchAllLocationsOfInterestWithHandler:v10];
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F5CFE8];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"resource temporarily unavailable.";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v9 = [v6 errorWithDomain:v7 code:5 userInfo:v8];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
}

void __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__RTLearnedLocationManager__fetchAllLocationsOfInterestWithHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAllLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__RTLearnedLocationManager_fetchAllLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__RTLearnedLocationManager_fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllLocationsOfInterestWithHandler:*(void *)(a1 + 40)];
}

+ (double)distanceThresholdFromUncertainty:(double)a3 otherUncertainty:(double)a4
{
  double v4 = a3 + a4;
  double v5 = 250.0;
  if (v4 <= 250.0) {
    double v5 = v4;
  }
  if (v4 >= 200.0) {
    return v5;
  }
  else {
    return 200.0;
  }
}

- (BOOL)_matchLocation:(id)a3 locationOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a3;
  id v11 = a4;
  distanceCalculator = self->_distanceCalculator;
  id v13 = [v11 location];
  id v14 = [v13 location];
  id v33 = 0;
  [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v10 toLocation:v14 error:&v33];
  double v16 = v15;
  id v17 = v33;

  if (v17)
  {
    if (a6) {
      *a6 = v17;
    }
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 138412546;
    id v35 = v11;
    __int16 v36 = 2112;
    double v37 = *(double *)&v17;
    id v19 = "Matching candidate, %@, rejected because of a distance computation error, %@";
    id v20 = v18;
    uint32_t v21 = 22;
    goto LABEL_9;
  }
  [(__CFString *)v10 horizontalUncertainty];
  if (v16 > v22)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:
      LOBYTE(v27) = 0;
      goto LABEL_14;
    }
    [(__CFString *)v10 horizontalUncertainty];
    *(_DWORD *)long long buf = 138413058;
    id v35 = v11;
    __int16 v36 = 2048;
    double v37 = v16;
    __int16 v38 = 2112;
    uint64_t v39 = v10;
    __int16 v40 = 2048;
    double v41 = v23;
    id v19 = "Matching candidate, %@, rejected because of the distance %.2f to region, %@, greater than region radius, %.2f";
    id v20 = v18;
    uint32_t v21 = 42;
LABEL_9:
    _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_13;
  }
  uint64_t v24 = self->_distanceCalculator;
  uint64_t v25 = [v11 location];
  uint64_t v26 = [v25 location];
  id v32 = 0;
  BOOL v27 = [(RTDistanceCalculator *)v24 checkFractionAreaOverlapBetweenLocation:v10 otherLocation:v26 largerThanThreshold:&v32 error:a5];
  id v18 = v32;

  if (v18)
  {
    if (!a6) {
      goto LABEL_13;
    }
    id v18 = v18;
    LOBYTE(v27) = 0;
    *a6 = v18;
  }
  else
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      id v30 = @"NO";
      if (v27) {
        id v30 = @"YES";
      }
      *(_DWORD *)long long buf = 138413058;
      id v35 = v11;
      __int16 v36 = 2112;
      double v37 = *(double *)&v30;
      uint64_t v31 = @"larger";
      if (!v27) {
        uint64_t v31 = @"less";
      }
      __int16 v38 = 2112;
      uint64_t v39 = v31;
      __int16 v40 = 2048;
      double v41 = a5;
      _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "Matching candidate, %@, selected?, %@, because of the overlap percentage is %@ than threshold, %.2f", buf, 0x2Au);
    }

    id v18 = 0;
  }
LABEL_14:

  return v27;
}

- (id)_getMatchingLocationsOfIntrestWithLocation:(id)a3 locationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v25;
    *(void *)&long long v13 = 138412802;
    long long v22 = v13;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
        id v23 = 0;
        BOOL v18 = -[RTLearnedLocationManager _matchLocation:locationOfInterest:minCircleOverlapThreshold:error:](self, "_matchLocation:locationOfInterest:minCircleOverlapThreshold:error:", v8, v17, &v23, a5, v22);
        id v19 = v23;
        if (v18) {
          [v10 addObject:v17];
        }
        if (v19)
        {
          id v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v22;
            id v29 = v19;
            __int16 v30 = 2112;
            id v31 = v8;
            __int16 v32 = 2112;
            uint64_t v33 = v17;
            _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "an error, %@, has occurred matching location, %@, with location of interest, %@", buf, 0x20u);
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v14);
  }

  return v10;
}

- (id)_selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:(id)a3 dwellTimePercentageThreshold:(double)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) dwellTime];
          double v10 = v10 + v12;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      long long v13 = 0;
      uint64_t v17 = *(void *)v31;
      double v18 = -1.0;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          [v20 dwellTime];
          double v22 = v21;
          double v23 = v21 / v10;
          if (v21 / v10 > a4 && v21 > v18)
          {
            id v25 = v20;

            long long v13 = v25;
            double v18 = v22;
          }
          long long v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412802;
            uint64_t v39 = v20;
            __int16 v40 = 2048;
            double v41 = v22;
            __int16 v42 = 2048;
            double v43 = v23;
            _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "Selection candidate, %@, dwell time, %.2f, percentage dwell time, %.2f", buf, 0x20u);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v16);
    }
    else
    {
      long long v13 = 0;
      double v18 = -1.0;
    }

    long long v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      uint64_t v39 = v13;
      __int16 v40 = 2048;
      double v41 = v18;
      __int16 v42 = 2048;
      double v43 = v18 / v10;
      _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "Selection, %@, max dwell time, %.2f, percentage dwell time, %.2f", buf, 0x20u);
    }

    id v5 = v29;
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)_getLocationOfInterestAtLocation:(id)a3 fromLocationsOfInterest:(id)a4 minCircleOverlapThreshold:(double)a5 dwellTimePercentageThreshold:(double)a6 error:(id *)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (v12)
  {
    id v14 = [(RTLearnedLocationManager *)self _getMatchingLocationsOfIntrestWithLocation:v12 locationsOfInterest:v13 minCircleOverlapThreshold:a5];
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134218242;
      uint64_t v21 = [v13 count];
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "Matched, %lu, locations of interest in region, %@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v16 = [(RTLearnedLocationManager *)self _selectLocationOfInterestWithLargestDwellTimeFromLocationsOfInterest:v14 dwellTimePercentageThreshold:a6];
    goto LABEL_7;
  }
  if (a7)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"requires a valid location.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v17 errorWithDomain:v18 code:0 userInfo:v14];
    uint64_t v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v16 = 0;
LABEL_8:

  return v16;
}

- (void)_fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v6;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Fetching location of interest for region, %@", buf, 0xCu);
      }

      [v6 horizontalUncertainty];
      if (v9 <= 400.0)
      {
        [v6 horizontalUncertainty];
        double v21 = v20;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __70__RTLearnedLocationManager__fetchLocationOfInterestForRegion_handler___block_invoke;
        v22[3] = &unk_1E6B92320;
        id v24 = v7;
        void v22[4] = self;
        id v23 = v6;
        [(RTLearnedLocationManager *)self _fetchLocationsOfInterestWithinDistance:v23 ofLocation:v22 handler:v21];

        id v14 = v24;
      }
      else
      {
        double v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v11 = *MEMORY[0x1E4F5CFE8];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        id v12 = NSString;
        [v6 horizontalUncertainty];
        id v14 = [v12 stringWithFormat:@"Region radius, %.2f, is greater than the threshold, %.2f", v13, 0x4079000000000000];
        long long v26 = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        uint64_t v16 = [v10 errorWithDomain:v11 code:7 userInfo:v15];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"requires a valid location.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v19 = [v17 errorWithDomain:v18 code:0 userInfo:v14];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v19);
    }
  }
}

void __70__RTLearnedLocationManager__fetchLocationOfInterestForRegion_handler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
    +[RTRegionToLocationOfInterestMatchingMetrics submitMetricsWithDistanceCalculator:*(void *)(a1[4] + 48) region:a1[5] locationOfInterest:0 matchingError:v6 numberOfMatches:0];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v5 count];
      uint64_t v9 = a1[5];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Found, %lu, locations of interest in region, %@", buf, 0x16u);
    }

    double v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v16 = 0;
    id v12 = [v10 _getLocationOfInterestAtLocation:v11 fromLocationsOfInterest:v5 minCircleOverlapThreshold:&v16 dwellTimePercentageThreshold:0.9 error:0.6667];
    id v13 = v16;
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = a1[5];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v18 = (uint64_t)v12;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "Fetched location of interest, %@, for region, %@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
    +[RTRegionToLocationOfInterestMatchingMetrics submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:](RTRegionToLocationOfInterestMatchingMetrics, "submitMetricsWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:", *(void *)(a1[4] + 48), a1[5], v12, v13, [v5 count]);
  }
}

- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTLearnedLocationManager_fetchLocationOfInterestForRegion_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__RTLearnedLocationManager_fetchLocationOfInterestForRegion_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestForRegion:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (double)maxDistanceFromInterval:(double)a3 velocity:(double)a4
{
  BOOL v4 = a4 <= 0.0 || a3 <= 0.0;
  double result = a3 * a4;
  if (v4) {
    return 288000.0;
  }
  return result;
}

void __57__RTLearnedLocationManager__fetchModeAtLocation_handler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    BOOL v4 = *(void (**)(void))(a1[6] + 16);
    v4();
  }
  else
  {
    id v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    id v11 = 0;
    id v7 = [v5 _getLocationsOfInterestVisitedBeforeDate:v6 fromLocationsOfInterest:a2 error:&v11];
    id v8 = v11;
    uint64_t v9 = a1[6];
    if ([v7 count]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v10, v8);
  }
}

- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if ([(RTLearnedLocationManager *)self available])
      {
        id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __75__RTLearnedLocationManager__fetchLocationOfInterestWithIdentifier_handler___block_invoke;
        void v18[3] = &unk_1E6B92370;
        id v19 = v7;
        [v8 fetchLocationOfInterestWithIdentifier:v6 handler:v18];

        uint64_t v9 = v19;
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      uint64_t v21 = @"resource temporarily unavailable.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v12 = v15;
      uint64_t v13 = v16;
      uint64_t v14 = 5;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F5CFE8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"requires a valid identifier.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v12 = v10;
      uint64_t v13 = v11;
      uint64_t v14 = 0;
    }
    uint64_t v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v9];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __75__RTLearnedLocationManager__fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_fetchLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTLearnedLocationManager_fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke;
      v13[3] = &unk_1E6B914B8;
      void v13[4] = self;
      id v14 = v7;
      [v8 fetchVisitIdentifiersIn:v6 handler:v13];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F5CFE8];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16[0] = @"resource temporarily unavailable.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    }
  }
}

void __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__RTLearnedLocationManager__fetchVisitIdentifiersIn_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTLearnedLocationManager_fetchVisitIdentifiersIn_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__RTLearnedLocationManager_fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitIdentifiersIn:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([(RTLearnedLocationManager *)self available])
    {
      uint64_t v11 = [(RTLearnedLocationManager *)self learnedLocationStore];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
      v16[3] = &unk_1E6B914B8;
      void v16[4] = self;
      id v17 = v10;
      [v11 fetchLocationOfInterestTransitionsBetweenStartDate:v8 endDate:v9 handler:v16];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"resource temporarily unavailable.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v15 = [v12 errorWithDomain:v13 code:5 userInfo:v14];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
    }
  }
}

void __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2;
  block[3] = &unk_1E6B92118;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __78__RTLearnedLocationManager__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __77__RTLearnedLocationManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __77__RTLearnedLocationManager_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTransitionsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(void, void, void))v12;
  if (v10)
  {
    id v14 = [(RTLearnedLocationManager *)self learnedLocationStore];
    uint64_t v15 = [v14 predicateForObjectsFromCurrentDevice];

    id v16 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke;
    v20[3] = &unk_1E6B92460;
    v20[4] = self;
    id v23 = v13;
    id v21 = v10;
    id v22 = v11;
    unint64_t v24 = a3;
    [v16 fetchPlaceWithMapItem:v21 predicate:v15 handler:v20];

LABEL_5:
    goto LABEL_6;
  }
  if (v12)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"requires a valid mapItem.";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v19 = [v17 errorWithDomain:v18 code:0 userInfo:v15];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v19);

    goto LABEL_5;
  }
LABEL_6:
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E6B92438;
  id v13 = v6;
  id v18 = *(id *)(a1 + 56);
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_2(uint64_t a1)
{
  v116[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
    return;
  }
  BOOL v4 = *(void **)(a1 + 40);
  if (!v4)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    id v89 = objc_alloc(MEMORY[0x1E4F5CD80]);
    id v106 = [MEMORY[0x1E4F29128] UUID];
    v87 = [*(id *)(a1 + 48) address];
    uint64_t v103 = [v87 geoAddressData];
    v86 = [*(id *)(a1 + 48) address];
    char v100 = [v86 subPremises];
    v85 = [*(id *)(a1 + 48) address];
    v98 = [v85 subThoroughfare];
    v84 = [*(id *)(a1 + 48) address];
    id v96 = [v84 thoroughfare];
    v83 = [*(id *)(a1 + 48) address];
    v95 = [v83 subLocality];
    v82 = [*(id *)(a1 + 48) address];
    v94 = [v82 locality];
    uint64_t v81 = [*(id *)(a1 + 48) address];
    v93 = [v81 subAdministrativeArea];
    v80 = [*(id *)(a1 + 48) address];
    uint64_t v92 = [v80 administrativeArea];
    uint64_t v79 = [*(id *)(a1 + 48) address];
    uint64_t v91 = [v79 administrativeAreaCode];
    v78 = [*(id *)(a1 + 48) address];
    uint64_t v73 = [v78 postalCode];
    uint64_t v77 = [*(id *)(a1 + 48) address];
    __int16 v71 = [v77 country];
    v76 = [*(id *)(a1 + 48) address];
    uint64_t v68 = [v76 countryCode];
    uint64_t v75 = [*(id *)(a1 + 48) address];
    __int16 v69 = [v75 inlandWater];
    v74 = [*(id *)(a1 + 48) address];
    __int16 v67 = [v74 ocean];
    uint64_t v72 = [*(id *)(a1 + 48) address];
    uint64_t v66 = [v72 areasOfInterest];
    uint64_t v70 = [*(id *)(a1 + 48) address];
    char v18 = [v70 isIsland];
    v88 = v17;
    uint64_t v19 = [v17 dateByAddingTimeInterval:4838400.0];
    uint64_t v20 = [*(id *)(a1 + 48) address];
    id v21 = [v20 iso3166CountryCode];
    id v22 = [*(id *)(a1 + 48) address];
    id v23 = [v22 iso3166SubdivisionCode];
    LOBYTE(v65) = v18;
    uint64_t v90 = objc_msgSend(v89, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v106, v103, v100, v98, v96, v95, v94, v93, v92, v91, v73, v71, v68, v69, v67,
            v66,
            v65,
            v17,
            v19,
            v21,
            v23);

    id v107 = objc_alloc(MEMORY[0x1E4F5CE38]);
    v104 = [MEMORY[0x1E4F29128] UUID];
    v101 = [*(id *)(a1 + 48) name];
    id v99 = [*(id *)(a1 + 48) category];
    unint64_t v24 = [*(id *)(a1 + 48) location];
    uint64_t v97 = [*(id *)(a1 + 48) source];
    uint64_t v25 = [*(id *)(a1 + 48) mapItemPlaceType];
    uint64_t v26 = [*(id *)(a1 + 48) muid];
    uint64_t v27 = [*(id *)(a1 + 48) resultProviderID];
    id v28 = [*(id *)(a1 + 48) geoMapItemHandle];
    uint64_t v29 = v17;
    long long v30 = [v17 dateByAddingTimeInterval:4838400.0];
    long long v31 = [*(id *)(a1 + 48) extendedAttributes];
    long long v32 = [*(id *)(a1 + 48) displayLanguage];
    LOBYTE(v64) = [*(id *)(a1 + 48) disputed];
    uint64_t v108 = [v107 initWithIdentifier:v104 name:v101 category:v99 address:v90 location:v24 source:v97 mapItemPlaceType:v25 muid:v26 resultProviderID:v27 geoMapItemHandle:v28 creationDate:v29 expirationDate:v30 extendedAttributes:v31 displayLanguage:v32 disputed:v64];

    long long v33 = v29;
    long long v34 = (void *)v108;

    long long v35 = [RTLearnedPlace alloc];
    long long v36 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v37 = *(void *)(a1 + 56);
    __int16 v38 = [v33 dateByAddingTimeInterval:4838400.0];
    uint64_t v39 = [(RTLearnedPlace *)v35 initWithIdentifier:v36 type:0 typeSource:0 mapItem:v108 customLabel:v37 creationDate:v33 expirationDate:v38];

    __int16 v40 = [(RTLearnedPlace *)v39 mapItem];
    if (v40)
    {
      uint64_t v41 = *(void *)(a1 + 80);
      if ((unint64_t)(v41 - 1) < 2)
      {

        goto LABEL_13;
      }

      if (v41 == 3)
      {
LABEL_13:
        __int16 v42 = v39;
        double v43 = [RTLearnedPlace alloc];
        BOOL v44 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v45 = *(void *)(a1 + 80);
        uint64_t v46 = [(RTLearnedPlace *)v42 mapItem];
        uint64_t v47 = [(RTLearnedPlace *)v42 customLabel];
        char v48 = [(RTLearnedPlace *)v42 creationDate];
        id v49 = [(RTLearnedPlace *)v42 expirationDate];
        id v50 = [(RTLearnedPlace *)v43 initWithIdentifier:v44 type:v45 typeSource:4 mapItem:v46 customLabel:v47 creationDate:v48 expirationDate:v49];

        id v51 = *(void **)(a1 + 64);
        id v113 = 0;
        id v52 = [v51 _updateContactsWithLearnedPlace:v50 originalLearnedPlace:v42 error:&v113];
        id v53 = v113;
        long long v54 = v53;
        uint64_t v39 = v42;
        if (v52)
        {
          uint64_t v39 = v42;
          if (!v53)
          {
            v102 = [RTLearnedPlace alloc];
            v105 = [v52 identifier];
            long long v55 = [v52 mapItem];
            long long v56 = [v52 customLabel];
            long long v57 = [v52 creationDate];
            long long v58 = [v52 expirationDate];
            uint64_t v39 = [(RTLearnedPlace *)v102 initWithIdentifier:v105 type:0 typeSource:0 mapItem:v55 customLabel:v56 creationDate:v57 expirationDate:v58];
          }
        }

        long long v33 = v88;
        long long v59 = (void *)v90;
        long long v34 = (void *)v108;
        goto LABEL_18;
      }
    }
    long long v59 = (void *)v90;
LABEL_18:
    long long v60 = [*(id *)(a1 + 64) learnedLocationStore];
    __int16 v114 = v39;
    long long v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_3;
    v109[3] = &unk_1E6B92410;
    int v62 = *(void **)(a1 + 72);
    v109[4] = *(void *)(a1 + 64);
    id v110 = v39;
    id v111 = v62;
    uint64_t v112 = *(void *)(a1 + 80);
    uint64_t v63 = v39;
    [v60 storePlaces:v61 handler:v109];

    return;
  }
  if (*(void *)(a1 + 72))
  {
    id v5 = NSString;
    id v6 = [v4 identifier];
    id v7 = [v6 UUIDString];
    id v8 = [v5 stringWithFormat:@"locationOfInterest, %@, with this mapItem, %@, already exists,", v7, *(void *)(a1 + 48)];

    uint64_t v9 = *(void *)(a1 + 72);
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v116[0] = v8;
    uint64_t v13 = *MEMORY[0x1E4F5CFD8];
    v115[0] = v12;
    v115[1] = v13;
    id v14 = [*(id *)(a1 + 40) identifier];
    v116[1] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
    id v16 = [v10 errorWithDomain:v11 code:11 userInfo:v15];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v16);
  }
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_4;
  block[3] = &unk_1E6B923E8;
  id v9 = v3;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_4(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    BOOL v4 = [RTLearnedPlace alloc];
    id v5 = [*(id *)(a1 + 40) identifier];
    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = [*(id *)(a1 + 40) mapItem];
    id v8 = [*(id *)(a1 + 40) customLabel];
    id v9 = [*(id *)(a1 + 40) creationDate];
    id v10 = [*(id *)(a1 + 40) expirationDate];
    uint64_t v11 = [(RTLearnedPlace *)v4 initWithIdentifier:v5 type:v6 typeSource:4 mapItem:v7 customLabel:v8 creationDate:v9 expirationDate:v10];

    id v12 = [RTLearnedLocation alloc];
    uint64_t v13 = [*(id *)(a1 + 40) mapItem];
    id v14 = [v13 location];
    id v15 = [(RTLearnedLocation *)v12 initWithLocation:v14 dataPointCount:0 type:2];

    id v16 = [RTLearnedLocationOfInterest alloc];
    uint64_t v17 = [(RTLearnedPlace *)v11 identifier];
    char v18 = [(RTLearnedLocationOfInterest *)v16 initWithIdentifier:v17 location:v15 place:v11 visits:0 transitions:0];

    uint64_t v19 = [*(id *)(a1 + 48) learnedLocationStore];
    v25[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_5;
    v22[3] = &unk_1E6B923C0;
    id v21 = *(void **)(a1 + 56);
    void v22[4] = *(void *)(a1 + 48);
    id v24 = v21;
    id v23 = *(id *)(a1 + 40);
    [v19 storeLocationsOfInterest:v20 handler:v22];
  }
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_6;
  v9[3] = &unk_1E6B92398;
  id v10 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_6(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    BOOL v4 = [*(id *)(a1 + 40) learnedLocationStore];
    id v5 = [*(id *)(a1 + 48) identifier];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_7;
    v6[3] = &unk_1E6B92370;
    id v7 = *(id *)(a1 + 56);
    [v4 fetchLocationOfInterestWithIdentifier:v5 handler:v6];
  }
}

uint64_t __87__RTLearnedLocationManager__addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addLocationOfInterestWithType:(unint64_t)a3 mapItem:(id)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__RTLearnedLocationManager_addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  id v20 = v12;
  unint64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __86__RTLearnedLocationManager_addLocationOfInterestWithType_mapItem_customLabel_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLocationOfInterestWithType:*(void *)(a1 + 64) mapItem:*(void *)(a1 + 40) customLabel:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (id)_updateContactsWithLearnedPlace:(id)a3 originalLearnedPlace:(id)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    id v13 = [NSString stringWithFormat:@"place required"];
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v105 = v13;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v114 = *MEMORY[0x1E4F28568];
      v115[0] = v13;
      id v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = (void **)v115;
      unint64_t v21 = &v114;
LABEL_14:
      id v14 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      [v17 errorWithDomain:v18 code:0 userInfo:v14];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_85;
    }
LABEL_15:
    id v15 = 0;
    goto LABEL_86;
  }
  if (!v9)
  {
    id v13 = [NSString stringWithFormat:@"originalPlace required"];
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v105 = v13;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v112 = *MEMORY[0x1E4F28568];
      id v113 = v13;
      id v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v113;
      unint64_t v21 = &v112;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v11 = [v8 type];
  uint64_t v12 = [v10 type];
  id v13 = [v8 mapItem];
  id v14 = [v10 mapItem];
  if (![v13 isEqual:v14] || v11 != v12)
  {
    contactsManager = self->_contactsManager;
    id v103 = 0;
    v98 = [(RTContactsManager *)contactsManager addressIdentifierOfMeCardWithAddressFromMapItem:v14 error:&v103];
    id v24 = v103;
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      v105 = v98;
      __int16 v106 = 2112;
      id v107 = v24;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "address identifier of meCard with address of mapItem, %@, error, %@", buf, 0x16u);
    }

    if (v24)
    {
      uint64_t v26 = [v24 domain];
      if ([v26 isEqualToString:@"RTContactsManagerErrorDomain"])
      {
        uint64_t v27 = [v24 code];

        if (v27 == 1)
        {
          id v15 = (RTLearnedPlace *)v8;
LABEL_84:

          goto LABEL_85;
        }
      }
      else
      {
      }
      id v15 = 0;
      if (a5) {
        *a5 = v24;
      }
      goto LABEL_84;
    }
    uint64_t v94 = v12;
    if (v11 == 3)
    {
      int v31 = 0;
      int v30 = 1;
      uint64_t v32 = 3;
      uint64_t v28 = 3;
      int v29 = 0;
    }
    else if (v11 == 2)
    {
      int v31 = 0;
      int v30 = 0;
      uint64_t v32 = 2;
      uint64_t v28 = 2;
      int v29 = 1;
    }
    else
    {
      uint64_t v28 = v11;
      if (v11 == 1)
      {
        int v29 = 0;
        int v30 = 0;
        int v31 = 1;
        uint64_t v32 = 1;
      }
      else
      {
        int v31 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v32 = 0;
      }
    }
    if (v98)
    {
      int v91 = v29;
      if (v13 != v14)
      {
        uint64_t v86 = v32;
        uint64_t v88 = v28;
        int v33 = v31;
        int v34 = v30;
        long long v35 = self->_contactsManager;
        id v102 = 0;
        [(RTContactsManager *)v35 updateAddressOfMeCardWithAddressIdentifier:v98 toAddressFromMapItem:v13 error:&v102];
        id v36 = v102;
        uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412802;
          v105 = v98;
          __int16 v106 = 2112;
          id v107 = v13;
          __int16 v108 = 2112;
          id v109 = v36;
          _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "updated address of meCard with address identifier, %@ to address from mapItem, %@, error, %@", buf, 0x20u);
        }

        int v30 = v34;
        int v31 = v33;
        uint64_t v32 = v86;
        uint64_t v28 = v88;
        if (v36)
        {
LABEL_38:
          __int16 v38 = [v36 domain];
          if ([v38 isEqualToString:@"RTContactsManagerErrorDomain"])
          {
            uint64_t v39 = [v36 code];

            id v24 = 0;
            if (v39 == 1)
            {
              id v15 = (RTLearnedPlace *)v8;
LABEL_73:

              goto LABEL_84;
            }
          }
          else
          {

            id v24 = 0;
          }
          id v15 = 0;
          if (a5) {
            *a5 = v36;
          }
          goto LABEL_73;
        }
      }
      if (v28 != v94)
      {
        long long v60 = self->_contactsManager;
        if ((v31 | v91 | v30) != 1)
        {
          uint64_t v67 = v28;
          int v68 = v31;
          int v69 = v30;
          id v100 = 0;
          [(RTContactsManager *)v60 removeAddressOfMeCardWithAddressIdentifier:v98 error:&v100];
          id v36 = v100;
          uint64_t v70 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            v105 = v98;
            __int16 v106 = 2112;
            id v107 = v36;
            _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "removed address of meCard with address identifier, %@, error, %@", buf, 0x16u);
          }

          if (v36) {
            goto LABEL_38;
          }
          int v40 = v91;
          int v30 = v69;
          int v31 = v68;
          uint64_t v28 = v67;
          goto LABEL_43;
        }
        id v101 = 0;
        [(RTContactsManager *)v60 updateAddressLabelTypeOfMeCardWithAddressIdentifier:v98 toAddressLabelType:v32 error:&v101];
        id v55 = v101;
        long long v61 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          +[RTLearnedPlace placeTypeToString:v28];
          uint64_t v90 = v28;
          int v62 = v31;
          v64 = int v63 = v30;
          *(_DWORD *)long long buf = 138412802;
          v105 = v98;
          __int16 v106 = 2112;
          id v107 = v64;
          __int16 v108 = 2112;
          id v109 = v55;
          _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "updated address label type of meCard with address identifier, %@, to, %@, error, %@", buf, 0x20u);

          int v30 = v63;
          int v31 = v62;
          uint64_t v28 = v90;
        }

        if (v55)
        {
LABEL_60:
          uint64_t v65 = [v55 domain];
          if ([v65 isEqualToString:@"RTContactsManagerErrorDomain"])
          {
            uint64_t v66 = [v55 code];

            id v24 = 0;
            if (v66 == 1)
            {
              id v15 = (RTLearnedPlace *)v8;
LABEL_83:

              goto LABEL_84;
            }
          }
          else
          {

            id v24 = 0;
          }
          id v15 = 0;
          if (a5) {
            *a5 = v55;
          }
          goto LABEL_83;
        }
      }
      int v40 = v91;
    }
    else
    {
      if ((v31 | v29 | v30) != 1) {
        goto LABEL_55;
      }
      int v92 = v29;
      long long v54 = self->_contactsManager;
      id v99 = 0;
      uint64_t v87 = v32;
      v98 = [(RTContactsManager *)v54 addAddressToMeCardWithAddressLabelType:v32 addressFromMapItem:v13 error:&v99];
      id v55 = v99;
      long long v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        +[RTContactsManager addressLabelTypeToString:v87];
        uint64_t v89 = v28;
        int v57 = v31;
        v59 = int v58 = v30;
        *(_DWORD *)long long buf = 138413058;
        v105 = v59;
        __int16 v106 = 2112;
        id v107 = v13;
        __int16 v108 = 2112;
        id v109 = v98;
        __int16 v110 = 2112;
        id v111 = v55;
        _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "add address to meCard with address label type, %@, address from mapItem, %@, addressIdentifier, %@, error, %@", buf, 0x2Au);

        int v30 = v58;
        int v31 = v57;
        uint64_t v28 = v89;
      }

      if (v55) {
        goto LABEL_60;
      }
      int v40 = v92;
      if (!v98)
      {
LABEL_55:
        id v15 = (RTLearnedPlace *)v8;
        v98 = 0;
LABEL_82:
        id v24 = 0;
        goto LABEL_84;
      }
    }
LABEL_43:
    uint64_t v41 = v28;
    int v42 = v31;
    int v43 = v30;
    BOOL v44 = [v8 mapItem];
    uint64_t v45 = [v44 source];

    if (v41 != v94)
    {
      if ((v42 | v40 | v43) == 1)
      {
        id v46 = objc_alloc(MEMORY[0x1E4F5CE40]);
        id v96 = [v13 extendedAttributes];
        uint64_t v47 = [v96 identifier];
        char v48 = v47;
        if (!v47)
        {
          char v48 = [MEMORY[0x1E4F29128] UUID];
        }
        id v49 = [v13 extendedAttributes];
        [v49 wifiConfidence];
        double v51 = v50;
        id v52 = [v13 extendedAttributes];
        id v53 = [v46 initWithIdentifier:v48 addressIdentifier:v98 isMe:1 wifiConfidence:[v52 wifiFingerprintLabelType] wifiFingerprintLabelType:v51];
        [v13 setExtendedAttributes:v53];

        if (!v47) {
        v45 |= 4uLL;
        }
      }
      else
      {
        [v13 setExtendedAttributes:0];
        v45 &= ~4uLL;
      }
    }
    if (v13 != v14)
    {
      id v71 = objc_alloc(MEMORY[0x1E4F5CE40]);
      uint64_t v72 = [v13 extendedAttributes];
      uint64_t v73 = [v72 identifier];
      v74 = v73;
      if (!v73)
      {
        v74 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v75 = [v13 extendedAttributes];
      [v75 wifiConfidence];
      double v77 = v76;
      v78 = [v13 extendedAttributes];
      uint64_t v79 = [v71 initWithIdentifier:v74 addressIdentifier:v98 isMe:1 wifiConfidence:[v78 wifiFingerprintLabelType] wifiFingerprintLabelType:v77];
      [v13 setExtendedAttributes:v79];

      if (!v73) {
      uint64_t v45 = 4;
      }
    }
    id v80 = v13;
    [v80 setSource:v45];
    uint64_t v97 = [RTLearnedPlace alloc];
    v95 = [v8 identifier];
    uint64_t v93 = [v8 type];
    uint64_t v81 = [v8 typeSource];
    v82 = [v8 customLabel];
    v83 = [v8 creationDate];
    v84 = [v10 expirationDate];
    id v15 = [(RTLearnedPlace *)v97 initWithIdentifier:v95 type:v93 typeSource:v81 mapItem:v80 customLabel:v82 creationDate:v83 expirationDate:v84];

    goto LABEL_82;
  }
  id v15 = (RTLearnedPlace *)v8;
LABEL_85:

LABEL_86:

  return v15;
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void (**)(void, void, void))v17;
  if (!v14)
  {
    if (!v17) {
      goto LABEL_9;
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F5CFE8];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37[0] = @"requires a valid identifier.";
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    id v23 = (__CFString **)v37;
    id v24 = &v36;
LABEL_8:
    uint64_t v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    uint64_t v26 = [v20 errorWithDomain:v21 code:0 userInfo:v25];
    ((void (**)(void, void, void *))v18)[2](v18, 0, v26);

    goto LABEL_9;
  }
  if (!v15)
  {
    if (!v17) {
      goto LABEL_9;
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    long long v35 = @"requires a valid mapItem.";
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    id v23 = &v35;
    id v24 = &v34;
    goto LABEL_8;
  }
  id v19 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke;
  v27[3] = &unk_1E6B924D8;
  v27[4] = self;
  int v31 = v18;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  unint64_t v32 = a6;
  unint64_t v33 = a4;
  [v19 fetchLocationOfInterestWithIdentifier:v28 handler:v27];

LABEL_9:
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E6B924B0;
  id v13 = v6;
  id v14 = v5;
  id v19 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 72);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (uint64_t v5 = *(void *)(a1 + 40)) == 0)
  {
    if (!*(void *)(a1 + 80)) {
      return;
    }
    id v2 = [NSString stringWithFormat:@"No location of interest exists with identifier %@.", *(void *)(a1 + 48)];
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 80);
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 80), 0);
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      id v27 = v2;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v17 = [v14 errorWithDomain:v15 code:7 userInfo:v16];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v17);
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v25 = 0;
    char v8 = [v6 validateUpdatedMapItem:v7 locationOfInterest:v5 error:&v25];
    id v2 = v25;
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 56) learnedLocationStore];
      id v10 = [v9 predicateForObjectsFromCurrentDevice];

      id v11 = [*(id *)(a1 + 56) learnedLocationStore];
      uint64_t v12 = [*(id *)(a1 + 40) place];
      id v13 = [v12 mapItem];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_223;
      v19[3] = &unk_1E6B92488;
      void v19[4] = *(void *)(a1 + 56);
      id v23 = *(id *)(a1 + 80);
      id v20 = *(id *)(a1 + 40);
      id v21 = *(id *)(a1 + 64);
      id v22 = *(id *)(a1 + 72);
      long long v24 = *(_OWORD *)(a1 + 88);
      [v11 fetchPlaceWithMapItem:v13 predicate:v10 handler:v19];
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 80);
      if (v18) {
        (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v2);
      }
    }
  }
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_224;
  block[3] = &unk_1E6B924B0;
  id v11 = v6;
  id v17 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_224(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 48))
    {
      id v3 = [RTLearnedPlace alloc];
      uint64_t v4 = [*(id *)(a1 + 48) identifier];
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v7 = [*(id *)(a1 + 48) creationDate];
      id v8 = [*(id *)(a1 + 48) expirationDate];
      int v69 = [(RTLearnedPlace *)v3 initWithIdentifier:v4 type:0 typeSource:0 mapItem:v5 customLabel:v6 creationDate:v7 expirationDate:v8];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__17;
      v83 = __Block_byref_object_dispose__17;
      id v84 = 0;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = [*(id *)(a1 + 56) learnedLocationStore];
      uint64_t v79 = v69;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_225;
      v74[3] = &unk_1E6B90728;
      p_long long buf = &buf;
      id v12 = v9;
      uint64_t v75 = v12;
      [v10 updatePlaces:v11 handler:v74];

      id v13 = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v13, v15)) {
        goto LABEL_12;
      }
      id v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v14];
      double v18 = v17;
      id v19 = objc_opt_new();
      id v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v22 = [v21 filteredArrayUsingPredicate:v20];
      id v23 = [v22 firstObject];

      [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
      long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v86 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v86, 2u);
      }

      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v85 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v86 = @"semaphore wait timeout";
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
      id v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

      if (v27)
      {
        id v28 = v27;

        char v29 = 0;
      }
      else
      {
LABEL_12:
        id v28 = 0;
        char v29 = 1;
      }

      id v30 = v28;
      if ((v29 & 1) == 0) {
        objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v28);
      }
      uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
      if (v31)
      {
        uint64_t v32 = *(void *)(a1 + 80);
        if (v32) {
          (*(void (**)(uint64_t, void, void))(v32 + 16))(v32, 0, *(void *)(*((void *)&buf + 1) + 40));
        }
      }
      else
      {
        int v68 = [RTLearnedPlace alloc];
        id v46 = [*(id *)(a1 + 48) identifier];
        uint64_t v47 = *(void *)(a1 + 96);
        uint64_t v49 = *(void *)(a1 + 64);
        uint64_t v48 = *(void *)(a1 + 72);
        double v50 = [*(id *)(a1 + 48) creationDate];
        double v51 = [*(id *)(a1 + 48) expirationDate];
        uint64_t v52 = [(RTLearnedPlace *)v68 initWithIdentifier:v46 type:v47 typeSource:4 mapItem:v49 customLabel:v48 creationDate:v50 expirationDate:v51];

        int v69 = (RTLearnedPlace *)v52;
      }

      _Block_object_dispose(&buf, 8);
      if (v31) {
        goto LABEL_30;
      }
    }
    else
    {
      unint64_t v33 = *(void **)(a1 + 56);
      uint64_t v34 = *(void *)(a1 + 64);
      uint64_t v35 = *(void *)(a1 + 72);
      uint64_t v36 = *(void *)(a1 + 88);
      id v77 = 0;
      uint64_t v37 = [v33 createAndStoreNewPlaceWithMapItem:v34 customLabel:v35 mapItemSource:v36 outError:&v77];
      id v38 = v77;
      if (!v37)
      {
        uint64_t v65 = *(void *)(a1 + 80);
        if (v65) {
          (*(void (**)(uint64_t, void, id))(v65 + 16))(v65, 0, v38);
        }
        int v69 = 0;
        goto LABEL_29;
      }
      uint64_t v39 = [RTLearnedPlace alloc];
      int v40 = [v37 identifier];
      uint64_t v41 = *(void *)(a1 + 96);
      int v42 = [v37 mapItem];
      uint64_t v43 = *(void *)(a1 + 72);
      BOOL v44 = [v37 creationDate];
      uint64_t v45 = [v37 expirationDate];
      int v69 = [(RTLearnedPlace *)v39 initWithIdentifier:v40 type:v41 typeSource:4 mapItem:v42 customLabel:v43 creationDate:v44 expirationDate:v45];
    }
    id v53 = *(void **)(a1 + 56);
    long long v54 = [*(id *)(a1 + 40) place];
    id v73 = 0;
    id v55 = (id)[v53 _updateContactsWithLearnedPlace:v69 originalLearnedPlace:v54 error:&v73];
    id v38 = v73;

    if (v38)
    {
      uint64_t v56 = *(void *)(a1 + 80);
      if (v56) {
        (*(void (**)(uint64_t, void, id))(v56 + 16))(v56, 0, v38);
      }
    }
    else
    {
      int v57 = [RTLearnedLocationOfInterest alloc];
      int v58 = [*(id *)(a1 + 40) identifier];
      long long v59 = [*(id *)(a1 + 40) location];
      long long v60 = [*(id *)(a1 + 40) visits];
      long long v61 = [*(id *)(a1 + 40) transitions];
      int v62 = [(RTLearnedLocationOfInterest *)v57 initWithIdentifier:v58 location:v59 place:v69 visits:v60 transitions:v61];

      int v63 = [*(id *)(a1 + 56) learnedLocationStore];
      v78 = v62;
      uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_226;
      v70[3] = &unk_1E6B923C0;
      v70[4] = *(void *)(a1 + 56);
      id v72 = *(id *)(a1 + 80);
      id v71 = *(id *)(a1 + 64);
      [v63 updateLocationsOfInterest:v64 handler:v70];

      id v38 = 0;
    }
LABEL_29:

LABEL_30:
    return;
  }
  if (*(void *)(a1 + 80))
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = [*(id *)(a1 + 40) place];
      uint64_t v67 = [v66 mapItem];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v67;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "Unable to fetch place from current device with mapItem. %@", (uint8_t *)&buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_225(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_2_226(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_3;
  v9[3] = &unk_1E6B92398;
  id v10 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) learnedLocationStore];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_4;
    v6[3] = &unk_1E6B92370;
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    [v4 fetchLocationOfInterestWithMapItem:v5 handler:v6];
  }
}

uint64_t __115__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 mapItem:(id)a5 mapItemSource:(unint64_t)a6 customLabel:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  double v18 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke;
  block[3] = &unk_1E6B91950;
  void block[4] = self;
  id v24 = v14;
  unint64_t v28 = a4;
  unint64_t v29 = a6;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v18, block);
}

uint64_t __114__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_mapItem_mapItemSource_customLabel_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) type:*(void *)(a1 + 72) mapItem:*(void *)(a1 + 48) mapItemSource:*(void *)(a1 + 80) customLabel:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(void, void, void))v12;
  if (!v10)
  {
    if (!v12) {
      goto LABEL_9;
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"requires a valid identifier.";
    id v17 = (void *)MEMORY[0x1E4F1C9E8];
    double v18 = (__CFString **)v30;
    id v19 = &v29;
LABEL_8:
    id v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    id v21 = [v15 errorWithDomain:v16 code:0 userInfo:v20];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v21);

    goto LABEL_9;
  }
  if (!v11)
  {
    if (!v12) {
      goto LABEL_9;
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    unint64_t v28 = @"requires a valid mapItem.";
    id v17 = (void *)MEMORY[0x1E4F1C9E8];
    double v18 = &v28;
    id v19 = &v27;
    goto LABEL_8;
  }
  id v14 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke;
  v22[3] = &unk_1E6B92528;
  void v22[4] = self;
  id v25 = v13;
  id v23 = v10;
  id v24 = v11;
  unint64_t v26 = a5;
  [v14 fetchLocationOfInterestWithIdentifier:v23 handler:v22];

LABEL_9:
}

void __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke_2;
  block[3] = &unk_1E6B92500;
  id v15 = v6;
  id v16 = v5;
  id v20 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v19 = v10;
  uint64_t v21 = v11;
  id v12 = v5;
  id v13 = v6;
  dispatch_async(v7, block);
}

void __98__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke_2(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1[4])
  {
    uint64_t v5 = a1[5];
    if (v5)
    {
      id v6 = (void *)a1[7];
      uint64_t v7 = a1[8];
      id v21 = 0;
      char v8 = [v6 validateUpdatedMapItem:v7 locationOfInterest:v5 error:&v21];
      id v2 = v21;
      if ((v8 & 1) == 0)
      {
        uint64_t v20 = a1[9];
        if (v20) {
          (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v2);
        }
        goto LABEL_12;
      }
      uint64_t v10 = a1[6];
      uint64_t v9 = (void *)a1[7];
      uint64_t v11 = [(id)a1[5] place];
      uint64_t v12 = [v11 type];
      uint64_t v13 = a1[8];
      uint64_t v14 = a1[10];
      id v15 = [(id)a1[5] place];
      id v16 = [v15 customLabel];
      [v9 _updateLocationOfInterestWithIdentifier:v10 type:v12 mapItem:v13 mapItemSource:v14 customLabel:v16 handler:a1[9]];

      goto LABEL_11;
    }
  }
  if (!a1[9]) {
    return;
  }
  id v2 = [NSString stringWithFormat:@"No location of interest exists with identifier %@.", a1[6]];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v25 = v2;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
  }

  uint64_t v4 = a1[9];
  if (!a1[4])
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5CFE8];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v23 = v2;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v19 = [v17 errorWithDomain:v18 code:7 userInfo:v11];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v19);

LABEL_11:
    goto LABEL_12;
  }
  (*(void (**)(void, void))(v4 + 16))(a1[9], 0);
LABEL_12:
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 mapItem:(id)a4 mapItemSource:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __97__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_mapItem_mapItemSource_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) mapItem:*(void *)(a1 + 48) mapItemSource:*(void *)(a1 + 64) handler:*(void *)(a1 + 56)];
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void, void))v9;
  if (v8)
  {
    id v11 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
    v16[3] = &unk_1E6B92550;
    void v16[4] = self;
    id v18 = v10;
    id v17 = v8;
    unint64_t v19 = a4;
    [v11 fetchLocationOfInterestWithIdentifier:v17 handler:v16];
  }
  else if (v9)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"requires a valid identifier.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v12 errorWithDomain:v13 code:0 userInfo:v14];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v15);
  }
}

void __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2;
  v12[3] = &unk_1E6B90C68;
  id v13 = v6;
  id v14 = v5;
  id v17 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  uint64_t v18 = *(void *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __81__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (id v5 = *(void **)(a1 + 40)) == 0)
  {
    if (*(void *)(a1 + 64))
    {
      id v2 = [NSString stringWithFormat:@"No location of interest exists with identifier %@.", *(void *)(a1 + 48)];
      id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v23 = v2;
        _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
      }

      uint64_t v4 = *(void *)(a1 + 64);
      if (*(void *)(a1 + 32))
      {
        (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 64), 0);
      }
      else
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F5CFE8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        unint64_t v21 = v2;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        uint64_t v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];
        (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v18);
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 72);
    id v19 = [v5 place];
    uint64_t v9 = [v19 mapItem];
    id v10 = [*(id *)(a1 + 40) place];
    id v11 = [v10 mapItem];
    uint64_t v12 = [v11 source];
    id v13 = [*(id *)(a1 + 40) place];
    id v14 = [v13 customLabel];
    [v6 _updateLocationOfInterestWithIdentifier:v7 type:v8 mapItem:v9 mapItemSource:v12 customLabel:v14 handler:*(void *)(a1 + 64)];
  }
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __80__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __80__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) type:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    id v12 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
    v17[3] = &unk_1E6B925C8;
    void v17[4] = self;
    uint64_t v20 = v11;
    id v18 = v8;
    id v19 = v9;
    [v12 fetchLocationOfInterestWithIdentifier:v18 handler:v17];
  }
  else if (v10)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"requires a valid identifier.";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    unint64_t v16 = [v13 errorWithDomain:v14 code:0 userInfo:v15];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v16);
  }
}

void __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2;
  v12[3] = &unk_1E6B92578;
  id v13 = v6;
  id v14 = v5;
  id v18 = a1[7];
  id v15 = a1[5];
  id v8 = a1[6];
  id v9 = a1[4];
  id v16 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    if (!*(void *)(a1 + 72)) {
      return;
    }
    id v2 = [NSString stringWithFormat:@"No location of interest exists with identifier %@.", *(void *)(a1 + 48)];
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 72);
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 72), 0);
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      id v34 = v2;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v22 = [v19 errorWithDomain:v20 code:7 userInfo:v21];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v22);
    }
  }
  else
  {
    id v5 = [RTLearnedPlace alloc];
    uint64_t v29 = [*(id *)(a1 + 40) place];
    uint64_t v26 = [v29 identifier];
    unint64_t v28 = [*(id *)(a1 + 40) place];
    uint64_t v25 = [v28 type];
    uint64_t v27 = [*(id *)(a1 + 40) place];
    uint64_t v6 = [v27 typeSource];
    uint64_t v7 = [*(id *)(a1 + 40) place];
    id v8 = [v7 mapItem];
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [*(id *)(a1 + 40) place];
    id v11 = [v10 creationDate];
    id v12 = [*(id *)(a1 + 40) place];
    id v13 = [v12 expirationDate];
    id v14 = [(RTLearnedPlace *)v5 initWithIdentifier:v26 type:v25 typeSource:v6 mapItem:v8 customLabel:v9 creationDate:v11 expirationDate:v13];

    id v15 = *(void **)(a1 + 64);
    id v16 = [*(id *)(a1 + 40) place];
    id v32 = 0;
    id v17 = [v15 _updateContactsWithLearnedPlace:v14 originalLearnedPlace:v16 error:&v32];
    id v2 = v32;

    if (v2)
    {
      uint64_t v18 = *(void *)(a1 + 72);
      if (v18) {
        (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v2);
      }
    }
    else
    {
      id v23 = [*(id *)(a1 + 64) learnedLocationStore];
      uint64_t v24 = *(void *)(a1 + 48);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_227;
      v30[3] = &unk_1E6B92370;
      id v31 = *(id *)(a1 + 72);
      [v23 updateLocationOfInterestWithIdentifier:v24 place:v17 handler:v30];
    }
  }
}

uint64_t __88__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke_227(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 customLabel:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __87__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __87__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_customLabel_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) customLabel:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(void, void, void))v12;
  if (v10)
  {
    id v14 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
    v19[3] = &unk_1E6B92528;
    void v19[4] = self;
    uint64_t v22 = v13;
    id v20 = v10;
    unint64_t v23 = a4;
    id v21 = v11;
    [v14 fetchLocationOfInterestWithIdentifier:v20 handler:v19];
  }
  else if (v12)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"requires a valid identifier.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v18 = [v15 errorWithDomain:v16 code:0 userInfo:v17];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v18);
  }
}

void __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2;
  block[3] = &unk_1E6B92500;
  id v13 = v6;
  id v14 = v5;
  id v18 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  uint64_t v19 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __93__RTLearnedLocationManager__updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (id v5 = *(void **)(a1 + 40)) == 0)
  {
    if (*(void *)(a1 + 72))
    {
      id v2 = [NSString stringWithFormat:@"No location of interest exists with identifier %@.", *(void *)(a1 + 48)];
      id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v2;
        _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Unable to update location of interest. %@", buf, 0xCu);
      }

      uint64_t v4 = *(void *)(a1 + 72);
      if (*(void *)(a1 + 32))
      {
        (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 72), 0);
      }
      else
      {
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F5CFE8];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        id v18 = v2;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        id v15 = [v12 errorWithDomain:v13 code:7 userInfo:v14];
        (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v15);
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 80);
    id v16 = [v5 place];
    uint64_t v9 = [v16 mapItem];
    id v10 = [*(id *)(a1 + 40) place];
    id v11 = [v10 mapItem];
    [v6 _updateLocationOfInterestWithIdentifier:v7 type:v8 mapItem:v9 mapItemSource:[v11 source] customLabel:*(void *)(a1 + 64) handler:*(void *)(a1 + 72)];
  }
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 type:(unint64_t)a4 customLabel:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __92__RTLearnedLocationManager_updateLocationOfInterestWithIdentifier_type_customLabel_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) type:*(void *)(a1 + 64) customLabel:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__RTLearnedLocationManager__trainForReason_mode_handler___block_invoke;
  v11[3] = &unk_1E6B90C18;
  id v12 = v8;
  id v10 = v8;
  [v9 trainForReason:a3 mode:a4 handler:v11];
}

uint64_t __57__RTLearnedLocationManager__trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)trainForReason:(unint64_t)a3 mode:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(RTNotifier *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__RTLearnedLocationManager_trainForReason_mode_handler___block_invoke;
  v11[3] = &unk_1E6B925A0;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

uint64_t __56__RTLearnedLocationManager_trainForReason_mode_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trainForReason:*(void *)(a1 + 48) mode:*(void *)(a1 + 56) handler:*(void *)(a1 + 40)];
}

- (void)_forceRelabeling:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  [v5 relabelWithHandler:v4];
}

- (void)forceRelabeling:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTLearnedLocationManager_forceRelabeling___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__RTLearnedLocationManager_forceRelabeling___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceRelabeling:*(void *)(a1 + 40)];
}

- (void)_trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  [v5 trainLocationsOfInterestModelWithHandler:v4];
}

- (void)trainLocationsOfInterestModelWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__RTLearnedLocationManager_trainLocationsOfInterestModelWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__RTLearnedLocationManager_trainLocationsOfInterestModelWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trainLocationsOfInterestModelWithHandler:*(void *)(a1 + 40)];
}

- (void)_reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  [v5 reconcileLearnedLocationsWithHandler:v4];
}

- (void)reconcileLearnedLocationsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTLearnedLocationManager_reconcileLearnedLocationsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__RTLearnedLocationManager_reconcileLearnedLocationsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcileLearnedLocationsWithHandler:*(void *)(a1 + 40)];
}

- (void)_classifyPlaceTypesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLearnedLocationManager *)self learnedLocationEngine];
  [v5 classifyPlaceTypesWithHandler:v4];
}

- (void)classifyPlaceTypesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTLearnedLocationManager_classifyPlaceTypesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTLearnedLocationManager_classifyPlaceTypesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _classifyPlaceTypesWithHandler:*(void *)(a1 + 40)];
}

- (void)_addLocationOfInterest:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
      uint64_t v9 = [v8 predicateForObjectsFromCurrentDevice];

      id v10 = [(RTLearnedLocationManager *)self learnedLocationStore];
      id v11 = [v6 place];
      id v12 = [v11 mapItem];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke;
      v16[3] = &unk_1E6B92618;
      id v18 = v7;
      void v16[4] = self;
      id v17 = v6;
      [v10 fetchPlaceWithMapItem:v12 predicate:v9 handler:v16];
    }
    else
    {
      unint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"requires a non-nil location of interest.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v15 = [v13 errorWithDomain:v14 code:0 userInfo:v9];
      (*((void (**)(id, void *))v7 + 2))(v7, v15);
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v6 = [a1[4] queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_2;
    v9[3] = &unk_1E6B91490;
    id v10 = v5;
    id v7 = a1[5];
    id v8 = a1[4];
    id v11 = v7;
    id v12 = v8;
    id v13 = a1[6];
    dispatch_async(v6, v9);
  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_2(id *a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v2 = (RTLearnedPlace *)a1[4];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__17;
  v44[4] = __Block_byref_object_dispose__17;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__17;
  v42[4] = __Block_byref_object_dispose__17;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__17;
  v40[4] = __Block_byref_object_dispose__17;
  id v41 = 0;
  id v3 = dispatch_group_create();
  if (!v2)
  {
    unint64_t v21 = [RTLearnedPlace alloc];
    uint64_t v26 = [a1[5] place];
    uint64_t v22 = [v26 identifier];
    uint64_t v25 = [a1[5] place];
    uint64_t v20 = [v25 type];
    uint64_t v24 = [a1[5] place];
    uint64_t v4 = [v24 typeSource];
    unint64_t v23 = [a1[5] place];
    id v5 = [v23 mapItem];
    id v6 = [a1[5] place];
    id v7 = [v6 customLabel];
    id v8 = [a1[5] place];
    uint64_t v9 = [v8 creationDate];
    id v10 = [a1[5] place];
    id v11 = [v10 expirationDate];
    id v2 = [(RTLearnedPlace *)v21 initWithIdentifier:v22 type:v20 typeSource:v4 mapItem:v5 customLabel:v7 creationDate:v9 expirationDate:v11];

    dispatch_group_enter(v3);
    id v12 = [a1[6] learnedLocationStore];
    v46[0] = v2;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_3;
    v37[3] = &unk_1E6B90728;
    uint64_t v39 = v40;
    id v38 = v3;
    [v12 storePlaces:v13 handler:v37];
  }
  dispatch_group_enter(v3);
  uint64_t v14 = [a1[6] learnedLocationStore];
  id v15 = [a1[5] visits];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_4;
  v34[3] = &unk_1E6B90728;
  id v36 = v42;
  id v16 = v3;
  uint64_t v35 = v16;
  [v14 storeVisits:v15 place:v2 handler:v34];

  id v17 = [a1[6] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_5;
  block[3] = &unk_1E6B925F0;
  id v31 = v44;
  id v32 = v40;
  uint64_t v33 = v42;
  id v30 = a1[7];
  id v18 = a1[5];
  void block[4] = a1[6];
  unint64_t v28 = v2;
  id v29 = v18;
  id v19 = v2;
  dispatch_group_notify(v16, v17, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v2 = _RTSafeArray();
  id v3 = _RTMultiErrorCreate();

  if (v3)
  {
    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3, v4);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) learnedLocationStore:v9, v10, 1];
    uint64_t v6 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_6;
    v11[3] = &unk_1E6B925C8;
    id v15 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v13 = v7;
    uint64_t v14 = v8;
    [v5 fetchLocationOfInterestWithPlace:v6 handler:v11];
  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v7 = [RTLearnedLocationOfInterest alloc];
    if (v5)
    {
      uint64_t v8 = [v5 identifier];
      uint64_t v9 = [v5 location];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) visits];
      id v12 = [*(id *)(a1 + 40) transitions];
      id v13 = [(RTLearnedLocationOfInterest *)v7 initWithIdentifier:v8 location:v9 place:v10 visits:v11 transitions:v12];

      uint64_t v14 = [*(id *)(a1 + 48) queue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_7;
      v28[3] = &unk_1E6B90660;
      v28[4] = *(void *)(a1 + 48);
      id v15 = (id *)&v29;
      id v16 = v13;
      id v29 = v16;
      id v17 = &v30;
      id v30 = *(id *)(a1 + 56);
      id v18 = v28;
    }
    else
    {
      id v19 = [*(id *)(a1 + 40) identifier];
      uint64_t v20 = [*(id *)(a1 + 40) location];
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = [*(id *)(a1 + 40) visits];
      unint64_t v23 = [*(id *)(a1 + 40) transitions];
      uint64_t v24 = [(RTLearnedLocationOfInterest *)v7 initWithIdentifier:v19 location:v20 place:v21 visits:v22 transitions:v23];

      uint64_t v14 = [*(id *)(a1 + 48) queue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_8;
      v25[3] = &unk_1E6B90660;
      void v25[4] = *(void *)(a1 + 48);
      id v15 = (id *)&v26;
      id v16 = v24;
      uint64_t v26 = v16;
      id v17 = &v27;
      id v27 = *(id *)(a1 + 56);
      id v18 = v25;
    }
    dispatch_async(v14, v18);
  }
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_7(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) learnedLocationStore];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 updateLocationsOfInterest:v3 handler:*(void *)(a1 + 48)];
}

void __59__RTLearnedLocationManager__addLocationOfInterest_handler___block_invoke_8(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) learnedLocationStore];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 storeLocationsOfInterest:v3 handler:*(void *)(a1 + 48)];
}

- (void)addLocationOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationManager_addLocationOfInterest_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__RTLearnedLocationManager_addLocationOfInterest_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLocationOfInterest:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationManager_removeLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__RTLearnedLocationManager_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationOfInterestWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    uint64_t v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v9[3] = &unk_1E6B91100;
    void v9[4] = self;
    id v10 = v6;
    [v8 removeLocationOfInterestWithIdentifier:v7 handler:v9];
  }
}

void __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) learnedLocationEngine];
  [v2 requestTrainLocationsOfInterestModelWithHandler:&__block_literal_global_232];
}

void __76__RTLearnedLocationManager__removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "error during requested re-train, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_removeAllLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__17;
  void v19[4] = __Block_byref_object_dispose__17;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__17;
  void v17[4] = __Block_byref_object_dispose__17;
  id v18 = 0;
  dispatch_group_enter(v5);
  uint64_t v6 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke;
  v14[3] = &unk_1E6B90728;
  id v16 = v19;
  id v7 = v5;
  id v15 = v7;
  [v6 clearWithHandler:v14];

  uint64_t v8 = [(RTNotifier *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_2;
  v10[3] = &unk_1E6B92640;
  id v12 = v19;
  id v13 = v17;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v7, v8, v10);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v2 = _RTSafeArray();
  id v3 = _RTMultiErrorCreate();

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) learnedLocationEngine:v6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_3;
    v7[3] = &unk_1E6B90C18;
    id v8 = *(id *)(a1 + 40);
    [v5 trainLocationsOfInterestModelWithHandler:v7];
  }
}

uint64_t __69__RTLearnedLocationManager__removeAllLocationsOfInterestWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeAllLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__RTLearnedLocationManager_removeAllLocationsOfInterestWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __68__RTLearnedLocationManager_removeAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllLocationsOfInterestWithHandler:*(void *)(a1 + 40)];
}

- (void)_addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        id v11 = [(RTLearnedLocationManager *)self learnedLocationStore];
        id v12 = [v9 identifier];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        id v20[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke;
        v20[3] = &unk_1E6B926E0;
        v20[4] = self;
        id v22 = v10;
        id v21 = v8;
        [v11 fetchLocationOfInterestWithIdentifier:v12 handler:v20];

        goto LABEL_8;
      }
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v24 = @"requires a valid location of interest.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = &v24;
      id v17 = &v23;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"requires a valid visit.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = (__CFString **)v26;
      id v17 = &v25;
    }
    id v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    id v19 = [v13 errorWithDomain:v14 code:0 userInfo:v18];
    (*((void (**)(id, void *))v10 + 2))(v10, v19);
  }
LABEL_8:
}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_2;
  block[3] = &unk_1E6B926B8;
  id v14 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v18 = v8;
  uint64_t v15 = v9;
  id v16 = v10;
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v7, block);
}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) learnedLocationStore];
    v9[0] = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = [*(id *)(a1 + 56) place];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_3;
    v7[3] = &unk_1E6B92690;
    void v7[4] = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 64);
    [v4 storeVisits:v5 place:v6 handler:v7];
  }
}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_4;
  block[3] = &unk_1E6B92668;
  id v8 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) learnedLocationEngine];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_5;
    v5[3] = &unk_1E6B90C18;
    id v6 = *(id *)(a1 + 48);
    [v4 trainLocationsOfInterestModelWithHandler:v5];
  }
}

uint64_t __65__RTLearnedLocationManager__addVisit_locationOfInterest_handler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addVisit:(id)a3 locationOfInterest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __64__RTLearnedLocationManager_addVisit_locationOfInterest_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __64__RTLearnedLocationManager_addVisit_locationOfInterest_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addVisit:*(void *)(a1 + 40) locationOfInterest:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTLearnedLocationManager_removeVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __62__RTLearnedLocationManager_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVisitWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke;
  v10[3] = &unk_1E6B91100;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 removeVisitWithIdentifier:v7 handler:v10];
}

void __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) learnedLocationEngine];
  [v2 requestTrainLocationsOfInterestModelWithHandler:&__block_literal_global_240];
}

void __63__RTLearnedLocationManager__removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "error during requested re-train, %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if (v6)
    {
      if ([v6 count])
      {
        id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:4838400.0];
        id v9 = [(RTLearnedLocationManager *)self learnedLocationStore];
        [v9 extendExpirationDateOfVisitsWithIdentifiers:v6 expirationDate:v8 handler:v7];
      }
      else
      {
        v7[2](v7, 0);
      }
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = @"visitIdentifiers is required";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v14 = [v11 errorWithDomain:v12 code:7 userInfo:v13];
      ((void (**)(id, void *))v7)[2](v7, v14);
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v15, 2u);
    }
  }
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTLearnedLocationManager_extendLifetimeOfVisitsWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extendLifetimeOfVisitsWithIdentifiers:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  v100[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  uint64_t v64 = v6;
  if (!v6)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTLearnedLocationManager _fetchDedupedLocationOfInterestIdentifiersWithIdentifier:handler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3033;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  if (v7)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v97 = __Block_byref_object_copy__17;
    v98 = __Block_byref_object_dispose__17;
    id v99 = 0;
    uint64_t v73 = 0;
    v74 = (id *)&v73;
    uint64_t v75 = 0x3032000000;
    double v76 = __Block_byref_object_copy__17;
    id v77 = __Block_byref_object_dispose__17;
    id v78 = 0;
    id v10 = [(RTLearnedLocationManager *)self learnedLocationStore];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
    v69[3] = &unk_1E6B90B28;
    id v71 = buf;
    id v72 = &v73;
    id v11 = v9;
    uint64_t v70 = v11;
    [v10 fetchLocationOfInterestWithIdentifier:v64 handler:v69];

    id v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      id v18 = objc_opt_new();
      id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 filteredArrayUsingPredicate:v19];
      id v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int v92 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      *(void *)int v92 = @"semaphore wait timeout";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v86 count:1];
      id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v26 = v26;

        char v27 = 0;
LABEL_15:

        oslog = v26;
        if ((v27 & 1) == 0) {
          objc_storeStrong(v74 + 5, v26);
        }
        unint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = NSStringFromSelector(a2);
          uint64_t v30 = *(void *)(*(void *)&buf[8] + 40);
          id v31 = (uint64_t (*)(uint64_t, uint64_t))v74[5];
          *(_DWORD *)int v92 = 138412802;
          *(void *)&v92[4] = v29;
          *(_WORD *)&v92[12] = 2112;
          *(void *)&v92[14] = v30;
          *(_WORD *)&v92[22] = 2112;
          uint64_t v93 = v31;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, locationOfInterest, %@, error, %@", v92, 0x20u);
        }
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
          *(void *)int v92 = 0;
          *(void *)&v92[8] = v92;
          *(void *)&v92[16] = 0x3032000000;
          uint64_t v93 = __Block_byref_object_copy__17;
          uint64_t v94 = __Block_byref_object_dispose__17;
          id v95 = 0;
          uint64_t v86 = 0;
          uint64_t v87 = (id *)&v86;
          uint64_t v88 = 0x3032000000;
          uint64_t v89 = __Block_byref_object_copy__17;
          uint64_t v90 = __Block_byref_object_dispose__17;
          id v91 = 0;
          uint64_t v33 = [(RTLearnedLocationManager *)self learnedLocationStore];
          id v34 = [*(id *)(*(void *)&buf[8] + 40) place];
          uint64_t v35 = [v34 mapItem];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_244;
          v65[3] = &unk_1E6B905F0;
          uint64_t v67 = v92;
          int v68 = &v86;
          id v36 = v32;
          uint64_t v66 = v36;
          [v33 fetchPlacesWithMapItem:v35 handler:v65];

          uint64_t v37 = v36;
          id v38 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v39 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v37, v39)) {
            goto LABEL_25;
          }
          int v40 = [MEMORY[0x1E4F1C9C8] now];
          [v40 timeIntervalSinceDate:v38];
          double v42 = v41;
          id v43 = objc_opt_new();
          BOOL v44 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
          id v45 = [MEMORY[0x1E4F29060] callStackSymbols];
          id v46 = [v45 filteredArrayUsingPredicate:v44];
          uint64_t v47 = [v46 firstObject];

          [v43 submitToCoreAnalytics:v47 type:1 duration:v42];
          uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)uint64_t v79 = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v79, 2u);
          }

          uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
          v100[0] = *MEMORY[0x1E4F28568];
          *(void *)uint64_t v79 = @"semaphore wait timeout";
          double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v100 count:1];
          double v51 = [v49 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v50];

          if (v51)
          {
            id v52 = v51;

            char v53 = 0;
          }
          else
          {
LABEL_25:
            id v52 = 0;
            char v53 = 1;
          }

          id v54 = v52;
          if ((v53 & 1) == 0) {
            objc_storeStrong(v87 + 5, v52);
          }
          id v55 = [*(id *)(*(void *)&v92[8] + 40) valueForKey:@"identifier"];
          uint64_t v56 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != %@", v64];
          int v57 = [v55 filteredArrayUsingPredicate:v56];

          int v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            id v59 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v60 = [v57 count];
            id v61 = v87[5];
            *(_DWORD *)uint64_t v79 = 138413058;
            *(void *)&v79[4] = v59;
            __int16 v80 = 2048;
            uint64_t v81 = v60;
            __int16 v82 = 2112;
            v83 = v64;
            __int16 v84 = 2112;
            id v85 = v61;
            _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, %lu deduped places to LOI with identifier, %@, error, %@", v79, 0x2Au);
          }
          ((void (**)(id, void *, id))v7)[2](v7, v57, v87[5]);

          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(v92, 8);
        }
        else
        {
          ((void (**)(id, void *, id))v7)[2](v7, 0, v74[5]);
        }

        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_33;
      }
    }
    else
    {
      id v26 = 0;
    }
    char v27 = 1;
    goto LABEL_15;
  }
  oslog = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_33:
}

void __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __93__RTLearnedLocationManager__fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchDedupedLocationOfInterestIdentifiersWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__RTLearnedLocationManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __92__RTLearnedLocationManager_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDedupedLocationOfInterestIdentifiersWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)learnedLocationEngineDidUpdate:(id)a3 intervalSinceLastUpdate:(double)a4
{
  id v6 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__RTLearnedLocationManager_learnedLocationEngineDidUpdate_intervalSinceLastUpdate___block_invoke;
  v7[3] = &unk_1E6B91248;
  void v7[4] = self;
  *(double *)&void v7[5] = a4;
  dispatch_async(v6, v7);
}

uint64_t __83__RTLearnedLocationManager_learnedLocationEngineDidUpdate_intervalSinceLastUpdate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [[RTLearnedLocationManagerNotificationDidUpdate alloc] initWithIntervalSinceLastUpdate:*(double *)(a1 + 40)];
  [v1 postNotification:v2];

  id v3 = (const char *)[(id)*MEMORY[0x1E4F5CFF8] UTF8String];

  return notify_post(v3);
}

- (void)learnedLocationEngineDidClear:(id)a3
{
  int v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationManager_learnedLocationEngineDidClear___block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __58__RTLearnedLocationManager_learnedLocationEngineDidClear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = objc_opt_new();
  [v1 postNotification:v2];

  id v3 = (const char *)[(id)*MEMORY[0x1E4F5D000] UTF8String];

  return notify_post(v3);
}

- (void)learnedLocationEngineWillBeginTraining:(id)a3
{
  int v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTLearnedLocationManager_learnedLocationEngineWillBeginTraining___block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __67__RTLearnedLocationManager_learnedLocationEngineWillBeginTraining___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAvailable:0];
}

- (void)learnedLocationEngineDidFinishTraining:(id)a3
{
  int v4 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTLearnedLocationManager_learnedLocationEngineDidFinishTraining___block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __67__RTLearnedLocationManager_learnedLocationEngineDidFinishTraining___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAvailable:1];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [[RTLearnedLocationManagerNotificationAvailabilityDidChange alloc] initWithAvailability:[(RTLearnedLocationManager *)self available]];
    [(RTNotifier *)self postNotification:v10 toObserver:v6];
  }
  else
  {
    id v11 = +[RTNotification notificationName];
    char v12 = [v7 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = +[RTNotification notificationName];
    char v8 = [v4 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      int v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  char v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if ([v4 availability] == 2)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke;
      v8[3] = &unk_1E6B90840;
      v8[4] = self;
      [(RTLearnedLocationManager *)self _performLegacyMigrations:v8];
    }
    else
    {
      [(RTLearnedLocationManager *)self setAvailable:0];
    }
  }
}

void __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke_2;
  v7[3] = &unk_1E6B90BF0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __64__RTLearnedLocationManager__onLearnedLocationStoreNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "failed migrating legacy data, error, %@", (uint8_t *)&v6, 0xCu);
    }

    return [*(id *)(a1 + 40) setAvailable:0];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    return [v4 setAvailable:1];
  }
}

- (void)onLearnedLocationStoreNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__RTLearnedLocationManager_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __63__RTLearnedLocationManager_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationStoreNotification:*(void *)(a1 + 40)];
}

- (void)setAvailable:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_available != a3)
  {
    self->_available = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = (void *)v6;
      if (self->_available) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, available, %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = [[RTLearnedLocationManagerNotificationAvailabilityDidChange alloc] initWithAvailability:self->_available];
    [(RTNotifier *)self postNotification:v9];
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 3;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __72__RTLearnedLocationManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __72__RTLearnedLocationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) learnedLocationEngine];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) learnedLocationEngine];
    [v4 performPurgeOfType:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

- (void)logDatabasesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__17;
  v28[4] = __Block_byref_object_dispose__17;
  id v29 = 0;
  dispatch_group_enter(v2);
  id v3 = [*(id *)(a1 + 32) learnedLocationStore];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_2;
  v25[3] = &unk_1E6B90728;
  char v27 = v28;
  id v4 = v2;
  id v26 = v4;
  [v3 logCloudStoreWithReason:0 handler:v25];

  v23[0] = 0;
  v23[1] = v23;
  void v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__17;
  v23[4] = __Block_byref_object_dispose__17;
  id v24 = 0;
  dispatch_group_enter(v4);
  uint64_t v5 = [*(id *)(a1 + 32) learnedLocationStore];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  id v20[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_3;
  v20[3] = &unk_1E6B90728;
  id v22 = v23;
  id v6 = v4;
  id v21 = v6;
  [v5 logLocalStoreWithReason:0 handler:v20];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  void v18[3] = __Block_byref_object_copy__17;
  void v18[4] = __Block_byref_object_dispose__17;
  id v19 = 0;
  dispatch_group_enter(v6);
  uint64_t v7 = [*(id *)(a1 + 32) learnedPlaceTypeInferenceStore];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_4;
  v15[3] = &unk_1E6B90728;
  double v17 = v18;
  id v8 = v6;
  int64_t v16 = v8;
  [v7 logCacheStoreWithReason:0 handler:v15];

  id v9 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_5;
  v10[3] = &unk_1E6B92708;
  id v11 = *(id *)(a1 + 40);
  id v12 = v28;
  id v13 = v23;
  id v14 = v18;
  dispatch_group_notify(v8, v9, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v28, 8);
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__RTLearnedLocationManager_logDatabasesWithHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    _RTSafeArray();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = _RTMultiErrorCreate();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (void)updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __86__RTLearnedLocationManager_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __86__RTLearnedLocationManager_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) learnedLocationStore];
  [v2 updateTransitionWithIdentifier:*(void *)(a1 + 40) motionActivityType:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_reconstructTransitionsWithHandler:(id)a3
{
  v141[1] = *MEMORY[0x1E4F143B8];
  uint64_t v93 = (void (**)(void))a3;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__17;
  v127 = __Block_byref_object_dispose__17;
  id v128 = 0;
  uint64_t v117 = 0;
  v118 = (id *)&v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__17;
  v121 = __Block_byref_object_dispose__17;
  id v122 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v91 = self;
  uint64_t v5 = [(RTLearnedLocationManager *)self learnedLocationStore];
  int v92 = [v5 predicateForObjectsFromCurrentDevice];

  id v6 = [(RTLearnedLocationManager *)v91 learnedLocationStore];
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke;
  v113[3] = &unk_1E6B905F0;
  uint64_t v115 = &v123;
  id v116 = &v117;
  uint64_t v7 = v4;
  uint64_t v114 = v7;
  [v6 fetchVisitsWithPredicate:v92 handler:v113];

  dsema = v7;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v9)) {
    goto LABEL_6;
  }
  int v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  id v13 = objc_opt_new();
  id v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
  id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
  unint64_t v16 = [v15 filteredArrayUsingPredicate:v14];
  double v17 = [v16 firstObject];

  [v13 submitToCoreAnalytics:v17 type:1 duration:v12];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v19 = (void *)MEMORY[0x1E4F28C58];
  *(void *)v132 = *MEMORY[0x1E4F28568];
  *(void *)long long buf = @"semaphore wait timeout";
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v132 count:1];
  id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v20];

  if (v21)
  {
    id v22 = v21;

    char v23 = 0;
  }
  else
  {
LABEL_6:
    id v22 = 0;
    char v23 = 1;
  }

  id v24 = v22;
  if ((v23 & 1) == 0) {
    objc_storeStrong(v118 + 5, v22);
  }
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [(id)v124[5] count];
    unint64_t v28 = (uint64_t (*)(uint64_t, uint64_t))v118[5];
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    v138 = v28;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %lu visits on current device, error, %@", buf, 0x20u);
  }
  if (!v118[5])
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v138 = __Block_byref_object_copy__17;
    v139 = __Block_byref_object_dispose__17;
    id v140 = 0;
    id v29 = [(RTLearnedLocationManager *)v91 learnedLocationStore];
    uint64_t v30 = v124[5];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_254;
    v110[3] = &unk_1E6B90728;
    uint64_t v112 = buf;
    id v31 = dsema;
    id v111 = v31;
    [v29 removeTransitionsReferencingVisits:v30 handler:v110];

    uint64_t v90 = v31;
    dispatch_semaphore_t v32 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v33 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v90, v33)) {
      goto LABEL_19;
    }
    id v34 = [MEMORY[0x1E4F1C9C8] now];
    [v34 timeIntervalSinceDate:v32];
    double v36 = v35;
    uint64_t v37 = objc_opt_new();
    id v38 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    dispatch_time_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v40 = [v39 filteredArrayUsingPredicate:v38];
    double v41 = [v40 firstObject];

    [v37 submitToCoreAnalytics:v41 type:1 duration:v36];
    double v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v132 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v132, 2u);
    }

    id v43 = (void *)MEMORY[0x1E4F28C58];
    *(void *)v129 = *MEMORY[0x1E4F28568];
    *(void *)v132 = @"semaphore wait timeout";
    BOOL v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v129 count:1];
    id v45 = [v43 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v44];

    if (v45)
    {
      id v46 = v45;

      char v47 = 0;
    }
    else
    {
LABEL_19:
      char v47 = 1;
      id v46 = v24;
    }

    id v89 = v46;
    if ((v47 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), v46);
    }
    uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = NSStringFromSelector(a2);
      uint64_t v50 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v132 = 138412546;
      *(void *)&v132[4] = v49;
      *(_WORD *)&v132[12] = 2112;
      *(void *)&v132[14] = v50;
      _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, removed existing transitions, error, %@", v132, 0x16u);
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      if (v93) {
        v93[2]();
      }
LABEL_60:

      _Block_object_dispose(buf, 8);
      id v24 = v89;
      goto LABEL_61;
    }
    id v96 = objc_opt_new();
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id obj = (id)v124[5];
    uint64_t v51 = [obj countByEnumeratingWithState:&v106 objects:v136 count:16];
    if (!v51)
    {
      id v100 = 0;
LABEL_45:

      *(void *)v132 = 0;
      *(void *)&v132[8] = v132;
      *(void *)&v132[16] = 0x3032000000;
      v133 = __Block_byref_object_copy__17;
      v134 = __Block_byref_object_dispose__17;
      id v135 = 0;
      uint64_t v65 = [(RTLearnedLocationManager *)v91 learnedLocationStore];
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_256;
      v103[3] = &unk_1E6B90728;
      v105 = v132;
      uint64_t v66 = v90;
      v104 = v66;
      [v65 storeTransitions:v96 handler:v103];

      uint64_t v67 = v66;
      int v68 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v69 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v67, v69)) {
        goto LABEL_50;
      }
      uint64_t v70 = [MEMORY[0x1E4F1C9C8] now];
      [v70 timeIntervalSinceDate:v68];
      double v72 = v71;
      uint64_t v73 = objc_opt_new();
      v74 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
      uint64_t v75 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v76 = [v75 filteredArrayUsingPredicate:v74];
      id v77 = [v76 firstObject];

      [v73 submitToCoreAnalytics:v77 type:1 duration:v72];
      id v78 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v129 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v129, 2u);
      }

      uint64_t v79 = (void *)MEMORY[0x1E4F28C58];
      v141[0] = *MEMORY[0x1E4F28568];
      *(void *)v129 = @"semaphore wait timeout";
      __int16 v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v141 count:1];
      uint64_t v81 = [v79 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v80];

      if (v81)
      {
        id v82 = v81;

        char v83 = 0;
      }
      else
      {
LABEL_50:
        char v83 = 1;
        id v82 = v89;
      }

      id v84 = v82;
      if ((v83 & 1) == 0) {
        objc_storeStrong((id *)(*(void *)&v132[8] + 40), v82);
      }
      id v85 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        uint64_t v86 = [v96 count];
        uint64_t v87 = *(void *)(*(void *)&v132[8] + 40);
        *(_DWORD *)v129 = 134218242;
        *(void *)&v129[4] = v86;
        __int16 v130 = 2112;
        uint64_t v131 = v87;
        _os_log_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_INFO, "stored %lu transitions, error, %@", v129, 0x16u);
      }

      if (*(void *)(*(void *)&v132[8] + 40))
      {
        if (v93) {
          v93[2]();
        }
      }
      else
      {
        uint64_t v88 = [(RTLearnedLocationManager *)v91 learnedLocationEngine];
        v101[0] = MEMORY[0x1E4F143A8];
        v101[1] = 3221225472;
        v101[2] = __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_257;
        v101[3] = &unk_1E6B90C18;
        id v102 = v93;
        [v88 trainLocationsOfInterestModelWithHandler:v101];
      }
      _Block_object_dispose(v132, 8);

      id v89 = v84;
      goto LABEL_60;
    }
    id v100 = 0;
    uint64_t v98 = *(void *)v107;
LABEL_29:
    uint64_t v99 = v51;
    uint64_t v52 = 0;
    while (1)
    {
      if (*(void *)v107 != v98) {
        objc_enumerationMutation(obj);
      }
      char v53 = *(void **)(*((void *)&v106 + 1) + 8 * v52);
      id v54 = (uint64_t (*)(uint64_t, uint64_t))v100;
      if (v100)
      {
        id v54 = [v100 exitDate];
        id v55 = [v53 entryDate];
        if ([v55 isBeforeDate:v54])
        {
          uint64_t v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v64 = NSStringFromSelector(a2);
            *(_DWORD *)v132 = 138412802;
            *(void *)&v132[4] = v64;
            *(_WORD *)&v132[12] = 2112;
            *(void *)&v132[14] = v55;
            *(_WORD *)&v132[22] = 2112;
            v133 = v54;
            _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, "%@, next entry date, %@, predates previous exit date, %@", v132, 0x20u);
          }
          goto LABEL_41;
        }
        int v57 = [RTLearnedTransition alloc];
        int v58 = [MEMORY[0x1E4F29128] UUID];
        id v59 = [v100 identifier];
        uint64_t v60 = [v53 identifier];
        id v61 = [MEMORY[0x1E4F1C9C8] date];
        int v62 = [v53 expirationDate];
        int v63 = [(RTLearnedTransition *)v57 initWithIdentifier:v58 startDate:v54 stopDate:v55 visitIdentifierOrigin:v59 visitIdentifierDestination:v60 creationDate:v61 expirationDate:v62 predominantMotionActivityType:0];

        if (v63) {
          [v96 addObject:v63];
        }

        id v54 = (uint64_t (*)(uint64_t, uint64_t))v100;
      }
      id v100 = v53;
LABEL_41:

      if (v99 == ++v52)
      {
        uint64_t v51 = [obj countByEnumeratingWithState:&v106 objects:v136 count:16];
        if (!v51) {
          goto LABEL_45;
        }
        goto LABEL_29;
      }
    }
  }
  if (v93) {
    v93[2]();
  }
LABEL_61:

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v123, 8);
}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_254(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_256(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __63__RTLearnedLocationManager__reconstructTransitionsWithHandler___block_invoke_257(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reconstructTransitionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTLearnedLocationManager_reconstructTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__RTLearnedLocationManager_reconstructTransitionsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconstructTransitionsWithHandler:*(void *)(a1 + 40)];
}

- (void)fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    id v11 = "Invalid parameter not satisfying: options";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    id v11 = "Invalid parameter not satisfying: handler";
    goto LABEL_10;
  }
  uint64_t v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RTLearnedLocationManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(v9, block);

LABEL_8:
}

uint64_t __76__RTLearnedLocationManager_fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFamiliarityIndexResultsWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchFamiliarityIndexResultsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  if (!v7)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v53 = 136315394;
      *(void *)&v53[4] = "-[RTLearnedLocationManager _fetchFamiliarityIndexResultsWithOptions:handler:]";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = 3424;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", v53, 0x12u);
    }
  }
  *(void *)char v53 = 0;
  *(void *)&v53[8] = v53;
  *(void *)&v53[16] = 0x3032000000;
  id v54 = __Block_byref_object_copy__17;
  id v55 = __Block_byref_object_dispose__17;
  id v56 = 0;
  int v10 = [MEMORY[0x1E4F1C9C8] date];
  [v7 lookbackInterval];
  id v12 = [v10 dateByAddingTimeInterval:-v11];
  id v13 = [v7 dateInterval];
  id v14 = [v13 startDate];
  int v15 = [v12 isAfterDate:v14];

  if (v15)
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    uint64_t v52 = @"options.lookbackWindow can not be set after the dateInterval.startDate";
    double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v18 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];

    v8[2](v8, 0, v18);
  }
  else if ([v7 referenceLocationSummary] {
         && ([v7 referenceLocation],
  }
             id v19 = objc_claimAutoreleasedReturnValue(),
             BOOL v20 = v19 == 0,
             v19,
             v20))
  {
    id v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    uint64_t v50 = @"options.referenceLocationSummary can be set to YES only with a valid options.referencelocation";
    dispatch_time_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v18 = [v38 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v39];

    v8[2](v8, 0, v18);
  }
  else if (([v7 spatialGranularity] | 2) == 3)
  {
    id v42 = 0;
    uint64_t v21 = -[RTLearnedLocationManager _getAreasGeohashesFamiliarPlacesWithGranularity:outError:](self, "_getAreasGeohashesFamiliarPlacesWithGranularity:outError:", [v7 spatialGranularity], &v42);
    id v18 = v42;
    id v22 = *(void **)(*(void *)&v53[8] + 40);
    *(void *)(*(void *)&v53[8] + 40) = v21;

    char v23 = [v7 dateInterval];
    id v24 = [v23 startDate];

    uint64_t v25 = [v7 dateInterval];
    id v26 = [v25 endDate];

    uint64_t v27 = [v7 referenceLocation];
    LODWORD(v25) = v27 == 0;

    if (v25)
    {
      uint64_t v30 = [(RTLearnedLocationManager *)self learnedLocationStore];
      id v31 = v41;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke;
      v41[3] = &unk_1E6B92758;
      v41[4] = self;
      v41[5] = v7;
      v41[7] = v53;
      v41[6] = v8;
      [v30 fetchLocationsOfInterestVisitedBetweenStartDate:v24 endDate:v26 handler:v41];
    }
    else
    {
      [v7 distance];
      double v29 = v28;
      uint64_t v30 = [v7 referenceLocation];
      id v31 = v40;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3;
      v40[3] = &unk_1E6B92758;
      v40[4] = self;
      void v40[5] = v7;
      v40[7] = v53;
      v40[6] = v8;
      [(RTLearnedLocationManager *)self _fetchLocationsOfInterestWithinDistance:v30 ofLocation:v40 handler:v29];
    }
  }
  else
  {
    dispatch_semaphore_t v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      double v35 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412546;
      id v46 = v34;
      __int16 v47 = 2112;
      uint64_t v48 = v35;
      _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, %@, requires a valid spatial granularity", buf, 0x16u);
    }
    double v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    BOOL v44 = @"requires a valid spatial granularity;";
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v18 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v37];

    v8[2](v8, 0, v18);
  }

  _Block_object_dispose(v53, 8);
}

void __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B92730;
  id v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v15 = v8;
  id v16 = v6;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v17 = v12;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeFamiliarityIndexResultsForLearnedLocationsWithVisits:*(void *)(a1 + 40) options:*(void *)(a1 + 48) familiarPlaces:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) error:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

uint64_t __77__RTLearnedLocationManager__fetchFamiliarityIndexResultsWithOptions_handler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _computeFamiliarityIndexResultsForLearnedLocationsWithVisits:a2 options:*(void *)(a1 + 40) familiarPlaces:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:a3 handler:*(void *)(a1 + 48)];
}

- (void)_computeFamiliarityIndexResultsForLearnedLocationsWithVisits:(id)a3 options:(id)a4 familiarPlaces:(id)a5 error:(id)a6 handler:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v17 = (void (**)(id, void, void *))a7;
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v13 count];
    BOOL v20 = [v14 dateInterval];
    *(_DWORD *)long long buf = 134218754;
    uint64_t v47 = v19;
    __int16 v48 = 2112;
    uint64_t v49 = v20;
    __int16 v50 = 2112;
    uint64_t v51 = self;
    __int16 v52 = 2112;
    id v53 = v16;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "fetched %lu LOIs for visits in date interval, %@, for client, %@, error, %@", buf, 0x2Au);
  }
  if (!v16)
  {
    if (!v13)
    {
      id v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F5CFE8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v45 = @"LOIs are nil; not able to estimate familiarityIndex.";
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v27 = [v24 errorWithDomain:v25 code:0 userInfo:v26];

      v17[2](v17, 0, v27);
      goto LABEL_19;
    }
    uint64_t v21 = [v14 spatialGranularity];
    if (v21 == 3)
    {
      uint64_t v40 = 0;
      id v22 = (id *)&v40;
      uint64_t v23 = [(RTLearnedLocationManager *)self _getFamiliarityIndexResultsAreaLevelForLearnedLOIs:v13 options:v14 familiarPlaces:v15 outError:&v40];
    }
    else
    {
      if (v21 != 1)
      {
        dispatch_time_t v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = (objc_class *)objc_opt_class();
          id v38 = NSStringFromClass(v37);
          dispatch_time_t v39 = NSStringFromSelector(a2);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v47 = (uint64_t)v38;
          __int16 v48 = 2112;
          uint64_t v49 = v39;
          _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, we should never reach this code path", buf, 0x16u);
        }
        id v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F5CFF0];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        uint64_t v43 = @"requires a valid spatial granularity;";
        double v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v29 = [v34 errorWithDomain:v35 code:1 userInfo:v36];

        v17[2](v17, 0, v29);
        goto LABEL_18;
      }
      uint64_t v41 = 0;
      id v22 = (id *)&v41;
      uint64_t v23 = [(RTLearnedLocationManager *)self _getFamiliarityIndexResultsLOILevelForLOIs:v13 options:v14 outError:&v41];
    }
    double v28 = (void *)v23;
    id v29 = *v22;
    uint64_t v30 = [(RTLearnedLocationManager *)self _checkFamiliarityIndexResultsForErrors:v28];
    id v31 = [(RTLearnedLocationManager *)self _combineFamiliarityIndexRetrieveError:v29 resultsError:v30];
    if (v31) {
      dispatch_semaphore_t v32 = v31;
    }
    else {
      dispatch_semaphore_t v32 = 0;
    }
    ((void (**)(id, void *, void *))v17)[2](v17, v28, v32);

LABEL_18:
    goto LABEL_19;
  }
  v17[2](v17, 0, v16);
LABEL_19:
}

- (id)_getFamiliarityIndexResultsLOILevelForLOIs:(id)a3 options:(id)a4 outError:(id *)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v64 = objc_opt_new();
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v55 = objc_opt_new();
    id v9 = objc_opt_new();
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v8 lookbackInterval];
    uint64_t v12 = [v10 dateByAddingTimeInterval:-v11];

    id v13 = [v8 dateInterval];
    [v13 startDate];
    v15 = id v14 = v7;

    uint64_t v51 = (void *)v15;
    __int16 v52 = (void *)v12;
    uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v15];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v53 = v14;
    id obj = v14;
    uint64_t v59 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v59)
    {
      uint64_t v57 = v9;
      uint64_t v58 = *(void *)v75;
      uint64_t v66 = v8;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v75 != v58) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
        id v73 = 0;
        unint64_t v18 = [(RTLearnedLocationManager *)self _getTotalVisitsCountForLOI:v17 dateInterval:v60 outError:&v73];
        id v19 = v73;
        if (v19)
        {
          id v42 = v19;
          *a5 = v42;
          goto LABEL_28;
        }
        int v68 = v17;
        BOOL v20 = [v17 visits];
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
        uint64_t v81 = v21;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
        uint64_t v23 = [v20 sortedArrayUsingDescriptors:v22];

        id v24 = [v8 dateInterval];
        int v63 = (void *)v23;
        uint64_t v25 = [(RTLearnedLocationManager *)self _getLearnedVisits:v23 dateInterval:v24];

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (!v27) {
          break;
        }
        uint64_t v28 = v27;
        id v65 = v26;
        id v61 = v21;
        uint64_t v62 = v16;
        id v29 = 0;
        uint64_t v30 = *(void *)v70;
        double v31 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            dispatch_time_t v33 = self;
            id v34 = v29;
            if (*(void *)v70 != v30) {
              objc_enumerationMutation(v65);
            }
            uint64_t v35 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            double v36 = [v35 exitDate];
            uint64_t v37 = [v35 entryDate];
            [v36 timeIntervalSinceDate:v37];
            double v39 = v38;

            uint64_t v40 = [NSNumber numberWithUnsignedInteger:v18 + i + 1];
            [v67 setObject:v40 forKeyedSubscript:@"loiVisitCount"];

            self = v33;
            id v29 = [(RTLearnedLocationManager *)v33 _getFamiliarityIndexResultForLearnedVisit:v35 learnedLOI:v68 statsLOIVisits:v67];

            if (v29 && ([v66 referenceLocationSummary] & 1) == 0) {
              [v64 addObject:v29];
            }
            double v31 = v31 + v39;
          }
          uint64_t v28 = [v65 countByEnumeratingWithState:&v69 objects:v80 count:16];
          v18 += i;
        }
        while (v28);
        id v26 = v65;

        id v9 = v57;
        if (!v29)
        {
          id v8 = v66;
          uint64_t v16 = v62;
          uint64_t v21 = v61;
          goto LABEL_24;
        }
        id v8 = v66;
        uint64_t v16 = v62;
        uint64_t v21 = v61;
        if ([v66 referenceLocationSummary])
        {
          [v57 addObject:v29];
          uint64_t v41 = [NSNumber numberWithDouble:v31];
          [v55 addObject:v41];
LABEL_22:
        }
LABEL_24:

        if (++v16 == v59)
        {
          uint64_t v59 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
          if (v59) {
            goto LABEL_4;
          }
          goto LABEL_26;
        }
      }
      id v29 = 0;
      uint64_t v41 = v26;
      id v9 = v57;
      goto LABEL_22;
    }
LABEL_26:
    id v42 = 0;
LABEL_28:

    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v8 referenceLocationSummary])
    {
      if (![v9 count])
      {
LABEL_38:
        if (a5) {
          *a5 = v42;
        }

        id v7 = v53;
        goto LABEL_41;
      }
      id v44 = objc_alloc(MEMORY[0x1E4F5CDE0]);
      id v45 = [v8 dateInterval];
      [(RTLearnedLocationManager *)self _estimateFamiliarityIndexReferenceLocationSummary:v9 dwellTimePerAreas:v55];
      id v46 = [v44 initWithDateInterval:v45];

      [v43 addObject:v46];
    }
    else
    {
      id v46 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateInterval" ascending:1];
      uint64_t v79 = v46;
      __int16 v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      uint64_t v49 = [v64 sortedArrayUsingDescriptors:v48];

      id v43 = (id)v49;
    }

    goto LABEL_38;
  }
  uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lois", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"lois");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v43 = [MEMORY[0x1E4F1C978] array];
LABEL_41:

  return v43;
}

- (double)_estimateFamiliarityIndexReferenceLocationSummary:(id)a3 dwellTimePerAreas:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v12 = -1.0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v35 = "Invalid parameter not satisfying: familiarityIndexResultsPerAreas";
LABEL_25:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_34;
  }
  if (!v7)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v12 = -1.0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v35 = "Invalid parameter not satisfying: areasDwellTimes";
    goto LABEL_25;
  }
  uint64_t v9 = [v6 count];
  if (v9 == [v8 count])
  {
    if ([v6 count])
    {
      id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
      double v11 = [v8 valueForKeyPath:@"@sum.self"];
      [v11 doubleValue];
      double v12 = -1.0;
      if (v13 != 0.0)
      {
        double v38 = v8;
        double v39 = v6;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v14 = v8;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(v14);
              }
              BOOL v20 = NSNumber;
              [*(id *)(*((void *)&v44 + 1) + 8 * i) doubleValue:v38];
              double v22 = v21;
              [v11 doubleValue];
              id v24 = [v20 numberWithDouble:v22 / v23];
              [v10 insertObject:v24 atIndex:v17 + i];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
            v17 += i;
          }
          while (v16);
        }

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v6 = v39;
        id v25 = v39;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v41;
          double v29 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              [*(id *)(*((void *)&v40 + 1) + 8 * j) familiarityIndex:v38];
              double v32 = v31;
              dispatch_time_t v33 = [v10 objectAtIndex:0];
              [v33 doubleValue];
              double v29 = v29 + v32 * v34;
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v27);
        }
        else
        {
          double v29 = 0.0;
        }

        double v12 = v29 / (double)(unint64_t)[v25 count];
        id v8 = v38;
      }
      goto LABEL_33;
    }
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    double v12 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v51 = v11;
      double v36 = "%@, length of familiarityIndexResultsPerAreas cannot be 0 ";
      goto LABEL_30;
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    double v12 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v51 = v11;
      double v36 = "%@, length of familiarityIndexResultsPerAreas should be equal to areasDwellTimes ";
LABEL_30:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
LABEL_33:
    }
  }
LABEL_34:

  return v12;
}

- (id)_getFamiliarityIndexResultsAreaLevelForLearnedLOIs:(id)a3 options:(id)a4 familiarPlaces:(id)a5 outError:(id *)a6
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  double v12 = v10;
  id v115 = v11;
  id v116 = a5;
  if (!v10)
  {
    long long v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lois", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate(@"lois");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v41 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_59;
  }
  if (!a6)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v147 = "-[RTLearnedLocationManager _getFamiliarityIndexResultsAreaLevelForLearnedLOIs:options:familiarPlaces:outError:]";
      __int16 v148 = 1024;
      int v149 = 3680;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError (in %s:%d)", buf, 0x12u);
    }
  }
  v124 = a6;
  id v113 = objc_opt_new();
  id v120 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  [v115 lookbackInterval];
  uint64_t v17 = [v15 dateByAddingTimeInterval:-v16];

  uint64_t v18 = [v115 dateInterval];
  uint64_t v19 = [v18 startDate];

  uint64_t v98 = (void *)v19;
  uint64_t v99 = (void *)v17;
  id v100 = v12;
  id v101 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v17 endDate:v19];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id obj = v12;
  uint64_t v20 = [obj countByEnumeratingWithState:&v137 objects:v145 count:16];
  unint64_t v21 = 0x1E4F28000uLL;
  v105 = v14;
  long long v108 = self;
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v138;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v138 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        uint64_t v26 = [v25 location];
        uint64_t v27 = [v26 location];
        [v27 latitude];
        double v29 = v28;
        uint64_t v30 = [v25 location];
        double v31 = [v30 location];
        [v31 longitude];
        dispatch_time_t v33 = -[RTLearnedLocationManager _latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:](v108, "_latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:", -[RTLearnedLocationManager _getGeohashLengthForSpatialGranularity:](v108, "_getGeohashLengthForSpatialGranularity:", [v115 spatialGranularity]), v29, v32);

        id v136 = 0;
        uint64_t v34 = [(RTLearnedLocationManager *)v108 _getTotalVisitsCountForLOI:v25 dateInterval:v101 outError:&v136];
        id v35 = v136;
        if (v35)
        {
          id v97 = v35;
          id *v124 = v97;

          id v14 = v105;
          self = v108;
          unint64_t v21 = 0x1E4F28000;
          goto LABEL_25;
        }
        double v36 = [v105 objectForKey:v33];

        uint64_t v37 = NSNumber;
        if (v36)
        {
          double v38 = [v105 objectForKeyedSubscript:v33];
          double v39 = [v37 numberWithUnsignedInteger:v34 + [v38 unsignedIntValue]];
          [v105 setObject:v39 forKeyedSubscript:v33];
        }
        else
        {
          double v38 = [NSNumber numberWithUnsignedInteger:v34];
          [v105 setObject:v38 forKeyedSubscript:v33];
        }

        unint64_t v21 = 0x1E4F28000;
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v137 objects:v145 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    id v97 = 0;
    id v14 = v105;
    self = v108;
  }
  else
  {
    id v97 = 0;
  }
LABEL_25:

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v103 = objc_opt_new();
  id v102 = objc_opt_new();
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v104 = obj;
  uint64_t v107 = [v104 countByEnumeratingWithState:&v132 objects:v144 count:16];
  if (!v107) {
    goto LABEL_53;
  }
  uint64_t v106 = *(void *)v133;
  uint64_t v119 = v42;
  do
  {
    for (uint64_t j = 0; j != v107; uint64_t j = v89 + 1)
    {
      if (*(void *)v133 != v106) {
        objc_enumerationMutation(v104);
      }
      uint64_t v112 = j;
      long long v44 = *(void **)(*((void *)&v132 + 1) + 8 * j);
      long long v45 = [v44 visits];
      __int16 v110 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
      v143 = v110;
      long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
      id v111 = v45;
      uint64_t v47 = [v45 sortedArrayUsingDescriptors:v46];

      __int16 v48 = [v115 dateInterval];
      long long v109 = (void *)v47;
      uint64_t v49 = [(RTLearnedLocationManager *)v108 _getLearnedVisits:v47 dateInterval:v48];

      __int16 v50 = [v44 location];
      uint64_t v51 = [v50 location];
      [v51 latitude];
      double v53 = v52;
      v118 = v44;
      uint64_t v54 = [v44 location];
      id v55 = [v54 location];
      [v55 longitude];
      self = v108;
      uint64_t v57 = -[RTLearnedLocationManager _latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:](v108, "_latitudeLongitudeToGeohashHelperForLatitude:longitude:hashLength:", -[RTLearnedLocationManager _getGeohashLengthForSpatialGranularity:](v108, "_getGeohashLengthForSpatialGranularity:", [v115 spatialGranularity]), v53, v56);

      uint64_t v58 = (void *)v57;
      id v42 = v119;
      uint64_t v59 = [v119 objectForKey:v58];

      if (!v59)
      {
        id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v119 setObject:v60 forKeyedSubscript:v58];
      }
      id v61 = [v14 objectForKeyedSubscript:v58];
      [v120 setObject:v61 forKeyedSubscript:@"totalVisitsAreaLevelBeforeStartDate"];

      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v62 = v49;
      uint64_t v121 = [v62 countByEnumeratingWithState:&v128 objects:v142 count:16];
      id v114 = v62;
      if (!v121)
      {
        int v63 = 0;
        uint64_t v89 = v112;
LABEL_49:

        goto LABEL_51;
      }
      uint64_t v122 = 0;
      int v63 = 0;
      uint64_t v117 = *(void *)v129;
      double v64 = 0.0;
      do
      {
        for (uint64_t k = 0; k != v121; ++k)
        {
          uint64_t v125 = v63;
          if (*(void *)v129 != v117) {
            objc_enumerationMutation(v114);
          }
          uint64_t v66 = *(void **)(*((void *)&v128 + 1) + 8 * k);
          id v67 = [v66 exitDate];
          int v68 = [v66 entryDate];
          [v67 timeIntervalSinceDate:v68];
          double v70 = v69;

          long long v71 = [v66 entryDate];
          uint64_t v72 = [(RTLearnedLocationManager *)self _getDateOnlyFromLearnedVisitDate:v71];

          id v73 = [v42 objectForKeyedSubscript:v58];
          id obja = (id)v72;
          long long v74 = [v73 objectForKey:v72];

          long long v75 = *(void **)(v21 + 3792);
          long long v76 = [v42 objectForKeyedSubscript:v58];
          long long v77 = v76;
          uint64_t v123 = v66;
          if (v74)
          {
            id v78 = [v76 objectForKeyedSubscript:obja];
            uint64_t v79 = [v75 numberWithUnsignedInteger:v122 + k + [v78 integerValue] + 1];
            [v42 objectForKeyedSubscript:v58];
            uint64_t v81 = v80 = v58;
            [v81 setObject:v79 forKeyedSubscript:obja];
            id v82 = self;
            unint64_t v21 = 0x1E4F28000;
          }
          else
          {
            id v78 = [v66 entryDate];
            uint64_t v79 = [v75 numberWithUnsignedInteger:v122+ k+ -[RTLearnedLocationManager _getTotalVisitCountForPreviousDatesFromDictGeohashToDates:referenceDate:](self, "_getTotalVisitCountForPreviousDatesFromDictGeohashToDates:referenceDate:", v77, v78)+ 1];
            [v42 objectForKeyedSubscript:v58];
            uint64_t v81 = v80 = v58;
            [v81 setObject:v79 forKeyedSubscript:obja];
            id v82 = self;
          }

          uint64_t v83 = *(void **)(v21 + 3792);
          id v84 = [v42 objectForKeyedSubscript:v80];
          id v85 = [v84 objectForKeyedSubscript:obja];
          uint64_t v86 = [v85 integerValue];
          uint64_t v87 = [v120 objectForKeyedSubscript:@"totalVisitsAreaLevelBeforeStartDate"];
          uint64_t v88 = [v83 numberWithInteger:[v87 integerValue] + v86];
          [v120 setObject:v88 forKeyedSubscript:@"areaLevelVisitCount"];

          int v63 = [(RTLearnedLocationManager *)v82 _getFamiliarityIndexResultAreaLevelForLearnedVisit:v123 learnedLOI:v118 geohash:v80 familiarPlaces:v116 statsVisits:v120];

          self = v82;
          uint64_t v58 = v80;
          if (v63 && ([v115 referenceLocationSummary] & 1) == 0) {
            [v113 addObject:v63];
          }
          double v64 = v64 + v70;

          unint64_t v21 = 0x1E4F28000uLL;
          id v42 = v119;
        }
        uint64_t v121 = [v114 countByEnumeratingWithState:&v128 objects:v142 count:16];
        v122 += k;
      }
      while (v121);

      if (v63)
      {
        id v14 = v105;
        uint64_t v89 = v112;
        if (![v115 referenceLocationSummary]) {
          goto LABEL_51;
        }
        [v102 addObject:v63];
        id v62 = [NSNumber numberWithDouble:v64];
        [v103 addObject:v62];
        goto LABEL_49;
      }
      id v14 = v105;
      uint64_t v89 = v112;
LABEL_51:
    }
    uint64_t v107 = [v104 countByEnumeratingWithState:&v132 objects:v144 count:16];
  }
  while (v107);
LABEL_53:

  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v115 referenceLocationSummary])
  {
    uint64_t v90 = v102;
    if ([v102 count])
    {
      id v91 = objc_alloc(MEMORY[0x1E4F5CDE0]);
      int v92 = [v115 dateInterval];
      [(RTLearnedLocationManager *)self _estimateFamiliarityIndexReferenceLocationSummary:v102 dwellTimePerAreas:v103];
      uint64_t v93 = [v91 initWithDateInterval:v92 familiarityIndex:];

      [v41 addObject:v93];
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v93 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateInterval" ascending:1];
    v141 = v93;
    uint64_t v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
    uint64_t v95 = [v113 sortedArrayUsingDescriptors:v94];

    id v41 = (id)v95;
    uint64_t v90 = v102;
LABEL_57:
  }
  double v12 = v100;

LABEL_59:

  return v41;
}

- (id)_getFamiliarityIndexResultAreaLevelForLearnedVisit:(id)a3 learnedLOI:(id)a4 geohash:(id)a5 familiarPlaces:(id)a6 statsVisits:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = v16;
  if (!v13)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      uint64_t v19 = 0;
LABEL_12:

      goto LABEL_13;
    }
    LOWORD(v28) = 0;
    uint64_t v26 = "Invalid parameter not satisfying: learnedLOI";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v28, 2u);
    goto LABEL_11;
  }
  if (!v16)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v28) = 0;
    uint64_t v26 = "Invalid parameter not satisfying: statsVisits";
    goto LABEL_17;
  }
  [(RTLearnedLocationManager *)self _estimateFamiliarityIndexForAreaWithGeohash:v14 familiarPlaces:v15 visitedLearnedLOI:v13 statsVisits:v16];
  uint64_t v19 = 0;
  if (v18 >= 0.0)
  {
    double v20 = v18;
    if (v18 <= 1.0)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v22 = [v12 entryDate];
      uint64_t v23 = [v12 exitDate];
      id v24 = [v21 initWithStartDate:v22 endDate:v23];

      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F5CDE0]) initWithDateInterval:v24 familiarityIndex:v20];
      id v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412802;
        id v29 = v14;
        __int16 v30 = 2112;
        double v31 = v24;
        __int16 v32 = 2048;
        double v33 = v20;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "Area with geohash %@, for dateInterval %@, familiarityIndex %f", (uint8_t *)&v28, 0x20u);
      }

      goto LABEL_12;
    }
  }
LABEL_13:

  return v19;
}

- (double)_estimateFamiliarityIndexForAreaWithGeohash:(id)a3 familiarPlaces:(id)a4 visitedLearnedLOI:(id)a5 statsVisits:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!v12)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

LABEL_14:
      double v18 = -1.0;
      goto LABEL_15;
    }
    LOWORD(v34) = 0;
    int v28 = "Invalid parameter not satisfying: visitedLearnedLOI";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v34, 2u);
    goto LABEL_10;
  }
  if (!v13)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(v34) = 0;
    int v28 = "Invalid parameter not satisfying: statsVisits";
    goto LABEL_17;
  }
  id v15 = [v13 objectForKeyedSubscript:@"areaLevelVisitCount"];
  [v15 doubleValue];
  double v17 = v16;

  if (v17 <= 0.0)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      double v31 = (objc_class *)objc_opt_class();
      __int16 v32 = NSStringFromClass(v31);
      double v33 = NSStringFromSelector(a2);
      int v34 = 138412546;
      id v35 = v32;
      __int16 v36 = 2112;
      uint64_t v37 = v33;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, %@, Invalid data in the statsVisits dictionary", (uint8_t *)&v34, 0x16u);
    }
    goto LABEL_14;
  }
  double v18 = 1.0;
  if (([v11 containsObject:v10] & 1) == 0)
  {
    uint64_t v19 = [v14 objectForKeyedSubscript:@"areaLevelVisitCount"];
    [v19 doubleValue];
    double v21 = v20;

    double v18 = 0.0;
    if (v21 != 1.0)
    {
      uint64_t v22 = [v14 objectForKeyedSubscript:@"areaLevelVisitCount"];
      [v22 doubleValue];
      double v24 = v23;
      id v25 = [v14 objectForKeyedSubscript:@"areaLevelVisitCount"];
      [v25 doubleValue];
      double v18 = v24 / (v26 + 10.0);
    }
  }
LABEL_15:

  return v18;
}

- (id)_getFamiliarityIndexResultForLearnedVisit:(id)a3 learnedLOI:(id)a4 statsLOIVisits:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v15 = 0;
      goto LABEL_15;
    }
    LOWORD(v25) = 0;
    double v17 = "Invalid parameter not satisfying: learnedLOI";
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v25, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v25) = 0;
    double v17 = "Invalid parameter not satisfying: statsLOIVisits";
    goto LABEL_20;
  }
  [(RTLearnedLocationManager *)self _estimateFamiliarityIndexForLearnedLOI:v9 statsLOIVisits:v10];
  double v13 = v12;
  if (v12 < 0.0 || v12 > 1.0)
  {
    id v15 = 0;
    goto LABEL_16;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v19 = [v8 entryDate];
  double v20 = [v8 exitDate];
  double v16 = [v18 initWithStartDate:v19 endDate:v20];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F5CDE0]) initWithDateInterval:v16 familiarityIndex:v13];
  double v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v9 place];
    double v23 = [v22 identifier];
    int v25 = 138412546;
    double v26 = v23;
    __int16 v27 = 2112;
    int v28 = v15;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "LOI %@ familiarityIndex %@", (uint8_t *)&v25, 0x16u);
  }
LABEL_15:

LABEL_16:

  return v15;
}

- (double)_estimateFamiliarityIndexForLearnedLOI:(id)a3 statsLOIVisits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      double v11 = -1.0;
      goto LABEL_14;
    }
    __int16 v30 = 0;
    double v16 = "Invalid parameter not satisfying: learnedLOI";
    double v17 = (uint8_t *)&v30;
LABEL_19:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_13;
  }
  if (!v6)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v29 = 0;
    double v16 = "Invalid parameter not satisfying: statsLOIVisits";
    double v17 = (uint8_t *)&v29;
    goto LABEL_19;
  }
  id v8 = [v6 objectForKeyedSubscript:@"loiVisitCount"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = -1.0;
  if (v10 > 0.0)
  {
    double v12 = [v5 place];
    if ([v12 type] == 1)
    {
LABEL_9:

      double v11 = 1.0;
      goto LABEL_14;
    }
    double v13 = [v5 place];
    if ([v13 type] == 2)
    {
LABEL_8:

      goto LABEL_9;
    }
    id v14 = [v5 place];
    if ([v14 type] == 4)
    {

      goto LABEL_8;
    }
    uint64_t v19 = [v5 place];
    uint64_t v20 = [v19 type];

    double v11 = 1.0;
    if (v20 != 3)
    {
      double v21 = [v7 objectForKeyedSubscript:@"loiVisitCount"];
      [v21 doubleValue];
      double v23 = v22;

      double v11 = 0.0;
      if (v23 != 1.0)
      {
        double v24 = [v7 objectForKeyedSubscript:@"loiVisitCount"];
        [v24 doubleValue];
        double v26 = v25;
        __int16 v27 = [v7 objectForKeyedSubscript:@"loiVisitCount"];
        [v27 doubleValue];
        double v11 = v26 / (v28 + 1.0);
      }
    }
  }
LABEL_14:

  return v11;
}

- (unint64_t)_getTotalVisitsCountForLOI:(id)a3 dateInterval:(id)a4 outError:(id *)a5
{
  aSelector = a2;
  v59[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v55 = 136315394;
      *(void *)&v55[4] = "-[RTLearnedLocationManager _getTotalVisitsCountForLOI:dateInterval:outError:]";
      *(_WORD *)&v55[12] = 1024;
      *(_DWORD *)&v55[14] = 3897;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loi (in %s:%d)", v55, 0x12u);
    }
  }
  if (v7)
  {
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    *(void *)id v55 = 0;
    *(void *)&v55[8] = v55;
    *(void *)&v55[16] = 0x3032000000;
    double v56 = __Block_byref_object_copy__17;
    uint64_t v57 = __Block_byref_object_dispose__17;
    id v58 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    double v10 = [(RTLearnedLocationManager *)self learnedLocationStore];
    double v11 = [v6 identifier];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __77__RTLearnedLocationManager__getTotalVisitsCountForLOI_dateInterval_outError___block_invoke;
    v42[3] = &unk_1E6B908E0;
    long long v44 = &v46;
    long long v45 = v55;
    double v12 = v9;
    long long v43 = v12;
    [v10 fetchCountOfVisitsToLocationOfInterestWithIdentifier:v11 dateInterval:v7 handler:v42];

    double v13 = v12;
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15)) {
      goto LABEL_11;
    }
    double v16 = [MEMORY[0x1E4F1C9C8] now:aSelector];
    [v16 timeIntervalSinceDate:v14];
    double v18 = v17;
    uint64_t v19 = objc_opt_new();
    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
    double v21 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v22 = [v21 filteredArrayUsingPredicate:v20];
    double v23 = [v22 firstObject];

    [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
    double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v25 = (void *)MEMORY[0x1E4F28C58];
    v59[0] = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v59 count:1];
    __int16 v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;

      char v29 = 0;
    }
    else
    {
LABEL_11:
      id v28 = 0;
      char v29 = 1;
    }

    id v30 = v28;
    if ((v29 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v55[8] + 40), v28);
    }
    if (a5 && *(void *)(*(void *)&v55[8] + 40))
    {
      double v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = NSStringFromSelector(aSelector);
        uint64_t v38 = *(void *)(*(void *)&v55[8] + 40);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v51 = 2112;
        double v52 = v37;
        __int16 v53 = 2112;
        uint64_t v54 = v38;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      unint64_t v32 = 0;
      *a5 = *(id *)(*(void *)&v55[8] + 40);
    }
    else
    {
      unint64_t v32 = v47[3];
    }

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    double v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v55 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v55, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      unint64_t v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v32 = 0;
    }
  }

  return v32;
}

void __77__RTLearnedLocationManager__getTotalVisitsCountForLOI_dateInterval_outError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_getGeohashLengthForSpatialGranularity:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 3) {
    return 4;
  }
  if (a3 != 2)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(a2);
      int v9 = 138412546;
      double v10 = v7;
      __int16 v11 = 2112;
      double v12 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, %@,currently only LargeArea is supported, this code path shouldn't be reached", (uint8_t *)&v9, 0x16u);
    }
  }
  return 3;
}

- (id)_getAreasGeohashesFamiliarPlacesWithGranularity:(unint64_t)a3 outError:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v35 = [MEMORY[0x1E4F1CA48] array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v41 = [&unk_1F34529D0 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v64;
    uint64_t v36 = *MEMORY[0x1E4F5CFE8];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v64 != v38) {
          objc_enumerationMutation(&unk_1F34529D0);
        }
        id v6 = *(void **)(*((void *)&v63 + 1) + 8 * v5);
        dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
        uint64_t v57 = 0;
        id v58 = &v57;
        uint64_t v59 = 0x3032000000;
        id v60 = __Block_byref_object_copy__17;
        id v61 = __Block_byref_object_dispose__17;
        id v62 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v51 = 0;
        double v52 = (id *)&v51;
        uint64_t v53 = 0x3032000000;
        uint64_t v54 = __Block_byref_object_copy__17;
        id v55 = __Block_byref_object_dispose__17;
        id v56 = 0;
        id v8 = [(RTLearnedLocationManager *)self learnedLocationStore];
        uint64_t v9 = [v6 unsignedIntegerValue];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke;
        void v46[3] = &unk_1E6B927A8;
        v46[4] = self;
        uint64_t v48 = &v57;
        uint64_t v49 = &v51;
        SEL v50 = a2;
        double v10 = v7;
        uint64_t v47 = v10;
        [v8 fetchLocationsOfInterestWithPlaceType:v9 handler:v46];

        __int16 v11 = v10;
        double v12 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v13 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v11, v13)) {
          goto LABEL_11;
        }
        id v14 = [MEMORY[0x1E4F1C9C8] now];
        [v14 timeIntervalSinceDate:v12];
        double v16 = v15;
        double v17 = objc_opt_new();
        double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_581];
        uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];
        double v21 = [v20 firstObject];

        [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
        double v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        double v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v68 = v37;
        *(void *)long long buf = @"semaphore wait timeout";
        double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v68 count:1];
        double v25 = [v23 errorWithDomain:v36 code:15 userInfo:v24];

        if (v25)
        {
          id v26 = v25;

          char v27 = 0;
        }
        else
        {
LABEL_11:
          id v26 = 0;
          char v27 = 1;
        }

        id v28 = v26;
        if ((v27 & 1) == 0) {
          objc_storeStrong(v52 + 5, v26);
        }
        id v29 = v52[5];
        if (v29)
        {
          if (a4) {
            *a4 = v29;
          }
        }
        else if (v58[5])
        {
          [v35 addObjectsFromArray:];
        }

        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v57, 8);

        if (v29)
        {
          id v31 = 0;
          goto LABEL_24;
        }
        ++v5;
      }
      while (v41 != v5);
      uint64_t v41 = [&unk_1F34529D0 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_291;
  v42[3] = &unk_1E6B927D0;
  id v30 = v34;
  id v43 = v30;
  long long v44 = self;
  unint64_t v45 = a3;
  [v35 enumerateObjectsUsingBlock:v42];
  id v31 = v30;

LABEL_24:

  return v31;
}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    double v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)long long buf = 138412802;
    double v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = [v5 count];
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store", buf, 0x20u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_289;
  v16[3] = &unk_1E6B92780;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 48);
  void v16[4] = *(void *)(a1 + 32);
  void v16[5] = v12;
  v16[6] = v11;
  [v5 enumerateObjectsUsingBlock:v16];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_289(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    dispatch_semaphore_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v12 = 138413058;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = a3 + 1;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location of interest %lu, %@", (uint8_t *)&v12, 0x2Au);
  }
  double v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v11 = [v5 place];
  [v10 addObject:v11];
}

void __85__RTLearnedLocationManager__getAreasGeohashesFamiliarPlacesWithGranularity_outError___block_invoke_291(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v13 = [v5 mapItem];
  id v6 = [v13 location];
  [v6 latitude];
  double v8 = v7;
  uint64_t v9 = [v5 mapItem];

  double v10 = [v9 location];
  [v10 longitude];
  int v12 = [v4 _latitudeLongitudeToGeohashHelperForLatitude:objc_msgSend(*(id *)(a1 + 40), "_getGeohashLengthForSpatialGranularity:", *(void *)(a1 + 48)) longitude:v8 hashLength:v11];
  [v3 addObject:v12];
}

- (id)_getDateOnlyFromLearnedVisitDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v5 = [v4 components:28 fromDate:v3];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v6 setDay:[v5 day]];
    [v6 setMonth:[v5 month]];
    [v6 setYear:[v5 year]];
    double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v8 = [v7 dateFromComponents:v6];
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisitDate", v11, 2u);
    }

    double v8 = 0;
  }

  return v8;
}

- (id)_checkFamiliarityIndexResultsForErrors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) familiarityIndex:v21];
          if (v10 == -1.0) {
            ++v7;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }

    if (v7 == [v4 count])
    {
      double v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFF0];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v28 = @"All familiarity index results are invalid and equal to -1;";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      __int16 v14 = v11;
      uint64_t v15 = v12;
      uint64_t v16 = 2;
LABEL_18:
      id v19 = [v14 errorWithDomain:v15 code:v16 userInfo:v13];

      goto LABEL_20;
    }
    if (v7 && v7 < [v4 count])
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFF0];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v26 = @"Some familiarity index results are invalid and equal to -1; others are valid";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      __int16 v14 = v17;
      uint64_t v15 = v18;
      uint64_t v16 = 3;
      goto LABEL_18;
    }
  }
  id v19 = 0;
LABEL_20:

  return v19;
}

- (id)_combineFamiliarityIndexRetrieveError:(id)a3 resultsError:(id)a4
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F5CFE8];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v19[0] = @"Multiple errors occurred.";
    uint64_t v11 = *MEMORY[0x1E4F5CFE0];
    v18[0] = v10;
    v18[1] = v11;
    v17[0] = v5;
    v17[1] = v6;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v19[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    __int16 v14 = [v8 errorWithDomain:v9 code:9 userInfo:v13];

    goto LABEL_9;
  }
  if (v6)
  {
    id v15 = v6;
LABEL_8:
    __int16 v14 = v15;
    goto LABEL_9;
  }
  if (v5)
  {
    id v15 = v5;
    goto LABEL_8;
  }
  __int16 v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)_getTotalVisitCountForPreviousDatesFromDictGeohashToDates:(id)a3 referenceDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    double v11 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 isOnOrBefore:v6])
        {
          [v13 timeIntervalSinceDate:v6];
          if (v14 >= 0.0) {
            double v15 = v14;
          }
          else {
            double v15 = -v14;
          }
          if (v15 < v11)
          {
            uint64_t v16 = [v5 objectForKeyedSubscript:v13];
            unint64_t v9 = [v16 integerValue];

            double v11 = v15;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_latitudeLongitudeToGeohashHelperForLatitude:(double)a3 longitude:(double)a4 hashLength:(unint64_t)a5
{
  unint64_t v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a5 > 0xC)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134217984;
      unint64_t v26 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Geohash length is too big (%lu), maximum is 12", (uint8_t *)&v25, 0xCu);
    }

LABEL_25:
    long long v22 = 0;
    goto LABEL_26;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 1 << (5 * a5 - 1);
  double v9 = -90.0;
  double v10 = 90.0;
  double v11 = -180.0;
  double v12 = 180.0;
  do
  {
    double v13 = v11 + (v12 - v11) * 0.5;
    if (v13 <= a4) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0;
    }
    v7 |= v14;
    if (v8 == 1) {
      break;
    }
    if (v13 <= a4) {
      double v11 = v11 + (v12 - v11) * 0.5;
    }
    else {
      double v12 = v11 + (v12 - v11) * 0.5;
    }
    unint64_t v15 = v8 >> 1;
    if (v9 + (v10 - v9) * 0.5 > a3)
    {
      double v10 = v9 + (v10 - v9) * 0.5;
      unint64_t v15 = 0;
    }
    else
    {
      double v9 = v9 + (v10 - v9) * 0.5;
    }
    v7 |= v15;
    BOOL v16 = v8 > 3;
    v8 >>= 2;
  }
  while (v16);
  unint64_t v17 = a5 + 1;
  long long v18 = malloc_type_malloc(a5 + 1, 0x529AE8D2uLL);
  if (!v18)
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134217984;
      unint64_t v26 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the geohash", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_25;
  }
  long long v19 = v18;
  bzero(v18, v5 + 1);
  if (v5)
  {
    uint64_t v20 = 5 * v5 - 5;
    long long v21 = v19;
    do
    {
      *v21++ = a0123456789bcde[(v7 >> v20) & 0x1F];
      v20 -= 5;
      --v5;
    }
    while (v5);
  }
  long long v22 = (void *)[[NSString alloc] initWithCString:v19 encoding:4];
  free(v19);
LABEL_26:

  return v22;
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    double v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__RTLearnedLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    double v13 = v8;
    unint64_t v14 = self;
    id v15 = v9;
    unint64_t v16 = a4;
    dispatch_async(v10, v12);

    double v11 = v13;
  }
  else
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __77__RTLearnedLocationManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v24;
    double v10 = &v23;
LABEL_9:
    double v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    double v12 = v6;
    uint64_t v13 = v7;
    uint64_t v14 = 7;
LABEL_11:
    unint64_t v17 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  id v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    long long v22 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v22;
    double v10 = &v21;
    goto LABEL_9;
  }
  if (([*(id *)(a1 + 40) available] & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5CFE8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"store is not available";
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    double v12 = v15;
    uint64_t v13 = v16;
    uint64_t v14 = 5;
    goto LABEL_11;
  }
  id v18 = [*(id *)(a1 + 40) learnedLocationStore];
  [v18 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)flushToCacheWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    double v12 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, options, %@", buf, 0x20u);
  }
  if ([v7 hasMask:4])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __60__RTLearnedLocationManager_flushToCacheWithOptions_handler___block_invoke;
    v13[3] = &unk_1E6B90C18;
    id v14 = v8;
    [(RTLearnedLocationManager *)self trainForReason:3 mode:1 handler:v13];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __60__RTLearnedLocationManager_flushToCacheWithOptions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTLearnedLocationEngine)learnedLocationEngine
{
  return self->_learnedLocationEngine;
}

- (void)setLearnedLocationEngine:(id)a3
{
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (BOOL)migrationComplete
{
  return self->_migrationComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationEngine, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end