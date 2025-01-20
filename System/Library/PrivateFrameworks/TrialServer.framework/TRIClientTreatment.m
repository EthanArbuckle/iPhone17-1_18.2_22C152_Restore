@interface TRIClientTreatment
@end

@implementation TRIClientTreatment

void __67__TRIClientTreatment_CloudKit__assetURLsFromCKRecord_assetIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v40 = a2;
  v8 = objc_msgSend(MEMORY[0x1E4F1A2D8], "keyForListField:withIndexRange:", *MEMORY[0x1E4FB04A0], a2, a3);
  v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = (uint64_t)v8;
    _os_log_debug_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEBUG, "asset key: %@", buf, 0xCu);
  }

  v10 = [*(id *)(a1 + 32) triArrayValueForField:v8 isNestedValue:0];

  v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = (uint64_t)v10;
    _os_log_debug_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEBUG, "assetRange: %@", buf, 0xCu);
  }

  v12 = objc_msgSend(MEMORY[0x1E4F1A2D8], "keyForListField:withIndexRange:", *MEMORY[0x1E4FB0498], v40, a3);
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = (uint64_t)v12;
    _os_log_debug_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEBUG, "sig key: %@", buf, 0xCu);
  }

  v14 = [*(id *)(a1 + 32) triArrayValueForField:v12 isNestedValue:0];

  v15 = TRILogCategory_Server();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = (uint64_t)v14;
    _os_log_debug_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEBUG, "sigRange: %@", buf, 0xCu);
  }

  if ([v10 count] == a3 && objc_msgSend(v14, "count") == a3)
  {
    v38 = a4;
    if (a3)
    {
      uint64_t v16 = 0;
      while (1)
      {
        v17 = (void *)MEMORY[0x1E016E7F0]();
        v18 = v10;
        v19 = [v10 objectAtIndexedSubscript:v16];
        v20 = [v19 fileURL];

        if (!v20)
        {
          v27 = [MEMORY[0x1E4F28B00] currentHandler];
          [v27 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"TRIClientTreatment+CloudKit.m", 117, @"Expression was unexpectedly nil/false: %@", @"assetRange[i].fileURL" object file lineNumber description];
        }
        v21 = *(void **)(a1 + 40);
        v22 = [v14 objectAtIndexedSubscript:v16];
        v23 = [v20 path];
        if (!v23)
        {
          v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"TRIClientTreatment+CloudKit.m", 120, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
        }
        char v24 = [v21 validateBase64Signature:v22 forFile:v23];

        if ((v24 & 1) == 0) {
          break;
        }
        v25 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        v26 = [NSNumber numberWithUnsignedInteger:v40 + v16];
        [v25 setObject:v20 forKeyedSubscript:v26];

        ++v16;
        v10 = v18;
        if (a3 == v16) {
          goto LABEL_23;
        }
      }
      v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v36 = [*(id *)(a1 + 48) recordID];
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = (uint64_t)v36;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Bad assetSignature in Treatment record with CKRecordID %@", buf, 0xCu);
      }
      uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = 0;

      unsigned char *v38 = 1;
      v10 = v18;
    }
  }
  else
  {
    v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [v10 count];
      uint64_t v35 = [v14 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v42 = v34;
      __int16 v43 = 2048;
      uint64_t v44 = v35;
      __int16 v45 = 2048;
      uint64_t v46 = a3;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "assetRange and sigRange have unexpected counts (%tu, %tu; expected %tu)",
        buf,
        0x20u);
    }

    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0;

    *a4 = 1;
  }
LABEL_23:
}

