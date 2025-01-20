@interface PSUIBiometrics
+ (id)identities;
+ (id)sharedInstance;
- (BKDevicePearl)pearlDevice;
- (BKDeviceTouchID)touchIDDevice;
- (BOOL)isBiometricEditingAllowed;
- (BOOL)isEnrolledInFaceID;
- (BOOL)isFingerprintUnlockAllowed;
- (BOOL)isPeriocularEnrollmentSupported;
- (BOOL)isTouchIDUnlockRestricted;
- (BOOL)removeIdentity:(id)a3;
- (BOOL)setName:(id)a3 forIdentity:(id)a4;
- (BOOL)shouldRestrictFeaturesRequiringEnrollment;
- (PSUIBiometrics)init;
- (id)deviceForType:(int64_t)a3;
- (id)identitiesForIdentityType:(int64_t)a3;
- (id)nameForIdentity:(id)a3;
- (id)nextIdentityNameForIdentityType:(int64_t)a3;
- (int64_t)deviceTypeForIdentityType:(int64_t)a3;
- (int64_t)maximumIdentityCountForIdentityType:(int64_t)a3;
- (void)init;
- (void)isPeriocularEnrollmentSupported;
- (void)removeIdentity:(id)a3 completion:(id)a4;
- (void)setName:(id)a3 forIdentity:(id)a4 completion:(id)a5;
- (void)setPearlDevice:(id)a3;
- (void)setTouchIDDevice:(id)a3;
@end

@implementation PSUIBiometrics

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__PSUIBiometrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __32__PSUIBiometrics_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (PSUIBiometrics)init
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)PSUIBiometrics;
  v2 = [(PSUIBiometrics *)&v24 init];
  if (v2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v3 = [MEMORY[0x263F2AA30] availableDevices];
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
          uint64_t v14 = [MEMORY[0x263F2AA48] deviceWithDescriptor:v8 error:&v18];
          v11 = v18;
          touchIDDevice = v2->_touchIDDevice;
          v2->_touchIDDevice = (BKDeviceTouchID *)v14;

          if (v11) {
            goto LABEL_18;
          }
          v13 = PSUILogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(PSUIBiometrics *)v27 init];
          }
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          id v19 = 0;
          uint64_t v10 = [MEMORY[0x263F2AA40] deviceWithDescriptor:v8 error:&v19];
          v11 = v19;
          pearlDevice = v2->_pearlDevice;
          v2->_pearlDevice = (BKDevicePearl *)v10;

          if (v11) {
            goto LABEL_18;
          }
          v13 = PSUILogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(PSUIBiometrics *)buf init];
          }
LABEL_15:

          goto LABEL_18;
        }
        v11 = PSUILogForCategory(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          [(PSUIBiometrics *)v25 init];
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

+ (id)identities
{
  v2 = [MEMORY[0x263F2AA68] manager];
  v3 = [v2 identities:0];

  return v3;
}

- (id)identitiesForIdentityType:(int64_t)a3
{
  v3 = [(PSUIBiometrics *)self deviceForType:[(PSUIBiometrics *)self deviceTypeForIdentityType:a3]];
  id v9 = 0;
  uint64_t v4 = [v3 identitiesWithError:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = PSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics identitiesForIdentityType:]();
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
  v3 = [(PSUIBiometrics *)self deviceForType:[(PSUIBiometrics *)self deviceTypeForIdentityType:a3]];
  id v9 = 0;
  uint64_t v4 = [v3 maxIdentityCountWithError:&v9];
  id v5 = v9;
  int64_t v6 = [v4 integerValue];

  if (v5)
  {
    id v7 = PSUILogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics maximumIdentityCountForIdentityType:]();
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
  id v7 = -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v6 type]));
  id v12 = 0;
  char v8 = [v7 updateIdentity:v6 error:&v12];

  id v9 = v12;
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"PSUIBiometricsDidUpdate" object:0];
  }
  else
  {
    uint64_t v10 = PSUILogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics setName:forIdentity:]();
    }
  }

  return v8;
}

- (void)setName:(id)a3 forIdentity:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 setName:a3];
  uint64_t v10 = -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v9 type]));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke;
  v12[3] = &unk_264E95628;
  id v13 = v8;
  id v11 = v8;
  [v10 updateIdentity:v9 reply:v12];
}

void __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_2);
  }
  else
  {
    id v6 = PSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics setName:forIdentity:]();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_2;
  block[3] = &unk_264E95A50;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_6()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PSUIBiometricsDidUpdate" object:0];
}

uint64_t __49__PSUIBiometrics_setName_forIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)removeIdentity:(id)a3
{
  id v4 = a3;
  id v5 = -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v4 type]));
  id v10 = 0;
  char v6 = [v5 removeIdentity:v4 error:&v10];

  id v7 = v10;
  if (v6)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"PSUIBiometricsDidUpdate" object:0];
  }
  else
  {
    id v8 = PSUILogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics removeIdentity:]();
    }
  }

  return v6;
}

