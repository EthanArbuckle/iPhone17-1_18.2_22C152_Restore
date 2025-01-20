@interface FCNetworkReachability
+ (id)sharedNetworkReachability;
- (BOOL)accessRestrictedBecauseOfAppVersion;
- (BOOL)accessRestrictedBecauseOfCountry;
- (BOOL)accessRestrictedBecauseOfDeviceAbandoned;
- (BOOL)accessRestrictedBecauseOfOSVersion;
- (BOOL)isCloudKitAccessAllowed;
- (BOOL)isCloudKitReachable;
- (BOOL)isLowDataModeEnabled;
- (BOOL)isNetworkOnlyReachableViaCellular;
- (BOOL)isNetworkReachable;
- (BOOL)isNetworkReachableViaCellular;
- (BOOL)isNetworkReachableViaOther;
- (BOOL)isNetworkReachableViaWiFi;
- (BOOL)isNetworkUsageExpensive;
- (BOOL)isNetworkUsageInexpensive;
- (FCNetworkReachability)init;
- (NSHashTable)observers;
- (int64_t)_cellularRadioAccessTechnology;
- (int64_t)_cellularRadioAccessTechnologyFromString:(id)a3;
- (int64_t)cellularRadioAccessTechnology;
- (int64_t)offlineReason;
- (int64_t)reachabilityStatus;
- (void)_accessRestrictionsChanged;
- (void)_reachabilityChanged:(id)a3;
- (void)_updateReachability;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAccessRestrictedBecauseOfAppVersion:(BOOL)a3;
- (void)setAccessRestrictedBecauseOfCountry:(BOOL)a3;
- (void)setAccessRestrictedBecauseOfDeviceAbandoned:(BOOL)a3;
- (void)setAccessRestrictedBecauseOfOSVersion:(BOOL)a3;
- (void)setCellularRadioAccessTechnology:(int64_t)a3;
- (void)setIsCloudKitAccessAllowed:(BOOL)a3;
- (void)setIsLowDataModeEnabled:(BOOL)a3;
- (void)setIsNetworkReachable:(BOOL)a3;
- (void)setIsNetworkReachableViaCellular:(BOOL)a3;
- (void)setIsNetworkReachableViaOther:(BOOL)a3;
- (void)setIsNetworkReachableViaWiFi:(BOOL)a3;
- (void)setIsNetworkUsageExpensive:(BOOL)a3;
- (void)setObservers:(id)a3;
@end

@implementation FCNetworkReachability

void __37__FCNetworkReachability_addObserver___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setAccessRestrictedBecauseOfOSVersion:(BOOL)a3
{
  self->_accessRestrictedBecauseOfOSVersion = a3;
  [(FCNetworkReachability *)self _accessRestrictionsChanged];
}

- (void)setAccessRestrictedBecauseOfDeviceAbandoned:(BOOL)a3
{
  self->_accessRestrictedBecauseOfDeviceAbandoned = a3;
  [(FCNetworkReachability *)self _accessRestrictionsChanged];
}

- (void)setAccessRestrictedBecauseOfAppVersion:(BOOL)a3
{
  self->_accessRestrictedBecauseOfAppVersion = a3;
  [(FCNetworkReachability *)self _accessRestrictionsChanged];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__FCNetworkReachability_addObserver___block_invoke_2;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = self;
    id v7 = v4;
    FCPerformBlockOnMainThread(v6);
  }
}

- (void)setAccessRestrictedBecauseOfCountry:(BOOL)a3
{
  self->_accessRestrictedBecauseOfCountry = a3;
  [(FCNetworkReachability *)self _accessRestrictionsChanged];
}

+ (id)sharedNetworkReachability
{
  if (_MergedGlobals_224 != -1) {
    dispatch_once(&_MergedGlobals_224, &__block_literal_global_174);
  }
  id v2 = (void *)qword_1EB5D1BA8;
  return v2;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

uint64_t __50__FCNetworkReachability_sharedNetworkReachability__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_1EB5D1BA8;
  qword_1EB5D1BA8 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCNetworkReachability)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCNetworkReachability;
  id v2 = [(FCNetworkReachability *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_isCloudKitAccessAllowed = 1;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__reachabilityChanged_ name:*MEMORY[0x1E4F81C38] object:0];

    [(FCNetworkReachability *)v2 _updateReachability];
  }
  return v2;
}

