@interface NSManagedObjectContext(RTExtensions)
- (BOOL)deleteAllWithEntityName:()RTExtensions predicate:error:;
- (id)fetchAllWithEntityName:()RTExtensions predicate:sortDescriptors:error:;
@end

@implementation NSManagedObjectContext(RTExtensions)

- (id)fetchAllWithEntityName:()RTExtensions predicate:sortDescriptors:error:
{
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = a5;
    id v12 = a4;
    v13 = [v10 fetchRequestWithEntityName:a3];
    [v13 setPredicate:v12];

    [v13 setSortDescriptors:v11];
    [v13 setReturnsObjectsAsFaults:0];
    id v18 = 0;
    v14 = [a1 executeFetchRequest:v13 error:&v18];
    id v15 = v18;
    v16 = v15;
    if (a6) {
      *a6 = v15;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)deleteAllWithEntityName:()RTExtensions predicate:error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = a4;
  id v11 = [v9 fetchRequestWithEntityName:a3];
  [v11 setPredicate:v10];

  [v11 setIncludesSubentities:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v11];
  [v12 setResultType:2];
  id v20 = 0;
  v13 = [a1 executeRequest:v12 error:&v20];
  id v14 = v20;
  id v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(a2);
    v19 = [v13 result];
    *(_DWORD *)buf = 138413058;
    v22 = v18;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v19;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
  }
  if (a5 && v14) {
    *a5 = v14;
  }
  BOOL v16 = v14 == 0;

  return v16;
}

@end