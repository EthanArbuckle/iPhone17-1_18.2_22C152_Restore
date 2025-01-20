@interface STBlueprintUsageLimit
+ (id)keyPathsForValuesAffectingBudgetLimitScheduleRepresentation;
+ (id)limitKeyPaths;
- (BOOL)_validateBlueprint:(id)a3;
- (BOOL)_validateIdentifiers:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (STBlueprintUsageLimitScheduleRepresentation)budgetLimitScheduleRepresentation;
- (id)dictionaryRepresentation;
- (void)_usageLimitDidChangeFromOldApplicationIdentifiers:(id)a3 oldCategoryIdentifiers:(id)a4 oldCategoryIdentifiersVersion2:(id)a5 oldWebDomains:(id)a6 oldItemIdentifiers:(id)a7 oldItemType:(id)a8 toNewApplicationIdentifiers:(id)a9 newCategoryIdentifiers:(id)a10 newCategoryIdentifiersVersion2:(id)a11 newWebDomains:(id)a12 newItemIdentifiers:(id)a13 newItemType:(id)a14;
- (void)awakeFromFetch;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setBudgetLimit:(double)a3;
- (void)setBudgetLimit:(double)a3 forDay:(unint64_t)a4;
- (void)setBudgetLimitScheduleRepresentation:(id)a3;
- (void)setCategoryIdentifiers:(id)a3;
- (void)setCategoryIdentifiersVersion2:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setUsageItemType:(id)a3;
- (void)setWebsiteIdentifiers:(id)a3;
@end

@implementation STBlueprintUsageLimit

- (void)awakeFromFetch
{
  v9.receiver = self;
  v9.super_class = (Class)STBlueprintUsageLimit;
  [(STBlueprintUsageLimit *)&v9 awakeFromFetch];
  v3 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v4 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v5 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v6 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  v8 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:0 oldCategoryIdentifiers:0 oldCategoryIdentifiersVersion2:0 oldWebDomains:0 oldItemIdentifiers:0 oldItemType:0 toNewApplicationIdentifiers:v3 newCategoryIdentifiers:v4 newCategoryIdentifiersVersion2:v5 newWebDomains:v6 newItemIdentifiers:v7 newItemType:v8];
}

- (void)setApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setApplicationIdentifiers:v4];
  v5 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v6 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v7 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  v8 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v10 oldCategoryIdentifiers:v5 oldCategoryIdentifiersVersion2:v6 oldWebDomains:v7 oldItemIdentifiers:v8 oldItemType:v9 toNewApplicationIdentifiers:v4 newCategoryIdentifiers:v5 newCategoryIdentifiersVersion2:v6 newWebDomains:v7 newItemIdentifiers:v8 newItemType:v9];
}

- (void)setCategoryIdentifiers:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setCategoryIdentifiers:v4];
  v5 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v6 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  v8 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v6 oldCategoryIdentifiers:v10 oldCategoryIdentifiersVersion2:v5 oldWebDomains:v7 oldItemIdentifiers:v8 oldItemType:v9 toNewApplicationIdentifiers:v6 newCategoryIdentifiers:v4 newCategoryIdentifiersVersion2:v5 newWebDomains:v7 newItemIdentifiers:v8 newItemType:v9];
}

- (void)setCategoryIdentifiersVersion2:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setCategoryIdentifiersVersion2:v4];
  v5 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v6 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  v8 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v6 oldCategoryIdentifiers:v5 oldCategoryIdentifiersVersion2:v10 oldWebDomains:v7 oldItemIdentifiers:v8 oldItemType:v9 toNewApplicationIdentifiers:v6 newCategoryIdentifiers:v5 newCategoryIdentifiersVersion2:v4 newWebDomains:v7 newItemIdentifiers:v8 newItemType:v9];
}

- (void)setWebsiteIdentifiers:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setWebsiteIdentifiers:v4];
  v5 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v6 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v8 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v5 oldCategoryIdentifiers:v6 oldCategoryIdentifiersVersion2:v7 oldWebDomains:v10 oldItemIdentifiers:v8 oldItemType:v9 toNewApplicationIdentifiers:v5 newCategoryIdentifiers:v6 newCategoryIdentifiersVersion2:v7 newWebDomains:v4 newItemIdentifiers:v8 newItemType:v9];
}

- (void)setItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setItemIdentifiers:v4];
  v5 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v6 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v8 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v5 oldCategoryIdentifiers:v6 oldCategoryIdentifiersVersion2:v7 oldWebDomains:v8 oldItemIdentifiers:v10 oldItemType:v9 toNewApplicationIdentifiers:v5 newCategoryIdentifiers:v6 newCategoryIdentifiersVersion2:v7 newWebDomains:v8 newItemIdentifiers:v4 newItemType:v9];
}

