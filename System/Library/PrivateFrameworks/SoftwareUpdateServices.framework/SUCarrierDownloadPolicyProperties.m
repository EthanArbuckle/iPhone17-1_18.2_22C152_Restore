@interface SUCarrierDownloadPolicyProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_isValidHour:(int64_t)a3;
- (BOOL)allowInexpensiveHDMUnlimited;
- (BOOL)isAutoDownloadAllowable;
- (BOOL)isDownloadAllowable;
- (BOOL)isDownloadAllowableOver2G;
- (BOOL)isDownloadFree;
- (SUCarrierDownloadPolicyProperties)init;
- (id)_getOverriddenProperties;
- (id)_keys;
- (id)_numberForKey:(id)a3;
- (id)description;
- (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)_longLongForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)maximumDownloadSizeInBytes;
- (int64_t)peakEndHour;
- (int64_t)peakStartHour;
- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(int64_t)a4;
- (unint64_t)numberOfDaysToWaitForCellularDownload;
@end

@implementation SUCarrierDownloadPolicyProperties

- (SUCarrierDownloadPolicyProperties)init
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)SUCarrierDownloadPolicyProperties;
  v2 = [(SUCarrierDownloadPolicyProperties *)&v36 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    keyMap = v2->_keyMap;
    v2->_keyMap = v3;

    v5 = [(SUCarrierDownloadPolicyProperties *)v2 _keys];
    v6 = +[CTDataDelegate sharedInstance];
    v7 = [v6 getPreferredDataSubscriptionContext];

    if (v7)
    {
      v31 = v2;
      v15 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:2];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v29 = v5;
      id obj = v5;
      uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
            v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"OTASoftwareUpdate", v20, 0);
            v22 = +[CTDataDelegate sharedInstance];
            v23 = [v22 getCTClient];
            v24 = (void *)[v23 copyCarrierBundleValueWithDefault:v7 keyHierarchy:v21 bundleType:v15 error:0];

            if (v24) {
              [(NSMutableDictionary *)v31->_keyMap setObject:v24 forKeyedSubscript:v20];
            }

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v17);
      }

      v2 = v31;
      v5 = v29;
    }
    else
    {
      SULogInfo(@"Failed to get preferred CTXPCServiceSubscriptionContext", v8, v9, v10, v11, v12, v13, v14, v28);
    }
    v25 = v2->_keyMap;
    v26 = [(SUCarrierDownloadPolicyProperties *)v2 _getOverriddenProperties];
    [(NSMutableDictionary *)v25 addEntriesFromDictionary:v26];
  }
  return v2;
}

- (BOOL)isDownloadFree
{
  return ![(SUCarrierDownloadPolicyProperties *)self _BOOLForKey:@"SoftwareUpdateOptInRequired" defaultValue:0];
}

- (BOOL)isDownloadAllowable
{
  return [(SUCarrierDownloadPolicyProperties *)self _BOOLForKey:@"AllowDownloadOverCellular" defaultValue:1];
}

- (BOOL)isDownloadAllowableOver2G
{
  return [(SUCarrierDownloadPolicyProperties *)self _BOOLForKey:@"AllowDownloadOver2G" defaultValue:0];
}

- (BOOL)isAutoDownloadAllowable
{
  return [(SUCarrierDownloadPolicyProperties *)self _BOOLForKey:@"AllowAutomaticDownloadOverCellular" defaultValue:0];
}

- (int64_t)maximumDownloadSizeInBytes
{
  int64_t result = [(SUCarrierDownloadPolicyProperties *)self _longLongForKey:@"MaxBytesOverCellular" defaultValue:-1];
  if (result < 0) {
    return -1;
  }
  return result;
}

- (unint64_t)numberOfDaysToWaitForCellularDownload
{
  uint64_t v2 = [(SUCarrierDownloadPolicyProperties *)self _integerForKey:@"DaysToWaitForCellularDownload" defaultValue:0];
  uint64_t v3 = 28;
  if (v2 < 28) {
    uint64_t v3 = v2;
  }
  return v3 & ~(v3 >> 63);
}

- (int64_t)peakStartHour
{
  int64_t v3 = [(SUCarrierDownloadPolicyProperties *)self _integerForKey:@"PeakStartTime" defaultValue:-1];
  if ([(SUCarrierDownloadPolicyProperties *)self _isValidHour:v3]) {
    return v3;
  }
  else {
    return -1;
  }
}

