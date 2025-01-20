@interface RTLearnedLocationStore
+ (id)filterLocationsOfInterests:(id)a3;
+ (id)filterPlaces:(id)a3;
- (BOOL)_processDeletionRequestWithFetchRequest:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)_updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)_updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 visitsUpdated:(unint64_t *)a6 error:(id *)a7;
- (BOOL)cloudStoreChangedSinceDate:(id)a3;
- (BOOL)deletePlacesWithinIdentifierSet:(id)a3 tombstoneContext:(id)a4 error:(id *)a5;
- (BOOL)deletePlacesWithinIdentifierSetWithZeroVisits:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6;
- (BOOL)deleteTransitionsReferencingVisitIdentifiers:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6;
- (BOOL)deleteVisitsUsingCloudFetchRequest:(id)a3 localFetchRequest:(id)a4 context:(id)a5 tombstoneContext:(id)a6 error:(id *)a7;
- (BOOL)placeTypeForMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)init;
- (RTLearnedLocationStore)initWithDistanceCalculator:(id)a3 expirationEnforcer:(id)a4 mirroringManager:(id)a5;
- (RTLearnedLocationStore)initWithDistanceCalculator:(id)a3 expirationEnforcer:(id)a4 mirroringManager:(id)a5 persistenceManager:(id)a6;
- (RTPersistenceExpirationEnforcer)expirationEnforcer;
- (RTPersistenceMirroringManager)mirroringManager;
- (id)_learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:(id)a3 context:(id)a4;
- (id)_sortLocationsOfInterest:(id)a3;
- (id)_unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:(id)a3 allowThresholdBypass:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (id)createFetchRequestForOverlappingVisits:(id)a3 entityName:(id)a4 entryDatePropertyName:(id)a5 exitDatePropertyName:(id)a6 context:(id)a7 error:(id *)a8;
- (id)fetchRequestFromLocationOfInterestOptions:(id)a3;
- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchVisitIdentifiersUsingFetchRequest:(id)a3 context:(id)a4 error:(id *)a5;
- (id)groupCloudManagedObjectsByDeviceIdentifier:(id)a3;
- (id)identifiersForPlacesThatDedupeToPlace:(id)a3 context:(id)a4 error:(id *)a5;
- (id)identifiersForPlacesThatOwnVisitIdentifiers:(id)a3 context:(id)a4 error:(id *)a5;
- (id)migrateLegacyMapItemsWithEnumerationBlock:(id)a3;
- (id)predicateForCompleteVisits;
- (id)predicateForObjectsFromCurrentDevice;
- (id)predicateForObjectsNotFromCurrentDevice;
- (id)predicateForVisitsFromEntryDate:(id)a3 exitDate:(id)a4;
- (id)predicateForVisitsWithinDistance:(double)a3 location:(id)a4;
- (id)refreshMapItemsWithEnumerationBlock:(id)a3;
- (void)__removeUnreferencedAddresses:(id)a3;
- (void)__removeUnreferencedExtendedAttributes:(id)a3;
- (void)__removeUnreferencedMapItems:(id)a3;
- (void)_associatePlacesToVisits:(id)a3 handler:(id)a4;
- (void)_clearWithHandler:(id)a3;
- (void)_expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)_extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)_fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5;
- (void)_fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5;
- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3;
- (void)_fetchEntityAsDictionaryWithEntityName:(id)a3 propertiesToFetch:(id)a4 handler:(id)a5;
- (void)_fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4;
- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchLastVisitWithHandler:(id)a3;
- (void)_fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchLocationOfInterestVisitedFirstWithHandler:(id)a3;
- (void)_fetchLocationOfInterestVisitedLastWithHandler:(id)a3;
- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4;
- (void)_fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4;
- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 includePlaceholders:(BOOL)a5 handler:(id)a6;
- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4;
- (void)_fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5;
- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5;
- (void)_fetchMetricsWithHandler:(id)a3;
- (void)_fetchPlaceOfVisit:(id)a3 handler:(id)a4;
- (void)_fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4;
- (void)_fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5;
- (void)_fetchPlacesWithPredicate:(id)a3 handler:(id)a4;
- (void)_fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5;
- (void)_fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6;
- (void)_fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5;
- (void)_fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4;
- (void)_fetchVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)_fetchVisitsPredating:(id)a3 handler:(id)a4;
- (void)_fetchVisitsToPlace:(id)a3 handler:(id)a4;
- (void)_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3;
- (void)_fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 limit:(id)a5 handler:(id)a6;
- (void)_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4;
- (void)_logCloudStoreWithReason:(id)a3 handler:(id)a4;
- (void)_logLocalStoreWithReason:(id)a3 handler:(id)a4;
- (void)_migrateLegacyMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4;
- (void)_moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 context:(id)a6 handler:(id)a7;
- (void)_refreshMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4;
- (void)_removeAllMapItems:(id)a3;
- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)_removeLocationsOfInterestWithHandler:(id)a3;
- (void)_removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4;
- (void)_removePlace:(id)a3 handler:(id)a4;
- (void)_removePlacesForLocationOfInterest:(id)a3 handler:(id)a4;
- (void)_removePlacesWithHandler:(id)a3;
- (void)_removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4;
- (void)_removeTransitionsReferencingVisits:(id)a3 handler:(id)a4;
- (void)_removeTransitionsWithHandler:(id)a3;
- (void)_removeUnreferencedMapItems:(id)a3;
- (void)_removeUnreferencedPlacesWithHandler:(id)a3;
- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)_removeVisits:(id)a3 handler:(id)a4;
- (void)_removeVisitsWithHandler:(id)a3;
- (void)_replaceWithLocationsOfInterest:(id)a3 handler:(id)a4;
- (void)_storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6;
- (void)_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6;
- (void)_updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)_updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5;
- (void)_updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5;
- (void)_updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6;
- (void)associatePlacesToVisits:(id)a3 handler:(id)a4;
- (void)clearWithHandler:(id)a3;
- (void)enumerateStoredLocationsOfInterestWithOptions:(id)a3 enumerationBlock:(id)a4;
- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)fetchAllLocationsOfInterestWithHandler:(id)a3;
- (void)fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5;
- (void)fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5;
- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3;
- (void)fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4;
- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4;
- (void)fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchLastVisitWithHandler:(id)a3;
- (void)fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchLocationOfInterestVisitedFirstWithHandler:(id)a3;
- (void)fetchLocationOfInterestVisitedLastWithHandler:(id)a3;
- (void)fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4;
- (void)fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4;
- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5;
- (void)fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5;
- (void)fetchMetricsWithHandler:(id)a3;
- (void)fetchPlaceOfVisit:(id)a3 handler:(id)a4;
- (void)fetchPlaceWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5;
- (void)fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4;
- (void)fetchPlacesWithHandler:(id)a3;
- (void)fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4;
- (void)fetchPlacesWithMapItem:(id)a3 handler:(id)a4;
- (void)fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5;
- (void)fetchPlacesWithPredicate:(id)a3 handler:(id)a4;
- (void)fetchPlacesWithType:(unint64_t)a3 handler:(id)a4;
- (void)fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5;
- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 handler:(id)a5;
- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6;
- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3;
- (void)fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5;
- (void)fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4;
- (void)fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4;
- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchTransitionsWithHandler:(id)a3;
- (void)fetchVisitIdentifiersIn:(id)a3 handler:(id)a4;
- (void)fetchVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchVisitsPredating:(id)a3 handler:(id)a4;
- (void)fetchVisitsToPlace:(id)a3 handler:(id)a4;
- (void)fetchVisitsWithDevice:(id)a3 dateInterval:(id)a4 handler:(id)a5;
- (void)fetchVisitsWithHandler:(id)a3;
- (void)fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3;
- (void)fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(id)a6 handler:(id)a7;
- (void)fetchVisitsWithPredicate:(id)a3 handler:(id)a4;
- (void)fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4;
- (void)logCloudStoreWithReason:(id)a3 handler:(id)a4;
- (void)logLocalStoreWithReason:(id)a3 handler:(id)a4;
- (void)removeAllMapItems:(id)a3;
- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4;
- (void)removePlace:(id)a3 handler:(id)a4;
- (void)removePlacesForLocationOfInterest:(id)a3 handler:(id)a4;
- (void)removePlacesWithHandler:(id)a3;
- (void)removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4;
- (void)removeTransitionsReferencingVisits:(id)a3 handler:(id)a4;
- (void)removeTransitionsWithHandler:(id)a3;
- (void)removeUnreferencedMapItems:(id)a3;
- (void)removeUnreferencedPlacesWithHandler:(id)a3;
- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeVisits:(id)a3 handler:(id)a4;
- (void)removeVisitsWithHandler:(id)a3;
- (void)replaceWithLocationsOfInterest:(id)a3 handler:(id)a4;
- (void)setDistanceCalculator:(id)a3;
- (void)setExpirationEnforcer:(id)a3;
- (void)setMirroringManager:(id)a3;
- (void)storeLocationsOfInterest:(id)a3 handler:(id)a4;
- (void)storePlaces:(id)a3 handler:(id)a4;
- (void)storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6;
- (void)storeVisits:(id)a3 place:(id)a4 handler:(id)a5;
- (void)submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers:(id)a3 context:(id)a4;
- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6;
- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5;
- (void)updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5;
- (void)updateLocationsOfInterest:(id)a3 handler:(id)a4;
- (void)updatePlaces:(id)a3 handler:(id)a4;
- (void)updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5;
- (void)updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6;
@end

@implementation RTLearnedLocationStore

uint64_t __72__RTLearnedLocationStore_fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestWithPlaceType:*(void *)(a1 + 48) handler:*(void *)(a1 + 40)];
}

uint64_t __82__RTLearnedLocationStore_fetchLocationsOfInterestWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestWithinDistance:*(void *)(a1 + 40) location:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

uint64_t __69__RTLearnedLocationStore_fetchLocationOfInterestWithMapItem_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestWithMapItem:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __68__RTLearnedLocationStore_fetchRecentLocationsOfInterestWithHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 _fetchLocationsOfInterestVisitedBetweenStartDate:v3 endDate:v4 includePlaceholders:1 handler:a1[6]];
}

void __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = *(void **)(a1 + 32);
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == -1) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K >= %@ and $v.%K <= %@).@count > 0", @"visits", @"entryDate", *(void *)(a1 + 40), @"exitDate", *(void *)(a1 + 32)];
  }
  else {
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K >= %@).@count > 0", @"visits", @"entryDate", *(void *)(a1 + 40), v23, v24];
  }
  [v4 setPredicate:v8];

  if (*(unsigned char *)(a1 + 64))
  {
    v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.@count == 0", @"visits"];
    v10 = (void *)MEMORY[0x1E4F28BA0];
    v36[0] = v9;
    v11 = [v4 predicate];
    v36[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v13 = [v10 orPredicateWithSubpredicates:v12];
    [v4 setPredicate:v13];
  }
  id v27 = 0;
  v14 = [v3 executeFetchRequest:v4 error:&v27];
  id v15 = v27;
  v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v21 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v22 = [v14 count];
    *(_DWORD *)buf = 138413058;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    id v35 = v15;
    _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 32)];
    v19 = [[_RTMap alloc] initWithInput:v14];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_324;
    v25[3] = &unk_1E6B96678;
    id v26 = v18;
    id v20 = v18;
    v17 = [(_RTMap *)v19 withBlock:v25];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v7 = [v5 predicateWithFormat:@"%K == %@", @"placeType", v6];
  [v4 setPredicate:v7];

  id v15 = 0;
  v8 = [v3 executeFetchRequest:v4 error:&v15];
  id v9 = v15;
  v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v14 = [v8 count];
    *(_DWORD *)buf = 138413058;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v11 = [*(id *)(a1 + 32) _learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:v8 context:v3];
  }
  v12 = [*(id *)(a1 + 32) _sortLocationsOfInterest:v11];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke(uint64_t a1, void *a2)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  v25 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
  [v25 setReturnsObjectsAsFaults:0];
  [*(id *)(a1 + 32) latitude];
  [*(id *)(a1 + 32) longitude];
  uint64_t v27 = a1;
  RTCommonCalculateBoundingBox();
  id v23 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v24 = [NSNumber numberWithDouble:0.0];
  id v4 = [v3 predicateWithFormat:@"%@ <= %K", v24, @"locationLongitude"];
  v37[0] = v4;
  v5 = (void *)MEMORY[0x1E4F28F60];
  v6 = [NSNumber numberWithDouble:0.0];
  uint64_t v7 = [v5 predicateWithFormat:@"%K <= %@", @"locationLongitude", v6];
  v37[1] = v7;
  v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [NSNumber numberWithDouble:0.0];
  v10 = [v8 predicateWithFormat:@"%@ <= %K", v9, @"locationLatitude"];
  v37[2] = v10;
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = [NSNumber numberWithDouble:0.0];
  v13 = [v11 predicateWithFormat:@"%K <= %@", @"locationLatitude", v12];
  v37[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  id v15 = [v23 andPredicateWithSubpredicates:v14];
  [v25 setPredicate:v15];

  memset(v28, 0, sizeof(v28));
  v16 = [v26 executeFetchRequest:v25 error:v28];
  id v17 = v28[0];
  __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = NSStringFromSelector(*(SEL *)(v27 + 64));
    uint64_t v22 = [v16 count];
    *(_DWORD *)buf = 138413058;
    __int16 v30 = v21;
    __int16 v31 = 2112;
    __int16 v32 = v25;
    __int16 v33 = 2048;
    uint64_t v34 = v22;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v17)
  {
    v19 = 0;
    uint64_t v20 = v27;
  }
  else
  {
    uint64_t v20 = v27;
    v19 = [*(id *)(v27 + 40) _learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:v16 context:v26];
  }
  (*(void (**)(void))(*(void *)(v20 + 48) + 16))();
}

- (id)_learnedLocationsOfInterestFromLearnedLocationsOfInterestMO:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__69;
  v16 = __Block_byref_object_dispose__69;
  id v17 = 0;
  if ([v5 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__RTLearnedLocationStore__learnedLocationsOfInterestFromLearnedLocationsOfInterestMO_context___block_invoke;
    v9[3] = &unk_1E6B93860;
    v11 = &v12;
    id v10 = v5;
    [v6 performBlockAndWait:v9];
    id v7 = (id)v13[5];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_sortLocationsOfInterest:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_310];
  id v4 = [v3 reverseObjectEnumerator];
  id v5 = [v4 allObjects];

  return v5;
}

- (void)_fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 includePlaceholders:(BOOL)a5 handler:(id)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if (v11 && v12)
    {
      if ([v11 compare:v12] == 1)
      {
        uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = [v11 stringFromDate];
          v25 = [v12 stringFromDate];
          *(_DWORD *)buf = 138413058;
          v37 = v24;
          __int16 v38 = 2112;
          __int16 v40 = 2080;
          v39 = v25;
          v41 = "-[RTLearnedLocationStore _fetchLocationsOfInterestVisitedBetweenStartDate:endDate:includePlaceholders:handler:]";
          __int16 v42 = 1024;
          int v43 = 3390;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "startDate, %@, postdates endDate, %@ (in %s:%d)", buf, 0x26u);
        }
      }
      if ([v11 compare:v12] != 1)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke;
        v28[3] = &unk_1E6B965E0;
        id v29 = v12;
        BOOL v33 = a5;
        id v30 = v11;
        SEL v32 = a2;
        id v22 = v13;
        id v31 = v22;
        id v23 = (void *)MEMORY[0x1E016DB00](v28);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_2;
        v26[3] = &unk_1E6B90C18;
        id v27 = v22;
        [(RTStore *)self _performBlock:v23 contextType:1 errorHandler:v26];

        uint64_t v20 = v29;
        goto LABEL_13;
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      __int16 v35 = @"requires well ordered dates.";
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v18 = &v35;
      v19 = &v34;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = @"requires valid dates.";
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v18 = (__CFString **)v45;
      v19 = &v44;
    }
    uint64_t v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    uint64_t v21 = [v15 errorWithDomain:v16 code:0 userInfo:v20];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v21);

LABEL_13:
  }
}

- (void)_fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
    v13[3] = &unk_1E6B96570;
    unint64_t v15 = a3;
    SEL v16 = a2;
    v13[4] = self;
    id v9 = v7;
    id v14 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_307;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

- (void)_fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke;
    v15[3] = &unk_1E6B93608;
    double v19 = a3;
    SEL v20 = a2;
    id v16 = v9;
    id v17 = self;
    id v11 = v10;
    id v18 = v11;
    id v12 = (void *)MEMORY[0x1E016DB00](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke_303;
    v13[3] = &unk_1E6B90C18;
    id v14 = v11;
    [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v13];
  }
}

void __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"exitDate" ascending:1];
  v24[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v4 setSortDescriptors:v6];

  id v15 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v15];

  id v8 = v15;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v14 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v17 = v13;
    __int16 v18 = 2112;
    double v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v8 || ![v7 count])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v7 firstObject];
    id v12 = [v11 locationOfInterest];
    id v10 = +[RTLearnedLocationOfInterest createWithManagedObject:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:0];
  v24[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v4 setSortDescriptors:v6];

  id v15 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v15];

  id v8 = v15;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v14 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v17 = v13;
    __int16 v18 = 2112;
    double v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v8 || ![v7 count])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v7 firstObject];
    id v12 = [v11 locationOfInterest];
    id v10 = +[RTLearnedLocationOfInterest createWithManagedObject:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__RTLearnedLocationStore_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestVisitedBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) includePlaceholders:0 handler:*(void *)(a1 + 56)];
}

uint64_t __73__RTLearnedLocationStore_fetchLocationOfInterestVisitedFirstWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestVisitedFirstWithHandler:*(void *)(a1 + 40)];
}

uint64_t __72__RTLearnedLocationStore_fetchLocationOfInterestVisitedLastWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestVisitedLastWithHandler:*(void *)(a1 + 40)];
}

void __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v42 = a2;
  v39 = +[RTLearnedPlaceMO fetchRequestSortedByCreation];
  [v39 setFetchLimit:5];
  double v53 = 0.0;
  double v54 = 0.0;
  double v51 = 0.0;
  double v52 = 0.0;
  [*(id *)(a1 + 32) latitude];
  [*(id *)(a1 + 32) longitude];
  RTCommonCalculateBoundingBox();
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (*(void *)(a1 + 40)) {
    [v3 addObject:];
  }
  __int16 v38 = v4;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  int v43 = [NSNumber numberWithDouble:v53];
  contexta = [v5 predicateWithFormat:@"%@ <= %K.%K", v43, @"mapItem", @"longitude"];
  v64[0] = contexta;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [NSNumber numberWithDouble:v51];
  id v8 = [v6 predicateWithFormat:@"%K.%K <= %@", @"mapItem", @"longitude", v7];
  v64[1] = v8;
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [NSNumber numberWithDouble:v54];
  id v11 = [v9 predicateWithFormat:@"%@ <= %K.%K", v10, @"mapItem", @"latitude"];
  v64[2] = v11;
  id v12 = (void *)MEMORY[0x1E4F28F60];
  id v13 = [NSNumber numberWithDouble:v52];
  uint64_t v14 = [v12 predicateWithFormat:@"%K.%K <= %@", @"mapItem", @"latitude", v13];
  v64[3] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
  [v38 addObjectsFromArray:v15];

  id v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v38];
  id v17 = v39;
  [v39 setPredicate:v16];

  uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  id v18 = 0;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    id v50 = 0;
    double v19 = [v42 executeFetchRequest:v17 error:&v50];
    id v20 = v50;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = v19;
    uint64_t v21 = [v18 countByEnumeratingWithState:&v46 objects:v63 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v18);
          }
          v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v26 = (void *)MEMORY[0x1E4F5CE00];
          id v27 = [v25 mapItem];
          v28 = [v26 createWithManagedObject:v27];

          if (v28)
          {
            id v29 = [*(id *)(a1 + 48) distanceCalculator];
            uint64_t v30 = *(void *)(a1 + 32);
            id v45 = v20;
            [v29 distanceFromLocation:v30 toLocation:v28 error:&v45];
            double v32 = v31;
            id v33 = v45;

            if (v33)
            {

              id v20 = v33;
              goto LABEL_20;
            }
            if (v32 <= *(double *)(a1 + 64))
            {
              uint64_t v34 = +[RTLearnedPlace createWithManagedObject:v25];
              if (v34) {
                [v44 addObject:v34];
              }
            }
            id v20 = 0;
          }
        }
        uint64_t v22 = [v18 countByEnumeratingWithState:&v46 objects:v63 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    id v17 = v39;
    [v39 setFetchOffset:[v39 fetchOffset] + [v18 count]];
    [v42 reset];
  }
  while ([v18 count] && !v20);
  __int16 v35 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    id v36 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v37 = [v39 fetchOffset];
    *(_DWORD *)buf = 138413058;
    v56 = v36;
    __int16 v57 = 2112;
    v58 = v39;
    __int16 v59 = 2048;
    uint64_t v60 = v37;
    __int16 v61 = 2112;
    id v62 = v20;
    _os_log_debug_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke(uint64_t a1, void *a2)
{
  v77[4] = *MEMORY[0x1E4F143B8];
  id v59 = a2;
  v55 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
  [v55 setFetchLimit:5];
  [v55 setReturnsObjectsAsFaults:0];
  double v51 = [MEMORY[0x1E4F1CA48] array];
  id v50 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"placeMapItemIdentifier", v4];

  long long v47 = (void *)v5;
  [v50 addObject:v5];
  memset(&v65[1], 0, 32);
  id v6 = [*(id *)(a1 + 32) location];
  [v6 latitude];
  uint64_t v58 = a1;
  id v7 = [*(id *)(a1 + 32) location];
  [v7 longitude];
  RTCommonCalculateBoundingBox();

  double v53 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id obja = [NSNumber numberWithDouble:0.0];
  id v9 = [v8 predicateWithFormat:@"%@ <= %K", obja, @"locationLongitude"];
  v77[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  id v11 = [NSNumber numberWithDouble:0.0];
  id v12 = [v10 predicateWithFormat:@"%K <= %@", @"locationLongitude", v11];
  v77[1] = v12;
  id v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v14 = [NSNumber numberWithDouble:0.0];
  id v15 = [v13 predicateWithFormat:@"%@ <= %K", v14, @"locationLatitude"];
  v77[2] = v15;
  id v16 = (void *)MEMORY[0x1E4F28F60];
  id v17 = [NSNumber numberWithDouble:0.0];
  id v18 = v55;
  double v19 = [v16 predicateWithFormat:@"%K <= %@", @"locationLatitude", v17];
  v77[3] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
  uint64_t v21 = [v53 andPredicateWithSubpredicates:v20];

  long long v49 = (void *)v21;
  [v50 addObject:v21];
  long long v48 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v50];
  [v51 addObject:];
  uint64_t v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v51];
  [v55 setPredicate:v22];

  uint64_t v23 = 0;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    v65[0] = 0;
    uint64_t v24 = [v59 executeFetchRequest:v18 error:v65];
    id v25 = v65[0];

    id v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int v43 = NSStringFromSelector(*(SEL *)(v58 + 48));
      uint64_t v44 = [v18 fetchOffset];
      uint64_t v45 = [v24 count];
      *(_DWORD *)buf = 138413314;
      v68 = v43;
      __int16 v69 = 2112;
      v70 = v18;
      __int16 v71 = 2048;
      uint64_t v72 = v44;
      __int16 v73 = 2048;
      uint64_t v74 = v45;
      __int16 v75 = 2112;
      id v76 = v25;
      _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, nearby LOIs, %lu, error, %@", buf, 0x34u);
    }
    id v54 = v25;

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v24;
    uint64_t v27 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = 0;
      uint64_t v30 = *(void *)v62;
      while (2)
      {
        uint64_t v31 = 0;
        double v32 = v29;
        do
        {
          if (*(void *)v62 != v30) {
            objc_enumerationMutation(obj);
          }
          id v33 = *(void **)(*((void *)&v61 + 1) + 8 * v31);
          uint64_t v34 = +[RTMapItemMO fetchRequest];
          [v34 setReturnsObjectsAsFaults:0];
          __int16 v35 = (void *)MEMORY[0x1E4F28F60];
          id v36 = [v33 placeMapItemIdentifier];
          uint64_t v37 = [v35 predicateWithFormat:@"%K = %@", @"identifier", v36];

          [v34 setPredicate:v37];
          id v60 = v32;
          __int16 v38 = [v59 executeFetchRequest:v34 error:&v60];
          id v29 = v60;

          v39 = (void *)MEMORY[0x1E4F5CE38];
          __int16 v40 = [v38 firstObject];
          v41 = [v39 createWithManagedObject:v40];

          if ([v41 isEqualToMapItem:*(void *)(v58 + 32)])
          {
            long long v46 = +[RTLearnedLocationOfInterest createWithManagedObject:v33];
            id v42 = v54;
            (*(void (**)(void))(*(void *)(v58 + 40) + 16))();

            uint64_t v23 = obj;
            id v18 = v55;
            goto LABEL_19;
          }

          ++v31;
          double v32 = v29;
        }
        while (v28 != v31);
        uint64_t v28 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v29 = 0;
    }
    uint64_t v23 = obj;

    id v18 = v55;
    [v55 setFetchOffset:[v55 fetchOffset] + [obj count]];
    [v59 reset];
    id v42 = v54;
  }
  while ([obj count] && !v29 && !v54);
  if (![obj count]) {
    (*(void (**)(void))(*(void *)(v58 + 40) + 16))();
  }
LABEL_19:
}

void __78__RTLearnedLocationStore_placeTypeForMapItem_placeType_placeTypeSource_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)placeTypeForMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "Invalid parameter not satisfying: mapItem";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_16;
  }
  if (!a4)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "Invalid parameter not satisfying: placeType";
    goto LABEL_15;
  }
  if (!a5)
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v28 = "Invalid parameter not satisfying: placeTypeSource";
      goto LABEL_15;
    }
LABEL_16:
    BOOL v29 = 0;
    goto LABEL_26;
  }
  *a4 = 0;
  *a5 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  long long v47 = buf;
  uint64_t v48 = 0x3032000000;
  long long v49 = __Block_byref_object_copy__69;
  id v50 = __Block_byref_object_dispose__69;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  int v43 = __Block_byref_object_copy__69;
  uint64_t v44 = __Block_byref_object_dispose__69;
  id v45 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __78__RTLearnedLocationStore_placeTypeForMapItem_placeType_placeTypeSource_error___block_invoke;
  void v36[3] = &unk_1E6B90B28;
  __int16 v38 = buf;
  v39 = &v40;
  id v12 = v11;
  uint64_t v37 = v12;
  [(RTLearnedLocationStore *)self fetchLocationOfInterestWithMapItem:v10 handler:v36];
  id v13 = v12;
  __int16 v35 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    id v25 = 0;
LABEL_18:
    char v26 = 1;
    goto LABEL_19;
  }
  uint64_t v34 = [MEMORY[0x1E4F1C9C8] now];
  [v34 timeIntervalSinceDate:v35];
  double v16 = v15;
  id v17 = objc_opt_new();
  id v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_868];
  double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v20 = [v19 filteredArrayUsingPredicate:v18];
  uint64_t v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)double v53 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v53, 2u);
  }

  uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v52 = *MEMORY[0x1E4F28568];
  *(void *)double v53 = @"semaphore wait timeout";
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (!v25) {
    goto LABEL_18;
  }
  id v25 = v25;

  char v26 = 0;
LABEL_19:

  uint64_t v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong((id *)v47 + 5, v25);
  }
  uint64_t v30 = (void *)v41[5];
  if (v30)
  {
    uint64_t v31 = [v30 place];
    *a4 = [v31 type];

    double v32 = [(id)v41[5] place];
    *a5 = [v32 typeSource];
  }
  if (a6) {
    *a6 = *((id *)v47 + 5);
  }
  BOOL v29 = *((void *)v47 + 5) == 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(buf, 8);

LABEL_26:
  return v29;
}

- (void)fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTLearnedLocationStore_fetchLocationOfInterestWithMapItem_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_semaphore_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__RTLearnedLocationStore_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)fetchLocationOfInterestVisitedLastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__RTLearnedLocationStore_fetchLocationOfInterestVisitedLastWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchLocationOfInterestVisitedFirstWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__RTLearnedLocationStore_fetchLocationOfInterestVisitedFirstWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchLocationsOfInterestWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__RTLearnedLocationStore_fetchLocationsOfInterestWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  double v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)fetchLocationsOfInterestWithPlaceType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTLearnedLocationStore_fetchLocationsOfInterestWithPlaceType_handler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchRecentLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4838400.0];
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedLocationStore_fetchRecentLocationsOfInterestWithHandler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __69__RTLearnedLocationStore_fetchPlacesWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithinDistance:*(void *)(a1 + 40) location:0 predicate:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__RTLearnedLocationStore_fetchPlacesWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  double v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_fetchLocationOfInterestVisitedLastWithHandler:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke;
  v11[3] = &unk_1E6B96630;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x1E016DB00](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke_348;
  v9[3] = &unk_1E6B90C18;
  id v10 = v6;
  id v8 = v6;
  [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v9];
}

- (void)_fetchLocationOfInterestVisitedFirstWithHandler:(id)a3
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke;
  v11[3] = &unk_1E6B96630;
  SEL v13 = a2;
  id v6 = v5;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x1E016DB00](v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke_347;
  v9[3] = &unk_1E6B90C18;
  id v10 = v6;
  id v8 = v6;
  [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v9];
}

- (void)_fetchLocationOfInterestWithMapItem:(id)a3 handler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke_356;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"requires a valid mapItem.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

- (void)_fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (v11)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke;
      v22[3] = &unk_1E6B96598;
      id v23 = v11;
      double v27 = a3;
      id v24 = v12;
      id v25 = self;
      SEL v28 = a2;
      id v14 = v13;
      id v26 = v14;
      id v15 = (void *)MEMORY[0x1E016DB00](v22);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke_222;
      v20[3] = &unk_1E6B90C18;
      id v21 = v14;
      [(RTStore *)self _performBlock:v15 contextType:1 errorHandler:v20];

      id v16 = v23;
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F5CFE8];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"requires a valid location.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      id v19 = [v17 errorWithDomain:v18 code:7 userInfo:v16];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v19);
    }
  }
}

- (void)submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }
    goto LABEL_6;
  }
  if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__RTLearnedLocationStore_Metrics__submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers_context___block_invoke;
    v8[3] = &unk_1E6B90E70;
    id v9 = v6;
    [v9 performBlockAndWait:v8];
    id v7 = v9;
LABEL_6:
  }
}

