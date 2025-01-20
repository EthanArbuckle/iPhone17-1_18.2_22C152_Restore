@interface USUsageAccumulator
- (BOOL)isDeviceBacklit;
- (BOOL)isStandByEnabled;
- (NSDate)backlightStartDate;
- (NSDate)lastEventDate;
- (NSDate)mediaNowPlayingStartDate;
- (NSDictionary)applicationCategories;
- (NSDictionary)webCategories;
- (NSMutableArray)backlightIntervals;
- (NSMutableDictionary)applicationUsageIntervals;
- (NSMutableDictionary)applicationUsageStartDates;
- (NSMutableDictionary)canonicalApplicationUsageIntervals;
- (NSMutableDictionary)categoryUsageIntervals;
- (NSMutableDictionary)mediaUsageByUniqueID;
- (NSMutableDictionary)notifications;
- (NSMutableDictionary)primaryWebUsageIntervals;
- (NSMutableDictionary)webUsageIntervals;
- (NSMutableDictionary)webUsageStartDatesByWebBrowser;
- (NSMutableDictionary)webUsageStateByUniqueID;
- (USUsageAccumulator)initWithApplicationCategories:(id)a3 webCategories:(id)a4;
- (int)quickLookVideoNowPlayingState;
- (void)_accumulateAppMediaUsage:(id)a3 timestamp:(id)a4;
- (void)_accumulateAppUsage:(id)a3 timestamp:(id)a4;
- (void)_accumulateAppWebUsage:(id)a3 timestamp:(id)a4;
- (void)_accumulateApplication:(id)a3 timestamp:(id)a4 starting:(BOOL)a5 isUsageTrusted:(BOOL)a6;
- (void)_accumulateDeviceBacklight:(id)a3 timestamp:(id)a4;
- (void)_accumulateDeviceBacklightWithIsBacklit:(BOOL)a3 timestamp:(id)a4;
- (void)_accumulateMediaNowPlaying:(id)a3 timestamp:(id)a4;
- (void)_accumulateMediaNowPlayingWithTimestamp:(id)a3 starting:(BOOL)a4;
- (void)_accumulateNotificationUsage:(id)a3;
- (void)_accumulateWebDomain:(id)a3 bundleIdentifier:(id)a4 timestamp:(id)a5 starting:(BOOL)a6 isUsageTrusted:(BOOL)a7;
- (void)_aggregateAppMediaUsage:(id)a3 timestamp:(id)a4;
- (void)_aggregateApplicationUsageInterval:(id)a3 identifier:(id)a4;
- (void)_aggregateCanonicalApplicationUsageInterval:(id)a3 canonicalIdentifier:(id)a4;
- (void)_aggregateCategoryUsageInterval:(id)a3 identifier:(id)a4;
- (void)_aggregatePrimaryWebUsageInterval:(id)a3 primaryIdentifier:(id)a4;
- (void)_aggregateStartDatesUsingEndDate:(id)a3;
- (void)_aggregateWebUsageInterval:(id)a3 identifier:(id)a4;
- (void)_resetAggregations;
- (void)_stopAllUsageWithEndDate:(id)a3;
- (void)_stopAllWebUsageForWebBrowser:(id)a3 endDate:(id)a4;
- (void)accumulateEvent:(id)a3 timestamp:(id)a4;
- (void)aggregateUsageForInterval:(id)a3 usageReportHandler:(id)a4;
- (void)setBacklightStartDate:(id)a3;
- (void)setDeviceBacklit:(BOOL)a3;
- (void)setLastEventDate:(id)a3;
- (void)setMediaNowPlayingStartDate:(id)a3;
- (void)setMediaUsageByUniqueID:(id)a3;
- (void)setQuickLookVideoNowPlayingState:(int)a3;
- (void)setStandByEnabled:(BOOL)a3;
@end

@implementation USUsageAccumulator

- (USUsageAccumulator)initWithApplicationCategories:(id)a3 webCategories:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)USUsageAccumulator;
  id v5 = a4;
  id v6 = a3;
  v7 = [(USUsageAccumulator *)&v35 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v35.receiver, v35.super_class);

  applicationCategories = v7->_applicationCategories;
  v7->_applicationCategories = (NSDictionary *)v8;

  uint64_t v10 = [v5 copy];
  webCategories = v7->_webCategories;
  v7->_webCategories = (NSDictionary *)v10;

  uint64_t v12 = objc_opt_new();
  applicationUsageStartDates = v7->_applicationUsageStartDates;
  v7->_applicationUsageStartDates = (NSMutableDictionary *)v12;

  uint64_t v14 = objc_opt_new();
  webUsageStartDatesByWebBrowser = v7->_webUsageStartDatesByWebBrowser;
  v7->_webUsageStartDatesByWebBrowser = (NSMutableDictionary *)v14;

  uint64_t v16 = objc_opt_new();
  webUsageStateByUniqueID = v7->_webUsageStateByUniqueID;
  v7->_webUsageStateByUniqueID = (NSMutableDictionary *)v16;

  v7->_quickLookVideoNowPlayingState = 0;
  uint64_t v18 = objc_opt_new();
  mediaUsageByUniqueID = v7->_mediaUsageByUniqueID;
  v7->_mediaUsageByUniqueID = (NSMutableDictionary *)v18;

  uint64_t v20 = objc_opt_new();
  backlightIntervals = v7->_backlightIntervals;
  v7->_backlightIntervals = (NSMutableArray *)v20;

  uint64_t v22 = objc_opt_new();
  applicationUsageIntervals = v7->_applicationUsageIntervals;
  v7->_applicationUsageIntervals = (NSMutableDictionary *)v22;

  uint64_t v24 = objc_opt_new();
  webUsageIntervals = v7->_webUsageIntervals;
  v7->_webUsageIntervals = (NSMutableDictionary *)v24;

  uint64_t v26 = objc_opt_new();
  categoryUsageIntervals = v7->_categoryUsageIntervals;
  v7->_categoryUsageIntervals = (NSMutableDictionary *)v26;

  uint64_t v28 = objc_opt_new();
  canonicalApplicationUsageIntervals = v7->_canonicalApplicationUsageIntervals;
  v7->_canonicalApplicationUsageIntervals = (NSMutableDictionary *)v28;

  uint64_t v30 = objc_opt_new();
  primaryWebUsageIntervals = v7->_primaryWebUsageIntervals;
  v7->_primaryWebUsageIntervals = (NSMutableDictionary *)v30;

  uint64_t v32 = objc_opt_new();
  notifications = v7->_notifications;
  v7->_notifications = (NSMutableDictionary *)v32;

  return v7;
}

