@interface ICURLBag
+ (NSArray)_allBagKeys;
- (AMSSnapshotBag)amsBag;
- (BOOL)BOOLValueForBagKey:(id)a3;
- (BOOL)_shouldMescalSignBodyForURL:(id)a3 withSignatureConfiguration:(id)a4;
- (BOOL)canPostKeybagSyncData;
- (BOOL)hasValueForBagKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isTrustedHostForURL:(id)a3;
- (BOOL)shouldAppendDeviceGUIDForURL:(id)a3;
- (BOOL)shouldAppendMachineDataHeadersForURL:(id)a3;
- (ICURLBagEnhancedAudioConfiguration)enhancedAudioConfiguration;
- (ICURLBagLibraryDAAPConfiguration)libraryDAAPConfiguration;
- (ICURLBagRadioConfiguration)radioConfiguration;
- (NSArray)GUIDURLRegexPatterns;
- (NSDate)expirationDate;
- (NSDate)requestDate;
- (NSDictionary)_propertyListRepresentation;
- (NSDictionary)bagValues;
- (NSMutableDictionary)convertedActionsCache;
- (NSNumber)sourceAccountDSID;
- (NSSet)GUIDURLSchemes;
- (NSString)profileName;
- (NSString)profileVersion;
- (NSString)serverCorrelationKey;
- (NSString)serverEnvironment;
- (NSString)storefrontHeaderSuffix;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithDictionary:(id)a3 amsBag:(id)a4 requestDate:(id)a5 expirationDate:(id)a6 serverCorrelationKey:(id)a7 serverEnvironment:(id)a8 profileName:(id)a9 profileVersion:(id)a10 sourceAccountDSID:(id)a11;
- (id)_initWithPropertyListRepresentation:(id)a3;
- (id)_knownIncorrectValues;
- (id)_knownOptionalBagKeys;
- (id)_urlStringFromBagStringValue:(id)a3;
- (id)_valueForBagKey:(id)a3;
- (id)arrayForBagKey:(id)a3;
- (id)dictionaryForBagKey:(id)a3;
- (id)mescalConfigurationForRequest:(id)a3;
- (id)mescalConfigurationForRequestURL:(id)a3;
- (id)mescalConfigurationForResponse:(id)a3;
- (id)mescalConfigurationForResponseURL:(id)a3;
- (id)numberForBagKey:(id)a3;
- (id)stringForBagKey:(id)a3;
- (id)urlForBagKey:(id)a3;
- (id)valuesForBagKeys:(id)a3;
- (int64_t)int64ValueForBagKey:(id)a3;
- (void)_logMissingKey:(id)a3;
- (void)_setExpirationDate:(id)a3;
- (void)_validateGUIDURLConfigIfNeeded;
- (void)createAMSSnapshotBagWithCompletion:(id)a3;
- (void)setBagValues:(id)a3;
- (void)setConvertedActionsCache:(id)a3;
- (void)setGUIDURLRegexPatterns:(id)a3;
- (void)setGUIDURLSchemes:(id)a3;
@end

@implementation ICURLBag

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  v3 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:v3] == NSOrderedAscending;

  return (char)expirationDate;
}

- (AMSSnapshotBag)amsBag
{
  return self->_amsBag;
}

- (BOOL)isTrustedHostForURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [a3 host];
  if (![v4 length])
  {
    BOOL v20 = 0;
    goto LABEL_25;
  }
  v5 = [(ICURLBag *)self arrayForBagKey:@"trustedDomains"];
  if (!_NSIsNSArray())
  {
    BOOL v20 = 0;
    goto LABEL_24;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {
    BOOL v20 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  v22 = v5;
  uint64_t v9 = *(void *)v24;
  v10 = @".";
  v11 = @"*";
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v24 != v9) {
      objc_enumerationMutation(v6);
    }
    v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
    if (_NSIsNSString()) {
      break;
    }
LABEL_14:
    if (v8 == ++v12)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        goto LABEL_5;
      }
      BOOL v20 = 0;
      goto LABEL_20;
    }
  }
  if [v13 hasPrefix:v10] && (objc_msgSend(v4, "hasSuffix:", v13))
  {
LABEL_19:
    BOOL v20 = 1;
LABEL_20:
    v5 = v22;
    goto LABEL_23;
  }
  if (![v13 hasPrefix:v11]) {
    goto LABEL_13;
  }
  [v13 substringFromIndex:1];
  uint64_t v14 = v9;
  id v15 = v6;
  v16 = v10;
  v18 = v17 = v11;
  char v19 = [v4 hasSuffix:v18];

  v11 = v17;
  v10 = v16;
  id v6 = v15;
  uint64_t v9 = v14;
  if ((v19 & 1) == 0)
  {
LABEL_13:
    if (![v4 caseInsensitiveCompare:v13]) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  v5 = v22;
  BOOL v20 = 1;
LABEL_23:

LABEL_24:
LABEL_25:

  return v20;
}

- (id)arrayForBagKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    id v6 = [(AMSSnapshotBag *)amsBag arrayForKey:v4];
    id v18 = 0;
    uint64_t v7 = [v6 valueWithError:&v18];
    uint64_t v8 = (NSString *)v18;

    if (v8)
    {
      uint64_t v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        BOOL v20 = self;
        __int16 v21 = 2114;
        id v22 = v4;
        __int16 v23 = 2114;
        long long v24 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
      }
    }
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v7 = [(ICURLBag *)self _valueForBagKey:v4];
  if (!v7)
  {
    [(ICURLBag *)self _logMissingKey:v4];
    goto LABEL_15;
  }
LABEL_10:
  if ((_NSIsNSArray() & 1) == 0)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      BOOL v20 = self;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2114;
      long long v24 = profileName;
      __int16 v25 = 2114;
      long long v26 = v12;
      id v13 = v12;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Array)", buf, 0x2Au);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F77950];
    uint64_t v15 = *MEMORY[0x1E4F778D8];
    v16 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Array)", v4, self->_profileName, objc_opt_class()];
    [v14 snapshotWithDomain:v15 type:@"Bug" subType:@"ICURLBag" context:v16 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

    uint64_t v7 = 0;
  }
LABEL_15:

  return v7;
}

