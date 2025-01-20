@interface DMDRemoveConfigurationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)_removeRestrictionsWithRequest:(id)a3 error:(id *)a4;
- (unint64_t)queueGroup;
- (void)_removeProfile:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3020;
}

- (unint64_t)queueGroup
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDRemoveConfigurationOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 profile];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.profile";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 profile];
  id v6 = [v5 objectForKeyedSubscript:@"PayloadContent"];

  if ([v6 count] == (id)1)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 objectForKeyedSubscript:@"PayloadType"];
    unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.applicationaccess"];

    if (v9)
    {
      id v10 = 0;
      char v11 = 1;
    }
    else
    {
      id v10 = [v4 profile];
      char v11 = 0;
    }
  }
  else if ([v6 count] == (id)2)
  {
    CFStringRef v12 = [v4 profile];
    id v13 = [v12 mutableCopy];

    v14 = [v6 objectAtIndexedSubscript:0];
    v20 = v14;
    char v11 = 1;
    v15 = +[NSArray arrayWithObjects:&v20 count:1];
    [v13 setObject:v15 forKeyedSubscript:@"PayloadContent"];

    id v10 = [v13 copy];
  }
  else
  {
    char v11 = 0;
    id v10 = 0;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006C698;
  v17[3] = &unk_1000CBD48;
  char v19 = v11;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  [(DMDRemoveConfigurationOperation *)self _removeProfile:v10 withRequest:v16 completion:v17];
}

- (void)_removeProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = (void (**)(void, void))v8;
  if (a3)
  {
    id v10 = [a4 profile];
    char v11 = [v10 objectForKeyedSubscript:@"PayloadIdentifier"];

    CFStringRef v12 = +[MCProfileConnection sharedConnection];
    id v13 = [v12 installedProfileWithIdentifier:v11];

    if (!v13)
    {
      uint64_t v21 = DMFProfileIdentifierErrorKey;
      v22 = v11;
      v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v16 = DMFErrorWithCodeAndUserInfo();
      ((void (**)(void, void *))v9)[2](v9, v16);

LABEL_11:
      goto LABEL_12;
    }
    v14 = [(DMDTaskOperation *)self context];
    if ([v14 runAsUser])
    {
    }
    else
    {
      v17 = [(DMDRemoveConfigurationOperation *)self request];
      id v18 = [v17 type];

      if (v18 != (id)1)
      {
        uint64_t v19 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v19 = 2;
LABEL_10:
    v20 = +[MCProfileConnection sharedConnection];
    [v20 removeProfileAsyncWithIdentifier:v11 installationType:v19 completion:v9];

    goto LABEL_11;
  }
  (*((void (**)(id, void))v8 + 2))(v8, 0);
LABEL_12:
}

- (BOOL)_removeRestrictionsWithRequest:(id)a3 error:(id *)a4
{
  id v4 = [a3 profile];
  v5 = [v4 objectForKeyedSubscript:@"PayloadIdentifier"];
  id v6 = +[NSString stringWithFormat:@"%@-restrictions", v5];

  v7 = +[MCProfileConnection sharedConnection];
  id v8 = [v7 clientRestrictionsForClientUUID:v6];

  uint64_t v9 = MCFeatureMaximumAppsRating;
  id v10 = +[MCRestrictionManager valueForFeature:MCFeatureMaximumAppsRating withRestrictionsDictionary:v8];
  unsigned int v11 = [v10 intValue];
  CFStringRef v12 = (void *)DMFAppRatingUnrated;
  unsigned int v13 = [DMFAppRatingUnrated intValue];
  v14 = +[MCProfileConnection sharedConnection];
  id v23 = 0;
  unsigned __int8 v15 = [v14 applyRestrictionDictionary:0 clientType:@"com.apple.dmd" clientUUID:v6 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v23];
  id v16 = v23;

  if (v15)
  {
    if (v11 == v13)
    {
      v17 = +[MCProfileConnection sharedConnection];
      id v18 = [v17 userValueForSetting:v9];

      LODWORD(v17) = [v18 intValue];
      if (v17 == [v12 intValue])
      {
        uint64_t v19 = +[MCProfileConnection sharedConnection];
        [v19 setValue:DMFAppRatingAllApps forSetting:v9];
      }
    }
  }
  else
  {
    v20 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100087E10(v16, v20);
    }

    if (*a4) {
      *a4 = v16;
    }
  }

  return v15;
}

@end