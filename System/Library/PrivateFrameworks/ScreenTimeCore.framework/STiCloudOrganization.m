@interface STiCloudOrganization
+ (NSString)serializableClassName;
+ (id)fetchOrCreateiCloudOrganizationWithContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchWithContext:(id)a3 error:(id *)a4;
- (BOOL)_validateNumberOfObjects:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
@end

@implementation STiCloudOrganization

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 fetchRequest];
  v8 = [v6 executeFetchRequest:v7 error:a4];

  if (!v8) {
    goto LABEL_6;
  }
  if ((unint64_t)[v8 count] < 2)
  {
    v16 = [v8 firstObject];
    id v14 = v16;
    if (v16)
    {
      id v14 = v16;
      v15 = v14;
    }
    else
    {
      if (a4)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28568];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27 = @"There must be one Cloud Organization.";
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        v20 = [v17 errorWithDomain:@"STErrorDomain" code:505 userInfo:v19];

        if (v20)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = v18;
          v25 = @"There must be one Cloud Organization.";
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          *a4 = [v21 errorWithDomain:@"STErrorDomain" code:505 userInfo:v22];
        }
      }
      v15 = 0;
    }
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  v31[0] = @"There must be one and only one Cloud Organization object.";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v12 = [v9 errorWithDomain:@"STErrorDomain" code:504 userInfo:v11];

  if (!v12)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_14;
  }
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v28 = v10;
  v29 = @"There must be one and only one Cloud Organization object.";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v13 errorWithDomain:@"STErrorDomain" code:504 userInfo:v14];
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v15;
}

+ (id)fetchOrCreateiCloudOrganizationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 fetchRequest];
  v8 = [v6 executeFetchRequest:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v10 = +[STLog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:error:]();
      }
    }
    v11 = [v9 firstObject];
    if (!v11) {
      v11 = [[STiCloudOrganization alloc] initWithContext:v6];
    }
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v12 = [(STiCloudOrganization *)v11 settings];
      if (!v12)
      {
        v12 = [[STiCloudOrganizationSettings alloc] initWithContext:v6];
        [(STiCloudOrganizationSettings *)v12 setOrganization:v11];
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STiCloudOrganization;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"RMiCloudOrganization";
}

- (BOOL)validateForUpdate:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STiCloudOrganization;
  BOOL v3 = -[STiCloudOrganization validateForUpdate:](&v6, sel_validateForUpdate_);
  if (v3)
  {
    _os_feature_enabled_impl();
  }
  else
  {
    objc_super v4 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[STiCloudOrganization validateForUpdate:]();
    }
  }
  return v3;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STiCloudOrganization;
  if (-[STiCloudOrganization validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STiCloudOrganization *)self _validateNumberOfObjects:v5];
    if ([v5 count])
    {
      objc_super v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STiCloudOrganization validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STiCloudOrganization;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STiCloudOrganization validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STiCloudOrganization;
  if (-[STiCloudOrganization validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STiCloudOrganization *)self _validateNumberOfObjects:v5];
    if ([v5 count])
    {
      objc_super v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STiCloudOrganization validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STiCloudOrganization;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STiCloudOrganization validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateNumberOfObjects:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[STiCloudOrganization fetchRequest];
  id v15 = 0;
  v5 = [v4 execute:&v15];
  id v6 = v15;
  if (v5)
  {
    if ((unint64_t)[v5 count] < 2)
    {
      if (!_os_feature_enabled_impl() || [v5 count])
      {
        BOOL v12 = 1;
        goto LABEL_10;
      }
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17 = @"There must be one Cloud Organization object.";
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      objc_super v9 = v14;
      uint64_t v10 = 505;
    }
    else
    {
      BOOL v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"There must be one and only one Cloud Organization object.";
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      objc_super v9 = v7;
      uint64_t v10 = 504;
    }
    v11 = [v9 errorWithDomain:@"STErrorDomain" code:v10 userInfo:v8];
    [v3 addObject:v11];
  }
  else
  {
    [v3 addObject:v6];
  }
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

+ (void)fetchOrCreateiCloudOrganizationWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "organization is not unique but should be:\n%@", v2, v3, v4, v5, v6);
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on iCloudOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for insert on iCloudOrganization failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on iCloudOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for delete on iCloudOrganization failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on iCloudOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end