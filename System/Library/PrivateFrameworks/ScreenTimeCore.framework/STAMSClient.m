@interface STAMSClient
+ (id)_makeGlobalQueryParamsFor:(id)a3;
+ (id)makeAMSMediaTaskForApps:(id)a3 isGlobal:(BOOL)a4;
+ (void)_handleLoadMediaTaskForResult:(id)a3 error:(id)a4 withCompletionHandler:(id)a5;
+ (void)loadMediaForTask:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation STAMSClient

+ (id)makeAMSMediaTaskForApps:(id)a3 isGlobal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "adamID"));
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v9);
    }

    v13 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"ScreenTime" profileVersion:@"1"];
    id v14 = objc_alloc(MEMORY[0x1E4F4DD40]);
    if (v4)
    {
      v15 = (void *)[v14 initWithType:7 clientIdentifier:@"com.apple.ScreenTimeSettingsUI" clientVersion:@"1" bag:v13];
      v16 = +[STAMSClient _makeGlobalQueryParamsFor:v7];
      [v15 setAdditionalQueryParams:v16];

      v17 = +[STLog appInfo];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "AMSMediaTask created with type: AMSMediaTaskTypeAppDistribution";
LABEL_17:
        _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      v15 = (void *)[v14 initWithType:0 clientIdentifier:@"com.apple.ScreenTimeSettingsUI" clientVersion:@"1" bag:v13];
      v26[0] = @"extend";
      v26[1] = @"additionalPlatforms";
      v27[0] = @"shortName";
      v27[1] = @"iphone,ipad,mac,appletv,watch,web";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      [v15 setAdditionalQueryParams:v19];

      v17 = +[STLog appInfo];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "AMSMediaTask created with type: AMSMediaTaskTypeApp";
        goto LABEL_17;
      }
    }

    [v15 setItemIdentifiers:v6];
    goto LABEL_19;
  }
  v6 = +[STLog appInfo];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "AMSMediaTask requested for an empty array of STAppInfos. Returning nil", buf, 2u);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

+ (void)loadMediaForTask:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 bag];
  uint64_t v8 = [v7 BOOLForKey:@"enable-app-distribution-account-personalization"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E6BC78A0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 valueWithCompletion:v11];
}

void __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    BOOL v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
    [*(id *)(a1 + 32) setAccount:v4];

    id v5 = +[STLog appInfo];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Adding account info to media task", buf, 2u);
    }
  }
  id v6 = [*(id *)(a1 + 32) perform];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke_32;
  v7[3] = &unk_1E6BC7878;
  id v8 = *(id *)(a1 + 40);
  [v6 addFinishBlock:v7];
}

uint64_t __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[STAMSClient _handleLoadMediaTaskForResult:a2 error:a3 withCompletionHandler:*(void *)(a1 + 32)];
}

+ (void)_handleLoadMediaTaskForResult:(id)a3 error:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v58 = a4;
  id v7 = (void (**)(id, id, void))a5;
  if (os_variant_has_internal_content())
  {
    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v9 = [v8 BOOLForKey:@"STAppInfoCacheForcingAMSNilResponse"];
  }
  else
  {
    char v9 = 0;
  }
  if (!v59 || (v9 & 1) != 0)
  {
    v57 = v58;
    v7[2](v7, v58, 0);
    goto LABEL_70;
  }
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = [v59 responseDataItems];
  uint64_t v64 = [obj countByEnumeratingWithState:&v77 objects:v95 count:16];
  if (!v64) {
    goto LABEL_68;
  }
  uint64_t v63 = *(void *)v78;
  v61 = v7;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v78 != v63) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v77 + 1) + 8 * v10);
      id v12 = [v11 objectForKeyedSubscript:@"attributes"];
      if (v12)
      {
        id v13 = [v11 objectForKeyedSubscript:@"attributes"];
        id v14 = [v13 objectForKeyedSubscript:@"platformAttributes"];
        v15 = [v14 objectForKeyedSubscript:@"ios"];

        v16 = [v11 objectForKeyedSubscript:@"attributes"];
        v17 = [v16 objectForKeyedSubscript:@"platformAttributes"];
        v75 = [v17 objectForKeyedSubscript:@"osx"];

        v18 = [v11 objectForKeyedSubscript:@"attributes"];
        v19 = [v18 objectForKeyedSubscript:@"platformAttributes"];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"appletvos"];

        long long v21 = [v11 objectForKeyedSubscript:@"attributes"];
        long long v22 = [v21 objectForKeyedSubscript:@"platformAttributes"];
        long long v23 = [v22 objectForKeyedSubscript:@"xros"];

        long long v24 = v15;
        v66 = (void *)v20;
        if (v15 || (long long v24 = v75) != 0 || (long long v24 = (void *)v20) != 0)
        {
          v25 = v24;
LABEL_16:
          v65 = v23;
          uint64_t v73 = v10;
          v26 = [v25 objectForKeyedSubscript:@"bundleId"];
          v71 = [v25 objectForKeyedSubscript:@"seller"];
          v69 = [v12 objectForKeyedSubscript:@"name"];
          v27 = [v12 objectForKeyedSubscript:@"contentRatingsBySystem"];
          v28 = [v27 objectForKeyedSubscript:@"appsApple"];
          v67 = [v28 objectForKeyedSubscript:@"name"];

          uint64_t v29 = [v25 objectForKeyedSubscript:@"artwork"];
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F4DD20]) initWithDictionary:v29];
          uint64_t v31 = objc_msgSend(v30, "URLWithSize:", 72.0, 72.0);
          v32 = (void *)v31;
          if (v26 && v31)
          {
            v33 = @"mac-software";
            if (!v75) {
              v33 = &stru_1F3487700;
            }
            if (v15) {
              v34 = @"software";
            }
            else {
              v34 = v33;
            }
            v35 = [[STAppMetadata alloc] initWithBundleIdentifier:v26 displayName:v69 artworkURL:v31 vendorName:v71 ratingLabel:v67 software:v34];
            v36 = +[STLog appInfo];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              id v97 = v69;
              _os_log_impl(&dword_1DA519000, v36, OS_LOG_TYPE_INFO, "STAppMetadata parsing success for app name: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            v36 = +[STLog appInfo];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.7(&v81, v82);
            }
            v35 = 0;
          }

          id v7 = v61;
          uint64_t v10 = v73;
          long long v23 = v65;
        }
        else
        {
          v25 = v23;
          if (v25) {
            goto LABEL_16;
          }
          v25 = +[STLog appInfo];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.6(&v83, v84);
          }
          v35 = 0;
        }

        goto LABEL_34;
      }
      v15 = +[STLog appInfo];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.5(&v85, v86);
      }
      v35 = 0;