- (BOOL)shouldAppendMachineDataHeadersForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 host];
  v5 = [(ICURLBag *)self arrayForBagKey:@"amd-domains"];
  if (_NSIsNSArray())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v16 = v5;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (_NSIsNSString())
          {
            if ([v11 hasPrefix:@"."])
            {
              if ([v4 hasSuffix:v11]) {
                goto LABEL_19;
              }
            }
            else if ([v11 hasPrefix:@"*"])
            {
              BOOL v12 = 1;
              id v13 = [v11 substringFromIndex:1];
              char v14 = [v4 hasSuffix:v13];

              if (v14) {
                goto LABEL_20;
              }
            }
            else if (![v11 caseInsensitiveCompare:v4])
            {
LABEL_19:
              BOOL v12 = 1;
              goto LABEL_20;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v12 = 0;
LABEL_20:
      v5 = v16;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __32__ICURLBag_dictionaryForBagKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (_NSIsNSString() && [v5 hasPrefix:@"http"])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _urlStringFromBagStringValue:v5];
    [v6 setObject:v7 forKey:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v8];
  }
}

- (id)_urlStringFromBagStringValue:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"{"];
  v29 = v3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    *(void *)&long long v5 = 138543874;
    long long v28 = v5;
    uint64_t v7 = v3;
    while (1)
    {
      uint64_t v8 = objc_msgSend(v7, "rangeOfString:options:range:", @"}", 0, v6 + 1, objc_msgSend(v7, "length", v28) + ~v6);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v9 = v8 - v6;
      v10 = objc_msgSend(v7, "substringWithRange:", v6 + 1, v8 - v6 - 1);
      uint64_t v11 = [v10 rangeOfString:@"$"];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v12 = v11,
            uint64_t v13 = v11 + 1,
            uint64_t v14 = objc_msgSend(v10, "rangeOfString:options:range:", @"$", 0, v11 + 1, objc_msgSend(v10, "length") + ~v11), v14 == 0x7FFFFFFFFFFFFFFFLL))
      {

        break;
      }
      uint64_t v15 = v14 - v12;
      v16 = objc_msgSend(v10, "substringWithRange:", v13, v14 - v12 - 1);
      long long v17 = +[ICHTTPCookieStore sharedCookieStore];
      long long v18 = v17;
      if (self->_sourceAccountDSID) {
        sourceAccountDSID = self->_sourceAccountDSID;
      }
      else {
        sourceAccountDSID = (NSNumber *)&unk_1EF640B10;
      }
      long long v20 = [v17 getCookieWithName:v16 userIdentifier:sourceAccountDSID];

      if (!v20)
      {
        __int16 v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v32 = self;
          __int16 v33 = 2114;
          v34 = v16;
          __int16 v35 = 2114;
          v36 = v29;
          _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find value for variable '%{public}@' in url '%{public}@'", buf, 0x20u);
        }
      }
      uint64_t v22 = [v20 value];
      __int16 v23 = (void *)v22;
      long long v24 = &stru_1EF5F5C40;
      if (v22) {
        long long v24 = (__CFString *)v22;
      }
      __int16 v25 = v24;

      long long v26 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v12, v15 + 1, v25);

      objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v6, v9 + 1, v26);
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v6 = [v3 rangeOfString:@"{"];
      uint64_t v7 = v3;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
    }
    id v3 = v7;
  }
LABEL_19:

  return v3;
}

- (NSString)storefrontHeaderSuffix
{
  id v3 = [(ICURLBag *)self stringForBagKey:@"subscription-storefront-header-suffix"];
  if (!v3)
  {
    id v3 = [(ICURLBag *)self stringForBagKey:@"storefront-header-suffix"];
  }

  return (NSString *)v3;
}

- (void)_validateGUIDURLConfigIfNeeded
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICURLBag *)self GUIDURLRegexPatterns];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [(ICURLBag *)self GUIDURLSchemes],
        long long v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    uint64_t v6 = [(ICURLBag *)self dictionaryForBagKey:@"guid-urls"];
    if (_NSIsNSDictionary())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = [v6 objectForKey:@"regex"];
      if (_NSIsNSArray())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
              if (_NSIsNSString())
              {
                uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v14 options:1 error:0];
                if (v15) {
                  [v7 addObject:v15];
                }
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v11);
        }
      }
      [(ICURLBag *)self setGUIDURLRegexPatterns:v7];
      v16 = [v6 objectForKey:@"schemes"];
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if (_NSIsNSArray())
      {
        long long v24 = v8;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v26;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v26 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * v22);
              if (_NSIsNSString()) {
                [v17 addObject:v23];
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v20);
        }

        uint64_t v8 = v24;
      }
      if (([v17 containsObject:@"https"] & 1) == 0) {
        [v17 addObject:@"https"];
      }
      [(ICURLBag *)self setGUIDURLSchemes:v17];
    }
  }
}

- (BOOL)shouldAppendDeviceGUIDForURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ICURLBag *)self _validateGUIDURLConfigIfNeeded];
  long long v5 = [(ICURLBag *)self GUIDURLRegexPatterns];
  if (![v5 count])
  {

    goto LABEL_13;
  }
  uint64_t v6 = [(ICURLBag *)self GUIDURLSchemes];
  id v7 = [v4 scheme];
  int v8 = [v6 containsObject:v7];

  if (!v8)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v9 = [v4 absoluteString];
  uint64_t v10 = [v9 length];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [(ICURLBag *)self GUIDURLRegexPatterns];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v9, 0, 0, v10) != 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v16 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_15:

LABEL_16:
  return v16;
}

- (NSArray)GUIDURLRegexPatterns
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_GUIDURLRegexPatterns;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSSet)GUIDURLSchemes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_GUIDURLSchemes;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)numberForBagKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    uint64_t v6 = [(AMSSnapshotBag *)amsBag integerForKey:v4];
    id v18 = 0;
    id v7 = [v6 valueWithError:&v18];
    int v8 = (NSString *)v18;

    if (v8)
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        long long v20 = self;
        __int16 v21 = 2114;
        id v22 = v4;
        __int16 v23 = 2114;
        long long v24 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
      }
    }
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v8 = 0;
  }
  id v7 = [(ICURLBag *)self _valueForBagKey:v4];
  if (!v7)
  {
    [(ICURLBag *)self _logMissingKey:v4];
    goto LABEL_15;
  }