- (void)accumulateEvent:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(USUsageAccumulator *)self setLastEventDate:v7];
  uint64_t v8 = [v6 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(USUsageAccumulator *)self _accumulateAppUsage:v8 timestamp:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(USUsageAccumulator *)self _accumulateAppMediaUsage:v8 timestamp:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(USUsageAccumulator *)self _accumulateAppWebUsage:v8 timestamp:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(USUsageAccumulator *)self _accumulateDeviceBacklight:v8 timestamp:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(USUsageAccumulator *)self _accumulateMediaNowPlaying:v8 timestamp:v7];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(USUsageAccumulator *)self _accumulateNotificationUsage:v8];
            }
            else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              -[USUsageAccumulator accumulateEvent:timestamp:]();
            }
          }
        }
      }
    }
  }
}

- (void)_accumulateAppUsage:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 parentBundleID];
  if (v8 || ([v6 bundleID], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [v6 starting];
    if ([v8 isEqualToString:@"com.apple.springboard.stand-by"])
    {
      [(USUsageAccumulator *)self setStandByEnabled:v9];
      if ([(USUsageAccumulator *)self isDeviceBacklit]) {
        [(USUsageAccumulator *)self _accumulateDeviceBacklightWithIsBacklit:v9 ^ 1 timestamp:v7];
      }
    }
    else
    {
      -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:](self, "_accumulateApplication:timestamp:starting:isUsageTrusted:", v8, v7, v9, [v6 isUsageTrusted]);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[USUsageAccumulator _accumulateAppUsage:timestamp:]();
    }
    uint64_t v8 = 0;
  }
}

- (void)_accumulateAppMediaUsage:(id)a3 timestamp:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uniqueID];
  if (v8)
  {
    uint64_t v9 = [(USUsageAccumulator *)self mediaUsageByUniqueID];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];

    id v11 = v10;
    id v12 = v6;
    int v13 = [v11 starting];
    if (v13 != [v12 starting])
    {

      goto LABEL_22;
    }
    uint64_t v14 = [v11 bundleID];
    v15 = [v12 bundleID];
    if (v14 == v15)
    {
      v27 = v14;
    }
    else
    {
      uint64_t v16 = [v11 bundleID];
      uint64_t v26 = [v12 bundleID];
      if (!objc_msgSend(v16, "isEqual:"))
      {
        int v20 = 0;
LABEL_18:

LABEL_19:
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v12;
            _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Media usage session has not changed state, not accumulating event: %{public}@", buf, 0xCu);
          }
          goto LABEL_23;
        }
LABEL_22:
        [(USUsageAccumulator *)self _aggregateAppMediaUsage:v11 timestamp:v7];
        uint64_t v22 = [(USUsageAccumulator *)self mediaUsageByUniqueID];
        [v22 setObject:v12 forKeyedSubscript:v8];

LABEL_23:
        goto LABEL_24;
      }
      v25 = v16;
      v27 = v14;
    }
    v17 = [v11 URL];
    uint64_t v18 = [v12 URL];
    if (v17 == v18
      || ([v11 URL],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v12 URL],
          v23 = objc_claimAutoreleasedReturnValue(),
          uint64_t v24 = v19,
          objc_msgSend(v19, "isEqual:")))
    {
      int v21 = [v11 isUsageTrusted];
      int v20 = v21 ^ [v12 isUsageTrusted] ^ 1;
      if (v17 == v18)
      {

LABEL_17:
        uint64_t v14 = v27;
        uint64_t v16 = v25;
        if (v27 == v15) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else
    {
      int v20 = 0;
    }

    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[USUsageAccumulator _accumulateAppMediaUsage:timestamp:]();
  }
LABEL_24:
}

- (void)_accumulateAppWebUsage:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uniqueID];
  uint64_t v9 = [v6 webDomain];
  uint64_t v10 = [v6 applicationID];
  id v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    uint64_t v12 = [v6 isUsageTrusted];
    int v13 = [(USUsageAccumulator *)self webUsageStateByUniqueID];
    uint64_t v14 = [v13 objectForKeyedSubscript:v8];

    uint64_t v15 = [v6 usageState];
    uint64_t v16 = v15;
    if (v14)
    {
      if ([v14 intValue] == 3)
      {
        if (v16 != 3)
        {
          BOOL v17 = 0;
LABEL_13:
          [(USUsageAccumulator *)self _accumulateWebDomain:v9 bundleIdentifier:v11 timestamp:v7 starting:v17 isUsageTrusted:v12];
        }
      }
      else if (v16 == 3)
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
      uint64_t v18 = [NSNumber numberWithInt:v16];
      v19 = [(USUsageAccumulator *)self webUsageStateByUniqueID];
      [v19 setObject:v18 forKeyedSubscript:v8];

      goto LABEL_15;
    }
    BOOL v17 = v15 == 3;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[USUsageAccumulator _accumulateAppWebUsage:timestamp:]();
  }
LABEL_15:
}

- (void)_accumulateDeviceBacklight:(id)a3 timestamp:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [a3 backlightLevel];
  [(USUsageAccumulator *)self setDeviceBacklit:v6 != 0];
  if (![(USUsageAccumulator *)self isStandByEnabled]) {
    [(USUsageAccumulator *)self _accumulateDeviceBacklightWithIsBacklit:v6 != 0 timestamp:v7];
  }
}

