@interface SUSoftwareUpdateAssetMatcher
+ (id)matcherForCurrentDevice;
+ (id)matcherForCurrentDeviceWithInfo:(id)a3;
+ (id)matcherForCurrentDeviceWithInterestedStates:(int)a3;
- (BOOL)_isDeviceEligibleForUpdate:(id)a3;
- (BOOL)_isPossibleSoftwareUpdate:(id)a3;
- (BOOL)compareWithTatsuForEligibility;
- (NSDictionary)matcherInfo;
- (NSString)fromBuild;
- (NSString)fromProductType;
- (NSString)fromReleaseType;
- (NSString)fromVersion;
- (SUPreferences)preferences;
- (SUSoftwareUpdateAssetMatcher)initWithVersion:(id)a3 build:(id)a4 productType:(id)a5 releaseType:(id)a6 interestedStates:(int)a7 matcherInfo:(id)a8;
- (id)_copyMatchingAssetsAfterSortingAndFiltering:(id)a3;
- (id)_createCleanOSVersionString:(id)a3;
- (id)_createSortedAndFilteredAssetResults:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5;
- (id)_filterPatchesIfNecessary:(id)a3;
- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4;
- (unint64_t)_getIndexOfHighestVersionedAsset:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5;
- (void)_modifyMADownloadOptions:(id)a3;
- (void)dealloc;
- (void)setCompareWithTatsuForEligibility:(BOOL)a3;
- (void)setPreferences:(id)a3;
@end

@implementation SUSoftwareUpdateAssetMatcher

+ (id)matcherForCurrentDevice
{
  return +[SUSoftwareUpdateAssetMatcher matcherForCurrentDeviceWithInterestedStates:0];
}

+ (id)matcherForCurrentDeviceWithInterestedStates:(int)a3
{
  v3 = [[SUSoftwareUpdateAssetMatcher alloc] initWithVersion:+[SUUtility currentProductVersion](SUUtility, "currentProductVersion") build:+[SUUtility currentProductBuild](SUUtility, "currentProductBuild") productType:+[SUUtility currentProductType](SUUtility, "currentProductType") releaseType:+[SUUtility currentReleaseType] interestedStates:*(void *)&a3 matcherInfo:0];
  return v3;
}

+ (id)matcherForCurrentDeviceWithInfo:(id)a3
{
  v3 = [[SUSoftwareUpdateAssetMatcher alloc] initWithVersion:+[SUUtility currentProductVersion](SUUtility, "currentProductVersion") build:+[SUUtility currentProductBuild](SUUtility, "currentProductBuild") productType:+[SUUtility currentProductType](SUUtility, "currentProductType") releaseType:+[SUUtility currentReleaseType] interestedStates:0 matcherInfo:a3];
  return v3;
}

- (SUSoftwareUpdateAssetMatcher)initWithVersion:(id)a3 build:(id)a4 productType:(id)a5 releaseType:(id)a6 interestedStates:(int)a7 matcherInfo:(id)a8
{
  v15.receiver = self;
  v15.super_class = (Class)SUSoftwareUpdateAssetMatcher;
  v13 = [(SUAssetStateMatcher *)&v15 initWithType:@"com.apple.MobileAsset.SoftwareUpdate" interestedStates:*(void *)&a7];
  if (v13)
  {
    v13->_fromVersion = (NSString *)a3;
    v13->_fromBuild = (NSString *)a4;
    v13->_fromProductType = (NSString *)a5;
    v13->_fromReleaseType = (NSString *)a6;
    v13->_checkTatsu = 1;
    v13->_preferences = +[SUPreferences sharedInstance];
    v13->_matcherInfo = (NSDictionary *)a8;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSoftwareUpdateAssetMatcher;
  [(SUSoftwareUpdateAssetMatcher *)&v3 dealloc];
}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = [a3 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      v10 = (void *)MEMORY[0x223C18220]();
      uint64_t v11 = [a3 objectAtIndex:i];
      if ([(SUSoftwareUpdateAssetMatcher *)self _isPossibleSoftwareUpdate:v11])
      {
        if (self->_checkTatsu
          && ![(SUSoftwareUpdateAssetMatcher *)self _isDeviceEligibleForUpdate:v11])
        {
          SULogInfo(@"Ignoring SU match due to personalization eligibility check: %@", v12, v13, v14, v15, v16, v17, v18, v11);
        }
        else
        {
          [v6 addObject:v11];
        }
      }
    }
  }
  id v19 = [(SUSoftwareUpdateAssetMatcher *)self _copyMatchingAssetsAfterSortingAndFiltering:v6];
  uint64_t v20 = [v19 count];
  if (v19) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    goto LABEL_23;
  }
  if (v20 != 1)
  {
    v23 = (void *)[MEMORY[0x263EFF980] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v24 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v24)
    {
      uint64_t v32 = v24;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * j), "attributes"));
        }
        uint64_t v32 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v32);
    }
    SULogInfo(@"Unable to find update due to ambiguous results: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_23:
    +[SUUtility assignError:a4 withCode:3];
    v22 = 0;
    goto LABEL_24;
  }
  v22 = (void *)[v19 objectAtIndex:0];
