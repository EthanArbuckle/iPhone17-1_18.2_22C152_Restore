@interface STUsageRequest
+ (id)fetchOrCreateUsageRequestForLocalUserInContext:(id)a3 error:(id *)a4;
+ (id)fetchOrCreateUsageRequestForRemoteUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateUsageRequestForUser:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateUsageRequestForUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchRequestForLocalUsageRequests;
+ (id)fetchRequestForUsageRequestsThatAreForRemoteUsers;
@end

@implementation STUsageRequest

+ (id)fetchRequestForLocalUsageRequests
{
  v2 = [a1 fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"forUserDSID");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestForUsageRequestsThatAreForRemoteUsers
{
  v2 = [a1 fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"forUserDSID");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchOrCreateUsageRequestForUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 longLongValue]) {
    +[STCoreUser fetchUserWithDSID:v8 inContext:v9 error:a5];
  }
  else {
  v10 = +[STCoreUser fetchLocalUserInContext:v9 error:a5];
  }
  if (v10)
  {
    v11 = [a1 fetchOrCreateUsageRequestForUser:v10 inContext:v9 error:a5];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchOrCreateUsageRequestForUser:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 localUserDeviceState];

  if (v10)
  {
    v11 = [a1 fetchOrCreateUsageRequestForLocalUserInContext:v9 error:a5];
  }
  else
  {
    v12 = [v8 dsid];
    v11 = [a1 fetchOrCreateUsageRequestForRemoteUserWithDSID:v12 inContext:v9 error:a5];
  }
  return v11;
}

+ (id)fetchOrCreateUsageRequestForLocalUserInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 fetchRequestForLocalUsageRequests];
  id v8 = [v7 execute:a4];
  id v9 = v8;
  if (v8)
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      v10 = +[STLog usage];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[STUsageRequest fetchOrCreateUsageRequestForLocalUserInContext:error:](v7);
      }
    }
    v11 = [v9 firstObject];
    if (!v11)
    {
      v11 = [[STUsageRequest alloc] initWithContext:v6];
      v12 = objc_opt_new();
      [(STUsageRequest *)v11 setRequestedDate:v12];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchOrCreateUsageRequestForRemoteUserWithDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 fetchRequest];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"forUserDSID", v8];
  [v10 setPredicate:v11];

  v12 = [v10 execute:a5];
  v13 = v12;
  if (v12)
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      v14 = +[STLog usage];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[STUsageRequest fetchOrCreateUsageRequestForLocalUserInContext:error:](v10);
      }
    }
    v15 = [v13 firstObject];
    if (!v15)
    {
      v15 = [[STUsageRequest alloc] initWithContext:v9];
      v16 = objc_opt_new();
      [(STUsageRequest *)v15 setRequestedDate:v16];

      [(STUsageRequest *)v15 setForUserDSID:v8];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)fetchOrCreateUsageRequestForLocalUserInContext:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 predicate];
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "There was more than 1 usage request for %{public}@", v4, v5, v6, v7, 2u);
}

@end