LABEL_10:
  if ((_NSIsNSNumber() & 1) == 0)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      long long v20 = self;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2114;
      long long v24 = profileName;
      __int16 v25 = 2114;
      long long v26 = v12;
      id v13 = v12;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Number)", buf, 0x2Au);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F77950];
    uint64_t v15 = *MEMORY[0x1E4F778D8];
    BOOL v16 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Number)", v4, self->_profileName, objc_opt_class()];
    [v14 snapshotWithDomain:v15 type:@"Bug" subType:@"ICURLBag" context:v16 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

    id v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)dictionaryForBagKey:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    int v8 = 0;
LABEL_9:
    id v7 = [(ICURLBag *)self _valueForBagKey:v4];
    goto LABEL_10;
  }
  uint64_t v6 = [(AMSSnapshotBag *)amsBag dictionaryForKey:v4];
  id v24 = 0;
  id v7 = [v6 valueWithError:&v24];
  int v8 = (NSString *)v24;

  if (v8)
  {
    id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      long long v26 = self;
      __int16 v27 = 2114;
      id v28 = v4;
      __int16 v29 = 2114;
      long long v30 = v8;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
    }
  }
  if (!v7) {
    goto LABEL_9;
  }
LABEL_10:
  if (_NSIsNSDictionary())
  {
    uint64_t v10 = (void *)[v7 mutableCopy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__ICURLBag_dictionaryForBagKey___block_invoke;
    v21[3] = &unk_1E5ACC010;
    id v22 = v10;
    __int16 v23 = self;
    id v11 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:v21];
    uint64_t v12 = [v11 copy];

    id v7 = (void *)v12;
  }
  if (v7)
  {
    if ((_NSIsNSDictionary() & 1) == 0)
    {
      id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        profileName = self->_profileName;
        uint64_t v15 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        long long v26 = self;
        __int16 v27 = 2114;
        id v28 = v4;
        __int16 v29 = 2114;
        long long v30 = profileName;
        __int16 v31 = 2114;
        long long v32 = v15;
        id v16 = v15;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Dictionary)", buf, 0x2Au);
      }
      id v17 = (void *)MEMORY[0x1E4F77950];
      uint64_t v18 = *MEMORY[0x1E4F778D8];
      long long v19 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Dictionary)", v4, self->_profileName, objc_opt_class()];
      [v17 snapshotWithDomain:v18 type:@"Bug" subType:@"ICURLBag" context:v19 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

      id v7 = 0;
    }
  }
  else
  {
    [(ICURLBag *)self _logMissingKey:v4];
  }

  return v7;
}

- (id)stringForBagKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    int v8 = 0;
LABEL_9:
    id v7 = [(ICURLBag *)self _valueForBagKey:v4];
    goto LABEL_10;
  }
  uint64_t v6 = [(AMSSnapshotBag *)amsBag stringForKey:v4];
  id v19 = 0;
  id v7 = [v6 valueWithError:&v19];
  int v8 = (NSString *)v19;

  if (v8)
  {
    id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v21 = self;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      __int16 v25 = v8;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
    }
  }
  if (!v7) {
    goto LABEL_9;
  }
LABEL_10:
  if (_NSIsNSString() && [v7 hasPrefix:@"http"])
  {
    uint64_t v10 = [(ICURLBag *)self _urlStringFromBagStringValue:v7];

    id v7 = (void *)v10;
  }
  if (v7)
  {
    if ((_NSIsNSString() & 1) == 0)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        profileName = self->_profileName;
        id v13 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        __int16 v21 = self;
        __int16 v22 = 2114;
        id v23 = v4;
        __int16 v24 = 2114;
        __int16 v25 = profileName;
        __int16 v26 = 2114;
        __int16 v27 = v13;
        id v14 = v13;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected String)", buf, 0x2Au);
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F77950];
      uint64_t v16 = *MEMORY[0x1E4F778D8];
      id v17 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected String)", v4, self->_profileName, objc_opt_class()];
      [v15 snapshotWithDomain:v16 type:@"Bug" subType:@"ICURLBag" context:v17 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

      id v7 = 0;
    }
  }
  else
  {
    [(ICURLBag *)self _logMissingKey:v4];
  }

  return v7;
}

- (id)_valueForBagKey:(id)a3
{
  id v4 = a3;
  long long v5 = [(ICURLBag *)self bagValues];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSDictionary)bagValues
{
  return self->_bagValues;
}

- (void)_logMissingKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(ICURLBag *)self _knownOptionalBagKeys];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      profileVersion = self->_profileVersion;
      int v9 = 138544130;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = profileName;
      __int16 v15 = 2114;
      uint64_t v16 = profileVersion;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Encountered missing bag key '%{public}@' in profile '%{public}@/%{public}@'", (uint8_t *)&v9, 0x2Au);
    }
  }
}

- (id)_knownOptionalBagKeys
{
  if (_knownOptionalBagKeys_sOptionalKeysOnceToken != -1) {
    dispatch_once(&_knownOptionalBagKeys_sOptionalKeysOnceToken, &__block_literal_global_575);
  }
  v2 = (void *)_knownOptionalBagKeys_sKnownOptionalBagKeys;

  return v2;
}

- (void)setGUIDURLSchemes:(id)a3
{
  id v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_lock);
  GUIDURLSchemes = self->_GUIDURLSchemes;
  self->_GUIDURLSchemes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setGUIDURLRegexPatterns:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  GUIDURLRegexPatterns = self->_GUIDURLRegexPatterns;
  self->_GUIDURLRegexPatterns = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)BOOLValueForBagKey:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    uint64_t v6 = [(AMSSnapshotBag *)amsBag BOOLForKey:v4];
    id v22 = 0;
    id v7 = [v6 valueWithError:&v22];
    id v8 = v22;

    if (v8)
    {

      int v9 = [(AMSSnapshotBag *)self->_amsBag stringForKey:v4];
      id v21 = 0;
      uint64_t v10 = [v9 valueWithError:&v21];
      id v8 = v21;

      if (v8)
      {
        __int16 v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          __int16 v24 = self;
          __int16 v25 = 2114;
          id v26 = v4;
          __int16 v27 = 2114;
          uint64_t v28 = (NSString *)v8;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
        }
      }
      if (v10) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v10 = v7;
      if (v7) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v10 = [(ICURLBag *)self _valueForBagKey:v4];
  if (!v10)
  {
    [(ICURLBag *)self _logMissingKey:v4];
    goto LABEL_17;
  }
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      __int16 v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      uint64_t v28 = profileName;
      __int16 v29 = 2114;
      long long v30 = v14;
      id v15 = v14;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Number)", buf, 0x2Au);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F77950];
    uint64_t v17 = *MEMORY[0x1E4F778D8];
    uint64_t v18 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Number)", v4, self->_profileName, objc_opt_class()];
    [v16 snapshotWithDomain:v17 type:@"Bug" subType:@"ICURLBag" context:v18 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

    uint64_t v10 = 0;
  }