LABEL_24:

  return v22;
}

- (void)_modifyMADownloadOptions:(id)a3
{
  if (MGGetBoolAnswer()) {
    uint64_t v5 = 60;
  }
  else {
    uint64_t v5 = 30;
  }
  [a3 setTimeoutIntervalForResource:v5];
  [a3 setDiscretionary:0];
  [a3 setAllowsCellularAccess:1];
  [a3 setAllowsExpensiveAccess:1];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F53C50], "sharedConnection"), "isSupervised"))
  {
    [a3 setSupervised:1];
    id v6 = [(NSDictionary *)self->_matcherInfo objectForKey:@"RequestedPMV"];
    if (v6)
    {
      id v14 = v6;
      SULogInfo(@"Requesting PMV %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
      [a3 setRequestedProductVersion:v14];
    }
    id v15 = [(NSDictionary *)self->_matcherInfo objectForKey:@"delayPeriod"];
    if (v15)
    {
      uint64_t v16 = v15;
      if ([v15 longValue] >= 1 && objc_msgSend(v16, "longValue") <= 90)
      {
        uint64_t v17 = [v16 longValue];
        SULogInfo(@"Requesting delay period %lu", v18, v19, v20, v21, v22, v23, v24, v17);
        objc_msgSend(a3, "setDelayPeriod:", objc_msgSend(v16, "longValue"));
      }
    }
  }
  id v25 = [(NSDictionary *)self->_matcherInfo objectForKey:kSUScanTypeKey];
  if (v25)
  {
    id v26 = v25;
    if (![a3 additionalServerParams]) {
      objc_msgSend(a3, "setAdditionalServerParams:", objc_msgSend(MEMORY[0x263EFF9A0], "dictionary"));
    }
    objc_msgSend((id)objc_msgSend(a3, "additionalServerParams"), "setSafeObject:forKey:", v26, @"DeviceCheck");
  }
  id v27 = [(NSDictionary *)self->_matcherInfo objectForKey:kSUSessionIDKey];
  if (v27)
  {
    id v28 = v27;
    if (![a3 additionalServerParams]) {
      objc_msgSend(a3, "setAdditionalServerParams:", objc_msgSend(MEMORY[0x263EFF9A0], "dictionary"));
    }
    uint64_t v29 = (void *)[a3 additionalServerParams];
    [v29 setSafeObject:v28 forKey:@"SessionId"];
  }
}

- (id)_createCleanOSVersionString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[a3 length] >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = (id)objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_26CE93248);
    SULogInfo(@"9.9. replaced in currSecond. New version string: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  return v3;
}

