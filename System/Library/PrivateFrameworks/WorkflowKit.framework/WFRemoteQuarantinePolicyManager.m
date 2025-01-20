@interface WFRemoteQuarantinePolicyManager
+ (id)sharedManager;
- (BOOL)deleteAssetBundlesExceptAssetWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)persistAssetToDisk:(id)a3 error:(id *)a4;
- (BOOL)processAsset:(id)a3 error:(id *)a4;
- (CKContainer)container;
- (CKDatabase)database;
- (NSBundle)localPolicyBundle;
- (WFRemoteQuarantinePolicyManager)init;
- (id)latestRemotePolicyAssetBundle;
- (id)localizedString:(id)a3;
- (id)policyAssetBundle;
- (id)policyString;
- (id)policyStringForBundleIfValid:(id)a3;
- (id)prepareDirectoryForAssetWithIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)policyVersion;
- (void)setContainer:(id)a3;
- (void)setDatabase:(id)a3;
- (void)updatePolicyWithXPCActivity:(id)a3 completionHandler:(id)a4;
@end

@implementation WFRemoteQuarantinePolicyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPolicyBundle, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (NSBundle)localPolicyBundle
{
  return self->_localPolicyBundle;
}

- (void)setDatabase:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (id)prepareDirectoryForAssetWithIdentifier:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  v7 = [v5 defaultManager];
  v8 = WFAssetDataDirectoryForIdentifier(v6);

  v9 = [v8 path];
  if ([v7 fileExistsAtPath:v9]
    && ![v7 removeItemAtURL:v8 error:a4])
  {
    id v11 = 0;
  }
  else
  {
    int v10 = [v7 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];
    id v11 = 0;
    if (v10) {
      id v11 = v8;
    }
  }

  return v11;
}

- (BOOL)deleteAssetBundlesExceptAssetWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = WFAssetDataDirectoryForIdentifier(v5);
  v8 = [v7 URLByStandardizingPath];

  v9 = WFAssetsDirectory();
  id v27 = 0;
  int v10 = [v6 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:2 error:&v27];
  id v11 = v27;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__WFRemoteQuarantinePolicyManager_deleteAssetBundlesExceptAssetWithIdentifier_error___block_invoke;
  v25[3] = &unk_1E654CC28;
  id v12 = v8;
  id v26 = v12;
  v13 = objc_msgSend(v10, "if_objectsPassingTest:", v25);

  if ([v13 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (!objc_msgSend(v6, "removeItemAtURL:error:", *(void *)(*((void *)&v21 + 1) + 8 * i), a4, (void)v21))
          {
            BOOL v19 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v28 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    BOOL v19 = 1;
LABEL_12:
  }
  else
  {
    if (a4) {
      *a4 = v11;
    }
    BOOL v19 = v11 == 0;
  }

  return v19;
}

uint64_t __85__WFRemoteQuarantinePolicyManager_deleteAssetBundlesExceptAssetWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 URLByStandardizingPath];
  v4 = [v3 pathExtension];
  if ([v4 isEqualToString:@"bundle"])
  {
    int v5 = [v3 isEqual:*(void *)(a1 + 32)];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)persistAssetToDisk:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 assetDataFile];
  v9 = WFExtractArchiveFile();

  if (v9)
  {
    int v10 = [v7 identifier];
    id v11 = [v10 recordName];
    id v12 = [(WFRemoteQuarantinePolicyManager *)self prepareDirectoryForAssetWithIdentifier:v11 error:a4];

    if (!v12)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:self file:@"WFRemoteQuarantinePolicyManager.m" lineNumber:236 description:@"WFRemoteQuarantinePolicyManager cannot access the filesystem."];

      BOOL v27 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    unsigned __int8 v51 = 0;
    if ([v9 count] == 1)
    {
      id v14 = [v9 objectAtIndexedSubscript:0];
      uint64_t v15 = [v14 fileURL];
      uint64_t v16 = [v15 path];
      if ([v13 fileExistsAtPath:v16 isDirectory:&v51])
      {
        int v17 = v51;

        if (v17)
        {
          v18 = [v9 objectAtIndexedSubscript:0];
          id v19 = [v18 fileURL];

          [v13 enumeratorAtURL:v19 includingPropertiesForKeys:0 options:0 errorHandler:0];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            v38 = v9;
            id v40 = v7;
            uint64_t v22 = *(void *)v48;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v48 != v22) {
                  objc_enumerationMutation(obj);
                }
                long long v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                v25 = [v24 lastPathComponent];
                id v26 = [v12 URLByAppendingPathComponent:v25];

                LODWORD(v24) = [v13 moveItemAtURL:v24 toURL:v26 error:a4];
                if (!v24)
                {
                  BOOL v27 = 0;
                  goto LABEL_31;
                }
              }
              uint64_t v21 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
              if (v21) {
                continue;
              }
              break;
            }
            BOOL v27 = 1;
