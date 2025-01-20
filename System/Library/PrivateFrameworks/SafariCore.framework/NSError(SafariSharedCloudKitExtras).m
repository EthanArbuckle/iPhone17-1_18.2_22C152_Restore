@interface NSError(SafariSharedCloudKitExtras)
+ (uint64_t)safari_setUpCloudKitPrivacyPreservingUserInfoProvider;
- (BOOL)_safari_isOrContainsCloudKitErrorOfCodes:()SafariSharedCloudKitExtras checkInternalErrorCode:;
- (BOOL)safari_containsCloudKitMissingZoneErrorForRecordZoneID:()SafariSharedCloudKitExtras;
- (id)safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID:()SafariSharedCloudKitExtras;
- (id)safari_errorByAddingRequestUUIDInPrivacyPreservingUserInfo;
- (uint64_t)safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:()SafariSharedCloudKitExtras;
- (uint64_t)safari_hasOrContainsErrorWithCloudKitErrorCode:()SafariSharedCloudKitExtras;
- (uint64_t)safari_isCloudKitBatchTooLargeError;
- (uint64_t)safari_isCloudKitMissingZoneError;
- (uint64_t)safari_isCloudKitNonExistentRecordError;
- (uint64_t)safari_isInCloudKitErrorDomain;
- (uint64_t)safari_isOrContainsCloudKitMissingZoneError;
- (uint64_t)safari_isUnrecoverableCloudKitError;
- (void)_safari_enumerateCloudKitErrorsWithBlock:()SafariSharedCloudKitExtras;
@end

@implementation NSError(SafariSharedCloudKitExtras)

+ (uint64_t)safari_setUpCloudKitPrivacyPreservingUserInfoProvider
{
  return objc_msgSend(a1, "safari_setPrivacyPreservingUserInfoProviderForDomain:provider:", *MEMORY[0x1E4F19C40], &__block_literal_global_21);
}

- (void)_safari_enumerateCloudKitErrorsWithBlock:()SafariSharedCloudKitExtras
{
  v4 = a3;
  v5 = [a1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    char v13 = 0;
    v4[2](v4, a1, &v13);
    if (!v13 && [a1 code] == 2)
    {
      v7 = [a1 userInfo];
      v8 = objc_msgSend(v7, "safari_dictionaryForKey:", *MEMORY[0x1E4F19CD8]);

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__NSError_SafariSharedCloudKitExtras___safari_enumerateCloudKitErrorsWithBlock___block_invoke;
      v10[3] = &unk_1E615B620;
      id v11 = v8;
      v12 = v4;
      id v9 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v10];
    }
  }
}

- (uint64_t)safari_hasOrContainsErrorWithCloudKitErrorCode:()SafariSharedCloudKitExtras
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__NSError_SafariSharedCloudKitExtras__safari_hasOrContainsErrorWithCloudKitErrorCode___block_invoke;
  v5[3] = &unk_1E615B648;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "_safari_enumerateCloudKitErrorsWithBlock:", v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:()SafariSharedCloudKitExtras
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__NSError_SafariSharedCloudKitExtras__safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode___block_invoke;
  v5[3] = &unk_1E615B648;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "_safari_enumerateCloudKitErrorsWithBlock:", v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)safari_isInCloudKitErrorDomain
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F19C40]];

  return v2;
}

- (uint64_t)safari_isCloudKitBatchTooLargeError
{
  uint64_t result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if (result) {
    return [a1 code] == 27;
  }
  return result;
}

- (uint64_t)safari_isCloudKitNonExistentRecordError
{
  uint64_t result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if (result) {
    return [a1 code] == 11;
  }
  return result;
}

- (uint64_t)safari_isCloudKitMissingZoneError
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F19C40];
  v6[0] = &unk_1F1086738;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = objc_msgSend(a1, "safari_matchesErrorDomainsAndCodes:", v2);

  return v3;
}

- (uint64_t)safari_isOrContainsCloudKitMissingZoneError
{
  return objc_msgSend(a1, "_safari_isOrContainsCloudKitErrorOfCodes:checkInternalErrorCode:", &unk_1F1086750, 0);
}