LABEL_17:
  char v19 = [v10 BOOLValue];

  return v19;
}

- (id)urlForBagKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    uint64_t v6 = [(AMSSnapshotBag *)amsBag URLForKey:v4];
    id v26 = 0;
    id v7 = [v6 valueWithError:&v26];
    id v8 = (NSString *)v26;

    if (v8)
    {
      int v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = self;
        __int16 v29 = 2114;
        id v30 = v4;
        __int16 v31 = 2114;
        long long v32 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
      }
    }
    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v10 = [(ICURLBag *)self _valueForBagKey:v4];
  if (!v10)
  {
LABEL_19:

    [(ICURLBag *)self _logMissingKey:v4];
    goto LABEL_20;
  }
  __int16 v11 = (void *)MEMORY[0x1E4F1CB10];
  id v12 = [(ICURLBag *)self _urlStringFromBagStringValue:v10];
  id v7 = [v11 URLWithString:v12];

  if (!v7)
  {
    long long v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = self;
      __int16 v29 = 2114;
      id v30 = v4;
      __int16 v31 = 2114;
      long long v32 = profileName;
      __int16 v33 = 2114;
      v34 = v10;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create url for bag key '%{public}@' in profile '%{public}@': '%{public}@'", buf, 0x2Au);
    }

    id v22 = (void *)MEMORY[0x1E4F77950];
    uint64_t v23 = *MEMORY[0x1E4F778D8];
    __int16 v24 = [NSString stringWithFormat:@"Failed to create url for bag key '%@' in profile '%@': '%@'", v4, self->_profileName, v10];
    [v22 snapshotWithDomain:v23 type:@"Bug" subType:@"ICURLBag" context:v24 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

    goto LABEL_19;
  }

LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_21;
  }
  __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = self->_profileName;
    id v15 = objc_opt_class();
    *(_DWORD *)buf = 138544130;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    id v30 = v4;
    __int16 v31 = 2114;
    long long v32 = v14;
    __int16 v33 = 2114;
    v34 = v15;
    id v16 = v15;
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected URL)", buf, 0x2Au);
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F77950];
  uint64_t v18 = *MEMORY[0x1E4F778D8];
  char v19 = [NSString stringWithFormat:@"Found unexpected type for bag key '%@' in profile '%@': '%@' (expected URL)", v4, self->_profileName, objc_opt_class()];
  [v17 snapshotWithDomain:v18 type:@"Bug" subType:@"ICURLBag" context:v19 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

LABEL_20:
  id v7 = 0;
LABEL_21:

  return v7;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)_initWithPropertyListRepresentation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = objc_msgSend(v4, "ic_dictionaryValueForKey:", @"bag_dictionary");
  long long v5 = objc_msgSend(v4, "ic_numberValueForKey:", @"request_time");
  [v5 doubleValue];
  double v7 = v6;

  id v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
  id v8 = objc_msgSend(v4, "ic_numberValueForKey:", @"expiration_time");
  [v8 doubleValue];
  double v10 = v9;

  id v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v10];
  long long v20 = objc_msgSend(v4, "ic_stringValueForKey:", @"server_correlation_key");
  char v19 = objc_msgSend(v4, "ic_stringValueForKey:", @"server_environment");
  __int16 v11 = objc_msgSend(v4, "ic_stringValueForKey:", @"profile_name");
  id v12 = objc_msgSend(v4, "ic_stringValueForKey:", @"profile_version");
  __int16 v13 = objc_msgSend(v4, "ic_numberValueForKey:", @"aource_account_dsid");
  id v14 = objc_msgSend(v4, "ic_dataValueForKey:", @"ams_bag_data");

  if (!v14)
  {
LABEL_6:
    id v15 = 0;
    goto LABEL_7;
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F4DE20]) initWithData:v14];
  if (!v15)
  {
    id v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v25 = self;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create ams bag from data", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  id v18 = [(ICURLBag *)self _initWithDictionary:v23 amsBag:v15 requestDate:v22 expirationDate:v21 serverCorrelationKey:v20 serverEnvironment:v19 profileName:v11 profileVersion:v12 sourceAccountDSID:v13];

  return v18;
}

- (id)_initWithDictionary:(id)a3 amsBag:(id)a4 requestDate:(id)a5 expirationDate:(id)a6 serverCorrelationKey:(id)a7 serverEnvironment:(id)a8 profileName:(id)a9 profileVersion:(id)a10 sourceAccountDSID:(id)a11
{
  id v17 = a3;
  id v45 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v46.receiver = self;
  v46.super_class = (Class)ICURLBag;
  __int16 v25 = [(ICURLBag *)&v46 init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    bagValues = v25->_bagValues;
    v25->_bagValues = (NSDictionary *)v26;

    objc_storeStrong((id *)&v25->_amsBag, a4);
    uint64_t v28 = [v18 copy];
    requestDate = v25->_requestDate;
    v25->_requestDate = (NSDate *)v28;

    uint64_t v30 = [v19 copy];
    expirationDate = v25->_expirationDate;
    v25->_expirationDate = (NSDate *)v30;

    uint64_t v32 = [v20 copy];
    serverCorrelationKey = v25->_serverCorrelationKey;
    v25->_serverCorrelationKey = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    serverEnvironment = v25->_serverEnvironment;
    v25->_serverEnvironment = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    profileName = v25->_profileName;
    v25->_profileName = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    profileVersion = v25->_profileVersion;
    v25->_profileVersion = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    sourceAccountDSID = v25->_sourceAccountDSID;
    v25->_sourceAccountDSID = (NSNumber *)v40;

    v25->_lock._os_unfair_lock_opaque = 0;
    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    convertedActionsCache = v25->_convertedActionsCache;
    v25->_convertedActionsCache = v42;
  }
  return v25;
}