- (void)_accumulateDeviceBacklightWithIsBacklit:(BOOL)a3 timestamp:(id)a4
{
  BOOL v4 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(USUsageAccumulator *)self backlightStartDate];
  uint64_t v8 = v7;
  if (v4)
  {
    if (!v7) {
      [(USUsageAccumulator *)self setBacklightStartDate:v6];
    }
  }
  else if (v7)
  {
    if ([v7 compare:v6] == 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:]();
      }
    }
    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 endDate:v6];
      uint64_t v10 = [(USUsageAccumulator *)self backlightIntervals];
      id v11 = v9;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v30 = self;
        v31 = v8;
        id v32 = v6;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v35;
        id v29 = v11;
        uint64_t v16 = v11;
        do
        {
          uint64_t v17 = 0;
          uint64_t v33 = v13;
          do
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v10);
            }
            uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
            if ([v18 intersectsDateInterval:v16])
            {
              v19 = v10;
              int v20 = [v18 startDate];
              int v21 = [v16 startDate];
              uint64_t v22 = [v20 earlierDate:v21];

              v23 = [v18 endDate];
              [v16 endDate];
              v25 = uint64_t v24 = (void *)v14;
              uint64_t v26 = [v23 laterDate:v25];

              uint64_t v14 = (uint64_t)v24;
              uint64_t v27 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v22 endDate:v26];

              if (v24) {
                [v24 addObject:v18];
              }
              else {
                uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v18, 0);
              }

              uint64_t v16 = (void *)v27;
              uint64_t v10 = v19;
              uint64_t v13 = v33;
            }
            ++v17;
          }
          while (v13 != v17);
          uint64_t v13 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v13);
        if (v14)
        {
          [v10 removeObjectsInArray:v14];
          id v6 = v32;
          uint64_t v28 = (void *)v14;
        }
        else
        {
          uint64_t v28 = 0;
          id v6 = v32;
        }
        self = v30;
        uint64_t v8 = v31;
        id v11 = v29;
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v16 = v11;
      }
      [v10 addObject:v16];

      [(USUsageAccumulator *)self setBacklightStartDate:0];
      [(USUsageAccumulator *)self _stopAllUsageWithEndDate:v6];
    }
  }
}

- (void)_accumulateMediaNowPlaying:(id)a3 timestamp:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 bundleID];
  if (([v7 isEqualToString:@"com.apple.quicklook.extension.previewUI"] & 1) == 0
    && ![v7 isEqualToString:@"com.apple.quicklook.QuickLookUIService"])
  {

    goto LABEL_11;
  }
  int v8 = [v12 itemMediaType];

  if (v8 != 2) {
    goto LABEL_11;
  }
  int v9 = [(USUsageAccumulator *)self quickLookVideoNowPlayingState];
  uint64_t v10 = [v12 playbackState];
  uint64_t v11 = v10;
  if (v9 != 1)
  {
    if (v10 != 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v10 != 1) {
LABEL_9:
  }
    [(USUsageAccumulator *)self _accumulateMediaNowPlayingWithTimestamp:v6 starting:v9 != 1];
LABEL_10:
  [(USUsageAccumulator *)self setQuickLookVideoNowPlayingState:v11];
LABEL_11:
}

- (void)_accumulateNotificationUsage:(id)a3
{
  id v4 = a3;
  if ([v4 usageType] == 1
    || [v4 usageType] == 17
    || [v4 usageType] == 18)
  {
    id v5 = [v4 parentBundleID];
    if (v5 || ([v4 bundleID], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v6 = [[USTrustIdentifier alloc] initWithIdentifier:v5 trusted:1];
      id v7 = [(USUsageAccumulator *)self notifications];
      int v8 = [v7 objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 unsignedIntValue] + 1;

      uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
      uint64_t v11 = [(USUsageAccumulator *)self notifications];
      [v11 setObject:v10 forKeyedSubscript:v6];
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[USUsageAccumulator _accumulateNotificationUsage:]();
    }
  }
}

- (void)_accumulateApplication:(id)a3 timestamp:(id)a4 starting:(BOOL)a5 isUsageTrusted:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = [[USTrustIdentifier alloc] initWithIdentifier:v10 trusted:v6];
  uint64_t v13 = [(USUsageAccumulator *)self applicationUsageStartDates];
  uint64_t v14 = [v13 objectForKeyedSubscript:v12];
  uint64_t v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  uint64_t v17 = v16;

  if (v7)
  {
    [v17 addObject:v11];
  }
  else
  {
    uint64_t v18 = [v17 firstObject];
    v19 = v18;
    if (v18)
    {
      if ([v18 compare:v11] == 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
          -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:]();
        }
      }
      else
      {
        int v20 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v19 endDate:v11];
        [(USUsageAccumulator *)self _aggregateApplicationUsageInterval:v20 identifier:v12];
        [v17 removeObjectAtIndex:0];
        [(USUsageAccumulator *)self _stopAllWebUsageForWebBrowser:v12 endDate:v11];
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = v10;
      _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Received end event for %{public}@ without a corresponding start event. This may be because the event was manually ended due to a backlight end event.", (uint8_t *)&v22, 0xCu);
    }
  }
  int v21 = [(USUsageAccumulator *)self applicationUsageStartDates];
  [v21 setObject:v17 forKeyedSubscript:v12];
}

- (void)_accumulateWebDomain:(id)a3 bundleIdentifier:(id)a4 timestamp:(id)a5 starting:(BOOL)a6 isUsageTrusted:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [[USTrustIdentifier alloc] initWithIdentifier:v14 trusted:v7];

  id v16 = [[USTrustIdentifier alloc] initWithIdentifier:v13 trusted:v7];
  uint64_t v17 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  uint64_t v18 = [v17 objectForKeyedSubscript:v16];
  v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_opt_new();
  }
  int v21 = v20;

  int v22 = [v21 objectForKeyedSubscript:v15];
  id v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_opt_new();
  }
  v25 = v24;

  if (!v8)
  {
    uint64_t v26 = [v25 firstObject];
    uint64_t v27 = v26;
    if (v26)
    {
      if ([v26 compare:v12] == 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
          -[USUsageAccumulator _accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:]((uint64_t)v12, v15);
        }
        goto LABEL_17;
      }
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v27 endDate:v12];
      [(USUsageAccumulator *)self _aggregateWebUsageInterval:v28 identifier:v15];
      [v25 removeObjectAtIndex:0];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v28 = [(USTrustIdentifier *)v15 identifier];
      int v30 = 138543362;
      v31 = v28;
      _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Received end event for %{public}@ without a corresponding start event. This may be because the event was manually ended due to a backlight end event.", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_17;
  }
  [v25 addObject:v12];
