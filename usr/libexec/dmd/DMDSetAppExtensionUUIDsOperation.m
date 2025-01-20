@interface DMDSetAppExtensionUUIDsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppExtensionUUIDsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2A68;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[DMDAppController sharedController];
  v9 = [v6 VPNUUIDString];
  id v31 = 0;
  unsigned __int8 v10 = [v8 setVPNUUIDString:v9 forBundleIdentifier:v7 error:&v31];
  id v11 = v31;
  if ((v10 & 1) == 0)
  {

    id v15 = v11;
LABEL_13:
    [(DMDSetAppExtensionUUIDsOperation *)self endOperationWithError:v11];
    goto LABEL_14;
  }
  v12 = +[DMDAppController sharedController];
  v13 = [v6 cellularSliceUUIDString];
  id v30 = v11;
  unsigned int v14 = [v12 setCellularSliceUUIDString:v13 forBundleIdentifier:v7 error:&v30];
  id v15 = v30;

  if (v14)
  {
    v16 = +[DMDAppController sharedController];
    [v6 contentFilterUUIDString];
    v27 = v29[2] = v15;
    v28 = v16;
    unsigned int v17 = [v16 setContentFilterUUIDString:v16 forBundleIdentifier:v16 error:v16];
    id v18 = v15;

    if (v17)
    {
      v19 = +[DMDAppController sharedController];
      [v6 DNSProxyUUIDString];
      v25 = v29[1] = v18;
      v26 = v19;
      unsigned int v17 = [v19 setDNSProxyUUIDString:v20 forBundleIdentifier:v21 error:v22];
      id v20 = v18;

      if (v17)
      {
        v24 = +[DMDAppController sharedController];
        v21 = [v6 relayUUIDString];
        v29[0] = v20;
        unsigned int v17 = [v24 setRelayUUIDString:v21 forBundleIdentifier:v7 error:v29];
        id v23 = v29[0];

        id v20 = v23;
      }

      id v18 = v20;
    }

    id v15 = v18;
  }
  else
  {
    unsigned int v17 = 0;
  }

  if (!v17)
  {
    id v11 = v15;
    goto LABEL_13;
  }
  v22 = +[DMDAppController sharedController];
  [v22 sendManagedAppsChangedNotification];

  [(DMDSetAppExtensionUUIDsOperation *)self endOperationWithResultObject:0];
LABEL_14:
}

@end