- (ICURLBagRadioConfiguration)radioConfiguration
{
  v2 = [(ICURLBag *)self dictionaryForBagKey:@"radio"];
  if (_NSIsNSDictionary()) {
    uint64_t v3 = [[ICURLBagRadioConfiguration alloc] initWithBagRadioDictionary:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)mescalConfigurationForRequest:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [v4 URL];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v5 absoluteString];
  double v9 = [v5 lastPathComponent];
  double v10 = [(ICURLBag *)self dictionaryForBagKey:@"sign-sap-request"];
  BOOL v67 = [(ICURLBag *)self _shouldMescalSignBodyForURL:v5 withSignatureConfiguration:v10];

  __int16 v11 = [(ICURLBag *)self dictionaryForBagKey:@"signed-actions"];
  v69 = v11;
  if (_NSIsNSDictionary())
  {
    v63 = v9;
    v65 = v5;
    id v61 = v4;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v87;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v87 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v86 + 1) + 8 * i);
          if (_NSIsNSString() && [v8 rangeOfString:v17] != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = [v12 objectForKey:v17];
            if (_NSIsNSDictionary())
            {
              id v20 = [v19 objectForKey:v9];
              long long v5 = v65;
              if (_NSIsNSDictionary())
              {
                v59 = [v20 objectForKey:@"fields"];
                v54 = v20;
                v55 = v19;
                if (_NSIsNSArray())
                {
                  long long v84 = 0u;
                  long long v85 = 0u;
                  long long v82 = 0u;
                  long long v83 = 0u;
                  id v21 = v59;
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v82 objects:v93 count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v83;
                    do
                    {
                      for (uint64_t j = 0; j != v23; ++j)
                      {
                        if (*(void *)v83 != v24) {
                          objc_enumerationMutation(v21);
                        }
                        [v6 addObject:*(void *)(*((void *)&v82 + 1) + 8 * j)];
                      }
                      uint64_t v23 = [v21 countByEnumeratingWithState:&v82 objects:v93 count:16];
                    }
                    while (v23);
                  }

                  double v9 = v63;
                  long long v5 = v65;
                  id v20 = v54;
                  id v19 = v55;
                }
                v57 = [v20 objectForKey:@"headers"];
                if (_NSIsNSArray())
                {
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v78 = 0u;
                  long long v79 = 0u;
                  id v26 = v57;
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v92 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v79;
                    do
                    {
                      for (uint64_t k = 0; k != v28; ++k)
                      {
                        if (*(void *)v79 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        [v7 addObject:*(void *)(*((void *)&v78 + 1) + 8 * k)];
                      }
                      uint64_t v28 = [v26 countByEnumeratingWithState:&v78 objects:v92 count:16];
                    }
                    while (v28);
                  }

                  double v9 = v63;
                  long long v5 = v65;
                  id v20 = v54;
                  id v19 = v55;
                }
                __int16 v31 = v20;
                int v32 = objc_msgSend(v20, "ic_BOOLValueForKey:", @"path");
              }
              else
              {
                __int16 v31 = v20;
                int v32 = 0;
              }

              id v4 = v61;
            }
            else
            {
              int v32 = 0;
              id v4 = v61;
              long long v5 = v65;
            }

            uint64_t v18 = v32 != 0;
            goto LABEL_38;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v86 objects:v94 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = 0;
    id v4 = v61;
    long long v5 = v65;
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_38:
  __int16 v33 = [(ICURLBag *)self dictionaryForBagKey:@"musicCommon"];
  if (!_NSIsNSDictionary())
  {
LABEL_46:
    if (!v67) {
      goto LABEL_68;
    }
LABEL_47:
    uint64_t v36 = 1;
LABEL_74:
    v50 = objc_alloc_init(ICURLBagMescalConfiguration);
    [(ICURLBagMescalConfiguration *)v50 setShouldSignBody:v36];
    if ([v6 count]) {
      id v51 = v6;
    }
    else {
      id v51 = 0;
    }
    [(ICURLBagMescalConfiguration *)v50 setFields:v51];
    if ([v7 count]) {
      id v52 = v7;
    }
    else {
      id v52 = 0;
    }
    [(ICURLBagMescalConfiguration *)v50 setHeaders:v52];
    [(ICURLBagMescalConfiguration *)v50 setShouldIncludePath:v18];
    goto LABEL_81;
  }
  uint64_t v34 = [v33 objectForKey:@"musicMescal"];
  if (!_NSIsNSDictionary())
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v35 = [v34 objectForKey:@"actions"];
  if (!_NSIsNSArray() || ![v35 containsObject:v9])
  {

    goto LABEL_45;
  }
  v60 = v35;
  if (v67)
  {
    char v58 = 1;
  }
  else
  {
    uint64_t v37 = [v4 HTTPMethod];
    char v58 = [v37 isEqualToString:@"POST"];

    uint64_t v35 = v60;
  }
  v68 = [v34 objectForKey:@"fields"];
  id v62 = v4;
  v64 = v9;
  v66 = v5;
  if (_NSIsNSArray())
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v38 = v68;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v74 objects:v91 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v38);
          }
          [v6 addObject:*(void *)(*((void *)&v74 + 1) + 8 * m)];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v74 objects:v91 count:16];
      }
      while (v40);
    }

    id v4 = v62;
    double v9 = v64;
    long long v5 = v66;
    uint64_t v35 = v60;
  }
  unsigned int v56 = v18;
  v43 = [v34 objectForKey:@"headers"];
  if (_NSIsNSArray())
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v70 objects:v90 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v71;
      do
      {
        for (uint64_t n = 0; n != v46; ++n)
        {
          if (*(void *)v71 != v47) {
            objc_enumerationMutation(v44);
          }
          [v7 addObject:*(void *)(*((void *)&v70 + 1) + 8 * n)];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v70 objects:v90 count:16];
      }
      while (v46);
    }

    id v4 = v62;
    double v9 = v64;
    long long v5 = v66;
    uint64_t v35 = v60;
  }

  uint64_t v18 = v56;
  if (v58) {
    goto LABEL_47;
  }