LABEL_31:
            v9 = v38;
            id v7 = v40;
          }
          else
          {
            BOOL v27 = 1;
          }

LABEL_34:
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v19 = v9;
    uint64_t v29 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      v39 = v9;
      id v41 = v7;
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v19);
          }
          v33 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          v34 = [v33 filename];
          v35 = [v12 URLByAppendingPathComponent:v34];

          v36 = [v33 fileURL];
          LODWORD(v34) = [v13 moveItemAtURL:v36 toURL:v35 error:a4];

          if (!v34)
          {
            BOOL v27 = 0;
            goto LABEL_28;
          }
        }
        uint64_t v30 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v30) {
          continue;
        }
        break;
      }
      BOOL v27 = 1;
LABEL_28:
      v9 = v39;
      id v7 = v41;
    }
    else
    {
      BOOL v27 = 1;
    }
    goto LABEL_34;
  }
  BOOL v27 = 0;
LABEL_36:

  return v27;
}

- (BOOL)processAsset:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 compatibilityVersion] != 2)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"WFRemoteQuarantinePolicyManager.m", 214, @"Cannot process incompatible asset. Found version: %ld. Expected: %ld", objc_msgSend(v7, "compatibilityVersion"), 2);
  }
  BOOL v8 = [(WFRemoteQuarantinePolicyManager *)self persistAssetToDisk:v7 error:a4];
  if (v8)
  {
    v9 = [v7 identifier];
    int v10 = [v9 recordName];
    id v16 = 0;
    BOOL v11 = [(WFRemoteQuarantinePolicyManager *)self deleteAssetBundlesExceptAssetWithIdentifier:v10 error:&v16];
    id v12 = v16;

    if (!v11)
    {
      v13 = getWFGeneralLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFRemoteQuarantinePolicyManager processAsset:error:]";
        __int16 v19 = 2114;
        id v20 = v12;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to clean-up older assets. Error: %{public}@", buf, 0x16u);
      }
    }
  }

  return v8;
}

- (void)updatePolicyWithXPCActivity:(id)a3 completionHandler:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F5A7A0];
  id v8 = a3;
  v9 = [v7 sharedContext];
  int v10 = [v9 applicationBundle];
  BOOL v11 = [v10 objectForInfoDictionaryKey:@"CFBundleIdentifier"];

  id v12 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  v13 = [v12 stringForKey:@"WFRemoteQuarantineConfiguration"];

  id v14 = v11;
  [v14 UTF8String];
  if ((os_variant_has_internal_content() & (v13 != 0)) != 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = @"default";
  }
  id v16 = v15;
  int v17 = [(WFRemoteQuarantinePolicyManager *)self latestRemotePolicyAssetBundle];
  v18 = [v17 objectForInfoDictionaryKey:@"ContentVersion"];
  uint64_t v19 = objc_opt_class();
  id v20 = WFEnforceClass(v18, v19);
  uint64_t v21 = [v20 unsignedIntegerValue];

  uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"compatibilityVersion = %ld AND contentVersion > %ld AND configuration = %@", 2, v21, v16];

  long long v23 = [WFCloudKitItemRequest alloc];
  long long v24 = [(WFRemoteQuarantinePolicyManager *)self container];
  v25 = [(WFRemoteQuarantinePolicyManager *)self database];
  id v26 = [(WFCloudKitItemRequest *)v23 initWithContainer:v24 database:v25];

  [(WFCloudKitItemRequest *)v26 setXpcActivity:v8];
  uint64_t v27 = objc_opt_class();
  v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"contentVersion" ascending:0];
  v36[0] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke;
  v33[3] = &unk_1E654CC00;
  id v34 = v6;
  SEL v35 = a2;
  v33[4] = self;
  id v30 = v6;
  id v31 = [(WFCloudKitItemRequest *)v26 fetchItemsWithPredicate:v22 itemType:v27 groupName:@"ConfigurationAssetQuery" properties:0 sortDescriptors:v29 resultsLimit:1 qualityOfService:17 completionHandler:v33];
}

