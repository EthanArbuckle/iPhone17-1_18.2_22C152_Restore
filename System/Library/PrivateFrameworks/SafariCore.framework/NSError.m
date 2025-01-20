@interface NSError
@end

@implementation NSError

uint64_t __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_privacyPreservingError");
}

void __85__NSError_SafariCoreExtras___safari_getPrivacyPreservingUserInfoProvidersUsingBlock___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders;
  _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders = v0;
}

id __92__NSError_SafariSharedCloudKitExtras__safari_setUpCloudKitPrivacyPreservingUserInfoProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = *MEMORY[0x1E4F19DA0];
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19DA0]];
  [v4 setObject:v6 forKeyedSubscript:v5];

  uint64_t v7 = *MEMORY[0x1E4F19BF8];
  v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19BF8]];
  [v4 setObject:v8 forKeyedSubscript:v7];

  uint64_t v9 = *MEMORY[0x1E4F19C60];
  v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];
  [v4 setObject:v10 forKeyedSubscript:v9];

  uint64_t v11 = *MEMORY[0x1E4F19DE8];
  v12 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19DE8]];
  v13 = objc_msgSend(v12, "safari_privacyPreservingError");
  [v4 setObject:v13 forKeyedSubscript:v11];

  uint64_t v14 = [v2 code];
  v15 = stringForCKErrorCode();
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v14 == 26)
  {
    uint64_t v19 = *MEMORY[0x1E4F19C78];
    v17 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19C78]];
    [v4 setObject:v17 forKeyedSubscript:v19];
  }
  else
  {
    if (v14 != 2) {
      goto LABEL_6;
    }
    uint64_t v16 = *MEMORY[0x1E4F19CD8];
    v17 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    v18 = objc_msgSend(v17, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_3_0);
    [v4 setObject:v18 forKeyedSubscript:v16];
  }
LABEL_6:
  v20 = (void *)[v4 copy];

  return v20;
}

void __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __91__NSError_SafariCoreExtras__safari_setPrivacyPreservingUserInfoProviderForDomain_provider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const void **)(a1 + 40);
  id v4 = a2;
  id v5 = _Block_copy(v3);
  [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

uint64_t __92__NSError_SafariSharedCloudKitExtras__safari_setUpCloudKitPrivacyPreservingUserInfoProvider__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "safari_privacyPreservingError");
}

void __80__NSError_SafariSharedCloudKitExtras___safari_enumerateCloudKitErrorsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t v3 = [v5 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __86__NSError_SafariSharedCloudKitExtras__safari_hasOrContainsErrorWithCloudKitErrorCode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 code];
  if (result == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __97__NSError_SafariSharedCloudKitExtras__safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  BOOL v5 = [v9 code] == 1;
  v6 = v9;
  if (v5)
  {
    uint64_t v7 = [v9 userInfo];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if ([v8 code] == *(void *)(a1 + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }

    v6 = v9;
  }
}

void __94__NSError_SafariSharedCloudKitExtras__safari_containsCloudKitMissingZoneErrorForRecordZoneID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v10 zoneID];
    int v9 = [v8 isEqual:*(void *)(a1 + 32)];

    if (v9)
    {
      if (objc_msgSend(v7, "safari_isCloudKitMissingZoneError"))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
}

void __103__NSError_SafariSharedCloudKitExtras___safari_isOrContainsCloudKitErrorOfCodes_checkInternalErrorCode___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v13 = v6;
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    int v9 = [v13 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
      LODWORD(v11) = [v11 containsObject:v12];

      if (v11)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
}

void __102__NSError_SafariSharedCloudKitExtras__safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  BOOL v5 = NSString;
  id v6 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v5 stringWithFormat:@"RecordID: %@, Error: %@", v6, v8];

  [v4 addObject:v7];
}

void __79__NSError_SafariCoreExtras__safari_privacyPreservingUserInfoProviderForDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __70__NSError_SafariCoreExtras__safari_isOrContainsClientSideNetworkError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isOrContainsClientSideNetworkError");
}

@end