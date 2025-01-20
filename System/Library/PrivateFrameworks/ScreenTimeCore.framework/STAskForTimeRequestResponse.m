@interface STAskForTimeRequestResponse
+ (id)_fetchPredicateForAskForTimeRequest:(id)a3 requestingUserDSID:(id)a4;
+ (id)fetchRequest;
+ (id)upsertAskForTimeRequest:(id)a3 fromUser:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)_validateFieldsOfRequesterResponder:(id)a3;
- (BOOL)_validateRequestingApplication:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (void)awakeFromInsert;
@end

@implementation STAskForTimeRequestResponse

+ (id)upsertAskForTimeRequest:(id)a3 fromUser:(id)a4 inContext:(id)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [a1 fetchRequest];
  v15 = [v12 dsid];
  v16 = [a1 _fetchPredicateForAskForTimeRequest:v11 requestingUserDSID:v15];
  [v14 setPredicate:v16];

  id v62 = 0;
  v17 = [v14 execute:&v62];
  id v18 = v62;
  v19 = v18;
  if (v17)
  {
    id v61 = v18;
    id v60 = v13;
    if ([v17 count])
    {
      v20 = [v17 firstObject];
      v21 = +[STLog ask];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        v53 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v54 = objc_opt_new();
        v55 = [v53 nextDateAfterDate:v54 matchingHour:0 minute:0 second:0 options:1024];
        [(STAskForTimeRequestResponse *)v20 setExpirationDate:v55];

        v56 = [v11 timeRequested];
        [(STAskForTimeRequestResponse *)v20 setTimeRequested:v56];

        v20 = v20;
        v23 = v20;
LABEL_31:

        id v13 = v60;
        v19 = v61;
        goto LABEL_32;
      }
      v22 = [(STAskForTimeRequestResponse *)v20 identifier];
      *(_DWORD *)buf = 138543618;
      v64 = v20;
      __int16 v65 = 2114;
      v66 = v22;
      _os_log_impl(&dword_1DA519000, v21, OS_LOG_TYPE_DEFAULT, "Updating existing ask for time request %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    else
    {
      v59 = a6;
      v20 = [[STAskForTimeRequestResponse alloc] initWithContext:v13];
      v24 = [v12 familySettings];
      v25 = [v24 organization];
      [(STAskForTimeRequestResponse *)v20 setFamilyOrganization:v25];

      v21 = [v11 requestedResourceIdentifier];
      v26 = +[STLog ask];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v11 requestIdentifier];
        *(_DWORD *)buf = 138543618;
        v64 = (STAskForTimeRequestResponse *)v21;
        __int16 v65 = 2114;
        v66 = v27;
        _os_log_impl(&dword_1DA519000, v26, OS_LOG_TYPE_DEFAULT, "Adding new ask for time request for resource identifier %{public}@, request %{public}@", buf, 0x16u);
      }
      uint64_t v28 = [v11 usageType];
      [(STAskForTimeRequestResponse *)v20 setUsageType:v28];
      if (v28 == 2)
      {
        v36 = +[STLog ask];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:]((uint64_t)v21, v36, v37, v38, v39, v40, v41, v42);
        }

        [(STAskForTimeRequestResponse *)v20 setRequestedCategoryIdentifier:v21];
      }
      else if (v28 == 1)
      {
        v43 = +[STLog ask];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:]((uint64_t)v21, v43, v44, v45, v46, v47, v48, v49);
        }

        [(STAskForTimeRequestResponse *)v20 setRequestedWebDomain:v21];
      }
      else if (v28)
      {
        v50 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"STAskForTimeRequestResponse.m", 80, @"Unexpected usage type %ld", v28);
      }
      else
      {
        v29 = +[STLog ask];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          +[STAskForTimeRequestResponse upsertAskForTimeRequest:fromUser:inContext:error:]((uint64_t)v21, v29, v30, v31, v32, v33, v34, v35);
        }

        [(STAskForTimeRequestResponse *)v20 setRequestedApplicationBundleIdentifier:v21];
      }
      v51 = [(STAskForTimeRequestResponse *)v20 requestedApplicationBundleIdentifier];
      if (v51
        || ([(STAskForTimeRequestResponse *)v20 requestedWebDomain],
            (v51 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v58 = [(STAskForTimeRequestResponse *)v20 requestedCategoryIdentifier];

        if (!v58)
        {
          if (v59) {
            id *v59 = v61;
          }

          v23 = 0;
          goto LABEL_31;
        }
      }
      [(STAskForTimeRequestResponse *)v20 setRequestingUser:v12];
      if (_os_feature_enabled_impl())
      {
        v52 = [v11 requestIdentifier];
        [(STAskForTimeRequestResponse *)v20 setIdentifier:v52];
      }
      v22 = objc_opt_new();
      [(STAskForTimeRequestResponse *)v20 setRequestTimeStamp:v22];
    }

    goto LABEL_30;
  }
  v23 = 0;
  if (a6) {
    *a6 = v18;
  }
