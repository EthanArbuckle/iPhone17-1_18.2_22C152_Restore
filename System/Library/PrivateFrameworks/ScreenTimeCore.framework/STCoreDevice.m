@interface STCoreDevice
+ (id)fetchDeviceWithCoreDuetIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateLocalDeviceInContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchRequestForDevicesMissingUsage;
+ (id)fetchRequestForLocalDevices;
+ (id)fetchRequestForNonLocalDevices;
- (BOOL)_validateLocalDevice:(id)a3;
- (BOOL)_validateNumberOfLocalDevices:(id)a3;
- (BOOL)_validateRemoteDevice:(id)a3;
- (BOOL)_validateUniqueIdentifier:(id)a3;
- (BOOL)_validateUserDeviceStates:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
@end

@implementation STCoreDevice

+ (id)fetchDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[STCoreDevice fetchRequest];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v8];

  [v9 setPredicate:v10];
  id v18 = 0;
  v11 = [v7 executeFetchRequest:v9 error:&v18];

  id v12 = v18;
  v13 = v12;
  if (v11)
  {
    if ((unint64_t)[v11 count] < 2)
    {
      uint64_t v16 = [v11 count];
      if (a5 && !v16)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:13 userInfo:0];
      }
    }
    else
    {
      v14 = +[STLog persistence];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[STCoreDevice fetchDeviceWithIdentifier:inContext:error:]((uint64_t)v11, v14);
      }
    }
    v15 = [v11 firstObject];
  }
  else
  {
    v15 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v15;
}

+ (id)fetchDeviceWithCoreDuetIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[STUserDeviceState fetchRequest];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"coreDuetIdentifier", v8];

  [v9 setPredicate:v10];
  id v19 = 0;
  v11 = [v7 executeFetchRequest:v9 error:&v19];

  id v12 = v19;
  v13 = v12;
  if (v11)
  {
    if ((unint64_t)[v11 count] < 2)
    {
      uint64_t v16 = [v11 count];
      if (a5 && !v16)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:13 userInfo:0];
      }
    }
    else
    {
      v14 = +[STLog persistence];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[STCoreDevice fetchDeviceWithCoreDuetIdentifier:inContext:error:]((uint64_t)v11, v14);
      }
    }
    v17 = [v11 firstObject];
    v15 = [v17 device];
  }
  else
  {
    v15 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v15;
}

+ (id)fetchOrCreateDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v17 = 0;
  v10 = [a1 fetchDeviceWithIdentifier:v8 inContext:v9 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (v10)
  {
LABEL_9:
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v13 = [v11 domain];
  if (![v13 isEqualToString:@"STErrorDomain"])
  {
    v10 = 0;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v14 = [v12 code];

  if (v14 == 13)
  {
    v15 = +[STLog screentime];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "+[STCoreDevice fetchOrCreateDeviceWithIdentifier:inContext:error:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating CoreDevice with deviceIdentifier: (%@)", buf, 0x16u);
    }

    v10 = [[STCoreDevice alloc] initWithContext:v9];
    [(STCoreDevice *)v10 setIdentifier:v8];
    v13 = v12;
    id v12 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (a5) {
LABEL_10:
  }
    *a5 = v12;
LABEL_11:

  return v10;
}

+ (id)fetchOrCreateLocalDeviceInContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = STGetDeviceUUID();
  id v7 = +[STCoreDevice fetchOrCreateDeviceWithIdentifier:v6 inContext:v5 error:a4];

  id v8 = [v7 name];

  if (!v8)
  {
    id v9 = STGetDeviceName();
    [v7 setName:v9];
  }
  if (![v7 platform]) {
    [v7 setPlatform:2];
  }
  return v7;
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STCoreDevice;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (id)fetchRequestForLocalDevices
{
  v2 = +[STCoreDevice fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28F60];
  objc_super v4 = STGetDeviceUUID();
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"identifier", v4];
  [v2 setPredicate:v5];

  return v2;
}

+ (id)fetchRequestForDevicesMissingUsage
{
  v2 = +[STCoreDevice fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K.@count == 0) AND (%K == NULL)", @"usages", @"localUserDeviceState");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestForNonLocalDevices
{
  v2 = +[STCoreDevice fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == NULL)", @"localUserDeviceState");
  [v2 setPredicate:v3];

  return v2;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STCoreDevice;
  if (!-[STCoreDevice validateForUpdate:](&v11, sel_validateForUpdate_))
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreDevice validateForUpdate:]();
    }
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    id v5 = objc_opt_new();
    [(STCoreDevice *)self _validateUniqueIdentifier:v5];
    [(STCoreDevice *)self _validateNumberOfLocalDevices:v5];
    v6 = [(STCoreDevice *)self localUserDeviceState];

    if (v6) {
      [(STCoreDevice *)self _validateLocalDevice:v5];
    }
    else {
      [(STCoreDevice *)self _validateRemoteDevice:v5];
    }
    [(STCoreDevice *)self _validateUserDeviceStates:v5];
    if ([v5 count])
    {
      id v8 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STCoreDevice validateForUpdate:](self);
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)STCoreDevice;
    BOOL v7 = [(NSManagedObject *)&v10 parseValidationErrors:a3 otherErrors:v5];
