@interface STFamilyOrganization
+ (NSString)serializableClassName;
+ (id)fetchOrCreateFamilyOrganizationWithContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchWithContext:(id)a3 error:(id *)a4;
- (BOOL)_validateNumberOfObjects:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
@end

@implementation STFamilyOrganization

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  v6 = [a1 fetchRequest];
  v7 = [v6 execute:a4];
  if (!v7)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_48;
  }
  int v8 = _os_feature_enabled_impl();
  unint64_t v9 = [v7 count];
  if (!v8)
  {
    if (v9 < 2)
    {
LABEL_47:
      v16 = objc_msgSend(v7, "firstObject", v55, v56, v57, v58);
      goto LABEL_48;
    }
    v17 = +[STLog persistence];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      +[STFamilyOrganization fetchWithContext:error:]();
    }

    id v68 = 0;
    v18 = +[STCoreUser fetchLocalUserInContext:v59 error:&v68];
    id v19 = v68;
    if (!v18)
    {
      v20 = +[STLog persistence];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        +[STFamilyOrganization fetchWithContext:error:]();
      }
    }
    v21 = [v18 familySettings];
    v22 = [v21 organization];

    v23 = +[STLog persistence];
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v23, OS_LOG_TYPE_DEFAULT, "Preserving family organization associated with the local user's family settings.", buf, 2u);
      }

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v25 = v7;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (!v26) {
        goto LABEL_46;
      }
      uint64_t v27 = v26;
      id v55 = v19;
      v56 = v18;
      v57 = v7;
      v58 = v6;
      uint64_t v28 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v65 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (v30 != v22)
          {
            id v31 = v30;
            id v32 = v59;
            v33 = +[STLog persistence];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v84 = 138543362;
              id v85 = v31;
              _os_log_error_impl(&dword_1DA519000, v33, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", v84, 0xCu);
            }

            v34 = [v31 settings];
            *(void *)buf = MEMORY[0x1E4F143A8];
            uint64_t v70 = 3221225472;
            v71 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
            v72 = &unk_1E6BC77F0;
            id v73 = v32;
            id v35 = v32;
            [v34 enumerateObjectsUsingBlock:buf];

            [v35 deleteObject:v31];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v27);
    }
    else
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v23, OS_LOG_TYPE_DEFAULT, "Preserving first family organization returned from fetch request.", buf, 2u);
      }

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v38 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, objc_msgSend(v7, "count") - 1);
      id v25 = [v7 objectsAtIndexes:v38];

      uint64_t v39 = [v25 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (!v39) {
        goto LABEL_46;
      }
      uint64_t v40 = v39;
      id v55 = v19;
      v56 = v18;
      v57 = v7;
      v58 = v6;
      uint64_t v41 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v61 != v41) {
            objc_enumerationMutation(v25);
          }
          id v43 = *(id *)(*((void *)&v60 + 1) + 8 * j);
          id v44 = v59;
          v45 = +[STLog persistence];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 138543362;
            id v85 = v43;
            _os_log_error_impl(&dword_1DA519000, v45, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", v84, 0xCu);
          }

          v46 = [v43 settings];
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v70 = 3221225472;
          v71 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
          v72 = &unk_1E6BC77F0;
          id v73 = v44;
          id v47 = v44;
          [v46 enumerateObjectsUsingBlock:buf];

          [v47 deleteObject:v43];
        }
        uint64_t v40 = [v25 countByEnumeratingWithState:&v60 objects:v74 count:16];
      }
      while (v40);
    }
    v7 = v57;
    v6 = v58;
    id v19 = v55;
    v18 = v56;
LABEL_46:

    goto LABEL_47;
  }
  if (v9 >= 2)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      v83 = @"There must be one and only one Family Organization object.";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      v13 = [v10 errorWithDomain:@"STErrorDomain" code:506 userInfo:v12];

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v80 = v11;
        v81 = @"There must be one and only one Family Organization object.";
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        *a4 = [v14 errorWithDomain:@"STErrorDomain" code:506 userInfo:v15];
      }
    }
    goto LABEL_8;
  }
  v36 = [v7 firstObject];
  v16 = v36;
  if (v36)
  {
    id v37 = v36;
  }
  else if (a4)
  {
    v49 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    v79 = @"There must be one Family Organization.";
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    v52 = [v49 errorWithDomain:@"STErrorDomain" code:507 userInfo:v51];

    if (v52)
    {
      v53 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = v50;
      v77 = @"There must be one Family Organization.";
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      *a4 = [v53 errorWithDomain:@"STErrorDomain" code:507 userInfo:v54];
    }
  }

LABEL_48:
  return v16;
}

