@interface PGGraphPlacesResolver
+ (id)_businessItemsAtCoordinate:(CLLocationCoordinate2D)a3 inCache:(id)a4;
+ (id)_clusteredRegionsFromFeeder:(id)a3;
+ (id)poiStringFromSpatialLookupCategory:(int64_t)a3;
+ (id)resolvePlacesForMomentNode:(id)a3 feeder:(id)a4 poiCache:(id)a5;
+ (id)resolvedPlaceForRegion:(id)a3 withPlaceItems:(id)a4;
@end

@implementation PGGraphPlacesResolver

+ (id)_businessItemsAtCoordinate:(CLLocationCoordinate2D)a3 inCache:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = a4;
  v18.double latitude = latitude;
  v18.double longitude = longitude;
  BOOL v7 = CLLocationCoordinate2DIsValid(v18);
  id v8 = (id)MEMORY[0x1E4F1CBF0];
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    v12 = objc_msgSend(v9, "initWithCenter:radius:identifier:", v11, latitude, longitude, 100.0);

    uint64_t v13 = [v6 businessItemsForRegion:v12];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v8;
    }
    id v8 = v15;
  }
  return v8;
}

+ (id)_clusteredRegionsFromFeeder:(id)a3
{
  v3 = [a3 allItems];
  v4 = [MEMORY[0x1E4F8AB20] performClustering:0 dataset:v3 progressBlock:&__block_literal_global_48203];
  v5 = [v4 allKeys];

  return v5;
}

+ (id)resolvedPlaceForRegion:(id)a3 withPlaceItems:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA80] set];
  [v5 center];
  double v9 = v8;
  double v11 = v10;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        CLLocationCoordinate2D v18 = [v17 categoryNames];
        if ([v18 count])
        {
          v19 = [v17 region];
          [v19 center];
          double v21 = v20;
          double v23 = v22;
          char v24 = objc_msgSend(v19, "containsCoordinate:", v9, v11);
          int v25 = objc_msgSend(v5, "containsCoordinate:", v21, v23);
          if ((v24 & 1) != 0 || v25) {
            [v7 addObjectsFromArray:v18];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v14);
  }

  v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = v7;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        v33 = [PGGraphResolvedPlace alloc];
        v34 = -[PGGraphResolvedPlace initWithPlaceOfInterestType:confidence:](v33, "initWithPlaceOfInterestType:confidence:", v32, 1.0, (void)v36);
        [v26 addObject:v34];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v29);
  }

  return v26;
}

+ (id)poiStringFromSpatialLookupCategory:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      v3 = +[PGPhotosGraphProfile poiEntertainment];
      break;
    case 1:
      v3 = +[PGPhotosGraphProfile poiAmusementPark];
      break;
    case 4:
      v3 = +[PGPhotosGraphProfile poiStadium];
      break;
    case 6:
    case 7:
      v3 = +[PGPhotosGraphProfile poiCulture];
      break;
    case 8:
      v3 = +[PGPhotosGraphProfile poiMuseum];
      break;
    case 9:
      v3 = +[PGPhotosGraphProfile poiRestaurant];
      break;
    case 10:
      v3 = +[PGPhotosGraphProfile poiNightlife];
      break;
    case 11:
      v3 = +[PGPhotosGraphProfile poiPark];
      break;
    case 12:
      v3 = +[PGPhotosGraphProfile poiTravel];
      break;
    case 17:
      v3 = +[PGPhotosGraphProfile poiActivity];
      break;
    case 18:
      v3 = +[PGPhotosGraphProfile poiDiving];
      break;
    case 19:
      v3 = +[PGPhotosGraphProfile poiHiking];
      break;
    case 20:
      v3 = +[PGPhotosGraphProfile poiPerformance];
      break;
    case 21:
      v3 = +[PGPhotosGraphProfile poiHospital];
      break;
    default:
      break;
  }
  return v3;
}

+ (id)resolvePlacesForMomentNode:(id)a3 feeder:(id)a4 poiCache:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  if (v6)
  {
    double v8 = [(id)objc_opt_class() _clusteredRegionsFromFeeder:v6];
    double v9 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v16 = objc_opt_class();
          objc_msgSend(v15, "center", (void)v20);
          v17 = objc_msgSend(v16, "_businessItemsAtCoordinate:inCache:", v7);
          if ([v17 count])
          {
            CLLocationCoordinate2D v18 = [(id)objc_opt_class() resolvedPlaceForRegion:v15 withPlaceItems:v17];
            [v9 addObjectsFromArray:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

@end