void __100__RTLearnedLocationStore_Metrics__submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers_context___block_invoke(uint64_t a1)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v2 = +[RTLearnedVisitMO fetchRequest];
  [v2 setResultType:2];
  uint64_t v3 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%K", @"creationDate"];
  id v4 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v40 = (void *)v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:];
  uint64_t v6 = [v4 expressionForFunction:@"min:" arguments:v5];

  id v7 = objc_opt_new();
  [v7 setName:@"oldestCreationDate"];
  v39 = (void *)v6;
  [v7 setExpression:v6];
  [v7 setExpressionResultType:900];
  v48[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  [v2 setPropertiesToFetch:v8];

  id v9 = *(void **)(a1 + 32);
  id v43 = 0;
  id v10 = [v9 executeFetchRequest:v2 error:&v43];
  id v37 = v43;
  __int16 v38 = v10;
  id v11 = [v10 firstObject];
  uint64_t v12 = [v11 objectForKey:@"oldestCreationDate"];

  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v36 = (void *)v12;
  [v13 timeIntervalSinceDate:v12];
  double v15 = v14;

  id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4838400.0];
  id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K < %@", @"creationDate", v16];
  uint64_t v18 = +[RTLearnedVisitMO fetchRequest];
  [v18 setPredicate:v17];
  id v19 = *(void **)(a1 + 32);
  id v42 = 0;
  unint64_t v20 = [v19 countForFetchRequest:v18 error:&v42];
  id v21 = v42;
  uint64_t v22 = +[RTLearnedVisitMO fetchRequest];
  id v23 = *(void **)(a1 + 32);
  id v41 = v21;
  unint64_t v24 = [v23 countForFetchRequest:v22 error:&v41];
  id v35 = v41;

  if (v24) {
    float v25 = (float)((float)v20 / (float)v24) * 100.0;
  }
  else {
    float v25 = 0.0;
  }
  id v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v45 = v25;
    __int16 v46 = 2048;
    unint64_t v47 = v24;
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "pinned visits percentage, %.2f, total visits, %lu", buf, 0x16u);
  }

  double v27 = objc_opt_new();
  *(float *)&double v28 = v25;
  uint64_t v29 = [NSNumber numberWithFloat:v28];
  [v27 setObject:v29 forKeyedSubscript:@"pinnedVisitsPercentage"];

  uint64_t v30 = [NSNumber numberWithUnsignedInteger:v24];
  [v27 setObject:v30 forKeyedSubscript:@"totalVisitCount"];

  uint64_t v31 = [NSNumber numberWithDouble:v15];
  [v27 setObject:v31 forKeyedSubscript:@"ageOfOldestVisit"];

  id v32 = [NSString alloc];
  id v33 = (void *)[v32 initWithCString:RTAnalyticsEventVisitLifetimeExtension encoding:1];
  log_analytics_submission(v33, v27);
  uint64_t v34 = [NSString stringWithFormat:@"com.apple.%@", v33];
  AnalyticsSendEvent();
}

- (RTLearnedLocationStore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_expirationEnforcer_mirroringManager_);
}

- (RTLearnedLocationStore)initWithDistanceCalculator:(id)a3 expirationEnforcer:(id)a4 mirroringManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v20 = 0;
    double v15 = "Invalid parameter not satisfying: distanceCalculator";
    id v16 = (uint8_t *)&v20;
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v19 = 0;
    double v15 = "Invalid parameter not satisfying: expirationEnforcer";
    id v16 = (uint8_t *)&v19;
    goto LABEL_11;
  }
  if (!v10)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = 0;
      double v15 = "Invalid parameter not satisfying: mirroringManager";
      id v16 = (uint8_t *)&v18;
      goto LABEL_11;
    }
LABEL_12:

    id v13 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = [v10 persistenceManager];
  self = [(RTLearnedLocationStore *)self initWithDistanceCalculator:v8 expirationEnforcer:v9 mirroringManager:v11 persistenceManager:v12];

  id v13 = self;
LABEL_13:

  return v13;
}

- (RTLearnedLocationStore)initWithDistanceCalculator:(id)a3 expirationEnforcer:(id)a4 mirroringManager:(id)a5 persistenceManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    v19.receiver = self;
    v19.super_class = (Class)RTLearnedLocationStore;
    double v14 = [(RTStore *)&v19 initWithPersistenceManager:a6];
    p_isa = (id *)&v14->super.super.super.super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_distanceCalculator, a3);
      objc_storeStrong(p_isa + 8, a4);
      objc_storeStrong(p_isa + 10, a5);
    }
    self = p_isa;
    id v16 = self;
  }
  else
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    id v16 = 0;
  }

  return v16;
}

+ (id)filterPlaces:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_54];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __39__RTLearnedLocationStore_filterPlaces___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 mapItem];

  if (!v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v2;
      __int16 v14 = 2080;
      double v15 = "+[RTLearnedLocationStore filterPlaces:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 130;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "mapItem cannot be nil for place, %@. (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
  id v5 = [v2 mapItem];
  uint64_t v6 = [v5 geoMapItemHandle];

  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v2;
      __int16 v14 = 2080;
      double v15 = "+[RTLearnedLocationStore filterPlaces:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 133;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "geoMapItemHandle cannot be nil for place, %@. (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
  id v8 = [v2 mapItem];
  id v9 = [v8 geoMapItemHandle];
  BOOL v10 = v9 != 0;

  return v10;
}

+ (id)filterLocationsOfInterests:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_40];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __53__RTLearnedLocationStore_filterLocationsOfInterests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 place];
  id v4 = [v3 mapItem];

  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v15 = [v2 place];
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      __int16 v20 = "+[RTLearnedLocationStore filterLocationsOfInterests:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 149;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "mapItem cannot be nil for locationOfInterest, %@. (in %s:%d)", (uint8_t *)&v17, 0x1Cu);
    }
  }
  uint64_t v6 = [v2 place];
  id v7 = [v6 mapItem];
  id v8 = [v7 geoMapItemHandle];

  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = [v2 place];
      int v17 = 138412802;
      uint64_t v18 = v16;
      __int16 v19 = 2080;
      __int16 v20 = "+[RTLearnedLocationStore filterLocationsOfInterests:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 152;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "geoMapItemHandle cannot be nil for locationOfInterest, %@. (in %s:%d)", (uint8_t *)&v17, 0x1Cu);
    }
  }
  BOOL v10 = [v2 place];
  id v11 = [v10 mapItem];
  int v12 = [v11 geoMapItemHandle];
  BOOL v13 = v12 != 0;

  return v13;
}

- (void)storePlaces:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() filterPlaces:v7];

  [(RTStore *)self storeWritableObjects:v8 handler:v6];
}

- (void)storeLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() filterLocationsOfInterests:v7];

  [(RTStore *)self storeWritableObjects:v8 handler:v6];
}

- (void)_storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__RTLearnedLocationStore__storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  v20[3] = &unk_1E6B963A0;
  id v21 = v11;
  id v22 = v12;
  id v24 = v14;
  SEL v25 = a2;
  id v23 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  __int16 v19 = (void *)MEMORY[0x1E016DB00](v20);
  [(RTStore *)self _performBlock:v19 contextType:2 errorHandler:v15];
}

void __86__RTLearnedLocationStore__storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v10 = *(void **)(a1 + 40);
        id v11 = [v9 identifier];
        id v12 = [v10 objectForKey:v11];

        id v13 = +[RTLearnedVisitMO managedObjectWithVisit:v9 finerGranularityInferredMapItem:v12 place:*(void *)(a1 + 48) inManagedObjectContext:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v6);
  }

  id v19 = 0;
  char v14 = [v3 save:&v19];
  id v15 = v19;
  if ((v14 & 1) == 0)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      SEL v25 = v18;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, error, %@", buf, 0x16u);
    }
  }
  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
  }
}

- (void)storeVisits:(id)a3 place:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__RTLearnedLocationStore_storeVisits_place_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __52__RTLearnedLocationStore_storeVisits_place_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeVisits:*(void *)(a1 + 40) finerGranularityInferredMapItems:0 place:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)storeVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__RTLearnedLocationStore_storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  block[3] = &unk_1E6B914E0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __85__RTLearnedLocationStore_storeVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeVisits:*(void *)(a1 + 40) finerGranularityInferredMapItems:*(void *)(a1 + 48) place:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)associatePlacesToVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationStore_associatePlacesToVisits_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__RTLearnedLocationStore_associatePlacesToVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _associatePlacesToVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)migrateLegacyMapItemsWithEnumerationBlock:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    *(void *)__int16 v38 = 0;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__69;
    uint64_t v40 = __Block_byref_object_dispose__69;
    id v41 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(RTNotifier *)self queue];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    id v32 = __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke;
    id v33 = &unk_1E6B963C8;
    uint64_t v34 = self;
    id v36 = v4;
    id v37 = v38;
    id v7 = v5;
    id v35 = v7;
    dispatch_async(v6, &v30);

    id v8 = v7;
    id v9 = [MEMORY[0x1E4F1C9C8] now:v30, v31, v32, v33, v34];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v8, v10)) {
      goto LABEL_7;
    }
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    id v14 = objc_opt_new();
    id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_868];
    id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v17 = [v16 filteredArrayUsingPredicate:v15];
    id v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v44 count:1];
    id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22)
    {
      id v23 = v22;

      char v24 = 0;
    }
    else
    {
LABEL_7:
      id v23 = 0;
      char v24 = 1;
    }

    id v25 = v23;
    if ((v24 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v38[8] + 40), v23);
    }
    id v26 = *(id *)(*(void *)&v38[8] + 40);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v38 = 136315394;
      *(void *)&v38[4] = "-[RTLearnedLocationStore migrateLegacyMapItemsWithEnumerationBlock:]";
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 271;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", v38, 0x12u);
    }

    uint64_t v42 = *MEMORY[0x1E4F28568];
    id v43 = @"A non-nil enumeration block is required.";
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v28];
  }

  return v26;
}

void __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke_2;
  v3[3] = &unk_1E6B90728;
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _migrateLegacyMapItemsWithEnumerationBlock:v1 completionBlock:v3];
}

void __68__RTLearnedLocationStore_migrateLegacyMapItemsWithEnumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_migrateLegacyMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v8)
  {
    if (v7)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke;
      v18[3] = &unk_1E6B963F0;
      id v10 = v8;
      id v19 = v10;
      id v20 = v7;
      SEL v21 = a2;
      id v11 = (void *)MEMORY[0x1E016DB00](v18);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke_62;
      v16[3] = &unk_1E6B90C18;
      id v17 = v10;
      [(RTStore *)self _performBlock:v11 contextType:2 errorHandler:v16];

      double v12 = v19;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[RTLearnedLocationStore _migrateLegacyMapItemsWithEnumerationBlock:completionBlock:]";
      __int16 v26 = 1024;
      int v27 = 301;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionBlock (in %s:%d)", buf, 0x12u);
    }

    if (v7) {
      goto LABEL_12;
    }
  }
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[RTLearnedLocationStore _migrateLegacyMapItemsWithEnumerationBlock:completionBlock:]";
    __int16 v26 = 1024;
    int v27 = 302;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", buf, 0x12u);
  }

  if (v9)
  {
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v23 = @"A non-nil enumeration block is required.";
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v12];
    ((void (**)(void, void *))v9)[2](v9, v15);

    goto LABEL_11;
  }
LABEL_12:
}

void __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  [v4 setFetchBatchSize:1];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil || %K != nil", @"mapItemGeoMapItem", @"mapItemGeoMapItemHandle"];
  [v4 setPredicate:v5];

  id v48 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v48];
  id v7 = v48;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "could not fetch a count of legacy map items to migrate, error, %@", buf, 0xCu);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_35;
  }
  if (![v6 count])
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "no legacy map items exist to migrate, returning.", buf, 2u);
    }
    goto LABEL_4;
  }
  id v33 = v4;
  uint64_t v31 = [v3 mergePolicy];
  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  [v3 setMirroringQualityOfService:3];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v10;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "migrating %lu legacy map items.", buf, 0xCu);
  }

  char v47 = 0;
  uint64_t v34 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v32 = v6;
  id obj = v6;
  id v37 = v3;
  uint64_t v39 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v44;
    uint64_t v36 = a1;
LABEL_10:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v44 != v38) {
        objc_enumerationMutation(obj);
      }
      if (v47) {
        break;
      }
      double v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
      double v13 = (void *)MEMORY[0x1E016D870]();
      id v14 = [v12 mapItemGeoMapItem];
      id v15 = [v12 mapItemGeoMapItemHandle];
      id v16 = [v12 mapItemSource];
      id v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v14;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "Migrating map item, %@", buf, 0xCu);
      }

      id v18 = (*(void (**)(void, void *, void *, uint64_t, void, char *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v14, v15, [v16 unsignedIntegerValue], 0, &v47);
      if (v18)
      {
        uint64_t v40 = v13;
        id v19 = +[RTMapItemMO managedObjectWithMapItem:v18 inManagedObjectContext:v3];
        id v42 = 0;
        char v20 = [v3 save:&v42];
        id v21 = v42;
        if ((v20 & 1) == 0)
        {
          uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = NSStringFromSelector(*(SEL *)(v36 + 48));
            *(_DWORD *)buf = 138412546;
            uint64_t v50 = (uint64_t)v30;
            __int16 v51 = 2112;
            id v52 = v21;
            _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          if (v21) {
            [v34 addObject:v21];
          }
        }
        [v12 setMapItemGeoMapItem:0];
        [v12 setMapItemGeoMapItemHandle:0];
        [v12 setMapItemSource:0];
        [v12 setMapItem:v19];
        id v41 = v21;
        char v23 = [v3 save:&v41];
        id v24 = v41;

        if ((v23 & 1) == 0)
        {
          id v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            __int16 v26 = NSStringFromSelector(*(SEL *)(v36 + 48));
            *(_DWORD *)buf = 138412546;
            uint64_t v50 = (uint64_t)v26;
            __int16 v51 = 2112;
            id v52 = v24;
            _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          if (v24) {
            [v34 addObject:v24];
          }
        }
        id v3 = v37;
        [v37 refreshObject:v12 mergeChanges:0];

        a1 = v36;
        double v13 = v40;
      }
      else
      {
        id v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "could not create new map item during migration of legacy map item", buf, 2u);
        }
      }

      if (v39 == ++v11)
      {
        uint64_t v39 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v39) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  [v3 setMergePolicy:v31];
  int v27 = _RTSafeArray();
  uint64_t v28 = _RTMultiErrorCreate();

  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = 0;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "migrated %lu legacy map items.", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  id v3 = v37;
  id v6 = v32;
  id v4 = v33;
  id v7 = 0;
LABEL_35:
}

uint64_t __85__RTLearnedLocationStore__migrateLegacyMapItemsWithEnumerationBlock_completionBlock___block_invoke_62(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)refreshMapItemsWithEnumerationBlock:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    *(void *)uint64_t v38 = 0;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__69;
    uint64_t v40 = __Block_byref_object_dispose__69;
    id v41 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(RTNotifier *)self queue];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    id v32 = __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke;
    id v33 = &unk_1E6B963C8;
    uint64_t v34 = self;
    id v36 = v4;
    id v37 = v38;
    id v7 = v5;
    id v35 = v7;
    dispatch_async(v6, &v30);

    id v8 = v7;
    id v9 = [MEMORY[0x1E4F1C9C8] now:v30, v31, v32, v33, v34];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v8, v10)) {
      goto LABEL_7;
    }
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v9];
    double v13 = v12;
    id v14 = objc_opt_new();
    id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_868];
    id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v17 = [v16 filteredArrayUsingPredicate:v15];
    id v18 = [v17 firstObject];

    [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    char v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v44 count:1];
    uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

    if (v22)
    {
      id v23 = v22;

      char v24 = 0;
    }
    else
    {
LABEL_7:
      id v23 = 0;
      char v24 = 1;
    }

    id v25 = v23;
    if ((v24 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&v38[8] + 40), v23);
    }
    id v26 = *(id *)(*(void *)&v38[8] + 40);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    int v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v38 = 136315394;
      *(void *)&v38[4] = "-[RTLearnedLocationStore refreshMapItemsWithEnumerationBlock:]";
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 435;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", v38, 0x12u);
    }

    uint64_t v42 = *MEMORY[0x1E4F28568];
    long long v43 = @"A non-nil enumeration block is required.";
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v28];
  }

  return v26;
}

void __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke_2;
  v3[3] = &unk_1E6B90728;
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _refreshMapItemsWithEnumerationBlock:v1 completionBlock:v3];
}

void __62__RTLearnedLocationStore_refreshMapItemsWithEnumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_refreshMapItemsWithEnumerationBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v8)
  {
    if (v7)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke;
      v18[3] = &unk_1E6B96418;
      void v18[4] = self;
      SEL v21 = a2;
      id v10 = v8;
      id v19 = v10;
      id v20 = v7;
      uint64_t v11 = (void *)MEMORY[0x1E016DB00](v18);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke_71;
      v16[3] = &unk_1E6B90C18;
      id v17 = v10;
      [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v16];

      goto LABEL_11;
    }
    goto LABEL_7;
  }
  double v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[RTLearnedLocationStore _refreshMapItemsWithEnumerationBlock:completionBlock:]";
    __int16 v26 = 1024;
    int v27 = 465;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completionBlock (in %s:%d)", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_7:
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[RTLearnedLocationStore _refreshMapItemsWithEnumerationBlock:completionBlock:]";
      __int16 v26 = 1024;
      int v27 = 466;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v23 = @"A non-nil enumeration block is required.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];
      ((void (**)(void, void *))v9)[2](v9, v15);
    }
  }
LABEL_11:
}

void __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTMapItemMO fetchRequest];
  v56[0] = @"geoMapItemHandle";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  [v4 setPropertiesToFetch:v5];

  id v6 = [*(id *)(a1 + 32) predicateForObjectsFromCurrentDevice];
  [v4 setPredicate:v6];

  [v4 setFetchBatchSize:1];
  id v45 = 0;
  uint64_t v38 = v3;
  id v7 = [v3 executeFetchRequest:v4 error:&v45];
  id v8 = v45;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v29 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v49 = v28;
    __int16 v50 = 2112;
    id v51 = v4;
    __int16 v52 = 2048;
    uint64_t v53 = v29;
    __int16 v54 = 2112;
    id v55 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "could not fetch map items to refresh, error, %@", buf, 0xCu);
    }
LABEL_6:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_28;
  }
  if (![v7 count])
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "no map items exist to refresh, returning.", buf, 2u);
    }
    goto LABEL_6;
  }
  id v33 = v4;
  uint64_t v31 = [v3 mergePolicy];
  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  [v3 setMirroringQualityOfService:3];
  char v44 = 0;
  uint64_t v34 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v32 = v7;
  id obj = v7;
  uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v41;
    uint64_t v11 = RTLogFacilityLearnedLocation;
LABEL_10:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v41 != v36) {
        objc_enumerationMutation(obj);
      }
      if (v44) {
        break;
      }
      uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
      id v14 = (void *)MEMORY[0x1E016D870]();
      id v15 = [MEMORY[0x1E4F5CE38] createWithManagedObject:v13];
      id v16 = _rt_log_facility_get_os_log(v11);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v15;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "Refreshing map item, %@", buf, 0xCu);
      }

      id v17 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (v17)
      {
        uint64_t v46 = @"identifier";
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        id v19 = [v15 mergeWithMapItem:v17 preservingProperties:v18];

        id v20 = +[RTMapItemMO managedObjectWithMapItem:v19 managedObject:v13 inManagedObjectContext:v38];
        SEL v21 = v11;
        uint64_t v22 = _rt_log_facility_get_os_log(v11);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v17;
          _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "Refreshed map item, %@", buf, 0xCu);
        }

        id v39 = 0;
        char v23 = [v38 save:&v39];
        id v24 = v39;
        if ((v23 & 1) == 0)
        {
          id v25 = _rt_log_facility_get_os_log(v21);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = NSStringFromSelector(*(SEL *)(a1 + 56));
            *(_DWORD *)buf = 138412546;
            id v49 = v30;
            __int16 v50 = 2112;
            id v51 = v24;
            _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          if (v24) {
            [v34 addObject:v24];
          }
        }
        [v38 refreshObject:v20 mergeChanges:0];

        uint64_t v11 = v21;
      }

      if (v37 == ++v12)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v37) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  [v38 setMergePolicy:v31];
  __int16 v26 = _RTSafeArray();
  int v27 = _RTMultiErrorCreate();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  id v7 = v32;
  id v4 = v33;
  id v8 = 0;
LABEL_28:
}

uint64_t __79__RTLearnedLocationStore__refreshMapItemsWithEnumerationBlock_completionBlock___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePlaces:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() filterPlaces:v7];

  [(RTStore *)self updateWritableObjects:v8 handler:v6];
}

- (void)updateLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() filterLocationsOfInterests:v7];

  [(RTStore *)self updateWritableObjects:v8 handler:v6];
}

- (void)_updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke;
  v19[3] = &unk_1E6B91018;
  SEL v23 = a2;
  id v20 = v9;
  id v21 = v10;
  id v12 = v11;
  id v22 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = (void *)MEMORY[0x1E016DB00](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke_78;
  v17[3] = &unk_1E6B90C18;
  id v18 = v12;
  id v16 = v12;
  [(RTStore *)self _performBlock:v15 contextType:2 errorHandler:v17];
}

void __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mergePolicy];
  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  uint64_t v5 = +[RTLearnedLocationOfInterestMO fetchRequest];
  [v5 setFetchLimit:1];
  [v5 setReturnsObjectsAsFaults:0];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v5 setPredicate:v6];

  id v41 = 0;
  id v7 = [v5 execute:&v41];
  id v8 = v41;
  id v9 = [v7 firstObject];

  if (!v8 && v9)
  {
    id v10 = [v9 placeIdentifier];

    if (v10)
    {
      id v11 = +[RTLearnedPlaceMO fetchRequestSortedByCreation];
      [v11 setFetchLimit:1];
      [v11 setReturnsObjectsAsFaults:0];
      id v12 = (void *)MEMORY[0x1E4F28F60];
      id v13 = [v9 placeIdentifier];
      id v14 = [v12 predicateWithFormat:@"%K = %@", @"identifier", v13];
      [v11 setPredicate:v14];

      id v40 = 0;
      id v15 = [v11 execute:&v40];
      id v8 = v40;
      id v16 = [v15 firstObject];

      if (v8 || !v16) {
        goto LABEL_15;
      }
      id v17 = [v9 placeIdentifier];
      id v18 = [*(id *)(a1 + 40) identifier];
      char v19 = [v17 isEqual:v18];

      if ((v19 & 1) == 0)
      {
        id v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v35 = NSStringFromSelector(*(SEL *)(a1 + 56));
          uint64_t v36 = [*(id *)(a1 + 40) identifier];
          uint64_t v37 = [v9 placeIdentifier];
          uint64_t v38 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          long long v43 = v35;
          __int16 v44 = 2112;
          id v45 = v36;
          __int16 v46 = 2112;
          char v47 = v37;
          __int16 v48 = 2112;
          uint64_t v49 = v38;
          _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "%@, warning, ignoring change to place identifier, %@, from, %@, for loi, %@", buf, 0x2Au);
        }
      }
      id v21 = [*(id *)(a1 + 40) mapItem];
      id v22 = [v16 mapItem];
      SEL v23 = +[RTMapItemMO managedObjectWithMapItem:v21 managedObject:v22 inManagedObjectContext:v3];
      [v16 setMapItem:v23];

      id v24 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 40) type]];
      [v16 setType:v24];
      [v9 setPlaceType:v24];

      id v25 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 40) typeSource]];
      [v16 setTypeSource:v25];
      [v9 setPlaceTypeSource:v25];

      __int16 v26 = [*(id *)(a1 + 40) customLabel];
      [v16 setCustomLabel:v26];
      [v9 setPlaceCustomLabel:v26];

      int v27 = [v16 mapItem];
      [v9 setMapItem:v27];
    }
    else
    {
      int v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v32 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v33 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        long long v43 = v32;
        __int16 v44 = 2112;
        id v45 = v33;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, error, loi with identifier, %@, missing place identifier", buf, 0x16u);
      }
      id v16 = 0;
    }

    id v8 = 0;
LABEL_15:
  }
  [v3 setMirroringQualityOfService:3];
  if (!v8)
  {
    id v39 = 0;
    char v28 = [v3 save:&v39];
    id v8 = v39;
    if ((v28 & 1) == 0)
    {
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412546;
        long long v43 = v34;
        __int16 v44 = 2112;
        id v45 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
    }
  }
  [v3 setMergePolicy:v4];
  uint64_t v30 = *(void *)(a1 + 48);
  if (v30)
  {
    if (v8)
    {
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = +[RTLearnedLocationOfInterest createWithManagedObject:v9];
      uint64_t v30 = *(void *)(a1 + 48);
    }
    (*(void (**)(uint64_t, void *, id))(v30 + 16))(v30, v31, v8);
  }
}

uint64_t __80__RTLearnedLocationStore__updateLocationOfInterestWithIdentifier_place_handler___block_invoke_78(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)updateLocationOfInterestWithIdentifier:(id)a3 place:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__RTLearnedLocationStore_updateLocationOfInterestWithIdentifier_place_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __79__RTLearnedLocationStore_updateLocationOfInterestWithIdentifier_place_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocationOfInterestWithIdentifier:*(void *)(a1 + 40) place:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__RTLearnedLocationStore_expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __87__RTLearnedLocationStore_expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireLifetimeOfVisitsWithIdentifiers:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
    v15[3] = &unk_1E6B96440;
    void v15[4] = self;
    id v16 = v9;
    SEL v19 = a2;
    id v12 = v11;
    id v18 = v12;
    id v17 = v10;
    id v13 = (void *)MEMORY[0x1E016DB00](v15);
    [(RTStore *)self _performBlock:v13 contextType:2 errorHandler:v12];
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v24 = 0;
  id v6 = [v4 _unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:v5 allowThresholdBypass:1 context:v3 error:&v24];
  id v7 = v24;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      SEL v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      __int16 v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error fetching visits to expire them, error, %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v11 = [v6 count];
      id v12 = [*(id *)(a1 + 48) stringFromDate];
      *(_DWORD *)buf = 138413058;
      __int16 v26 = v10;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, expiring %lu visits with expiration date %@, identifiers, %@", buf, 0x2Au);
    }
    id v22 = 0;
    uint64_t v23 = 0;
    [*(id *)(a1 + 32) _updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:v6 expirationDate:*(void *)(a1 + 48) context:v3 visitsUpdated:&v23 error:&v22];
    id v13 = v22;
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v20 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        __int16 v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v13;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);
      }
      id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        __int16 v26 = v17;
        __int16 v27 = 2048;
        uint64_t v28 = v23;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu visits", buf, 0x16u);
      }
      id v18 = [*(id *)(a1 + 32) mirroringManager];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke_79;
      v21[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v21[4] = *(void *)(a1 + 64);
      [v18 performExportWithHandler:v21];

      id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v16();
  }
}

void __88__RTLearnedLocationStore__expireLifetimeOfVisitsWithIdentifiers_expirationDate_handler___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__RTLearnedLocationStore_extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __93__RTLearnedLocationStore_extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extendExpirationDateOfVisitsWithIdentifiers:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_extendExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__RTLearnedLocationStore__extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
  v16[3] = &unk_1E6B963A0;
  id v20 = v11;
  SEL v21 = a2;
  id v17 = v9;
  id v18 = v10;
  SEL v19 = self;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = (void *)MEMORY[0x1E016DB00](v16);
  [(RTStore *)self _performBlock:v15 contextType:2 errorHandler:v12];
}

void __94__RTLearnedLocationStore__extendExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v6 = [*(id *)(a1 + 32) count];
    id v7 = [*(id *)(a1 + 40) stringFromDate];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138413058;
    id v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, extending %lu visits with expiration date %@, identifiers, %@", (uint8_t *)&v9, 0x2Au);
  }
  [*(id *)(a1 + 48) submitMetricsOnExtendingLifetimeOfObjectsWithIdentifiers:*(void *)(a1 + 32) context:v3];
  [*(id *)(a1 + 48) _moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:*(void *)(a1 + 32) expirationDate:*(void *)(a1 + 40) allowThresholdBypass:0 context:v3 handler:*(void *)(a1 + 56)];
}

- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __93__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExpirationDateOfVisitsWithIdentifiers:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 handler:(id)a5
{
}

- (void)updateExpirationDateOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(RTNotifier *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke;
  v16[3] = &unk_1E6B91490;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

uint64_t __114__RTLearnedLocationStore_updateExpirationDateOfVisitsWithIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48) allowThresholdBypass:1 handler:*(void *)(a1 + 56)];
}

- (void)_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __127__RTLearnedLocationStore__updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke;
    v16[3] = &unk_1E6B96468;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    BOOL v20 = a5;
    id v13 = v12;
    id v19 = v13;
    id v14 = (void *)MEMORY[0x1E016DB00](v16);
    [(RTStore *)self _performBlock:v14 contextType:2 errorHandler:v13];
  }
  else
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __127__RTLearnedLocationStore__updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:*(void *)(a1 + 40) expirationDate:*(void *)(a1 + 48) allowThresholdBypass:*(unsigned __int8 *)(a1 + 64) context:a2 handler:*(void *)(a1 + 56)];
}

- (void)_moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 allowThresholdBypass:(BOOL)a5 context:(id)a6 handler:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  if (!v16)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_12;
  }
  if (![v13 count])
  {
    v16[2](v16, 0);
    goto LABEL_13;
  }
  if (!v14)
  {
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"expirationDate is a required parameter.";
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    id v19 = (__CFString **)v33;
    BOOL v20 = &v32;
LABEL_11:
    id v17 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    SEL v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];
    ((void (**)(id, void *))v16)[2](v16, v21);

LABEL_12:
    goto LABEL_13;
  }
  if (!v15)
  {
    uint64_t v30 = *MEMORY[0x1E4F28568];
    __int16 v31 = @"expirationDate is a required parameter.";
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    id v19 = &v31;
    BOOL v20 = &v30;
    goto LABEL_11;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke;
  v22[3] = &unk_1E6B96490;
  void v22[4] = self;
  id v23 = v13;
  BOOL v28 = a5;
  id v24 = v15;
  SEL v27 = a2;
  __int16 v26 = v16;
  id v25 = v14;
  [v24 performBlock:v22];

LABEL_13:
}

void __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  id v35 = 0;
  uint64_t v6 = [v2 _unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:v3 allowThresholdBypass:v5 context:v4 error:&v35];
  id v7 = v35;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v26;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, encountered error fetching visits, error, %@", buf, 0x16u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_5;
  }
  if ([v6 count])
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v12 = [v6 count];
      id v13 = [*(id *)(a1 + 56) stringFromDate];
      *(_DWORD *)buf = 138413058;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      __int16 v40 = 2112;
      id v41 = v13;
      __int16 v42 = 2112;
      long long v43 = v6;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, updating %lu visits and placesw with expiration date, %@, identifiers, %@", buf, 0x2Au);
    }
    id v33 = 0;
    uint64_t v34 = 0;
    [*(id *)(a1 + 32) _updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:v6 expirationDate:*(void *)(a1 + 56) context:*(void *)(a1 + 48) visitsUpdated:&v34 error:&v33];
    id v14 = v33;
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = NSStringFromSelector(*(SEL *)(a1 + 72));
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v29;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v14;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);
      }
      id v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v18 = NSStringFromSelector(*(SEL *)(a1 + 72));
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v18;
        __int16 v38 = 2048;
        uint64_t v39 = v34;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu visits and transitions", buf, 0x16u);
      }
      if (v34)
      {
        id v19 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        id v32 = 0;
        [v19 _updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers:v6 expirationDate:v20 context:v21 error:&v32];
        id v22 = v32;
        id v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
        id v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = NSStringFromSelector(*(SEL *)(a1 + 72));
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v30;
            __int16 v38 = 2112;
            uint64_t v39 = (uint64_t)v22;
            _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of place subgraph, error, %@", buf, 0x16u);
          }
          id v25 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            SEL v27 = NSStringFromSelector(*(SEL *)(a1 + 72));
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v27;
            _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, successfully updated expiration date of place subgraph", buf, 0xCu);
          }
          BOOL v28 = [*(id *)(a1 + 32) mirroringManager];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke_84;
          v31[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v31[4] = *(void *)(a1 + 72);
          [v28 performExportWithHandler:v31];

          id v25 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
        }
        v25();

        goto LABEL_27;
      }
      id v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v17();
