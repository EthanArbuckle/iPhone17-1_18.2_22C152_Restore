@interface SignpostEvent
- (BOOL)canGenerateCoreAnalyticsPayload;
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostEvent

- (id)signpostType
{
  return @"Event";
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 1;
}

- (id)coreAnalyticsPayload
{
  v13.receiver = self;
  v13.super_class = (Class)SignpostEvent;
  v3 = [(SignpostEvent *)&v13 coreAnalyticsPayload];
  if (v3)
  {
    if (sub_100004860(self))
    {
      v4 = [(SignpostEvent *)self attributes];
      v5 = [v4 objectForKeyedSubscript:@"BundleIdOverride"];

      [v3 setObject:v5 forKeyedSubscript:@"StartProcessName"];
      v6 = sub_100002D74();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1000097C4(self);
      }
    }
    else
    {
      v7 = [(SignpostEvent *)self processImagePath];
      v5 = sub_10000405C(v7);

      if (v5)
      {
        [v3 setObject:v5 forKeyedSubscript:@"StartProcessName"];
      }
      else
      {
        uint64_t v8 = [(SignpostEvent *)self processName];
        v9 = (void *)v8;
        if (v8) {
          CFStringRef v10 = (const __CFString *)v8;
        }
        else {
          CFStringRef v10 = @"Unknown";
        }
        [v3 setObject:v10 forKeyedSubscript:@"StartProcessName"];
      }
    }

    id v11 = v3;
  }

  return v3;
}

@end