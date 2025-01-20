@interface DMDFetchProvisioningProfilesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchProvisioningProfilesOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000D2DC8;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[MCProfileConnection sharedConnection];
  v6 = [v5 listInstalledProvisioningProfileUUIDsWithManagedOnly:[v4 managedOnly]];

  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  v9 = (char *)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (MISCopyProvisioningProfile())
        {

          [(DMDTaskOperation *)self endOperationWithDMFErrorCode:2400];
          goto LABEL_11;
        }
        id v13 = [objc_alloc((Class)DMFProvisioningProfile) initWithProfileRef:0];
        [v7 addObject:v13];
      }
      v10 = (char *)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v14 = [objc_alloc((Class)DMFFetchProvisioningProfilesResultObject) initWithProfiles:v7];
  [(DMDFetchProvisioningProfilesOperation *)self endOperationWithResultObject:v14];

LABEL_11:
}

@end