LABEL_18:
  [v21 setObject:v25 forKeyedSubscript:v15];
  id v29 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  [v29 setObject:v21 forKeyedSubscript:v16];
}

- (void)_accumulateMediaNowPlayingWithTimestamp:(id)a3 starting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(USUsageAccumulator *)self mediaNowPlayingStartDate];
  BOOL v8 = v7;
  if (v4)
  {
    if (!v7) {
      [(USUsageAccumulator *)self setMediaNowPlayingStartDate:v6];
    }
  }
  else if (v7)
  {
    if ([v7 compare:v6] == 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        -[USUsageAccumulator _accumulateMediaNowPlayingWithTimestamp:starting:]();
      }
    }
    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 endDate:v6];
      [(USUsageAccumulator *)self _aggregateCategoryUsageInterval:v9 identifier:*MEMORY[0x263F31820]];
      [(USUsageAccumulator *)self setMediaNowPlayingStartDate:0];
    }
  }
}

- (void)aggregateUsageForInterval:(id)a3 usageReportHandler:(id)a4
{
  v48[16] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  BOOL v8 = [v6 endDate];
  uint64_t v9 = [MEMORY[0x263EFF910] now];
  id v10 = [v8 earlierDate:v9];

  [(USUsageAccumulator *)self _aggregateStartDatesUsingEndDate:v10];
  uint64_t v11 = [(USUsageAccumulator *)self lastEventDate];
  id v12 = (void *)v11;
  if (v11)
  {
    long long v36 = (void *)v11;
    long long v37 = v10;
    v38 = v7;
    id v39 = v6;
    id v13 = [(USUsageAccumulator *)self backlightIntervals];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = 0;
      uint64_t v17 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v19 duration];
          if (v20 > -1.0)
          {
            id v21 = v19;

            id v16 = v21;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v15);
    }
    else
    {
      id v16 = 0;
    }

    v48[0] = 0;
    id v23 = [(USUsageAccumulator *)self applicationUsageIntervals];
    id v43 = 0;
    v42 = +[USUsageQuerying _generatePickupsByBundleIdentifierWithPickupIntervals:v13 applicationUsageIntervals:v23 pickupsWithoutApplicationUsage:v48 firstPickup:&v43];
    id v35 = v43;

    uint64_t v34 = v48[0];
    uint64_t v33 = [(USUsageAccumulator *)self applicationUsageIntervals];
    v41 = [(USUsageAccumulator *)self webUsageIntervals];
    v40 = [(USUsageAccumulator *)self categoryUsageIntervals];
    v31 = [(USUsageAccumulator *)self canonicalApplicationUsageIntervals];
    int v30 = [(USUsageAccumulator *)self primaryWebUsageIntervals];
    id v29 = [(USUsageAccumulator *)self applicationCategories];
    uint64_t v24 = [(USUsageAccumulator *)self webCategories];
    v25 = self;
    uint64_t v32 = self;
    uint64_t v26 = (void *)v24;
    uint64_t v27 = [(USUsageAccumulator *)v25 notifications];
    uint64_t v28 = [MEMORY[0x263EFFA18] localTimeZone];
    id v12 = v36;
    id v6 = v39;
    id v22 = +[USUsageQuerying _newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:](USUsageQuerying, "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v13, v42, v34, v35, v16, v33, v41, v40, v31, v30, v29, v26, v27, v39,
            v28,
            v36);

    [(USUsageAccumulator *)v32 _resetAggregations];
    id v10 = v37;
    BOOL v7 = v38;
  }
  else
  {
    id v22 = +[USUsageReport emptyReportForInterval:v6];
  }
  v7[2](v7, v22);
}

- (void)_resetAggregations
{
  v3 = [(USUsageAccumulator *)self backlightIntervals];
  [v3 removeAllObjects];

  BOOL v4 = [(USUsageAccumulator *)self applicationUsageIntervals];
  [v4 removeAllObjects];

  id v5 = [(USUsageAccumulator *)self webUsageIntervals];
  [v5 removeAllObjects];

  id v6 = [(USUsageAccumulator *)self categoryUsageIntervals];
  [v6 removeAllObjects];

  BOOL v7 = [(USUsageAccumulator *)self canonicalApplicationUsageIntervals];
  [v7 removeAllObjects];

  BOOL v8 = [(USUsageAccumulator *)self primaryWebUsageIntervals];
  [v8 removeAllObjects];

  uint64_t v9 = [(USUsageAccumulator *)self notifications];
  [v9 removeAllObjects];

  [(USUsageAccumulator *)self setLastEventDate:0];
}

