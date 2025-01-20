@interface PKBiometrics
+ (id)sharedInstance;
- (BKDevicePearl)pearlDevice;
- (BKDeviceTouchID)touchIDDevice;
- (BOOL)isPeriocularEnrollmentSupported;
- (BOOL)removeIdentity:(id)a3;
- (BOOL)setName:(id)a3 forIdentity:(id)a4;
- (PKBiometrics)init;
- (id)deviceForType:(int64_t)a3;
- (id)identitiesForIdentityType:(int64_t)a3;
- (id)nameForIdentity:(id)a3;
- (id)nextIdentityNameForIdentityType:(int64_t)a3;
- (int64_t)deviceTypeForIdentityType:(int64_t)a3;
- (int64_t)maximumIdentityCountForIdentityType:(int64_t)a3;
- (void)init;
- (void)isPeriocularEnrollmentSupported;
- (void)setPearlDevice:(id)a3;
- (void)setTouchIDDevice:(id)a3;
@end

@implementation PKBiometrics

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PKBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__PKBiometrics_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PKBiometrics)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKBiometrics;
  v2 = [(PKBiometrics *)&v24 init];
  if (v2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v3 = [MEMORY[0x1E4F50518] availableDevices];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (!v4) {
      goto LABEL_20;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    v17 = &v30;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "type", v17);
        if (v9 == 1)
        {
          id v18 = 0;
          uint64_t v14 = [MEMORY[0x1E4F50528] deviceWithDescriptor:v8 error:&v18];
          v11 = v18;
          touchIDDevice = v2->_touchIDDevice;
          v2->_touchIDDevice = (BKDeviceTouchID *)v14;

          if (v11) {
            goto LABEL_18;
          }
          v13 = _PSLoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(PKBiometrics *)v27 init];
          }
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          id v19 = 0;
          uint64_t v10 = [MEMORY[0x1E4F50520] deviceWithDescriptor:v8 error:&v19];
          v11 = v19;
          pearlDevice = v2->_pearlDevice;
          v2->_pearlDevice = (BKDevicePearl *)v10;

          if (v11) {
            goto LABEL_18;
          }
          v13 = _PSLoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(PKBiometrics *)buf init];
          }
LABEL_15:

          goto LABEL_18;
        }
        v11 = _PSLoggingFacility();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          [(PKBiometrics *)v25 init];
        }
LABEL_18:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v31 count:16];
      if (!v5)
      {
LABEL_20:

        return v2;
      }
    }
  }
  return v2;
}

- (id)identitiesForIdentityType:(int64_t)a3
{
  v3 = [(PKBiometrics *)self deviceForType:[(PKBiometrics *)self deviceTypeForIdentityType:a3]];
  id v9 = 0;
  uint64_t v4 = [v3 identitiesWithError:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics identitiesForIdentityType:]();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (int64_t)maximumIdentityCountForIdentityType:(int64_t)a3
{
  v3 = [(PKBiometrics *)self deviceForType:[(PKBiometrics *)self deviceTypeForIdentityType:a3]];
  id v9 = 0;
  uint64_t v4 = [v3 maxIdentityCountWithError:&v9];
  id v5 = v9;
  int64_t v6 = [v4 integerValue];

  if (v5)
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics maximumIdentityCountForIdentityType:]();
    }

    int64_t v6 = 0;
  }

  return v6;
}

- (id)nameForIdentity:(id)a3
{
  return (id)[a3 name];
}

- (BOOL)setName:(id)a3 forIdentity:(id)a4
{
  id v6 = a4;
  [v6 setName:a3];
  id v7 = -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v6 type]));
  id v12 = 0;
  char v8 = [v7 updateIdentity:v6 error:&v12];

  id v9 = v12;
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"PKBiometricsDidUpdate" object:0];
  }
  else
  {
    uint64_t v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics setName:forIdentity:]();
    }
  }

  return v8;
}

