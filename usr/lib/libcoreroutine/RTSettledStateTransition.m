@interface RTSettledStateTransition
+ (id)createWithManagedObject:(id)a3;
+ (id)createWithSettledStateTransitionMO:(id)a3;
- (NSDate)date;
- (RTSettledStateTransition)init;
- (RTSettledStateTransition)initWithDate:(id)a3 transitionFromType:(int64_t)a4 transitionToType:(int64_t)a5;
- (id)managedObjectWithContext:(id)a3;
- (int64_t)transitionFromType;
- (int64_t)transitionToType;
@end

@implementation RTSettledStateTransition

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithSettledStateTransitionMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[RTSettledStateTransition(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTSettledStateTransition+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithSettledStateTransitionMO:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(void *)buf = 0;
    uint64_t v13 = buf;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__39;
    v16 = __Block_byref_object_dispose__39;
    id v17 = 0;
    v5 = [v3 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__RTSettledStateTransition_RTCoreDataTransformable__createWithSettledStateTransitionMO___block_invoke;
    v9[3] = &unk_1E6B93860;
    __int16 v11 = buf;
    id v10 = v4;
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
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: settledStateTransitionMO", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

void __88__RTSettledStateTransition_RTCoreDataTransformable__createWithSettledStateTransitionMO___block_invoke(uint64_t a1)
{
  v2 = [RTSettledStateTransition alloc];
  id v9 = [*(id *)(a1 + 32) date];
  id v3 = [*(id *)(a1 + 32) transitionFromType];
  uint64_t v4 = [v3 unsignedIntegerValue];
  v5 = [*(id *)(a1 + 32) transitionToType];
  uint64_t v6 = -[RTSettledStateTransition initWithDate:transitionFromType:transitionToType:](v2, "initWithDate:transitionFromType:transitionToType:", v9, v4, [v5 unsignedIntegerValue]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTSettledStateTransitionMO managedObjectWithSettledStateTransition:self inManagedObjectContext:a3];
  }
  else
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (RTSettledStateTransition)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDate_transitionFromType_transitionToType_);
}

- (RTSettledStateTransition)initWithDate:(id)a3 transitionFromType:(int64_t)a4 transitionToType:(int64_t)a5
{
  id v8 = a3;
  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v10 = "Invalid parameter not satisfying: date";
      goto LABEL_13;
    }
LABEL_14:

    __int16 v11 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)a4 >= 3)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v10 = "Invalid parameter not satisfying: RTSettledStateIsValid(transitionFromType)";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((unint64_t)a5 >= 3)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v10 = "Invalid parameter not satisfying: RTSettledStateIsValid(transitionToType)";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4 == a5)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v10 = "Invalid parameter not satisfying: transitionFromType != transitionToType";
LABEL_13:
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTSettledStateTransition;
  uint64_t v13 = [(RTSettledStateTransition *)&v16 init];
  if (v13)
  {
    uint64_t v14 = [v8 copy];
    date = v13->_date;
    v13->_date = (NSDate *)v14;

    v13->_transitionFromType = a4;
    v13->_transitionToType = a5;
  }
  self = v13;
  __int16 v11 = self;
LABEL_15:

  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)transitionFromType
{
  return self->_transitionFromType;
}

- (int64_t)transitionToType
{
  return self->_transitionToType;
}

- (void).cxx_destruct
{
}

@end