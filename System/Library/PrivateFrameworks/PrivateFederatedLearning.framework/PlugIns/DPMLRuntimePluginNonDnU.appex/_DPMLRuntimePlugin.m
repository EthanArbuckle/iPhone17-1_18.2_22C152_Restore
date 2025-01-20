@interface _DPMLRuntimePlugin
+ (id)performWithTrialClient:(id)a3 outError:(id *)a4;
- (id)performTask:(id)a3 outError:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (void)stop;
@end

@implementation _DPMLRuntimePlugin

- (id)performTask:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [v5 parameters];
  v8 = [v7 stringValueForKey:@"namespaceID" defaultValue:&stru_100031EA0];
  [v6 setNamespaceIdentifier:v8];

  v9 = [v6 namespaceIdentifier];
  unsigned int v10 = [v9 isEqualToString:&stru_100031EA0];

  if (v10)
  {
    v11 = +[_PFLLog extension];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001FA0C(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    v20 = [v5 parameters];
    v21 = [v20 stringValueForKey:@"recipeURL" defaultValue:&stru_100031EA0];

    if ([v21 isEqualToString:&stru_100031EA0])
    {
      v22 = +[_PFLLog extension];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10001FA84(v22, v23, v24, v25, v26, v27, v28, v29);
      }

      if (a4)
      {
        id v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      v30 = +[NSURL URLWithString:v21];
      [v6 setRecipeURL:v30];

      v31 = [(id)objc_opt_class() performWithTrialClient:v6 outError:a4];
      if (v31) {
        id v19 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:&__NSDictionary0__struct unprivatizedVector:0];
      }
      else {
        id v19 = 0;
      }
    }
  }

  return v19;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = +[_PFLLog extension];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001FB3C();
  }

  v7 = [[_DPMLRuntimeTrialClient alloc] initWithTask:v5 error:a4];
  if (v7)
  {
    v8 = [(id)objc_opt_class() performWithTrialClient:v7 outError:a4];
  }
  else
  {
    v9 = +[_PFLLog extension];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001FAFC();
    }

    v8 = 0;
  }

  return v8;
}

+ (id)performWithTrialClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = [v6 recipeURL];

  v8 = +[_PFLLog extension];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001FE18();
    }

    id v51 = 0;
    unsigned int v10 = +[_DPMLRuntimeRecipe recipeWithTrialClient:v6 error:&v51];
    id v11 = v51;
    uint64_t v12 = +[_PFLLog extension];
    uint64_t v13 = v12;
    if (!v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001FC28();
      }

      if (a4) {
        *a4 = v11;
      }
      +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v6 withError:v11];
      goto LABEL_22;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10001FDE4();
    }

    uint64_t v14 = [v10 clientIdentifier];
    if ([v14 containsString:@"com.apple.insights.iconic-scenes"])
    {
      unsigned __int8 v15 = +[CLLocationManager locationServicesEnabled];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = [v10 recipeIdentifier];
        uint64_t v17 = +[NSString stringWithFormat:@"Location service is not enabled for recipe: %@", v16];
        uint64_t v18 = +[_DPMLRuntimeError errorWithCode:300 description:v17];

        if (a4) {
          *a4 = v18;
        }
        id v19 = +[_PFLLog extension];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10001FD48();
        }

        +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v6 withError:v18];
LABEL_22:
        v4 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
    }
    uint64_t v27 = [v10 clientIdentifier];
    unsigned int v28 = [v27 containsString:@"com.apple.insights.wallet-fairness"];

    if (!v28)
    {
LABEL_35:
      id v42 = 0;
      v37 = [v10 runRecipeWithError:&v42];
      id v38 = v42;
      if (v37)
      {
        v39 = +[_PFLLog extension];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          sub_10001FC90((uint64_t)v37, v38, v39);
        }

        +[_DPMLRuntimeTelemetry reportPluginSucceedForTrialClient:v6];
        v4 = objc_opt_new();
      }
      else
      {
        if (a4)
        {
          *a4 = +[_DPMLRuntimeError errorWithCode:400 underlyingError:v38 description:@"Cannot record data"];
        }
        +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v6 withError:v38];
        v4 = 0;
      }

      goto LABEL_43;
    }
    uint64_t v29 = +[_PFLLog extension];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10001FDB0();
    }

    id v30 = objc_alloc_init((Class)CIDVUIIdentityProofingDataSharingFlowManager);
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10001376C;
    v44[3] = &unk_1000308C0;
    v46 = &v47;
    v31 = dispatch_semaphore_create(0);
    v45 = v31;
    [v30 fetchUserConsent:v44];
    dispatch_time_t v32 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v31, v32))
    {
      v33 = +[NSString stringWithFormat:@"User consent check failed after %u seconds", 15];
      v34 = +[_PFLLog extension];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10001FD48();
      }

      v35 = +[_DPMLRuntimeError errorWithCode:300 description:v33];
      +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v6 withError:v35];

      v4 = objc_opt_new();
    }
    else
    {
      if (*((unsigned char *)v48 + 24))
      {
        char v36 = 1;
LABEL_34:

        _Block_object_dispose(&v47, 8);
        if ((v36 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_35;
      }
      v41 = +[_PFLLog extension];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "User does not have consent for Mead use-case.", buf, 2u);
      }

      +[_DPMLRuntimeTelemetry reportPluginSucceedForTrialClient:v6];
      v4 = objc_opt_new();
    }
    char v36 = 0;
    goto LABEL_34;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10001FBB0(v9, v20, v21, v22, v23, v24, v25, v26);
  }

  id v11 = +[_DPMLRuntimeError errorWithCode:100 description:@"Could not fetch recipeAttachment from Trial Client for registered namespaces"];
  +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v6 withError:v11];
  v4 = 0;
LABEL_44:

  return v4;
}

- (void)stop
{
  v2 = +[_PFLLog extension];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001FEC0();
  }
}

@end