- (unint64_t)_getIndexOfHighestVersionedAsset:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5
{
  uint64_t v18 = [a3 count];
  if (v18)
  {
    unint64_t v7 = 0;
    CFStringRef v8 = 0;
    CFStringRef v9 = 0;
    CFStringRef v10 = 0;
    CFStringRef v11 = 0;
    unint64_t v17 = 0;
    while (1)
    {
      uint64_t v12 = (void *)MEMORY[0x223C18220]();
      uint64_t v13 = (void *)[a3 objectAtIndex:v7];
      id v14 = v13;
      if (a4
        && (CFStringRef v9 = (const __CFString *)objc_msgSend((id)objc_msgSend(v13, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class()), !objc_msgSend(a4, "compare:", @"OSVersion")))
      {
        CFStringRef v9 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v9];
        if (a5)
        {
LABEL_6:
          CFStringRef v8 = (const __CFString *)objc_msgSend((id)objc_msgSend(v14, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
          if (![a5 compare:@"OSVersion"]) {
            CFStringRef v8 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v8];
          }
        }
      }
      else if (a5)
      {
        goto LABEL_6;
      }
      if (!((unint64_t)v11 | (unint64_t)v10)
        || (v9 == v11 || v11 && v9 && (CFStringCompare(v9, v11, 0x40uLL) & 0x8000000000000000) == 0)
        && (v8 == v10 || v10 && v8 && (CFStringCompare(v8, v10, 0x40uLL) & 0x8000000000000000) == 0))
      {
        unint64_t v17 = v7;
        CFStringRef v11 = v9;
        CFStringRef v10 = v8;
      }
      if (v18 == ++v7) {
        return v17;
      }
    }
  }
  return 0;
}

- (id)_createSortedAndFilteredAssetResults:(id)a3 usingFirstKey:(id)a4 secondKey:(id)a5
{
  uint64_t v23 = objc_msgSend(a3, "objectAtIndex:", -[SUSoftwareUpdateAssetMatcher _getIndexOfHighestVersionedAsset:usingFirstKey:secondKey:](self, "_getIndexOfHighestVersionedAsset:usingFirstKey:secondKey:"));
  id v21 = a3;
  uint64_t v8 = [a3 count];
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v20 = v8;
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      CFStringRef v10 = (void *)MEMORY[0x223C18220]();
      CFStringRef v11 = (void *)[v21 objectAtIndex:v9];
      if (a4)
      {
        uint64_t v12 = v11;
        CFStringRef v13 = (const __CFString *)objc_msgSend((id)objc_msgSend(v11, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class());
        CFStringRef v14 = (const __CFString *)objc_msgSend((id)objc_msgSend(v23, "attributes"), "safeObjectForKey:ofClass:", a4, objc_opt_class());
        if (![a4 compare:@"OSVersion"])
        {
          CFStringRef v13 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v13];
          CFStringRef v14 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v14];
        }
        CFStringRef v11 = v12;
      }
      else
      {
        CFStringRef v13 = 0;
        CFStringRef v14 = 0;
      }
      uint64_t v22 = v11;
      if (a5)
      {
        CFStringRef v15 = (const __CFString *)objc_msgSend((id)objc_msgSend(v11, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
        CFStringRef v16 = (const __CFString *)objc_msgSend((id)objc_msgSend(v23, "attributes"), "safeObjectForKey:ofClass:", a5, objc_opt_class());
        if (![a5 compare:@"OSVersion"])
        {
          CFStringRef v15 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v15];
          CFStringRef v16 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v16];
        }
      }
      else
      {
        CFStringRef v15 = 0;
        CFStringRef v16 = 0;
      }
      if ((v13 == v14 || v13 && v14 && CFStringCompare(v13, v14, 0x40uLL) == kCFCompareEqualTo)
        && (v15 == v16 || v15 && v16 && CFStringCompare(v15, v16, 0x40uLL) == kCFCompareEqualTo))
      {
        [v18 addObject:v22];
      }
      ++v9;
    }
    while (v20 != v9);
  }
  return v18;
}

- (id)_copyMatchingAssetsAfterSortingAndFiltering:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  if ((unint64_t)[a3 count] <= 1)
  {
    return (id)[v3 copy];
  }
  id v6 = [(SUSoftwareUpdateAssetMatcher *)self _createSortedAndFilteredAssetResults:[(SUSoftwareUpdateAssetMatcher *)self _filterPatchesIfNecessary:v3] usingFirstKey:@"Build" secondKey:@"OSVersion"];
  id v3 = v6;
  if (!v6 || (unint64_t)[v6 count] < 2) {
    return v3;
  }
  id v7 = v3;
  return [(SUSoftwareUpdateAssetMatcher *)self _createSortedAndFilteredAssetResults:v3 usingFirstKey:@"PrerequisiteBuild" secondKey:@"PrerequisiteOSVersion"];
}