- (void)setUsageItemType:(id)a3
{
  id v4 = a3;
  id v10 = [(STBlueprintUsageLimit *)self usageItemType];
  [(STBlueprintUsageLimit *)self managedObjectOriginal_setUsageItemType:v4];
  v5 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  v6 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  v7 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  v8 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  objc_super v9 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  [(STBlueprintUsageLimit *)self _usageLimitDidChangeFromOldApplicationIdentifiers:v5 oldCategoryIdentifiers:v6 oldCategoryIdentifiersVersion2:v7 oldWebDomains:v8 oldItemIdentifiers:v9 oldItemType:v10 toNewApplicationIdentifiers:v5 newCategoryIdentifiers:v6 newCategoryIdentifiersVersion2:v7 newWebDomains:v8 newItemIdentifiers:v9 newItemType:v4];
}

- (void)_usageLimitDidChangeFromOldApplicationIdentifiers:(id)a3 oldCategoryIdentifiers:(id)a4 oldCategoryIdentifiersVersion2:(id)a5 oldWebDomains:(id)a6 oldItemIdentifiers:(id)a7 oldItemType:(id)a8 toNewApplicationIdentifiers:(id)a9 newCategoryIdentifiers:(id)a10 newCategoryIdentifiersVersion2:(id)a11 newWebDomains:(id)a12 newItemIdentifiers:(id)a13 newItemType:(id)a14
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v51 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v50 = a14;
  v52 = v19;
  if ([v19 count]
    || [v20 count]
    || [v21 count]
    || [v51 count]
    || (char v29 = [v23 isEqualToString:@"app"], v30 = v22, (v29 & 1) == 0))
  {
    v30 = v19;
  }
  v45 = v23;
  v46 = v22;
  v47 = v21;
  v49 = v20;
  id v31 = v30;
  if ([v24 count]
    || [v25 count]
    || [v26 count]
    || [v27 count]
    || (char v32 = [v50 isEqualToString:@"app"], v33 = v28, (v32 & 1) == 0))
  {
    v33 = v24;
  }
  v34 = (void *)MEMORY[0x1E4F1CBF0];
  v35 = v28;
  if (v31) {
    v36 = v31;
  }
  else {
    v36 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v37 = v33;
  v38 = v24;
  v39 = v27;
  if (v37) {
    v40 = v37;
  }
  else {
    v40 = v34;
  }
  v53[0] = @"OldBundleIdentifiers";
  v53[1] = @"NewBundleIdentifiers";
  v54[0] = v36;
  v54[1] = v40;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [(STBlueprintUsageLimit *)self blueprint];
  v44 = v43 = v25;
  [v42 postNotificationName:@"LimitedApplicationsDidChange" object:v44 userInfo:v41];
}

+ (id)limitKeyPaths
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"day0Limit";
  v4[1] = @"day1Limit";
  v4[2] = @"day2Limit";
  v4[3] = @"day3Limit";
  v4[4] = @"day4Limit";
  v4[5] = @"day5Limit";
  v4[6] = @"day6Limit";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

+ (id)keyPathsForValuesAffectingBudgetLimitScheduleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"day0Limit", @"day1Limit", @"day2Limit", @"day3Limit", @"day4Limit", @"day5Limit", @"day6Limit", 0);
}

- (STBlueprintUsageLimitScheduleRepresentation)budgetLimitScheduleRepresentation
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  v5 = +[STBlueprintUsageLimit limitKeyPaths];
  if (![v5 count])
  {
    [v3 setCustomScheduleItems:v4];
    v12 = 0;
LABEL_9:
    v13 = objc_opt_new();
    [v12 doubleValue];
    objc_msgSend(v13, "setBudgetLimit:");
    [v3 setSimpleSchedule:v13];

    goto LABEL_10;
  }
  v6 = 0;
  unint64_t v7 = 0;
  int v8 = 1;
  do
  {
    objc_super v9 = objc_opt_new();
    unint64_t v10 = v7 + 1;
    [v9 setDay:v7 + 1];
    v11 = [v5 objectAtIndexedSubscript:v7];
    v12 = [(STBlueprintUsageLimit *)self valueForKey:v11];

    [v12 doubleValue];
    objc_msgSend(v9, "setBudgetLimit:");
    if (v6) {
      v8 &= [v6 isEqual:v12];
    }

    [v4 addObject:v9];
    v6 = v12;
    unint64_t v7 = v10;
  }
  while (v10 < [v5 count]);
  [v3 setCustomScheduleItems:v4];
  if (v8) {
    goto LABEL_9;
  }
LABEL_10:

  return (STBlueprintUsageLimitScheduleRepresentation *)v3;
}

- (void)setBudgetLimit:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = +[STBlueprintUsageLimit limitKeyPaths];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [NSNumber numberWithDouble:a3];
        [(STBlueprintUsageLimit *)self setValue:v11 forKeyPath:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)setBudgetLimit:(double)a3 forDay:(unint64_t)a4
{
  if (a4 - 8 <= 0xFFFFFFFFFFFFFFF8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STBlueprintUsageLimit.m", 325, @"Invalid parameter not satisfying: %@", @"day >= 1 && day <= 7" object file lineNumber description];
  }
  id v11 = +[STBlueprintUsageLimit limitKeyPaths];
  uint64_t v7 = [v11 objectAtIndexedSubscript:a4 - 1];
  uint64_t v8 = [NSNumber numberWithDouble:a3];
  [(STBlueprintUsageLimit *)self setValue:v8 forKeyPath:v7];
}

- (void)setBudgetLimitScheduleRepresentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 simpleSchedule];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 budgetLimit];
    -[STBlueprintUsageLimit setBudgetLimit:](self, "setBudgetLimit:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(v4, "customScheduleItems", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 budgetLimit];
        -[STBlueprintUsageLimit setBudgetLimit:forDay:](self, "setBudgetLimit:forDay:", [v12 day], v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"applicationIdentifiers"];
  [(STBlueprintUsageLimit *)self setApplicationIdentifiers:v5];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"categoryIdentifiers"];
  [(STBlueprintUsageLimit *)self setCategoryIdentifiers:v6];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"categoryIdentifiersVersion2"];
  [(STBlueprintUsageLimit *)self setCategoryIdentifiersVersion2:v7];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"websiteIdentifiers"];
  [(STBlueprintUsageLimit *)self setWebsiteIdentifiers:v8];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"itemIdentifiers"];
  [(STBlueprintUsageLimit *)self setItemIdentifiers:v9];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"usageItemType"];
  [(STBlueprintUsageLimit *)self setUsageItemType:v10];

  id v11 = [v4 objectForKeyedSubscript:@"notificationTimeInterval"];
  [(STBlueprintUsageLimit *)self setNotificationTimeInterval:v11];

  long long v12 = +[STBlueprintUsageLimit limitKeyPaths];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v18 = [v4 objectForKeyedSubscript:v17];
        [(STBlueprintUsageLimit *)self setValue:v18 forKeyPath:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  [v3 setObject:v4 forKeyedSubscript:@"applicationIdentifiers"];

  v5 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  [v3 setObject:v5 forKeyedSubscript:@"categoryIdentifiers"];

  uint64_t v6 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  [v3 setObject:v6 forKeyedSubscript:@"categoryIdentifiersVersion2"];

  uint64_t v7 = [(STBlueprintUsageLimit *)self websiteIdentifiers];
  [v3 setObject:v7 forKeyedSubscript:@"websiteIdentifiers"];

  uint64_t v8 = [(STBlueprintUsageLimit *)self itemIdentifiers];
  [v3 setObject:v8 forKeyedSubscript:@"itemIdentifiers"];

  uint64_t v9 = [(STBlueprintUsageLimit *)self usageItemType];
  [v3 setObject:v9 forKeyedSubscript:@"usageItemType"];

  uint64_t v10 = [(STBlueprintUsageLimit *)self notificationTimeInterval];
  [v3 setObject:v10 forKeyedSubscript:@"notificationTimeInterval"];

  id v11 = +[STBlueprintUsageLimit limitKeyPaths];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v17 = [(STBlueprintUsageLimit *)self valueForKeyPath:v16];
        [v3 setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
  v18 = (void *)[v3 copy];

  return v18;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintUsageLimit;
  if (-[STBlueprintUsageLimit validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STBlueprintUsageLimit *)self _validateBlueprint:v5];
    [(STBlueprintUsageLimit *)self _validateIdentifiers:v5];
    if ([v5 count])
    {
      uint64_t v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintUsageLimit validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintUsageLimit;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintUsageLimit validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintUsageLimit;
  if (-[STBlueprintUsageLimit validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STBlueprintUsageLimit *)self _validateBlueprint:v5];
    [(STBlueprintUsageLimit *)self _validateIdentifiers:v5];
    if ([v5 count])
    {
      uint64_t v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintUsageLimit validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintUsageLimit;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintUsageLimit validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintUsageLimit;
  if (-[STBlueprintUsageLimit validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    if ([v5 count])
    {
      uint64_t v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintUsageLimit validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintUsageLimit;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintUsageLimit validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateBlueprint:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STBlueprintUsageLimit *)self blueprint];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"STBlueprintUsageLimit is missing a blueprint.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"STErrorDomain" code:547 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 != 0;
}

- (BOOL)_validateIdentifiers:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(STBlueprintUsageLimit *)self applicationIdentifiers];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(STBlueprintUsageLimit *)self categoryIdentifiers];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(STBlueprintUsageLimit *)self categoryIdentifiersVersion2];
  if (!v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [(STBlueprintUsageLimit *)self websiteIdentifiers];

  if (!v11)
  {
LABEL_8:
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"STBlueprintUsageLimit is missing a valid identifier";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"STErrorDomain" code:548 userInfo:v14];
    [v4 addObject:v15];

    BOOL v12 = 0;
    goto LABEL_9;
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on BlueprintSchedule failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on BlueprintUsageLimit failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on BlueprintUsageLimit failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end