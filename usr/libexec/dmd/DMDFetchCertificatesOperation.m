@interface DMDFetchCertificatesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchCertificatesOperation

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
  return &off_1000D2CA8;
}

- (void)runWithRequest:(id)a3
{
  id v33 = a3;
  v31 = objc_opt_new();
  v3 = objc_opt_new();
  v29 = +[MCProfileConnection sharedConnection];
  v4 = [v29 installedProfilesWithFilterFlags:1];
  objc_opt_class();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v44;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (![v33 managedOnly] || objc_msgSend(v9, "isManagedByMDM"))
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v10 = [v9 payloads];
          id v11 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v40;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v40 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
                if (objc_opt_isKindOfClass())
                {
                  v16 = [v15 certificatePersistentID];
                  [v3 addObject:v16];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v12);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v6);
  }

  CFTypeID TypeID = SecIdentityGetTypeID();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v3;
  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = (__SecCertificate *)+[MCKeychain copyItemWithPersistentID:*(void *)(*((void *)&v35 + 1) + 8 * (void)k) useSystemKeychain:1];
        if (v23)
        {
          v24 = v23;
          SecCertificateRef certificateRef = 0;
          CFTypeID v25 = CFGetTypeID(v23);
          if (v25 != TypeID)
          {
            SecCertificateRef certificateRef = v24;
LABEL_30:
            id v26 = objc_alloc((Class)DMFCertificate);
            id v27 = [v26 initWithCertificateRef:certificateRef isIdentity:v25 == TypeID];
            [v31 addObject:v27];

            CFRelease(certificateRef);
            continue;
          }
          SecIdentityCopyCertificate(v24, &certificateRef);
          CFRelease(v24);
          if (certificateRef) {
            goto LABEL_30;
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v20);
  }

  id v28 = [objc_alloc((Class)DMFFetchCertificatesResultObject) initWithCertificates:v31];
  [(DMDFetchCertificatesOperation *)self endOperationWithResultObject:v28];
}

@end