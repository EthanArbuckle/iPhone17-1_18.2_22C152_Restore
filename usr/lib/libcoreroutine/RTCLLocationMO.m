@interface RTCLLocationMO
+ (id)fetchRequest;
+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 horizontalAccuracy:(double)a6 verticalAccuracy:(double)a7 course:(double)a8 courseAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 timestamp:(id)a12 type:(id)a13 signalEnvironmentType:(id)a14 integrity:(id)a15 inManagedObjectContext:(id)a16;
@end

@implementation RTCLLocationMO

uint64_t __211__RTCLLocationMO_managedObjectWithLatitude_longitude_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_type_signalEnvironmentType_integrity_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTCLLocationMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLatitude:*(double *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLongitude:*(double *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setAltitude:*(double *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setHorizontalAccuracy:*(double *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setVerticalAccuracy:*(double *)(a1 + 112)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCourse:*(double *)(a1 + 120)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCourseAccuracy:*(double *)(a1 + 128)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSpeed:*(double *)(a1 + 136)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSpeedAccuracy:*(double *)(a1 + 144)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTimestamp:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setType:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSignalEnvironmentType:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(a1 + 64);
  v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

  return [v6 setIntegrity:v5];
}

+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 horizontalAccuracy:(double)a6 verticalAccuracy:(double)a7 course:(double)a8 courseAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 timestamp:(id)a12 type:(id)a13 signalEnvironmentType:(id)a14 integrity:(id)a15 inManagedObjectContext:(id)a16
{
  id v27 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  v32 = v31;
  if (v31)
  {
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__45;
    v56 = __Block_byref_object_dispose__45;
    id v57 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __211__RTCLLocationMO_managedObjectWithLatitude_longitude_altitude_horizontalAccuracy_verticalAccuracy_course_courseAccuracy_speed_speedAccuracy_timestamp_type_signalEnvironmentType_integrity_inManagedObjectContext___block_invoke;
    v36[3] = &unk_1E6B94908;
    v42 = &v52;
    id v37 = v31;
    double v43 = a3;
    double v44 = a4;
    double v45 = a5;
    double v46 = a6;
    double v47 = a7;
    double v48 = a8;
    double v49 = a9;
    double v50 = a10;
    double v51 = a11;
    id v38 = v27;
    id v39 = v28;
    id v40 = v29;
    id v41 = v30;
    [v37 performBlockAndWait:v36];
    id v33 = (id)v53[5];

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTCLLocationMO"];
}

@end