LABEL_34:

      if (v35) {
        goto LABEL_58;
      }
      id v37 = v11;
      v38 = [v37 objectForKeyedSubscript:@"attributes"];
      v39 = v38;
      if (v38)
      {
        uint64_t v74 = v10;
        v40 = [v38 objectForKeyedSubscript:@"bundleId"];
        v76 = [v39 objectForKeyedSubscript:@"developerName"];
        v41 = [v37 objectForKeyedSubscript:@"attributes"];
        v42 = [v41 objectForKeyedSubscript:@"platformAttributes"];
        v43 = [v42 objectForKeyedSubscript:@"ios"];
        v44 = [v43 objectForKeyedSubscript:@"versionAttributes"];

        v45 = [v44 allKeys];
        v46 = [v45 objectAtIndexedSubscript:0];

        if (v46)
        {
          v47 = [v44 objectForKeyedSubscript:v46];
          v72 = [v47 objectForKeyedSubscript:@"shortName"];
          v48 = [v39 objectForKeyedSubscript:@"contentRatingsBySystem"];
          v49 = [v48 objectForKeyedSubscript:@"appsApple"];
          v50 = [v49 objectForKeyedSubscript:@"name"];

          if (v40)
          {
            uint64_t v51 = [v47 objectForKeyedSubscript:@"artwork"];
            v52 = (void *)[objc_alloc(MEMORY[0x1E4F4DD20]) initWithDictionary:v51];
            v53 = objc_msgSend(v52, "URLWithSize:", 72.0, 72.0);
            v68 = v52;
            v70 = v51;
            if (v53)
            {
              v35 = -[STAppMetadata initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:]([STAppMetadata alloc], "initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:", v40, v72, v53, v76);
              v54 = +[STLog appInfo];
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                id v97 = v72;
                _os_log_impl(&dword_1DA519000, v54, OS_LOG_TYPE_INFO, "STAppMetadata (global) parsing success for app name: %{public}@", buf, 0xCu);
              }
            }
            else
            {
              v54 = +[STLog appInfo];
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.4(&v87, v88);
              }
              v35 = 0;
            }

            id v7 = v61;
          }
          else
          {
            v70 = +[STLog appInfo];
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:](&v89, v90);
            }
            v35 = 0;
          }
        }
        else
        {
          v47 = +[STLog appInfo];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:](&v91, v92);
          }
          v35 = 0;
        }

        uint64_t v10 = v74;
      }
      else
      {
        v40 = +[STLog appInfo];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:](&v93, v94);
        }
        v35 = 0;
      }

      if (v35)
      {
LABEL_58:
        [v62 addObject:v35];
      }
      else
      {
        v35 = +[STLog appInfo];
        if (os_log_type_enabled(&v35->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v97 = v37;
          _os_log_error_impl(&dword_1DA519000, &v35->super, OS_LOG_TYPE_ERROR, "Error parsing response item: %@", buf, 0xCu);
        }
      }

      ++v10;
    }
    while (v64 != v10);
    uint64_t v55 = [obj countByEnumeratingWithState:&v77 objects:v95 count:16];
    uint64_t v64 = v55;
  }
  while (v55);
LABEL_68:

  v56 = (void *)[v62 copy];
  ((void (**)(id, id, void *))v7)[2](v7, 0, v56);

  v57 = v58;
LABEL_70:
}

+ (id)_makeGlobalQueryParamsFor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setObject:@"shortName,allowedDistributorIds" forKey:@"extend"];
  [v4 setObject:@"additionalVersions" forKey:@"with"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 versionIdentifier])
        {
          id v11 = NSString;
          uint64_t v12 = [v10 versionIdentifier];
        }
        else
        {
          if (![v10 betaVersionIdentifier]) {
            continue;
          }
          id v11 = NSString;
          uint64_t v12 = [v10 betaVersionIdentifier];
        }
        id v13 = objc_msgSend(v11, "stringWithFormat:", @"%llu", v12);
        if (v13)
        {
          id v14 = objc_msgSend(NSString, "stringWithFormat:", @"version[apps:%llu]", objc_msgSend(v10, "adamID"));
          [v4 setObject:v13 forKey:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = (void *)[v4 copy];
  return v15;
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata (global) parsing error - responseItem[attributes] is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata (global) parsing error - platformAttributes is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata (global) parsing error - bundleIdentifier is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata (global) parsing error - artworkURL is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata parsing error - responseItem[attributes] is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata parsing error - platformAttributes is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(unsigned char *)a1 error:(unsigned char *)a2 withCompletionHandler:.cold.7(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_6(a1, a2);
  OUTLINED_FUNCTION_1_5(&dword_1DA519000, v2, v3, "STAppMetadata parsing error - bundleIdentifier OR artworkURL are nil", v4);
}

@end