- (BOOL)safari_containsCloudKitMissingZoneErrorForRecordZoneID:()SafariSharedCloudKitExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  v7 = [v6 objectForKeyedSubscript:v4];
  char v8 = objc_msgSend(v7, "safari_isCloudKitMissingZoneError");

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__NSError_SafariSharedCloudKitExtras__safari_containsCloudKitMissingZoneErrorForRecordZoneID___block_invoke;
    v11[3] = &unk_1E615B670;
    id v12 = v4;
    char v13 = &v14;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v9;
}

- (BOOL)_safari_isOrContainsCloudKitErrorOfCodes:()SafariSharedCloudKitExtras checkInternalErrorCode:
{
  id v6 = a3;
  if (objc_msgSend(a1, "safari_isInCloudKitErrorDomain"))
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    uint64_t v8 = [a1 code];
    BOOL v9 = [NSNumber numberWithInteger:v8];
    char v10 = [v7 containsObject:v9];

    if (v10)
    {
      BOOL v11 = 1;
    }
    else if (v8 == 2)
    {
      id v12 = [a1 userInfo];
      char v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      if ([v13 count])
      {
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2020000000;
        char v22 = 0;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __103__NSError_SafariSharedCloudKitExtras___safari_isOrContainsCloudKitErrorOfCodes_checkInternalErrorCode___block_invoke;
        v15[3] = &unk_1E615B698;
        id v16 = v7;
        char v17 = &v19;
        char v18 = a4;
        [v13 enumerateKeysAndObjectsUsingBlock:v15];
        BOOL v11 = *((unsigned char *)v20 + 24) != 0;

        _Block_object_dispose(&v19, 8);
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID:()SafariSharedCloudKitExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 domain];
  uint64_t v6 = *MEMORY[0x1E4F19C40];
  char v7 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if ((v7 & 1) == 0)
  {
    id v16 = a1;
    goto LABEL_16;
  }
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F1A280] itemErrorFromError:a1 forID:v4];
    BOOL v9 = v8;
    if (v8 && [v8 code] != 2)
    {
      char v17 = v9;
      goto LABEL_12;
    }
  }
  char v10 = [a1 userInfo];
  BOOL v9 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  if ([v9 count])
  {
    BOOL v11 = [a1 userInfo];
    id v12 = (void *)[v11 mutableCopy];

    char v13 = [MEMORY[0x1E4F1CA48] array];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __102__NSError_SafariSharedCloudKitExtras__safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID___block_invoke;
    v21[3] = &unk_1E615B6C0;
    id v14 = v13;
    id v22 = v14;
    [v9 enumerateKeysAndObjectsUsingBlock:v21];
    if ([v14 count])
    {
      v15 = [v14 componentsJoinedByString:@"; "];
    }
    else
    {
      v15 = @"None";
    }
    char v18 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19DA0]];
    uint64_t v19 = [NSString stringWithFormat:@"Request UUID: %@; Partial errors: %@", v18, v15];
    [v12 setObject:v19 forKeyedSubscript:@"WBSPrivacyPreservingDescription"];

    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  char v17 = a1;
LABEL_12:
  objc_msgSend(v17, "safari_errorByAddingRequestUUIDInPrivacyPreservingUserInfo");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:
  return v16;
}

- (id)safari_errorByAddingRequestUUIDInPrivacyPreservingUserInfo
{
  uint64_t v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F19C40];
  char v4 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4)
  {
    uint64_t v5 = [a1 userInfo];
    uint64_t v6 = (void *)[v5 mutableCopy];

    char v7 = NSString;
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19DA0]];
    BOOL v9 = [v7 stringWithFormat:@"Request UUID: %@", v8];
    [v6 setObject:v9 forKeyedSubscript:@"WBSPrivacyPreservingDescription"];

    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v3, objc_msgSend(a1, "code"), v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = a1;
  }
  return v10;
}

- (uint64_t)safari_isUnrecoverableCloudKitError
{
  uint64_t result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if (result)
  {
    unint64_t v3 = [a1 code];
    uint64_t result = 1;
    if (v3 <= 0x23)
    {
      if (((1 << v3) & 0xBE31FB722) != 0) {
        return result;
      }
      if (((1 << v3) & 0x41CE048DCLL) != 0) {
        return 0;
      }
    }
    unint64_t v4 = v3 - 110;
    if (v4 > 0x1E || ((1 << v4) & 0x40307C07) == 0) {
      return 0;
    }
  }
  return result;
}

@end