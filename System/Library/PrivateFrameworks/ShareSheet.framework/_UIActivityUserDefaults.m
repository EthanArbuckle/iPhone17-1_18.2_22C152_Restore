@interface _UIActivityUserDefaults
+ (id)builtinActivityOrder;
+ (id)updatedActivityIdentifiersUserOrderWithPreviousOrder:(id)a3 someSortedActivityIdentifiers:(id)a4;
+ (void)_migrateUserActivityOrderforKey:(id)a3 userDefaults:(id)a4 defaultOrder:(id)a5;
+ (void)migrateUserActivityOrderIfNecessary;
- (BOOL)activityIsHidden:(id)a3;
- (BOOL)canHideActivity:(id)a3;
- (BOOL)hasUserEditedActivityOrder;
- (NSString)activityDefaultsKey;
- (NSUserDefaults)underlyingUserDefaults;
- (_UIActivityUserDefaults)initWithUnderlyingUserDefaults:(id)a3 activityDefaultsKey:(id)a4;
- (id)activitiesBySortingActivities:(id)a3 byIdentifierWithDefaultActivityIdentifierOrdering:(id)a4;
- (id)activitiesOrderedByUserActivityOrderForActivities:(id)a3;
- (id)activityIdentifiersInUserOrder;
- (id)applicationExtensionForActivity:(id)a3;
- (id)identifierForActivity:(id)a3;
- (id)migrateSortOrderIfNeededForBuiltInActivityType:(id)a3 activityIdentifierOrdering:(id)a4;
- (id)mutableActivityIdentifiersArrayForActivitiesArray:(id)a3;
- (void)_userEditedActivityDefaults;
- (void)activityIdentifiersInUserOrder;
- (void)postActivityUserDefaultsDidChangeNotification;
- (void)removeActivityTypeFromDefaults:(id)a3;
- (void)setActivity:(id)a3 asHidden:(BOOL)a4;
- (void)setActivityDefaultsKey:(id)a3;
- (void)setActivityIdentifiersInUserOrder:(id)a3;
- (void)setUnderlyingUserDefaults:(id)a3;
- (void)updateUserActivityOrderWithOrderedPartialActivities:(id)a3;
@end

@implementation _UIActivityUserDefaults

- (_UIActivityUserDefaults)initWithUnderlyingUserDefaults:(id)a3 activityDefaultsKey:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityUserDefaults;
  v8 = [(_UIActivityUserDefaults *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(_UIActivityUserDefaults *)v8 setActivityDefaultsKey:v7];
    [(_UIActivityUserDefaults *)v9 setUnderlyingUserDefaults:v6];
    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v19[0] = @"UIActivityCategoryShare";
    v18[0] = @"com.apple.UIKit.activity.AirDrop";
    v18[1] = @"com.apple.UIKit.activity.Message";
    v18[2] = @"com.apple.UIKit.activity.Mail";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v19[1] = @"UIActivityCategoryAction";
    v20[0] = v11;
    v17[0] = @"com.apple.UIKit.activity.CopyToPasteboard";
    v17[1] = @"com.apple.UIKit.activity.Share";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v20[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v10 registerDefaults:v13];

    v14 = v9;
  }

  return v9;
}

- (BOOL)canHideActivity:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityUserDefaults *)self applicationExtensionForActivity:v4];

  if (v5)
  {
    id v6 = [v4 activityType];
    if ([v6 isEqualToString:@"com.apple.AssetViewer.Picasso"])
    {
      char v7 = 0;
    }
    else
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass() ^ 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)activityIsHidden:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityUserDefaults *)self applicationExtensionForActivity:v4];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 optedIn];
    objc_opt_class();
    BOOL v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0 && (v7 & 1) == 0)
    {
      objc_opt_class();
      BOOL v8 = (objc_opt_isKindOfClass() & 1) == 0
        || ([v4 activityType],
            v9 = objc_claimAutoreleasedReturnValue(),
            char v10 = _UIShouldExcludeExtensionWithActivityType(v9),
            v9,
            (v10 & 1) != 0)
        || _UIExtensionElectionStateIsIgnore(v4);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setActivity:(id)a3 asHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [(_UIActivityUserDefaults *)self applicationExtensionForActivity:v6];
  if (![v7 optedIn])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v6 activityType],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = _UIShouldExcludeExtensionWithActivityType(v11),
          v11,
          !v12))
    {
      if (_UIExtensionElectionStateIsIgnore(v6) == v4) {
        goto LABEL_14;
      }
      if (v4)
      {
LABEL_3:
        id v14 = 0;
        char v8 = [v7 attemptOptOut:&v14];
        id v9 = v14;
        if ((v8 & 1) == 0)
        {
          char v10 = share_sheet_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[_UIActivityUserDefaults setActivity:asHidden:](v7);
          }
LABEL_12:

          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if (v4)
    {
      goto LABEL_14;
    }
    id v15 = 0;
    char v13 = [v7 attemptOptIn:&v15];
    id v9 = v15;
    if ((v13 & 1) == 0)
    {
      char v10 = share_sheet_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_UIActivityUserDefaults setActivity:asHidden:](v7);
      }
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v4) {
    goto LABEL_3;
  }