LABEL_27:

    goto LABEL_28;
  }
  id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_5:
  v9();
LABEL_28:
}

void __139__RTLearnedLocationStore__moc_updateExpirationDateOfVisitSubgraphWithVisitIdentifiers_expirationDate_allowThresholdBypass_context_handler___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)_updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    if ([v10 count])
    {
      if (v11)
      {
        if (v12)
        {
          *(void *)buf = 0;
          SEL v27 = buf;
          uint64_t v28 = 0x3032000000;
          __int16 v29 = __Block_byref_object_copy__69;
          uint64_t v30 = __Block_byref_object_dispose__69;
          id v31 = 0;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __112__RTLearnedLocationStore__updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers_expirationDate_context_error___block_invoke;
          v20[3] = &unk_1E6B964B8;
          id v21 = v10;
          id v22 = v11;
          id v24 = buf;
          SEL v25 = a2;
          id v23 = v12;
          [v23 performBlockAndWait:v20];
          *a6 = *((id *)v27 + 5);
          BOOL v13 = *((void *)v27 + 5) == 0;

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        id v16 = @"context";
      }
      else
      {
        id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        id v16 = @"expirationDate";
      }
    }
    else
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      id v16 = @"visitIdentifiers.count > 0";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    BOOL v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v13 = 0;
LABEL_19:

  return v13;
}

void __112__RTLearnedLocationStore__updateExpirationDateOfPlaceSubgraphWithVisitIdentifiers_expirationDate_context_error___block_invoke(uint64_t a1)
{
  v132[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v3 = +[RTLearnedPlaceMO entity];
  uint64_t v4 = (void *)[v2 initWithEntity:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K IN %@).@count > 0", @"visits", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  v131 = @"expirationDate";
  int v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
  v132[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:&v131 count:1];
  [v4 setPropertiesToUpdate:v7];

  [v4 setResultType:1];
  __int16 v8 = *(void **)(a1 + 48);
  id v117 = 0;
  id v9 = [v8 executeRequest:v4 error:&v117];
  id v10 = v117;
  if (v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v68 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      os_log_t v128 = v68;
      __int16 v129 = 2112;
      uint64_t v130 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of places, error, %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v10;
    id v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    id v14 = [v9 result];
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v17 = [v14 count];
      *(_DWORD *)buf = 138412546;
      os_log_t v128 = v16;
      __int16 v129 = 2048;
      uint64_t v130 = v17;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu places", buf, 0x16u);
    }
    id v18 = objc_alloc(MEMORY[0x1E4F1C038]);
    id v19 = +[RTMapItemMO entity];
    uint64_t v20 = (void *)[v18 initWithEntity:v19];

    id v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"place", v14];
    [v20 setPredicate:v21];

    v125 = @"expirationDate";
    id v22 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
    v126 = v22;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
    [v20 setPropertiesToUpdate:v23];

    [v20 setResultType:1];
    id v24 = *(void **)(a1 + 48);
    id v116 = 0;
    SEL v25 = [v24 executeRequest:v20 error:&v116];
    id v108 = v116;
    if (v108)
    {
      __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      SEL v27 = v108;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v89 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        os_log_t v128 = v89;
        __int16 v129 = 2112;
        uint64_t v130 = (uint64_t)v108;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of map items, error, %@", buf, 0x16u);
      }
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      id v29 = v108;
      uint64_t v30 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v29;
    }
    else
    {
      v107 = v25;
      id v31 = [v25 result];
      id v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v34 = [v31 count];
        *(_DWORD *)buf = 138412546;
        os_log_t v128 = v33;
        __int16 v129 = 2048;
        uint64_t v130 = v34;
        _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, updated expiration date of %lu map items", buf, 0x16u);
      }
      id v35 = objc_alloc(MEMORY[0x1E4F1C038]);
      uint64_t v36 = +[RTAddressMO entity];
      uint64_t v37 = (void *)[v35 initWithEntity:v36];

      v106 = v31;
      __int16 v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"mapItem", v31];
      [v37 setPredicate:v38];

      v123 = @"expirationDate";
      uint64_t v39 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
      v124 = v39;
      __int16 v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      [v37 setPropertiesToUpdate:v40];

      [v37 setResultType:2];
      id v41 = *(void **)(a1 + 48);
      id v115 = 0;
      v105 = v37;
      __int16 v42 = [v41 executeRequest:v37 error:&v115];
      id v43 = v115;
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      id v45 = v44;
      if (v43)
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v92 = NSStringFromSelector(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 138412546;
          os_log_t v128 = v92;
          __int16 v129 = 2112;
          uint64_t v130 = (uint64_t)v43;
          _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of address items, error, %@", buf, 0x16u);
        }
        uint64_t v46 = *(void *)(*(void *)(a1 + 56) + 8);
        id v47 = v43;
        __int16 v48 = *(void **)(v46 + 40);
        *(void *)(v46 + 40) = v47;
        uint64_t v49 = v43;
        SEL v27 = 0;
      }
      else
      {
        v104 = v20;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = NSStringFromSelector(*(SEL *)(a1 + 64));
          [v42 result];
          v52 = id v51 = v14;
          *(_DWORD *)buf = 138412546;
          os_log_t v128 = v50;
          __int16 v129 = 2112;
          uint64_t v130 = (uint64_t)v52;
          _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ address items", buf, 0x16u);

          id v14 = v51;
        }
        v103 = v42;

        id v53 = objc_alloc(MEMORY[0x1E4F1C0D0]);
        __int16 v54 = +[NSManagedObject entityName];
        id v55 = (void *)[v53 initWithEntityName:v54];

        v122 = @"device";
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
        [v55 setPropertiesToFetch:v56];

        v121 = @"device";
        __int16 v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
        [v55 setPropertiesToGroupBy:v57];

        [v55 setResultType:2];
        uint64_t v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN (%@)", v14];
        [v55 setPredicate:v58];

        id v59 = *(void **)(a1 + 48);
        id v114 = 0;
        v102 = v55;
        id v60 = [v59 executeFetchRequest:v55 error:&v114];
        id v61 = v114;
        v101 = v60;
        if (v61)
        {
          long long v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
          uint64_t v20 = v104;
          SEL v27 = 0;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v93 = NSStringFromSelector(*(SEL *)(a1 + 64));
            *(_DWORD *)buf = 138412546;
            os_log_t v128 = v93;
            __int16 v129 = 2112;
            uint64_t v130 = (uint64_t)v61;
            _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, encountered error fetching devices, error, %@", buf, 0x16u);
          }
          uint64_t v63 = *(void *)(*(void *)(a1 + 56) + 8);
          id v64 = v61;
          v65 = *(void **)(v63 + 40);
          *(void *)(v63 + 40) = v64;
          v66 = v61;
          __int16 v42 = v103;
          v67 = v101;
        }
        else
        {
          v97 = v14;
          v98 = v9;
          v65 = objc_opt_new();
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id v69 = v60;
          uint64_t v70 = [v69 countByEnumeratingWithState:&v110 objects:v120 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = *(void *)v111;
            do
            {
              for (uint64_t i = 0; i != v71; ++i)
              {
                if (*(void *)v111 != v72) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v74 = [*(id *)(*((void *)&v110 + 1) + 8 * i) objectForKey:@"device"];
                if (v74) {
                  [v65 addObject:v74];
                }
              }
              uint64_t v71 = [v69 countByEnumeratingWithState:&v110 objects:v120 count:16];
            }
            while (v71);
          }

          id v75 = objc_alloc(MEMORY[0x1E4F1C038]);
          id v76 = +[RTDeviceMO entity];
          v77 = (void *)[v75 initWithEntity:v76];

          v78 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN (%@)", v65];
          [v77 setPredicate:v78];

          v118 = @"expirationDate";
          v79 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
          v119 = v79;
          v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
          [v77 setPropertiesToUpdate:v80];

          [v77 setResultType:2];
          v81 = *(void **)(a1 + 48);
          id v109 = 0;
          v96 = v77;
          v100 = [v81 executeRequest:v77 error:&v109];
          id v82 = v109;
          v83 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
          SEL v27 = 0;
          v99 = v82;
          if (v82)
          {
            v84 = v83;
            id v14 = v97;
            id v9 = v98;
            __int16 v42 = v103;
            uint64_t v20 = v104;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 64));
              os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              os_log_t v128 = loga;
              __int16 v129 = 2112;
              uint64_t v130 = (uint64_t)v99;
              _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of devices, error, %@", buf, 0x16u);
            }
            uint64_t v85 = *(void *)(*(void *)(a1 + 56) + 8);
            v86 = v99;
            id v87 = v99;
            v88 = *(NSObject **)(v85 + 40);
            *(void *)(v85 + 40) = v87;
            v67 = v101;
          }
          else
          {
            log = v83;
            id v14 = v97;
            id v9 = v98;
            __int16 v42 = v103;
            uint64_t v20 = v104;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              v90 = NSStringFromSelector(*(SEL *)(a1 + 64));
              v91 = [v100 result];
              *(_DWORD *)buf = 138412546;
              os_log_t v128 = v90;
              __int16 v129 = 2112;
              uint64_t v130 = (uint64_t)v91;
              _os_log_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ devices", buf, 0x16u);
            }
            v67 = v101;
            v86 = 0;
            v88 = log;
          }

          v66 = 0;
        }

        __int16 v48 = v102;
        uint64_t v49 = 0;
      }

      uint64_t v30 = v106;
      SEL v25 = v107;
    }
  }
}

- (BOOL)_updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers:(id)a3 expirationDate:(id)a4 context:(id)a5 visitsUpdated:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a7)
  {
    if ([v12 count])
    {
      if (v13)
      {
        if (v14)
        {
          *(void *)buf = 0;
          uint64_t v30 = buf;
          uint64_t v31 = 0x3032000000;
          id v32 = __Block_byref_object_copy__69;
          id v33 = __Block_byref_object_dispose__69;
          id v34 = 0;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __133__RTLearnedLocationStore__updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers_expirationDate_context_visitsUpdated_error___block_invoke;
          v22[3] = &unk_1E6B964E0;
          id v23 = v12;
          id v24 = v13;
          id v25 = v14;
          __int16 v26 = buf;
          SEL v27 = a2;
          uint64_t v28 = a6;
          [v25 performBlockAndWait:v22];
          *a7 = *((id *)v30 + 5);
          BOOL v15 = *((void *)v30 + 5) == 0;

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
        uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        id v18 = @"context";
      }
      else
      {
        id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        id v18 = @"expirationDate";
      }
    }
    else
    {
      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      id v18 = @"visitIdentifiers.count > 0";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    BOOL v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v15 = 0;
LABEL_19:

  return v15;
}

void __133__RTLearnedLocationStore__updateExpirationDateOfVisitsAndTransitionsWithVisitIdentifiers_expirationDate_context_visitsUpdated_error___block_invoke(uint64_t a1)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v3 = +[RTLearnedVisitMO entity];
  uint64_t v4 = (void *)[v2 initWithEntity:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v60 = @"expirationDate";
  int v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
  v61[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  [v4 setPropertiesToUpdate:v7];

  [v4 setResultType:2];
  __int16 v8 = *(void **)(a1 + 48);
  id v52 = 0;
  id v9 = [v8 executeRequest:v4 error:&v52];
  id v10 = v52;
  if (v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v43 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      __int16 v57 = v43;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of visits, error, %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v10;
    id v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_22:

    goto LABEL_23;
  }
  if (*(void *)(a1 + 72))
  {
    BOOL v15 = [v9 result];
    **(void **)(a1 + 72) = [v15 unsignedIntegerValue];
  }
  id v16 = [v9 result];
  uint64_t v17 = [v16 unsignedIntegerValue];

  if (v17)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v20 = [v9 result];
      *(_DWORD *)buf = 138412546;
      __int16 v57 = v19;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v20;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ visits", buf, 0x16u);
    }
    id v14 = +[RTLearnedTransitionMO fetchRequest];
    id v21 = (void *)MEMORY[0x1E4F28BA0];
    id v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN (%@)", @"origin", @"identifier", *(void *)(a1 + 32)];
    v55[0] = v22;
    id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN (%@)", @"destination", @"identifier", *(void *)(a1 + 32)];
    v55[1] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    id v25 = [v21 orPredicateWithSubpredicates:v24];
    [v14 setPredicate:v25];

    [v14 setResultType:1];
    __int16 v26 = *(void **)(a1 + 48);
    id v51 = 0;
    SEL v27 = [v26 executeFetchRequest:v14 error:&v51];
    id v28 = v51;
    if (v28)
    {
      id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        __int16 v57 = v46;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v28;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "%@, encountered error fetching transitions to update expiration date, error, %@", buf, 0x16u);
      }
      uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
      id v31 = v28;
      id v32 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v31;
    }
    else
    {
      id v33 = objc_alloc(MEMORY[0x1E4F1C038]);
      id v34 = +[RTLearnedTransitionMO entity];
      id v32 = (void *)[v33 initWithEntity:v34];

      id v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN (%@)", v27];
      [v32 setPredicate:v35];

      id v53 = @"expirationDate";
      uint64_t v36 = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 40)];
      __int16 v54 = v36;
      uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v32 setPropertiesToUpdate:v37];

      [v32 setResultType:2];
      __int16 v38 = *(void **)(a1 + 48);
      id v50 = 0;
      uint64_t v49 = [v38 executeRequest:v32 error:&v50];
      id v39 = v50;
      __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      id v41 = v40;
      if (v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          __int16 v48 = NSStringFromSelector(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 138412546;
          __int16 v57 = v48;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v39;
          _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration date of transitions, error, %@", buf, 0x16u);
        }
        uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8);
        id v41 = *(NSObject **)(v42 + 40);
        *(void *)(v42 + 40) = 0;
      }
      else if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v47 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v44 = [v49 result];
        *(_DWORD *)buf = 138412546;
        __int16 v57 = v47;
        __int16 v58 = 2112;
        uint64_t v59 = v44;
        id v45 = (void *)v44;
        _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, updated expiration date of %@ transitions", buf, 0x16u);
      }
    }

    goto LABEL_22;
  }
LABEL_23:
}

- (id)_unionSetOfVisitIdentifiersOverlappingVisitIdentifiers:(id)a3 allowThresholdBypass:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6)
  {
    if ([v10 count])
    {
      if (v11)
      {
        *(void *)buf = 0;
        id v33 = buf;
        uint64_t v34 = 0x3032000000;
        id v35 = __Block_byref_object_copy__69;
        uint64_t v36 = __Block_byref_object_dispose__69;
        id v37 = 0;
        uint64_t v26 = 0;
        SEL v27 = &v26;
        uint64_t v28 = 0x3032000000;
        id v29 = __Block_byref_object_copy__69;
        uint64_t v30 = __Block_byref_object_dispose__69;
        id v31 = 0;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke;
        v19[3] = &unk_1E6B96548;
        id v20 = v10;
        id v21 = v11;
        id v22 = self;
        BOOL v25 = a4;
        id v23 = &v26;
        id v24 = buf;
        [v21 performBlockAndWait:v19];
        *a6 = (id) v27[5];
        if (v27[5]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = (void *)*((void *)v33 + 5);
        }
        id v14 = v12;

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_18;
      }
      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      id v16 = @"context";
    }
    else
    {
      BOOL v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers.count > 0", buf, 2u);
      }

      id v16 = @"visitIdentifiers.count > 0";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    id v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    id v14 = 0;
  }
LABEL_18:

  return v14;
}

void __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E016D870]();
  id v3 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  [v3 setFetchBatchSize:300];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"identifier", *(void *)(a1 + 32)];
  [v3 setPredicate:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  id v70 = 0;
  int v6 = [v5 executeFetchRequest:v3 error:&v70];
  id v7 = v70;
  __int16 v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = v7;
    id v11 = 0;
    uint64_t v12 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    id v13 = [[_RTMap alloc] initWithInput:v6];
    uint64_t v12 = [(_RTMap *)v13 withBlock:&__block_literal_global_138_0];

    id v14 = *(void **)(a1 + 48);
    +[NSManagedObject entityName];
    v16 = uint64_t v15 = a1;
    uint64_t v17 = *(void *)(v15 + 40);
    id v69 = 0;
    id v11 = [v14 createFetchRequestForOverlappingVisits:v12 entityName:v16 entryDatePropertyName:@"entryDate" exitDatePropertyName:@"exitDate" context:v17 error:&v69];
    id v18 = v69;
    id v19 = v69;

    a1 = v15;
    if (v19) {
      objc_storeStrong((id *)(*(void *)(*(void *)(v15 + 56) + 8) + 40), v18);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v68 = v8;
    id v21 = [v11 execute:&v68];
    id v20 = v68;

    if (v20)
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      id v23 = v20;
      id v24 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v23;
LABEL_34:

      goto LABEL_35;
    }
    BOOL v25 = [[_RTMap alloc] initWithInput:v21];
    id v24 = [(_RTMap *)v25 withBlock:&__block_literal_global_148];

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:[v24 count]];
    if (*(unsigned char *)(a1 + 72))
    {
      SEL v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "by-passing visit extension expiration threshold.", buf, 2u);
      }

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v28 = v24;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (!v29) {
        goto LABEL_33;
      }
      uint64_t v30 = v29;
      __int16 v58 = v24;
      id v31 = v11;
      uint64_t v32 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v60 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = [*(id *)(*((void *)&v59 + 1) + 8 * i) identifier];
          [v26 addObject:v34];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v30);
      id v11 = v31;
    }
    else
    {
      id v55 = v21;
      v56 = v11;
      uint64_t v57 = a1;
      id v28 = [MEMORY[0x1E4F1C9C8] date];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      __int16 v58 = v24;
      id v35 = v24;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v65 != v38) {
              objc_enumerationMutation(v35);
            }
            __int16 v40 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            id v41 = [v40 expirationDate];
            uint64_t v42 = [v41 dateByAddingTimeInterval:-4838400.0];

            id v43 = [v40 expirationDate];
            [v28 timeIntervalSinceDate:v43];
            double v45 = v44;

            uint64_t v46 = [v40 expirationDate];
            [v46 timeIntervalSinceDate:v42];
            double v48 = v47;

            if (fabs(v45 / v48) < 0.6)
            {
              uint64_t v49 = [v40 expirationDate];
              int v50 = [v28 isBeforeDate:v49];

              if (v50)
              {
                id v51 = [v40 identifier];
                [v26 addObject:v51];
              }
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v37);
      }

      id v11 = v56;
      a1 = v57;
      id v21 = v55;
      id v20 = 0;
    }
    id v24 = v58;
LABEL_33:

    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v26];
    uint64_t v53 = *(void *)(*(void *)(a1 + 64) + 8);
    __int16 v54 = *(void **)(v53 + 40);
    *(void *)(v53 + 40) = v52;

    goto LABEL_34;
  }
  id v20 = v8;
LABEL_35:
}

id __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:a2];
}

id __116__RTLearnedLocationStore__unionSetOfVisitIdentifiersOverlappingVisitIdentifiers_allowThresholdBypass_context_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:a2];
}

- (void)_updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v14[3] = &unk_1E6B93608;
  SEL v18 = a2;
  unint64_t v19 = a4;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1E016DB00](v14);
  [(RTStore *)self _performBlock:v13 contextType:2 errorHandler:v11];
}

void __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138412802;
    int v50 = v5;
    __int16 v51 = 2112;
    uint64_t v52 = v6;
    __int16 v53 = 2112;
    __int16 v54 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, updating transition, %@, motionActivityType, %@", buf, 0x20u);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v9 = +[RTLearnedTransitionMO entity];
  id v10 = (void *)[v8 initWithEntity:v9];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v10 setPredicate:v11];

  double v47 = @"predominantMotionActivityType";
  id v12 = (void *)MEMORY[0x1E4F28C68];
  id v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v14 = [v12 expressionForConstantValue:v13];
  double v48 = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  [v10 setPropertiesToUpdate:v15];

  [v10 setResultType:1];
  id v44 = 0;
  id v16 = [v3 executeRequest:v10 error:&v44];
  id v17 = v44;
  SEL v18 = [v16 result];
  uint64_t v19 = [v18 count];

  id v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  id v21 = v20;
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      int v50 = v22;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v17;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, encountered error updating predominant motion type of cloud transition, error, %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    int v50 = v23;
    __int16 v51 = 2048;
    uint64_t v52 = v19;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, updated predominant motion type of %lu cloud transitions", buf, 0x16u);
  }
  id v24 = objc_alloc(MEMORY[0x1E4F1C038]);
  BOOL v25 = +[RTLearnedLocationOfInterestTransitionMO entity];
  uint64_t v26 = (void *)[v24 initWithEntity:v25];

  SEL v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v26 setPredicate:v27];

  double v45 = @"predominantMotionActivityType";
  id v28 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v29 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  uint64_t v30 = [v28 expressionForConstantValue:v29];
  uint64_t v46 = v30;
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  [v26 setPropertiesToUpdate:v31];

  [v26 setResultType:1];
  id v43 = v17;
  uint64_t v32 = [v3 executeRequest:v26 error:&v43];
  id v33 = v43;

  uint64_t v34 = [v32 result];
  uint64_t v35 = [v34 count];

  uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  uint64_t v37 = v36;
  if (v33)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      int v50 = v38;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v33;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, encountered error updating predominant motion type of local transition, error, %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    id v39 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    int v50 = v39;
    __int16 v51 = 2048;
    uint64_t v52 = v35;
    _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, updated predominant motion type of %lu local transitions", buf, 0x16u);
  }
  __int16 v40 = [*(id *)(a1 + 40) mirroringManager];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke_157;
  v42[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v42[4] = *(void *)(a1 + 56);
  [v40 performExportWithHandler:v42];

  uint64_t v41 = *(void *)(a1 + 48);
  if (v41) {
    (*(void (**)(uint64_t, id))(v41 + 16))(v41, v33);
  }
}

void __85__RTLearnedLocationStore__updateTransitionWithIdentifier_motionActivityType_handler___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)updateTransitionWithIdentifier:(id)a3 motionActivityType:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__RTLearnedLocationStore_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __84__RTLearnedLocationStore_updateTransitionWithIdentifier_motionActivityType_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTransitionWithIdentifier:*(void *)(a1 + 40) motionActivityType:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (void)_updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (v10)
    {
      id v14 = [MEMORY[0x1E4F1CA48] array];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
      v23[3] = &unk_1E6B937C0;
      id v24 = v10;
      id v25 = v14;
      id v26 = v11;
      id v27 = v12;
      id v15 = v13;
      id v28 = v15;
      unint64_t v16 = v14;
      id v17 = (void *)MEMORY[0x1E016DB00](v23);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke_164;
      v21[3] = &unk_1E6B90C18;
      id v22 = v15;
      [(RTStore *)self _performBlock:v17 contextType:2 errorHandler:v21];
    }
    else
    {
      SEL v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"visits cannot be nil";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      unint64_t v16 = [v18 errorWithDomain:v19 code:7 userInfo:v20];

      (*((void (**)(id, NSObject *))v13 + 2))(v13, v16);
    }
  }
  else
  {
    unint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v25 = a1;
  id obj = *(id *)(a1 + 32);
  id v23 = v3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v26)
  {
    uint64_t v4 = *(void *)v30;
    uint64_t v5 = &off_1E6B8E000;
    unint64_t v6 = 0x1E4F28000uLL;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
        id v9 = [v5[414] fetchRequest];
        id v10 = *(void **)(v6 + 3936);
        id v11 = [v8 identifier];
        id v12 = [v10 predicateWithFormat:@"%K == %@", @"identifier", v11];
        [v9 setPredicate:v12];

        id v28 = 0;
        id v13 = [v3 executeFetchRequest:v9 error:&v28];
        id v14 = v28;
        id v15 = [v13 firstObject];

        if (v14)
        {
          [*(id *)(v25 + 40) addObject:v14];
        }
        else
        {
          unint64_t v16 = *(void **)(v25 + 48);
          id v17 = [v8 identifier];
          SEL v18 = [v16 objectForKey:v17];

          id v3 = v23;
          unint64_t v6 = 0x1E4F28000;
          id v19 = (id)[v5[414] managedObjectWithVisit:v8 finerGranularityInferredMapItem:v18 place:*(void *)(v25 + 56) managedObject:v15 inManagedObjectContext:v23];
        }
        ++v7;
        uint64_t v5 = &off_1E6B8E000;
      }
      while (v26 != v7);
      uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v26);
  }

  id v27 = 0;
  char v20 = [v3 save:&v27];
  id v21 = v27;
  if ((v20 & 1) == 0)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Failed to save update to visits with error, %@", buf, 0xCu);
    }

    [*(id *)(v25 + 40) addObject:v21];
  }
  (*(void (**)(void))(*(void *)(v25 + 64) + 16))();
}

uint64_t __87__RTLearnedLocationStore__updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateVisits:(id)a3 finerGranularityInferredMapItems:(id)a4 place:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__RTLearnedLocationStore_updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke;
  block[3] = &unk_1E6B914E0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __86__RTLearnedLocationStore_updateVisits_finerGranularityInferredMapItems_place_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisits:*(void *)(a1 + 40) finerGranularityInferredMapItems:*(void *)(a1 + 48) place:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTLearnedLocationStore_fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__RTLearnedLocationStore_fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDevicesNotFromCurrentDeviceWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchDevicesNotFromCurrentDeviceWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke;
    v11[3] = &unk_1E6B92A40;
    id v6 = v4;
    id v12 = v6;
    uint64_t v7 = (void *)MEMORY[0x1E016DB00](v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke_169;
    v9[3] = &unk_1E6B90C18;
    id v10 = v6;
    [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v9];

    id v8 = v12;
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTDeviceMO fetchRequest];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v3 currentDevice];
  uint64_t v7 = [v6 identifier];
  id v8 = [v5 predicateWithFormat:@"%K != %@", @"identifier", v7];
  [v4 setPredicate:v8];

  [v4 setReturnsObjectsAsFaults:0];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v32 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "TransitMetrics, request, %@", buf, 0xCu);
  }

  id v29 = 0;
  id v10 = [v3 executeFetchRequest:v4 error:&v29];
  id v11 = v29;
  if (v11)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v22 = a1;
    id v23 = v4;
    id v24 = v3;
    id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v10 count]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v19 = +[RTDevice createWithManagedObject:v18];
          if (v19)
          {
            [v12 addObject:v19];
          }
          else
          {
            id v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v32 = v18;
              _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "TransitMetrics, invalid deviceMO object, %@", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v15);
    }

    (*(void (**)(void))(*(void *)(v22 + 32) + 16))();
    id v4 = v23;
    id v3 = v24;
    id v11 = 0;
    id v10 = v21;
  }
}

void __71__RTLearnedLocationStore__fetchDevicesNotFromCurrentDeviceWithHandler___block_invoke_169(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "TransitMetrics, fetch block failed, error, %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke_173;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid visit.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  int v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  id v15 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v15];

  id v9 = v15;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v14 = [v8 count];
    *(_DWORD *)buf = 138413058;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9 || ![v8 count])
  {
    id v11 = 0;
  }
  else
  {
    id v12 = [v8 firstObject];
    id v11 = [v12 finerGranularityInferredMapItem];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__RTLearnedLocationStore__fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFinerGranularityInferredMapItemForVisit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTLearnedLocationStore_fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __79__RTLearnedLocationStore_fetchFinerGranularityInferredMapItemForVisit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFinerGranularityInferredMapItemForVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchPlacesWithPredicate:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke;
    v13[3] = &unk_1E6B91060;
    id v14 = v7;
    SEL v16 = a2;
    id v9 = v8;
    id v15 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke_175;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

void __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequestSortedByCreation];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setPredicate:*(void *)(a1 + 32)];
  id v23 = 0;
  int v5 = [v3 executeFetchRequest:v4 error:&v23];
  id v6 = v23;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v16 = [v5 count];
    *(_DWORD *)buf = 138413058;
    long long v26 = v15;
    __int16 v27 = 2112;
    long long v28 = v4;
    __int16 v29 = 2048;
    uint64_t v30 = v16;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v17 = a1;
    id v18 = v3;
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v5 count]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = +[RTLearnedPlace createWithManagedObject:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
          if (v14) {
            [v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    a1 = v17;
    id v3 = v18;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__RTLearnedLocationStore__fetchPlacesWithPredicate_handler___block_invoke_175(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTLearnedLocationStore_fetchPlacesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__RTLearnedLocationStore_fetchPlacesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithPredicate:0 handler:*(void *)(a1 + 40)];
}

- (void)fetchPlacesWithPredicate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLearnedLocationStore_fetchPlacesWithPredicate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTLearnedLocationStore_fetchPlacesWithPredicate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithPredicate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke;
    v15[3] = &unk_1E6B96570;
    unint64_t v18 = a3;
    id v16 = v9;
    SEL v19 = a2;
    id v11 = v10;
    id v17 = v11;
    id v12 = (void *)MEMORY[0x1E016DB00](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke_179;
    v13[3] = &unk_1E6B90C18;
    id v14 = v11;
    [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v13];
  }
}

void __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequestSortedByCreation];
  [v4 setReturnsObjectsAsFaults:0];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"type", v7];

  if (v8) {
    [v5 addObject:v8];
  }
  if (*(void *)(a1 + 32)) {
    [v5 addObject:];
  }
  id v9 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  [v4 setPredicate:v9];

  id v29 = 0;
  id v10 = [v3 executeFetchRequest:v4 error:&v29];
  id v11 = v29;
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v21 = [v10 count];
    *(_DWORD *)buf = 138413058;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v11)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v24 = v8;
    uint64_t v23 = a1;
    id v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v10 count]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v22 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          SEL v19 = +[RTLearnedPlace createWithManagedObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }

    a1 = v23;
    id v8 = v24;
    id v10 = v22;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__RTLearnedLocationStore__fetchPlacesWithType_predicate_handler___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithType:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTLearnedLocationStore_fetchPlacesWithType_handler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __54__RTLearnedLocationStore_fetchPlacesWithType_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithType:*(void *)(a1 + 48) predicate:0 handler:*(void *)(a1 + 40)];
}

