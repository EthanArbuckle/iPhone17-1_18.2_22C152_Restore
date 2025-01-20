@interface NSError(SafariCoreExtras)
+ (id)safari_errorWithDomain:()SafariCoreExtras code:privacyPreservingDescription:;
+ (id)safari_privacyPreservingUserInfoProviderForDomain:()SafariCoreExtras;
+ (void)_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:()SafariCoreExtras;
+ (void)safari_setPrivacyPreservingUserInfoProviderForDomain:()SafariCoreExtras provider:;
- (id)safari_privacyPreservingDescription;
- (id)safari_privacyPreservingError;
- (uint64_t)safari_initWithDomain:()SafariCoreExtras code:privacyPreservingDescription:;
- (uint64_t)safari_isOrContainsClientSideNetworkError;
- (uint64_t)safari_isOrContainsNetworkUnavailableError;
- (uint64_t)safari_isSQLiteCorruptionError;
- (uint64_t)safari_isSQLiteError;
- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras;
- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras andCode:;
- (uint64_t)safari_matchesErrorDomainsAndCodes:()SafariCoreExtras;
@end

@implementation NSError(SafariCoreExtras)

+ (void)safari_setPrivacyPreservingUserInfoProviderForDomain:()SafariCoreExtras provider:
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__NSError_SafariCoreExtras__safari_setPrivacyPreservingUserInfoProviderForDomain_provider___block_invoke;
  v10[3] = &unk_1E615B6F0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend(a1, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", v10);
}

- (id)safari_privacyPreservingDescription
{
  v1 = objc_msgSend(a1, "safari_privacyPreservingError");
  v2 = [v1 description];

  return v2;
}

- (id)safari_privacyPreservingError
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [a1 userInfo];
  uint64_t v4 = *MEMORY[0x1E4F28A50];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  id v6 = objc_msgSend(v5, "safari_privacyPreservingError");
  [v2 setObject:v6 forKeyedSubscript:v4];

  uint64_t v7 = *MEMORY[0x1E4F28750];
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];
  id v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_9);
  [v2 setObject:v9 forKeyedSubscript:v7];

  uint64_t v10 = [a1 domain];
  id v11 = (void *)v10;
  id v12 = &stru_1F105D3F0;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  v13 = v12;

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0;
  v14 = objc_opt_class();
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke_2;
  v27 = &unk_1E615B718;
  v29 = &v30;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v14, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", &v24);
  uint64_t v16 = v31[5];
  if (v16)
  {
    v17 = (*(void (**)(uint64_t, void *))(v16 + 16))(v16, a1);
    objc_msgSend(v2, "addEntriesFromDictionary:", v17, v24, v25, v26, v27);
  }
  v18 = objc_msgSend(a1, "userInfo", v24, v25, v26, v27);
  v19 = objc_msgSend(v18, "safari_stringForKey:", @"WBSPrivacyPreservingDescription");

  if (v19) {
    goto LABEL_6;
  }
  if ([(__CFString *)v15 length]
    && ([MEMORY[0x1E4F28C58] userInfoValueProviderForDomain:v15],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        (v21 = (void *)v20) != 0))
  {
    v19 = (*(void (**)(uint64_t, void *, __CFString *))(v20 + 16))(v20, a1, @"WBSPrivacyPreservingDescription");

    if (v19) {
LABEL_6:
    }
      [v2 setObject:v19 forKeyedSubscript:@"WBSPrivacyPreservingDescription"];
  }
  else
  {
    v19 = 0;
  }
  v22 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v15, objc_msgSend(a1, "code"), v2);

  _Block_object_dispose(&v30, 8);
  return v22;
}

+ (void)_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:()SafariCoreExtras
{
  uint64_t v3 = _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__onceToken;
  uint64_t v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__onceToken, &__block_literal_global_22);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__lock);
  v4[2](v4, _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders);

  os_unfair_lock_unlock((os_unfair_lock_t)&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__lock);
}

+ (id)safari_errorWithDomain:()SafariCoreExtras code:privacyPreservingDescription:
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_msgSend([a1 alloc], "safari_initWithDomain:code:privacyPreservingDescription:", v9, a4, v8);

  return v10;
}

- (uint64_t)safari_initWithDomain:()SafariCoreExtras code:privacyPreservingDescription:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    v13 = @"WBSPrivacyPreservingDescription";
    v14[0] = a5;
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = a5;
    a5 = [v9 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  uint64_t v11 = [a1 initWithDomain:v8 code:a4 userInfo:a5];

  return v11;
}

+ (id)safari_privacyPreservingUserInfoProviderForDomain:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__NSError_SafariCoreExtras__safari_privacyPreservingUserInfoProviderForDomain___block_invoke;
  v8[3] = &unk_1E615B718;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  objc_msgSend(a1, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", v8);
  id v6 = _Block_copy((const void *)v12[5]);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)safari_isOrContainsClientSideNetworkError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v3)
  {
    unint64_t v4 = [a1 code] + 1020;
    if (v4 < 0x14 && ((0x88803u >> v4) & 1) != 0) {
      return 1;
    }
  }
  id v5 = [a1 underlyingErrors];
  uint64_t v6 = objc_msgSend(v5, "safari_containsObjectPassingTest:", &__block_literal_global_5);

  return v6;
}

- (uint64_t)safari_isSQLiteError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.Safari.SQLite"];

  return v2;
}

- (uint64_t)safari_isSQLiteCorruptionError
{
  uint64_t result = objc_msgSend(a1, "safari_isSQLiteError");
  if (result) {
    return [a1 code] == 11;
  }
  return result;
}

- (uint64_t)safari_isOrContainsNetworkUnavailableError
{
  if (objc_msgSend(a1, "safari_isOrContainsClientSideNetworkError")) {
    return 1;
  }
  return objc_msgSend(a1, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 3);
}

- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [a1 domain];
  uint64_t v6 = [v5 isEqualToString:v4];

  return v6;
}

- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras andCode:
{
  uint64_t result = objc_msgSend(a1, "safari_matchesErrorDomain:");
  if (result) {
    return [a1 code] == a4;
  }
  return result;
}

- (uint64_t)safari_matchesErrorDomainsAndCodes:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [a1 domain];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if ([v6 count])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end