uint64_t __120__TRIClientTreatment_TRIUtil___triRequiredCKAssetsForInstallationWithAssetStore_subscriptionSettings_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (![a4 isOnDemand]) {
    goto LABEL_9;
  }
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v10 = [v8 factor];
    v11 = [v10 namespaceName];
    v12 = [v9 subscribedFactorsForNamespaceName:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v13 = [v8 factor];
  v14 = [v13 name];

  uint64_t v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
  uint64_t v16 = (void *)v15;
  v17 = v15 ? (void *)v15 : v14;
  id v18 = v17;

  int v19 = [v12 containsObject:v18];
  if (!v19) {
    uint64_t v20 = 0;
  }
  else {
LABEL_9:
  }
    uint64_t v20 = [*(id *)(a1 + 48) hasAssetWithIdentifier:v7 type:0] ^ 1;

  return v20;
}

void __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [a2 name];
  if ([v8 hasAssetType]
    && [v8 hasAssetSpecifier]
    && ([v8 hasAssetVersion] & 1) != 0)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB0178]);
    v11 = [v8 assetType];
    v12 = [v8 assetSpecifier];
    v13 = [v8 assetVersion];
    v14 = (void *)[v10 initWithType:v11 specifier:v12 version:v13];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];
  }
  else
  {
    uint64_t v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [*(id *)(a1 + 32) treatmentId];
      int v19 = 138543618;
      uint64_t v20 = v18;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has MA reference with missing information for factor %{public}@.", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    *a5 = 1;
  }
}

uint64_t __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_289(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __131__TRIClientTreatment_TRIUtil___triRequiredMAAssetsForInstallationWithAssetStore_subscriptionSettings_maProvider_aliasToUnaliasMap___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v33 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [v33 name];
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = v9;
  }
  id v13 = v12;

  if (([v7 hasAssetType] & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRIClientTreatment+TRIUtil.m", 179, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetType" object file lineNumber description];
  }
  if (([v7 hasAssetSpecifier] & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRIClientTreatment+TRIUtil.m", 180, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetSpecifier" object file lineNumber description];
  }
  if (([v7 hasAssetVersion] & 1) == 0)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"TRIClientTreatment+TRIUtil.m", 181, @"Invalid parameter not satisfying: %@", @"maRef.hasAssetVersion" object file lineNumber description];
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB0178]);
  uint64_t v15 = [v7 assetType];
  uint64_t v16 = [v7 assetSpecifier];
  v17 = [v7 assetVersion];
  id v18 = (void *)[v14 initWithType:v15 specifier:v16 version:v17];

  LOBYTE(v16) = +[TRIAssetMetadataReservedKeys isEncryptedForMetadata:v8];
  int v19 = [TRIMAAssetMetadata alloc];
  uint64_t v20 = [v7 size];
  if (v16)
  {
    __int16 v21 = [v33 namespaceName];
    v22 = [(TRIMAAssetMetadata *)v19 initWithDownloadSize:v20 namespaceNameForEncryptionKey:v21];
  }
  else
  {
    v22 = [(TRIMAAssetMetadata *)v19 initWithDownloadSize:v20 namespaceNameForEncryptionKey:0];
  }
  uint64_t v23 = [*(id *)(a1 + 48) containsObject:v18];
  char v24 = [TRIRequiredMAAsset alloc];
  if ([v7 hasIsOnDemand]) {
    uint64_t v25 = [v7 isOnDemand];
  }
  else {
    uint64_t v25 = 0;
  }
  v26 = [(TRIRequiredMAAsset *)v24 initWithFactorName:v13 isInstalled:v23 isOnDemand:v25 metadata:v22 fullAssetId:v18];
  v27 = *(void **)(a1 + 56);
  if (v27)
  {
    v28 = [v33 namespaceName];
    uint64_t v29 = [v27 subscribedFactorsForNamespaceName:v28];
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (!-[TRIRequiredMAAsset isOnDemand](v26, "isOnDemand") || [v29 containsObject:v13]) {
    [*(id *)(a1 + 64) addObject:v26];
  }
}

uint64_t __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  if ([v4 isOnDemand]) {
    uint64_t v5 = [v4 hasPath] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __53__TRIClientTreatment_TRIUtil__unlinkedOnDemandAssets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 metadata];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 assetId];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

@end