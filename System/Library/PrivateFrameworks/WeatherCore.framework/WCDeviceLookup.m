@interface WCDeviceLookup
- (ACAccountStore)accountStore;
- (WCDeviceLookup)init;
- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6;
@end

@implementation WCDeviceLookup

- (WCDeviceLookup)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCDeviceLookup;
  v2 = [(WCDeviceLookup *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  int64_t v8 = a3.var1;
  int64_t v9 = a3.var0;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = [(WCDeviceLookup *)self accountStore];
  v32[0] = *MEMORY[0x1E4F17750];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v30 = 0;
  v14 = [v12 accountsWithAccountTypeIdentifiers:v13 error:&v30];
  id v15 = v30;
  v16 = [v14 firstObject];

  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F4F018]);
    v18 = objc_msgSend(v16, "aa_altDSID");
    [v17 setAltDSID:v18];

    [v17 setIncludeUntrustedDevices:1];
    uint64_t v31 = *MEMORY[0x1E4F4EF10];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v17 setServices:v19];

    [v17 setOperatingSystems:&unk_1F0D523E0];
    id v20 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke;
    v22[3] = &unk_1E60A1F58;
    id v23 = v15;
    id v24 = v11;
    double v25 = a5;
    int64_t v26 = v9;
    int64_t v27 = v8;
    int64_t v28 = var0;
    int64_t v29 = var1;
    [v20 fetchDeviceListWithContext:v17 completion:v22];
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
  }
}

void __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v17 = a1;
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(obj);
          }
          int64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v10 = [v9 serialNumber];
          if (v10)
          {
            id v11 = [v4 objectForKeyedSubscript:v10];
            if (!v11
              || ([v9 lastUpdatedDate],
                  v12 = objc_claimAutoreleasedReturnValue(),
                  [v11 lastUpdatedDate],
                  v13 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v14 = [v12 compare:v13],
                  v13,
                  v12,
                  v14 == 1))
            {
              [v4 setObject:v9 forKeyedSubscript:v10];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    id v15 = [v4 allValues];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_2;
    v20[3] = &__block_descriptor_72_e24_B16__0__AKRemoteDevice_8l;
    v20[4] = *(void *)(v17 + 48);
    long long v16 = *(_OWORD *)(v17 + 72);
    long long v21 = *(_OWORD *)(v17 + 56);
    long long v22 = v16;
    objc_msgSend(v15, "wc_allObjectsPassTest:", v20);

    (*(void (**)(void))(*(void *)(v17 + 40) + 16))();
    id v3 = v18;
  }
}

BOOL __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 operatingSystemVersion];
  uint64_t v5 = [v4 componentsSeparatedByString:@"."];

  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 integerValue];

  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    int64_t v8 = [v5 objectAtIndexedSubscript:1];
    uint64_t v9 = [v8 integerValue];
  }
  v10 = [v3 lastUpdatedDate];
  objc_msgSend(v10, "wc_timeIntervalUntilNow");
  double v12 = v11;
  double v13 = *(double *)(a1 + 32);

  if (v12 <= v13)
  {
    id v15 = [v3 operatingSystemName];
    int v16 = [v15 isEqualToString:@"iOS"];

    if (v16)
    {
      if (v7 >= *(void *)(a1 + 40))
      {
        uint64_t v17 = (uint64_t *)(a1 + 48);
LABEL_13:
        BOOL v14 = v9 >= *v17;
        goto LABEL_14;
      }
    }
    else
    {
      id v18 = [v3 operatingSystemName];
      int v19 = [v18 isEqualToString:@"macOS"];

      if (v19 && v7 >= *(void *)(a1 + 56))
      {
        uint64_t v17 = (uint64_t *)(a1 + 64);
        goto LABEL_13;
      }
    }
    BOOL v14 = 0;
    goto LABEL_14;
  }
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
}

@end