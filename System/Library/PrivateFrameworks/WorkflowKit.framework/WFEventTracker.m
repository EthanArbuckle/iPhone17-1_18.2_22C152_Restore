@interface WFEventTracker
+ (id)sharedTracker;
- (WFEventTracker)init;
- (void)trackEvent:(id)a3;
@end

@implementation WFEventTracker

- (void)trackEvent:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = getWFEventTrackerLogObject();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = getWFEventTrackerLogObject();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v28 = (char *)objc_opt_class();
    v10 = v28;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TrackEvent", "event=%{signpost.description:attribute}@", buf, 0xCu);
  }
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFEventTracker.m", 42, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v11 = objc_opt_class();
  if (([v11 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"WFEventTracker.m", 43, @"Invalid event tracking attempted with eventClass: %@", objc_opt_class() object file lineNumber description];
  }
  v12 = [v5 coreAnalyticsKey];

  v13 = getWFEventTrackerLogObject();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = objc_opt_class();
      id v16 = v15;
      v17 = [v5 coreAnalyticsKey];
      v18 = [v5 serializableEvent];
      *(_DWORD *)buf = 136315906;
      v28 = "-[WFEventTracker trackEvent:]";
      __int16 v29 = 2114;
      v30 = v15;
      __int16 v31 = 2114;
      v32 = v17;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Logging event to CoreAnalytics %{public}@ using key %{public}@ %{public}@", buf, 0x2Au);
    }
    v19 = [v5 coreAnalyticsKey];
    v26 = v5;
    AnalyticsSendEventLazy();

    v14 = v26;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    v20 = objc_opt_class();
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFEventTracker trackEvent:]";
    __int16 v29 = 2114;
    v30 = v20;
    id v21 = v20;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Unable to log event %{public}@ - invalid key", buf, 0x16u);
  }
  v22 = getWFEventTrackerLogObject();
  v23 = v22;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v23, OS_SIGNPOST_INTERVAL_END, v7, "TrackEvent", "", buf, 2u);
  }
}

uint64_t __29__WFEventTracker_trackEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictionaryRepresentation];
}

- (WFEventTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFEventTracker;
  return [(WFEventTracker *)&v3 init];
}

+ (id)sharedTracker
{
  if (sharedTracker_onceToken[0] != -1) {
    dispatch_once(sharedTracker_onceToken, &__block_literal_global_41534);
  }
  v2 = (void *)sharedTracker_eventTracker;
  return v2;
}

void __31__WFEventTracker_sharedTracker__block_invoke()
{
  v0 = objc_alloc_init(WFEventTracker);
  v1 = (void *)sharedTracker_eventTracker;
  sharedTracker_eventTracker = (uint64_t)v0;
}

@end