- (id)_filterPatchesIfNecessary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v19 = +[SUState currentState];
  id v18 = (void *)[a3 mutableCopy];
  if (!-[SUPreferences disableFullReplacementFallback](+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"), "disableFullReplacementFallback")&& [a3 count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = (void *)[a3 objectAtIndex:v4];
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "attributes"), "safeObjectForKey:ofClass:", @"Build", objc_opt_class());
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "attributes"), "safeObjectForKey:ofClass:", @"PrerequisiteBuild", objc_opt_class());
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v8 = (void *)[v19 failedPatchDescriptors];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            CFStringRef v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v14 = [v13 productBuildVersion];
            if (v14) {
              BOOL v15 = v6 == v14;
            }
            else {
              BOOL v15 = 0;
            }
            if (v15 && v7 != 0)
            {
              [v18 removeObject:v13];
              goto LABEL_19;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
LABEL_19:
      ++v4;
    }
    while ([a3 count] > v4);
  }
  return v18;
}

- (BOOL)_isDeviceEligibleForUpdate:(id)a3
{
  if (!objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"UniqueBuildID")) {
    return 1;
  }
  id v3 = (const void *)MGCopyAnswer();
  unint64_t v4 = (const void *)MGCopyAnswer();
  uint64_t v5 = (const void *)MGCopyAnswer();
  uint64_t v6 = MGCopyAnswer();
  CFBooleanRef v14 = (const __CFBoolean *)v6;
  if (v3 && v4 && v5 && v6)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFStringRef v16 = Mutable;
    if (Mutable)
    {
      MEMORY[0x223C17960](Mutable, *MEMORY[0x263F8BEB0], 1);
      CFBooleanGetValue(v14);
      AMAuthInstallSupportDictionarySetBoolean();
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x263F8BE80], v3);
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x263F8BE78], v4);
      CFDictionarySetValue(v16, (const void *)*MEMORY[0x263F8BE70], v5);
      uint64_t v17 = AMAuthInstallCreate();
      uint64_t v18 = AMAuthInstallApSetParameters();
      if (v18)
      {
        SULogInfo(@"Could not set AP fusings: %d", v19, v20, v21, v22, v23, v24, v25, v18);
LABEL_26:
        char v27 = 0;
LABEL_27:
        CFRelease(v3);
        BOOL v26 = v27;
        id v28 = (const void *)v17;
        uint64_t v29 = v16;
        if (!v4) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      uint64_t v31 = AMAuthInstallRequestAbbreviatedSendSync();
      if (v31)
      {
        SULogInfo(@"Personalization request failed: %d", v32, v33, v34, v35, v36, v37, v38, v31);
        goto LABEL_26;
      }
      if (!CFDictionaryContainsKey(0, @"@ServerVersion") || CFDictionaryGetCount(0) >= 2)
      {
        SULogInfo(@"Response from tatsu contains more than 1 key. Please file a bug.", v39, v40, v41, v42, v43, v44, v45, v53);
        SULogInfo(@"Tatsu response: %@", v46, v47, v48, v49, v50, v51, v52, 0);
      }
      SULogDebug(@"Tatsu response: %@", v39, v40, v41, v42, v43, v44, v45, 0);
    }
    else
    {
      uint64_t v17 = 0;
    }
    char v27 = 1;
    goto LABEL_27;
  }
  SULogInfo(@"Could not gather necessary information for personalization request", v7, v8, v9, v10, v11, v12, v13, v53);
  char v27 = 0;
  uint64_t v17 = 0;
  CFStringRef v16 = 0;
  BOOL v26 = 0;
  id v28 = 0;
  uint64_t v29 = 0;
  if (v3) {
    goto LABEL_27;
  }
  if (v4) {
LABEL_12:
  }
    CFRelease(v4);
LABEL_13:
  if (v5) {
    CFRelease(v5);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v29) {
    CFRelease(v29);
  }
  return v26;
}