LABEL_32:

  return v23;
}

+ (id)_fetchPredicateForAskForTimeRequest:(id)a3 requestingUserDSID:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 usageType];
  v10 = [v7 requestedResourceIdentifier];
  switch(v9)
  {
    case 2:
      id v11 = (void *)MEMORY[0x1E4F28F60];
      id v12 = @"requestedCategoryIdentifier";
      goto LABEL_7;
    case 1:
      id v11 = (void *)MEMORY[0x1E4F28F60];
      id v12 = @"requestedWebDomain";
      goto LABEL_7;
    case 0:
      id v11 = (void *)MEMORY[0x1E4F28F60];
      id v12 = @"requestedApplicationBundleIdentifier";
LABEL_7:
      id v13 = [v11 predicateWithFormat:@"(%K == %@)", v12, v10];
      goto LABEL_9;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"STAskForTimeRequestResponse.m", 121, @"Unexpected usage type %ld", v9);

  id v13 = 0;
LABEL_9:
  v15 = (void *)MEMORY[0x1E4F28F60];
  v16 = [NSNumber numberWithInteger:v9];
  v17 = objc_opt_new();
  id v18 = [v15 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K > %@) && (%K == NULL)", @"usageType", v16, @"requestingUser.dsid", v8, @"expirationDate", v17, @"respondingUser"];

  v19 = (void *)MEMORY[0x1E4F28F60];
  v20 = [v7 requestIdentifier];
  v21 = [v19 predicateWithFormat:@"(%K == %@)", @"identifier", v20];

  v22 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v18;
  v30[1] = v13;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v24 = [v22 andPredicateWithSubpredicates:v23];

  v25 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v24;
  v29[1] = v21;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v27 = [v25 orPredicateWithSubpredicates:v26];

  return v27;
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)STAskForTimeRequestResponse;
  [(STAskForTimeRequestResponse *)&v4 awakeFromInsert];
  v3 = objc_opt_new();
  [(STAskForTimeRequestResponse *)self setPrimitiveValue:v3 forKey:@"identifier"];
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STAskForTimeRequestResponse;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeRequestResponse;
  if (-[STAskForTimeRequestResponse validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STAskForTimeRequestResponse *)self _validateRequestingApplication:v5];
    [(STAskForTimeRequestResponse *)self _validateFieldsOfRequesterResponder:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STAskForTimeRequestResponse validateForUpdate:]((uint64_t)v5, v6);
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STAskForTimeRequestResponse;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STAskForTimeRequestResponse validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeRequestResponse;
  if (-[STAskForTimeRequestResponse validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STAskForTimeRequestResponse *)self _validateRequestingApplication:v5];
    [(STAskForTimeRequestResponse *)self _validateFieldsOfRequesterResponder:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STAskForTimeRequestResponse validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STAskForTimeRequestResponse;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STAskForTimeRequestResponse validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeRequestResponse;
  if (-[STAskForTimeRequestResponse validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STAskForTimeRequestResponse validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STAskForTimeRequestResponse;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STAskForTimeRequestResponse validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateRequestingApplication:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[STAskForTimeRequestResponse fetchRequest];
  id v28 = 0;
  v5 = [v4 execute:&v28];
  id v6 = v28;
  BOOL v7 = v6;
  if (!v5)
  {
    [v3 addObject:v6];
    BOOL v20 = 0;
    goto LABEL_17;
  }
  id v23 = v6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v22 = v5;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v25;
  uint64_t v12 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
      v15 = [v14 requestedApplicationBundleIdentifier];
      if (v15) {
        goto LABEL_9;
      }
      v15 = [v14 requestedWebDomain];
      if (v15) {
        goto LABEL_9;
      }
      v16 = [v14 requestedCategoryIdentifier];

      if (!v16)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = v12;
        uint64_t v30 = @"AskForTimeRequestResponse is missing a valid requested application identifer.";
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v18 = [v17 errorWithDomain:@"STErrorDomain" code:561 userInfo:v15];
        [v3 addObject:v18];

LABEL_9:
      }
      ++v13;
    }
    while (v10 != v13);
    uint64_t v19 = [v8 countByEnumeratingWithState:&v24 objects:v31 count:16];
    uint64_t v10 = v19;
  }
  while (v19);