LABEL_68:
  if ([v6 count] || (objc_msgSend(v7, "count") ? (int v49 = 1) : (int v49 = v18), v49 == 1))
  {
    uint64_t v36 = 0;
    goto LABEL_74;
  }
  v50 = 0;
LABEL_81:

  return v50;
}

- (BOOL)_shouldMescalSignBodyForURL:(id)a3 withSignatureConfiguration:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    double v9 = [v5 absoluteString];
    double v10 = [v5 lastPathComponent];
    if (_NSIsNSDictionary())
    {
      __int16 v33 = v7;
      id v34 = v5;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        char v14 = 0;
        uint64_t v15 = *(void *)v45;
        p_locuint64_t k = &self->_lock;
        uint64_t v37 = v10;
        id v38 = v9;
        uint64_t v35 = *(void *)v45;
        id v36 = v11;
        while (2)
        {
          uint64_t v17 = 0;
          uint64_t v40 = v13;
          do
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v43 = v17;
            uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * v17);
            if (_NSIsNSString() && [v9 rangeOfString:v18] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v42 = v18;
              id v19 = [v11 objectForKey:v18];
              if (_NSIsNSArray())
              {
                if ([v19 containsObject:v10])
                {

LABEL_34:
                  BOOL v8 = 1;
                  goto LABEL_35;
                }
                os_unfair_lock_lock(p_lock);
                id v20 = [(NSMutableDictionary *)self->_convertedActionsCache objectForKey:v42];
                if (!v20)
                {
                  uint64_t v39 = v19;
                  id v21 = v19;
                  id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
                  uint64_t v22 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  id v23 = v21;
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
                  if (v24)
                  {
                    uint64_t v25 = v24;
                    uint64_t v26 = *(void *)v49;
                    do
                    {
                      for (uint64_t i = 0; i != v25; ++i)
                      {
                        if (*(void *)v49 != v26) {
                          objc_enumerationMutation(v23);
                        }
                        uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "mutableCopy", v33, v34);
                        uint64_t v29 = objc_msgSend(v28, "rangeOfCharacterFromSet:options:range:", v22, 0, 0, objc_msgSend(v28, "length"));
                        if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                        {
                          for (uint64_t j = v29;
                                j != 0x7FFFFFFFFFFFFFFFLL;
                                uint64_t j = objc_msgSend(v28, "rangeOfCharacterFromSet:options:range:", v22, 0, j + 2, objc_msgSend(v28, "length") - (j + 2)))
                          {
                            [v28 insertString:@"-" atIndex:j];
                          }
                        }
                        __int16 v31 = [v28 lowercaseString];
                        [v20 addObject:v31];
                      }
                      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
                    }
                    while (v25);
                  }

                  [(NSMutableDictionary *)self->_convertedActionsCache setObject:v20 forKey:v42];
                  double v10 = v37;
                  double v9 = v38;
                  uint64_t v15 = v35;
                  id v11 = v36;
                  p_locuint64_t k = &self->_lock;
                  id v19 = v39;
                }
                os_unfair_lock_unlock(p_lock);
                char v14 = [v20 containsObject:v10];

                uint64_t v13 = v40;
              }

              if (v14) {
                goto LABEL_34;
              }
            }
            uint64_t v17 = v43 + 1;
          }
          while (v43 + 1 != v13);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      else
      {
        char v14 = 0;
      }

      BOOL v8 = v14 & 1;
