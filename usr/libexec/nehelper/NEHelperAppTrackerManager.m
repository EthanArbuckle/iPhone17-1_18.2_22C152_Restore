@interface NEHelperAppTrackerManager
- (NEHelperAppTrackerManager)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperAppTrackerManager

- (NEHelperAppTrackerManager)initWithFirstMessage:(id)a3
{
  v4 = xpc_dictionary_get_remote_connection(a3);
  self;
  v7.receiver = self;
  v7.super_class = (Class)NEHelperAppTrackerManager;
  v5 = [(NEHelperAppTrackerManager *)&v7 init];

  return v5;
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  char uint64 = xpc_dictionary_get_uint64(v3, "app-tracker-check");
  v5 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "app-tracker-signing-identifier")];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (uint64)
    {
      id v24 = 0;
      id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v24];
      id v8 = v24;
      if (v8 || !v7)
      {
        sub_100001CA0((uint64_t)NEHelperServer, v3, 22, 0);

        goto LABEL_18;
      }
      uint64_t v9 = [v7 privacyTrackingDomains];
      if (v9)
      {
        v10 = (void *)v9;
        xpc_object_t v11 = xpc_array_create(0, 0);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v20 + 1) + 8 * i) UTF8String]);
            }
            id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v14);
        }

        xpc_dictionary_set_value(v6, "app-tracker-domains", v11);
      }
    }
    v17 = v3;
    int64_t v18 = 0;
    v19 = v6;
  }
  else
  {
    v17 = v3;
    int64_t v18 = 22;
    v19 = 0;
  }
  sub_100001CA0((uint64_t)NEHelperServer, v17, v18, v19);
LABEL_18:
}

@end