@interface MAAssetQuery(SUCoreBorderMAAssetQuery)
+ (__CFString)_translateBuildVersionToRestoreVersionTuple:()SUCoreBorderMAAssetQuery;
+ (id)_getFirstNSStringEntryFromArray:()SUCoreBorderMAAssetQuery;
+ (uint64_t)_arrayContainsNSNull:()SUCoreBorderMAAssetQuery;
+ (void)_SUCoreBorder_MAQueryResultAtBegin:()SUCoreBorderMAAssetQuery withCompletion:;
+ (void)_SUCoreBorder_MAQueryResultAtEnd:()SUCoreBorderMAAssetQuery withResult:withError:withCompletion:;
- (id)SUCoreBorder_results;
- (id)_SUCoreBorder_results:()SUCoreBorderMAAssetQuery;
- (id)_getQueryParamsForKey:()SUCoreBorderMAAssetQuery;
- (id)_getQueryResultsForEvent:()SUCoreBorderMAAssetQuery;
- (void)SUCoreBorder_queryMetaDataWithError:()SUCoreBorderMAAssetQuery;
@end

@implementation MAAssetQuery(SUCoreBorderMAAssetQuery)

- (void)SUCoreBorder_queryMetaDataWithError:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77E20] sharedSimulator];
  v6 = [v5 begin:@"ma" atFunction:@"queryMetaDataWithError"];

  if (v6)
  {
    objc_msgSend(MEMORY[0x263F55950], "_SUCoreBorder_MAQueryResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__MAAssetQuery_SUCoreBorderMAAssetQuery__SUCoreBorder_queryMetaDataWithError___block_invoke;
    v7[3] = &unk_2640DC3D8;
    id v8 = v4;
    [a1 queryMetaDataWithError:v7];
  }
}

- (id)SUCoreBorder_results
{
  v2 = [MEMORY[0x263F77E20] sharedSimulator];
  v3 = [v2 begin:@"ma" atFunction:@"results"];

  if (v3)
  {
    id v4 = objc_msgSend(a1, "_SUCoreBorder_results:", v3);
  }
  else
  {
    v5 = [MEMORY[0x263F77E20] sharedSimulator];
    v6 = [v5 end:@"ma" atFunction:@"results"];

    if (v6) {
      objc_msgSend(a1, "_SUCoreBorder_results:", v6);
    }
    else {
    id v4 = [a1 results];
    }
  }

  return v4;
}

+ (void)_SUCoreBorder_MAQueryResultAtBegin:()SUCoreBorderMAAssetQuery withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      id v8 = [MEMORY[0x263F77E20] sharedSimulator];
      uint64_t v9 = 3;
      v10 = [v8 generateError:@"_SUCoreBorder_MAQueryResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Query" withCode:3];
    }
    else
    {
      id v8 = [MEMORY[0x263F77DA8] sharedDiag];
      v11 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MAQueryResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0;
      uint64_t v9 = 12;
    }
  }
  v12 = [MEMORY[0x263F77D78] sharedCore];
  v13 = [v12 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__MAAssetQuery_SUCoreBorderMAAssetQuery___SUCoreBorder_MAQueryResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC450;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MAQueryResultAtEnd:()SUCoreBorderMAAssetQuery withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0;
    v13 = 0;
    v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      v12 = [MEMORY[0x263F77E20] sharedSimulator];
      a4 = 3;
      v13 = [v12 generateError:@"_SUCoreBorder_MAQueryResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Query" withCode:3];
      id v14 = v9;
    }
    else
    {
      v12 = [MEMORY[0x263F77DA8] sharedDiag];
      id v14 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MAQueryResultAtEnd" forReason:v14 withResult:8113 withError:0];
      v13 = v9;
    }
  }
  v10[2](v10, a4, v13);
}