- (BOOL)removeIdentity:(id)a3
{
  id v4 = a3;
  id v5 = -[PKBiometrics deviceForType:](self, "deviceForType:", -[PKBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v4 type]));
  id v10 = 0;
  char v6 = [v5 removeIdentity:v4 error:&v10];

  id v7 = v10;
  if (v6)
  {
    char v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PKBiometricsDidUpdate" object:0];
  }
  else
  {
    char v8 = _PSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics removeIdentity:]();
    }
  }

  return v6;
}

- (BOOL)isPeriocularEnrollmentSupported
{
  v3 = [(PKBiometrics *)self pearlDevice];

  if (!v3) {
    return 0;
  }
  id v4 = [(PKBiometrics *)self pearlDevice];
  id v10 = 0;
  id v5 = [v4 supportsPeriocularEnrollmentWithError:&v10];
  id v6 = v10;

  if (v5)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    char v8 = _PSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics isPeriocularEnrollmentSupported]();
    }

    char v7 = 0;
  }

  return v7;
}

- (id)deviceForType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(PKBiometrics *)self touchIDDevice];
  }
  else if (a3 == 2)
  {
    v3 = [(PKBiometrics *)self pearlDevice];
  }
  else
  {
    id v4 = _PSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics deviceForType:]();
    }

    v3 = 0;
  }
  return v3;
}

- (int64_t)deviceTypeForIdentityType:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 != 2 && a3 != 1)
  {
    id v4 = _PSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PKBiometrics deviceTypeForIdentityType:]();
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)nextIdentityNameForIdentityType:(int64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  id v5 = +[PKBiometrics sharedInstance];
  id v6 = [v5 identitiesForIdentityType:a3];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v37 + 1) + 8 * i) name];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }

  v11 = +[PKBiometrics sharedInstance];
  unint64_t v12 = [v11 maximumIdentityCountForIdentityType:a3];

  v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v14 setNumberStyle:0];
  if (v12)
  {
    for (unint64_t j = 1; j <= v12; ++j)
    {
      v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:j];
      v17 = [v14 stringFromNumber:v16];

      if (a3 == 1)
      {
        long long v21 = NSString;
        long long v22 = PSLocalizableMesaStringForKey(@"IDENTITY_NAME_FORMAT");
        long long v20 = objc_msgSend(v21, "stringWithFormat:", v22, v17);
      }
      else if (a3 == 2)
      {
        id v18 = NSString;
        id v19 = PSLocalizablePearlStringForKey(@"IDENTITY_NAME_FORMAT");
        long long v20 = objc_msgSend(v18, "stringWithFormat:", v19, v17);
      }
      else
      {
        long long v20 = [NSString stringWithFormat:@"Unknown Identity %@", v17];
      }
      [v13 addObject:v20];
    }
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke;
  v35[3] = &unk_1E5C5E1F8;
  id v23 = v4;
  id v36 = v23;
  objc_super v24 = [v13 indexesOfObjectsPassingTest:v35];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke_2;
  v28[3] = &unk_1E5C5E220;
  id v25 = v23;
  id v29 = v25;
  int v30 = &v31;
  [v24 enumerateRangesWithOptions:2 usingBlock:v28];
  if (v32[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = objc_msgSend(v13, "objectAtIndex:");
  }

  _Block_object_dispose(&v31, 8);
  return v26;
}

uint64_t __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

unint64_t __48__PKBiometrics_nextIdentityNameForIdentityType___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= a2 && result - a2 < a3)
  {
    unint64_t result = [*(id *)(a1 + 32) count];
    a2 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (void)setPearlDevice:(id)a3
{
}

- (BKDeviceTouchID)touchIDDevice
{
  return self->_touchIDDevice;
}

- (void)setTouchIDDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDevice, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

- (void)init
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
}

- (void)identitiesForIdentityType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
}

- (void)maximumIdentityCountForIdentityType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
}

- (void)setName:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "An error occured while updating the identity name: %@", v2, v3, v4, v5, v6);
}

- (void)removeIdentity:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "An error occured while removing the identity: %@", v2, v3, v4, v5, v6);
}

- (void)isPeriocularEnrollmentSupported
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "Failed to check periocular support status: %@.", v2, v3, v4, v5, v6);
}

- (void)deviceForType:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
}

- (void)deviceTypeForIdentityType:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
}

@end