- (void)fetchPlacesWithType:(unint64_t)a3 predicate:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__RTLearnedLocationStore_fetchPlacesWithType_predicate_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __64__RTLearnedLocationStore_fetchPlacesWithType_predicate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithType:*(void *)(a1 + 56) predicate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchPlaceOfVisit:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke_180;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid visit.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  int v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  id v16 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v16];

  id v9 = v16;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v15 = [v8 count];
    *(_DWORD *)buf = 138413058;
    id v18 = v14;
    __int16 v19 = 2112;
    SEL v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9 || ![v8 count])
  {
    id v11 = 0;
  }
  else
  {
    id v12 = [v8 firstObject];
    uint64_t v13 = [v12 place];
    id v11 = +[RTLearnedPlace createWithManagedObject:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__RTLearnedLocationStore__fetchPlaceOfVisit_handler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlaceOfVisit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTLearnedLocationStore_fetchPlaceOfVisit_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__RTLearnedLocationStore_fetchPlaceOfVisit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlaceOfVisit:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke;
      v20[3] = &unk_1E6B91018;
      id v21 = v10;
      id v22 = v9;
      SEL v24 = a2;
      id v12 = v11;
      id v23 = v12;
      id v13 = (void *)MEMORY[0x1E016DB00](v20);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_206;
      v18[3] = &unk_1E6B90C18;
      id v19 = v12;
      [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v18];

      id v14 = v21;
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"requires a valid mapItem.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v17 = [v15 errorWithDomain:v16 code:7 userInfo:v14];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
    }
  }
}

void __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTMapItemMO fetchRequest];
  [v4 setFetchLimit:5];
  [v4 setPredicate:*(void *)(a1 + 32)];
  long long v61 = v4;
  [v4 setReturnsObjectsAsFaults:0];
  int v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = v5;
  if (*(void *)(a1 + 32)) {
    [v5 addObject:];
  }
  long long v60 = v6;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [*(id *)(a1 + 40) identifier];
  id v11 = [v9 predicateWithFormat:@"%K = %@", @"identifier", v10];
  v83[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
  uint64_t v13 = [v8 andPredicateWithSubpredicates:v12];

  __int16 v58 = (void *)v13;
  [v7 addObject:v13];
  if ([*(id *)(a1 + 40) validMUID])
  {
    id v14 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 40) muid]];
    uint64_t v17 = [v15 predicateWithFormat:@"%K = %@", @"muid", v16];
    v82[0] = v17;
    id v18 = (void *)MEMORY[0x1E4F28F60];
    id v19 = [NSNumber numberWithInteger:[*(id *)(a1 + 40) resultProviderID]];
    SEL v20 = [v18 predicateWithFormat:@"%K = %@", @"resultProviderID", v19];
    v82[1] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    id v22 = [v14 andPredicateWithSubpredicates:v21];

    [v7 addObject:v22];
  }
  memset(&v70[1], 0, 32);
  id v23 = [*(id *)(a1 + 40) location];
  [v23 latitude];
  SEL v24 = [*(id *)(a1 + 40) location];
  [v24 longitude];
  RTCommonCalculateBoundingBox();

  uint64_t v57 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
  long long v64 = [NSNumber numberWithDouble:0.0];
  long long v59 = v7;
  contexta = [v25 predicateWithFormat:@"%@ <= %K", v64, @"longitude"];
  v81[0] = contexta;
  long long v26 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v55 = [NSNumber numberWithDouble:0.0];
  long long v27 = [v26 predicateWithFormat:@"%K <= %@", @"longitude", v55];
  v81[1] = v27;
  long long v28 = (void *)MEMORY[0x1E4F28F60];
  id v29 = [NSNumber numberWithDouble:0.0];
  uint64_t v30 = [v28 predicateWithFormat:@"%@ <= %K", v29, @"latitude"];
  v81[2] = v30;
  __int16 v31 = (void *)MEMORY[0x1E4F28F60];
  id v32 = [NSNumber numberWithDouble:0.0];
  __int16 v33 = [v31 predicateWithFormat:@"%K <= %@", @"latitude", v32];
  v81[3] = v33;
  id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:4];
  __int16 v35 = [v57 andPredicateWithSubpredicates:v34];

  [v59 addObject:v35];
  v56 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v59];
  [v60 addObject:];
  uint64_t v36 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v60];
  __int16 v37 = v61;
  [v61 setPredicate:v36];

  id v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v80 = v38;
  uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  [v61 setSortDescriptors:v39];

  __int16 v40 = [MEMORY[0x1E4F1CA48] array];
  id v41 = 0;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    v70[0] = 0;
    uint64_t v42 = v3;
    id v43 = [v3 executeFetchRequest:v37 error:v70];
    id v65 = v70[0];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v41 = v43;
    uint64_t v44 = [v41 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v67 != v46) {
            objc_enumerationMutation(v41);
          }
          uint64_t v48 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v49 = (void *)MEMORY[0x1E016D870]();
          int v50 = [MEMORY[0x1E4F5CE38] createWithManagedObject:v48];
          __int16 v51 = v50;
          if (v50 && [v50 isEqualToMapItem:*(void *)(a1 + 40)]) {
            [v40 addObject:v51];
          }
        }
        uint64_t v45 = [v41 countByEnumeratingWithState:&v66 objects:v79 count:16];
      }
      while (v45);
    }

    __int16 v37 = v61;
    [v61 setFetchOffset:[v61 fetchOffset] + [v41 count]];
    id v3 = v42;
    [v42 reset];
  }
  while ([v41 count] && !v65);
  uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    __int16 v53 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v54 = [v61 fetchOffset];
    *(_DWORD *)buf = 138413058;
    uint64_t v72 = v53;
    __int16 v73 = 2112;
    uint64_t v74 = v61;
    __int16 v75 = 2048;
    uint64_t v76 = v54;
    __int16 v77 = 2112;
    id v78 = v65;
    _os_log_debug_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__RTLearnedLocationStore__fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStoredMapItemsWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_2;
  v4[3] = &unk_1E6B92A68;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _fetchStoredMapItemsWithMapItem:v2 predicate:v3 handler:v4];
}

uint64_t __75__RTLearnedLocationStore_fetchStoredMapItemsWithMapItem_predicate_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke;
      v20[3] = &unk_1E6B91018;
      id v21 = v10;
      id v22 = v9;
      SEL v24 = a2;
      id v12 = v11;
      id v23 = v12;
      id v13 = (void *)MEMORY[0x1E016DB00](v20);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke_217;
      v18[3] = &unk_1E6B90C18;
      id v19 = v12;
      [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v18];

      id v14 = v21;
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"requires a valid mapItem.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v17 = [v15 errorWithDomain:v16 code:7 userInfo:v14];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
    }
  }
}

void __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke(uint64_t a1, void *a2)
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v63 = a2;
  uint64_t v3 = +[RTLearnedPlaceMO fetchRequestSortedByCreation];
  [v3 setFetchLimit:5];
  [v3 setPredicate:*(void *)(a1 + 32)];
  __int16 v58 = v3;
  [v3 setReturnsObjectsAsFaults:0];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v4;
  if (*(void *)(a1 + 32)) {
    [v4 addObject:];
  }
  uint64_t v57 = v5;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [*(id *)(a1 + 40) identifier];
  id v10 = [v8 predicateWithFormat:@"%K.%K = %@", @"mapItem", @"identifier", v9];
  v81[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  id v12 = [v7 andPredicateWithSubpredicates:v11];

  [v6 addObject:v12];
  if ([*(id *)(a1 + 40) validMUID])
  {
    id v13 = (void *)MEMORY[0x1E4F28BA0];
    id v14 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 40) muid]];
    uint64_t v16 = [v14 predicateWithFormat:@"%K.%K = %@", @"mapItem", @"muid", v15];
    v80[0] = v16;
    id v17 = (void *)MEMORY[0x1E4F28F60];
    id v18 = [NSNumber numberWithInteger:[*(id *)(a1 + 40) resultProviderID]];
    id v19 = [v17 predicateWithFormat:@"%K.%K = %@", @"mapItem", @"resultProviderID", v18];
    v80[1] = v19;
    SEL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    id v21 = [v13 andPredicateWithSubpredicates:v20];

    [v6 addObject:v21];
  }
  memset(&v68[1], 0, 32);
  id v22 = [*(id *)(a1 + 40) location];
  [v22 latitude];
  id v23 = [*(id *)(a1 + 40) location];
  [v23 longitude];
  RTCommonCalculateBoundingBox();

  uint64_t v55 = (void *)MEMORY[0x1E4F28BA0];
  SEL v24 = (void *)MEMORY[0x1E4F28F60];
  long long v61 = [NSNumber numberWithDouble:0.0];
  v56 = v6;
  contexta = [v24 predicateWithFormat:@"%@ <= %K.%K", v61, @"mapItem", @"longitude"];
  v79[0] = contexta;
  uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
  __int16 v53 = [NSNumber numberWithDouble:0.0];
  long long v26 = [v25 predicateWithFormat:@"%K.%K <= %@", @"mapItem", @"longitude", v53];
  v79[1] = v26;
  long long v27 = (void *)MEMORY[0x1E4F28F60];
  long long v28 = [NSNumber numberWithDouble:0.0];
  id v29 = [v27 predicateWithFormat:@"%@ <= %K.%K", v28, @"mapItem", @"latitude"];
  v79[2] = v29;
  uint64_t v30 = (void *)MEMORY[0x1E4F28F60];
  __int16 v31 = [NSNumber numberWithDouble:0.0];
  id v32 = [v30 predicateWithFormat:@"%K.%K <= %@", @"mapItem", @"latitude", v31];
  v79[3] = v32;
  __int16 v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
  id v34 = [v55 andPredicateWithSubpredicates:v33];

  [v56 addObject:v34];
  uint64_t v54 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v56];
  [v57 addObject:];
  __int16 v35 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v57];
  uint64_t v36 = v58;
  [v58 setPredicate:v35];

  __int16 v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  id v78 = v37;
  id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  [v58 setSortDescriptors:v38];

  uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
  id v40 = 0;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    v68[0] = 0;
    id v41 = [v63 executeFetchRequest:v36 error:v68];
    id v62 = v68[0];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v40 = v41;
    uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v65 != v44) {
            objc_enumerationMutation(v40);
          }
          uint64_t v46 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          double v47 = [MEMORY[0x1E4F5CE38] createWithManagedObject:v46];
          uint64_t v48 = v47;
          if (v47 && [v47 isEqualToMapItem:*(void *)(a1 + 40)])
          {
            uint64_t v49 = +[RTLearnedPlace createWithManagedObject:v46];
            if (v49) {
              [v39 addObject:v49];
            }
          }
        }
        uint64_t v43 = [v40 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v43);
    }

    uint64_t v36 = v58;
    [v58 setFetchOffset:[v58 fetchOffset] + [v40 count]];
    [v63 reset];
  }
  while ([v40 count] && !v62);
  int v50 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    __int16 v51 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v52 = [v58 fetchOffset];
    *(_DWORD *)buf = 138413058;
    id v70 = v51;
    __int16 v71 = 2112;
    uint64_t v72 = v58;
    __int16 v73 = 2048;
    uint64_t v74 = v52;
    __int16 v75 = 2112;
    id v76 = v62;
    _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __68__RTLearnedLocationStore__fetchPlacesWithMapItem_predicate_handler___block_invoke_217(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlaceWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke_2;
  v4[3] = &unk_1E6B92A68;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _fetchPlacesWithMapItem:v2 predicate:v3 handler:v4];
}

void __66__RTLearnedLocationStore_fetchPlaceWithMapItem_predicate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

- (void)fetchPlacesWithMapItem:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTLearnedLocationStore_fetchPlacesWithMapItem_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __57__RTLearnedLocationStore_fetchPlacesWithMapItem_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithMapItem:*(void *)(a1 + 40) predicate:0 handler:*(void *)(a1 + 48)];
}

- (void)fetchPlacesWithMapItem:(id)a3 predicate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__RTLearnedLocationStore_fetchPlacesWithMapItem_predicate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __67__RTLearnedLocationStore_fetchPlacesWithMapItem_predicate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithMapItem:*(void *)(a1 + 40) predicate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __80__RTLearnedLocationStore__fetchPlacesWithinDistance_location_predicate_handler___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithinDistance:(double)a3 location:(id)a4 predicate:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__RTLearnedLocationStore_fetchPlacesWithinDistance_location_predicate_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  double v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __79__RTLearnedLocationStore_fetchPlacesWithinDistance_location_predicate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithinDistance:*(void *)(a1 + 40) location:*(void *)(a1 + 48) predicate:*(void *)(a1 + 56) handler:*(double *)(a1 + 64)];
}

- (void)_fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke_229;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid mapItem identifier.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:7 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == %@", @"mapItem", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v13 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v13];

  id v7 = v13;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = [v6 count];
    *(_DWORD *)buf = 138413058;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v7 || ![v6 count])
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [v6 firstObject];
    id v9 = +[RTLearnedPlace createWithManagedObject:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __67__RTLearnedLocationStore__fetchPlaceWithMapItemIdentifier_handler___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlaceWithMapItemIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTLearnedLocationStore_fetchPlaceWithMapItemIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__RTLearnedLocationStore_fetchPlaceWithMapItemIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlaceWithMapItemIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitWithIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      __int16 v18 = v7;
      SEL v20 = a2;
      uint64_t v19 = v9;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke_233;
      v15[3] = &unk_1E6B90C18;
      __int16 v16 = v19;
      [(RTStore *)self _performBlock:v17 contextType:1 errorHandler:v15];

      id v10 = v18;
      goto LABEL_10;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      SEL v24 = "-[RTLearnedLocationStore _fetchVisitWithIdentifier:handler:]";
      __int16 v25 = 1024;
      int v26 = 2294;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v22 = @"identifier is required";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:7 userInfo:v10];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v14);

      goto LABEL_10;
    }
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    SEL v24 = "-[RTLearnedLocationStore _fetchVisitWithIdentifier:handler:]";
    __int16 v25 = 1024;
    int v26 = 2295;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_10:
}

void __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[RTLearnedVisitMO fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  [v2 setFetchLimit:1];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v10 = 0;
  id v4 = [v2 execute:&v10];
  id v5 = v10;
  id v6 = [v4 firstObject];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v2;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, result, %@, error, %@", buf, 0x2Au);
  }
  id v8 = 0;
  if (!v5 && v6)
  {
    id v8 = +[RTLearnedVisit createWithManagedObject:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__RTLearnedLocationStore__fetchVisitWithIdentifier_handler___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTLearnedLocationStore_fetchPlacesWithIdentifiers_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__RTLearnedLocationStore_fetchPlacesWithIdentifiers_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPlacesWithIdentifiers:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchPlacesWithIdentifiers:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke;
    v13[3] = &unk_1E6B91060;
    id v14 = v7;
    SEL v16 = a2;
    id v9 = v8;
    id v15 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_238;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

void __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v25 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v25];
  id v7 = v25;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    SEL v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v17 = [v6 count];
    *(_DWORD *)buf = 138413058;
    long long v28 = v16;
    __int16 v29 = 2112;
    uint64_t v30 = v4;
    __int16 v31 = 2048;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v19 = v3;
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v6 count]];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = +[RTLearnedPlace createWithManagedObject:*(void *)(*((void *)&v21 + 1) + 8 * v14)];
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    id v6 = v18;
    id v3 = v19;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_235;
  v20[3] = &__block_descriptor_40_e31_v32__0__RTLearnedPlace_8Q16_B24l;
  void v20[4] = *(void *)(a1 + 48);
  [v9 enumerateObjectsUsingBlock:v20];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_235(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, place, %@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __62__RTLearnedLocationStore__fetchPlacesWithIdentifiers_handler___block_invoke_238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLearnedLocationStore_fetchVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTLearnedLocationStore_fetchVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitsPredating:(id)a3 handler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if (v6)
    {
      int v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K < %@", @"exitDate", v6];
      [(RTLearnedLocationStore *)self _fetchVisitsWithPredicate:v8 ascending:1 limit:0 handler:v7];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F5CFE8];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"requires a valid date.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v12 = [v9 errorWithDomain:v10 code:0 userInfo:v11];
      v7[2](v7, 0, v12);
    }
  }
}

- (void)fetchVisitsPredating:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTLearnedLocationStore_fetchVisitsPredating_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __55__RTLearnedLocationStore_fetchVisitsPredating_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsPredating:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 limit:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke;
    v18[3] = &unk_1E6B965E0;
    id v19 = v11;
    BOOL v23 = a4;
    id v20 = v12;
    SEL v22 = a2;
    id v14 = v13;
    id v21 = v14;
    id v15 = (void *)MEMORY[0x1E016DB00](v18);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke_245;
    v16[3] = &unk_1E6B90C18;
    id v17 = v14;
    [(RTStore *)self _performBlock:v15 contextType:1 errorHandler:v16];
  }
}

void __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setPredicate:*(void *)(a1 + 32)];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:*(unsigned __int8 *)(a1 + 64)];
  v36[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v4 setSortDescriptors:v6];

  id v7 = *(void **)(a1 + 40);
  if (v7) {
    [v4 setFetchLimit:[v7 unsignedIntegerValue]];
  }
  id v26 = 0;
  int v8 = [v3 executeFetchRequest:v4 error:&v26];
  id v9 = v26;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    __int16 v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    id v21 = v3;
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", *(void *)(*((void *)&v22 + 1) + 8 * v16), v20);
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    int v8 = v20;
    id v3 = v21;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__RTLearnedLocationStore__fetchVisitsWithPredicate_ascending_limit_handler___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTLearnedLocationStore_fetchVisitsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__RTLearnedLocationStore_fetchVisitsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsWithPredicate:0 ascending:1 limit:0 handler:*(void *)(a1 + 40)];
}

- (void)fetchVisitsWithDevice:(id)a3 dateInterval:(id)a4 handler:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    long long v22 = "Invalid parameter not satisfying: device";
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    long long v22 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    long long v22 = "Invalid parameter not satisfying: handler";
    goto LABEL_13;
  }
  id v12 = [v9 startDate];
  uint64_t v13 = [v9 endDate];
  uint64_t v14 = [(RTLearnedLocationStore *)self predicateForVisitsFromEntryDate:v12 exitDate:v13];

  uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v16 = [v8 identifier];
  id v17 = [v15 predicateWithFormat:@"%K.%K == %@", @"device", @"identifier", v16];

  id v18 = objc_alloc(MEMORY[0x1E4F28BA0]);
  v28[0] = v14;
  v28[1] = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v20 = (void *)[v18 initWithType:1 subpredicates:v19];

  id v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    long long v23 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    long long v25 = v20;
    __int16 v26 = 2112;
    uint64_t v27 = v23;
    _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "TransitMetrics, visit predicate, %@, device, %@", buf, 0x16u);
  }
  [(RTLearnedLocationStore *)self fetchVisitsWithPredicate:v20 handler:v11];

LABEL_14:
}

- (void)fetchVisitsWithPredicate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTLearnedLocationStore_fetchVisitsWithPredicate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__RTLearnedLocationStore_fetchVisitsWithPredicate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsWithPredicate:*(void *)(a1 + 40) ascending:1 limit:0 handler:*(void *)(a1 + 48)];
}

- (void)fetchVisitsWithPredicate:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(RTNotifier *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__RTLearnedLocationStore_fetchVisitsWithPredicate_ascending_dateInterval_limit_handler___block_invoke;
  v21[3] = &unk_1E6B96608;
  id v22 = v12;
  id v23 = v13;
  BOOL v27 = a4;
  long long v24 = self;
  id v25 = v14;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

void __88__RTLearnedLocationStore_fetchVisitsWithPredicate_ascending_dateInterval_limit_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  id v10 = v2;
  if (*(void *)(a1 + 32))
  {
    [v2 addObject:];
    id v3 = v10;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [v4 startDate];
    id v7 = [*(id *)(a1 + 40) endDate];
    id v8 = [v5 predicateWithFormat:@"%K >= %@ && %K <= %@", @"entryDate", v6, @"exitDate", v7];

    if (v8) {
      [v10 addObject:v8];
    }

    id v3 = v10;
  }
  if ([v3 count])
  {
    id v9 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v9 = 0;
  }
  [*(id *)(a1 + 48) _fetchVisitsWithPredicate:v9 ascending:*(unsigned __int8 *)(a1 + 72) limit:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchVisitsToPlace:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke_252;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      id v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid place.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke(uint64_t a1, void *a2)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K.%K == %@", @"place", @"identifier", v6];
  [v4 setPredicate:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
  v38[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  [v4 setSortDescriptors:v9];

  id v28 = 0;
  id v10 = [v3 executeFetchRequest:v4 error:&v28];
  id v11 = v28;
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    SEL v20 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v21 = [v10 count];
    *(_DWORD *)buf = 138413058;
    __int16 v31 = v20;
    __int16 v32 = 2112;
    uint64_t v33 = v4;
    __int16 v34 = 2048;
    uint64_t v35 = v21;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v11)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v22 = a1;
    id v23 = v3;
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v10 count]];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = +[RTLearnedVisit createWithManagedObject:*(void *)(*((void *)&v24 + 1) + 8 * v18)];
          if (v19) {
            [v13 addObject:v19];
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    a1 = v22;
    id v3 = v23;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__RTLearnedLocationStore__fetchVisitsToPlace_handler___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitsToPlace:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTLearnedLocationStore_fetchVisitsToPlace_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __53__RTLearnedLocationStore_fetchVisitsToPlace_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsToPlace:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchLastVisitWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke;
    v11[3] = &unk_1E6B96630;
    SEL v13 = a2;
    id v7 = v5;
    id v12 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke_253;
    v9[3] = &unk_1E6B90C18;
    id v10 = v7;
    [(RTStore *)self _performBlock:v8 contextType:1 errorHandler:v9];
  }
}

void __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v3 currentDevice];
  id v7 = [v6 identifier];
  id v8 = [v5 predicateWithFormat:@"%K.%K == %@", @"device", @"identifier", v7];
  [v4 setPredicate:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:0];
  v27[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v4 setSortDescriptors:v10];

  [v4 setFetchLimit:1];
  id v18 = 0;
  id v11 = [v3 executeFetchRequest:v4 error:&v18];

  id v12 = v18;
  SEL v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v17 = [v11 count];
    *(_DWORD *)buf = 138413058;
    SEL v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    __int16 v23 = 2048;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  id v14 = 0;
  if ([v11 count] && !v12)
  {
    uint64_t v15 = [v11 firstObject];
    id v14 = +[RTLearnedVisit createWithManagedObject:v15];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__RTLearnedLocationStore__fetchLastVisitWithHandler___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLastVisitWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__RTLearnedLocationStore_fetchLastVisitWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__RTLearnedLocationStore_fetchLastVisitWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastVisitWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke;
    v13[3] = &unk_1E6B91060;
    id v14 = v7;
    SEL v16 = a2;
    id v9 = v8;
    id v15 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke_257;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

void __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[RTLearnedVisitMO fetchRequest];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"place.identifier", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:0];
  v19[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:1];
  [v2 setReturnsObjectsAsFaults:0];
  id v12 = 0;
  id v6 = [v2 execute:&v12];
  id v7 = v12;
  id v8 = [v6 firstObject];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v14 = v11;
    __int16 v15 = 2112;
    SEL v16 = v2;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  id v10 = 0;
  if (v8 && !v7)
  {
    id v10 = +[RTLearnedVisit createWithManagedObject:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__RTLearnedLocationStore__fetchLastVisitToPlaceWithIdentifier_handler___block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLastVisitToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTLearnedLocationStore_fetchLastVisitToPlaceWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTLearnedLocationStore_fetchLastVisitToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLastVisitToPlaceWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke;
    v13[3] = &unk_1E6B91060;
    id v14 = v7;
    SEL v16 = a2;
    id v9 = v8;
    id v15 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke_258;
    v11[3] = &unk_1E6B90C18;
    id v12 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v11];
  }
}

void __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"place.identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v9 = 0;
  [v3 countForFetchRequest:v4 error:&v9];

  id v6 = v9;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  id v16 = v9;
  __int16 v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __82__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = a1[6];
  if (v3) {
    return [v2 _fetchCountOfVisitsToPlaceWithIdentifier:v4 endDate:v3 handler:a1[7]];
  }
  else {
    return [v2 _fetchCountOfVisitsToPlaceWithIdentifier:v4 handler:a1[7]];
  }
}

- (void)fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__RTLearnedLocationStore_fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __100__RTLearnedLocationStore_fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCountOfVisitsToLocationOfInterestWithIdentifier:*(void *)(a1 + 40) dateInterval:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchCountOfVisitsToLocationOfInterestWithIdentifier:(id)a3 dateInterval:(id)a4 handler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[RTLearnedLocationStore _fetchCountOfVisitsToLocationOfInterestWithIdentifier:dateInterval:handler:]";
      __int16 v29 = 1024;
      int v30 = 2865;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }
  }
  if (v11)
  {
    id v13 = [v10 startDate];
    id v14 = [v10 endDate];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke;
    v21[3] = &unk_1E6B963A0;
    id v22 = v9;
    id v23 = v13;
    id v24 = v14;
    SEL v26 = a2;
    id v15 = v11;
    id v25 = v15;
    id v16 = v14;
    id v17 = v13;
    id v18 = (void *)MEMORY[0x1E016DB00](v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke_265;
    v19[3] = &unk_1E6B90C18;
    id v20 = v15;
    [(RTStore *)self _performBlock:v18 contextType:1 errorHandler:v19];
  }
}

void __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K >= %@  && %K <= %@ ", @"locationOfInterest.identifier", *(void *)(a1 + 32), @"exitDate", *(void *)(a1 + 40), @"exitDate", *(void *)(a1 + 48)];
  [v4 setPredicate:v5];

  id v9 = 0;
  [v3 countForFetchRequest:v4 error:&v9];

  id v6 = v9;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __101__RTLearnedLocationStore__fetchCountOfVisitsToLocationOfInterestWithIdentifier_dateInterval_handler___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke;
    v16[3] = &unk_1E6B91018;
    id v17 = v9;
    id v18 = v10;
    SEL v20 = a2;
    id v12 = v11;
    id v19 = v12;
    id v13 = (void *)MEMORY[0x1E016DB00](v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke_269;
    v14[3] = &unk_1E6B90C18;
    id v15 = v12;
    [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v14];
  }
}

void __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTLearnedVisitMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K <= %@ ", @"place.identifier", *(void *)(a1 + 32), @"exitDate", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v9 = 0;
  [v3 countForFetchRequest:v4 error:&v9];

  id v6 = v9;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __83__RTLearnedLocationStore__fetchCountOfVisitsToPlaceWithIdentifier_endDate_handler___block_invoke_269(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCountOfVisitsToPlaceWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTLearnedLocationStore_fetchCountOfVisitsToPlaceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCountOfVisitsToPlaceWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke;
    v14[3] = &unk_1E6B91060;
    id v15 = v7;
    SEL v17 = a2;
    id v9 = v8;
    id v16 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v14);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke_273;
    v12[3] = &unk_1E6B90C18;
    id v13 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v12];

    id v11 = v15;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[RTLearnedLocationStore _fetchVisitIdentifiersIn:handler:]";
      __int16 v20 = 1024;
      int v21 = 2950;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTLearnedVisitMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  v19[0] = @"identifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v4 setPropertiesToFetch:v6];

  id v12 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v12];

  id v8 = v12;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);
  }
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v7 valueForKeyPath:@"identifier"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __59__RTLearnedLocationStore__fetchVisitIdentifiersIn_handler___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitIdentifiersIn:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationStore_fetchVisitIdentifiersIn_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__RTLearnedLocationStore_fetchVisitIdentifiersIn_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitIdentifiersIn:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      if ([v9 compare:v10] != 1)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
        v23[3] = &unk_1E6B91018;
        id v24 = v9;
        id v25 = v10;
        SEL v27 = a2;
        id v19 = v11;
        id v26 = v19;
        __int16 v20 = (void *)MEMORY[0x1E016DB00](v23);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_287;
        v21[3] = &unk_1E6B90C18;
        id v22 = v19;
        [(RTStore *)self _performBlock:v20 contextType:1 errorHandler:v21];

        __int16 v17 = v24;
        goto LABEL_9;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      __int16 v29 = @"requires well ordered dates.";
      __int16 v14 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v15 = &v29;
      id v16 = &v28;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"requires valid dates.";
      __int16 v14 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v15 = (__CFString **)v31;
      id v16 = &v30;
    }
    __int16 v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v18 = [v12 errorWithDomain:v13 code:0 userInfo:v17];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v18);

LABEL_9:
  }
}

void __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTLearnedTransitionMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@ && %K <= %@", @"startDate", *(void *)(a1 + 32), @"stopDate", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
  v36[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v4 setSortDescriptors:v7];

  id v26 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v26];
  id v9 = v26;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    __int16 v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    id v21 = v3;
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    __int16 v20 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = +[RTLearnedTransition createWithManagedObject:*(void *)(*((void *)&v22 + 1) + 8 * v16)];
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    id v8 = v20;
    id v3 = v21;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __76__RTLearnedLocationStore__fetchTransitionsBetweenStartDate_endDate_handler___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTransitionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RTLearnedLocationStore_fetchTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__RTLearnedLocationStore_fetchTransitionsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 _fetchTransitionsBetweenStartDate:v4 endDate:v3 handler:*(void *)(a1 + 40)];
}

