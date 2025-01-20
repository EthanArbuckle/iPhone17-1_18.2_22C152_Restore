@interface RTConnectionsLocation
- (NSDate)createdAt;
- (NSString)fullFormattedAddress;
- (NSString)name;
- (NSString)originatingBundleID;
- (NSURL)mapItemURL;
- (RTConnectionsLocation)init;
- (RTConnectionsLocation)initWithLocation:(id)a3 name:(id)a4 originatingBundleID:(id)a5 fullFormattedAddress:(id)a6 mapItemURL:(id)a7 createdAt:(id)a8;
- (RTLocation)location;
- (id)_addProactiveExpertSourceTo:(id)a3;
- (id)_mapItemFromForwardGeocode:(id)a3 options:(id)a4;
- (id)_mapItemFromLocalSearch:(id)a3 options:(id)a4;
- (id)description;
- (id)mapItemUsingMapServiceManager:(id)a3 options:(id)a4;
@end

@implementation RTConnectionsLocation

- (RTConnectionsLocation)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_name_originatingBundleID_fullFormattedAddress_mapItemURL_createdAt_);
}

- (RTConnectionsLocation)initWithLocation:(id)a3 name:(id)a4 originatingBundleID:(id)a5 fullFormattedAddress:(id)a6 mapItemURL:(id)a7 createdAt:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)RTConnectionsLocation;
  v20 = [(RTConnectionsLocation *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    location = v20->_location;
    v20->_location = (RTLocation *)v21;

    uint64_t v23 = [v15 copy];
    name = v20->_name;
    v20->_name = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    originatingBundleID = v20->_originatingBundleID;
    v20->_originatingBundleID = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    fullFormattedAddress = v20->_fullFormattedAddress;
    v20->_fullFormattedAddress = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    mapItemURL = v20->_mapItemURL;
    v20->_mapItemURL = (NSURL *)v29;

    uint64_t v31 = [v19 copy];
    createdAt = v20->_createdAt;
    v20->_createdAt = (NSDate *)v31;
  }
  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTConnectionsLocation *)self location];
  v5 = [(RTConnectionsLocation *)self name];
  v6 = [(RTConnectionsLocation *)self originatingBundleID];
  v7 = [(RTConnectionsLocation *)self fullFormattedAddress];
  v8 = [(RTConnectionsLocation *)self mapItemURL];
  v9 = [(RTConnectionsLocation *)self createdAt];
  v10 = [v3 stringWithFormat:@"location, %@, name, %@, originatingBundleID, %@, fullFormattedAddress, %@, mapItemURL, %@, createdAt, %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (NSString)fullFormattedAddress
{
  return self->_fullFormattedAddress;
}

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_fullFormattedAddress, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (id)mapItemUsingMapServiceManager:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RTConnectionsLocation *)self _mapItemFromLocalSearch:v6 options:v7];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(RTConnectionsLocation *)self _mapItemFromForwardGeocode:v6 options:v7];
  }
  v11 = v10;

  return v11;
}

- (id)_mapItemFromLocalSearch:(id)a3 options:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__99;
  v40 = __Block_byref_object_dispose__99;
  id v41 = 0;
  id v8 = [(RTConnectionsLocation *)self name];
  if (![v8 length])
  {
    v30 = 0;
LABEL_11:

    goto LABEL_13;
  }
  v9 = [(RTConnectionsLocation *)self location];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = [(RTConnectionsLocation *)self name];
    v13 = [(RTConnectionsLocation *)self location];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__RTConnectionsLocation_RTMapItem___mapItemFromLocalSearch_options___block_invoke;
    v33[3] = &unk_1E6B90700;
    v35 = &v36;
    id v14 = v11;
    objc_super v34 = v14;
    [v6 fetchMapItemsFromNaturalLanguageQuery:v12 location:v13 options:v7 handler:v33];

    id v15 = v14;
    id v16 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17)) {
      goto LABEL_9;
    }
    v32 = [MEMORY[0x1E4F1C9C8] now];
    [v32 timeIntervalSinceDate:v16];
    double v19 = v18;
    v20 = objc_opt_new();
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_79];
    v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
    v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v42 count:1];
    v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;
    }
    else
    {
LABEL_9:
      id v29 = 0;
    }

    id v8 = v29;
    v30 = [(RTConnectionsLocation *)self _addProactiveExpertSourceTo:v37[5]];

    goto LABEL_11;
  }
  v30 = 0;
