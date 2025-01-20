@interface AppResolver
- (BOOL)appSupportsDeprecatedCallingIntents:(id)a3;
@end

@implementation AppResolver

- (BOOL)appSupportsDeprecatedCallingIntents:(id)a3
{
  id v3 = a3;
  id v15 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v15];
  id v5 = v15;
  if (!v5)
  {
    v8 = [v4 compatibilityObject];
    v9 = [v8 plugInKitPlugins];
    v10 = INSupportedIntentsByExtensions();

    unsigned int v11 = [v10 containsObject:INStartCallIntentIdentifier];
    if (v11)
    {
      v12 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100030C3C(v12);
      }
    }
    else if (![v10 containsObject:INStartAudioCallIntentIdentifier])
    {
      unsigned __int8 v14 = [v10 containsObject:INStartVideoCallIntentIdentifier];

      if (v14)
      {
        char v7 = 1;
        goto LABEL_12;
      }
      goto LABEL_5;
    }
    char v7 = v11 ^ 1;

    goto LABEL_12;
  }
  v6 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100030C80((uint64_t)v3, (uint64_t)v5, v6);
  }

LABEL_5:
  char v7 = 0;
LABEL_12:

  return v7;
}

@end