LABEL_35:
      id v7 = v33;
      id v5 = v34;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)mescalConfigurationForResponse:(id)a3
{
  id v4 = [a3 URL];
  if (v4
    && ([(ICURLBag *)self dictionaryForBagKey:@"sign-sap-response"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(ICURLBag *)self _shouldMescalSignBodyForURL:v4 withSignatureConfiguration:v5], v5, v6))
  {
    id v7 = objc_alloc_init(ICURLBagMescalConfiguration);
    [(ICURLBagMescalConfiguration *)v7 setShouldSignBody:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __33__ICURLBag__knownOptionalBagKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"auth-can-post", @"isExplicitContentAgeVerificationRequired", @"ExplicitContentBadgeTreatment", @"ios-app-url", @"storefront-header-suffix", @"subscription-storefront-header-suffix", @"aps-sampling-percentage", @"clientIDDomains", @"ios-app-download-retry-count", @"lyricsOnByDefaultDisabled", @"md-domains", @"min-artist-update-polling-frequency-secs", @"ratingWarningThreshold", @"ratingWarningTitle", @"ratingWarningText", @"TLSSamplingPercentage", @"TLSSamplingSessionDuration",
    @"TFOSamplingPercentage",
    @"TFOSamplingSessionDuration",
    @"fuseHeaderEnrichment",
    @"fuseCarrierMccMncList",
    @"isExplicitMusicDisallowed",
    @"musicFriends",
    @"enhanced-audio",
  _knownOptionalBagKeys_sKnownOptionalBagKeys = 0);

  return MEMORY[0x1F41817F8]();
}

- (ICURLBagEnhancedAudioConfiguration)enhancedAudioConfiguration
{
  v2 = [(ICURLBag *)self dictionaryForBagKey:@"enhanced-audio"];
  if (_NSIsNSDictionary()) {
    uint64_t v3 = [[ICURLBagEnhancedAudioConfiguration alloc] initWithBagEnhancedAudioDictionary:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsBag, 0);
  objc_storeStrong((id *)&self->_sourceAccountDSID, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_serverCorrelationKey, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_GUIDURLSchemes, 0);
  objc_storeStrong((id *)&self->_GUIDURLRegexPatterns, 0);
  objc_storeStrong((id *)&self->_convertedActionsCache, 0);

  objc_storeStrong((id *)&self->_bagValues, 0);
}

- (NSNumber)sourceAccountDSID
{
  return self->_sourceAccountDSID;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (NSString)serverCorrelationKey
{
  return self->_serverCorrelationKey;
}

- (void)_setExpirationDate:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setConvertedActionsCache:(id)a3
{
}

- (NSMutableDictionary)convertedActionsCache
{
  return self->_convertedActionsCache;
}

- (void)setBagValues:(id)a3
{
}

- (id)_knownIncorrectValues
{
  if (_knownIncorrectValues_sKnownIncorrectValuesOnceToken != -1) {
    dispatch_once(&_knownIncorrectValues_sKnownIncorrectValuesOnceToken, &__block_literal_global_578);
  }
  v2 = (void *)_knownIncorrectValues_sKnownIncorrectValues;

  return v2;
}

void __33__ICURLBag__knownIncorrectValues__block_invoke()
{
  v0 = (void *)_knownIncorrectValues_sKnownIncorrectValues;
  _knownIncorrectValues_sKnownIncorrectValues = MEMORY[0x1E4F1CC08];
}

- (NSDictionary)_propertyListRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  bagValues = self->_bagValues;
  if (bagValues) {
    [v3 setObject:bagValues forKey:@"bag_dictionary"];
  }
  amsBag = self->_amsBag;
  if (amsBag)
  {
    id v7 = [(AMSSnapshotBag *)amsBag compile];
    id v21 = 0;
    BOOL v8 = [v7 resultWithError:&v21];
    id v9 = v21;

    if (v8)
    {
      [v4 setObject:v8 forKey:@"ams_bag_data"];
    }
    else
    {
      double v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v9;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize ams bag. err=%{public}@", buf, 0x16u);
      }
    }
  }
  id v11 = NSNumber;
  [(NSDate *)self->_requestDate timeIntervalSinceReferenceDate];
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  [v4 setObject:v12 forKey:@"request_time"];

  uint64_t v13 = NSNumber;
  [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
  char v14 = objc_msgSend(v13, "numberWithDouble:");
  [v4 setObject:v14 forKey:@"expiration_time"];

  serverCorrelationKey = self->_serverCorrelationKey;
  if (serverCorrelationKey) {
    [v4 setObject:serverCorrelationKey forKey:@"server_correlation_key"];
  }
  serverEnvironment = self->_serverEnvironment;
  if (serverEnvironment) {
    [v4 setObject:serverEnvironment forKey:@"server_environment"];
  }
  profileName = self->_profileName;
  if (profileName) {
    [v4 setObject:profileName forKey:@"profile_name"];
  }
  profileVersiouint64_t n = self->_profileVersion;
  if (profileVersion) {
    [v4 setObject:profileVersion forKey:@"profile_version"];
  }
  sourceAccountDSID = self->_sourceAccountDSID;
  if (sourceAccountDSID) {
    [v4 setObject:sourceAccountDSID forKey:@"aource_account_dsid"];
  }

  return (NSDictionary *)v4;
}

- (void)createAMSSnapshotBagWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = self->_amsBag;
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F4DE28]);
    id v9 = [(ICURLBag *)self bagValues];
    [v8 setData:v9];

    double v10 = [(ICURLBag *)self expirationDate];
    [v8 setExpirationDate:v10];

    id v11 = [(ICURLBag *)self profileName];
    [v8 setProfile:v11];

    uint64_t v12 = [(ICURLBag *)self profileVersion];
    [v8 setProfileVersion:v12];

    id v13 = 0;
    uint64_t v6 = [v8 buildWithError:&v13];
    uint64_t v7 = (uint64_t)v13;
    if (!(v6 | v7))
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", 0, @"Failed to create a snapshot bag");
    }
  }
  v4[2](v4, v6, v7);
}

