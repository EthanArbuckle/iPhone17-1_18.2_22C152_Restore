@interface SMSessionManagerState(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithSMSessionManagerStateMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation SMSessionManagerState(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithSMSessionManagerStateMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[SMSessionManagerState(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 35;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by SMSessionManagerState+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithSMSessionManagerStateMO:()RTCoreDataTransformable
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__126;
    v16 = __Block_byref_object_dispose__126;
    id v17 = 0;
    v5 = [v3 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__SMSessionManagerState_RTCoreDataTransformable__createWithSMSessionManagerStateMO___block_invoke;
    v9[3] = &unk_1E6B90E98;
    id v10 = v4;
    __int16 v11 = buf;
    [v5 performBlockAndWait:v9];

    id v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionManagerStateMO", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[SMSessionManagerStateMO initWithSessionManagerState:a1 inManagedObjectContext:a3];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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