- (void)_aggregateApplicationUsageInterval:(id)a3 identifier:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v47 = self;
  BOOL v8 = [(USUsageAccumulator *)self applicationUsageIntervals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v13 = v12;
  id v14 = v6;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v45 = v14;
    id v46 = v7;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v50;
    do
    {
      uint64_t v19 = 0;
      uint64_t v48 = v16;
      do
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v13);
        }
        double v20 = *(void **)(*((void *)&v49 + 1) + 8 * v19);
        if ([v20 intersectsDateInterval:v14])
        {
          id v21 = v13;
          id v22 = [v20 startDate];
          id v23 = [v14 startDate];
          uint64_t v24 = [v22 earlierDate:v23];

          v25 = [v20 endDate];
          [v14 endDate];
          v27 = uint64_t v26 = v17;
          uint64_t v28 = [v25 laterDate:v27];

          uint64_t v17 = v26;
          uint64_t v29 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v24 endDate:v28];

          if (v26) {
            [v26 addObject:v20];
          }
          else {
            uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v20, 0);
          }

          id v14 = (id)v29;
          id v13 = v21;
          uint64_t v16 = v48;
        }
        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v16);
    id v7 = v46;
    if (v17) {
      [v13 removeObjectsInArray:v17];
    }
    int v30 = v47;
    v31 = v45;
  }
  else
  {
    uint64_t v17 = 0;
    v31 = v14;
    int v30 = v47;
  }
  [v13 addObject:v14];

  uint64_t v32 = [(USUsageAccumulator *)v30 applicationUsageIntervals];
  [v32 setObject:v13 forKeyedSubscript:v7];

  uint64_t v33 = [(USUsageAccumulator *)v30 applicationCategories];
  uint64_t v34 = [v7 identifier];
  id v35 = [v33 objectForKeyedSubscript:v34];

  uint64_t v36 = [v35 identifier];
  long long v37 = (void *)v36;
  v38 = (void *)*MEMORY[0x263F31838];
  if (v36) {
    v38 = (void *)v36;
  }
  id v39 = v38;

  [(USUsageAccumulator *)v30 _aggregateCategoryUsageInterval:v31 identifier:v39];
  v40 = [v35 canonicalBundleIdentifier];
  v41 = v40;
  if (v40)
  {
    id v42 = v40;
  }
  else
  {
    id v42 = [v7 identifier];
  }
  id v43 = v42;

  long long v44 = [[USTrustIdentifier alloc] initWithIdentifier:v43 trusted:1];
  [(USUsageAccumulator *)v30 _aggregateCanonicalApplicationUsageInterval:v31 canonicalIdentifier:v44];
}

- (void)_aggregateAppMediaUsage:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 bundleID];
  if ([v6 starting] && v8)
  {
    uint64_t v9 = [v6 absoluteTimestamp];
    if ([v9 compare:v7] == 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        -[USUsageAccumulator _aggregateAppMediaUsage:timestamp:]();
      }
    }
    else
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v7];
      uint64_t v11 = [v6 isUsageTrusted];
      id v12 = [[USTrustIdentifier alloc] initWithIdentifier:v8 trusted:v11];
      [(USUsageAccumulator *)self _aggregateApplicationUsageInterval:v10 identifier:v12];
      id v13 = [v6 URL];
      if (v13)
      {
        id v21 = self;
        id v14 = v12;
        uint64_t v15 = v10;
        uint64_t v16 = v11;
        uint64_t v17 = (void *)[objc_alloc(NSURL) initWithString:v13];
        uint64_t v18 = [v17 host];

        uint64_t v19 = v16;
        id v10 = v15;
        id v12 = v14;
        if (v18)
        {
          double v20 = [[USTrustIdentifier alloc] initWithIdentifier:v18 trusted:v19];
          [(USUsageAccumulator *)v21 _aggregateWebUsageInterval:v10 identifier:v20];
        }
      }
    }
  }
}

- (void)_aggregateWebUsageInterval:(id)a3 identifier:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v45 = self;
  BOOL v8 = [(USUsageAccumulator *)self webUsageIntervals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v13 = v12;
  id v14 = v6;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v43 = v14;
    id v44 = v7;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v48;
    uint64_t v19 = v14;
    do
    {
      uint64_t v20 = 0;
      uint64_t v46 = v16;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v13);
        }
        id v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
        if ([v21 intersectsDateInterval:v19])
        {
          id v22 = v13;
          id v23 = [v21 startDate];
          uint64_t v24 = [v19 startDate];
          v25 = [v23 earlierDate:v24];

          uint64_t v26 = [v21 endDate];
          [v19 endDate];
          uint64_t v28 = v27 = v17;
          uint64_t v29 = [v26 laterDate:v28];

          uint64_t v17 = v27;
          uint64_t v30 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v25 endDate:v29];

          if (v27) {
            [v27 addObject:v21];
          }
          else {
            uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v21, 0);
          }

          uint64_t v19 = (void *)v30;
          id v13 = v22;
          uint64_t v16 = v46;
        }
        ++v20;
      }
      while (v16 != v20);
      uint64_t v16 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v16);
    id v7 = v44;
    if (v17) {
      [v13 removeObjectsInArray:v17];
    }
    v31 = v45;
    id v14 = v43;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = v14;
    v31 = v45;
  }
  [v13 addObject:v19];

  uint64_t v32 = [(USUsageAccumulator *)v31 webUsageIntervals];
  [v32 setObject:v13 forKeyedSubscript:v7];

  uint64_t v33 = [(USUsageAccumulator *)v31 webCategories];
  uint64_t v34 = [v7 identifier];
  id v35 = [v33 objectForKeyedSubscript:v34];

  uint64_t v36 = [v35 identifier];
  long long v37 = (void *)v36;
  v38 = (void *)*MEMORY[0x263F31838];
  if (v36) {
    v38 = (void *)v36;
  }
  id v39 = v38;

  [(USUsageAccumulator *)v31 _aggregateCategoryUsageInterval:v14 identifier:v39];
  v40 = [v35 canonicalBundleIdentifier];
  if (v40)
  {
    v41 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v40, [v7 trusted]);
    [(USUsageAccumulator *)v31 _aggregateCanonicalApplicationUsageInterval:v14 canonicalIdentifier:v41];
  }
  else
  {
    v41 = [v35 primaryWebDomain];
    if (v41)
    {
      id v42 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v41, [v7 trusted]);
      [(USUsageAccumulator *)v31 _aggregatePrimaryWebUsageInterval:v14 primaryIdentifier:v42];
    }
  }
}