- (void)fetchTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__RTLearnedLocationStore_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __75__RTLearnedLocationStore_fetchTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTransitionsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke;
      v16[3] = &unk_1E6B910D8;
      id v17 = v6;
      id v8 = v7;
      id v18 = v8;
      id v9 = (void *)MEMORY[0x1E016DB00](v16);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke_2;
      v14[3] = &unk_1E6B90C18;
      id v15 = v8;
      [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v14];

      id v10 = v17;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"destination identifier cannot be nil.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v10 = [v11 errorWithDomain:v12 code:7 userInfo:v13];

      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RTLearnedTransitionMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == %@", @"destination", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = [v6 firstObject];

  if (v8)
  {
    id v9 = +[RTLearnedTransition createWithManagedObject:v8];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__RTLearnedLocationStore__fetchTransitionWithDestinationIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTransitionWithDestinationIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationStore_fetchTransitionWithDestinationIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __75__RTLearnedLocationStore_fetchTransitionWithDestinationIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTransitionWithDestinationIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke;
      v16[3] = &unk_1E6B910D8;
      id v17 = v6;
      id v8 = v7;
      id v18 = v8;
      id v9 = (void *)MEMORY[0x1E016DB00](v16);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke_2;
      v14[3] = &unk_1E6B90C18;
      id v15 = v8;
      [(RTStore *)self _performBlock:v9 contextType:1 errorHandler:v14];

      id v10 = v17;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F5CFE8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"origin identifier cannot be nil.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v10 = [v11 errorWithDomain:v12 code:7 userInfo:v13];

      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RTLearnedTransitionMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == %@", @"origin", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = [v6 firstObject];

  if (v8)
  {
    id v9 = +[RTLearnedTransition createWithManagedObject:v8];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__RTLearnedLocationStore__fetchTransitionWithOriginIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTransitionWithOriginIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTLearnedLocationStore_fetchTransitionWithOriginIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __70__RTLearnedLocationStore_fetchTransitionWithOriginIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTransitionWithOriginIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __94__RTLearnedLocationStore__learnedLocationsOfInterestFromLearnedLocationsOfInterestMO_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(a1 + 32) count]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *(void **)(a1 + 32);
  id v6 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"visits.@count" ascending:0];
  id v18 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[RTLearnedLocationOfInterest createWithManagedObject:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        if (v13) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

uint64_t __83__RTLearnedLocationStore__fetchLocationsOfInterestWithinDistance_location_handler___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__RTLearnedLocationStore__fetchLocationsOfInterestWithPlaceType_handler___block_invoke_307(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__RTLearnedLocationStore__sortLocationsOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 place];
  if ([v6 typeSource])
  {
  }
  else
  {
    id v7 = [v5 place];
    char v8 = [v7 typeSource];

    if (v8)
    {
      uint64_t v9 = -1;
      goto LABEL_13;
    }
  }
  uint64_t v10 = [v4 place];
  if ([v10 typeSource])
  {
    uint64_t v11 = [v5 place];
    char v12 = [v11 typeSource];

    if ((v12 & 1) == 0)
    {
      uint64_t v9 = 1;
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v13 = [v4 visits];
  uint64_t v14 = [v13 count];
  long long v15 = [v5 visits];
  uint64_t v16 = [v15 count];

  if (v14 == v16)
  {
    long long v17 = [v4 visits];
    id v18 = [v17 valueForKeyPath:@"@max.creationDate"];
    uint64_t v19 = [v5 visits];
    [v19 valueForKeyPath:@"@max.creationDate"];
  }
  else
  {
    uint64_t v20 = NSNumber;
    long long v17 = [v4 visits];
    id v18 = [v20 numberWithUnsignedInteger:[v17 count]];
    id v21 = NSNumber;
    uint64_t v19 = [v5 visits];
    [v21 numberWithUnsignedInteger:[v19 count]];
  long long v22 = };
  uint64_t v9 = [v18 compare:v22];

LABEL_13:
  return v9;
}

id __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_324(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[RTLearnedLocationOfInterest createWithManagedObject:a2];
  id v4 = [v3 filterWithDateInterval:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __111__RTLearnedLocationStore__fetchLocationsOfInterestVisitedBetweenStartDate_endDate_includePlaceholders_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C160] fetchHistoryAfterDate:v8];
      [v10 setResultType:5];
      [v10 setFetchLimit:5];
      uint64_t v11 = [(RTStore *)self persistenceManager];
      char v12 = [v11 persistenceStoreForType:1];

      if ([v12 state] == 5)
      {
        id v13 = [(RTStore *)self persistenceManager];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke;
        v20[3] = &unk_1E6B966A0;
        id v21 = v12;
        id v23 = v9;
        id v22 = v10;
        BOOL v24 = a4;
        [v13 createManagedObjectContext:v20];

        uint64_t v14 = v21;
      }
      else
      {
        long long v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F5CFE8];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        id v26 = @"cloud store is not ready.";
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        uint64_t v19 = [v17 errorWithDomain:v18 code:0 userInfo:v14];
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v19);
      }
    }
    else
    {
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"requires valid dates.";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      char v12 = [v15 errorWithDomain:v16 code:0 userInfo:v10];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
    }
  }
}

void __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [v3 persistentStoreCoordinator];
  id v5 = [v4 persistentStores];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      uint64_t v11 = [v10 URL];
      char v12 = [*(id *)(a1 + 32) URL];
      char v13 = [v11 isEqual:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v14) {
      goto LABEL_12;
    }
    id v29 = v14;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [*(id *)(a1 + 40) setAffectedStores:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke_2;
    v20[3] = &unk_1E6B907A0;
    id v21 = v3;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    char v24 = *(unsigned char *)(a1 + 56);
    [v21 performBlock:v20];

    id v16 = v21;
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = @"cloud store is nil";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v16 = [v18 errorWithDomain:v19 code:0 userInfo:v14];
    (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v16);
  }
}

void __87__RTLearnedLocationStore__fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  while (1)
  {
    id v3 = (void *)MEMORY[0x1E016D870]();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v32 = 0;
    uint64_t v6 = [v4 executeRequest:v5 error:&v32];
    id v7 = v32;
    if (v7) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = (objc_class *)objc_opt_class();
        id v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138412290;
        id v35 = v22;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "error while fetching history; unexpected result class, %@",
          buf,
          0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_18;
    }
    context = v3;
    char v24 = v6;
    id v8 = v6;
    long long v25 = [v8 result];
    uint64_t v23 = [v25 count];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v26 = v8;
    uint64_t v9 = [v8 result];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            id v16 = [v15 changes];
            uint64_t v17 = [v16 count];

            if (v17)
            {
              [v2 addObject:v15];
              if (*(unsigned char *)(a1 + 56))
              {
                (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

                id v3 = context;
                uint64_t v6 = v24;
                goto LABEL_18;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [*(id *)(a1 + 40) setFetchOffset:[*(id *)(a1 + 40) fetchOffset] + v23];
    [*(id *)(a1 + 32) reset];

    if (!v23)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_19;
    }
  }
  uint64_t v18 = v7;
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v18;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "error while fetching history, %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_18:

LABEL_19:
}

- (void)fetchLocationsOfInterestVisitedSinceDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__RTLearnedLocationStore_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__RTLearnedLocationStore_fetchLocationsOfInterestVisitedSinceDate_handler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 _fetchLocationsOfInterestVisitedBetweenStartDate:v3 endDate:v4 includePlaceholders:0 handler:a1[6]];
}

- (void)fetchCloudStorePersistentHistorySinceDate:(id)a3 earlyStop:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__RTLearnedLocationStore_fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke;
  v13[3] = &unk_1E6B907A0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __86__RTLearnedLocationStore_fetchCloudStorePersistentHistorySinceDate_earlyStop_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCloudStorePersistentHistorySinceDate:*(void *)(a1 + 40) earlyStop:*(unsigned __int8 *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (BOOL)cloudStoreChangedSinceDate:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v39 = 0;
  id v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__69;
  uint64_t v43 = __Block_byref_object_dispose__69;
  id v44 = 0;
  uint64_t v33 = 0;
  __int16 v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__69;
  id v37 = __Block_byref_object_dispose__69;
  id v38 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __53__RTLearnedLocationStore_cloudStoreChangedSinceDate___block_invoke;
  void v28[3] = &unk_1E6B928A8;
  id v6 = v4;
  id v29 = v6;
  long long v31 = &v39;
  id v32 = &v33;
  id v7 = v5;
  long long v30 = v7;
  [(RTLearnedLocationStore *)self fetchCloudStorePersistentHistorySinceDate:v6 earlyStop:1 handler:v28];
  id v8 = v7;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  id v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_868];
  BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v17 = [v16 filteredArrayUsingPredicate:v15];
  uint64_t v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v45 count:1];
  id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v40 + 5, v23);
  }
  if (v40[5]) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = [(id)v34[5] count] != 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v26;
}

void __53__RTLearnedLocationStore_cloudStoreChangedSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = *(void *)(a1 + 32);
    int v16 = 134218754;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = @"YES";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "fetched %lu persistent history transaction, since date, %@, early stop, %@, error, %@", (uint8_t *)&v16, 0x2Au);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
  id v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fetchAllLocationsOfInterestWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__RTLearnedLocationStore_fetchAllLocationsOfInterestWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __65__RTLearnedLocationStore_fetchAllLocationsOfInterestWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 _fetchLocationsOfInterestVisitedBetweenStartDate:v4 endDate:v3 includePlaceholders:1 handler:*(void *)(a1 + 40)];
}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, NSObject *))a4;
  if (!v7)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!v6)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requires a non-nil identifier.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v9 = [v10 errorWithDomain:v11 code:7 userInfo:v12];

    v7[2](v7, 0, v9);
LABEL_7:

    goto LABEL_8;
  }
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RTLearnedLocationStore_fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  dispatch_async(v8, block);

LABEL_8:
}

uint64_t __73__RTLearnedLocationStore_fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInferredMapItemForVisitIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchInferredMapItemForVisitIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke;
  v15[3] = &unk_1E6B91060;
  id v16 = v7;
  SEL v18 = a2;
  id v9 = v8;
  id v17 = v9;
  id v10 = v7;
  uint64_t v11 = (void *)MEMORY[0x1E016DB00](v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke_346;
  v13[3] = &unk_1E6B90C18;
  id v14 = v9;
  id v12 = v9;
  [(RTStore *)self _performBlock:v11 contextType:1 errorHandler:v13];
}

void __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[RTLearnedVisitMO fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  [v2 setFetchLimit:1];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v16 = 0;
  id v4 = [v2 execute:&v16];
  id v5 = v16;
  id v6 = [v4 firstObject];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    id v20 = v15;
    __int16 v21 = 2112;
    __int16 v22 = v2;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, request, %@, result, %@, error, %@", buf, 0x2Au);
  }
  if (!v5)
  {
    if (v6)
    {
      id v9 = [MEMORY[0x1E4F5CDF8] createWithManagedObject:v6];
      if (!v9)
      {
        id v9 = [NSString stringWithFormat:@"could not initialize inferredMapItem for learnedVisitMO, %@", v6];
        id v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v11 = *MEMORY[0x1E4F5CFE8];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        SEL v18 = v9;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v13 = [v10 errorWithDomain:v11 code:0 userInfo:v12];

        id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
    }
    else
    {
      id v9 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:

    goto LABEL_15;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

uint64_t __74__RTLearnedLocationStore__fetchInferredMapItemForVisitIdentifier_handler___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__RTLearnedLocationStore__fetchLocationOfInterestVisitedFirstWithHandler___block_invoke_347(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__RTLearnedLocationStore__fetchLocationOfInterestVisitedLastWithHandler___block_invoke_348(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke_352;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      uint64_t v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid identifier.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v13 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v13];

  id v7 = v13;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = [v6 count];
    *(_DWORD *)buf = 138413058;
    id v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v7 || ![v6 count])
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [v6 firstObject];
    id v9 = +[RTLearnedLocationOfInterest createWithManagedObject:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__RTLearnedLocationStore__fetchLocationOfInterestWithIdentifier_handler___block_invoke_352(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTLearnedLocationStore_fetchLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __72__RTLearnedLocationStore_fetchLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __70__RTLearnedLocationStore__fetchLocationOfInterestWithMapItem_handler___block_invoke_356(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke;
      v17[3] = &unk_1E6B91060;
      id v18 = v7;
      SEL v20 = a2;
      id v9 = v8;
      id v19 = v9;
      id v10 = (void *)MEMORY[0x1E016DB00](v17);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke_360;
      v15[3] = &unk_1E6B90C18;
      id v16 = v9;
      [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

      uint64_t v11 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"requires a valid place.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v14 = [v12 errorWithDomain:v13 code:7 userInfo:v11];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
    }
  }
}

void __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"placeIdentifier", v6];
  [v4 setPredicate:v7];

  id v15 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v15];

  id v9 = v15;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v14 = [v8 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9 || ![v8 count])
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [v8 firstObject];
    uint64_t v11 = +[RTLearnedLocationOfInterest createWithManagedObject:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__RTLearnedLocationStore__fetchLocationOfInterestWithPlace_handler___block_invoke_360(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestWithPlace:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTLearnedLocationStore_fetchLocationOfInterestWithPlace_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__RTLearnedLocationStore_fetchLocationOfInterestWithPlace_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestWithPlace:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (a3 >= 0.0)
    {
      if (v8)
      {
        objc_initWeak(&location, self);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke;
        v21[3] = &unk_1E6B966C8;
        objc_copyWeak(v24, &location);
        id v14 = v9;
        id v23 = v14;
        id v22 = v8;
        v24[1] = *(id *)&a3;
        id v15 = (void *)MEMORY[0x1E016DB00](v21);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke_2;
        v19[3] = &unk_1E6B90C18;
        id v20 = v14;
        [(RTStore *)self _performBlock:v15 contextType:1 errorHandler:v19];

        objc_destroyWeak(v24);
        objc_destroyWeak(&location);
      }
      else
      {
        id v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        uint64_t v27 = @"location cannot be nil";
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        __int16 v18 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v17];

        (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v18);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"distance cannot be less than zero";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v12 = [v10 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v11];

      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
    }
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&location, 2u);
    }
  }
}

void __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
    [v2 setReturnsObjectsAsFaults:0];
    [*(id *)(a1 + 32) latitude];
    [*(id *)(a1 + 32) longitude];
    RTCommonCalculateBoundingBox();
    uint64_t v74 = (void *)MEMORY[0x1E4F28BA0];
    id v3 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v72 = a1;
    id v78 = [NSNumber numberWithDouble:0.0];
    id v76 = [v3 predicateWithFormat:@"%@ <= %K", v78, @"locationLongitude"];
    v89[0] = v76;
    id v4 = (void *)MEMORY[0x1E4F28F60];
    id v5 = [NSNumber numberWithDouble:0.0];
    id v6 = [v4 predicateWithFormat:@"%K <= %@", @"locationLongitude", v5];
    v89[1] = v6;
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [NSNumber numberWithDouble:0.0];
    id v9 = [v7 predicateWithFormat:@"%@ <= %K", v8, @"locationLatitude"];
    v89[2] = v9;
    id v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [NSNumber numberWithDouble:0.0];
    id v12 = [v10 predicateWithFormat:@"%K <= %@", @"locationLatitude", v11];
    v89[3] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
    id v14 = [v74 andPredicateWithSubpredicates:v13];
    [v2 setPredicate:v14];

    id v15 = v2;
    memset(v85, 0, sizeof(v85));
    id v16 = [v2 execute:v85];
    id v17 = v85[0];
    if (v17)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      long long v67 = v2;
      v79 = [MEMORY[0x1E4F1CA80] set];
      [MEMORY[0x1E4F1CA48] array];
      long long v69 = v68 = v16;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v21 = v16;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v81 objects:v88 count:16];
      uint64_t v23 = a1;
      if (v22)
      {
        uint64_t v24 = v22;
        uint64_t v25 = *(void *)v82;
        uint64_t v70 = *(void *)v82;
        __int16 v71 = v21;
LABEL_7:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v82 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void **)(*((void *)&v81 + 1) + 8 * v26);
          uint64_t v28 = [v27 locationOfInterest];
          id v29 = [v28 identifier];

          if (v29)
          {
            long long v30 = [v27 locationOfInterest];
            long long v31 = [v30 identifier];
            id v32 = [v79 member:v31];

            if (!v32)
            {
              id v75 = objc_alloc(MEMORY[0x1E4F5CE00]);
              __int16 v77 = [v27 locationLatitude];
              [v77 doubleValue];
              double v34 = v33;
              uint64_t v35 = [v27 locationLongitude];
              [v35 doubleValue];
              double v37 = v36;
              id v38 = [v27 locationHorizontalUncertainty];
              [v38 doubleValue];
              double v40 = v39;
              uint64_t v41 = [v27 locationAltitude];
              [v41 doubleValue];
              double v43 = v42;
              id v44 = [v27 locationVerticalUncertainty];
              [v44 doubleValue];
              double v46 = v45;
              uint64_t v47 = [v27 locationReferenceFrame];
              uint64_t v48 = [v47 intValue];
              uint64_t v49 = [v27 locationSourceAccuracy];
              int v50 = [v75 initWithLatitude:0 longitude:v48 horizontalUncertainty:(int)[v49 intValue] altitude:v34 verticalUncertainty:v37 date:v40 referenceFrame:v43 speed:v46 sourceAccuracy:0.0];

              uint64_t v23 = v72;
              __int16 v51 = [WeakRetained distanceCalculator];
              uint64_t v52 = *(void *)(v72 + 32);
              id v80 = 0;
              [v51 distanceFromLocation:v50 toLocation:v52 error:&v80];
              double v54 = v53;
              id v55 = v80;

              if (v55)
              {
                (*(void (**)(void))(*(void *)(v72 + 40) + 16))();
LABEL_22:
                id v17 = 0;
                id v15 = v67;

                id v16 = v68;
                long long v59 = v69;
                goto LABEL_23;
              }
              if (v54 <= *(double *)(v72 + 56))
              {
                v56 = [v27 locationOfInterest];
                uint64_t v57 = +[RTLearnedLocationOfInterest createWithManagedObject:v56];

                if (!v57)
                {
                  long long v60 = NSString;
                  long long v61 = [v27 locationOfInterest];
                  id v62 = [v61 identifier];
                  id v55 = [v60 stringWithFormat:@"reading loiMO with identifier, %@, resulted in nil object", v62];

                  id v63 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v64 = *MEMORY[0x1E4F5CFE8];
                  uint64_t v86 = *MEMORY[0x1E4F28568];
                  id v87 = v55;
                  long long v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                  long long v66 = [v63 errorWithDomain:v64 code:0 userInfo:v65];

                  (*(void (**)(void))(*(void *)(v72 + 40) + 16))();
                  goto LABEL_22;
                }
                [v69 addObject:v57];
                __int16 v58 = [v57 identifier];
                [v79 addObject:v58];
              }
              uint64_t v25 = v70;
              id v21 = v71;
            }
          }
          if (v24 == ++v26)
          {
            uint64_t v24 = [v21 countByEnumeratingWithState:&v81 objects:v88 count:16];
            if (v24) {
              goto LABEL_7;
            }
            break;
          }
        }
      }

      long long v59 = v69;
      (*(void (**)(void))(*(void *)(v23 + 40) + 16))();
      id v15 = v67;
      id v16 = v68;
      id v17 = 0;
LABEL_23:
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v90 = *MEMORY[0x1E4F28568];
    v91[0] = @"swelf is nil";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
    id v15 = [v18 errorWithDomain:v19 code:0 userInfo:v20];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __93__RTLearnedLocationStore__fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(double)a3 location:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__RTLearnedLocationStore_fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  double v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __92__RTLearnedLocationStore_fetchLocationsOfInterestWithVisitsWithinDistance_location_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationsOfInterestWithVisitsWithinDistance:*(void *)(a1 + 40) location:*(void *)(a1 + 48) handler:*(double *)(a1 + 56)];
}

- (void)_fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      if ([v9 compare:v10] != 1)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke;
        v23[3] = &unk_1E6B91018;
        id v24 = v9;
        id v25 = v10;
        SEL v27 = a2;
        id v19 = v11;
        id v26 = v19;
        id v20 = (void *)MEMORY[0x1E016DB00](v23);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke_373;
        v21[3] = &unk_1E6B90C18;
        id v22 = v19;
        [(RTStore *)self _performBlock:v20 contextType:1 errorHandler:v21];

        id v17 = v24;
        goto LABEL_9;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      id v29 = @"requires well ordered dates.";
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = &v29;
      double v16 = &v28;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"requires valid dates.";
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = (__CFString **)v31;
      double v16 = &v30;
    }
    id v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    __int16 v18 = [v12 errorWithDomain:v13 code:0 userInfo:v17];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v18);

LABEL_9:
  }
}

void __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@ && %K <= %@", @"startDate", *(void *)(a1 + 32), @"stopDate", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
  v36[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v4 setSortDescriptors:v7];

  id v26 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v26];
  id v9 = v26;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v19 = [v8 count];
    *(_DWORD *)buf = 138413058;
    id v29 = v18;
    __int16 v30 = 2112;
    long long v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    id v21 = v3;
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = +[RTLearnedTransition createWithManagedObject:*(void *)(*((void *)&v22 + 1) + 8 * v16)];
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    id v8 = v20;
    id v3 = v21;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __94__RTLearnedLocationStore__fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke_373(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLocationOfInterestTransitionsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__RTLearnedLocationStore_fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __93__RTLearnedLocationStore_fetchLocationOfInterestTransitionsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchLocationOfInterestTransitionsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchMetricsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke;
    v10[3] = &unk_1E6B92A40;
    id v6 = v4;
    id v11 = v6;
    id v7 = (void *)MEMORY[0x1E016DB00](v10);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke_2;
    v8[3] = &unk_1E6B90C18;
    id v9 = v6;
    [(RTStore *)self _performBlock:v7 contextType:1 errorHandler:v8];
  }
}

void __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 currentDevice];
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = +[RTLearnedVisitMO fetchRequest];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  long long v31 = v3;
  id v8 = [v3 identifier];
  id v9 = [v7 predicateWithFormat:@"%K.%K == %@", @"device", @"identifier", v8];
  [v6 setPredicate:v9];

  id v34 = 0;
  __int16 v30 = v6;
  uint64_t v10 = [v2 countForFetchRequest:v6 error:&v34];
  id v11 = v34;
  [v4 setVisitCountDevice:v10];
  if (v11) {
    [v5 addObject:v11];
  }
  uint64_t v28 = v11;
  +[RTLearnedVisitMO fetchRequest];
  SEL v27 = v33[1] = 0;
  uint64_t v12 = [v2 countForFetchRequest:x0 error:x1];
  id v13 = 0;
  [v4 setVisitCountTotal:v12];
  if (v13) {
    [v5 addObject:v13];
  }
  id v26 = v13;
  id v14 = +[RTLearnedPlaceMO fetchRequest];
  uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
  id v16 = [v31 identifier];
  id v17 = [v15 predicateWithFormat:@"%K.%K == %@", @"device", @"identifier", v16];
  [v14 setPredicate:v17];

  v33[0] = 0;
  uint64_t v18 = [v2 countForFetchRequest:v14 error:v33];
  id v19 = v33[0];
  [v4 setPlaceCountDevice:v18];
  if (v19) {
    [v5 addObject:v19];
  }
  id v20 = +[RTLearnedPlaceMO fetchRequest];
  id v32 = 0;
  uint64_t v21 = [v2 countForFetchRequest:v20 error:&v32];
  id v22 = v32;
  [v4 setPlaceCountTotal:v21];
  if (v22) {
    [v5 addObject:v22];
  }
  uint64_t v23 = *(void *)(a1 + 32);
  long long v24 = _RTSafeArray();
  long long v25 = _RTMultiErrorCreate();
  (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v4, v25);
}

uint64_t __51__RTLearnedLocationStore__fetchMetricsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMetricsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTLearnedLocationStore_fetchMetricsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__RTLearnedLocationStore_fetchMetricsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMetricsWithHandler:*(void *)(a1 + 40)];
}

- (void)fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__RTLearnedLocationStore_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke;
  block[3] = &unk_1E6B92668;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __84__RTLearnedLocationStore_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:*(void *)(a1 + 48) limit:*(void *)(a1 + 40)];
}

- (void)_fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:(id)a3 limit:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke;
    v14[3] = &unk_1E6B910D8;
    uint64_t v15 = v7;
    id v9 = v6;
    id v16 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v14);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_3;
    v12[3] = &unk_1E6B90C18;
    id v13 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v12];

    id v11 = v15;
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[RTLearnedLocationStore _fetchVisitsWithoutPlacesForCurrentDeviceWithHandler:limit:]";
      __int16 v19 = 1024;
      int v20 = 4376;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedVisitMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [v3 currentDevice];
  id v7 = [v6 identifier];
  id v8 = [v5 predicateWithFormat:@"%K.%K == %@ && place == nil", @"device", @"identifier", v7];
  [v4 setPredicate:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
  v17[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v4 setSortDescriptors:v10];

  id v11 = *(void **)(a1 + 32);
  if (v11) {
    [v4 setFetchLimit:[v11 integerValue]];
  }
  id v16 = 0;
  id v12 = [v3 executeFetchRequest:v4 error:&v16];
  id v13 = v16;
  id v14 = 0;
  if (!v13)
  {
    uint64_t v15 = [[_RTMap alloc] initWithInput:v12];
    id v14 = [(_RTMap *)v15 withBlock:&__block_literal_global_379];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:a2];
}

uint64_t __85__RTLearnedLocationStore__fetchVisitsWithoutPlacesForCurrentDeviceWithHandler_limit___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__RTLearnedLocationStore_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __85__RTLearnedLocationStore_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke;
    v12[3] = &unk_1E6B91060;
    void v12[4] = self;
    SEL v14 = a2;
    id v7 = v5;
    id v13 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v12);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke_386;
    v10[3] = &unk_1E6B90C18;
    id v11 = v7;
    [(RTStore *)self _performBlock:v8 contextType:1 errorHandler:v10];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[RTLearnedLocationStore _fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler:]";
      __int16 v17 = 1024;
      int v18 = 4425;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) predicateForObjectsFromCurrentDevice];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil", @"place"];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == nil", @"place", @"mapItem"];
  id v7 = +[RTLearnedVisitMO fetchRequest];
  [v7 setReturnsObjectsAsFaults:0];
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v46[0] = v4;
  v46[1] = v5;
  __int16 v30 = (void *)v6;
  v46[2] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  id v10 = [v8 andPredicateWithSubpredicates:v9];
  [v7 setPredicate:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
  double v45 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [v7 setSortDescriptors:v12];

  id v35 = 0;
  id v13 = [v3 executeFetchRequest:v7 error:&v35];
  id v14 = v35;
  uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v25 = long long v24 = v13;
    uint64_t v26 = [v24 count];
    *(_DWORD *)buf = 138413058;
    id v38 = v25;
    __int16 v39 = 2112;
    double v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v26;
    __int16 v43 = 2112;
    id v44 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

    id v13 = v24;
  }
  uint64_t v16 = a1;

  if (v14)
  {
    __int16 v17 = 0;
  }
  else
  {
    uint64_t v28 = v5;
    id v29 = v4;
    __int16 v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v13 count]];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    SEL v27 = v13;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = +[RTLearnedVisit createWithManagedObject:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v20);
    }

    id v4 = v29;
    id v13 = v27;
    id v5 = v28;
  }
  (*(void (**)(void))(*(void *)(v16 + 40) + 16))();
}

uint64_t __86__RTLearnedLocationStore__fetchVisitsWithIncompletePlacesForCurrentDeviceWithHandler___block_invoke_386(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)groupCloudManagedObjectsByDeviceIdentifier:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    uint64_t v30 = *(void *)v36;
    long long v31 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        uint64_t v34 = MEMORY[0x1E016D870]();
        id v10 = [v9 device];
        id v11 = [v10 identifier];

        if (v11)
        {
          id v12 = [v4 objectForKey:v11];
          id v13 = v12;
          if (v12)
          {
            [v12 addObject:v9];
          }
          else
          {
            long long v24 = objc_opt_new();
            [v24 addObject:v9];
            if (v24) {
              [v4 setObject:v24 forKey:v11];
            }
            long long v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              SEL v27 = [v11 UUIDString];
              *(_DWORD *)buf = 138412290;
              double v40 = v27;
              _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "New grouping of cloud managed objects for device with identifier, %@", buf, 0xCu);
            }
          }
          uint64_t v23 = (void *)v34;
          id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = [v11 UUIDString];
            *(_DWORD *)buf = 138412546;
            double v40 = v9;
            __int16 v41 = 2112;
            uint64_t v42 = v26;
            _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "Added cloud managed object %@ to group for device with identifier, %@", buf, 0x16u);
          }
        }
        else
        {
          id v14 = NSString;
          uint64_t v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          __int16 v17 = [v9 identifier];
          id v18 = [v17 UUIDString];
          uint64_t v19 = [v9 device];
          uint64_t v20 = [v9 device];
          uint64_t v21 = [v20 identifier];
          id v13 = [v14 stringWithFormat:@"Device identifier was nil while grouping RTCloudManagedObject (type: %@, identifier, %@), by device. Device, %@, Device identifier, %@", v16, v18, v19, v21];

          id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v40 = v13;
            _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }
          uint64_t v7 = v30;
          id v4 = v31;
          uint64_t v6 = v32;
          uint64_t v23 = (void *)v34;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v6);
  }

  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v28;
}

- (BOOL)_processDeletionRequestWithFetchRequest:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fetchRequest", buf, 2u);
    }

    if (a5)
    {
      id v14 = @"fetchRequest";
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v14);
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  if (!v10)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a5)
    {
      id v14 = @"context";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v11 options] & 2) == 0)
  {
    id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This operation requires a context with RTPersistenceContextOptionsAllowTombstones." userInfo:0];
    objc_exception_throw(v17);
  }
  *(void *)buf = 0;
  long long v25 = buf;
  uint64_t v26 = 0x3032000000;
  SEL v27 = __Block_byref_object_copy__69;
  uint64_t v28 = __Block_byref_object_dispose__69;
  id v29 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __80__RTLearnedLocationStore__processDeletionRequestWithFetchRequest_context_error___block_invoke;
  v18[3] = &unk_1E6B95120;
  id v19 = v11;
  id v20 = v9;
  uint64_t v21 = self;
  id v22 = buf;
  SEL v23 = a2;
  [v19 performBlockAndWait:v18];
  if (a5) {
    *a5 = *((id *)v25 + 5);
  }
  BOOL v12 = *((void *)v25 + 5) == 0;

  _Block_object_dispose(buf, 8);
LABEL_18:

  return v12;
}

void __80__RTLearnedLocationStore__processDeletionRequestWithFetchRequest_context_error___block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v78 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v78];
  id v5 = v78;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v80 = v57;
      __int16 v81 = 2112;
      id v82 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Received error while fetching cloud managed objects to delete, fetchRequest, %@, error, %@", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = v5;
    id v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else if ([v4 count])
  {
    [*(id *)(a1 + 32) setMirroringQualityOfService:3];
    long long v61 = v4;
    id v10 = [*(id *)(a1 + 48) groupCloudManagedObjectsByDeviceIdentifier:v4];
    long long v60 = [*(id *)(a1 + 32) transactionAuthor];
    uint64_t v66 = a1;
    [*(id *)(a1 + 32) setTransactionAuthor:@"CloudDeletion"];
    id v62 = objc_opt_new();
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v75 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          id v17 = [v11 objectForKey:v16];
          id v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v16 UUIDString];
            *(_DWORD *)buf = 138412546;
            id v80 = v19;
            __int16 v81 = 2112;
            id v82 = v17;
            _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "Building delete request for device with identifier, %@, for cloud objects, %@", buf, 0x16u);
          }
          id v20 = +[RTEntityDeletionRequestMO managedObjectWithCloudManagedObjects:v17 context:*(void *)(v66 + 32)];
          uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v80 = v20;
            _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "Created deletion request, %@", buf, 0xCu);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v13);
    }

    uint64_t v22 = v66;
    SEL v23 = *(void **)(v66 + 32);
    id v73 = 0;
    int v24 = [v23 save:&v73];
    id v25 = v73;
    id v26 = v25;
    if (!v24 || v25)
    {
      SEL v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v58 = NSStringFromSelector(*(SEL *)(v66 + 64));
        *(_DWORD *)buf = 138412546;
        id v80 = v58;
        __int16 v81 = 2112;
        id v82 = v26;
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (v26) {
        [v62 addObject:v26];
      }
    }
    long long v59 = v26;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v9 = v11;
    uint64_t v28 = [v9 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v70;
      uint64_t v64 = *(void *)v70;
      do
      {
        uint64_t v31 = 0;
        uint64_t v65 = v29;
        do
        {
          if (*(void *)v70 != v30) {
            objc_enumerationMutation(v9);
          }
          uint64_t v32 = *(void **)(*((void *)&v69 + 1) + 8 * v31);
          long long v67 = [v9 objectForKey:v32];
          long long v33 = [*(id *)(v22 + 32) currentDevice];
          uint64_t v34 = [v33 identifier];
          int v35 = [v32 isEqual:v34];

          if (v35)
          {
            long long v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              long long v37 = [v32 UUIDString];
              *(_DWORD *)buf = 138412290;
              id v80 = v37;
              _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "Batch deleting objects from current device with identifier, %@", buf, 0xCu);
            }
            id v38 = objc_alloc(MEMORY[0x1E4F1C0D0]);
            __int16 v39 = [*(id *)(v22 + 40) entityName];
            double v40 = (void *)[v38 initWithEntityName:v39];

            __int16 v41 = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"identifier"];
            uint64_t v42 = [v67 valueForKeyPath:v41];
            __int16 v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"identifier", v42, v59];
            [v40 setPredicate:v43];

            uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v40];
            [v44 setResultType:2];
            double v45 = *(void **)(v22 + 32);
            id v68 = 0;
            double v46 = [v45 executeRequest:v44 error:&v68];
            id v47 = v68;
            uint64_t v48 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(v22 + 64));
              id v63 = v41;
              v50 = uint64_t v49 = v9;
              __int16 v51 = [v46 result];
              *(_DWORD *)buf = 138413058;
              id v80 = v50;
              __int16 v81 = 2112;
              id v82 = v44;
              __int16 v83 = 2112;
              long long v84 = v51;
              __int16 v85 = 2112;
              id v86 = v47;
              _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

              id v9 = v49;
              __int16 v41 = v63;
              uint64_t v22 = v66;
            }

            if (v47) {
              [v62 addObject:v47];
            }

            uint64_t v30 = v64;
            uint64_t v29 = v65;
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v9 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v29);
    }

    uint64_t v52 = _RTSafeArray();
    uint64_t v53 = _RTMultiErrorCreate();
    uint64_t v54 = *(void *)(*(void *)(v22 + 56) + 8);
    id v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    [*(id *)(v22 + 32) setTransactionAuthor:v60];
    id v5 = 0;
    id v4 = v61;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v56 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v80 = v56;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "No such objects exist satisfying fetch request %@", buf, 0xCu);
    }
  }
}

