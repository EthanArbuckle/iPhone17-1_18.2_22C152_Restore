@interface NSError(WelcomeKit)
+ (id)_wl_encodableArrayFromArray:()WelcomeKit;
+ (id)_wl_encodableDictionaryFromDictionary:()WelcomeKit;
+ (id)_wl_encodableObjectFromObject:()WelcomeKit;
+ (id)_wl_encodableSetFromSet:()WelcomeKit;
+ (id)wl_encodableErrorSupportedClasses;
+ (uint64_t)_wl_objectIsKindOfNonCollectionPlistClass:()WelcomeKit;
- (id)wl_encodableError;
- (uint64_t)wk_representsTransientConnectivityIssueForAttempt:()WelcomeKit;
@end

@implementation NSError(WelcomeKit)

- (id)wl_encodableError
{
  v2 = [a1 userInfo];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F087E8];
    v5 = [a1 userInfo];
    v6 = objc_msgSend(v4, "_wl_encodableDictionaryFromDictionary:", v5);

    v7 = (void *)MEMORY[0x263F087E8];
    v8 = [a1 domain];
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

+ (id)wl_encodableErrorSupportedClasses
{
  if (wl_encodableErrorSupportedClasses_onceToken != -1) {
    dispatch_once(&wl_encodableErrorSupportedClasses_onceToken, &__block_literal_global);
  }
  v0 = (void *)wl_encodableErrorSupportedClasses_supportedClasses;
  return v0;
}

+ (id)_wl_encodableObjectFromObject:()WelcomeKit
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v4, "wl_encodableError");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v6 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a1, "_wl_encodableArrayFromArray:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a1, "_wl_encodableSetFromSet:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a1, "_wl_encodableDictionaryFromDictionary:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x263F087E8], "_wl_objectIsKindOfNonCollectionPlistClass:", v4))
  {
    id v5 = v4;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)_wl_encodableArrayFromArray:()WelcomeKit
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "_wl_encodableObjectFromObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_wl_encodableSetFromSet:()WelcomeKit
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "_wl_encodableObjectFromObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_wl_encodableDictionaryFromDictionary:()WelcomeKit
{
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__NSError_WelcomeKit___wl_encodableDictionaryFromDictionary___block_invoke;
  v9[3] = &unk_26490BD90;
  uint64_t v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

+ (uint64_t)_wl_objectIsKindOfNonCollectionPlistClass:()WelcomeKit
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (_wl_objectIsKindOfNonCollectionPlistClass__onceToken != -1) {
    dispatch_once(&_wl_objectIsKindOfNonCollectionPlistClass__onceToken, &__block_literal_global_14);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)_wl_objectIsKindOfNonCollectionPlistClass__nonCollectionPlistClasses;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

- (uint64_t)wk_representsTransientConnectivityIssueForAttempt:()WelcomeKit
{
  if (a3 <= 2)
  {
    uint64_t v5 = [a1 domain];
    if ([v5 isEqualToString:*MEMORY[0x263F08570]])
    {
      if ([a1 code] == -1001 || objc_msgSend(a1, "code") == -1005)
      {
        BOOL v3 = 1;
LABEL_11:

        return v3;
      }
      uint64_t v7 = [a1 code];

      if (v7 == -1003) {
        return 1;
      }
    }
    else
    {
    }
    uint64_t v5 = [a1 domain];
    if ([v5 isEqualToString:*MEMORY[0x263F7B758]]) {
      BOOL v3 = [a1 code] == 110;
    }
    else {
      BOOL v3 = 0;
    }
    goto LABEL_11;
  }
  return 0;
}

@end