LABEL_14:
  [(_UIActivityUserDefaults *)self postActivityUserDefaultsDidChangeNotification];
}

- (id)activitiesBySortingActivities:(id)a3 byIdentifierWithDefaultActivityIdentifierOrdering:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v15 = [(_UIActivityUserDefaults *)self identifierForActivity:v14];
        uint64_t v16 = [v7 indexOfObject:v15];
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v9 addObject:v14];
        }
        else
        {
          [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v16];
          v18 = id v17 = v7;
          [v8 setObject:v14 forKeyedSubscript:v18];

          id v7 = v17;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  v19 = [v8 allKeys];
  v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_50];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        [v9 insertObject:v26 atIndex:0];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }

  v27 = (void *)[v9 copy];
  return v27;
}

- (id)migrateSortOrderIfNeededForBuiltInActivityType:(id)a3 activityIdentifierOrdering:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count]
    || [v6 containsObject:v5]
    || ([(id)objc_opt_class() builtinActivityOrder],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 indexOfObject:v5],
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = v6;
  }
  else
  {
    id v9 = (id)[v6 mutableCopy];
    unint64_t v11 = [v9 count];
    if (v8 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v8;
    }
    [v9 insertObject:v5 atIndex:v12];
  }

  return v9;
}

- (id)activitiesOrderedByUserActivityOrderForActivities:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIActivityUserDefaults *)self activityIdentifiersInUserOrder];
  id v6 = [(_UIActivityUserDefaults *)self activitiesBySortingActivities:v4 byIdentifierWithDefaultActivityIdentifierOrdering:v5];

  return v6;
}

- (void)updateUserActivityOrderWithOrderedPartialActivities:(id)a3
{
  id v6 = [(_UIActivityUserDefaults *)self mutableActivityIdentifiersArrayForActivitiesArray:a3];
  [v6 removeObject:@"com.apple.UIKit.activity.UserDefaults"];
  id v4 = [(_UIActivityUserDefaults *)self activityIdentifiersInUserOrder];
  id v5 = +[_UIActivityUserDefaults updatedActivityIdentifiersUserOrderWithPreviousOrder:v4 someSortedActivityIdentifiers:v6];

  [(_UIActivityUserDefaults *)self setActivityIdentifiersInUserOrder:v5];
}

- (void)removeActivityTypeFromDefaults:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIActivityUserDefaults *)self activityIdentifiersInUserOrder];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(_UIActivityUserDefaults *)self setActivityIdentifiersInUserOrder:v6];
}

+ (id)builtinActivityOrder
{
  if (builtinActivityOrder_once != -1) {
    dispatch_once(&builtinActivityOrder_once, &__block_literal_global_27);
  }
  v2 = (void *)builtinActivityOrder_builtinActivityOrder;
  return v2;
}

- (id)activityIdentifiersInUserOrder
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIActivityUserDefaults *)self underlyingUserDefaults];
  id v4 = [(_UIActivityUserDefaults *)self activityDefaultsKey];
  id v5 = [v3 arrayForKey:v4];

  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    id v6 = v5;
  }
  id v7 = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = share_sheet_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            [(_UIActivityUserDefaults *)(uint64_t)v8 activityIdentifiersInUserOrder];
          }

          id v15 = [(_UIActivityUserDefaults *)self underlyingUserDefaults];
          uint64_t v16 = [(_UIActivityUserDefaults *)self activityDefaultsKey];
          [v15 setObject:0 forKey:v16];

          id v13 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v13 = v8;
LABEL_15:

  return v13;
}

- (void)setActivityIdentifiersInUserOrder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIActivityUserDefaults *)self underlyingUserDefaults];
  id v6 = [(_UIActivityUserDefaults *)self activityDefaultsKey];
  [v5 setObject:v4 forKey:v6];

  [(_UIActivityUserDefaults *)self _userEditedActivityDefaults];
  [(_UIActivityUserDefaults *)self postActivityUserDefaultsDidChangeNotification];
}

- (BOOL)hasUserEditedActivityOrder
{
  v3 = [(_UIActivityUserDefaults *)self activityDefaultsKey];
  id v4 = [v3 stringByAppendingString:@"EditedKey"];

  id v5 = [(_UIActivityUserDefaults *)self underlyingUserDefaults];
  LOBYTE(v3) = [v5 BOOLForKey:v4];

  return (char)v3;
}

- (void)_userEditedActivityDefaults
{
  v3 = [(_UIActivityUserDefaults *)self activityDefaultsKey];
  id v5 = [v3 stringByAppendingString:@"EditedKey"];

  id v4 = [(_UIActivityUserDefaults *)self underlyingUserDefaults];
  [v4 setBool:1 forKey:v5];
}

