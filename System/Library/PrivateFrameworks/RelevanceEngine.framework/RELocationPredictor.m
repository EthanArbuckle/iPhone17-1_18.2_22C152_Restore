@interface RELocationPredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (NSDictionary)routineDataByEngine;
- (id)_init;
- (id)_routineDataForEngine:(id)a3;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (id)locationForEngine:(id)a3 userLocation:(int64_t)a4;
- (id)predictedLocationIdentifierForEngine:(id)a3;
- (id)predictedLocationNameForEngine:(id)a3;
- (void)_setOverrideLocation:(int64_t)a3 forEngine:(id)a4;
- (void)addRelevanceEngine:(id)a3;
- (void)removeRelevanceEngine:(id)a3;
- (void)update;
@end

@implementation RELocationPredictor

+ (id)supportedFeatures
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature locationOfInterestFeature];
  v4 = +[REFeature knownLocationOfInterestFeature];
  v9[1] = v4;
  v5 = +[REFeature travelingFeature];
  v9[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [(REFeatureSet *)v2 initWithFeatures:v6];

  return v7;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)RELocationPredictor;
  v2 = [(REPredictor *)&v14 _init];
  if (v2)
  {
    if (CoreRoutineLibraryCore())
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2050000000;
      v3 = (void *)getRTRoutineManagerClass_softClass;
      uint64_t v19 = getRTRoutineManagerClass_softClass;
      if (!getRTRoutineManagerClass_softClass)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __getRTRoutineManagerClass_block_invoke;
        v15[3] = &unk_2644BC768;
        v15[4] = &v16;
        __getRTRoutineManagerClass_block_invoke((uint64_t)v15);
        v3 = (void *)v17[3];
      }
      id v4 = v3;
      _Block_object_dispose(&v16, 8);
      uint64_t v5 = [v4 defaultManager];
      v6 = (void *)v2[8];
      v2[8] = v5;
    }
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    v8 = (void *)v2[10];
    v2[10] = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:512 capacity:2];
    v10 = (void *)v2[9];
    v2[9] = v9;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)v2[11];
    v2[11] = v11;
  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(NSLock *)self->_routineDataLock lock];
  objc_super v14 = [(NSMapTable *)self->_routineData objectForKey:v12];
  [(NSLock *)self->_routineDataLock unlock];
  overrideRoutineType = self->_overrideRoutineType;
  uint64_t v16 = [v12 name];
  v17 = [(NSMutableDictionary *)overrideRoutineType objectForKeyedSubscript:v16];

  uint64_t v18 = +[REFeature travelingFeature];
  int v19 = [v10 isEqual:v18];

  if (v19)
  {
    if (v14) {
      uint64_t v20 = [v14 mode];
    }
    else {
      uint64_t v20 = 0;
    }
    goto LABEL_11;
  }
  v21 = +[REFeature locationOfInterestFeature];
  int v22 = [v10 isEqual:v21];

  if (v22)
  {
    if (!v17)
    {
      v28 = [v14 locationsOfInterest];
      [v28 firstObject];
      id v29 = v13;
      v31 = id v30 = v11;

      v32 = [v31 identifier];
      uint64_t v33 = [v32 UUIDString];
      v34 = (void *)v33;
      if (v33) {
        v35 = (__CFString *)v33;
      }
      else {
        v35 = &stru_26CFA57D0;
      }
      v26 = +[REFeatureValue featureValueWithString:v35];

      id v11 = v30;
      id v13 = v29;
      v17 = 0;
      goto LABEL_13;
    }
    uint64_t v23 = +[REFeatureValue featureValueWithString:&stru_26CFA57D0];
    goto LABEL_12;
  }
  v24 = +[REFeature knownLocationOfInterestFeature];
  int v25 = [v10 isEqual:v24];

  if (v25)
  {
    if (v17)
    {
      uint64_t v20 = [v17 integerValue];
LABEL_11:
      uint64_t v23 = +[REFeatureValue featureValueWithInt64:v20];
LABEL_12:
      v26 = (void *)v23;
      goto LABEL_13;
    }
    id v49 = v11;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v36 = [v14 locationsOfInterest];
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x263EFFA68];
    if (v36) {
      v38 = (void *)v36;
    }
    id v39 = v38;

    uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      id v48 = v13;
      v42 = 0;
      uint64_t v43 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v51 != v43) {
            objc_enumerationMutation(v39);
          }
          v45 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v45 type] != -1)
          {
            id v46 = v45;

            v42 = v46;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v41);

      id v13 = v48;
      if (v42) {
        uint64_t v47 = [v42 type];
      }
      else {
        uint64_t v47 = -1;
      }
      id v11 = v49;
      v17 = 0;
    }
    else
    {

      v42 = 0;
      uint64_t v47 = -1;
    }
    v26 = +[REFeatureValue featureValueWithInt64:v47];
  }
  else
  {
    v26 = 0;
  }