LABEL_13:
  _Block_object_dispose(&v36, 8);

  return v30;
}

void __68__RTConnectionsLocation_RTMapItem___mapItemFromLocalSearch_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch map items with error %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_mapItemFromForwardGeocode:(id)a3 options:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__99;
  v39 = __Block_byref_object_dispose__99;
  id v40 = 0;
  uint64_t v8 = [(RTConnectionsLocation *)self fullFormattedAddress];
  BOOL v9 = [v8 length] == 0;

  if (v9)
  {
    id v29 = 0;
  }
  else
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    int v11 = [(RTConnectionsLocation *)self fullFormattedAddress];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __71__RTConnectionsLocation_RTMapItem___mapItemFromForwardGeocode_options___block_invoke;
    v32[3] = &unk_1E6B91290;
    v32[4] = self;
    objc_super v34 = &v35;
    id v12 = v10;
    v33 = v12;
    [v6 fetchMapItemsFromAddressString:v11 options:v7 handler:v32];

    uint64_t v13 = v12;
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v15 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v13, v15)) {
      goto LABEL_7;
    }
    uint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
    [v31 timeIntervalSinceDate:v14];
    double v17 = v16;
    double v18 = objc_opt_new();
    double v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_79];
    v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v41 count:1];
    v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;
    }
    else
    {
LABEL_7:
      id v27 = 0;
    }

    id v28 = v27;
    id v29 = [(RTConnectionsLocation *)self _addProactiveExpertSourceTo:v36[5]];
  }
  _Block_object_dispose(&v35, 8);

  return v29;
}

void __71__RTConnectionsLocation_RTMapItem___mapItemFromForwardGeocode_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = [*(id *)(a1 + 32) fullFormattedAddress];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Failed to forward geocode address: %@, with error : %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_addProactiveExpertSourceTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v24 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    uint64_t v8 = self;
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v28;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = [*(id *)(*((void *)&v27 + 1) + 8 * v11) appendSource:2048];
        if (v12)
        {
          uint64_t v13 = [(RTConnectionsLocation *)v8 name];
          if (![v13 length]) {
            goto LABEL_14;
          }
          __int16 v14 = [v12 name];
          if ([v14 length])
          {
            [(RTConnectionsLocation *)v8 name];
            uint64_t v15 = v10;
            id v16 = v6;
            v18 = double v17 = v5;
            double v19 = [v12 name];
            char v20 = [v18 isEqualToString:v19];

            uint64_t v8 = self;
            id v5 = v17;
            id v6 = v16;
            uint64_t v10 = v15;
            uint64_t v9 = v26;

            if ((v20 & 1) == 0)
            {
              uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v21 = [(RTConnectionsLocation *)self name];
                v22 = [v12 name];
                *(_DWORD *)buf = 138412546;
                v32 = v21;
                __int16 v33 = 2112;
                objc_super v34 = v22;
                _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "Proactive expert location name (%@) doesn't match resolved name (%@)", buf, 0x16u);

                uint64_t v8 = self;
              }
LABEL_14:
            }
            [v5 addObject:v12];
            goto LABEL_16;
          }

          goto LABEL_14;
        }
LABEL_16:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v9)
      {
LABEL_18:

        v4 = v24;
        goto LABEL_20;
      }
    }
  }
  id v5 = 0;
LABEL_20:

  return v5;
}

@end