@interface DMDFetchProfilesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (id)_profileListWithFilterFlags:(int)a3;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchProfilesOperation

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
  return &off_1000D2DB0;
}

- (void)runWithRequest:(id)a3
{
  -[DMDFetchProfilesOperation _profileListWithFilterFlags:](self, "_profileListWithFilterFlags:", MCProfileFilterFlagsFromDMFProfileFilterFlags((uint64_t)[a3 filterFlags]));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [objc_alloc((Class)DMFFetchProfilesResultObject) initWithProfiles:v5];
  [(DMDFetchProfilesOperation *)self endOperationWithResultObject:v4];
}

- (id)_profileListWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v42 = +[MCDependencyReader sharedReader];
  id v4 = +[MCProfileConnection sharedConnection];
  id v5 = +[MCRestrictionManager sharedManager];
  v6 = [v4 installedProfileIdentifiersWithFilterFlags:v3];
  v41 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  v40 = [v5 userProfileRestrictions];
  v39 = [v5 systemProfileRestrictions];
  v32 = v5;
  v38 = [v5 defaultRestrictions];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v52;
    uint64_t v36 = kMCDMManagedProfileToManagingProfileKey;
    uint64_t v37 = *(void *)v52;
    v33 = v4;
    do
    {
      v10 = 0;
      id v34 = v8;
      do
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v10);
        v13 = [v4 installedProfileWithIdentifier:v11];
        if (v13)
        {
          v46 = [v42 dependentsOfParent:v11 inDomain:v36];
          id v14 = [v46 count];
          v15 = [v13 signerCertificates];
          if ([v15 count])
          {
            id v43 = v14;
            v44 = v15;
            v45 = v12;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v16 = v15;
            v17 = (char *)[v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v17)
            {
              v18 = v17;
              uint64_t v19 = *(void *)v48;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(void *)v48 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t Length = SecCertificateGetLength();
                  v22 = +[NSData dataWithBytes:SecCertificateGetBytePtr() length:Length];
                  [0 addObject:v22];
                }
                v18 = (char *)[v16 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v18);
            }

            id v4 = v33;
            id v8 = v34;
            v15 = v44;
            v12 = v45;
            id v14 = v43;
          }
          BOOL v23 = v14 != 0;
          if ([v13 installType] == (id)2) {
            v24 = v40;
          }
          else {
            v24 = v39;
          }
          v25 = [v24 objectForKeyedSubscript:v11];
          +[MCRestrictionManager filterRestrictionDictionary:v25 toIncludeOnlyRestrictionsThatDifferFromRestrictions:v38];
          id v26 = v8;
          v28 = v27 = v4;

          id v29 = [objc_alloc((Class)DMFProfile) initWithProfile:v13 isManaged:v23 signerCertificates:0 restrictions:v28];
          [v41 addObject:v29];

          uint64_t v9 = v37;
          id v4 = v27;
          id v8 = v26;
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v8);
  }

  id v30 = [v41 copy];

  return v30;
}

@end