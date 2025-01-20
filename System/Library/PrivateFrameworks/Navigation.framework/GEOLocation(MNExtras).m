@interface GEOLocation(MNExtras)
+ (id)locationWithCLLocation:()MNExtras course:;
- (id)initWithCLLocation:()MNExtras useMatchInfo:;
- (uint64_t)clientLocation;
- (uint64_t)initWithCLLocation:()MNExtras;
- (void)initWithCLLocation:()MNExtras course:;
@end

@implementation GEOLocation(MNExtras)

- (uint64_t)initWithCLLocation:()MNExtras
{
  return [a1 initWithCLLocation:a3 useMatchInfo:1];
}

- (id)initWithCLLocation:()MNExtras useMatchInfo:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v51.receiver = a1;
  v51.super_class = (Class)&off_1F0E5C2A0;
  id v7 = objc_msgSendSuper2(&v51, sel_init);
  if (v7)
  {
    if (v6)
    {
      [v6 rawCoordinate];
      double v9 = v8;
      double v11 = v10;
      if (objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:"))
      {
        objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
        if (CLLocationCoordinate2DIsValid(v55))
        {
          objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
          if (v12 != 0.0 || (objc_msgSend(v6, "_navigation_rawShiftedCoordinate"), v13 != 0.0))
          {
            objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
            double v9 = v14;
            double v11 = v15;
          }
        }
      }
      double v16 = v11;
      double v17 = v9;
      if (a4)
      {
        [v6 coordinate];
        double v17 = v18;
        double v16 = v19;
      }
      if (v16 >= -180.0 && v16 <= 180.0 && v17 >= -90.0 && v17 <= 90.0)
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64638]), "initWithCoordinate:", v17, v16);
        [v7 setLatLng:v20];

        uint64_t v21 = objc_msgSend(v6, "_navigation_gtLog");
        v22 = [v7 latLng];
        [v22 setGtLog:v21];
      }
      if (v11 >= -180.0 && v11 <= 180.0 && v9 >= -90.0 && v9 <= 90.0)
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64638]), "initWithCoordinate:", v9, v11);
        [v7 setRawCoordinate:v23];

        uint64_t v24 = objc_msgSend(v6, "_navigation_gtLog");
        v25 = [v7 rawCoordinate];
        [v25 setGtLog:v24];
      }
      v26 = [v6 timestamp];
      [v26 timeIntervalSinceReferenceDate];
      objc_msgSend(v7, "setTimestamp:");

      [v6 altitude];
      [v7 setAltitude:(int)v27];
      [v6 horizontalAccuracy];
      objc_msgSend(v7, "setHorizontalAccuracy:");
      [v6 verticalAccuracy];
      objc_msgSend(v7, "setVerticalAccuracy:");
      if (a4)
      {
        [v6 course];
      }
      else
      {
        [v6 clientLocation];
        id v28 = v50[35];
      }
      [v7 setCourse:*(double *)&v28];
      [v6 clientLocation];
      [v7 setRawCourse:*(double *)((char *)&v50[15] + 4)];
      [v6 courseAccuracy];
      objc_msgSend(v7, "setCourseAccuracy:");
      [v6 speed];
      if (v29 >= 0.0)
      {
        [v6 speed];
        objc_msgSend(v7, "setSpeed:");
      }
      objc_msgSend(v6, "_navigation_speedAccuracy");
      if (v30 >= 0.0)
      {
        objc_msgSend(v6, "_navigation_speedAccuracy");
        objc_msgSend(v7, "setSpeedAccuracy:");
      }
      unsigned int v31 = [v6 type] - 1;
      if (v31 <= 0xA && ((0x5EFu >> v31) & 1) != 0) {
        [v7 setType:dword_1B5542A68[v31]];
      }
      if (a4) {
        uint64_t v32 = objc_msgSend(v6, "_navigation_hasMatch");
      }
      else {
        uint64_t v32 = 0;
      }
      [v7 setIsMatchedLocation:v32];
      v33 = [v6 matchInfo];
      if (v33)
      {
        v34 = [v6 matchInfo];
        objc_msgSend(v7, "setIsShifted:", objc_msgSend(v34, "isMatchShifted"));
      }
      else
      {
        [v7 setIsShifted:0];
      }

      int v35 = [v6 referenceFrame];
      if (v35 == 1) {
        uint64_t v36 = 1;
      }
      else {
        uint64_t v36 = 2 * (v35 == 2);
      }
      [v7 setReferenceFrame:v36];
      v37 = [v6 matchInfo];

      if (v37)
      {
        v38 = [v6 matchInfo];
        objc_msgSend(v7, "setFormOfWay:", objc_msgSend(v38, "matchFormOfWay"));

        v39 = [v6 matchInfo];
        objc_msgSend(v7, "setRoadClass:", objc_msgSend(v39, "matchRoadClass"));

        v40 = [v6 matchInfo];
        uint64_t v41 = [v40 matchQuality];

        if ((unint64_t)(v41 - 1) <= 2) {
          objc_msgSend(v7, "setMatchQuality:");
        }
      }
      v42 = [v6 coarseMetaData];

      if (v42)
      {
        v43 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v44 = objc_opt_class();
        v45 = [v6 coarseMetaData];
        v50[0] = 0;
        v46 = [v43 unarchivedObjectOfClass:v44 fromData:v45 error:v50];
        id v47 = v50[0];

        if (v46)
        {
          [v7 setCoarseMetadata:v46];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v53 = v47;
          _os_log_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to decode coarse location metadata: %{public}@", buf, 0xCu);
        }
      }
    }
    id v48 = v7;
  }

  return v7;
}

