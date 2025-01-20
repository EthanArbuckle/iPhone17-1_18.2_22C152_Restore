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
  v8 = [v7 stringValueForKey:@"namespaceID" defaultValue:&stru_100031ED0];
  [v6 setNamespaceIdentifier:v8];

  v9 = [v6 namespaceIdentifier];
  unsigned int v10 = [v9 isEqualToString:&stru_100031ED0];

  if (v10)
  {
    v11 = +[_PFLLog extension];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001FC0C(v11, v12, v13, v14, v15, v16, v17, v18);
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
    v21 = [v20 stringValueForKey:@"recipeURL" defaultValue:&stru_100031ED0];

    if ([v21 isEqualToString:&stru_100031ED0])
    {
      v22 = +[_PFLLog extension];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10001FC84(v22, v23, v24, v25, v26, v27, v28, v29);
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
    sub_10001FD3C((uint64_t)v5, v6);
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
      sub_10001FCFC();
    }

    v8 = 0;
  }

  return v8;
}

+ (id)performWithTrialClient:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = [v5 recipeURL];

  v7 = +[_PFLLog extension];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10001FFEC();
    }

    id v44 = 0;
    v9 = +[_DPMLRuntimeRecipe recipeWithTrialClient:v5 error:&v44];
    id v10 = v44;
    v11 = +[_PFLLog extension];
    uint64_t v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10001FFB8();
      }

      uint64_t v13 = [v9 clientIdentifier];
      if ([v13 containsString:@"com.apple.insights.iconic-scenes"])
      {
        unsigned __int8 v14 = +[CLLocationManager locationServicesEnabled];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v9 recipeIdentifier];
          uint64_t v16 = +[NSString stringWithFormat:@"Location service is not enabled for recipe: %@", v15];
          uint64_t v17 = +[_DPMLRuntimeError errorWithCode:300 description:v16];

          if (a4) {
            *a4 = v17;
          }
          uint64_t v18 = +[_PFLLog extension];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10001FF4C((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
          }

          +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v5 withError:v17];
LABEL_22:
          v32 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
      }
      id v43 = 0;
      v39 = [v9 runRecipeWithError:&v43];
      id v40 = v43;
      if (v39)
      {
        v41 = +[_PFLLog extension];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          sub_10001FE98((uint64_t)v39, v40, v41);
        }

        +[_DPMLRuntimeTelemetry reportPluginSucceedForTrialClient:v5];
        v32 = objc_opt_new();
      }
      else
      {
        if (a4)
        {
          *a4 = +[_DPMLRuntimeError errorWithCode:400 underlyingError:v40 description:@"Cannot record data"];
        }
        +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v5 withError:v40];
        v32 = 0;
      }

      goto LABEL_32;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001FE2C((uint64_t)v10, v12, v33, v34, v35, v36, v37, v38);
    }

    if (a4) {
      *a4 = v10;
    }
    +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v5 withError:v10];
    goto LABEL_22;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10001FDB4(v8, v25, v26, v27, v28, v29, v30, v31);
  }

  id v10 = +[_DPMLRuntimeError errorWithCode:100 description:@"Could not fetch recipeAttachment from Trial Client for registered namespaces"];
  +[_DPMLRuntimeTelemetry reportPluginForTrialClient:v5 withError:v10];
  v32 = 0;
LABEL_33:

  return v32;
}

- (void)stop
{
  v2 = +[_PFLLog extension];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100020020();
  }
}

@end