- (id)_SUCoreBorder_results:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  uint64_t v5 = [v4 simAction];
  if (v5 != 1)
  {
    if (v5 == 3)
    {
      id v6 = [a1 _getQueryResultsForEvent:v4];
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x263F77DA8] sharedDiag];
    id v8 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v4];
    [v7 trackAnomaly:@"_SUCoreBorder_results" forReason:v8 withResult:8113 withError:0];
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (id)_getQueryResultsForEvent:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  uint64_t v5 = [v4 assetBuildVersions];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 assetProductVersions];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", @"_getQueryResultsForEvent", @"asset BuildVersions/ProductVersions must have the same count (please file a radar; the event should not have been created)",
      8113,
      0);
    id v15 = 0;
    goto LABEL_47;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [a1 _getQueryParamsForKey:@"SUDocumentationID"];
  uint64_t v11 = [a1 _getQueryParamsForKey:@"PrerequisiteBuild"];
  v12 = [a1 _getQueryParamsForKey:@"PrerequisiteOSVersion"];
  v61 = [a1 _getQueryParamsForKey:@"ReleaseType"];
  uint64_t v13 = [v11 count];
  v60 = v10;
  if (v13 == [v12 count])
  {
    v59 = v12;
    uint64_t v68 = [v10 count];
    id v14 = v11;
    if (v68)
    {
      v64 = [MEMORY[0x263F55950] _getFirstNSStringEntryFromArray:v10];
    }
    else
    {
      v64 = 0;
    }
    uint64_t v19 = [a1 assetType];
    int isUpdateBrainAssetType = _isUpdateBrainAssetType(v19);

    uint64_t v11 = v14;
    if ([v14 count] == 1)
    {
      if ([MEMORY[0x263F55950] _arrayContainsNSNull:v14]
        && ([MEMORY[0x263F55950] _arrayContainsNSNull:v12] & 1) != 0)
      {
        v62 = 0;
        v63 = 0;
        HIDWORD(v65) = 0;
LABEL_16:
        LODWORD(v65) = 1;
        goto LABEL_26;
      }
      uint64_t v22 = [MEMORY[0x263F55950] _getFirstNSStringEntryFromArray:v14];
      uint64_t v23 = [MEMORY[0x263F55950] _getFirstNSStringEntryFromArray:v12];
      v62 = (void *)v22;
      v63 = (void *)v23;
      if (v22 && v23)
      {
        uint64_t v65 = 0x100000000;
LABEL_26:
        v58 = v11;
        if (v61 && [v61 count])
        {
          v66 = [v61 objectAtIndexedSubscript:0];
        }
        else
        {
          v66 = 0;
        }
        v26 = [v4 assetBuildVersions];
        uint64_t v27 = [v26 count];

        if (v27)
        {
          unint64_t v28 = 0;
          id v18 = 0;
          v69 = v9;
          do
          {
            if (v65)
            {
              v29 = [a1 assetType];
              v30 = [v4 assetBuildVersions];
              v31 = [v30 objectAtIndexedSubscript:v28];
              v32 = [v4 assetProductVersions];
              v33 = [v32 objectAtIndexedSubscript:v28];
              uint64_t v34 = _getNewSoftwareUpdateMAAssetAttributesDictionary(v29, v31, v33, v66, 0, 0, 0);

              id v9 = v69;
              v35 = (void *)[objc_alloc(MEMORY[0x263F55938]) initWithAttributes:v34];
              [v69 addObject:v35];

              id v18 = (void *)v34;
            }
            if (HIDWORD(v65))
            {
              v36 = [a1 assetType];
              v37 = [v4 assetBuildVersions];
              v38 = [v37 objectAtIndexedSubscript:v28];
              v39 = [v4 assetProductVersions];
              v40 = [v39 objectAtIndexedSubscript:v28];
              uint64_t v41 = _getNewSoftwareUpdateMAAssetAttributesDictionary(v36, v38, v40, v66, v62, v63, 0);

              id v9 = v69;
              v42 = (void *)[objc_alloc(MEMORY[0x263F55938]) initWithAttributes:v41];
              [v69 addObject:v42];

              id v18 = (void *)v41;
            }
            if (v68)
            {
              v43 = [a1 assetType];
              v44 = [v4 assetBuildVersions];
              v45 = [v44 objectAtIndexedSubscript:v28];
              v46 = [v4 assetProductVersions];
              v47 = [v46 objectAtIndexedSubscript:v28];
              uint64_t v48 = _getNewDocumentationMAAssetAttributesDictionary(v43, v45, v47, v64, 0);

              id v9 = v69;
              v49 = (void *)[objc_alloc(MEMORY[0x263F55938]) initWithAttributes:v48];
              [v69 addObject:v49];

              id v18 = (void *)v48;
            }
            if (isUpdateBrainAssetType)
            {
              v50 = [a1 assetType];
              v51 = [v4 assetBuildVersions];
              v52 = [v51 objectAtIndexedSubscript:v28];
              uint64_t v53 = _getNewUpdateBrainMAAssetAttributesDictionary(v50, v52, 0);

              v54 = (void *)[objc_alloc(MEMORY[0x263F55938]) initWithAttributes:v53];
              [v9 addObject:v54];

              id v18 = (void *)v53;
            }
            ++v28;
            v55 = [v4 assetBuildVersions];
            unint64_t v56 = [v55 count];
          }
          while (v28 < v56);
        }
        else
        {
          id v18 = 0;
        }
        id v15 = v9;

        uint64_t v11 = v58;
        goto LABEL_44;
      }
    }
    else
    {
      if ([v14 count] != 2)
      {
        if (v68) {
          char v25 = 1;
        }
        else {
          char v25 = isUpdateBrainAssetType;
        }
        if ((v25 & 1) == 0)
        {
          id v17 = [MEMORY[0x263F77DA8] sharedDiag];
          v63 = (void *)[[NSString alloc] initWithFormat:@"No indication as to which simulated assets should be created"];
          objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", @"_getQueryResultsForEvent");
          id v15 = 0;
          id v18 = 0;
          goto LABEL_45;
        }
        v62 = 0;
        v63 = 0;
        uint64_t v65 = 0;
        goto LABEL_26;
      }
      uint64_t v20 = [MEMORY[0x263F55950] _getFirstNSStringEntryFromArray:v14];
      uint64_t v21 = [MEMORY[0x263F55950] _getFirstNSStringEntryFromArray:v12];
      v62 = (void *)v20;
      v63 = (void *)v21;
      if (v20 && v21)
      {
        HIDWORD(v65) = 1;
        goto LABEL_16;
      }
    }
    v24 = [MEMORY[0x263F77DA8] sharedDiag];
    [v24 trackAnomaly:@"_getQueryResultsForEvent" forReason:@"prerequisite build/product version array contains invalid values" withResult:8113 withError:0];

    id v15 = 0;
    id v18 = 0;
LABEL_44:
    id v17 = v62;
LABEL_45:

    v12 = v59;
    v16 = v64;
    goto LABEL_46;
  }
  v16 = [MEMORY[0x263F77DA8] sharedDiag];
  id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"prerequisite Build/ProductVersion counts do not match (found build:%lu and product:%lu)", objc_msgSend(v11, "count"), objc_msgSend(v12, "count"));
  [v16 trackAnomaly:@"_getQueryResultsForEvent" forReason:v17 withResult:8113 withError:0];
  id v15 = 0;
  id v18 = 0;