LABEL_15:

  BOOL v20 = [v3 count] == 0;
  BOOL v7 = v23;
  v5 = v22;
LABEL_17:

  return v20;
}

- (BOOL)_validateFieldsOfRequesterResponder:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[STAskForTimeRequestResponse fetchRequest];
  id v55 = 0;
  v5 = [v4 execute:&v55];
  id v6 = v55;
  BOOL v7 = v6;
  if (!v5)
  {
    [v3 addObject:v6];
    BOOL v44 = 0;
    goto LABEL_33;
  }
  id v47 = v6;
  uint64_t v48 = v4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v46 = v5;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (!v8) {
    goto LABEL_31;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v52;
  uint64_t v50 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
      if (v12)
      {
        uint64_t v13 = [*(id *)(*((void *)&v51 + 1) + 8 * v11) requestingUser];
        uint64_t v14 = [v12 respondingUser];
        v15 = (void *)v14;
        if (!(v14 | v13))
        {
          v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v66 = v50;
          uint64_t v67 = @"AskForTimeRequestResponse is missing a valid responding or requesting user.";
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          id v18 = v16;
          uint64_t v19 = 564;
          goto LABEL_10;
        }
        if (v14)
        {
          v21 = [v12 respondingUser];
          v22 = [v21 familyMemberType];

          if (v22 != @"Adult")
          {
            id v23 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v64 = v50;
            __int16 v65 = @"AskForTimeRequestResponse responding user is not an adult.";
            long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
            long long v25 = [v23 errorWithDomain:@"STErrorDomain" code:562 userInfo:v24];
            [v3 addObject:v25];
          }
          uint64_t v26 = objc_msgSend(v12, "amountGranted", v46, v47, v48);
          if (!v26) {
            goto LABEL_19;
          }
          long long v27 = (void *)v26;
          uint64_t v28 = [v12 answer];
          if (!v28)
          {

            goto LABEL_19;
          }
          uint64_t v29 = (void *)v28;
          uint64_t v30 = [v12 responseTimeStamp];

          if (!v30)
          {
LABEL_19:
            uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v62 = v50;
            v63 = @"AskForTimeRequestResponse is missing a field from the responding user.";
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
            uint64_t v33 = [v31 errorWithDomain:@"STErrorDomain" code:562 userInfo:v32];
            [v3 addObject:v33];
          }
        }
        if (v13)
        {
          if (([(id)v13 isManaged] & 1) == 0)
          {
            uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v60 = v50;
            id v61 = @"AskForTimeRequestResponse requesting user is not managed.";
            uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
            v36 = [v34 errorWithDomain:@"STErrorDomain" code:565 userInfo:v35];
            [v3 addObject:v36];
          }
          objc_msgSend((id)v13, "familyMemberType", v46, v47, v48);
          uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v37 != @"Child")
          {
            uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v58 = v50;
            v59 = @"AskForTimeRequestResponse requesting user is not a child.";
            uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            uint64_t v40 = [v38 errorWithDomain:@"STErrorDomain" code:566 userInfo:v39];
            [v3 addObject:v40];
          }
          uint64_t v41 = [v12 timeRequested];

          if (!v41)
          {
            uint64_t v42 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v56 = v50;
            v57 = @"AskForTimeRequestResponse is missing a field from the requesting user.";
            v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
            id v18 = v42;
            uint64_t v19 = 563;
LABEL_10:
            BOOL v20 = objc_msgSend(v18, "errorWithDomain:code:userInfo:", @"STErrorDomain", v19, v17, v46, v47, v48);
            [v3 addObject:v20];
          }
        }
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
    uint64_t v9 = v43;
  }
  while (v43);
LABEL_31:

  BOOL v44 = [v3 count] == 0;
  BOOL v7 = v47;
  objc_super v4 = v48;
  v5 = v46;
LABEL_33:

  return v44;
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)upsertAskForTimeRequest:(uint64_t)a3 fromUser:(uint64_t)a4 inContext:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateForUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  id v3 = "-[STAskForTimeRequestResponse validateForUpdate:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "%{public}s Validate for update on AskForMoreTimeRequestResponse failed with error: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update for AskForMoreTimeRequestResponse failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on AskForMoreTimeRequestResponse failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on AskForMoreTimeRequestResponse failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end