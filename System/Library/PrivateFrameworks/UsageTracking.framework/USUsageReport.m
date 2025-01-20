@interface USUsageReport
+ (BOOL)supportsSecureCoding;
+ (id)emptyReportForInterval:(id)a3;
- (NSArray)categoryUsage;
- (NSDate)firstPickup;
- (NSDate)lastEventDate;
- (NSDateInterval)interval;
- (NSDateInterval)longestSession;
- (NSDictionary)pickupsByBundleIdentifier;
- (NSDictionary)userNotificationsByBundleIdentifier;
- (NSTimeZone)timeZone;
- (USUsageReport)initWithCoder:(id)a3;
- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 notifications:(id)a6 pickupsByBundleIdentifier:(id)a7 pickupsWithoutApplicationUsage:(unint64_t)a8 firstPickup:(id)a9 interval:(id)a10 timeZone:(id)a11 lastEventDate:(id)a12;
- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10;
- (double)screenTime;
- (id)_addNotifications:(id)a3 andPickups:(id)a4 toApplicationUsageInCategoryUsage:(id)a5;
- (id)description;
- (unint64_t)pickupsWithoutApplicationUsage;
- (void)_usUsageReportCommonInitWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USUsageReport

- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 notifications:(id)a6 pickupsByBundleIdentifier:(id)a7 pickupsWithoutApplicationUsage:(unint64_t)a8 firstPickup:(id)a9 interval:(id)a10 timeZone:(id)a11 lastEventDate:(id)a12
{
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a9;
  id v24 = a4;
  v25 = [(USUsageReport *)self _addNotifications:a6 andPickups:a7 toApplicationUsageInCategoryUsage:a5];
  v26 = [(USUsageReport *)self initWithScreenTime:v24 longestSession:v25 categoryUsage:a8 pickupsWithoutApplicationUsage:v23 firstPickup:v22 interval:v21 timeZone:a3 lastEventDate:v20];

  return v26;
}

- (id)_addNotifications:(id)a3 andPickups:(id)a4 toApplicationUsageInCategoryUsage:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)[a3 mutableCopy];
  v41 = v7;
  v10 = (void *)[v7 mutableCopy];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v11 = v8;
  uint64_t v44 = [v11 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v58;
    v43 = v11;
    unint64_t v12 = 0x263EFF000uLL;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v58 != v42) {
          objc_enumerationMutation(v11);
        }
        uint64_t v45 = v13;
        v14 = *(void **)(*((void *)&v57 + 1) + 8 * v13);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id obj = [v14 applicationUsage];
        uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v47 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v54 != v47) {
                objc_enumerationMutation(obj);
              }
              v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v19 = [v18 canonicalBundleIdentifier];
              uint64_t v20 = [v9 objectForKeyedSubscript:v19];
              id v21 = (void *)v20;
              if (v20)
              {
                v63 = v19;
                uint64_t v64 = v20;
                id v22 = [*(id *)(v12 + 2352) dictionaryWithObjects:&v64 forKeys:&v63 count:1];
                [v18 setUserNotificationsByBundleIdentifier:v22];

                [v9 setObject:0 forKeyedSubscript:v19];
              }
              uint64_t v23 = [v10 objectForKeyedSubscript:v19];
              id v24 = (void *)v23;
              if (v23)
              {
                v61 = v19;
                uint64_t v62 = v23;
                [*(id *)(v12 + 2352) dictionaryWithObjects:&v62 forKeys:&v61 count:1];
                v25 = v10;
                v26 = v9;
                v28 = unint64_t v27 = v12;
                [v18 setPickupsByBundleIdentifier:v28];

                unint64_t v12 = v27;
                v9 = v26;
                v10 = v25;
                [v25 setObject:0 forKeyedSubscript:v19];
              }
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
          }
          while (v16);
        }

        uint64_t v13 = v45 + 1;
        id v11 = v43;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v44);
  }

  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    uint64_t v29 = [v11 indexOfObjectPassingTest:&__block_literal_global_1];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = [USCategoryUsageReport alloc];
      v31 = [(USCategoryUsageReport *)v30 initWithCategoryIdentifier:*MEMORY[0x263F31838] totalUsageTime:MEMORY[0x263EFFA68] applicationUsage:MEMORY[0x263EFFA68] webUsage:0.0];
      v32 = [v11 arrayByAddingObject:v31];
    }
    else
    {
      v31 = [v11 objectAtIndexedSubscript:v29];
      v32 = 0;
    }
    v33 = [(USCategoryUsageReport *)v31 applicationUsage];
    v34 = (void *)[v33 mutableCopy];

    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_2;
    v50[3] = &unk_26431E658;
    id v35 = v10;
    id v51 = v35;
    id v36 = v34;
    id v52 = v36;
    [v9 enumerateKeysAndObjectsUsingBlock:v50];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_3;
    v48[3] = &unk_26431DF10;
    id v49 = v36;
    id v37 = v36;
    [v35 enumerateKeysAndObjectsUsingBlock:v48];
    [(USCategoryUsageReport *)v31 setApplicationUsage:v37];
  }
  else
  {
    v32 = 0;
  }
  if (v32) {
    v38 = v32;
  }
  else {
    v38 = v11;
  }
  id v39 = v38;

  return v39;
}