- (BOOL)isCloudKitReachable
{
  BOOL v3 = [(FCNetworkReachability *)self isNetworkReachable];
  if (v3)
  {
    LOBYTE(v3) = [(FCNetworkReachability *)self isCloudKitAccessAllowed];
  }
  return v3;
}

- (void)_reachabilityChanged:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(FCNetworkReachability *)self isNetworkReachable];
  BOOL v5 = [(FCNetworkReachability *)self isNetworkReachableViaWiFi];
  BOOL v6 = [(FCNetworkReachability *)self isCloudKitAccessAllowed];
  BOOL v7 = [(FCNetworkReachability *)self isNetworkUsageExpensive];
  BOOL v8 = [(FCNetworkReachability *)self isLowDataModeEnabled];
  [(FCNetworkReachability *)self _updateReachability];
  v9 = [(FCNetworkReachability *)self observers];
  v10 = (void *)[v9 copy];

  if (v4 != [(FCNetworkReachability *)self isNetworkReachable]
    || v6 != [(FCNetworkReachability *)self isCloudKitAccessAllowed]
    || v7 != [(FCNetworkReachability *)self isNetworkUsageExpensive]
    || v8 != [(FCNetworkReachability *)self isLowDataModeEnabled])
  {
    BOOL v29 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v16 networkReachabilityDidChange:self];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v13);
    }

    BOOL v5 = v29;
  }
  if (v5 != [(FCNetworkReachability *)self isNetworkReachableViaWiFi])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v22 wifiReachabilityDidChange:self];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v19);
    }
  }
  if (v4 != [(FCNetworkReachability *)self isNetworkReachable])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v10;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v30 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [v28 networkReachabilityConnectivityDidChange:self];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v25);
    }
  }
}

- (BOOL)isLowDataModeEnabled
{
  return self->_isLowDataModeEnabled;
}

- (BOOL)isNetworkUsageExpensive
{
  return self->_isNetworkUsageExpensive;
}

- (void)_updateReachability
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F81BF8] sharedInstance];
  unint64_t v4 = [v3 currentReachabilityStatus];

  [(FCNetworkReachability *)self setIsNetworkReachableViaWiFi:v4 & 1];
  [(FCNetworkReachability *)self setIsNetworkReachableViaCellular:(v4 >> 1) & 1];
  [(FCNetworkReachability *)self setIsNetworkReachableViaOther:(v4 >> 2) & 1];
  BOOL v5 = [(FCNetworkReachability *)self isNetworkReachableViaWiFi]
    || [(FCNetworkReachability *)self isNetworkReachableViaCellular]
    || [(FCNetworkReachability *)self isNetworkReachableViaOther];
  [(FCNetworkReachability *)self setIsNetworkReachable:v5];
  [(FCNetworkReachability *)self setIsNetworkUsageExpensive:(v4 >> 3) & 1];
  [(FCNetworkReachability *)self setIsLowDataModeEnabled:(v4 >> 4) & 1];
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfAppVersion]
    || [(FCNetworkReachability *)self accessRestrictedBecauseOfCountry]
    || [(FCNetworkReachability *)self accessRestrictedBecauseOfOSVersion])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(FCNetworkReachability *)self accessRestrictedBecauseOfDeviceAbandoned] ^ 1;
  }
  [(FCNetworkReachability *)self setIsCloudKitAccessAllowed:v6];
  [(FCNetworkReachability *)self setCellularRadioAccessTechnology:[(FCNetworkReachability *)self _cellularRadioAccessTechnology]];
  BOOL v7 = (void *)FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    v9[0] = 67110144;
    v9[1] = [(FCNetworkReachability *)self isNetworkReachable];
    __int16 v10 = 1024;
    BOOL v11 = [(FCNetworkReachability *)self isNetworkReachableViaWiFi];
    __int16 v12 = 1024;
    BOOL v13 = [(FCNetworkReachability *)self isNetworkReachableViaCellular];
    __int16 v14 = 1024;
    BOOL v15 = [(FCNetworkReachability *)self isNetworkReachableViaOther];
    __int16 v16 = 1024;
    BOOL v17 = [(FCNetworkReachability *)self isCloudKitAccessAllowed];
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Reachability Changed. Network Reachable: %d, via Wi-Fi: %d, via Cellular: %d, via Other: %d, CloudKit Access Allowed: %d", (uint8_t *)v9, 0x20u);
  }
}