LABEL_13:

  return v26;
}

- (void)update
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  v3 = dispatch_group_create();
  [(REPredictor *)self beginFetchingData];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v4 = [(REPredictor *)self engines];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v5)
  {
    uint64_t v22 = *(void *)v44;
    id obj = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v43 + 1) + 8 * v6);
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x2020000000;
        v42[3] = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__29;
        v40[4] = __Block_byref_object_dispose__29;
        id v41 = 0;
        v8 = dispatch_group_create();
        v24 = v7;
        uint64_t v9 = [v7 locationManager];
        id v10 = [v9 currentLocation];

        if (v10)
        {
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __29__RELocationPredictor_update__block_invoke;
          v38[3] = &unk_2644C0788;
          id v11 = v10;
          id v39 = v11;
          id v12 = (void *)MEMORY[0x223C31700](v38);
          uint64_t v23 = v10;
          uint64_t v13 = v5;
          objc_super v14 = v3;
          dispatch_group_enter(v8);
          manager = self->_manager;
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __29__RELocationPredictor_update__block_invoke_2;
          v35[3] = &unk_2644C07B0;
          v37 = v42;
          uint64_t v16 = v8;
          uint64_t v36 = v16;
          [(RTRoutineManager *)manager fetchRoutineModeFromLocation:v11 withHandler:v35];
          dispatch_group_enter(v16);
          v17 = self->_manager;
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __29__RELocationPredictor_update__block_invoke_49;
          v31[3] = &unk_2644C07D8;
          v34 = v40;
          id v18 = v12;
          id v33 = v18;
          v32 = v16;
          [(RTRoutineManager *)v17 fetchLocationsOfInterestWithinDistance:v11 ofLocation:v31 withHandler:1000.0];

          v3 = v14;
          uint64_t v5 = v13;
          id v10 = v23;
        }
        dispatch_group_enter(v3);
        int v19 = [(REPredictor *)self queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __29__RELocationPredictor_update__block_invoke_2_54;
        block[3] = &unk_2644C0800;
        v28 = v42;
        id v29 = v40;
        block[4] = self;
        block[5] = v24;
        id v30 = v47;
        v27 = v3;
        dispatch_group_notify(v8, v19, block);

        _Block_object_dispose(v40, 8);
        _Block_object_dispose(v42, 8);
        ++v6;
      }
      while (v5 != v6);
      id v4 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v5);
  }

  uint64_t v20 = [(REPredictor *)self queue];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __29__RELocationPredictor_update__block_invoke_3;
  v25[3] = &unk_2644BD960;
  v25[4] = self;
  v25[5] = v47;
  dispatch_group_notify(v3, v20, v25);

  _Block_object_dispose(v47, 8);
}

double __29__RELocationPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F00A50];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 location];
  [v6 latitude];
  double v8 = v7;
  uint64_t v9 = [v4 location];

  [v9 longitude];
  id v11 = (void *)[v5 initWithLatitude:v8 longitude:v10];

  [*(id *)(a1 + 32) distanceFromLocation:v11];
  double v13 = v12;

  return v13;
}

void __29__RELocationPredictor_update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = RELogForDomain(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __29__RELocationPredictor_update__block_invoke_2_cold_1((uint64_t)v5, v6);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __29__RELocationPredictor_update__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = RELogForDomain(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __29__RELocationPredictor_update__block_invoke_49_cold_1((uint64_t)v6, v7);
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__RELocationPredictor_update__block_invoke_50;
  v11[3] = &unk_2644BD700;
  id v12 = *(id *)(a1 + 40);
  uint64_t v8 = [v5 sortedArrayUsingComparator:v11];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __29__RELocationPredictor_update__block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  id v8 = a3;
  v7(v6, a2);
  uint64_t v9 = objc_msgSend(v5, "numberWithDouble:");
  double v10 = NSNumber;
  double v11 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();

  id v12 = [v10 numberWithDouble:v11];
  uint64_t v13 = [v9 compare:v12];

  return v13;
}

void __29__RELocationPredictor_update__block_invoke_2_54(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setMode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v5 setLocationsOfInterest:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 88) lock];
  if (v5 && *(void *)(a1 + 40))
  {
    v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKey:");
    int v3 = [v2 isEqual:v5] ^ 1;
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v4 + 24)) {
      LOBYTE(v3) = 1;
    }
    *(unsigned char *)(v4 + 24) = v3;
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 88) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __29__RELocationPredictor_update__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) finishFetchingData];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 updateObservers];
  }
  return result;
}