+ (id)updatedActivityIdentifiersUserOrderWithPreviousOrder:(id)a3 someSortedActivityIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v6 count];
  uint64_t v9 = v7;
  if (v8)
  {
    unint64_t v10 = v8;
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
    id v13 = (void *)[v7 mutableCopy];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke;
    v37[3] = &unk_1E5A239D0;
    id v14 = v12;
    id v38 = v14;
    id v15 = v11;
    id v39 = v15;
    [v7 enumerateObjectsUsingBlock:v37];
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    uint64_t v36 = [v7 count];
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke_2;
    uint64_t v24 = &unk_1E5A239F8;
    id v16 = v13;
    id v25 = v16;
    id v17 = v6;
    id v26 = v17;
    v27 = &v29;
    v28 = &v33;
    [v15 enumerateIndexesUsingBlock:&v21];
    while (1)
    {
      unint64_t v18 = v30[3];
      if (v18 >= v10) {
        break;
      }
      v30[3] = v18 + 1;
      long long v19 = objc_msgSend(v17, "objectAtIndexedSubscript:", v21, v22, v23, v24, v25);
      ++v34[3];
      objc_msgSend(v16, "insertObject:atIndex:", v19);
    }
    uint64_t v9 = objc_msgSend(v16, "copy", v21, v22, v23, v24);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
  }
  return v9;
}

- (id)mutableActivityIdentifiersArrayForActivitiesArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[_UIActivityUserDefaults identifierForActivity:](self, "identifierForActivity:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)postActivityUserDefaultsDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIActivityUserDefaultsDidChangeNotification" object:self userInfo:0];
}

- (id)identifierForActivity:(id)a3
{
  return (id)[a3 _activityTypeUsingFallbackActivityTypeIfNecessary];
}

- (id)applicationExtensionForActivity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 applicationExtension];
  }
  else if (NSClassFromString(&cfstr_Pueditpluginac.isa) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = [v3 valueForKey:@"plugin"];
    id v4 = [v5 valueForKey:@"extension"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (void)migrateUserActivityOrderIfNecessary
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 integerForKey:@"_UIActivityUserDefaultsMigrationVersionKey"] <= 0)
  {
    v7[0] = @"com.apple.UIKit.activity.AirDrop";
    v7[1] = @"com.apple.UIKit.activity.Message";
    v7[2] = @"com.apple.UIKit.activity.Mail";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
    [a1 _migrateUserActivityOrderforKey:@"UIActivityCategoryShare" userDefaults:v3 defaultOrder:v4];

    v6[0] = @"com.apple.UIKit.activity.CopyToPasteboard";
    v6[1] = @"com.apple.UIKit.activity.Share";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    [a1 _migrateUserActivityOrderforKey:@"UIActivityCategoryAction" userDefaults:v3 defaultOrder:v5];

    [v3 setInteger:1 forKey:@"_UIActivityUserDefaultsMigrationVersionKey"];
  }
}

+ (void)_migrateUserActivityOrderforKey:(id)a3 userDefaults:(id)a4 defaultOrder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v8 dictionaryForKey:v7];
  id v11 = [v10 objectForKey:@"order"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[_UIActivityUserDefaults _migrateUserActivityOrderforKey:userDefaults:defaultOrder:]((uint64_t)v11, v13);
    }

    goto LABEL_7;
  }
  if ([v11 isEqualToArray:v9])
  {
LABEL_7:
    [v8 setObject:0 forKey:v7];
    goto LABEL_8;
  }
  unint64_t v12 = [v7 stringByAppendingString:@"EditedKey"];
  [v8 setBool:1 forKey:v12];
  [v8 setObject:v11 forKey:v7];

LABEL_8:
}

- (NSString)activityDefaultsKey
{
  return self->_activityDefaultsKey;
}

- (void)setActivityDefaultsKey:(id)a3
{
}

- (NSUserDefaults)underlyingUserDefaults
{
  return self->_underlyingUserDefaults;
}

- (void)setUnderlyingUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingUserDefaults, 0);
  objc_storeStrong((id *)&self->_activityDefaultsKey, 0);
}

- (void)setActivity:(void *)a1 asHidden:.cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1A0AD8000, v2, v3, "Error opting out extension with identifier \"%{public}@\" (%{public}@)", v4, v5, v6, v7, v8);
}

- (void)setActivity:(void *)a1 asHidden:.cold.2(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_5(&dword_1A0AD8000, v2, v3, "Error opting in extension with identifier \"%{public}@\" (%{public}@)", v4, v5, v6, v7, v8);
}

- (void)activityIdentifiersInUserOrder
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_FAULT, "Found a non string value in our user defaults array! %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_migrateUserActivityOrderforKey:(uint64_t)a1 userDefaults:(NSObject *)a2 defaultOrder:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_FAULT, "Found a non array value when migrating user defaults! %@", (uint8_t *)&v2, 0xCu);
}

@end