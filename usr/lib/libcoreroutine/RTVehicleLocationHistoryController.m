@interface RTVehicleLocationHistoryController
+ (int64_t)periodicPurgePolicy;
- (BOOL)_deleteVehicleEventsBeforeDate:(id)a3;
- (BOOL)_evaluateUsualLocationWithVehicleEvent:(id)a3;
- (BOOL)_persistVehicleEventToHistory:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (OS_dispatch_queue)queue;
- (RTVehicleLocationHistoryController)initWithQueue:(id)a3 managedObjectContext:(id)a4;
- (id)_getAllVehicleEventsFromHistory;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setManagedObjectContext:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation RTVehicleLocationHistoryController

- (RTVehicleLocationHistoryController)initWithQueue:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTVehicleLocationHistoryController;
  v9 = [(RTVehicleLocationHistoryController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
  }

  return v10;
}

- (BOOL)_evaluateUsualLocationWithVehicleEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 nearbyLocationOfInterest];

  if (v5)
  {
    v6 = [(RTVehicleLocationHistoryController *)self _getAllVehicleEventsFromHistory];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__22;
    v32 = __Block_byref_object_dispose__22;
    id v33 = 0;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __77__RTVehicleLocationHistoryController__evaluateUsualLocationWithVehicleEvent___block_invoke;
    v25 = &unk_1E6B929C8;
    id v7 = v4;
    id v26 = v7;
    v27 = &v28;
    [v6 enumerateObjectsUsingBlock:&v22];
    if (v29[5])
    {
      id v8 = [v7 location:v22, v23, v24, v25];
      [v8 latitude];
      v9 = [v7 location];
      [v9 longitude];
      v10 = [(id)v29[5] location];
      [v10 latitude];
      v11 = [(id)v29[5] location];
      [v11 longitude];
      RTCommonCalculateDistance();
      double v13 = v12;

      v14 = [v7 location];
      [v14 horizontalUncertainty];
      double v16 = v15;
      v17 = [(id)v29[5] location];
      [v17 horizontalUncertainty];
      double v19 = v16 + 20.0 + v18;

      double v20 = 130.0;
      if (v19 <= 130.0) {
        double v20 = v19;
      }
      LOBYTE(v5) = v13 < v20;
    }
    else
    {
      LOBYTE(v5) = 0;
    }

    _Block_object_dispose(&v28, 8);
  }

  return (char)v5;
}

void __77__RTVehicleLocationHistoryController__evaluateUsualLocationWithVehicleEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = [*(id *)(a1 + 32) nearbyLocationOfInterest];
  id v8 = [v7 location];
  [v8 latitude];
  v9 = [*(id *)(a1 + 32) nearbyLocationOfInterest];
  v10 = [v9 location];
  [v10 longitude];
  v11 = [v15 location];
  [v11 latitude];
  double v12 = [v15 location];
  [v12 longitude];
  RTCommonCalculateDistance();
  double v14 = v13;

  if (v14 < 250.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_persistVehicleEventToHistory:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 nearbyLocationOfInterest];

  if (!v5)
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "vehicle event is not close to any LOIs, not persisting to history.", v18, 2u);
    }
    goto LABEL_11;
  }
  v6 = [(RTVehicleLocationHistoryController *)self managedObjectContext];

  if (!v6)
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "managedObjectContext is nil, not persisting vehicle event to history.", v18, 2u);
    }
LABEL_11:

    BOOL v9 = 0;
    goto LABEL_15;
  }
  *(void *)double v18 = 0;
  double v19 = v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__22;
  uint64_t v22 = __Block_byref_object_dispose__22;
  id v23 = 0;
  id v7 = [(RTVehicleLocationHistoryController *)self managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__RTVehicleLocationHistoryController__persistVehicleEventToHistory___block_invoke;
  v14[3] = &unk_1E6B91128;
  id v15 = v4;
  double v16 = self;
  v17 = v18;
  [v7 performBlockAndWait:v14];

  uint64_t v8 = *((void *)v19 + 5);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [*((id *)v19 + 5) description];
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "Error persisting the vehicle event to history, %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "Persisted a vehicle event to history.", buf, 2u);
    }
  }

  _Block_object_dispose(v18, 8);