- (int64_t)peakEndHour
{
  int64_t v3 = [(SUCarrierDownloadPolicyProperties *)self _integerForKey:@"PeakEndTime" defaultValue:-1];
  if ([(SUCarrierDownloadPolicyProperties *)self _isValidHour:v3]) {
    return v3;
  }
  else {
    return -1;
  }
}

- (BOOL)allowInexpensiveHDMUnlimited
{
  return [(SUCarrierDownloadPolicyProperties *)self _BOOLForKey:@"AllowEnhancedDownloadOnNRHDM" defaultValue:1];
}

- (id)description
{
  uint64_t v14 = NSString;
  if ([(SUCarrierDownloadPolicyProperties *)self isDownloadFree]) {
    int64_t v3 = @"YES";
  }
  else {
    int64_t v3 = @"NO";
  }
  uint64_t v13 = v3;
  if ([(SUCarrierDownloadPolicyProperties *)self isDownloadAllowable]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if ([(SUCarrierDownloadPolicyProperties *)self isDownloadAllowableOver2G]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(SUCarrierDownloadPolicyProperties *)self isAutoDownloadAllowable]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  int64_t v7 = [(SUCarrierDownloadPolicyProperties *)self maximumDownloadSizeInBytes];
  unint64_t v8 = [(SUCarrierDownloadPolicyProperties *)self numberOfDaysToWaitForCellularDownload];
  int64_t v9 = [(SUCarrierDownloadPolicyProperties *)self peakStartHour];
  int64_t v10 = [(SUCarrierDownloadPolicyProperties *)self peakEndHour];
  if ([(SUCarrierDownloadPolicyProperties *)self allowInexpensiveHDMUnlimited]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  return (id)[v14 stringWithFormat:@"SUDownloadPolicy <%p>:\n            \tisDownloadFree: %@\n            \tisDownloadAllowable: %@\n            \tisDownloadAllowableOver2G: %@\n            \tisAutoDownloadAllowable: %@\n            \tmaximumDownloadSizeInBytes: %llu\n            \tnumberOfDaysToWaitForCellularDownload: %lu\n            \tpeakStartHour: %ld\n            \tpeakEndHour: %ld\n            \tAllowEnhancedDownloadOnNRHDM: %@\n", self, v13, v4, v5, v6, v7, v8, v9, v10, v11];
}

- (BOOL)_isValidHour:(int64_t)a3
{
  return (unint64_t)a3 < 0x18;
}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  v5 = [(SUCarrierDownloadPolicyProperties *)self _numberForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (int64_t)_longLongForKey:(id)a3 defaultValue:(int64_t)a4
{
  v5 = [(SUCarrierDownloadPolicyProperties *)self _numberForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 longLongValue];
  }

  return a4;
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  v5 = [(SUCarrierDownloadPolicyProperties *)self _numberForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  v5 = [(SUCarrierDownloadPolicyProperties *)self _numberForKey:a3];
  v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (id)_numberForKey:(id)a3
{
  int64_t v3 = [(NSMutableDictionary *)self->_keyMap objectForKey:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_getOverriddenProperties
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(SUCarrierDownloadPolicyProperties *)self _keys];
  id v23 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v23 setNumberStyle:1];
  int64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = +[SUPreferences sharedInstance];
  v5 = [v4 overrideCarrierDownloadPolicyProperties];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
          id v13 = [v23 numberFromString:v12];
        }
        uint64_t v14 = v13;
        if (v13)
        {
          [v3 setSafeObject:v13 forKey:v11];
        }
LABEL_12:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  if ([v3 count]) {
    SULogInfo(@"[PREFERENCES] Override properties with %@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v3);
  }

  return v3;
}

- (id)_keys
{
  v4[9] = *MEMORY[0x263EF8340];
  v4[0] = @"SoftwareUpdateOptInRequired";
  v4[1] = @"AllowDownloadOverCellular";
  v4[2] = @"AllowDownloadOver2G";
  v4[3] = @"DaysToWaitForCellularDownload";
  v4[4] = @"AllowAutomaticDownloadOverCellular";
  v4[5] = @"MaxBytesOverCellular";
  v4[6] = @"PeakStartTime";
  v4[7] = @"PeakEndTime";
  v4[8] = @"AllowEnhancedDownloadOnNRHDM";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:9];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end