- (void)_aggregateCategoryUsageInterval:(id)a3 identifier:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = self;
  BOOL v8 = [(USUsageAccumulator *)self categoryUsageIntervals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v13 = v12;
  id v14 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v30 = v14;
    id v31 = v7;
    uint64_t v33 = 0;
    uint64_t v17 = *(void *)v35;
    uint64_t v18 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v20 intersectsDateInterval:v18])
        {
          id v21 = [v20 startDate];
          id v22 = [v18 startDate];
          id v23 = [v21 earlierDate:v22];

          uint64_t v24 = [v20 endDate];
          v25 = [v18 endDate];
          uint64_t v26 = [v24 laterDate:v25];

          uint64_t v27 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v23 endDate:v26];
          if (v33) {
            [v33 addObject:v20];
          }
          else {
            uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v20, 0);
          }

          uint64_t v18 = (void *)v27;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
    id v7 = v31;
    uint64_t v28 = v33;
    if (v33) {
      [v13 removeObjectsInArray:v33];
    }
    id v14 = v30;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v18 = v14;
  }
  [v13 addObject:v18];

  uint64_t v29 = [(USUsageAccumulator *)v32 categoryUsageIntervals];
  [v29 setObject:v13 forKeyedSubscript:v7];
}

- (void)_aggregateCanonicalApplicationUsageInterval:(id)a3 canonicalIdentifier:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = self;
  BOOL v8 = [(USUsageAccumulator *)self canonicalApplicationUsageIntervals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v13 = v12;
  id v14 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v30 = v14;
    id v31 = v7;
    uint64_t v33 = 0;
    uint64_t v17 = *(void *)v35;
    uint64_t v18 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v20 intersectsDateInterval:v18])
        {
          id v21 = [v20 startDate];
          id v22 = [v18 startDate];
          id v23 = [v21 earlierDate:v22];

          uint64_t v24 = [v20 endDate];
          v25 = [v18 endDate];
          uint64_t v26 = [v24 laterDate:v25];

          uint64_t v27 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v23 endDate:v26];
          if (v33) {
            [v33 addObject:v20];
          }
          else {
            uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v20, 0);
          }

          uint64_t v18 = (void *)v27;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
    id v7 = v31;
    uint64_t v28 = v33;
    if (v33) {
      [v13 removeObjectsInArray:v33];
    }
    id v14 = v30;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v18 = v14;
  }
  [v13 addObject:v18];

  uint64_t v29 = [(USUsageAccumulator *)v32 canonicalApplicationUsageIntervals];
  [v29 setObject:v13 forKeyedSubscript:v7];
}

- (void)_aggregatePrimaryWebUsageInterval:(id)a3 primaryIdentifier:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = self;
  BOOL v8 = [(USUsageAccumulator *)self primaryWebUsageIntervals];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  id v13 = v12;
  id v14 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v30 = v14;
    id v31 = v7;
    uint64_t v33 = 0;
    uint64_t v17 = *(void *)v35;
    uint64_t v18 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v20 intersectsDateInterval:v18])
        {
          id v21 = [v20 startDate];
          id v22 = [v18 startDate];
          id v23 = [v21 earlierDate:v22];

          uint64_t v24 = [v20 endDate];
          v25 = [v18 endDate];
          uint64_t v26 = [v24 laterDate:v25];

          uint64_t v27 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v23 endDate:v26];
          if (v33) {
            [v33 addObject:v20];
          }
          else {
            uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v20, 0);
          }

          uint64_t v18 = (void *)v27;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
    id v7 = v31;
    uint64_t v28 = v33;
    if (v33) {
      [v13 removeObjectsInArray:v33];
    }
    id v14 = v30;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v18 = v14;
  }
  [v13 addObject:v18];

  uint64_t v29 = [(USUsageAccumulator *)v32 primaryWebUsageIntervals];
  [v29 setObject:v13 forKeyedSubscript:v7];
}

- (void)_stopAllUsageWithEndDate:(id)a3
{
  id v4 = a3;
  id v5 = [(USUsageAccumulator *)self applicationUsageStartDates];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke;
  v27[3] = &unk_26431E488;
  id v6 = v4;
  id v28 = v6;
  uint64_t v29 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v27];

  id v7 = [(USUsageAccumulator *)self applicationUsageStartDates];
  [v7 removeAllObjects];

  BOOL v8 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_16;
  v24[3] = &unk_26431E050;
  id v9 = v6;
  id v25 = v9;
  uint64_t v26 = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v24];

  id v10 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  [v10 removeAllObjects];

  id v11 = [(USUsageAccumulator *)self mediaUsageByUniqueID];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_18;
  id v21 = &unk_26431E4B0;
  id v22 = self;
  id v12 = v9;
  id v23 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:&v18];

  id v13 = [(USUsageAccumulator *)self mediaUsageByUniqueID];
  [v13 removeAllObjects];

  id v14 = [(USUsageAccumulator *)self mediaNowPlayingStartDate];
  uint64_t v15 = v14;
  if (v14)
  {
    if ([v14 compare:v12] == 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        -[USUsageAccumulator _accumulateMediaNowPlayingWithTimestamp:starting:]();
      }
    }
    else
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v15 endDate:v12];
      [(USUsageAccumulator *)self _aggregateCategoryUsageInterval:v16 identifier:*MEMORY[0x263F31820]];
    }
  }
  [(USUsageAccumulator *)self setMediaNowPlayingStartDate:0];
  uint64_t v17 = [(USUsageAccumulator *)self webUsageStateByUniqueID];
  [v17 removeAllObjects];
}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    id v11 = MEMORY[0x263EF8438];
    *(void *)&long long v8 = 138543874;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(void *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            id v14 = [v5 identifier];
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v17;
            id v23 = v14;
            __int16 v24 = 2114;
            id v25 = v13;
            __int16 v26 = 2114;
            uint64_t v27 = v15;
            _os_log_fault_impl(&dword_218373000, v11, OS_LOG_TYPE_FAULT, "Application %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) _aggregateApplicationUsageInterval:v16 identifier:v5];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_2;
  v7[3] = &unk_26431E488;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    id v11 = MEMORY[0x263EF8438];
    *(void *)&long long v8 = 138543874;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(void *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            id v14 = [v5 identifier];
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v17;
            id v23 = v14;
            __int16 v24 = 2114;
            id v25 = v13;
            __int16 v26 = 2114;
            uint64_t v27 = v15;
            _os_log_fault_impl(&dword_218373000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) _aggregateWebUsageInterval:v16 identifier:v5];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

uint64_t __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _aggregateAppMediaUsage:a3 timestamp:*(void *)(a1 + 40)];
}

