@interface STScreenTimeSettings
+ (id)fetchRequest;
+ (id)fetchScreenTimeSettingsInContext:(id)a3 error:(id *)a4;
- (BOOL)_validateCurrentOrganization:(id)a3;
- (BOOL)_validateNumberOfObjects:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
@end

@implementation STScreenTimeSettings

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STScreenTimeSettings;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (id)fetchScreenTimeSettingsInContext:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "fetchRequest", a3);
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v36[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v5 setSortDescriptors:v7];

  id v27 = 0;
  v8 = [v5 execute:&v27];
  id v9 = v27;
  v10 = v9;
  if (v8)
  {
    if ((unint64_t)[v8 count] < 2)
    {
      v18 = [v8 firstObject];
      v17 = v18;
      if (v18)
      {
        id v19 = v18;
      }
      else if (a4)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v31 = @"screen time settings not found";
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v24 = [v21 errorWithDomain:@"STErrorDomain" code:9 userInfo:v23];

        if (v24)
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = v22;
          v29 = @"screen time settings not found";
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          *a4 = [v25 errorWithDomain:@"STErrorDomain" code:9 userInfo:v26];
        }
      }
    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28568];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        v35 = @"There must be one and only once ScreenTimeSettings object.";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v14 = [v11 errorWithDomain:@"STErrorDomain" code:502 userInfo:v13];

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = v12;
          v33 = @"There must be one and only once ScreenTimeSettings object.";
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = [v15 errorWithDomain:@"STErrorDomain" code:502 userInfo:v16];
        }
      }
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    if (a4 && v9)
    {
      v17 = 0;
      *a4 = v9;
    }
  }

  return v17;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STScreenTimeSettings;
  if (-[STScreenTimeSettings validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    if (_os_feature_enabled_impl()) {
      [(STScreenTimeSettings *)self _validateCurrentOrganization:v5];
    }
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STScreenTimeSettings validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STScreenTimeSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STScreenTimeSettings validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STScreenTimeSettings;
  if (-[STScreenTimeSettings validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STScreenTimeSettings *)self _validateNumberOfObjects:v5];
    if (_os_feature_enabled_impl()) {
      [(STScreenTimeSettings *)self _validateCurrentOrganization:v5];
    }
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STScreenTimeSettings validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STScreenTimeSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STScreenTimeSettings validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STScreenTimeSettings;
  if (-[STScreenTimeSettings validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STScreenTimeSettings *)self _validateNumberOfObjects:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STScreenTimeSettings validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STScreenTimeSettings;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STScreenTimeSettings validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateCurrentOrganization:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STScreenTimeSettings *)self currentOrganization];

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"The ScreenTimeSettings object must always contain a currentOrganization.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v8 = [v6 errorWithDomain:@"STErrorDomain" code:21 userInfo:v7];
    [v4 addObject:v8];
  }
  uint64_t v9 = [(STScreenTimeSettings *)self currentOrganization];
  if (v9)
  {
    objc_super v10 = (void *)v9;
    v11 = [(STScreenTimeSettings *)self currentOrganization];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_7:

      goto LABEL_8;
    }
    uint64_t v12 = [(STScreenTimeSettings *)self currentOrganization];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18 = @"The ScreenTimeSettings object references an unsupported organization class.";
      objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v11 = [v14 errorWithDomain:@"STErrorDomain" code:503 userInfo:v10];
      [v4 addObject:v11];
      goto LABEL_7;
    }
  }
LABEL_8:
  BOOL v15 = [v4 count] == 0;

  return v15;
}

- (BOOL)_validateNumberOfObjects:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STScreenTimeSettings fetchRequest];
  id v15 = 0;
  v5 = [v4 execute:&v15];
  id v6 = v15;
  if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      BOOL v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"There must be one and only one ScreenTimeSettings object.";
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v9 = [v7 errorWithDomain:@"STErrorDomain" code:502 userInfo:v8];
      [v3 addObject:v9];
    }
    if (![v5 count])
    {
      objc_super v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      uint64_t v17 = @"There must be one ScreenTimeSettings object.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v12 = [v10 errorWithDomain:@"STErrorDomain" code:9 userInfo:v11];
      [v3 addObject:v12];
    }
    BOOL v13 = [v3 count] == 0;
  }
  else
  {
    [v3 addObject:v6];
    BOOL v13 = 0;
  }

  return v13;
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for Update on ScreenTimeSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on ScreenTimeSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for Insert on ScreenTimeSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on ScreenTimeSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for Delete on ScreenTimeSettings failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on ScreenTimeSettings failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end