uint64_t __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 categoryIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F31838]];

  return v3;
}

void __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = (void *)v7;
  if (v7)
  {
    id v16 = v5;
    v17[0] = v7;
    v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFFA78];
  }
  v10 = *(void **)(a1 + 40);
  id v11 = [USApplicationUsageReport alloc];
  id v14 = v5;
  id v15 = v6;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  uint64_t v13 = [(USApplicationUsageReport *)v11 initWithCanonicalBundleIdentifier:v5 applicationUsageTrusted:1 totalUsageTime:MEMORY[0x263EFFA78] applicationUsageByBundleIdentifier:MEMORY[0x263EFFA78] webUsageByDomain:v12 userNotificationsByBundleIdentifier:v9 pickupsByBundleIdentifier:0.0];
  [v10 addObject:v13];

  [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v5];
}

void __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [USApplicationUsageReport alloc];
  id v10 = v6;
  v11[0] = v5;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = [(USApplicationUsageReport *)v7 initWithCanonicalBundleIdentifier:v6 applicationUsageTrusted:1 totalUsageTime:MEMORY[0x263EFFA78] applicationUsageByBundleIdentifier:MEMORY[0x263EFFA78] webUsageByDomain:MEMORY[0x263EFFA78] userNotificationsByBundleIdentifier:v8 pickupsByBundleIdentifier:0.0];
  [v4 addObject:v9];
}

- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10
{
  v25.receiver = self;
  v25.super_class = (Class)USUsageReport;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  uint64_t v23 = [(USUsageReport *)&v25 init];
  [(USUsageReport *)v23 _usUsageReportCommonInitWithScreenTime:v22 longestSession:v21 categoryUsage:a6 pickupsWithoutApplicationUsage:v20 firstPickup:v19 interval:v18 timeZone:a3 lastEventDate:v17];

  return v23;
}

- (void)_usUsageReportCommonInitWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10
{
  self->_screenTime = a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = (NSDateInterval *)[a4 copy];
  longestSession = self->_longestSession;
  self->_longestSession = v22;

  id v24 = (NSArray *)[v21 copy];
  categoryUsage = self->_categoryUsage;
  self->_categoryUsage = v24;

  self->_pickupsWithoutApplicationUsage = a6;
  v26 = (NSDate *)[v20 copy];

  firstPickup = self->_firstPickup;
  self->_firstPickup = v26;

  v28 = (NSDateInterval *)[v19 copy];
  interval = self->_interval;
  self->_interval = v28;

  v30 = (NSTimeZone *)[v18 copy];
  timeZone = self->_timeZone;
  self->_timeZone = v30;

  v32 = (NSDate *)[v17 copy];
  lastEventDate = self->_lastEventDate;
  self->_lastEventDate = v32;
}