LABEL_15:

    return v7;
  }
  return 1;
}

- (BOOL)validateForInsert:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STCoreDevice;
  if (!-[STCoreDevice validateForInsert:](&v11, sel_validateForInsert_))
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreDevice validateForInsert:]();
    }
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    id v5 = objc_opt_new();
    [(STCoreDevice *)self _validateUniqueIdentifier:v5];
    [(STCoreDevice *)self _validateNumberOfLocalDevices:v5];
    v6 = [(STCoreDevice *)self localUserDeviceState];

    if (v6) {
      [(STCoreDevice *)self _validateLocalDevice:v5];
    }
    else {
      [(STCoreDevice *)self _validateRemoteDevice:v5];
    }
    [(STCoreDevice *)self _validateUserDeviceStates:v5];
    if ([v5 count])
    {
      id v8 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STCoreDevice validateForInsert:](self);
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)STCoreDevice;
    BOOL v7 = [(NSManagedObject *)&v10 parseValidationErrors:a3 otherErrors:v5];
LABEL_15:

    return v7;
  }
  return 1;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STCoreDevice;
  if (-[STCoreDevice validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    id v5 = objc_opt_new();
    [(STCoreDevice *)self _validateNumberOfLocalDevices:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreDevice validateForDelete:](self);
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STCoreDevice;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    id v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreDevice validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateLocalDevice:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STCoreDevice *)self identifier];
  v6 = STGetDeviceUUID();
  char v7 = [v5 isEqualToString:v6];

  id v8 = (uint64_t *)MEMORY[0x1E4F28568];
  if ((v7 & 1) == 0)
  {
    objc_super v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"A local device must have the UUID of the local device.";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    objc_super v11 = [v9 errorWithDomain:@"STErrorDomain" code:521 userInfo:v10];
    [v4 addObject:v11];
  }
  if ([(STCoreDevice *)self platform] != 2)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *v8;
    v26 = @"A local device must match the platform of the current device.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v14 = [v12 errorWithDomain:@"STErrorDomain" code:524 userInfo:v13];
    [v4 addObject:v14];
  }
  v15 = [(STCoreDevice *)self userDeviceStates];
  uint64_t v16 = [(STCoreDevice *)self localUserDeviceState];
  char v17 = [v15 containsObject:v16];

  if ((v17 & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *v8;
    v24 = @"The localUserDeviceState of a local device MUST be in the device's userDeviceState.";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    __int16 v20 = [v18 errorWithDomain:@"STErrorDomain" code:523 userInfo:v19];
    [v4 addObject:v20];
  }
  BOOL v21 = [v4 count] == 0;

  return v21;
}

- (BOOL)_validateNumberOfLocalDevices:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STCoreDevice fetchRequest];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"localUserDeviceState");
  [v4 setPredicate:v5];

  id v16 = 0;
  v6 = [v4 execute:&v16];
  id v7 = v16;
  if (!v6)
  {
    [v3 addObject:v7];
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"There must be one and only device with localUserDeviceState.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_super v10 = v8;
    uint64_t v11 = 518;
LABEL_8:
    uint64_t v14 = [v10 errorWithDomain:@"STErrorDomain" code:v11 userInfo:v9];
    [v3 addObject:v14];

    goto LABEL_9;
  }
  if (![v6 count])
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    id v18 = @"There must be local device (with localUserDeviceState).";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    objc_super v10 = v13;
    uint64_t v11 = 519;
    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)_validateRemoteDevice:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(STCoreDevice *)self platform];
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"A remote device must have a valid platform.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = [v6 errorWithDomain:@"STErrorDomain" code:526 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 != 0;
}

- (BOOL)_validateUniqueIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[STCoreDevice fetchRequest];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [(STCoreDevice *)self identifier];
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", v7];
  [v5 setPredicate:v8];

  id v16 = 0;
  objc_super v9 = [v5 execute:&v16];
  id v10 = v16;
  if (v9)
  {
    if ((unint64_t)[v9 count] < 2)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"There must be one and only device with a given UUID.";
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v13 = [v11 errorWithDomain:@"STErrorDomain" code:520 userInfo:v12];
    [v4 addObject:v13];
  }
  else
  {
    [v4 addObject:v10];
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)_validateUserDeviceStates:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(STCoreDevice *)self userDeviceStates];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"All devices must have at least 1 user device state.";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_super v9 = [v7 errorWithDomain:@"STErrorDomain" code:525 userInfo:v8];
    [v4 addObject:v9];
  }
  return v6 != 0;
}

+ (void)fetchDeviceWithIdentifier:(uint64_t)a1 inContext:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "device identifier is not unique but it should be:\n%@", (uint8_t *)&v2, 0xCu);
}

+ (void)fetchDeviceWithCoreDuetIdentifier:(uint64_t)a1 inContext:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "device identifier is not unique but it should be:\n%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)validateForUpdate:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for Update on Core Device failed for %{public}s user with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update for Core Device failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for Update on Core Device failed for %{public}s user with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert for Core Device failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for Update on Core Device failed for %{public}s user with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForDelete:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete for Core Device failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end