- (BOOL)isNetworkReachableViaWiFi
{
  return self->_isNetworkReachableViaWiFi;
}

- (void)_accessRestrictionsChanged
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(FCNetworkReachability *)self isCloudKitAccessAllowed];
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfAppVersion]
    || [(FCNetworkReachability *)self accessRestrictedBecauseOfCountry]
    || [(FCNetworkReachability *)self accessRestrictedBecauseOfOSVersion])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(FCNetworkReachability *)self accessRestrictedBecauseOfDeviceAbandoned] ^ 1;
  }
  [(FCNetworkReachability *)self setIsCloudKitAccessAllowed:v4];
  if (v3 != [(FCNetworkReachability *)self isCloudKitAccessAllowed])
  {
    BOOL v5 = (void *)FCReachabilityLog;
    if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      *(_DWORD *)buf = 67109120;
      BOOL v21 = [(FCNetworkReachability *)self isCloudKitAccessAllowed];
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Access restrictions changed. CloudKit access allowed: %d", buf, 8u);
    }
    BOOL v7 = [(FCNetworkReachability *)self observers];
    BOOL v8 = (void *)[v7 copy];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "networkReachabilityDidChange:", self, (void)v15);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)isCloudKitAccessAllowed
{
  return self->_isCloudKitAccessAllowed;
}

- (int64_t)offlineReason
{
  if (![(FCNetworkReachability *)self isNetworkReachable]) {
    return 1;
  }
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfCountry]) {
    return 3;
  }
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfAppVersion]) {
    return 4;
  }
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfOSVersion]) {
    return 5;
  }
  if ([(FCNetworkReachability *)self accessRestrictedBecauseOfDeviceAbandoned])
  {
    return 6;
  }
  return 0;
}

- (BOOL)accessRestrictedBecauseOfOSVersion
{
  return self->_accessRestrictedBecauseOfOSVersion;
}

- (BOOL)accessRestrictedBecauseOfDeviceAbandoned
{
  return self->_accessRestrictedBecauseOfDeviceAbandoned;
}

- (BOOL)accessRestrictedBecauseOfCountry
{
  return self->_accessRestrictedBecauseOfCountry;
}