- (void)_stopAllWebUsageForWebBrowser:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __60__USUsageAccumulator__stopAllWebUsageForWebBrowser_endDate___block_invoke;
  uint64_t v15 = &unk_26431E488;
  id v16 = v6;
  long long v17 = self;
  id v10 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:&v12];

  id v11 = [(USUsageAccumulator *)self webUsageStartDatesByWebBrowser];
  [v11 setObject:0 forKeyedSubscript:v7];
}

void __60__USUsageAccumulator__stopAllWebUsageForWebBrowser_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    id v11 = MEMORY[0x263EF8438];
    *(void *)&long long v8 = 138543874;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(void *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            id v14 = [v5 identifier];
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v17;
            id v23 = v14;
            __int16 v24 = 2114;
            id v25 = v13;
            __int16 v26 = 2114;
            uint64_t v27 = v15;
            _os_log_fault_impl(&dword_218373000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) _aggregateWebUsageInterval:v16 identifier:v5];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)_aggregateStartDatesUsingEndDate:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v45 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v46 = [(USUsageAccumulator *)self backlightStartDate];
  long long v48 = self;
  if (v46)
  {
    if ([v46 compare:v45] == 1)
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
      {
LABEL_22:
        [(USUsageAccumulator *)self setBacklightStartDate:v45];
        *((unsigned char *)v69 + 24) = 1;
        goto LABEL_23;
      }
      -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:]();
    }
    else
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v46 endDate:v45];
      id v5 = [(USUsageAccumulator *)self backlightIntervals];
      id v44 = v4;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = v5;
      uint64_t v6 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v6)
      {
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)v73;
        uint64_t v9 = v44;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v73 != v8) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if ([v11 intersectsDateInterval:v9])
            {
              uint64_t v12 = [v11 startDate];
              uint64_t v13 = [v9 startDate];
              id v14 = [v12 earlierDate:v13];

              uint64_t v15 = [v11 endDate];
              id v16 = [v9 endDate];
              long long v17 = [v15 laterDate:v16];

              uint64_t v18 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 endDate:v17];
              if (v7) {
                [v7 addObject:v11];
              }
              else {
                uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v11, 0);
              }

              uint64_t v9 = (void *)v18;
            }
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
        }
        while (v6);

        if (v7) {
          [obj removeObjectsInArray:v7];
        }
      }
      else
      {

        uint64_t v7 = 0;
        uint64_t v9 = v44;
      }
      [obj addObject:v9];
    }
    self = v48;
    goto LABEL_22;
  }
LABEL_23:
  long long v19 = objc_opt_new();
  long long v20 = [(USUsageAccumulator *)self applicationUsageStartDates];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke;
  v64[3] = &unk_26431E4D8;
  id v21 = v45;
  id v65 = v21;
  v66 = self;
  id v22 = v19;
  id v67 = v22;
  [v20 enumerateKeysAndObjectsUsingBlock:v64];

  id v23 = [(USUsageAccumulator *)v48 applicationUsageStartDates];
  [v23 removeAllObjects];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v61 != v26) {
          objc_enumerationMutation(v24);
        }
        id v28 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        uint64_t v29 = [v28 identifier];
        -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:](v48, "_accumulateApplication:timestamp:starting:isUsageTrusted:", v29, v21, 1, [v28 trusted]);

        *((unsigned char *)v69 + 24) = 1;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v25);
  }

  id v30 = objc_opt_new();
  id v31 = [(USUsageAccumulator *)v48 webUsageStartDatesByWebBrowser];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_21;
  v56[3] = &unk_26431E000;
  id v32 = v21;
  id v57 = v32;
  v58 = v48;
  id v33 = v30;
  id v59 = v33;
  [v31 enumerateKeysAndObjectsUsingBlock:v56];

  long long v34 = [(USUsageAccumulator *)v48 webUsageStartDatesByWebBrowser];
  [v34 removeAllObjects];

  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_22;
  v53[3] = &unk_26431E528;
  v53[4] = v48;
  id v35 = v32;
  id v54 = v35;
  v55 = &v68;
  [v33 enumerateKeysAndObjectsUsingBlock:v53];
  long long v36 = objc_opt_new();
  long long v37 = [(USUsageAccumulator *)v48 mediaUsageByUniqueID];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2_23;
  v49[3] = &unk_26431E550;
  v49[4] = v48;
  id v38 = v35;
  id v50 = v38;
  id v39 = v36;
  id v51 = v39;
  uint64_t v52 = &v68;
  [v37 enumerateKeysAndObjectsUsingBlock:v49];

  v40 = v48;
  [(USUsageAccumulator *)v48 setMediaUsageByUniqueID:v39];
  v41 = [(USUsageAccumulator *)v48 mediaNowPlayingStartDate];
  id v42 = v41;
  if (!v41)
  {
    if (!*((unsigned char *)v69 + 24)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if ([v41 compare:v38] != 1)
  {
    id v43 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v42 endDate:v38];
    [(USUsageAccumulator *)v48 _aggregateCategoryUsageInterval:v43 identifier:*MEMORY[0x263F31820]];

    goto LABEL_37;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
  {
    -[USUsageAccumulator _aggregateStartDatesUsingEndDate:]();
LABEL_37:
    v40 = v48;
  }
  [(USUsageAccumulator *)v40 setMediaNowPlayingStartDate:v38];
  *((unsigned char *)v69 + 24) = 1;
LABEL_39:
  [(USUsageAccumulator *)v40 setLastEventDate:v38];
LABEL_40:

  _Block_object_dispose(&v68, 8);
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    id v11 = MEMORY[0x263EF8438];
    *(void *)&long long v8 = 138543874;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(void *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            id v14 = [v5 identifier];
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v17;
            id v23 = v14;
            __int16 v24 = 2114;
            uint64_t v25 = v13;
            __int16 v26 = 2114;
            uint64_t v27 = v15;
            _os_log_fault_impl(&dword_218373000, v11, OS_LOG_TYPE_FAULT, "Application %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) _aggregateApplicationUsageInterval:v16 identifier:v5];
        }
        [*(id *)(a1 + 48) addObject:v5];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2;
  v10[3] = &unk_26431E500;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  long long v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v14 = v5;
  id v9 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    id v11 = MEMORY[0x263EF8438];
    *(void *)&long long v8 = 138543874;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(void *)(a1 + 32), v21) == 1
          && os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          long long v19 = [v5 identifier];
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)buf = v21;
          uint64_t v27 = v19;
          __int16 v28 = 2114;
          uint64_t v29 = v13;
          __int16 v30 = 2114;
          uint64_t v31 = v20;
          _os_log_fault_impl(&dword_218373000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);
        }
        id v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) _aggregateWebUsageInterval:v14 identifier:v5];

        uint64_t v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
        id v16 = v15;
        if (v15) {
          id v17 = v15;
        }
        else {
          id v17 = (id)objc_opt_new();
        }
        long long v18 = v17;

        [v18 addObject:v5];
        [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:*(void *)(a1 + 56)];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_22(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = (void *)a1[4];
        uint64_t v12 = [v10 identifier];
        id v13 = [v5 identifier];
        objc_msgSend(v11, "_accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:", v12, v13, a1[5], 1, objc_msgSend(v10, "trusted"));

        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  [v5 _aggregateAppMediaUsage:v7 timestamp:v6];
  id v17 = objc_alloc(MEMORY[0x263F29FD0]);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "starting"));
  uint64_t v10 = [v7 bundleID];
  id v11 = [v7 URL];
  uint64_t v12 = [v7 mediaURL];
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isUsageTrusted"));
  uint64_t v14 = *(void *)(a1 + 40);
  long long v15 = [v7 safariProfileID];

  long long v16 = (void *)[v17 initWithStarting:v9 bundleID:v10 URL:v11 mediaURL:v12 isUsageTrusted:v13 absoluteTimestamp:v14 safariProfileID:v15 uniqueID:v8];
  [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v8];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (NSDictionary)applicationCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)webCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)backlightStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBacklightStartDate:(id)a3
{
}

