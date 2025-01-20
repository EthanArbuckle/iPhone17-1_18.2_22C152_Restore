@interface DMDFetchUsersOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchUsersOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2E58;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[UMUserManager sharedManager];
  v5 = [v4 allUsers];
  v6 = v5;
  if (v5)
  {
    v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    v16 = v4;
    v8 = [v4 currentUser];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [objc_alloc((Class)DMFUser) initWithUser:*(void *)(*((void *)&v17 + 1) + 8 * i) isCurrentUser:[*(id *)(*((void *)&v17 + 1) + 8 * i) isEqualToUser:v8]];
          [v7 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    id v15 = [objc_alloc((Class)DMFFetchUsersResultObject) initWithUsers:v7];
    [(DMDFetchUsersOperation *)self endOperationWithResultObject:v15];

    v4 = v16;
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1700];
  }
}

@end