@interface TAVehicleCategoryLogic
+ (id)accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5;
+ (id)accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5;
+ (id)extractPrivateVehicleHintsFromTAStore:(id)a3 since:(id)a4 to:(id)a5;
@end

@implementation TAVehicleCategoryLogic

+ (id)accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v8
    && v9
    && ([v8 earlierDate:v9],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) != 0))
  {
    v40 = v10;
    v13 = [MEMORY[0x263F08798] createIntervalSafelyWithStartDate:v8 endDate:v10];
    v14 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [v13 startDate];
      v17 = [v13 endDate];
      *(_DWORD *)buf = 138478083;
      v50 = v16;
      __int16 v51 = 2113;
      v52 = v17;
      _os_log_impl(&dword_22345C000, v15, OS_LOG_TYPE_DEFAULT, "#TAVehicleCategoryLogic Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);
    }
    id v41 = v8;
    id v42 = v7;
    v18 = [v7 eventBuffer];
    v19 = [v18 getAllTAEventsOf:objc_opt_class()];

    id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = [TAVehicleCategory alloc];
    v21 = [v13 startDate];
    v22 = [(TAVehicleCategory *)v20 initWithVehicleCategoryType:0 andDate:v21];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v23 = v19;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v29 = [v28 getDate];
          v30 = [v13 startDate];
          uint64_t v31 = [v29 compare:v30];

          if (v31 == -1)
          {
            v36 = [TAVehicleCategory alloc];
            unint64_t v37 = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromVehicleStateNotification:v28];
            v35 = [v13 startDate];
            uint64_t v38 = [(TAVehicleCategory *)v36 initWithVehicleCategoryType:v37 andDate:v35];

            v22 = (TAVehicleCategory *)v38;
          }
          else
          {
            v32 = [v28 getDate];
            v33 = [v13 endDate];
            uint64_t v34 = [v32 compare:v33];

            if (v34 == 1) {
              continue;
            }
            v35 = [[TAVehicleCategory alloc] initWithTAVehicularStateNotification:v28];
            [v43 addObject:v35];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v25);
    }

    [v43 insertObject:v22 atIndex:0];
    id v8 = v41;
    id v7 = v42;
    v10 = v40;
  }
  else
  {
    id v43 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }

  return v43;
}

+ (id)accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 earlierDate:v9];
  char v11 = [v10 isEqual:v8];

  if (v11)
  {
    id v39 = v9;
    char v12 = [MEMORY[0x263F08798] createIntervalSafelyWithStartDate:v8 endDate:v9];
    v13 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [v12 startDate];
      v16 = [v12 endDate];
      *(_DWORD *)buf = 138478083;
      v49 = v15;
      __int16 v50 = 2113;
      __int16 v51 = v16;
      _os_log_impl(&dword_22345C000, v14, OS_LOG_TYPE_DEFAULT, "#TAVehicleCategoryLogic Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);
    }
    id v40 = v8;
    id v41 = v7;
    v17 = [v7 eventBuffer];
    v18 = [v17 getAllTAEventsOf:objc_opt_class()];

    id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
    v19 = [TAVehicleCategory alloc];
    v20 = [v12 startDate];
    v21 = [(TAVehicleCategory *)v19 initWithVehicleCategoryType:0 andDate:v20];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v22 = v18;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v28 = [v27 getDate];
          v29 = [v12 startDate];
          uint64_t v30 = [v28 compare:v29];

          if (v30 == -1)
          {
            v35 = [TAVehicleCategory alloc];
            unint64_t v36 = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromGeoNavigationNotification:v27];
            uint64_t v34 = [v12 startDate];
            uint64_t v37 = [(TAVehicleCategory *)v35 initWithVehicleCategoryType:v36 andDate:v34];

            v21 = (TAVehicleCategory *)v37;
          }
          else
          {
            uint64_t v31 = [v27 getDate];
            v32 = [v12 endDate];
            uint64_t v33 = [v31 compare:v32];

            if (v33 == 1) {
              continue;
            }
            uint64_t v34 = [[TAVehicleCategory alloc] initWithTAGeoNavigationNotification:v27];
            [v42 addObject:v34];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v24);
    }

    [v42 insertObject:v21 atIndex:0];
    id v8 = v40;
    id v7 = v41;
    id v9 = v39;
  }
  else
  {
    id v42 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }

  return v42;
}

+ (id)extractPrivateVehicleHintsFromTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF9C0] set];
  char v11 = +[TAVehicleCategoryLogic accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:v7 since:v8 to:v9];
  char v12 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  v13 = [v11 filteredArrayUsingPredicate:v12];
  if ([v13 count])
  {
    v14 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:2];
    [v10 addObject:v14];
  }
  v15 = +[TAVehicleCategoryLogic accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:v7 since:v8 to:v9];

  v16 = [v15 filteredArrayUsingPredicate:v12];

  if ([v16 count])
  {
    v17 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:1];
    [v10 addObject:v17];
  }
  return v10;
}

BOOL __73__TAVehicleCategoryLogic_extractPrivateVehicleHintsFromTAStore_since_to___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vehicleCategoryType] == 2;
}

@end