- (NSMutableDictionary)applicationUsageStartDates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)webUsageStartDatesByWebBrowser
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)mediaNowPlayingStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMediaNowPlayingStartDate:(id)a3
{
}

- (NSMutableDictionary)webUsageStateByUniqueID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (int)quickLookVideoNowPlayingState
{
  return self->_quickLookVideoNowPlayingState;
}

- (void)setQuickLookVideoNowPlayingState:(int)a3
{
  self->_quickLookVideoNowPlayingState = a3;
}

- (NSMutableDictionary)mediaUsageByUniqueID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMediaUsageByUniqueID:(id)a3
{
}

- (NSMutableArray)backlightIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)applicationUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)webUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableDictionary)categoryUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableDictionary)canonicalApplicationUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableDictionary)primaryWebUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableDictionary)notifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)lastEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastEventDate:(id)a3
{
}

- (BOOL)isStandByEnabled
{
  return self->_standByEnabled;
}

- (void)setStandByEnabled:(BOOL)a3
{
  self->_standByEnabled = a3;
}

- (BOOL)isDeviceBacklit
{
  return self->_deviceBacklit;
}

- (void)setDeviceBacklit:(BOOL)a3
{
  self->_deviceBacklit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_primaryWebUsageIntervals, 0);
  objc_storeStrong((id *)&self->_canonicalApplicationUsageIntervals, 0);
  objc_storeStrong((id *)&self->_categoryUsageIntervals, 0);
  objc_storeStrong((id *)&self->_webUsageIntervals, 0);
  objc_storeStrong((id *)&self->_applicationUsageIntervals, 0);
  objc_storeStrong((id *)&self->_backlightIntervals, 0);
  objc_storeStrong((id *)&self->_mediaUsageByUniqueID, 0);
  objc_storeStrong((id *)&self->_webUsageStateByUniqueID, 0);
  objc_storeStrong((id *)&self->_mediaNowPlayingStartDate, 0);
  objc_storeStrong((id *)&self->_webUsageStartDatesByWebBrowser, 0);
  objc_storeStrong((id *)&self->_applicationUsageStartDates, 0);
  objc_storeStrong((id *)&self->_backlightStartDate, 0);
  objc_storeStrong((id *)&self->_webCategories, 0);
  objc_storeStrong((id *)&self->_applicationCategories, 0);
}

- (void)accumulateEvent:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Received unexpected event type: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateAppUsage:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Received malformed app usage event: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateAppMediaUsage:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Received malformed app media usage event: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateAppWebUsage:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Received malformed app web usage event: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateDeviceBacklightWithIsBacklit:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_218373000, MEMORY[0x263EF8438], v0, "Backlight start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateNotificationUsage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_218373000, MEMORY[0x263EF8438], v0, "Received notification usage event without bundle identifier: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateApplication:timestamp:starting:isUsageTrusted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218373000, MEMORY[0x263EF8438], v0, "Received end event at %{public}@ for %{public}@ that is earlier than its start date: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_accumulateWebDomain:(uint64_t)a1 bundleIdentifier:(void *)a2 timestamp:starting:isUsageTrusted:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218373000, MEMORY[0x263EF8438], v3, "Received end event at %{public}@ for %{public}@ that is earlier than its start date: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_accumulateMediaNowPlayingWithTimestamp:starting:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_218373000, MEMORY[0x263EF8438], v0, "Media now playing start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_aggregateAppMediaUsage:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218373000, MEMORY[0x263EF8438], v0, "Received media usage end event at %{public}@ for %{public}@ that is earlier than its start date: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_aggregateStartDatesUsingEndDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_218373000, MEMORY[0x263EF8438], v0, "Media %{public}@ start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, 2u);
}

@end