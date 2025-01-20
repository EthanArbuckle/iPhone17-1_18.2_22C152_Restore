@interface GEOArrivalParameters(MNExtras)
- (BOOL)containsLocation:()MNExtras arrivalRegionType:parameters:;
- (uint64_t)containsCoordinate:()MNExtras arrivalRegionType:;
- (uint64_t)containsLocation:()MNExtras arrivalRegionType:;
- (uint64_t)regionContainmentTypeForLocation:()MNExtras arrivalRegionType:parameters:;
@end

@implementation GEOArrivalParameters(MNExtras)

- (uint64_t)containsCoordinate:()MNExtras arrivalRegionType:
{
  v7 = [[MNLocation alloc] initWithLatitude:a2 longitude:a3];
  uint64_t v8 = [a1 containsLocation:v7 arrivalRegionType:a5];

  return v8;
}

- (uint64_t)containsLocation:()MNExtras arrivalRegionType:
{
  return [a1 containsLocation:a3 arrivalRegionType:a4 parameters:0];
}

- (BOOL)containsLocation:()MNExtras arrivalRegionType:parameters:
{
  return objc_msgSend(a1, "regionContainmentTypeForLocation:arrivalRegionType:parameters:") == 0;
}

- (uint64_t)regionContainmentTypeForLocation:()MNExtras arrivalRegionType:parameters:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (qword_1EB59C2E0 != -1) {
    dispatch_once(&qword_1EB59C2E0, &__block_literal_global_48);
  }
  v9 = (void *)_MergedGlobals_48;
  v10 = [NSNumber numberWithInt:a4];
  v11 = [v9 objectForKeyedSubscript:v10];

  objc_msgSend(v7, "_navigation_geoCoordinate");
  double v13 = v12;
  double v15 = v14;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v16 = [a1 arrivalMapRegions];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v36 = 0;
    v37 = v7;
    char v19 = 0;
    char v20 = 0;
    uint64_t v21 = *(void *)v41;
    id obj = v16;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "arrivalRegionAction", v36));
        int v25 = [v11 containsObject:v24];

        if (v25
          && ([v23 arrivalRegion],
              v26 = objc_claimAutoreleasedReturnValue(),
              [v8 excludeDistancePadding],
              char v28 = objc_msgSend(v26, "containsCoordinate:radius:", v13, v15, v27),
              v26,
              (v28 & 1) != 0))
        {
          uint64_t v36 = 1;
        }
        else if ([v23 arrivalRegionAction] == a4)
        {
          if (![v23 hasRouteEndDistanceThresholdCm]
            || [v37 state] == 1
            && ([v37 distanceToEndOfCurrentLeg], v29 >= 0.0)
            && v29 <= (float)[v23 routeEndDistanceThresholdCm] * 0.01)
          {
            v30 = [v23 arrivalRegion];
            [v8 includeDistancePadding];
            int v32 = objc_msgSend(v30, "containsCoordinate:radius:", v13, v15, v31);

            if (v32)
            {
              if (![v11 count])
              {

                char v33 = v36;
                id v7 = v37;
                goto LABEL_25;
              }
              char v19 = 1;
            }
          }
          char v20 = 1;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    if (v20)
    {
      id v7 = v37;
      char v33 = v19 ^ 1 | v36;
LABEL_25:
      uint64_t v34 = v33 & 1;
      goto LABEL_27;
    }
    uint64_t v34 = 2;
    id v7 = v37;
  }
  else
  {

    uint64_t v34 = 2;
  }
LABEL_27:

  return v34;
}

@end