LABEL_15:

  return v9;
}

void __68__RTVehicleLocationHistoryController__persistVehicleEventToHistory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[RTVehicleEventHistoryMO managedObjectWithVehicleEvent:v2 inManagedObjectContext:v3];

  v5 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  [v5 save:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

- (id)_getAllVehicleEventsFromHistory
{
  v3 = [(RTVehicleLocationHistoryController *)self managedObjectContext];

  if (v3)
  {
    *(void *)buf = 0;
    double v16 = buf;
    uint64_t v17 = 0x3032000000;
    double v18 = __Block_byref_object_copy__22;
    double v19 = __Block_byref_object_dispose__22;
    id v20 = 0;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    double v12 = __Block_byref_object_copy__22;
    double v13 = __Block_byref_object_dispose__22;
    id v14 = 0;
    id v4 = [(RTVehicleLocationHistoryController *)self managedObjectContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke;
    v8[3] = &unk_1E6B92A18;
    v8[4] = self;
    v8[5] = buf;
    v8[6] = &v9;
    [v4 performBlockAndWait:v8];

    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "managedObjectContext is nil, not fetching from history.", buf, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

void __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v20[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  id v5 = +[NSManagedObject entityName];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v4 fetchAllWithEntityName:v5 predicate:0 sortDescriptors:v3 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Retrieved %lu vehicle events from history, error, %@.", buf, 0x16u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    double v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke_21;
    v14[3] = &unk_1E6B929F0;
    void v14[4] = *(void *)(a1 + 48);
    [v7 enumerateObjectsUsingBlock:v14];
  }
}

void __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke_21(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 locLatitude];
  [v6 doubleValue];
  double v8 = v7;
  uint64_t v9 = [v4 locLongitude];
  [v9 doubleValue];
  double v11 = v10;
  uint64_t v12 = [v4 locUncertainty];
  [v12 doubleValue];
  double v14 = v13;
  id v15 = [v4 locDate];
  id v23 = (id)[v5 initWithLatitude:v15 longitude:v8 horizontalUncertainty:v11 date:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F5CFC0]);
  uint64_t v17 = [v4 date];
  id v18 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v19 = [v4 identifier];

  id v20 = (void *)[v18 initWithUUIDString:v19];
  LOBYTE(v22) = 1;
  v21 = (void *)[v16 initWithDate:v17 location:v23 vehicleIdentifier:0 userSetLocation:0 notes:0 identifier:v20 photo:0 mapItem:0 confirmed:v22];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v21];
}

- (BOOL)_deleteVehicleEventsBeforeDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(RTVehicleLocationHistoryController *)self managedObjectContext];

  if (v5)
  {
    *(void *)uint64_t v17 = 0;
    id v18 = v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__22;
    v21 = __Block_byref_object_dispose__22;
    id v22 = 0;
    uint64_t v6 = [(RTVehicleLocationHistoryController *)self managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__RTVehicleLocationHistoryController__deleteVehicleEventsBeforeDate___block_invoke;
    v13[3] = &unk_1E6B91128;
    id v14 = v4;
    id v15 = self;
    id v16 = v17;
    [v6 performBlockAndWait:v13];

    uint64_t v7 = *((void *)v18 + 5);
    BOOL v8 = v7 == 0;
    if (v7)
    {
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = [*((id *)v18 + 5) description];
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Error deleting history parked event, %@", buf, 0xCu);
      }
    }

    _Block_object_dispose(v17, 8);
  }
  else
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "No managed object context, not deleting.", v17, 2u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

void __69__RTVehicleLocationHistoryController__deleteVehicleEventsBeforeDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(date <= %@)", *(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[NSManagedObject entityName];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  [v3 deleteAllWithEntityName:v4 predicate:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 40) managedObjectContext];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(id *)(v7 + 40);
    [v6 save:&v8];
    objc_storeStrong((id *)(v7 + 40), v8);
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
  double v10 = [(RTVehicleLocationHistoryController *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__RTVehicleLocationHistoryController_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __82__RTVehicleLocationHistoryController_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) _deleteVehicleEventsBeforeDate:v2];
  }
  else
  {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end