LABEL_46:

LABEL_47:

  return v15;
}

- (id)_getQueryParamsForKey:()SUCoreBorderMAAssetQuery
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a1, "queryParams", 0);
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4)
        {
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 safeStringForKey:@"queryKey"];
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            uint64_t v6 = [v9 safeObjectForKey:@"queryValue" ofClass:objc_opt_class()];
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

+ (uint64_t)_arrayContainsNSNull:()SUCoreBorderMAAssetQuery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_getFirstNSStringEntryFromArray:()SUCoreBorderMAAssetQuery
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (__CFString)_translateBuildVersionToRestoreVersionTuple:()SUCoreBorderMAAssetQuery
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v27 = 0;
  uint64_t v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([0-9]+)([A-Z]{1})([0-9]+)([a-z]?)" options:0 error:&v27];
  uint64_t v6 = v27;
  uint64_t v7 = objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, v4);
  long long v8 = [v7 objectAtIndex:0];
  long long v9 = v8;
  long long v10 = &stru_26C1810A0;
  if (!v6 && v8)
  {
    uint64_t v11 = [v8 rangeAtIndex:1];
    uint64_t v13 = objc_msgSend(v3, "substringWithRange:", v11, v12);
    uint64_t v14 = NSString;
    uint64_t v15 = [v9 rangeAtIndex:2];
    id v17 = objc_msgSend(v3, "substringWithRange:", v15, v16);
    uint64_t v18 = objc_msgSend(v14, "stringWithFormat:", @"%i", objc_msgSend(v17, "characterAtIndex:", 0) - 64);

    uint64_t v19 = [v9 rangeAtIndex:3];
    uint64_t v21 = objc_msgSend(v3, "substringWithRange:", v19, v20);
    uint64_t v22 = [v9 rangeAtIndex:4];
    v24 = objc_msgSend(v3, "substringWithRange:", v22, v23);
    if ([v24 isEqualToString:&stru_26C1810A0])
    {
      char v25 = @"0";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%i", objc_msgSend(v24, "characterAtIndex:", 0) - 96);
      char v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    long long v10 = [NSString stringWithFormat:@"%@.%@.%@.0.%@,0", v13, v18, v21, v25];
  }

  return v10;
}

@end