- (void)_removePlace:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke;
    v16[3] = &unk_1E6B91018;
    id v17 = v7;
    id v18 = self;
    SEL v20 = a2;
    id v10 = v9;
    id v19 = v10;
    id v11 = (void *)MEMORY[0x1E016DB00](v16);
    [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];

    uint64_t v12 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"requires a valid place.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v15 = [v13 errorWithDomain:v14 code:7 userInfo:v12];
    ((void (**)(void, void *))v9)[2](v9, v15);

    goto LABEL_5;
  }
LABEL_6:
}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v4 setPredicate:v7];

  [v4 setFetchBatchSize:300];
  id v8 = [*(id *)(a1 + 40) persistenceManager];
  uint64_t v9 = [v8 persistenceContextWithOptions:2];

  id v10 = *(void **)(a1 + 40);
  id v32 = 0;
  id v26 = (void *)v9;
  [v10 _processDeletionRequestWithFetchRequest:v4 context:v9 error:&v32];
  id v11 = v32;
  uint64_t v12 = +[RTLearnedLocationOfInterestMO fetchRequest];
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v14 = [*(id *)(a1 + 32) identifier];
  uint64_t v15 = [v13 predicateWithFormat:@"%K == %@", @"identifier", v14];
  [v12 setPredicate:v15];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v12];
  [v16 setResultType:2];
  id v31 = 0;
  id v17 = [v3 executeRequest:v16 error:&v31];

  id v18 = v31;
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    SEL v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v21 = [v17 result];
    *(_DWORD *)buf = 138413058;
    uint64_t v34 = v20;
    __int16 v35 = 2112;
    long long v36 = v16;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2112;
    id v40 = v18;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
  }
  uint64_t v22 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke_407;
  block[3] = &unk_1E6B92398;
  SEL v23 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v29 = v18;
  id v30 = v23;
  id v28 = v11;
  id v24 = v18;
  id v25 = v11;
  dispatch_async(v22, block);
}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke_407(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__RTLearnedLocationStore__removePlace_handler___block_invoke_2;
  v3[3] = &unk_1E6B966F0;
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _removeUnreferencedMapItems:v3];
}

void __47__RTLearnedLocationStore__removePlace_handler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = _RTSafeArray();
    _RTMultiErrorCreate();
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, v3);
  }
}

- (void)removePlace:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTLearnedLocationStore_removePlace_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __46__RTLearnedLocationStore_removePlace_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePlace:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removePlacesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__RTLearnedLocationStore__removePlacesWithHandler___block_invoke;
  id v10 = &unk_1E6B910D8;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);
}

void __51__RTLearnedLocationStore__removePlacesWithHandler___block_invoke(uint64_t a1)
{
  id v2 = +[RTLearnedPlaceMO fetchRequest];
  uint64_t v3 = [*(id *)(a1 + 32) persistenceManager];
  id v4 = [v3 persistenceContextWithOptions:2];

  id v5 = *(void **)(a1 + 32);
  id v8 = 0;
  [v5 _processDeletionRequestWithFetchRequest:v2 context:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

- (void)removePlacesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTLearnedLocationStore_removePlacesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__RTLearnedLocationStore_removePlacesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePlacesWithHandler:*(void *)(a1 + 40)];
}

- (void)_removeUnreferencedPlacesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __63__RTLearnedLocationStore__removeUnreferencedPlacesWithHandler___block_invoke;
  id v10 = &unk_1E6B946F8;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);
}

void __63__RTLearnedLocationStore__removeUnreferencedPlacesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  unint64_t v5 = 0x1E4F28000uLL;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K.%K & %lu) == 0", @"mapItem", @"mapItemSource", *MEMORY[0x1E4F5D028]];
  [v4 setPredicate:v6];

  v51[0] = @"identifier";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  [v4 setPropertiesToFetch:v7];

  [v4 setResultType:2];
  id v47 = 0;
  id v40 = v3;
  uint64_t v8 = [v3 executeFetchRequest:v4 error:&v47];
  id v9 = v47;
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
    goto LABEL_28;
  }
  uint64_t v36 = a1;
  __int16 v37 = v4;
  id v38 = [MEMORY[0x1E4F1CA80] set];
  __int16 v39 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  __int16 v35 = v8;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (!v12) {
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v44;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * v15);
      id v17 = (void *)MEMORY[0x1E016D870]();
      id v18 = [v16 objectForKey:@"identifier"];
      if (v18)
      {
        id v19 = +[RTLearnedLocationOfInterestMO fetchRequest];
        unint64_t v20 = v5;
        uint64_t v21 = [*(id *)(v5 + 3936) predicateWithFormat:@"%K == %@", @"placeIdentifier", v18];
        [v19 setPredicate:v21];

        id v42 = 0;
        uint64_t v22 = [v40 countForFetchRequest:v19 error:&v42];
        id v23 = v42;
        if (v23)
        {
          id v24 = v39;
          id v25 = v23;
          goto LABEL_12;
        }
        if (!v22)
        {
          id v24 = v38;
          id v25 = v18;
LABEL_12:
          [v24 addObject:v25];
        }

        unint64_t v5 = v20;
        goto LABEL_17;
      }
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v16;
        _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "fetched learned place has nil identifier, %@", buf, 0xCu);
      }
LABEL_17:

      ++v15;
    }
    while (v13 != v15);
    uint64_t v26 = [v11 countByEnumeratingWithState:&v43 objects:v50 count:16];
    uint64_t v13 = v26;
  }
  while (v26);
LABEL_21:

  SEL v27 = _RTSafeArray();
  id v28 = _RTMultiErrorCreate();

  if (v28)
  {
    uint64_t v8 = v35;
    uint64_t v29 = *(void *)(v36 + 40);
    if (v29) {
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v28);
    }
  }
  else
  {
    id v30 = [*(id *)(v36 + 32) persistenceManager];
    id v31 = [v30 persistenceContextWithOptions:2];

    id v32 = *(void **)(v36 + 32);
    id v41 = 0;
    [v32 deletePlacesWithinIdentifierSetWithZeroVisits:v38 context:v40 tombstoneContext:v31 error:&v41];
    id v33 = v41;
    uint64_t v34 = *(void *)(v36 + 40);
    if (v34) {
      (*(void (**)(uint64_t, id))(v34 + 16))(v34, v33);
    }

    uint64_t v8 = v35;
  }

  id v4 = v37;
  id v9 = 0;
LABEL_28:
}

- (void)removeUnreferencedPlacesWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTLearnedLocationStore_removeUnreferencedPlacesWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__RTLearnedLocationStore_removeUnreferencedPlacesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeUnreferencedPlacesWithHandler:*(void *)(a1 + 40)];
}

- (void)_removeVisits:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__RTLearnedLocationStore__removeVisits_handler___block_invoke;
    v15[3] = &unk_1E6B91018;
    id v16 = v7;
    id v17 = self;
    SEL v19 = a2;
    id v9 = v8;
    id v18 = v9;
    uint64_t v10 = (void *)MEMORY[0x1E016DB00](v15);
    [(RTStore *)self _performBlock:v10 contextType:0 errorHandler:v9];

    id v11 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"requires valid visits.";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v12 errorWithDomain:v13 code:7 userInfo:v11];
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_5;
  }
LABEL_6:
}

void __48__RTLearnedLocationStore__removeVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(a1 + 32) count]];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) identifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v7);
  }

  id v11 = +[RTLearnedVisitMO fetchRequest];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v4];
  [v11 setPredicate:v12];

  uint64_t v13 = [*(id *)(a1 + 40) persistenceManager];
  uint64_t v14 = [v13 persistenceContextWithOptions:2];

  uint64_t v15 = *(void **)(a1 + 40);
  id v32 = 0;
  uint64_t v29 = (void *)v14;
  [v15 _processDeletionRequestWithFetchRequest:v11 context:v14 error:&v32];
  id v16 = v32;
  id v17 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v4];
  [v17 setPredicate:v18];

  SEL v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v17];
  [v19 setResultType:2];
  id v30 = v3;
  id v31 = 0;
  uint64_t v20 = [v3 executeRequest:v19 error:&v31];
  id v21 = v31;
  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v28 = v11;
    v24 = id v23 = v16;
    id v25 = [v20 result];
    *(_DWORD *)buf = 138413058;
    id v38 = v24;
    __int16 v39 = 2112;
    id v40 = v19;
    __int16 v41 = 2112;
    id v42 = v25;
    __int16 v43 = 2112;
    id v44 = v21;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

    id v16 = v23;
    id v11 = v28;
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v26 = _RTSafeArray();
    SEL v27 = _RTMultiErrorCreate();

    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v27);
  }
}

- (void)removeVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTLearnedLocationStore_removeVisits_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __47__RTLearnedLocationStore_removeVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeVisitsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__RTLearnedLocationStore__removeVisitsWithHandler___block_invoke;
  id v10 = &unk_1E6B910D8;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);
}

void __51__RTLearnedLocationStore__removeVisitsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = +[RTLearnedVisitMO fetchRequest];
  id v3 = [*(id *)(a1 + 32) persistenceManager];
  id v4 = [v3 persistenceContextWithOptions:2];

  id v5 = *(void **)(a1 + 32);
  id v8 = 0;
  [v5 _processDeletionRequestWithFetchRequest:v2 context:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

- (void)removeVisitsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTLearnedLocationStore_removeVisitsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__RTLearnedLocationStore_removeVisitsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVisitsWithHandler:*(void *)(a1 + 40)];
}

- (void)_removeTransitionsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __56__RTLearnedLocationStore__removeTransitionsWithHandler___block_invoke;
  id v10 = &unk_1E6B910D8;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v7);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v6, 0, v5, v7, v8, v9, v10, v11);
}

void __56__RTLearnedLocationStore__removeTransitionsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = +[RTLearnedTransitionMO fetchRequest];
  id v3 = [*(id *)(a1 + 32) persistenceManager];
  id v4 = [v3 persistenceContextWithOptions:2];

  id v5 = *(void **)(a1 + 32);
  id v8 = 0;
  [v5 _processDeletionRequestWithFetchRequest:v2 context:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

- (void)removeTransitionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTLearnedLocationStore_removeTransitionsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTLearnedLocationStore_removeTransitionsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTransitionsWithHandler:*(void *)(a1 + 40)];
}

- (void)_removeTransitionsReferencingVisits:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__RTLearnedLocationStore__removeTransitionsReferencingVisits_handler___block_invoke;
    v15[3] = &unk_1E6B91018;
    id v16 = v7;
    id v17 = self;
    SEL v19 = a2;
    id v9 = v8;
    id v18 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v15);
    [(RTStore *)self _performBlock:v10 contextType:0 errorHandler:v9];

    id v11 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"requires valid visits.";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v12 errorWithDomain:v13 code:0 userInfo:v11];
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_5;
  }
LABEL_6:
}

void __70__RTLearnedLocationStore__removeTransitionsReferencingVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(a1 + 32) count]];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v44 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v6);
  }

  id v10 = +[RTLearnedTransitionMO fetchRequest];
  id v11 = (void *)MEMORY[0x1E4F28BA0];
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"origin.identifier", v3];
  v57[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"destination.identifier", v3];
  v57[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  uint64_t v15 = [v11 orPredicateWithSubpredicates:v14];
  [v10 setPredicate:v15];

  id v16 = [*(id *)(a1 + 40) persistenceManager];
  id v17 = [v16 persistenceContextWithOptions:2];

  id v18 = *(void **)(a1 + 40);
  id v43 = 0;
  id v40 = v10;
  [v18 _processDeletionRequestWithFetchRequest:v10 context:v17 error:&v43];
  id v19 = v43;
  uint64_t v20 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
  id v21 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"visitIdentifierOrigin", v3];
  v56[0] = v22;
  id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"visitIdentifierDestination", v3];
  v56[1] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v25 = [v21 orPredicateWithSubpredicates:v24];
  [v20 setPredicate:v25];

  __int16 v39 = v20;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v20];
  [v26 setResultType:2];
  id v42 = 0;
  SEL v27 = [v41 executeRequest:v26 error:&v42];
  id v28 = v42;
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v30 = v38 = v17;
    [v27 result];
    uint64_t v31 = a1;
    v33 = id v32 = v19;
    *(_DWORD *)buf = 138413058;
    uint64_t v49 = v30;
    __int16 v50 = 2112;
    __int16 v51 = v26;
    __int16 v52 = 2112;
    uint64_t v53 = v33;
    __int16 v54 = 2112;
    id v55 = v28;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

    id v19 = v32;
    a1 = v31;

    id v17 = v38;
  }

  if (*(void *)(a1 + 48))
  {
    long long v34 = _RTSafeArray();
    _RTMultiErrorCreate();
    uint64_t v35 = a1;
    v37 = id v36 = v19;

    (*(void (**)(void, void *))(*(void *)(v35 + 48) + 16))(*(void *)(v35 + 48), v37);
    id v19 = v36;
  }
}

- (void)removeTransitionsReferencingVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTLearnedLocationStore_removeTransitionsReferencingVisits_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__RTLearnedLocationStore_removeTransitionsReferencingVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTransitionsReferencingVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)createFetchRequestForOverlappingVisits:(id)a3 entityName:(id)a4 entryDatePropertyName:(id)a5 exitDatePropertyName:(id)a6 context:(id)a7 error:(id *)a8
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = v17;
  if (!a8)
  {
    id v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_20;
  }
  if (!v13)
  {
    long long v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }

    long long v45 = @"learnedVisits";
    goto LABEL_30;
  }
  if (!v14)
  {
    long long v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    long long v45 = @"entityName";
    goto LABEL_30;
  }
  if (!v17)
  {
    long long v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    long long v45 = @"context";
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v45);
    id v42 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  id v19 = [v17 persistentStoreCoordinator];
  uint64_t v20 = [v19 managedObjectModel];
  id v21 = [v20 entitiesByName];
  uint64_t v22 = [v21 objectForKeyedSubscript:v14];

  if (!v22)
  {
    uint64_t v49 = [NSString stringWithFormat:@"entity, %@, not found in model", v14];
    __int16 v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F5CFE8];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    v85[0] = v49;
    __int16 v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    uint64_t v53 = [v50 errorWithDomain:v51 code:7 userInfo:v52];

    id v54 = v53;
    *a8 = v54;

LABEL_20:
    id v42 = 0;
    goto LABEL_31;
  }
  id v68 = a8;
  id v71 = v16;
  id v72 = v15;
  id v23 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v14];
  id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v13 count]];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v13;
  uint64_t v25 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v74;
    uint64_t v63 = *MEMORY[0x1E4F28568];
    uint64_t v64 = *MEMORY[0x1E4F5CFE8];
    id v66 = v14;
    id v67 = v13;
    uint64_t v65 = v23;
    long long v70 = v24;
LABEL_8:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v74 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v29 = *(void **)(*((void *)&v73 + 1) + 8 * v28);
      id v30 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v31 = [v29 entryDate];
      id v32 = [v29 exitDate];
      long long v33 = [v30 predicateWithFormat:@"%K between { %@, %@ }", v72, v31, v32];

      long long v34 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v35 = [v29 entryDate];
      id v36 = [v29 exitDate];
      __int16 v37 = [v34 predicateWithFormat:@"%K between { %@, %@ }", v71, v35, v36];

      if (!v33 || !v37) {
        break;
      }
      id v38 = (void *)MEMORY[0x1E4F28BA0];
      v80[0] = v33;
      v80[1] = v37;
      __int16 v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
      id v40 = [v38 orPredicateWithSubpredicates:v39];

      if (!v40)
      {
        uint64_t v59 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v78 = v63;
        v79 = @"could not construct compound predicate";
        long long v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        long long v61 = [v59 errorWithDomain:v64 code:0 userInfo:v60];

        id v62 = v61;
        id *v68 = v62;

        id v58 = 0;
        goto LABEL_37;
      }
      [v70 addObject:v40];

      if (v26 == ++v28)
      {
        uint64_t v26 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
        id v14 = v66;
        id v13 = v67;
        id v23 = v65;
        id v24 = v70;
        if (v26) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
    id v55 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v81 = v63;
    id v82 = @"could not construct both entry and exit date predicates";
    v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    uint64_t v57 = [v55 errorWithDomain:v64 code:0 userInfo:v56];

    id v58 = v57;
    id *v68 = v58;
LABEL_37:

    id v42 = 0;
    id v14 = v66;
    id v13 = v67;
    id v16 = v71;
    id v15 = v72;
    id v23 = v65;
    id v24 = v70;
    goto LABEL_38;
  }
LABEL_16:

  id v41 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v24];
  [v23 setPredicate:v41];

  id v42 = v23;
  id v16 = v71;
  id v15 = v72;
LABEL_38:

LABEL_31:

  return v42;
}

- (id)identifiersForPlacesThatOwnVisitIdentifiers:(id)a3 context:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        id v10 = +[RTLearnedPlaceMO fetchRequest];
        id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K IN %@).@count > 0", @"visits", @"identifier", v7];
        [v10 setPredicate:v11];
        [v10 setFetchBatchSize:10];
        [v10 setReturnsObjectsAsFaults:1];
        v39[0] = @"identifier";
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        [v10 setPropertiesToFetch:v12];

        id v36 = 0;
        id v13 = [v9 executeFetchRequest:v10 error:&v36];
        id v14 = v36;
        id v15 = v14;
        if (v14)
        {
          id v16 = 0;
          *a5 = v14;
        }
        else
        {
          uint64_t v31 = v11;
          id v16 = [MEMORY[0x1E4F1CA80] setWithCapacity:[v13 count]];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v30 = v13;
          id v21 = v13;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v27 = [v26 identifier];

                if (v27)
                {
                  uint64_t v28 = [v26 identifier];
                  [v16 addObject:v28];
                }
                [v9 refreshObject:v26 mergeChanges:0];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v38 count:16];
            }
            while (v23);
          }

          [v9 reset];
          id v13 = v30;
          id v11 = v31;
          id v15 = 0;
        }

        goto LABEL_27;
      }
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      id v19 = @"context";
    }
    else
    {
      id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers", buf, 2u);
      }

      id v19 = @"visitIdentifiers";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  id v16 = 0;
LABEL_27:

  return v16;
}

- (id)fetchVisitIdentifiersUsingFetchRequest:(id)a3 context:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        id v10 = [v7 entityName];
        id v11 = +[NSManagedObject entityName];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          id v13 = (void *)[v7 copy];
          [v13 setFetchBatchSize:10];
          [v13 setReturnsObjectsAsFaults:1];
          id v38 = @"identifier";
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
          [v13 setPropertiesToFetch:v14];

          id v36 = 0;
          id v15 = [v9 executeFetchRequest:v13 error:&v36];
          id v16 = v36;
          id v17 = v16;
          if (v16)
          {
            id v18 = 0;
            *a5 = v16;
          }
          else
          {
            uint64_t v29 = [[_RTMap alloc] initWithInput:v15];
            uint64_t v31 = MEMORY[0x1E4F143A8];
            uint64_t v32 = 3221225472;
            long long v33 = __79__RTLearnedLocationStore_fetchVisitIdentifiersUsingFetchRequest_context_error___block_invoke;
            long long v34 = &unk_1E6B96718;
            id v30 = v9;
            id v35 = v30;
            id v18 = [(_RTMap *)v29 withBlock:&v31];

            [v30 reset:v31, v32, v33, v34];
          }

          goto LABEL_19;
        }
        uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F5CFE8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40[0] = @"fetchRequest is not for learnedVisitMOs";
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        uint64_t v26 = [v23 errorWithDomain:v24 code:7 userInfo:v25];

        id v27 = v26;
        *a5 = v27;

        goto LABEL_18;
      }
      uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      id v21 = @"context";
    }
    else
    {
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fetchRequest", buf, 2u);
      }

      id v21 = @"fetchRequest";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    id v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

LABEL_18:
  id v18 = 0;
LABEL_19:

  return v18;
}

id __79__RTLearnedLocationStore_fetchVisitIdentifiersUsingFetchRequest_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  [*(id *)(a1 + 32) refreshObject:v3 mergeChanges:0];

  return v4;
}

- (BOOL)deleteTransitionsReferencingVisitIdentifiers:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6
{
  void v55[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    if (v11)
    {
      if (v12)
      {
        aSelector = a2;
        +[RTLearnedTransitionMO fetchRequest];
        id v14 = v41 = v12;
        id v43 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
        id v15 = (void *)MEMORY[0x1E4F28BA0];
        id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"origin.identifier", v11];
        v55[0] = v16;
        id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"destination.identifier", v11];
        v55[1] = v17;
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
        id v19 = [v15 orPredicateWithSubpredicates:v18];
        [v14 setPredicate:v19];

        uint64_t v20 = (void *)MEMORY[0x1E4F28BA0];
        id v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"visitIdentifierOrigin", v11];
        v54[0] = v21;
        uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"visitIdentifierDestination", v11];
        v54[1] = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        uint64_t v24 = [v20 orPredicateWithSubpredicates:v23];
        [v43 setPredicate:v24];

        id v45 = 0;
        id v42 = v14;
        uint64_t v25 = v14;
        id v12 = v41;
        [(RTLearnedLocationStore *)self _processDeletionRequestWithFetchRequest:v25 context:v13 error:&v45];
        id v26 = v45;
        id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v43];
        [v27 setResultType:2];
        id v44 = 0;
        uint64_t v28 = [v41 executeRequest:v27 error:&v44];
        id v29 = v44;
        id v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138413058;
          long long v47 = v31;
          __int16 v48 = 2112;
          uint64_t v49 = v28;
          __int16 v50 = 2112;
          id v51 = v26;
          __int16 v52 = 2112;
          id v53 = v29;
          _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, deleted %@ transitions, cloudError, %@, localError, %@", buf, 0x2Au);
        }
        uint64_t v32 = _RTSafeArray();
        long long v33 = _RTMultiErrorCreate();

        BOOL v34 = v33 == 0;
        if (v33) {
          *a6 = v33;
        }

        goto LABEL_19;
      }
      id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      __int16 v37 = @"context";
    }
    else
    {
      id v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifiers", buf, 2u);
      }

      __int16 v37 = @"visitIdentifiers";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v37);
    BOOL v34 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v34 = 0;
LABEL_19:

  return v34;
}

- (BOOL)deleteVisitsUsingCloudFetchRequest:(id)a3 localFetchRequest:(id)a4 context:(id)a5 tombstoneContext:(id)a6 error:(id *)a7
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (!a7)
  {
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_16;
  }
  if (!v13)
  {
    long long v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cloudFetchRequest", buf, 2u);
    }

    BOOL v34 = @"cloudFetchRequest";
    goto LABEL_29;
  }
  if (!v14)
  {
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localFetchRequest", buf, 2u);
    }

    BOOL v34 = @"localFetchRequest";
    goto LABEL_29;
  }
  if (!v15)
  {
    id v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    BOOL v34 = @"context";
    goto LABEL_29;
  }
  if (!v16)
  {
    __int16 v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
    }

    BOOL v34 = @"tombstoneContext";
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v34);
    BOOL v31 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  id v18 = [v13 entityName];
  id v19 = +[NSManagedObject entityName];
  char v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F5CFE8];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    v61[0] = @"cloud fetch request is not for RTLearnedVisitMOs";
    id v41 = (void *)MEMORY[0x1E4F1C9E8];
    id v42 = (__CFString **)v61;
    id v43 = &v60;
LABEL_33:
    id v44 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
    id v45 = [v39 errorWithDomain:v40 code:7 userInfo:v44];

    id v46 = v45;
    *a7 = v46;

LABEL_16:
    BOOL v31 = 0;
    goto LABEL_30;
  }
  id v21 = [v14 entityName];
  uint64_t v22 = +[NSManagedObject entityName];
  char v23 = [v21 isEqual:v22];

  if ((v23 & 1) == 0)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F5CFE8];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    uint64_t v59 = @"local fetch request is not for RTLearnedLocationOfInterestVisitMO";
    id v41 = (void *)MEMORY[0x1E4F1C9E8];
    id v42 = &v59;
    id v43 = &v58;
    goto LABEL_33;
  }
  id v49 = 0;
  [(RTLearnedLocationStore *)self _processDeletionRequestWithFetchRequest:v13 context:v17 error:&v49];
  id v24 = v49;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v14];
  [v25 setResultType:2];
  id v48 = 0;
  long long v47 = [v15 executeRequest:v25 error:&v48];
  id v26 = v48;
  id v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v51 = v28;
    __int16 v52 = 2112;
    id v53 = v47;
    __int16 v54 = 2112;
    id v55 = v24;
    __int16 v56 = 2112;
    id v57 = v26;
    _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, deleted %@ visits, cloudError, %@, localError, %@", buf, 0x2Au);
  }
  id v29 = _RTSafeArray();
  id v30 = _RTMultiErrorCreate();

  BOOL v31 = v30 == 0;
  if (v30) {
    *a7 = v30;
  }

LABEL_30:
  return v31;
}

- (BOOL)deletePlacesWithinIdentifierSet:(id)a3 tombstoneContext:(id)a4 error:(id *)a5
{
  void v28[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        id v11 = +[RTLearnedPlaceMO fetchRequest];
        uint64_t v25 = (void *)MEMORY[0x1E4F28BA0];
        id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v8];
        v28[0] = v12;
        id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %lu", @"mapItem.mapItemSource", 4];
        v28[1] = v13;
        id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %lu", @"mapItem.mapItemSource", 0x20000];
        void v28[2] = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
        id v16 = [v25 andPredicateWithSubpredicates:v15];
        [v11 setPredicate:v16];

        id v26 = 0;
        [(RTLearnedLocationStore *)self _processDeletionRequestWithFetchRequest:v11 context:v10 error:&v26];
        id v17 = v26;
        id v18 = v17;
        BOOL v19 = v17 == 0;
        if (v17) {
          *a5 = v17;
        }

        goto LABEL_17;
      }
      char v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
      }

      uint64_t v22 = @"tombstoneContext";
    }
    else
    {
      id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeIdentifierSet", buf, 2u);
      }

      uint64_t v22 = @"placeIdentifierSet";
    }
    _RTErrorInvalidParameterCreate((uint64_t)v22);
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  char v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (BOOL)deletePlacesWithinIdentifierSetWithZeroVisits:(id)a3 context:(id)a4 tombstoneContext:(id)a5 error:(id *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!a6)
  {
    char v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v19 = 0;
    goto LABEL_40;
  }
  if (!v10)
  {
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeIdentifierSet", buf, 2u);
    }

    uint64_t v22 = @"placeIdentifierSet";
    goto LABEL_19;
  }
  if (!v11)
  {
    char v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    uint64_t v22 = @"context";
    goto LABEL_19;
  }
  if (!v12)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tombstoneContext", buf, 2u);
    }

    uint64_t v22 = @"tombstoneContext";
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v22);
    BOOL v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  id v14 = +[RTLearnedPlaceMO fetchRequest];
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v10];
  [v14 setPredicate:v15];
  [v14 setReturnsObjectsAsFaults:0];
  id v56 = 0;
  id v16 = [v14 execute:&v56];
  id v17 = v56;
  id v18 = v17;
  if (v17)
  {
    BOOL v19 = 0;
    *a6 = v17;
    goto LABEL_39;
  }
  id v38 = v15;
  uint64_t v39 = self;
  uint64_t v40 = v14;
  id v41 = a6;
  id v42 = v13;
  id v43 = v10;
  id v44 = [MEMORY[0x1E4F1CA80] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  __int16 v37 = v16;
  id obj = v16;
  uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (!v47) {
    goto LABEL_38;
  }
  uint64_t v46 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v47; ++i)
    {
      if (*(void *)v53 != v46) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      id v27 = (void *)MEMORY[0x1E016D870]();
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v28 = [v26 visits];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v49;
LABEL_27:
        uint64_t v32 = 0;
        while (1)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = *(void **)(*((void *)&v48 + 1) + 8 * v32);
          char v34 = [v33 flags];
          [v11 refreshObject:v33 mergeChanges:0];
          if ((v34 & 1) == 0) {
            break;
          }
          if (v30 == ++v32)
          {
            uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v30) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
      }
      else
      {
LABEL_33:

        id v35 = [v26 identifier];

        if (!v35) {
          goto LABEL_36;
        }
        uint64_t v28 = [v26 identifier];
        [v44 addObject:v28];
      }

LABEL_36:
      [v11 refreshObject:v26 mergeChanges:0];
    }
    uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  }
  while (v47);
LABEL_38:

  [v11 reset];
  id v13 = v42;
  BOOL v19 = [(RTLearnedLocationStore *)v39 deletePlacesWithinIdentifierSet:v44 tombstoneContext:v42 error:v41];

  id v10 = v43;
  id v14 = v40;
  id v16 = v37;
  id v15 = v38;
  id v18 = 0;
LABEL_39:

LABEL_40:
  return v19;
}

- (void)_removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if ([v7 count])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__RTLearnedLocationStore__removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke;
      v16[3] = &unk_1E6B91018;
      void v16[4] = self;
      id v17 = v7;
      id v10 = v9;
      id v18 = v10;
      SEL v19 = a2;
      id v11 = (void *)MEMORY[0x1E016DB00](v16);
      [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];
    }
    else if (v9)
    {
      v9[2](v9, 0);
    }
  }
  else if (v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"learnedVisits cannot be nil";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v12 errorWithDomain:v13 code:7 userInfo:v14];

    ((void (**)(void, void *))v9)[2](v9, v15);
  }
}