- (USUsageReport)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"CategoryUsage"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Interval"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeZone"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEventDate"];
  unint64_t v12 = (void *)v11;
  if (v8
    && v9
    && v10
    && v11
    && [v4 containsValueForKey:@"LongestSession"]
    && [v4 containsValueForKey:@"ScreenTime"]
    && [v4 containsValueForKey:@"PickupsWithoutApplicationUsage"]
    && [v4 containsValueForKey:@"FirstPickup"])
  {
    v32.receiver = self;
    v32.super_class = (Class)USUsageReport;
    uint64_t v13 = [(USUsageReport *)&v32 init];
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LongestSession"];
    [v4 decodeDoubleForKey:@"ScreenTime"];
    double v16 = v15;
    uint64_t v31 = [v4 decodeIntegerForKey:@"PickupsWithoutApplicationUsage"];
    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstPickup"];
    if (([v4 containsValueForKey:@"ApplicationUsageIncludesPickupsAndNotifications"] & 1) == 0)
    {
      uint64_t v29 = v14;
      v30 = v13;
      id v18 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      id v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
      id v22 = [v4 decodeObjectOfClasses:v21 forKey:@"UserNotificationsByBundleIdentifier"];
      uint64_t v23 = [v4 decodeObjectOfClasses:v21 forKey:@"PickupsByBundleIdentifier"];
      id v24 = (void *)v23;
      if (v22 && v23)
      {
        uint64_t v28 = [(USUsageReport *)v30 _addNotifications:v22 andPickups:v23 toApplicationUsageInCategoryUsage:v8];

        id v8 = (void *)v28;
      }

      id v14 = v29;
      uint64_t v13 = v30;
    }
    [(USUsageReport *)v13 _usUsageReportCommonInitWithScreenTime:v14 longestSession:v8 categoryUsage:v31 pickupsWithoutApplicationUsage:v17 firstPickup:v9 interval:v10 timeZone:v16 lastEventDate:v12];

    self = v13;
    objc_super v25 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v34 = v8;
      __int16 v35 = 2114;
      id v36 = v9;
      __int16 v37 = 2114;
      v38 = v10;
      __int16 v39 = 2114;
      v40 = v12;
      _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to decode USUsageReport with categoryUsage: %{public}@, interval: %{public}@, timeZone: %{public}@, lastEventDate: %{public}@", buf, 0x2Au);
    }
    v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4865 userInfo:0];
    [v4 failWithError:v26];

    objc_super v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  double screenTime = self->_screenTime;
  id v5 = a3;
  [v5 encodeDouble:@"ScreenTime" forKey:screenTime];
  [v5 encodeObject:self->_longestSession forKey:@"LongestSession"];
  [v5 encodeObject:self->_categoryUsage forKey:@"CategoryUsage"];
  [v5 encodeInteger:self->_pickupsWithoutApplicationUsage forKey:@"PickupsWithoutApplicationUsage"];
  [v5 encodeObject:self->_firstPickup forKey:@"FirstPickup"];
  [v5 encodeObject:self->_interval forKey:@"Interval"];
  [v5 encodeObject:self->_timeZone forKey:@"TimeZone"];
  [v5 encodeObject:self->_lastEventDate forKey:@"LastEventDate"];
  [v5 encodeBool:1 forKey:@"ApplicationUsageIncludesPickupsAndNotifications"];
  uint64_t v6 = [(USUsageReport *)self userNotificationsByBundleIdentifier];
  [v5 encodeObject:v6 forKey:@"UserNotificationsByBundleIdentifier"];

  id v7 = [(USUsageReport *)self pickupsByBundleIdentifier];
  [v5 encodeObject:v7 forKey:@"PickupsByBundleIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)userNotificationsByBundleIdentifier
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(USUsageReport *)self categoryUsage];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = objc_msgSend(v9, "applicationUsage", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) userNotificationsByBundleIdentifier];
              [v3 addEntriesFromDictionary:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)pickupsByBundleIdentifier
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(USUsageReport *)self categoryUsage];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = objc_msgSend(v9, "applicationUsage", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) pickupsByBundleIdentifier];
              [v3 addEntriesFromDictionary:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)USUsageReport;
  id v4 = [(USUsageReport *)&v16 description];
  [(USUsageReport *)self screenTime];
  uint64_t v6 = v5;
  uint64_t v7 = [(USUsageReport *)self longestSession];
  id v8 = [(USUsageReport *)self categoryUsage];
  unint64_t v9 = [(USUsageReport *)self pickupsWithoutApplicationUsage];
  id v10 = [(USUsageReport *)self firstPickup];
  uint64_t v11 = [(USUsageReport *)self interval];
  uint64_t v12 = [(USUsageReport *)self timeZone];
  uint64_t v13 = [(USUsageReport *)self lastEventDate];
  id v14 = [v3 stringWithFormat:@"%@, ScreenTime: %f, LongestSession: %@, CategoryUsage: %@\nPickupsWithoutApplicationUsage: %lu, First Pickup: %@, Interval: %@, TimeZone: %@, LastEventDate: %@", v4, v6, v7, v8, v9, v10, v11, v12, v13];

  return v14;
}

+ (id)emptyReportForInterval:(id)a3
{
  id v3 = a3;
  id v4 = [USUsageReport alloc];
  uint64_t v5 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v6 = [v3 startDate];
  uint64_t v7 = [(USUsageReport *)v4 initWithScreenTime:0 longestSession:MEMORY[0x263EFFA68] categoryUsage:0 pickupsWithoutApplicationUsage:0 firstPickup:v3 interval:v5 timeZone:0.0 lastEventDate:v6];

  return v7;
}

- (double)screenTime
{
  return self->_screenTime;
}

- (NSDateInterval)longestSession
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)categoryUsage
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)pickupsWithoutApplicationUsage
{
  return self->_pickupsWithoutApplicationUsage;
}

- (NSDate)firstPickup
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDateInterval)interval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 48, 1);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_firstPickup, 0);
  objc_storeStrong((id *)&self->_categoryUsage, 0);
  objc_storeStrong((id *)&self->_longestSession, 0);
}

@end