+ (id)fetchOrCreateFamilyOrganizationWithContext:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  v6 = [a1 fetchRequest];
  v7 = [v6 execute:a4];
  int v8 = v7;
  if (!v7)
  {
    uint64_t v28 = 0;
    goto LABEL_42;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    unint64_t v9 = +[STLog persistence];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[STFamilyOrganization fetchWithContext:error:]();
    }

    id v54 = 0;
    v10 = +[STCoreUser fetchLocalUserInContext:v45 error:&v54];
    id v11 = v54;
    if (!v10)
    {
      v12 = +[STLog persistence];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[STFamilyOrganization fetchWithContext:error:]();
      }
    }
    v13 = [v10 familySettings];
    v14 = [v13 organization];

    v15 = +[STLog persistence];
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "Preserving family organization associated with the local user's family settings.", (uint8_t *)&buf, 2u);
      }

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v17 = v8;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (!v18) {
        goto LABEL_37;
      }
      uint64_t v19 = v18;
      id v41 = v11;
      v42 = v10;
      id v43 = v8;
      id v44 = v6;
      uint64_t v20 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v51 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v22 != v14)
          {
            id v23 = v22;
            id v24 = v45;
            id v25 = +[STLog persistence];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long v61 = 138543362;
              id v62 = v23;
              _os_log_error_impl(&dword_1DA519000, v25, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", v61, 0xCu);
            }

            uint64_t v26 = [v23 settings];
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v58 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
            id v59 = &unk_1E6BC77F0;
            id v60 = v24;
            id v27 = v24;
            [v26 enumerateObjectsUsingBlock:&buf];

            [v27 deleteObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v19);
    }
    else
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "Preserving first family organization returned from fetch request.", (uint8_t *)&buf, 2u);
      }

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v29 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, objc_msgSend(v8, "count") - 1);
      id v17 = [v8 objectsAtIndexes:v29];

      uint64_t v30 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (!v30) {
        goto LABEL_37;
      }
      uint64_t v31 = v30;
      id v41 = v11;
      v42 = v10;
      id v43 = v8;
      id v44 = v6;
      uint64_t v32 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v17);
          }
          id v34 = *(id *)(*((void *)&v46 + 1) + 8 * j);
          id v35 = v45;
          v36 = +[STLog persistence];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v61 = 138543362;
            id v62 = v34;
            _os_log_error_impl(&dword_1DA519000, v36, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", v61, 0xCu);
          }

          id v37 = [v34 settings];
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v58 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
          id v59 = &unk_1E6BC77F0;
          id v60 = v35;
          id v38 = v35;
          [v37 enumerateObjectsUsingBlock:&buf];

          [v38 deleteObject:v34];
        }
        uint64_t v31 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v31);
    }
    int v8 = v43;
    v6 = v44;
    id v11 = v41;
    v10 = v42;
LABEL_37:
  }
  objc_msgSend(v8, "firstObject", v41, v42, v43, v44);
  uint64_t v28 = (STFamilyOrganization *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    uint64_t v28 = [[STFamilyOrganization alloc] initWithContext:v45];
    uint64_t v39 = +[STLog persistence];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_1DA519000, v39, OS_LOG_TYPE_DEFAULT, "Created a family organization. Family Organization; %@",
        (uint8_t *)&buf,
        0xCu);
    }
  }
LABEL_42:

  return v28;
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STFamilyOrganization;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyOrganization;
  if (-[STFamilyOrganization validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STFamilyOrganization validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STFamilyOrganization;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STFamilyOrganization validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyOrganization;
  if (-[STFamilyOrganization validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STFamilyOrganization *)self _validateNumberOfObjects:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STFamilyOrganization validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STFamilyOrganization;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STFamilyOrganization validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STFamilyOrganization;
  if (-[STFamilyOrganization validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STFamilyOrganization *)self _validateNumberOfObjects:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STFamilyOrganization validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STFamilyOrganization;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STFamilyOrganization validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateNumberOfObjects:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[STCoreUser fetchRequestMatchingLocalUser];
  id v26 = 0;
  v5 = [v4 execute:&v26];
  id v6 = v26;
  if (v5)
  {
    BOOL v7 = [v5 firstObject];
    int v8 = +[STFamilyOrganization fetchRequest];
    id v25 = v6;
    objc_super v9 = [v8 execute:&v25];
    id v10 = v25;

    if (!v9)
    {
      [v3 addObject:v10];
LABEL_17:
      BOOL v18 = 0;
      goto LABEL_18;
    }
    id v11 = [v7 familyMemberType];
    v12 = v11;
    if (v11 == @"Unknown")
    {
    }
    else
    {
      v13 = [v7 familyMemberType];

      if (v13)
      {
        if (![v9 count])
        {
          v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          uint64_t v30 = @"There must be one Family Organization objects for the local user.";
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          uint64_t v20 = v22;
          uint64_t v21 = 507;
          goto LABEL_16;
        }
        if ((unint64_t)[v9 count] >= 2)
        {
          v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          uint64_t v28 = @"There must be one and only one Family Organization objects for the local user.";
          v15 = (void *)MEMORY[0x1E4F1C9E8];
          BOOL v16 = &v28;
          id v17 = &v27;
LABEL_13:
          uint64_t v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
          uint64_t v20 = v14;
          uint64_t v21 = 506;
LABEL_16:
          id v23 = [v20 errorWithDomain:@"STErrorDomain" code:v21 userInfo:v19];
          [v3 addObject:v23];

          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
    if ([v9 count])
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"There must be 0 Family Organization objects for a local user with no iCloud signed in.";
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v16 = (__CFString **)v32;
      id v17 = &v31;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v18 = 1;
LABEL_18:

    goto LABEL_19;
  }
  [v3 addObject:v6];
  BOOL v18 = 0;
  id v10 = v6;
LABEL_19:

  return v18;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"RMFamilyOrganization";
}

+ (void)fetchWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)fetchWithContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "More than 1 family organizations found: %{public}@", v2, v3, v4, v5, v6);
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for update on FamilyOrganization failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on FamilyOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for insert on FamilyOrganization failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on FamilyOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for delete on FamilyOrganization failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on FamilyOrganization failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end