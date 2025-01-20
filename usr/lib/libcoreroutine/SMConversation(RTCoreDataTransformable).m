@interface SMConversation(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithSMConversationMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation SMConversation(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    v6 = "Invalid parameter not satisfying: managedObject";
    v7 = v5;
    uint32_t v8 = 2;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(id)objc_opt_class() createWithSMConversationMO:v3];
    goto LABEL_8;
  }
  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2080;
    v13 = "+[SMConversation(RTCoreDataTransformable) createWithManagedObject:]";
    __int16 v14 = 1024;
    int v15 = 26;
    v6 = "managedObject, %@, is not supported by SMConversation+CoreDataTransformable (in %s:%d)";
    v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_12;
  }
LABEL_7:

  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithSMConversationMO:()RTCoreDataTransformable
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x3032000000;
    int v15 = __Block_byref_object_copy__117;
    uint64_t v16 = __Block_byref_object_dispose__117;
    id v17 = 0;
    v5 = [v3 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__SMConversation_RTCoreDataTransformable__createWithSMConversationMO___block_invoke;
    v9[3] = &unk_1E6B90E98;
    id v10 = v4;
    id v11 = buf;
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
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversationMO", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[SMConversationMO managedObjectWithSMConversation:a1 inManagedObjectContext:a3];
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