void __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E654FCF0;
  id v18 = *(id *)(a1 + 40);
  id v7 = _Block_copy(aBlock);
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    (*((void (**)(void *, void, id))v7 + 2))(v7, 0, v6);
  }
  else if (v5 && [v5 count])
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"WFRemoteQuarantinePolicyManager.m", 200, @"We should only be getting at most 1 asset, as defined in the request call." object file lineNumber description];
    }
    v9 = [v5 lastObject];
    int v10 = *(void **)(a1 + 32);
    id v16 = 0;
    char v11 = [v10 processAsset:v9 error:&v16];
    id v12 = v16;
    if (v11)
    {
      uint64_t v13 = 1;
      id v14 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = v12;
    }
    ((void (**)(void, uint64_t, id))v8)[2](v8, v13, v14);
  }
  else
  {
    v8[2](v8, 2, 0);
  }
}

void __81__WFRemoteQuarantinePolicyManager_updatePolicyWithXPCActivity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a2)
  {
    case 0:
      id v7 = getWFGeneralLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = v6;
        id v8 = "%s Failed to refresh remote quarantine policy. Error: %{public}@";
        v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 22;
LABEL_11:
        _os_log_impl(&dword_1C7F0A000, v9, v10, v8, (uint8_t *)&v12, v11);
        goto LABEL_12;
      }
      goto LABEL_12;
    case 2:
      id v7 = getWFGeneralLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        uint64_t v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke";
        id v8 = "%s Remote quarantine policy is up-to-date.";
        goto LABEL_10;
      }
LABEL_12:

      break;
    case 1:
      id v7 = getWFGeneralLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        uint64_t v13 = "-[WFRemoteQuarantinePolicyManager updatePolicyWithXPCActivity:completionHandler:]_block_invoke_2";
        id v8 = "%s Successfully refreshed remote quarantine policy.";
LABEL_10:
        v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_INFO;
        uint32_t v11 = 12;
        goto LABEL_11;
      }
      goto LABEL_12;
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v6, v5);
}

- (id)policyStringForBundleIfValid:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = [v3 objectForInfoDictionaryKey:@"CompatibilityVersion"];
  uint64_t v6 = objc_opt_class();
  id v7 = WFEnforceClass(v5, v6);
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 == 2)
  {
    v9 = [v4 URLForResource:@"WFRemoteQuarantinePolicy" withExtension:@"js"];
    if (v9)
    {
      id v15 = 0;
      os_log_type_t v10 = [NSString stringWithContentsOfURL:v9 encoding:4 error:&v15];
      id v11 = v15;
      if ([v10 length])
      {
        id v12 = v10;
      }
      else
      {
        uint64_t v13 = getWFGeneralLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          int v17 = "-[WFRemoteQuarantinePolicyManager policyStringForBundleIfValid:]";
          __int16 v18 = 2114;
          uint64_t v19 = v9;
          __int16 v20 = 2114;
          id v21 = v11;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to parse remote quarantine policy file %{public}@. Error: %{public}@", buf, 0x20u);
        }

        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
LABEL_6:
    id v12 = 0;
  }

  return v12;
}

- (id)latestRemotePolicyAssetBundle
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = WFAssetsDirectory();
  id v13 = 0;
  uint64_t v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:2 error:&v13];
  id v6 = v13;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke;
  v12[3] = &unk_1E654CBB8;
  v12[4] = self;
  id v7 = objc_msgSend(v5, "if_compactMap:", v12);
  if ([v7 count])
  {
    uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_91];
    v9 = [v8 lastObject];