- (void)addRelevanceEngine:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RELocationPredictor;
  id v4 = a3;
  [(REPredictor *)&v6 addRelevanceEngine:v4];
  id v5 = objc_msgSend(v4, "locationManager", v6.receiver, v6.super_class);

  [v5 addObserver:self];
  [(REPredictor *)self invalidate];
}

- (void)removeRelevanceEngine:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RELocationPredictor;
  [(REPredictor *)&v13 removeRelevanceEngine:v4];
  id v5 = [v4 name];
  if (v5)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __45__RELocationPredictor_removeRelevanceEngine___block_invoke;
    double v10 = &unk_2644BC688;
    id v11 = v4;
    id v12 = self;
    [(REPredictor *)self onQueue:&v7];
  }
  objc_super v6 = objc_msgSend(v4, "locationManager", v7, v8, v9, v10);
  [v6 removeObserver:self];
}

uint64_t __45__RELocationPredictor_removeRelevanceEngine___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    [*(id *)(*(void *)(result + 40) + 88) lock];
    [*(id *)(*(void *)(v1 + 40) + 72) removeObjectForKey:*(void *)(v1 + 32)];
    v2 = *(void **)(*(void *)(v1 + 40) + 88);
    return [v2 lock];
  }
  return result;
}

- (id)locationForEngine:(id)a3 userLocation:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(NSLock *)self->_routineDataLock lock];
  uint64_t v7 = [(NSMapTable *)self->_routineData objectForKey:v6];
  [(NSLock *)self->_routineDataLock unlock];
  long long v23 = 0u;
  long long v24 = 0u;
  if ((unint64_t)(a4 + 1) >= 5) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = a4;
  }
  *((void *)&v21 + 1) = 0;
  long long v22 = 0uLL;
  uint64_t v9 = objc_msgSend(v7, "locationsOfInterest", 0);
  double v10 = (void *)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_super v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 type] == v8)
        {
          id v14 = objc_alloc(MEMORY[0x263F00A50]);
          v15 = [v13 location];
          [v15 latitude];
          double v17 = v16;
          id v18 = [v13 location];
          [v18 longitude];
          double v10 = (void *)[v14 initWithLatitude:v17 longitude:v19];

          goto LABEL_14;
        }
      }
      double v10 = (void *)[v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v10;
}

- (id)_routineDataForEngine:(id)a3
{
  routineDataLock = self->_routineDataLock;
  id v5 = a3;
  [(NSLock *)routineDataLock lock];
  id v6 = [(NSMapTable *)self->_routineData objectForKey:v5];

  [(NSLock *)self->_routineDataLock unlock];
  return v6;
}

- (id)predictedLocationIdentifierForEngine:(id)a3
{
  routineDataLock = self->_routineDataLock;
  id v5 = a3;
  [(NSLock *)routineDataLock lock];
  id v6 = [(NSMapTable *)self->_routineData objectForKey:v5];

  [(NSLock *)self->_routineDataLock unlock];
  uint64_t v7 = [v6 locationsOfInterest];
  int64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 identifier];
  double v10 = [v9 UUIDString];

  return v10;
}

- (id)predictedLocationNameForEngine:(id)a3
{
  routineDataLock = self->_routineDataLock;
  id v5 = a3;
  [(NSLock *)routineDataLock lock];
  id v6 = [(NSMapTable *)self->_routineData objectForKey:v5];

  [(NSLock *)self->_routineDataLock unlock];
  uint64_t v7 = [v6 locationsOfInterest];
  int64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 preferredName];

  return v9;
}

- (void)_setOverrideLocation:(int64_t)a3 forEngine:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(REPredictor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RELocationPredictor__setOverrideLocation_forEngine___block_invoke;
  block[3] = &unk_2644BF9C0;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __54__RELocationPredictor__setOverrideLocation_forEngine___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == -1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  }
  id v3 = (id)v2;
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateObservers];
}

- (NSDictionary)routineDataByEngine
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_routineDataLock lock];
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMapTable count](self->_routineData, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NSMapTable *)self->_routineData keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_routineData objectForKey:v9];
        int64_t v11 = [v9 name];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSLock *)self->_routineDataLock unlock];
  id v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineDataLock, 0);
  objc_storeStrong((id *)&self->_overrideRoutineType, 0);
  objc_storeStrong((id *)&self->_routineData, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __29__RELocationPredictor_update__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Encountered CR error getting routine mode: %@", (uint8_t *)&v2, 0xCu);
}

void __29__RELocationPredictor_update__block_invoke_49_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Encountered CR error getting LOIs: %@", (uint8_t *)&v2, 0xCu);
}

@end