- (void)removeIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PSUIBiometrics deviceForType:](self, "deviceForType:", -[PSUIBiometrics deviceTypeForIdentityType:](self, "deviceTypeForIdentityType:", [v7 type]));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__PSUIBiometrics_removeIdentity_completion___block_invoke;
  v10[3] = &unk_264E95628;
  id v11 = v6;
  id v9 = v6;
  [v8 removeIdentity:v7 reply:v10];
}

void __44__PSUIBiometrics_removeIdentity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_10);
  }
  else
  {
    id v6 = PSUILogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics removeIdentity:]();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PSUIBiometrics_removeIdentity_completion___block_invoke_2;
  block[3] = &unk_264E95A50;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__PSUIBiometrics_removeIdentity_completion___block_invoke_8()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PSUIBiometricsDidUpdate" object:0];
}

uint64_t __44__PSUIBiometrics_removeIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)isPeriocularEnrollmentSupported
{
  v3 = [(PSUIBiometrics *)self pearlDevice];

  if (!v3) {
    return 0;
  }
  id v4 = [(PSUIBiometrics *)self pearlDevice];
  id v10 = 0;
  id v5 = [v4 supportsPeriocularEnrollmentWithError:&v10];
  id v6 = v10;

  if (v5)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    id v8 = PSUILogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics isPeriocularEnrollmentSupported]();
    }

    char v7 = 0;
  }

  return v7;
}

- (id)deviceForType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(PSUIBiometrics *)self touchIDDevice];
  }
  else if (a3 == 2)
  {
    v3 = [(PSUIBiometrics *)self pearlDevice];
  }
  else
  {
    id v4 = PSUILogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics deviceForType:]();
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
    id v4 = PSUILogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PSUIBiometrics deviceTypeForIdentityType:]();
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)nextIdentityNameForIdentityType:(int64_t)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  id v5 = +[PSUIBiometrics sharedInstance];
  id v6 = [v5 identitiesForIdentityType:a3];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v35 + 1) + 8 * i) name];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }

  id v11 = +[PSUIBiometrics sharedInstance];
  unint64_t v12 = [v11 maximumIdentityCountForIdentityType:a3];

  id v13 = [MEMORY[0x263EFF980] arrayWithCapacity:v12];
  id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v14 setNumberStyle:0];
  if (v12)
  {
    for (unint64_t j = 1; j <= v12; ++j)
    {
      v16 = [NSNumber numberWithUnsignedInteger:j];
      v17 = [v14 stringFromNumber:v16];

      if (a3 == 1 || a3 == 2)
      {
        id v18 = NSString;
        id v19 = PSLocalizableMesaStringForKey();
        long long v20 = objc_msgSend(v18, "stringWithFormat:", v19, v17);
      }
      else
      {
        long long v20 = [NSString stringWithFormat:@"Unknown Identity %@", v17];
      }
      [v13 addObject:v20];
    }
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke;
  v33[3] = &unk_264E95A78;
  id v21 = v4;
  id v34 = v21;
  long long v22 = [v13 indexesOfObjectsPassingTest:v33];
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke_2;
  v26[3] = &unk_264E95AA0;
  id v23 = v21;
  id v27 = v23;
  uint64_t v28 = &v29;
  [v22 enumerateRangesWithOptions:2 usingBlock:v26];
  if (v30[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v24 = 0;
  }
  else
  {
    objc_super v24 = objc_msgSend(v13, "objectAtIndex:");
  }

  _Block_object_dispose(&v29, 8);
  return v24;
}

uint64_t __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

unint64_t __50__PSUIBiometrics_nextIdentityNameForIdentityType___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, unsigned char *a4)
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

- (BOOL)isBiometricEditingAllowed
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isFingerprintModificationAllowed];

  return v3;
}

- (BOOL)shouldRestrictFeaturesRequiringEnrollment
{
  char v3 = [(id)objc_opt_class() identities];
  if ([v3 count]) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(PSUIBiometrics *)self isBiometricEditingAllowed];
  }

  return v4;
}

- (BOOL)isFingerprintUnlockAllowed
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F538E8]] == 1;

  return v3;
}

- (BOOL)isTouchIDUnlockRestricted
{
  BOOL v3 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v4 = ([v3 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F538E8]] & 1) != 0
    || [(PSUIBiometrics *)self shouldRestrictFeaturesRequiringEnrollment];

  return v4;
}

- (BOOL)isEnrolledInFaceID
{
  v2 = [(PSUIBiometrics *)self identitiesForIdentityType:2];
  BOOL v3 = [v2 count] != 0;

  return v3;
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
  OUTLINED_FUNCTION_2_0();
}

- (void)maximumIdentityCountForIdentityType:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
}

- (void)setName:forIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_23D33A000, v0, v1, "An error occured while updating the identity name: %@", v2, v3, v4, v5, v6);
}

- (void)removeIdentity:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_23D33A000, v0, v1, "An error occured while removing the identity: %@", v2, v3, v4, v5, v6);
}

- (void)isPeriocularEnrollmentSupported
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_23D33A000, v0, v1, "Failed to check periocular support status: %@.", v2, v3, v4, v5, v6);
}

- (void)deviceForType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
}

- (void)deviceTypeForIdentityType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
}

@end