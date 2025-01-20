@interface RTPeopleDensity(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithPeopleDensityMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTPeopleDensity(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(id)objc_opt_class() createWithPeopleDensityMO:v5];

      goto LABEL_8;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      int v10 = 138413058;
      v11 = v9;
      __int16 v12 = 2112;
      __int16 v14 = 2080;
      id v13 = v4;
      v15 = "+[RTPeopleDensity(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 35;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTPeopleDensity+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithPeopleDensityMO:()RTCoreDataTransformable
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    *(void *)buf = 0;
    id v13 = buf;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__105;
    __int16 v16 = __Block_byref_object_dispose__105;
    id v17 = 0;
    id v5 = [v3 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__RTPeopleDensity_RTCoreDataTransformable__createWithPeopleDensityMO___block_invoke;
    v9[3] = &unk_1E6B93860;
    v11 = buf;
    id v10 = v4;
    [v5 performBlockAndWait:v9];

    id v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventMO", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTPeopleDensityMO managedObjectWithPeopleDensity:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end