void __82__RTLearnedLocationStore__removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = +[RTLearnedVisitMO entity];
  id v7 = [v6 name];
  id v59 = 0;
  id v8 = [v4 createFetchRequestForOverlappingVisits:v5 entityName:v7 entryDatePropertyName:@"entryDate" exitDatePropertyName:@"exitDate" context:v3 error:&v59];
  id v9 = v59;

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = +[RTLearnedLocationOfInterestVisitMO entity];
  uint64_t v13 = [v12 name];
  id v58 = 0;
  id v14 = [v10 createFetchRequestForOverlappingVisits:v11 entityName:v13 entryDatePropertyName:@"entryDate" exitDatePropertyName:@"exitDate" context:v3 error:&v58];
  id v15 = v58;

  id v16 = _RTSafeArray();
  id v17 = _RTMultiErrorCreate();

  if (v17)
  {
    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
    }
  }
  else
  {
    SEL v19 = *(void **)(a1 + 32);
    id v57 = 0;
    uint64_t v20 = [v19 fetchVisitIdentifiersUsingFetchRequest:v8 context:v3 error:&v57];
    id v21 = v57;
    if (v21)
    {
      uint64_t v22 = *(void *)(a1 + 48);
      if (v22) {
        (*(void (**)(uint64_t, id))(v22 + 16))(v22, v21);
      }
    }
    else
    {
      char v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      long long v50 = v20;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
        uint64_t v26 = [v25 count];
        *(_DWORD *)buf = 138412546;
        long long v61 = v24;
        __int16 v62 = 2048;
        uint64_t v63 = v26;
        _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%@, overlapping visits count, %lu", buf, 0x16u);

        uint64_t v20 = v50;
      }

      id v27 = *(void **)(a1 + 32);
      id v56 = 0;
      long long v51 = [v27 identifiersForPlacesThatOwnVisitIdentifiers:v20 context:v3 error:&v56];
      id v28 = v56;
      if (v28)
      {
        uint64_t v29 = *(void *)(a1 + 48);
        if (v29) {
          (*(void (**)(uint64_t, id))(v29 + 16))(v29, v28);
        }
      }
      long long v49 = v28;
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = NSStringFromSelector(*(SEL *)(a1 + 56));
        uint64_t v32 = [v51 count];
        *(_DWORD *)buf = 138412546;
        long long v61 = v31;
        __int16 v62 = 2048;
        uint64_t v63 = v32;
        _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, places count, %lu", buf, 0x16u);
      }
      long long v33 = [*(id *)(a1 + 32) persistenceManager];
      uint64_t v34 = [v33 persistenceContextWithOptions:2];

      id v35 = *(void **)(a1 + 32);
      id v55 = 0;
      [v35 deleteTransitionsReferencingVisitIdentifiers:v20 context:v3 tombstoneContext:v34 error:&v55];
      id v36 = v55;
      __int16 v37 = *(void **)(a1 + 32);
      id v54 = 0;
      [v37 deleteVisitsUsingCloudFetchRequest:v8 localFetchRequest:v14 context:v3 tombstoneContext:v34 error:&v54];
      id v38 = v54;
      uint64_t v39 = *(void **)(a1 + 32);
      id v53 = 0;
      long long v48 = (void *)v34;
      [v39 deletePlacesWithinIdentifierSetWithZeroVisits:v51 context:v3 tombstoneContext:v34 error:&v53];
      id v40 = v53;
      id v52 = 0;
      [v3 save:&v52];
      id v45 = v52;
      uint64_t v46 = v38;
      uint64_t v47 = v36;
      id v41 = _RTSafeArray();
      id v42 = _RTMultiErrorCreate();

      uint64_t v44 = *(void *)(a1 + 48);
      if (v42)
      {
        if (v44) {
          (*(void (**)(uint64_t, void *, uint64_t))(v44 + 16))(v44, v42, v43);
        }
      }
      else if (v44)
      {
        (*(void (**)(uint64_t, void, uint64_t))(v44 + 16))(v44, 0, v43);
      }

      id v21 = 0;
      uint64_t v20 = v50;
    }
  }
}

- (void)removeOverlappingVisitsAndTransitionsForVisits:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__RTLearnedLocationStore_removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __81__RTLearnedLocationStore_removeOverlappingVisitsAndTransitionsForVisits_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeOverlappingVisitsAndTransitionsForVisits:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke;
    v17[3] = &unk_1E6B96740;
    id v18 = v6;
    id v9 = v8;
    SEL v19 = self;
    id v20 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_3;
    v15[3] = &unk_1E6B90C18;
    id v16 = v9;
    [(RTStore *)self _performBlock:v10 contextType:1 errorHandler:v15];

    uint64_t v11 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"identifier cannot be nil";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = [v12 errorWithDomain:v13 code:7 userInfo:v11];
    ((void (**)(void, void *))v8)[2](v8, v14);

    goto LABEL_5;
  }
LABEL_6:
}

void __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setFetchLimit:1];
  id v24 = 0;
  id v4 = [v2 execute:&v24];
  id v5 = v24;
  id v6 = [v4 firstObject];

  if (!v5)
  {
    if (v6)
    {
      uint64_t v8 = +[RTLearnedVisit createWithManagedObject:v6];
      id v9 = (void *)v8;
      if (v8)
      {
        id v10 = *(void **)(a1 + 40);
        uint64_t v25 = v8;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        void v22[2] = __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_2;
        v22[3] = &unk_1E6B90C18;
        id v23 = *(id *)(a1 + 48);
        [v10 removeOverlappingVisitsAndTransitionsForVisits:v11 handler:v22];

        id v12 = v23;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v18 = *(void *)(a1 + 48);
      if (v18)
      {
        SEL v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F5CFE8];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        id v27 = @"visit could not be created from managed object";
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        uint64_t v21 = [v19 errorWithDomain:v20 code:0 userInfo:v12];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);

        goto LABEL_11;
      }
    }
    else
    {
      if (!*(void *)(a1 + 48)) {
        goto LABEL_13;
      }
      id v9 = [NSString stringWithFormat:@"visit with identifier, %@, not found", *(void *)(a1 + 32)];
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = v9;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v17 = [v14 errorWithDomain:v15 code:0 userInfo:v16];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v17);
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
LABEL_13:
}

uint64_t __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__RTLearnedLocationStore__removeVisitWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeVisitWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTLearnedLocationStore_removeVisitWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __60__RTLearnedLocationStore_removeVisitWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVisitWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (id)identifiersForPlacesThatDedupeToPlace:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v58 = a4;
  if (!a5)
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", buf, 2u);
    }

    uint64_t v32 = @"place";
    goto LABEL_17;
  }
  if (!v58)
  {
    long long v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    uint64_t v32 = @"context";
LABEL_17:
    _RTErrorInvalidParameterCreate((uint64_t)v32);
    id v55 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  [v8 mapItem];
  v10 = id v9 = v8;

  if (!v10)
  {
    uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    id v8 = v9;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v67 = 2112;
      id v68 = v9;
      _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, found place with nil mapItem, %@", buf, 0x16u);
    }
LABEL_10:
    id v55 = 0;
    goto LABEL_35;
  }
  id v52 = +[RTMapItemMO fetchRequest];
  *(void *)buf = 0;
  uint64_t v11 = [v9 mapItem];
  id v12 = [v11 location];
  [v12 latitude];
  id v53 = v9;
  id v13 = [v9 mapItem];
  id v14 = [v13 location];
  [v14 longitude];
  RTCommonCalculateBoundingBox();

  long long v50 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
  id obja = [NSNumber numberWithDouble:0.0];
  [v15 predicateWithFormat:@"%@ <= %K", obja, @"longitude"];
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  v65[0] = v54;
  id v16 = (void *)MEMORY[0x1E4F28F60];
  long long v51 = [NSNumber numberWithDouble:0.0];
  id v17 = [v16 predicateWithFormat:@"%K <= %@", @"longitude", v51];
  v65[1] = v17;
  uint64_t v18 = (void *)MEMORY[0x1E4F28F60];
  SEL v19 = [NSNumber numberWithDouble:0.0];
  uint64_t v20 = [v18 predicateWithFormat:@"%@ <= %K", v19, @"latitude"];
  v65[2] = v20;
  uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v22 = v52;
  id v23 = [NSNumber numberWithDouble:0.0];
  id v24 = [v21 predicateWithFormat:@"%K <= %@", @"latitude", v23];
  v65[3] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
  uint64_t v26 = [v50 andPredicateWithSubpredicates:v25];
  [v52 setPredicate:v26];

  memset(v63, 0, sizeof(v63));
  id v27 = [v52 execute:v63];
  id v28 = v63[0];
  uint64_t v29 = v28;
  if (v28)
  {
    id v55 = 0;
    *a5 = v28;
    id v8 = v53;
  }
  else
  {
    id v55 = [MEMORY[0x1E4F1CA80] set];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v27;
    uint64_t v36 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    id v8 = v53;
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v60 != v38) {
            objc_enumerationMutation(obj);
          }
          id v40 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v41 = (void *)MEMORY[0x1E016D870]();
          id v42 = [MEMORY[0x1E4F5CE38] createWithManagedObject:v40];
          if (v42)
          {
            uint64_t v43 = [v8 mapItem];
            int v44 = [v42 isEqualToMapItem:v43];

            if (v44)
            {
              id v45 = [v40 place];
              uint64_t v46 = [v45 identifier];

              if (v46)
              {
                uint64_t v47 = [v40 place];
                long long v48 = [v47 identifier];
                [v55 addObject:v48];

                id v8 = v53;
              }
            }
          }
          [v58 refreshObject:v40 mergeChanges:0];
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v37);
    }

    [v58 reset];
    uint64_t v22 = v52;
    uint64_t v29 = 0;
  }

LABEL_35:

  return v55;
}

- (void)_removePlacesForLocationOfInterest:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__RTLearnedLocationStore__removePlacesForLocationOfInterest_handler___block_invoke;
    v16[3] = &unk_1E6B91018;
    void v16[4] = self;
    id v17 = v7;
    id v10 = v9;
    id v18 = v10;
    SEL v19 = a2;
    uint64_t v11 = (void *)MEMORY[0x1E016DB00](v16);
    [(RTStore *)self _performBlock:v11 contextType:0 errorHandler:v10];
  }
  else if (v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F5CFE8];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"locationOfInterest cannot be nil";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v15 = [v12 errorWithDomain:v13 code:7 userInfo:v14];
    ((void (**)(void, void *))v9)[2](v9, v15);
  }
}

void __69__RTLearnedLocationStore__removePlacesForLocationOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) place];
  id v56 = 0;
  id v6 = [v4 identifiersForPlacesThatDedupeToPlace:v5 context:v3 error:&v56];
  id v7 = v56;

  if (v7 || ![v6 count])
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    }
  }
  else
  {
    id v9 = +[RTLearnedVisitMO fetchRequest];
    id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"place.identifier", v6];
    [v9 setPredicate:v10];

    uint64_t v11 = *(void **)(a1 + 32);
    id v55 = 0;
    id v12 = [v11 fetchVisitIdentifiersUsingFetchRequest:v9 context:v3 error:&v55];
    id v13 = v55;
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 48);
      if (v14) {
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v13);
      }
    }
    else
    {
      uint64_t v15 = +[RTLearnedVisitMO fetchRequest];
      id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v12];
      [v15 setPredicate:v16];

      id v17 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
      id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"identifier", v12];
      [v17 setPredicate:v18];

      SEL v19 = [*(id *)(a1 + 32) persistenceManager];
      uint64_t v20 = [v19 persistenceContextWithOptions:2];

      uint64_t v21 = *(void **)(a1 + 32);
      id v54 = 0;
      uint64_t v47 = v12;
      [v21 deleteTransitionsReferencingVisitIdentifiers:v12 context:v3 tombstoneContext:v20 error:&v54];
      id v49 = v54;
      uint64_t v22 = *(void **)(a1 + 32);
      id v53 = 0;
      id v45 = v17;
      uint64_t v46 = v15;
      [v22 deleteVisitsUsingCloudFetchRequest:v15 localFetchRequest:v17 context:v3 tombstoneContext:v20 error:&v53];
      id v48 = v53;
      id v23 = *(void **)(a1 + 32);
      id v52 = 0;
      int v44 = (void *)v20;
      [v23 deletePlacesWithinIdentifierSet:v6 tombstoneContext:v20 error:&v52];
      id v24 = v52;
      uint64_t v25 = +[RTLearnedLocationOfInterestMO fetchRequest];
      uint64_t v26 = (void *)MEMORY[0x1E4F28F60];
      id v27 = [*(id *)(a1 + 40) identifier];
      id v28 = [v26 predicateWithFormat:@"%K == %@", @"identifier", v27];
      [v25 setPredicate:v28];

      id v51 = 0;
      uint64_t v43 = v25;
      uint64_t v29 = [v25 execute:&v51];
      id v30 = v51;
      uint64_t v31 = [v29 firstObject];

      if (v31) {
        [v3 deleteObject:v31];
      }
      id v41 = (void *)v31;
      id v42 = v9;
      id v50 = 0;
      [v3 save:&v50];
      id v32 = v50;
      long long v33 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138413058;
        id v58 = v34;
        __int16 v59 = 2112;
        id v60 = v24;
        __int16 v61 = 2112;
        id v62 = v30;
        __int16 v63 = 2112;
        id v64 = v32;
        _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%@, deleted places error, %@, loi fetch error, %@, save error, %@", buf, 0x2Au);
      }
      id v35 = v30;
      uint64_t v36 = v24;
      uint64_t v37 = _RTSafeArray();
      uint64_t v38 = _RTMultiErrorCreate();

      uint64_t v39 = *(void *)(a1 + 48);
      id v13 = 0;
      if (v38)
      {
        id v40 = v41;
        if (v39) {
          (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v38);
        }
      }
      else
      {
        (*(void (**)(uint64_t, void))(v39 + 16))(v39, 0);
        id v40 = v41;
      }

      id v12 = v47;
      id v9 = v42;
    }
  }
}

- (void)removePlacesForLocationOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTLearnedLocationStore_removePlacesForLocationOfInterest_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__RTLearnedLocationStore_removePlacesForLocationOfInterest_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePlacesForLocationOfInterest:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke;
    v13[3] = &unk_1E6B96768;
    id v16 = v7;
    id v14 = v6;
    uint64_t v15 = self;
    [(RTLearnedLocationStore *)self fetchLocationOfInterestWithIdentifier:v14 handler:v13];

    id v9 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"identiifer cannot be nil";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v9 = [v10 errorWithDomain:v11 code:7 userInfo:v12];

    ((void (**)(void, void *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:
}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
  }
  else if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v5 visits];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_2;
    v18[3] = &unk_1E6B94220;
    void v18[4] = *(void *)(a1 + 40);
    id v19 = v5;
    id v20 = *(id *)(a1 + 48);
    [v8 removeOverlappingVisitsAndTransitionsForVisits:v9 handler:v18];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v13 = NSString;
    id v14 = [*(id *)(a1 + 32) UUIDString];
    uint64_t v15 = [v13 stringWithFormat:@"cannot find a location of interest with identifier, %@.", v14];
    v22[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = [v11 errorWithDomain:v12 code:0 userInfo:v16];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v17);
  }
}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E6B92690;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 removePlacesForLocationOfInterest:v5 handler:v7];
}

void __74__RTLearnedLocationStore__removeLocationOfInterestWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  id v2 = _RTSafeArray();
  _RTMultiErrorCreate();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)removeLocationOfInterestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RTLearnedLocationStore_removeLocationOfInterestWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __73__RTLearnedLocationStore_removeLocationOfInterestWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLocationOfInterestWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeLocationsOfInterestWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __64__RTLearnedLocationStore__removeLocationsOfInterestWithHandler___block_invoke;
  uint64_t v11 = &unk_1E6B96630;
  id v12 = v5;
  SEL v13 = a2;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1E016DB00](&v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6, v8, v9, v10, v11);
}

void __64__RTLearnedLocationStore__removeLocationsOfInterestWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedLocationOfInterestMO fetchRequest];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v5 setResultType:2];
  id v17 = 0;
  id v6 = [v3 executeRequest:v5 error:&v17];
  id v7 = v17;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v10 = [v6 result];
    *(_DWORD *)buf = 138413058;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
  }
  id v16 = 0;
  char v11 = [v3 save:&v16];
  id v12 = v16;
  if ((v11 & 1) == 0)
  {
    SEL v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v19 = v15;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
  }
}

- (void)_removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke;
  uint64_t v15 = &unk_1E6B91018;
  id v16 = v7;
  id v17 = self;
  id v18 = v8;
  SEL v19 = a2;
  id v9 = v8;
  id v10 = v7;
  char v11 = (void *)MEMORY[0x1E016DB00](&v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v9, v12, v13, v14, v15);
}

void __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, removing expired records with respect to date, %@", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(*(void *)(a1 + 40) + 64);
  id v13 = 0;
  [v8 removeExpiredRecordsBeforeDate:v7 context:v3 error:&v13];

  id v9 = v13;
  id v10 = [*(id *)(a1 + 40) mirroringManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke_499;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v12[4] = *(void *)(a1 + 56);
  [v10 performExportWithHandler:v12];

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }
}

void __66__RTLearnedLocationStore__removeRecordsExpiredBeforeDate_handler___block_invoke_499(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, successfully finished export with error, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)removeRecordsExpiredBeforeDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationStore_removeRecordsExpiredBeforeDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__RTLearnedLocationStore_removeRecordsExpiredBeforeDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRecordsExpiredBeforeDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_clearWithHandler:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke;
  v16[3] = &unk_1E6B96790;
  void v16[4] = self;
  id v7 = v6;
  id v17 = v7;
  dispatch_group_t v18 = v5;
  __int16 v8 = v5;
  id v9 = (void *)MEMORY[0x1E016DB00](v16);
  dispatch_group_enter(v8);
  [(RTLearnedLocationStore *)self _removePlacesWithHandler:v9];
  dispatch_group_enter(v8);
  [(RTLearnedLocationStore *)self _removeVisitsWithHandler:v9];
  dispatch_group_enter(v8);
  [(RTLearnedLocationStore *)self _removeTransitionsWithHandler:v9];
  dispatch_group_enter(v8);
  [(RTLearnedLocationStore *)self _removeLocationsOfInterestWithHandler:v9];
  dispatch_group_enter(v8);
  [(RTLearnedLocationStore *)self _removeAllMapItems:v9];
  id v10 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke_3;
  block[3] = &unk_1E6B90CE0;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  dispatch_group_notify(v8, v10, block);
}

void __44__RTLearnedLocationStore__clearWithHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__RTLearnedLocationStore__clearWithHandler___block_invoke_2;
    block[3] = &unk_1E6B92F80;
    id v6 = a1[5];
    id v7 = v3;
    id v8 = a1[6];
    dispatch_async(v4, block);
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)a1[6]);
  }
}

void __44__RTLearnedLocationStore__clearWithHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

uint64_t __44__RTLearnedLocationStore__clearWithHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = objc_opt_new();
    [v2 setObject:@"failed clearing learned locations" forKey:*MEMORY[0x1E4F28568]];
    uint64_t v7 = 1;
    id v3 = _RTSafeArray();
    id v4 = _RTMultiErrorCreate();

    if (v4) {
      [v2 setObject:v4 forKey:MEMORY[0x1E4F28A50]];
    }
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v2, v7];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)clearWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__RTLearnedLocationStore_clearWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__RTLearnedLocationStore_clearWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearWithHandler:*(void *)(a1 + 40)];
}

- (void)removeUnreferencedMapItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__RTLearnedLocationStore_removeUnreferencedMapItems___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__RTLearnedLocationStore_removeUnreferencedMapItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeUnreferencedMapItems:*(void *)(a1 + 40)];
}

- (void)_removeUnreferencedMapItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke;
  v6[3] = &unk_1E6B91100;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RTLearnedLocationStore *)self __removeUnreferencedMapItems:v6];
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_2;
    block[3] = &unk_1E6B90660;
    id v6 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v8 = 0;
    id v9 = v6;
    dispatch_async(v5, block);
  }
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_2(id *a1)
{
  v22[0] = 0;
  v22[1] = v22;
  void v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__69;
  void v22[4] = __Block_byref_object_dispose__69;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__69;
  void v20[4] = __Block_byref_object_dispose__69;
  id v21 = 0;
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_3;
  v16[3] = &unk_1E6B907C8;
  SEL v19 = v22;
  id v3 = a1[4];
  id v17 = a1[5];
  uint64_t v4 = v2;
  dispatch_group_t v18 = v4;
  [v3 __removeUnreferencedExtendedAttributes:v16];
  dispatch_group_enter(v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_4;
  v12[3] = &unk_1E6B907C8;
  id v15 = v20;
  id v5 = a1[4];
  id v13 = a1[5];
  id v6 = v4;
  id v14 = v6;
  [v5 __removeUnreferencedAddresses:v12];
  id v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_5;
  block[3] = &unk_1E6B967B8;
  id v9 = a1[6];
  id v10 = v22;
  id v11 = v20;
  dispatch_group_notify(v6, v7, block);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __54__RTLearnedLocationStore__removeUnreferencedMapItems___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = _RTSafeArray();
    _RTMultiErrorCreate();
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
  }
}

- (void)__removeUnreferencedAddresses:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__RTLearnedLocationStore___removeUnreferencedAddresses___block_invoke;
  v8[3] = &unk_1E6B91060;
  id v9 = v5;
  SEL v10 = a2;
  void v8[4] = self;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1E016DB00](v8);
  [(RTStore *)self _performBlock:v7 contextType:0 errorHandler:v6];
}

void __56__RTLearnedLocationStore___removeUnreferencedAddresses___block_invoke(uint64_t a1, void *a2)
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[RTAddressMO fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == nil", @"mapItem"];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v5;
  id v7 = [*(id *)(a1 + 32) predicateForObjectsFromCurrentDevice];
  v29[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v9 = [v6 andPredicateWithSubpredicates:v8];
  [v4 setPredicate:v9];

  SEL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v4];
  [v10 setResultType:2];
  id v20 = 0;
  id v11 = [v3 executeRequest:v10 error:&v20];

  id v12 = v20;
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    __int16 v22 = v14;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
  }
  if (v12)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      SEL v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      __int16 v22 = v19;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16)
    {
      id v17 = *(void (**)(void))(v16 + 16);
LABEL_10:
      v17();
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18)
    {
      id v17 = *(void (**)(void))(v18 + 16);
      goto LABEL_10;
    }
  }
}

- (void)__removeUnreferencedExtendedAttributes:(id)a3
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  SEL v10 = __65__RTLearnedLocationStore___removeUnreferencedExtendedAttributes___block_invoke;
  id v11 = &unk_1E6B96630;
  id v12 = v5;
  SEL v13 = a2;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1E016DB00](&v8);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v7, 0, v6, v8, v9, v10, v11);
}

void __65__RTLearnedLocationStore___removeUnreferencedExtendedAttributes___block_invoke(uint64_t a1, void *a2)
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = +[RTMapItemMO fetchRequest];
  [v5 setResultType:2];
  v81[0] = @"extendedAttributesIdentifier";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [v5 setPropertiesToFetch:v6];

  id v68 = 0;
  id v7 = [v3 executeFetchRequest:v5 error:&v68];
  id v8 = v68;
  if (!v8)
  {
    uint64_t v57 = a1;
    [v4 removeAllObjects];
    long long v67 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
    id v56 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v64 + 1) + 8 * i) allValues];
          [v4 addObjectsFromArray:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v14);
    }

    uint64_t v18 = +[RTMapItemExtendedAttributesMO fetchRequest];
    [v18 setResultType:2];
    v79 = @"identifier";
    SEL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    [v18 setPropertiesToFetch:v19];

    id v63 = 0;
    id v20 = [v3 executeFetchRequest:v18 error:&v63];
    id v9 = v63;
    if (v9)
    {
      id v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = NSStringFromSelector(*(SEL *)(v57 + 40));
        *(_DWORD *)buf = 138412546;
        long long v70 = v46;
        __int16 v71 = 2112;
        id v72 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      uint64_t v22 = *(void *)(v57 + 32);
      if (v22) {
        (*(void (**)(uint64_t, id))(v22 + 16))(v22, v9);
      }
      id v7 = v56;
      goto LABEL_40;
    }
    id v55 = v3;
    __int16 v23 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v54 = v20;
    id v24 = v20;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v78 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v59 + 1) + 8 * j) allValues];
          [v23 addObjectsFromArray:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v59 objects:v78 count:16];
      }
      while (v26);
    }

    [v23 minusSet:v4];
    if ([v23 count])
    {
      id v30 = +[RTMapItemExtendedAttributesMO fetchRequest];

      uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K IN (%@))", @"identifier", v23];
      id v32 = (void *)MEMORY[0x1E4F28BA0];
      id v52 = (void *)v31;
      uint64_t v77 = v31;
      long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
      uint64_t v34 = [v32 andPredicateWithSubpredicates:v33];
      [v30 setPredicate:v34];

      id v53 = v30;
      id v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v30];
      [v35 setResultType:2];
      id v58 = 0;
      id v3 = v55;
      uint64_t v36 = [v55 executeRequest:v35 error:&v58];
      id v37 = v58;
      uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      id v7 = v56;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(v57 + 40));
        id v50 = v35;
        id v39 = v37;
        v41 = id v40 = v36;
        *(_DWORD *)buf = 138413058;
        long long v70 = v41;
        __int16 v71 = 2112;
        id v72 = v50;
        __int16 v73 = 2112;
        long long v74 = v40;
        __int16 v75 = 2112;
        id v76 = v39;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

        uint64_t v36 = v40;
        id v37 = v39;
        id v35 = v50;
      }

      if (v37)
      {
        id v42 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v57 + 40));
          id v51 = v35;
          id v47 = v37;
          v49 = id v48 = v36;
          *(_DWORD *)buf = 138412546;
          long long v70 = v49;
          __int16 v71 = 2112;
          id v72 = v47;
          _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          uint64_t v36 = v48;
          id v37 = v47;
          id v35 = v51;
        }

        uint64_t v43 = *(void *)(v57 + 32);
        if (v43) {
          (*(void (**)(uint64_t, id))(v43 + 16))(v43, v37);
        }

        uint64_t v18 = v53;
        id v20 = v54;
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }

      uint64_t v18 = v53;
    }
    else
    {
      id v3 = v55;
      id v7 = v56;
    }
    uint64_t v45 = *(void *)(v57 + 32);
    id v20 = v54;
    if (v45) {
      (*(void (**)(uint64_t, void))(v45 + 16))(v45, 0);
    }
    goto LABEL_39;
  }
  id v9 = v8;
  SEL v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v44 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    long long v70 = v44;
    __int16 v71 = 2112;
    id v72 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }
LABEL_41:
}

- (void)__removeUnreferencedMapItems:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = dispatch_group_create();
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__69;
  v87[4] = __Block_byref_object_dispose__69;
  id v88 = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  void v85[3] = __Block_byref_object_copy__69;
  v85[4] = __Block_byref_object_dispose__69;
  id v86 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  void v83[3] = __Block_byref_object_copy__69;
  v83[4] = __Block_byref_object_dispose__69;
  id v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  void v81[3] = __Block_byref_object_copy__69;
  void v81[4] = __Block_byref_object_dispose__69;
  id v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__69;
  void v79[4] = __Block_byref_object_dispose__69;
  id v80 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__69;
  v77[4] = __Block_byref_object_dispose__69;
  id v78 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__69;
  v75[4] = __Block_byref_object_dispose__69;
  id v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__69;
  v73[4] = __Block_byref_object_dispose__69;
  id v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__69;
  v71[4] = __Block_byref_object_dispose__69;
  id v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__69;
  v69[4] = __Block_byref_object_dispose__69;
  id v70 = 0;
  dispatch_group_enter(v6);
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v93[0] = @"placeMapItemIdentifier";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke;
  v65[3] = &unk_1E6B905F0;
  long long v67 = v77;
  id v68 = v87;
  SEL v10 = v6;
  long long v66 = v10;
  [(RTLearnedLocationStore *)self _fetchEntityAsDictionaryWithEntityName:v8 propertiesToFetch:v9 handler:v65];

  dispatch_group_enter(v10);
  uint64_t v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  v92 = @"mapItemIdentifier";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  void v61[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_2;
  void v61[3] = &unk_1E6B905F0;
  id v63 = v75;
  long long v64 = v85;
  uint64_t v14 = v10;
  long long v62 = v14;
  [(RTLearnedLocationStore *)self _fetchEntityAsDictionaryWithEntityName:v12 propertiesToFetch:v13 handler:v61];

  dispatch_group_enter(v14);
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  v91[0] = @"placeInferenceMapItemIdentifier";
  v91[1] = @"placeInferenceFinerGranularityMapItemIdentifier";
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  void v57[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_3;
  v57[3] = &unk_1E6B905F0;
  long long v59 = v73;
  long long v60 = v83;
  uint64_t v18 = v14;
  id v58 = v18;
  [(RTLearnedLocationStore *)self _fetchEntityAsDictionaryWithEntityName:v16 propertiesToFetch:v17 handler:v57];

  dispatch_group_enter(v18);
  SEL v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  uint64_t v90 = @"mapItemIdentifier";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_4;
  v53[3] = &unk_1E6B905F0;
  id v55 = v71;
  id v56 = v81;
  uint64_t v22 = v18;
  id v54 = v22;
  [(RTLearnedLocationStore *)self _fetchEntityAsDictionaryWithEntityName:v20 propertiesToFetch:v21 handler:v53];

  dispatch_group_enter(v22);
  __int16 v23 = (objc_class *)objc_opt_class();
  id v24 = NSStringFromClass(v23);
  uint64_t v89 = @"finerGranularityMapItemIdentifier";
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_5;
  v49[3] = &unk_1E6B905F0;
  id v51 = v69;
  id v52 = v79;
  uint64_t v26 = v22;
  id v50 = v26;
  [(RTLearnedLocationStore *)self _fetchEntityAsDictionaryWithEntityName:v24 propertiesToFetch:v25 handler:v49];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_6;
  v41[3] = &unk_1E6B967E0;
  int v44 = v75;
  uint64_t v45 = v73;
  uint64_t v46 = v71;
  id v47 = v69;
  uint64_t v43 = v77;
  v41[4] = self;
  SEL v48 = a2;
  id v27 = v5;
  id v42 = v27;
  id v28 = (void *)MEMORY[0x1E016DB00](v41);
  uint64_t v29 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_534;
  block[3] = &unk_1E6B96808;
  uint64_t v36 = v85;
  id v37 = v83;
  uint64_t v38 = v81;
  id v39 = v79;
  SEL v40 = a2;
  void block[4] = self;
  id v33 = v27;
  id v34 = v28;
  id v35 = v87;
  id v30 = v28;
  id v31 = v27;
  dispatch_group_notify(v26, v29, block);

  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v83, 8);

  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v87, 8);
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  SEL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v50 = a2;
  id v51 = +[RTMapItemMO fetchRequest];
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NULL", @"place"];
  [v3 addObject:v5];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v70 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v69 + 1) + 8 * i) allValues];
        [v4 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v8);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v12 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v84 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v65 + 1) + 8 * j) allValues];
        [v4 addObjectsFromArray:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v84 count:16];
    }
    while (v14);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v18 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v83 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = [*(id *)(*((void *)&v61 + 1) + 8 * k) allValues];
        [v4 addObjectsFromArray:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v61 objects:v83 count:16];
    }
    while (v20);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v24 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v82 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v58 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*((void *)&v57 + 1) + 8 * m) allValues];
        [v4 addObjectsFromArray:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v57 objects:v82 count:16];
    }
    while (v26);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v30 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v81 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [*(id *)(*((void *)&v53 + 1) + 8 * n) allValues];
        [v4 addObjectsFromArray:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v81 count:16];
    }
    while (v32);
  }

  if ([v4 count])
  {
    uint64_t v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(%K IN (%@))", @"identifier", v4];
    [v3 addObject:v36];
  }
  id v37 = [*(id *)(a1 + 32) predicateForObjectsFromCurrentDevice];
  [v3 addObject:v37];

  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:1 subpredicates:v3];
  [v51 setPredicate:v38];
  id v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v51];
  [v39 setResultType:2];
  id v52 = 0;
  SEL v40 = v50;
  id v41 = [v50 executeRequest:v39 error:&v52];
  id v42 = v52;
  uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  int v44 = v43;
  if (v42)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v49 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 138412546;
      id v74 = v49;
      __int16 v75 = 2112;
      id v76 = v42;
      _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v45 = *(void *)(a1 + 40);
    if (v45)
    {
      uint64_t v46 = *(void (**)(void))(v45 + 16);
LABEL_47:
      v46();
    }
  }
  else
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v47 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 138413058;
      id v74 = v47;
      __int16 v75 = 2112;
      id v76 = v39;
      __int16 v77 = 2112;
      id v78 = v41;
      __int16 v79 = 2112;
      uint64_t v80 = 0;
      _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

      SEL v40 = v50;
    }

    uint64_t v48 = *(void *)(a1 + 40);
    if (v48)
    {
      uint64_t v46 = *(void (**)(void))(v48 + 16);
      goto LABEL_47;
    }
  }
}