LABEL_3:

    goto LABEL_7;
  }
  if (v6 && (objc_msgSend(v6, "vc_isFileNotFound") & 1) == 0)
  {
    uint64_t v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = WFAssetsDirectory();
      *(_DWORD *)buf = 136315650;
      id v15 = "-[WFRemoteQuarantinePolicyManager latestRemotePolicyAssetBundle]";
      __int16 v16 = 2114;
      int v17 = v11;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Encountered an error while trying to access asset bundles directory (%{public}@). Error: %{public}@", buf, 0x20u);
    }
    v9 = 0;
    goto LABEL_3;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

id __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"bundle"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
    id v7 = [*(id *)(a1 + 32) policyStringForBundleIfValid:v6];
    if (v7) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __64__WFRemoteQuarantinePolicyManager_latestRemotePolicyAssetBundle__block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  id v6 = [a2 objectForInfoDictionaryKey:@"ContentVersion"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = WFEnforceClass(v6, v7);
  uint64_t v9 = [v8 unsignedIntegerValue];

  os_log_type_t v10 = [v4 numberWithUnsignedInteger:v9];
  id v11 = NSNumber;
  id v12 = [v5 objectForInfoDictionaryKey:@"ContentVersion"];

  uint64_t v13 = objc_opt_class();
  __int16 v14 = WFEnforceClass(v12, v13);
  uint64_t v15 = [v14 unsignedIntegerValue];

  __int16 v16 = [v11 numberWithUnsignedInteger:v15];
  uint64_t v17 = [v10 compare:v16];

  return v17;
}

- (id)policyAssetBundle
{
  id v3 = [(WFRemoteQuarantinePolicyManager *)self latestRemotePolicyAssetBundle];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFRemoteQuarantinePolicyManager *)self localPolicyBundle];
  }
  id v6 = v5;

  return v6;
}

- (id)localizedString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFRemoteQuarantinePolicyManager *)self policyAssetBundle];
  id v6 = [v5 localizedStringForKey:v4 value:0 table:0];
  uint64_t v7 = [v6 length];
  uint64_t v8 = v6;
  if (!v7)
  {
    uint64_t v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[WFRemoteQuarantinePolicyManager localizedString:]";
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Warning: Can't find remote quarantine localized string for value '%{public}@'", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v8 = v4;
  }
  id v10 = v8;

  return v10;
}

- (unint64_t)policyVersion
{
  v2 = [(WFRemoteQuarantinePolicyManager *)self policyAssetBundle];
  id v3 = [v2 objectForInfoDictionaryKey:@"ContentVersion"];
  uint64_t v4 = objc_opt_class();
  id v5 = WFEnforceClass(v3, v4);
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (id)policyString
{
  id v3 = [(WFRemoteQuarantinePolicyManager *)self policyAssetBundle];
  uint64_t v4 = [(WFRemoteQuarantinePolicyManager *)self policyStringForBundleIfValid:v3];

  return v4;
}

- (WFRemoteQuarantinePolicyManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)WFRemoteQuarantinePolicyManager;
  id v3 = [(WFRemoteQuarantinePolicyManager *)&v16 init];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F19EC8], "wf_shortcutsContainer");
    container = v3->_container;
    v3->_container = (CKContainer *)v4;

    uint64_t v6 = [(CKContainer *)v3->_container publicCloudDatabase];
    database = v3->_database;
    v3->_database = (CKDatabase *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 URLForResource:@"RemoteQuarantineAsset" withExtension:@"bundle"];

    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v9];
    localPolicyBundle = v3->_localPolicyBundle;
    v3->_localPolicyBundle = (NSBundle *)v10;

    int v12 = [(WFRemoteQuarantinePolicyManager *)v3 policyStringForBundleIfValid:v3->_localPolicyBundle];

    if (!v12)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v3, @"WFRemoteQuarantinePolicyManager.m", 67, @"Local policy asset bundle %@ is not valid", @"com.apple.Shortcuts.RemoteQuarantineAsset" object file lineNumber description];
    }
    uint64_t v13 = v3;
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1064);
  }
  v2 = (void *)sharedManager_policyManager;
  return v2;
}

void __48__WFRemoteQuarantinePolicyManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFRemoteQuarantinePolicyManager);
  v1 = (void *)sharedManager_policyManager;
  sharedManager_policyManager = (uint64_t)v0;
}

@end