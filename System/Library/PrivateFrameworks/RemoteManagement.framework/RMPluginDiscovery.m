@interface RMPluginDiscovery
+ (id)_discoverJSONFilesInDirectory:(id)a3;
+ (id)_searchPaths;
+ (id)discoverPluginsWithType:(id)a3 checkValidURL:(id)a4;
+ (void)loadDynamicSchemasInPlugins;
@end

@implementation RMPluginDiscovery

+ (id)discoverPluginsWithType:(id)a3 checkValidURL:(id)a4
{
  id v39 = a3;
  v41 = (uint64_t (**)(id, void *))a4;
  id v40 = (id)objc_opt_new();
  v6 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [a1 _searchPaths];
  id v37 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v49;
    CFStringRef v7 = @"xpc";
    v8 = &CC_SHA256_Final_ptr;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v49 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v9;
        v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
        v11 = +[NSFileManager defaultManager];
        v12 = [v10 path];
        v13 = [v11 contentsOfDirectoryAtPath:v12 error:0];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v43 = v13;
        id v14 = [v43 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v45;
          v42 = v10;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v45 != v16) {
                objc_enumerationMutation(v43);
              }
              v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              v19 = [v18 pathExtension];
              unsigned int v20 = [v19 isEqualToString:v7];

              if (v20)
              {
                v21 = v8[241];
                v22 = [v18 stringByDeletingPathExtension];
                LODWORD(v21) = [v21 isAllowedXPCServiceName:v22];

                if (v21)
                {
                  v23 = [v10 URLByAppendingPathComponent:v18];
                  if ([v6 containsObject:v18])
                  {
                    v24 = +[RMLog pluginDiscovery];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      v31 = [v23 path];
                      *(_DWORD *)buf = 138543618;
                      id v53 = v39;
                      __int16 v54 = 2114;
                      v55 = v31;
                      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Ignoring duplicate XPC service (%{public}@) plugin: %{public}@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    CFStringRef v25 = v7;
                    v26 = v8;
                    v27 = v6;
                    int v28 = v41[2](v41, v23);
                    v29 = +[RMLog pluginDiscovery];
                    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
                    if (v28)
                    {
                      if (v30)
                      {
                        v32 = [v23 path];
                        *(_DWORD *)buf = 138543618;
                        id v53 = v39;
                        __int16 v54 = 2114;
                        v55 = v32;
                        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Found XPC service (%{public}@) plugin: %{public}@", buf, 0x16u);
                      }
                      [v40 addObject:v23];
                      v6 = v27;
                      [v27 addObject:v18];
                    }
                    else
                    {
                      if (v30)
                      {
                        v33 = [v23 path];
                        *(_DWORD *)buf = 138543618;
                        id v53 = v39;
                        __int16 v54 = 2114;
                        v55 = v33;
                        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Ignoring XPC service (%{public}@) plugin: %{public}@", buf, 0x16u);
                      }
                      v6 = v27;
                    }
                    v8 = v26;
                    CFStringRef v7 = v25;
                    v10 = v42;
                  }
                }
              }
            }
            id v15 = [v43 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }
          while (v15);
        }

        uint64_t v9 = v38 + 1;
      }
      while ((id)(v38 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v37);
  }

  return v40;
}

+ (id)_searchPaths
{
  v2 = +[RMLocations xpcServiceDirectoryURL];
  v3 = +[NSMutableArray arrayWithObject:v2];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 URLForResource:@"XPCServices" withExtension:0];
  [v3 insertObject:v5 atIndex:0];

  return v3;
}

+ (void)loadDynamicSchemasInPlugins
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059B54;
  v8[3] = &unk_1000C6660;
  id v5 = v3;
  id v9 = v5;
  id v11 = a1;
  id v6 = v4;
  id v10 = v6;
  id v7 = [a1 discoverPluginsWithType:@"Schema" checkValidURL:v8];
  if ([v5 count]) {
    +[RMModelConfigurationSchema loadDynamicSchemaFromFiles:v5];
  }
  if ([v6 count]) {
    +[RMModelStatusSchema loadDynamicSchemaFromFiles:v6];
  }
}

+ (id)_discoverJSONFilesInDirectory:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = +[NSFileManager defaultManager];
  id v6 = [v3 path];
  id v7 = [v5 contentsOfDirectoryAtPath:v6 error:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v13 pathExtension];
        unsigned int v15 = [v14 isEqualToString:@"json"];

        if (v15)
        {
          uint64_t v16 = [v3 URLByAppendingPathComponent:v13];
          [v4 addObject:v16];
          v17 = +[RMLog pluginDiscovery];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_100059EE0(v23, v16, &v24, v17);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  return v4;
}

@end