- (void)initWithCLLocation:()MNExtras course:
{
  v3 = objc_msgSend(a1, "initWithCLLocation:");
  v4 = v3;
  if (v3)
  {
    if (a2 >= 0.0) {
      [v3 setCourse:a2];
    }
    else {
      [v3 setHasCourse:0];
    }
    id v5 = v4;
  }

  return v4;
}

- (uint64_t)clientLocation
{
  *(_OWORD *)(a2 + 140) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  [a1 timestamp];
  *(void *)(a2 + 76) = v4;
  id v5 = [a1 latLng];
  [v5 lat];
  *(void *)(a2 + 4) = v6;

  id v7 = [a1 latLng];
  [v7 lng];
  *(void *)(a2 + 12) = v8;

  [a1 horizontalAccuracy];
  *(void *)(a2 + 20) = v9;
  *(double *)(a2 + 28) = (double)(int)[a1 altitude];
  [a1 verticalAccuracy];
  *(void *)(a2 + 36) = v10;
  [a1 speed];
  *(void *)(a2 + 44) = v11;
  [a1 speedAccuracy];
  *(void *)(a2 + 52) = v12;
  [a1 course];
  *(void *)(a2 + 60) = v13;
  [a1 courseAccuracy];
  *(void *)(a2 + 68) = v14;
  unsigned int v15 = [a1 type] - 1;
  if (v15 > 2) {
    int v16 = 0;
  }
  else {
    int v16 = dword_1B5542A94[v15];
  }
  *(_DWORD *)(a2 + 96) = v16;
  double v17 = [a1 rawCoordinate];
  [v17 lat];
  *(void *)(a2 + 100) = v18;

  double v19 = [a1 rawCoordinate];
  [v19 lng];
  *(void *)(a2 + 108) = v20;

  [a1 rawCourse];
  *(void *)(a2 + 116) = v21;
  *(_DWORD *)(a2 + 84) = 0;
  *(void *)(a2 + 88) = 0xBFF0000000000000;
  *(_DWORD *)a2 = 0xFFFF;
  uint64_t result = [a1 referenceFrame];
  int v23 = 2 * (result == 2);
  if (result == 1) {
    int v23 = 1;
  }
  *(_DWORD *)(a2 + 132) = v23;
  return result;
}

+ (id)locationWithCLLocation:()MNExtras course:
{
  id v5 = (objc_class *)MEMORY[0x1E4F64660];
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithCLLocation:v6 course:a1];

  return v7;
}

@end