void __55__RTLearnedLocationStore___removeUnreferencedMapItems___block_invoke_534(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) | *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    id v2 = _RTSafeArray();
    id v3 = _RTMultiErrorCreate();

    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void **)(a1 + 32);
    [v9 _performBlock:v7 contextType:0 errorHandler:v8];
  }
}

- (void)removeAllMapItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTLearnedLocationStore_removeAllMapItems___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__RTLearnedLocationStore_removeAllMapItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllMapItems:*(void *)(a1 + 40)];
}

- (void)_removeAllMapItems:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__RTLearnedLocationStore__removeAllMapItems___block_invoke;
  v8[3] = &unk_1E6B91060;
  id v9 = v5;
  SEL v10 = a2;
  void v8[4] = self;
  id v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x1E016DB00](v8);
  [(RTStore *)self _performBlock:v7 contextType:0 errorHandler:v6];
}

void __45__RTLearnedLocationStore__removeAllMapItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTMapItemMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:1];
  [v4 setIncludesPropertyValues:0];
  id v5 = [*(id *)(a1 + 32) persistenceManager];
  id v6 = [v5 persistenceContextWithOptions:2];

  uint64_t v7 = *(void **)(a1 + 32);
  id v29 = 0;
  [v7 _processDeletionRequestWithFetchRequest:v4 context:v6 error:&v29];
  id v8 = v29;
  id v9 = +[RTMapItemExtendedAttributesMO fetchRequest];
  [v4 setReturnsObjectsAsFaults:1];
  [v4 setIncludesPropertyValues:0];
  SEL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v9];
  [v9 setResultType:4];
  id v28 = 0;
  uint64_t v26 = [v3 executeRequest:v10 error:&v28];

  id v11 = v28;
  __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  uint64_t v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v26;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@", buf, 0x20u);
  }

LABEL_7:
  uint64_t v15 = +[RTAddressMO fetchRequest];
  [v15 setReturnsObjectsAsFaults:1];
  [v15 setIncludesPropertyValues:0];
  uint64_t v16 = *(void **)(a1 + 32);
  id v27 = 0;
  [v16 _processDeletionRequestWithFetchRequest:v15 context:v6 error:&v27];
  id v17 = v27;
  if (*(void *)(a1 + 40))
  {
    _RTSafeArray();
    id v18 = v9;
    uint64_t v19 = v6;
    uint64_t v20 = v10;
    uint64_t v22 = v21 = v8;
    _RTMultiErrorCreate();
    __int16 v23 = v25 = v4;

    id v8 = v21;
    SEL v10 = v20;
    id v6 = v19;
    id v9 = v18;
    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v23, v24);

    id v4 = v25;
  }
}

- (void)_replaceWithLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__RTLearnedLocationStore__replaceWithLocationsOfInterest_handler___block_invoke;
  v12[3] = &unk_1E6B90FD0;
  id v14 = v8;
  SEL v15 = a2;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x1E016DB00](v12);
  [(RTStore *)self _performBlock:v11 contextType:2 errorHandler:v10];
}

void __66__RTLearnedLocationStore__replaceWithLocationsOfInterest_handler___block_invoke(uint64_t a1, void *a2)
{
  v64[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[RTLearnedLocationOfInterestMO entity];
  v64[0] = v3;
  id v4 = +[RTLearnedLocationOfInterestVisitMO entity];
  v64[1] = v4;
  id v5 = +[RTLearnedLocationOfInterestTransitionMO entity];
  v64[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];

  id v42 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    unint64_t v10 = 0x1E4F1C000uLL;
    unint64_t v11 = 0x1E4F1C000uLL;
    id v38 = v2;
    do
    {
      uint64_t v12 = 0;
      uint64_t v40 = v8;
      do
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
        id v14 = objc_alloc(*(Class *)(v10 + 208));
        SEL v15 = [v13 name];
        uint64_t v16 = [v14 initWithEntityName:v15];

        uint64_t v43 = (void *)v16;
        id v17 = (void *)[objc_alloc(*(Class *)(v11 + 24)) initWithFetchRequest:v16];
        [v17 setResultType:2];
        id v49 = 0;
        id v18 = [v2 executeRequest:v17 error:&v49];
        id v19 = v49;
        uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = NSStringFromSelector(*(SEL *)(a1 + 48));
          [v18 result];
          unint64_t v22 = v11;
          unint64_t v23 = v10;
          v25 = uint64_t v24 = v9;
          *(_DWORD *)buf = 138413058;
          long long v56 = v21;
          __int16 v57 = 2112;
          id v58 = v17;
          __int16 v59 = 2112;
          long long v60 = v25;
          __int16 v61 = 2112;
          id v62 = v19;
          _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

          uint64_t v9 = v24;
          unint64_t v10 = v23;
          unint64_t v11 = v22;
          uint64_t v8 = v40;

          id v2 = v38;
        }

        if (v19) {
          [v42 addObject:v19];
        }

        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v8);
  }

  if ([v42 count])
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "skipping persisting of new locations of interest due to errors during deletion.", buf, 2u);
    }

    id v27 = _RTSafeArray();
    _RTMultiErrorCreate();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v29 = *(id *)(a1 + 32);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = (id)[*(id *)(*((void *)&v45 + 1) + 8 * i) managedObjectWithContext:v2];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v31);
  }

  id v44 = 0;
  char v35 = [v2 save:&v44];
  id v28 = v44;
  if ((v35 & 1) == 0)
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v37 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      long long v56 = v37;
      __int16 v57 = 2112;
      id v58 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v36 = *(void *)(a1 + 40);
  if (v36) {
    (*(void (**)(uint64_t, id))(v36 + 16))(v36, v28);
  }
}

- (void)replaceWithLocationsOfInterest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTLearnedLocationStore_replaceWithLocationsOfInterest_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__RTLearnedLocationStore_replaceWithLocationsOfInterest_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceWithLocationsOfInterest:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchEntityAsDictionaryWithEntityName:(id)a3 propertiesToFetch:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke;
    v17[3] = &unk_1E6B91018;
    id v18 = v9;
    id v19 = v10;
    SEL v21 = a2;
    id v12 = v11;
    id v20 = v12;
    id v13 = (void *)MEMORY[0x1E016DB00](v17);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke_535;
    v15[3] = &unk_1E6B90C18;
    id v16 = v12;
    [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v15];
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v23 = "-[RTLearnedLocationStore _fetchEntityAsDictionaryWithEntityName:propertiesToFetch:handler:]";
      __int16 v24 = 1024;
      int v25 = 6423;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

void __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithEntityName:*(void *)(a1 + 32)];
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:*(void *)(a1 + 40)];
  id v13 = 0;
  id v6 = [v4 executeFetchRequest:v5 error:&v13];

  id v7 = v13;
  if (v7)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      SEL v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }
}

uint64_t __91__RTLearnedLocationStore__fetchEntityAsDictionaryWithEntityName_propertiesToFetch_handler___block_invoke_535(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)enumerateStoredLocationsOfInterestWithOptions:(id)a3 enumerationBlock:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    char v41 = 1;
    if (v7)
    {
      if ([v7 singleVisit])
      {
        uint64_t v9 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
        [v9 setReturnsObjectsAsFaults:1];
        id v10 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:objc_msgSend(v7, "ascendingVisitEntryDate")];
        uint64_t v43 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        [v9 setSortDescriptors:v11];

        [v9 setReturnsObjectsAsFaults:1];
        id v12 = (void *)MEMORY[0x1E4F28BA0];
        id v37 = self;
        id v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v36 = [v7 dateInterval];
        id v14 = [v36 startDate];
        SEL v15 = [v13 predicateWithFormat:@"%K >= %@", @"entryDate", v14];
        v42[0] = v15;
        __int16 v16 = (void *)MEMORY[0x1E4F28F60];
        id v17 = [v7 dateInterval];
        uint64_t v18 = [v17 endDate];
        id v19 = [v16 predicateWithFormat:@"%K <= %@", @"exitDate", v18];
        v42[1] = v19;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
        SEL v21 = [v12 andPredicateWithSubpredicates:v20];
        [v9 setPredicate:v21];

        self = v37;
      }
      else
      {
        uint64_t v9 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
        [v9 setReturnsObjectsAsFaults:0];
        uint64_t v26 = (void *)MEMORY[0x1E4F28F60];
        id v27 = [v7 dateInterval];
        id v28 = [v27 startDate];
        id v29 = [v7 dateInterval];
        uint64_t v30 = [v29 endDate];
        uint64_t v31 = [v26 predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K >= %@ and $v.%K <= %@).@count > 0", @"visits", @"entryDate", v28, @"exitDate", v30];
        [v9 setPredicate:v31];
      }
      if ([v7 batchSize])
      {
        unint64_t v32 = [v7 batchSize];
        if (v32 >= 0x12C) {
          uint64_t v33 = 300;
        }
        else {
          uint64_t v33 = v32;
        }
      }
      else
      {
        uint64_t v33 = 300;
      }
      [v9 setFetchBatchSize:300];
      [v9 setFetchLimit:v33];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke;
      v38[3] = &unk_1E6B96858;
      id v39 = v7;
      id v40 = v8;
      id v34 = (void *)MEMORY[0x1E016DB00](v38);
      [(RTStore *)self enumerateType:objc_opt_class() fetchRequest:v9 enumerationBlock:v34];
    }
    else
    {
      unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F5CFE8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49[0] = @"requires non-nil options.";
      __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      uint64_t v9 = [v22 errorWithDomain:v23 code:7 userInfo:v24];

      int v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        char v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        long long v45 = v35;
        __int16 v46 = 2112;
        long long v47 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      (*((void (**)(id, void, NSObject *, char *))v8 + 2))(v8, 0, v9, &v41);
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }
}

void __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[_RTMap alloc] initWithInput:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke_2;
  v9[3] = &unk_1E6B96830;
  id v10 = *(id *)(a1 + 32);
  id v8 = [(_RTMap *)v7 withBlock:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __89__RTLearnedLocationStore_enumerateStoredLocationsOfInterestWithOptions_enumerationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dateInterval];
  id v5 = [v3 filterWithDateInterval:v4];

  return v5;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a5)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      uint64_t v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 stringWithFormat:@"error of type, %@, is not supported", v13];

      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = v14;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      id v19 = v18;
      *a5 = v19;

LABEL_8:
      SEL v21 = 0;
      goto LABEL_13;
    }
    SEL v21 = [(RTLearnedLocationStore *)self fetchRequestFromLocationOfInterestOptions:v9];
    [v21 setFetchOffset:a4];
  }
  else
  {
    unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"options");
    SEL v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v21;
}

- (id)fetchRequestFromLocationOfInterestOptions:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 wrappedVisit];
    id v6 = (void *)MEMORY[0x1E4F1C0D0];
    if (v5)
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = [v6 fetchRequestWithEntityName:v8];

      [v9 setReturnsObjectsAsFaults:1];
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:objc_msgSend(v4, "ascending")];
      v45[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      [v9 setSortDescriptors:v11];

      [v9 setReturnsObjectsAsFaults:1];
      id v12 = (void *)MEMORY[0x1E4F28F60];
      id v13 = [v4 dateInterval];
      id v14 = [v13 startDate];
      SEL v15 = [v4 dateInterval];
      uint64_t v16 = [v15 endDate];
      id v17 = [v12 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"entryDate", v14, @"entryDate", v16];

      uint64_t v18 = (void *)MEMORY[0x1E4F28F60];
      id v19 = [v4 dateInterval];
      id v20 = [v19 startDate];
      SEL v21 = [v4 dateInterval];
      unint64_t v22 = [v21 endDate];
      uint64_t v23 = [v18 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"exitDate", v20, @"exitDate", v22];

      __int16 v24 = (void *)MEMORY[0x1E4F28BA0];
      v44[0] = v17;
      v44[1] = v23;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      uint64_t v26 = [v24 orPredicateWithSubpredicates:v25];
      [v9 setPredicate:v26];
    }
    else
    {
      id v28 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v28);
      uint64_t v9 = [v6 fetchRequestWithEntityName:v29];

      [v9 setReturnsObjectsAsFaults:0];
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"placeCreationDate" ascending:[v4 ascending]];
      uint64_t v43 = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      [v9 setSortDescriptors:v31];

      unint64_t v32 = (void *)MEMORY[0x1E4F28F60];
      char v41 = [v4 dateInterval];
      uint64_t v23 = [v41 startDate];
      uint64_t v25 = [v4 dateInterval];
      uint64_t v26 = [v25 endDate];
      uint64_t v33 = [v4 dateInterval];
      id v34 = [v33 startDate];
      char v35 = [v4 dateInterval];
      uint64_t v36 = [v35 endDate];
      id v37 = [v32 predicateWithFormat:@"SUBQUERY(%K, $v, ($v.%K >= %@ and $v.%K <= %@) or ($v.%K >= %@ and $v.%K <= %@)).@count > 0", @"visits", @"entryDate", v23, @"entryDate", v26, @"exitDate", v34, @"exitDate", v36];
      [v9 setPredicate:v37];

      id v17 = v41;
    }

    if ([v4 batchSize])
    {
      unint64_t v38 = [v4 batchSize];
      if (v38 >= 0x12C) {
        uint64_t v39 = 300;
      }
      else {
        uint64_t v39 = v38;
      }
    }
    else
    {
      uint64_t v39 = 300;
    }
    [v9 setFetchBatchSize:300];
    [v9 setFetchLimit:v39];
  }
  else
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_logLocalStoreWithReason:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke;
  v13[3] = &unk_1E6B91060;
  id v14 = v7;
  SEL v16 = a2;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke_560;
  v11[3] = &unk_1E6B90C18;
  id v12 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v11];
}

void __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "start logging local store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v34 = a1;
  id v6 = +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation];
  [v6 setReturnsObjectsAsFaults:0];
  v69[0] = @"visits";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  [v6 setRelationshipKeyPathsForPrefetching:v7];

  unint64_t v38 = v6;
  uint64_t v8 = [v6 setFetchLimit:5];
  id obj = 0;
  uint64_t v40 = 0;
  char v35 = v3;
  do
  {
    context = (void *)MEMORY[0x1E016D870](v8);
    id v57 = 0;
    id v9 = [v3 executeFetchRequest:v38 error:&v57];
    id v37 = v57;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v9;
    uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v54;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = +[RTLearnedLocationOfInterest createWithManagedObject:*(void *)(*((void *)&v53 + 1) + 8 * v10)];
          id v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          uint64_t v43 = v10;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v59 = ++v40;
            __int16 v60 = 2112;
            __int16 v61 = v11;
            _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "locationOfInterest %lu, %@", buf, 0x16u);
          }

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v44 = v11;
          id v13 = [v11 visits];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v67 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            SEL v16 = 0;
            uint64_t v17 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v50 != v17) {
                  objc_enumerationMutation(v13);
                }
                id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                id v20 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  ++v16;
                  *(_DWORD *)buf = 134218242;
                  uint64_t v59 = (uint64_t)v16;
                  __int16 v60 = 2112;
                  __int16 v61 = v19;
                  _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "visit %lu, %@", buf, 0x16u);
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v67 count:16];
            }
            while (v15);
          }

          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          SEL v21 = [v44 transitions];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v66 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            __int16 v24 = 0;
            uint64_t v25 = *(void *)v46;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v46 != v25) {
                  objc_enumerationMutation(v21);
                }
                id v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
                id v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  ++v24;
                  *(_DWORD *)buf = 134218242;
                  uint64_t v59 = (uint64_t)v24;
                  __int16 v60 = 2112;
                  __int16 v61 = v27;
                  _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEFAULT, "transition %lu, %@", buf, 0x16u);
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v66 count:16];
            }
            while (v23);
          }

          uint64_t v10 = v43 + 1;
        }
        while (v43 + 1 != v42);
        uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
      }
      while (v42);
    }

    [v38 setFetchOffset:[v38 fetchOffset] + [obj count]];
    id v3 = v35;
    [v35 reset];
    uint64_t v8 = [obj count];
  }
  while (v8 && !v37);
  if (*(void *)(v34 + 32))
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(v34 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v30;
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "end logging local store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = NSStringFromSelector(*(SEL *)(v34 + 48));
    *(_DWORD *)buf = 138413058;
    uint64_t v59 = (uint64_t)v33;
    __int16 v60 = 2112;
    __int16 v61 = v38;
    __int16 v62 = 2048;
    uint64_t v63 = v40;
    __int16 v64 = 2112;
    id v65 = v37;
    _os_log_debug_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

    id v3 = v35;
  }

  uint64_t v32 = *(void *)(v34 + 40);
  if (v32) {
    (*(void (**)(uint64_t, id))(v32 + 16))(v32, v37);
  }
}

uint64_t __59__RTLearnedLocationStore__logLocalStoreWithReason_handler___block_invoke_560(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)logLocalStoreWithReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationStore_logLocalStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__RTLearnedLocationStore_logLocalStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logLocalStoreWithReason:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_logCloudStoreWithReason:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke;
  v13[3] = &unk_1E6B91060;
  id v14 = v7;
  SEL v16 = a2;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke_564;
  v11[3] = &unk_1E6B90C18;
  id v12 = v15;
  id v9 = v15;
  id v10 = v7;
  [(RTStore *)self _performBlock:v13 contextType:1 errorHandler:v11];
}

void __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  v130[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v122 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "start logging cloud store with reason, %@", buf, 0xCu);
    }
  }
  uint64_t v85 = a1;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v7 = (char *)objc_claimAutoreleasedReturnValue();
    id v8 = +[RTDeviceMO fetchRequest];
    uint64_t v9 = [v3 countForFetchRequest:v8 error:0];
    id v10 = [v3 currentDevice];
    uint64_t v11 = +[RTDevice createWithManagedObject:v10];
    *(_DWORD *)buf = 138412802;
    v122 = v7;
    __int16 v123 = 2048;
    uint64_t v124 = v9;
    __int16 v125 = 2112;
    v126 = v11;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%@, %lu devices, currentDevice, %@", buf, 0x20u);
  }
  id v12 = +[RTDeviceMO fetchRequest];
  [v12 setReturnsObjectsAsFaults:0];
  [v12 setFetchLimit:5];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"ckRecordID" ascending:1];
  v130[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:1];
  v91 = v12;
  [v12 setSortDescriptors:v14];

  id v15 = 0;
  id obj = 0;
  v92 = v3;
  do
  {
    context = (void *)MEMORY[0x1E016D870]();
    id v116 = 0;
    SEL v16 = [v3 executeFetchRequest:v12 error:&v116];
    id v90 = v116;

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v113 != v19) {
            objc_enumerationMutation(obj);
          }
          SEL v21 = *(void **)(*((void *)&v112 + 1) + 8 * i);
          uint64_t v22 = +[RTDevice createWithManagedObject:v21];
          uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            ++v15;
            __int16 v24 = [v21 places];
            uint64_t v25 = [v24 count];
            uint64_t v26 = [v21 visits];
            uint64_t v27 = [v26 count];
            *(_DWORD *)buf = 134218754;
            v122 = v15;
            __int16 v123 = 2112;
            uint64_t v124 = (uint64_t)v22;
            __int16 v125 = 2048;
            v126 = (char *)v25;
            __int16 v127 = 2048;
            uint64_t v128 = v27;
            _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "device %lu, %@, placesCount, %lu, visitsCount, %lu", buf, 0x2Au);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
      }
      while (v18);
    }

    [v12 setFetchOffset:[v12 fetchOffset] + [obj count]];
    id v3 = v92;
    [v92 reset];
  }
  while ([obj count] && !v90);
  id v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    id v82 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v82;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v12;
    __int16 v125 = 2048;
    v126 = v15;
    __int16 v127 = 2112;
    uint64_t v128 = (uint64_t)v90;
    _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = +[RTLearnedPlaceMO fetchRequest];
    uint64_t v32 = [v92 countForFetchRequest:v31 error:0];
    *(_DWORD *)buf = 138412546;
    v122 = v30;
    __int16 v123 = 2048;
    uint64_t v124 = v32;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEFAULT, "%@, %lu places", buf, 0x16u);
  }
  uint64_t v33 = +[RTLearnedPlaceMO fetchRequest];
  [v33 setReturnsObjectsAsFaults:0];
  [v33 setFetchLimit:5];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"creationDate" ascending:1];
  v120 = v34;
  char v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  [v33 setSortDescriptors:v35];

  contexta = 0;
  id v97 = 0;
  id v87 = v33;
  do
  {
    id v88 = (void *)MEMORY[0x1E016D870]();
    id v111 = 0;
    uint64_t v36 = [v3 executeFetchRequest:v33 error:&v111];
    id v93 = v111;

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v97 = v36;
    uint64_t v37 = [v97 countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v108;
      uint64_t v95 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v108 != v39) {
            objc_enumerationMutation(v97);
          }
          uint64_t v41 = *(void **)(*((void *)&v107 + 1) + 8 * j);
          uint64_t v42 = [v41 device];
          uint64_t v43 = +[RTDevice createWithManagedObject:v42];

          id v44 = +[RTLearnedPlace createWithManagedObject:v41];
          long long v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            long long v46 = [v41 visits];
            uint64_t v47 = [v46 count];
            long long v48 = [v43 identifier];
            *(_DWORD *)buf = 134218754;
            v122 = ++contexta;
            __int16 v123 = 2112;
            uint64_t v124 = (uint64_t)v44;
            __int16 v125 = 2048;
            v126 = (char *)v47;
            __int16 v127 = 2112;
            uint64_t v128 = (uint64_t)v48;
            _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_DEFAULT, "place, %lu, %@, visits, %lu, deviceIdentifier, %@", buf, 0x2Au);

            uint64_t v39 = v95;
          }
        }
        uint64_t v38 = [v97 countByEnumeratingWithState:&v107 objects:v119 count:16];
      }
      while (v38);
    }

    uint64_t v33 = v87;
    [v87 setFetchOffset:[v87 fetchOffset] + [v97 count]];
    id v3 = v92;
    [v92 reset];
    long long v49 = v93;
  }
  while ([v97 count] && !v93);
  long long v50 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    __int16 v83 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v83;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v87;
    __int16 v125 = 2048;
    v126 = contexta;
    __int16 v127 = 2112;
    uint64_t v128 = (uint64_t)v93;
    _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  long long v51 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    long long v52 = (char *)objc_claimAutoreleasedReturnValue();
    long long v53 = +[RTLearnedVisitMO fetchRequest];
    uint64_t v54 = [v92 countForFetchRequest:v53 error:0];
    *(_DWORD *)buf = 138412546;
    v122 = v52;
    __int16 v123 = 2048;
    uint64_t v124 = v54;
    _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_DEFAULT, "%@, %lu visits", buf, 0x16u);
  }
  long long v55 = +[RTLearnedVisitMO fetchRequest];
  [v55 setReturnsObjectsAsFaults:0];
  [v55 setFetchLimit:5];
  long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entryDate" ascending:1];
  v118 = v56;
  id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
  [v55 setSortDescriptors:v57];

  id v58 = 0;
  contextb = 0;
  uint64_t v86 = v55;
  do
  {
    uint64_t v89 = (void *)MEMORY[0x1E016D870]();
    id v106 = v49;
    uint64_t v59 = [v3 executeFetchRequest:v55 error:&v106];
    id v94 = v106;

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v60 = v59;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v102 objects:v117 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v103;
      uint64_t v96 = *(void *)v103;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v103 != v63) {
            objc_enumerationMutation(v60);
          }
          id v65 = *(void **)(*((void *)&v102 + 1) + 8 * k);
          long long v66 = [v65 device];
          long long v67 = +[RTDevice createWithManagedObject:v66];

          long long v68 = +[RTLearnedVisit createWithManagedObject:v65];
          long long v69 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            long long v70 = [v65 place];
            long long v71 = [v70 identifier];
            [v67 identifier];
            v73 = id v72 = v60;
            *(_DWORD *)buf = 134218754;
            v122 = ++contextb;
            __int16 v123 = 2112;
            uint64_t v124 = (uint64_t)v68;
            __int16 v125 = 2112;
            v126 = v71;
            __int16 v127 = 2112;
            uint64_t v128 = (uint64_t)v73;
            _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_DEFAULT, "visit, %lu, %@, placeIdentifier, %@, deviceIdentifier, %@", buf, 0x2Au);

            id v60 = v72;
            uint64_t v63 = v96;
          }
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v102 objects:v117 count:16];
      }
      while (v62);
    }

    uint64_t v74 = [v60 count];
    id v58 = v60;
    long long v55 = v86;
    [v86 setFetchOffset:[v86 fetchOffset] + v74];
    id v3 = v92;
    [v92 reset];
    long long v49 = v94;
  }
  while ([v58 count]);
  __int16 v75 = v58;
  if (*(void *)(v85 + 32))
  {
    id v76 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v77 = *(char **)(v85 + 32);
      *(_DWORD *)buf = 138412290;
      v122 = v77;
      _os_log_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_DEFAULT, "end logging cloud store with reason, %@", buf, 0xCu);
    }
  }
  id v78 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v85 + 48));
    id v84 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v122 = v84;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v86;
    __int16 v125 = 2048;
    v126 = contextb;
    __int16 v127 = 2112;
    uint64_t v128 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  uint64_t v79 = *(void *)(v85 + 40);
  if (v79)
  {
    uint64_t v80 = _RTSafeArray();
    uint64_t v81 = _RTMultiErrorCreate();
    (*(void (**)(uint64_t, void *))(v79 + 16))(v79, v81);
  }
}

uint64_t __59__RTLearnedLocationStore__logCloudStoreWithReason_handler___block_invoke_564(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)logCloudStoreWithReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLearnedLocationStore_logCloudStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__RTLearnedLocationStore_logCloudStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logCloudStoreWithReason:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_associatePlacesToVisits:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__RTLearnedLocationStore__associatePlacesToVisits_handler___block_invoke;
  v12[3] = &unk_1E6B91060;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v9 = v8;
  id v10 = v7;
  uint64_t v11 = (void *)MEMORY[0x1E016DB00](v12);
  [(RTStore *)self _performBlock:v11 contextType:2 errorHandler:v9];
}

void __59__RTLearnedLocationStore__associatePlacesToVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[RTLearnedPlaceMO fetchRequest];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 32) allKeys];
  id v7 = [v5 predicateWithFormat:@"%K IN %@", @"identifier", v6];
  [v4 setPredicate:v7];

  id v39 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v39];
  id v9 = v39;
  if (v9 || ![v8 count])
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
  }
  else
  {
    uint64_t v30 = v8;
    uint64_t v31 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          SEL v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          SEL v16 = +[RTLearnedVisitMO fetchRequest];
          uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = [v15 identifier];
          id v20 = [v18 objectForKeyedSubscript:v19];
          SEL v21 = [v17 predicateWithFormat:@"%K IN %@", @"identifier", v20];
          [v16 setPredicate:v21];

          id v34 = 0;
          uint64_t v22 = [v3 executeFetchRequest:v16 error:&v34];
          id v23 = v34;
          if (v23)
          {
            id v9 = v23;
            uint64_t v28 = *(void *)(a1 + 40);
            id v4 = v31;
            if (v28) {
              (*(void (**)(uint64_t, id))(v28 + 16))(v28, v9);
            }

            goto LABEL_24;
          }
          if ([v22 count])
          {
            __int16 v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
            [v15 addVisits:v24];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v33 = 0;
    char v25 = [v3 save:&v33];
    id v9 = v33;
    if ((v25 & 1) == 0)
    {
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v29 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412546;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "%@, associatePlacesToVisits error, %@", buf, 0x16u);
      }
    }
    uint64_t v27 = *(void *)(a1 + 40);
    id v4 = v31;
    if (v27) {
      (*(void (**)(uint64_t, id))(v27 + 16))(v27, v9);
    }
LABEL_24:
    id v8 = v30;
  }
}

- (id)predicateForObjectsFromCurrentDevice
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == $RT_CURRENT_DEVICE", @"device"];
}

- (id)predicateForObjectsNotFromCurrentDevice
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != $RT_CURRENT_DEVICE", @"device"];
}

- (id)predicateForVisitsFromEntryDate:(id)a3 exitDate:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@ and %K < %@", @"entryDate", a3, @"exitDate", a4];
}

- (id)predicateForCompleteVisits
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil and %K != nil", @"entryDate", @"exitDate"];
}

- (id)predicateForVisitsWithinDistance:(double)a3 location:(id)a4
{
  void v21[4] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  [v4 latitude];
  [v4 longitude];

  RTCommonCalculateBoundingBox();
  uint64_t v19 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v20 = [NSNumber numberWithDouble:0.0];
  id v6 = [v5 predicateWithFormat:@"%@ <= %K", v20, @"locationLongitude"];
  v21[0] = v6;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = [NSNumber numberWithDouble:0.0];
  id v9 = [v7 predicateWithFormat:@"%K <= %@", @"locationLongitude", v8];
  v21[1] = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = [NSNumber numberWithDouble:0.0];
  uint64_t v12 = [v10 predicateWithFormat:@"%@ <= %K", v11, @"locationLatitude"];
  void v21[2] = v12;
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  id v14 = [NSNumber numberWithDouble:0.0];
  SEL v15 = [v13 predicateWithFormat:@"%K <= %@", @"locationLatitude", v14];
  v21[3] = v15;
  SEL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  uint64_t v17 = [v19 andPredicateWithSubpredicates:v16];

  return v17;
}

- (RTPersistenceExpirationEnforcer)expirationEnforcer
{
  return self->_expirationEnforcer;
}

- (void)setExpirationEnforcer:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTPersistenceMirroringManager)mirroringManager
{
  return self->_mirroringManager;
}

- (void)setMirroringManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_expirationEnforcer, 0);
}

@end