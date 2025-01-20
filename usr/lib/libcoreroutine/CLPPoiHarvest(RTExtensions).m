@interface CLPPoiHarvest(RTExtensions)
- (id)description;
- (id)initWithMapItem:()RTExtensions accessPoints:locations:motionActivities:;
@end

@implementation CLPPoiHarvest(RTExtensions)

- (id)initWithMapItem:()RTExtensions accessPoints:locations:motionActivities:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id obj = a5;
  id v12 = a6;
  if ([v10 validMUID] && objc_msgSend(v11, "count"))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F5C290]);
    v14 = [v11 firstObject];
    v15 = [v14 date];
    v16 = (void *)[v13 initWithMapItem:v10 date:v15];

    if (v16)
    {
      v55 = a1;
      v17 = objc_opt_new();
      v51 = v16;
      [v17 setTriggerEvent:v16];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v53 = v11;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v67;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v67 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = (void *)[objc_alloc(MEMORY[0x1E4F5C298]) initWithRTWifiAccessPoint:*(void *)(*((void *)&v66 + 1) + 8 * v22)];
            if (v23) {
              [v17 addAccessPoints:v23];
            }

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v20);
      }
      id v54 = v10;

      v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
      v74 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      v26 = [obj sortedArrayUsingDescriptors:v25];

      v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
      v73 = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      id v52 = v12;
      v29 = [v12 sortedArrayUsingDescriptors:v28];
      v30 = [v29 objectEnumerator];

      v31 = [v30 nextObject];
      v57 = [MEMORY[0x1E4F1CA48] array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v26;
      uint64_t v32 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v63;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v63 != v34) {
              objc_enumerationMutation(obj);
            }
            v36 = *(void **)(*((void *)&v62 + 1) + 8 * v35);
            if (v31)
            {
              do
              {
                v37 = [v36 date];
                v38 = [v31 startDate];
                uint64_t v39 = [v37 compare:v38];

                if (v39 != -1) {
                  break;
                }
                uint64_t v40 = [v30 nextObject];

                v31 = (void *)v40;
              }
              while (v40);
            }
            v41 = (void *)[objc_alloc(MEMORY[0x1E4F5C278]) initWithRTLocation:v36 rtMotionActivity:v31];
            if (v41) {
              [v57 addObject:v41];
            }

            ++v35;
          }
          while (v35 != v33);
          uint64_t v33 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v33);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v42 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
      v70 = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      v44 = [v57 sortedArrayUsingDescriptors:v43];

      uint64_t v45 = [v44 countByEnumeratingWithState:&v58 objects:v71 count:16];
      id v10 = v54;
      v16 = v51;
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v59;
        do
        {
          uint64_t v48 = 0;
          do
          {
            if (*(void *)v59 != v47) {
              objc_enumerationMutation(v44);
            }
            [v17 addLocations:*(void *)(*((void *)&v58 + 1) + 8 * v48++)];
          }
          while (v46 != v48);
          uint64_t v46 = [v44 countByEnumeratingWithState:&v58 objects:v71 count:16];
        }
        while (v46);
      }

      id v49 = v17;
      a1 = v55;
      id v12 = v52;
      id v11 = v53;
    }
    else
    {
      id v49 = 0;
    }
  }
  else
  {
    id v49 = 0;
  }

  return v49;
}

- (id)description
{
  v2 = NSString;
  v3 = [a1 triggerEvent];
  v4 = [a1 accessPoints];
  uint64_t v5 = [v4 count];
  v6 = [a1 locations];
  v7 = [v2 stringWithFormat:@"triggerEvent, %@, wifiAccessPoints, %lu, locations, %lu", v3, v5, [v6 count]];

  return v7;
}

@end