- (BOOL)_isPossibleSoftwareUpdate:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", @"OSVersion", objc_opt_class());
  if (!v5)
  {
    SULogDebug(@"Missing key %@ from asset map entry or type wasn't a string", v6, v7, v8, v9, v10, v11, v12, @"OSVersion");
LABEL_19:
    LOBYTE(v44) = 0;
    return v44;
  }
  id v13 = [(SUSoftwareUpdateAssetMatcher *)self _createCleanOSVersionString:v5];
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", @"Build", objc_opt_class());
  if (!v14)
  {
    SULogDebug(@"Missing key %@ from asset map entry or type wasn't a string.", v15, v16, v17, v18, v19, v20, v21, @"Build");
    goto LABEL_19;
  }
  uint64_t v22 = (void *)v14;
  uint64_t v23 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"ReleaseType");
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v48 = @"ReleaseType";
LABEL_17:
      uint64_t v43 = @"Mistyped key %@ from asset map entry (expected string)";
      goto LABEL_18;
    }
  }
  uint64_t v31 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "safeObjectForKey:ofClass:", @"SupportedDevices", objc_opt_class());
  if (!v31)
  {
    SULogDebug(@"Missing key %@ from asset map entry or type wasn't an array", v32, v33, v34, v35, v36, v37, v38, @"SupportedDevices");
    goto LABEL_19;
  }
  uint64_t v39 = (void *)v31;
  uint64_t v40 = @"PrerequisiteBuild";
  uint64_t v41 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"PrerequisiteBuild");
  if (v41 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (uint64_t v40 = @"PrerequisiteOSVersion",
        (uint64_t v42 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"PrerequisiteOSVersion")) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v48 = v40;
    goto LABEL_17;
  }
  if ((v41 != 0) != (v42 != 0))
  {
    uint64_t v43 = @"Cannot have prerequisite version or build without it's sibling.";
LABEL_18:
    SULogDebug(v43, v24, (uint64_t)fromBuild, v26, v27, v28, v29, v30, (uint64_t)v48);
    goto LABEL_19;
  }
  if (!self->_fromVersion)
  {
    uint64_t v43 = @"No version to search from";
    goto LABEL_18;
  }
  fromBuild = self->_fromBuild;
  if (!fromBuild)
  {
    uint64_t v43 = @"No build to search from";
    goto LABEL_18;
  }
  if (!self->_fromProductType)
  {
    uint64_t v43 = @"No product type to search for";
    goto LABEL_18;
  }
  uint64_t v49 = objc_msgSend(v22, "compareNumerically:");
  if (![(SUPreferences *)self->_preferences disableBuildNumberComparison])
  {
    if ([v13 compareNumerically:self->_fromVersion] == -1) {
      goto LABEL_19;
    }
    if (!([(SUPreferences *)self->_preferences allowSameBuildUpdates] ? v49 != -1 : v49 == 1)) {
      goto LABEL_19;
    }
  }
  int v44 = [v39 containsObject:self->_fromProductType];
  if (!v44) {
    return v44;
  }
  if (v41 && [v41 compareNumerically:self->_fromBuild]
    || v42 && [v42 compareNumerically:self->_fromVersion])
  {
    goto LABEL_19;
  }
  fromReleaseType = self->_fromReleaseType;
  if (fromReleaseType == (NSString *)v23) {
    goto LABEL_39;
  }
  LOBYTE(v44) = 0;
  if (v23 && fromReleaseType)
  {
    if ([(NSString *)self->_fromReleaseType compare:v23]) {
      goto LABEL_19;
    }
LABEL_39:
    LOBYTE(v44) = 1;
  }
  return v44;
}

- (NSString)fromBuild
{
  return self->_fromBuild;
}

- (NSString)fromVersion
{
  return self->_fromVersion;
}

- (NSString)fromProductType
{
  return self->_fromProductType;
}

- (NSString)fromReleaseType
{
  return self->_fromReleaseType;
}

- (BOOL)compareWithTatsuForEligibility
{
  return self->_checkTatsu;
}

- (void)setCompareWithTatsuForEligibility:(BOOL)a3
{
  self->_checkTatsu = a3;
}

- (SUPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSDictionary)matcherInfo
{
  return self->_matcherInfo;
}

@end