- (BOOL)canPostKeybagSyncData
{
  v2 = [(ICURLBag *)self numberForBagKey:@"auth-can-post"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (ICURLBagLibraryDAAPConfiguration)libraryDAAPConfiguration
{
  v2 = [(ICURLBag *)self dictionaryForBagKey:@"library-daap"];
  if (_NSIsNSDictionary()) {
    id v3 = [[ICURLBagLibraryDAAPConfiguration alloc] initWithBagLibraryDAAPDictionary:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)mescalConfigurationForResponseURL:(id)a3
{
  if (a3)
  {
    char v4 = (objc_class *)MEMORY[0x1E4F18DB0];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithURL:v5 MIMEType:0 expectedContentLength:0 textEncodingName:0];

    uint64_t v7 = [(ICURLBag *)self mescalConfigurationForResponse:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)mescalConfigurationForRequestURL:(id)a3
{
  char v4 = [MEMORY[0x1E4F18DA8] requestWithURL:a3];
  id v5 = [(ICURLBag *)self mescalConfigurationForRequest:v4];

  return v5;
}

- (int64_t)int64ValueForBagKey:(id)a3
{
  id v3 = [(ICURLBag *)self numberForBagKey:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (BOOL)hasValueForBagKey:(id)a3
{
  id v3 = [(ICURLBag *)self _valueForBagKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)valuesForBagKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[v5 copy];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(ICURLBag *)self bagValues];
  id v6 = [v4 bagValues];

  if (v5 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 isEqual:v6];
  }

  return v7;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  char v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:14400.0];
  id v8 = [(ICURLBag *)self _initWithDictionary:v5 amsBag:0 requestDate:v6 expirationDate:v7 serverCorrelationKey:0 serverEnvironment:0 profileName:0 profileVersion:0 sourceAccountDSID:0];

  return v8;
}

+ (NSArray)_allBagKeys
{
  if (_allBagKeys_sAllKnownKeysOnceToken != -1) {
    dispatch_once(&_allBagKeys_sAllKnownKeysOnceToken, &__block_literal_global_34593);
  }
  v2 = (void *)_allBagKeys_sAllKnownBagKeys;

  return (NSArray *)v2;
}

void __23__ICURLBag__allBagKeys__block_invoke()
{
  v2[133] = *MEMORY[0x1E4F143B8];
  v2[0] = @"guid-urls";
  v2[1] = @"getMatchStatusSrv";
  v2[2] = @"isMatchServiceEnabled";
  v2[3] = @"cloud-welcome";
  v2[4] = @"amd-domains";
  v2[5] = @"sign-sap-request";
  v2[6] = @"sign-sap-response";
  v2[7] = @"signed-actions";
  v2[8] = @"musicCommon";
  v2[9] = @"sign-sap-setup-cert";
  v2[10] = @"sign-sap-setup";
  v2[11] = @"fps-cert";
  v2[12] = @"fps-request";
  v2[13] = @"subDownload";
  v2[14] = @"md-finish-provisioning";
  v2[15] = @"amd-finish-provisioning";
  v2[16] = @"md-sync-machine";
  v2[17] = @"amd-sync-machine";
  v2[18] = @"redownloadProduct";
  v2[19] = @"paidRedownloadProduct";
  v2[20] = @"auth-can-post";
  v2[21] = @"songDownloadDone";
  v2[22] = @"radio";
  v2[23] = @"storefront-header-suffix";
  v2[24] = @"musicForYou";
  v2[25] = @"browse";
  v2[26] = @"grouping";
  v2[27] = @"radioTab";
  v2[28] = @"getSubscriptionStatusSrv";
  v2[29] = @"lease-start";
  v2[30] = @"lease-renew";
  v2[31] = @"lease-stop";
  v2[32] = @"storeplatform-lookup-url";
  v2[33] = @"storeplatform-lookup-url-unpersonalized";
  v2[34] = @"delegatePlayback";
  v2[35] = @"enableSubscription";
  v2[36] = @"disableSubscrption";
  v2[37] = @"getSubscriptionStatus";
  v2[38] = @"getWholeHouseAudioPlayInfo";
  v2[39] = @"play-activity-feed-request-post-url";
  v2[40] = @"authorizeMachine";
  v2[41] = @"mobile-network-constraints";
  v2[42] = @"library-auth-service-token-url";
  v2[43] = @"musicSubscription";
  v2[44] = @"buyProduct";
  v2[45] = @"push-notification-types";
  v2[46] = @"push-notifications";
  v2[47] = @"revokeMusicToken";
  v2[48] = @"subscription-status-refresh-interval-in-seconds";
  v2[49] = @"push-notification-allowexplicit";
  v2[50] = @"library-daap";
  v2[51] = @"preference-service-sync-url";
  v2[52] = @"preference-service-scheduled-sync-period-in-minutes";
  v2[53] = @"musicFriends";
  v2[54] = @"isExplicitContentAgeVerificationRequired";
  v2[55] = @"ExplicitContentBadgeTreatment";
  v2[56] = @"korAgeVerificationUrl";
  v2[57] = @"fuseHeaderEnrichment";
  v2[58] = @"fuseHeaderEnrichmentResponse";
  v2[59] = @"createMusicToken";
  v2[60] = @"inAppMessages";
  v2[61] = @"musicConnect";
  v2[62] = @"addToSiriTagHistoryBaseUrl";
  v2[63] = @"addToTRHistoryBaseUrl";
  v2[64] = @"pmlt-url";
  v2[65] = @"addToWishlistBaseUrl";
  v2[66] = @"getShareIdentifiers";
  v2[67] = @"purchase-daap";
  v2[68] = @"p2-content-restore";
  v2[69] = @"cloud-add-computer";
  v2[70] = @"storeFrontId";
  v2[71] = @"artist-new-content";
  v2[72] = @"countryCode";
  v2[73] = @"fetchSinfs";
  v2[74] = @"fuseCarrierMccMncList";
  v2[75] = @"ampMusicAPIDomains";
  v2[76] = @"enhanced-audio";
  v2[77] = @"get-play-info";
  v2[78] = @"url-regex-map";
  v2[79] = @"ios-app-url";
  v2[80] = @"js-app-url";
  v2[81] = @"trustedDomains";
  v2[82] = @"musicTabs";
  v2[83] = @"pm-feedback-base-url";
  v2[84] = @"max-mini-sinf-batch-size";
  v2[85] = @"getSubscriptionOffersSrv";
  v2[86] = @"auto-enrollment-percentage";
  v2[87] = @"use-apple-pay-classic";
  v2[88] = @"language";
  v2[89] = @"language-tag";
  v2[90] = @"manageSubscriptionsV2Url";
  v2[91] = @"AddFundsUrl";
  v2[92] = @"modifyAccount";
  v2[93] = @"marketingItemDynamicUIUrl";
  v2[94] = @"amsui-sources";
  v2[95] = @"musicui-js-url";
  v2[96] = @"commerce-ui-urls";
  v2[97] = @"musicSubscriptionOffersForStorefront";
  v2[98] = @"commerceApp";
  v2[99] = @"commerceAppBaseUrl";
  v2[100] = @"commerceAppFallbackUrl";
  v2[101] = @"financeApp";
  v2[102] = @"marketing-item-media-api-path";
  v2[103] = @"marketing-item-media-api-realm-mappings";
  v2[104] = @"subscription-storefront-header-suffix";
  v2[105] = @"redeemCodeLanding";
  v2[106] = @"cloud-library-opt-out-url";
  v2[107] = @"absinthe-requests";
  v2[108] = @"aps-sampling-percentage";
  v2[109] = @"clientIDDomains";
  v2[110] = @"ios-app-download-retry-count";
  v2[111] = @"lyricsOnByDefaultDisabled";
  v2[112] = @"md-domains";
  v2[113] = @"min-artist-update-polling-frequency-secs";
  v2[114] = @"ratingWarningThreshold";
  v2[115] = @"ratingWarningTitle";
  v2[116] = @"ratingWarningText";
  v2[117] = @"TLSSamplingPercentage";
  v2[118] = @"TLSSamplingSessionDuration";
  v2[119] = @"TFOSamplingPercentage";
  v2[120] = @"TFOSamplingSessionDuration";
  v2[121] = @"cloud-library-update-request";
  v2[122] = @"cloud-library-update-check";
  v2[123] = @"heif-format-rollout";
  v2[124] = @"sRdnld";
  v2[125] = @"isExplicitMusicDisallowed";
  v2[126] = @"processRedirectUrl";
  v2[127] = @"getMusicSDKAuthorizationsSrv";
  v2[128] = @"metrics";
  v2[129] = @"AddFundsUrl";
  v2[130] = @"manageSubscriptionsUrl";
  v2[131] = @"appleMusicDeviceOfferDeepLink";
  v2[132] = @"revokeMusicSDKAuthorizationSrv";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:133];
  v1 = (void *)_allBagKeys_sAllKnownBagKeys;
  _allBagKeys_sAllKnownBagKeys = v0;
}

@end