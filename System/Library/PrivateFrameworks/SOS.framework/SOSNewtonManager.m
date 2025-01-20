@interface SOSNewtonManager
+ (void)checkEligibilityForAutoEnableWithCompletion:(id)a3;
+ (void)checkEligibilityForAutoEnableWithHealthStore:(id)a3 completion:(id)a4;
+ (void)newtonEligibilityWithCompletion:(id)a3;
+ (void)newtonEligibilityWithHealthStore:(id)a3 completion:(id)a4;
+ (void)newtonEligibilityWithHealthStore:(id)a3 deviceSupportsWorkoutsOnly:(BOOL)a4 completion:(id)a5;
@end

@implementation SOSNewtonManager

+ (void)newtonEligibilityWithHealthStore:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "newtonEligibilityWithHealthStore:deviceSupportsWorkoutsOnly:completion:", v7, +[SOSUtilities activeDeviceSupportsNewtonWorkoutsOnly](SOSUtilities, "activeDeviceSupportsNewtonWorkoutsOnly"), v6);
}

+ (void)newtonEligibilityWithHealthStore:(id)a3 deviceSupportsWorkoutsOnly:(BOOL)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = v9;
  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    [v10 setDebugIdentifier:@"com.apple.sos"];
    [v10 resume];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke;
  v23[3] = &unk_1E6064E68;
  BOOL v25 = a4;
  id v11 = v8;
  id v24 = v11;
  v12 = (void (**)(void, void))MEMORY[0x1B3EC08A0](v23);
  id v22 = 0;
  v13 = [v10 dateOfBirthComponentsWithError:&v22];
  id v14 = v22;
  v15 = v14;
  if (!v13 || v14)
  {
    v19 = sos_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_impl(&dword_1B3A94000, v19, OS_LOG_TYPE_DEFAULT, "Could not retrieve age from Health record; error: %@. Querying medical ID.",
        buf,
        0xCu);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke_287;
    v20[3] = &unk_1E6064E90;
    v21 = v12;
    [v10 fetchMedicalIDDataWithCompletion:v20];
    v17 = v21;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v17 = (void *)[v16 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v18 = [v17 dateFromComponents:v13];
    ((void (**)(void, void *))v12)[2](v12, v18);
  }
}

void __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [v5 components:28 fromDate:v3 toDate:v6 options:0];

    if ([v7 year] >= 18)
    {
      if ([v7 year] <= 54)
      {
        if (*(unsigned char *)(a1 + 40))
        {
          if ([v7 year] <= 17) {
            uint64_t v8 = 1;
          }
          else {
            uint64_t v8 = 4;
          }
        }
        else
        {
          uint64_t v8 = 1;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  id v9 = sos_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "Newton Eligibility based on age: %lu", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)newtonEligibilityWithCompletion:(id)a3
{
}

void __91__SOSNewtonManager_newtonEligibilityWithHealthStore_deviceSupportsWorkoutsOnly_completion___block_invoke_287(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 gmtBirthdate];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (void)checkEligibilityForAutoEnableWithCompletion:(id)a3
{
}

+ (void)checkEligibilityForAutoEnableWithHealthStore:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SOSNewtonManager_checkEligibilityForAutoEnableWithHealthStore_completion___block_invoke;
  v8[3] = &unk_1E6064EB8;
  id v9 = v6;
  id v7 = v6;
  [a1 newtonEligibilityWithHealthStore:a3 completion:v8];
}

uint64_t __76__SOSNewtonManager_checkEligibilityForAutoEnableWithHealthStore_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

@end