- (BOOL)accessRestrictedBecauseOfAppVersion
{
  return self->_accessRestrictedBecauseOfAppVersion;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsCloudKitAccessAllowed:(BOOL)a3
{
  self->_isCloudKitAccessAllowed = a3;
}

- (void)setIsNetworkUsageExpensive:(BOOL)a3
{
  self->_isNetworkUsageExpensive = a3;
}

- (void)setIsNetworkReachableViaWiFi:(BOOL)a3
{
  self->_isNetworkReachableViaWiFuint64_t i = a3;
}

- (void)setIsNetworkReachableViaOther:(BOOL)a3
{
  self->_isNetworkReachableViaOther = a3;
}

- (void)setIsNetworkReachableViaCellular:(BOOL)a3
{
  self->_isNetworkReachableViaCellular = a3;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (void)setIsLowDataModeEnabled:(BOOL)a3
{
  self->_isLowDataModeEnabled = a3;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  self->_cellularRadioAccessTechnology = a3;
}

- (int64_t)_cellularRadioAccessTechnology
{
  id v3 = objc_alloc(MEMORY[0x1E4F23A80]);
  uint64_t v4 = (void *)[v3 initWithQueue:MEMORY[0x1E4F14428]];
  id v17 = 0;
  BOOL v5 = [v4 getCurrentDataServiceDescriptorSync:&v17];
  id v6 = v17;
  BOOL v7 = v6;
  if (v5)
  {
    id v14 = v6;
    BOOL v8 = [v4 getCurrentRat:v5 error:&v14];
    id v9 = v14;

    if (v8)
    {
      int64_t v10 = [(FCNetworkReachability *)self _cellularRadioAccessTechnologyFromString:v8];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_23;
      v12[3] = &unk_1E5B53FE0;
      id v9 = v9;
      id v13 = v9;
      __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_23((uint64_t)v12);

      int64_t v10 = 0;
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke;
    v15[3] = &unk_1E5B53FE0;
    id v9 = v6;
    id v16 = v9;
    __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke((uint64_t)v15);
    int64_t v10 = 0;
    BOOL v8 = v16;
  }

  return v10;
}

uint64_t __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_23(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Could not query RAT: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (BOOL)isNetworkReachableViaOther
{
  return self->_isNetworkReachableViaOther;
}

- (BOOL)isNetworkReachableViaCellular
{
  return self->_isNetworkReachableViaCellular;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F81C38] object:0];

  v4.receiver = self;
  v4.super_class = (Class)FCNetworkReachability;
  [(FCNetworkReachability *)&v4 dealloc];
}

- (BOOL)isNetworkUsageInexpensive
{
  return ![(FCNetworkReachability *)self isNetworkUsageExpensive];
}

- (BOOL)isNetworkOnlyReachableViaCellular
{
  BOOL v3 = [(FCNetworkReachability *)self isNetworkReachableViaCellular];
  if (v3) {
    LOBYTE(v3) = ![(FCNetworkReachability *)self isNetworkReachableViaWiFi];
  }
  return v3;
}

- (int64_t)reachabilityStatus
{
  id v2 = +[FCNetworkReachability sharedNetworkReachability];
  if ([v2 isNetworkReachable])
  {
    if ([v2 isNetworkReachableViaCellular])
    {
      int64_t v3 = 3;
    }
    else if ([v2 isNetworkReachableViaWiFi])
    {
      int64_t v3 = 2;
    }
    else if ([v2 isNetworkReachableViaOther])
    {
      int64_t v3 = 4;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__FCNetworkReachability_removeObserver___block_invoke_2;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = self;
    id v7 = v4;
    FCPerformBlockOnMainThread(v6);
  }
}

void __40__FCNetworkReachability_removeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) observers];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is not an observer", *(void *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCNetworkReachability removeObserver:]_block_invoke_2";
    __int16 v8 = 2080;
    id v9 = "FCNetworkReachability.m";
    __int16 v10 = 1024;
    int v11 = 225;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = [*(id *)(a1 + 32) observers];
  [v4 removeObject:*(void *)(a1 + 40)];
}

uint64_t __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Could not get current data service descriptor: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (int64_t)_cellularRadioAccessTechnologyFromString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_30;
  }
  if (([v3 isEqualToString:*MEMORY[0x1E4F238E0]] & 1) == 0)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F238D8]])
    {
      int64_t v5 = 2;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F23910]])
    {
      int64_t v5 = 3;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238E8]])
    {
      int64_t v5 = 4;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238F0]])
    {
      int64_t v5 = 5;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238B8]])
    {
      int64_t v5 = 6;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238C0]])
    {
      int64_t v5 = 7;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238C8]])
    {
      int64_t v5 = 8;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238D0]])
    {
      int64_t v5 = 9;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F23918]])
    {
      int64_t v5 = 10;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F238F8]])
    {
      int64_t v5 = 11;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F23908]])
    {
      int64_t v5 = 12;
      goto LABEL_31;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F23900]])
    {
      int64_t v5 = 13;
      goto LABEL_31;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
      int v8 = 136315906;
      id v9 = "-[FCNetworkReachability _cellularRadioAccessTechnologyFromString:]";
      __int16 v10 = 2080;
      int v11 = "FCNetworkReachability.m";
      __int16 v12 = 1024;
      int v13 = 380;
      __int16 v14 = 2114;
      long long v15 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
LABEL_30:
    int64_t v5 = 0;
    goto LABEL_31;
  }
  int64_t v5 = 1;
LABEL_31:

  return v5;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end