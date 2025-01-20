@interface UAFTrialConversions
+ (id)assetTypeFromNamespaceName:(id)a3;
+ (id)entitledTrialNamespaceNames;
+ (id)generateEntitledTrialNamespaces;
+ (id)namespaceNameFromAssetType:(id)a3;
@end

@implementation UAFTrialConversions

void __50__UAFTrialConversions_entitledTrialNamespaceNames__block_invoke()
{
  uint64_t v0 = +[UAFTrialConversions generateEntitledTrialNamespaces];
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = v0;
}

+ (id)generateEntitledTrialNamespaces
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v2 = [&unk_26EAA1068 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (!v2)
  {
    v5 = 0;
    goto LABEL_28;
  }
  uint64_t v4 = v2;
  v5 = 0;
  uint64_t v6 = *(void *)v30;
  unint64_t v7 = 0x264CEA000uLL;
  *(void *)&long long v3 = 136315650;
  long long v23 = v3;
  do
  {
    uint64_t v8 = 0;
    uint64_t v24 = v4;
    do
    {
      if (*(void *)v30 != v6) {
        objc_enumerationMutation(&unk_26EAA1068);
      }
      uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
      v10 = objc_msgSend(*(id *)(v7 + 2344), "valueForEntitlement:", v9, v23);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v5) {
          v5 = objc_opt_new();
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v39 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = v6;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v11);
              }
              v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v18 = [v17 intValue];
              if (v18)
              {
                v19 = [MEMORY[0x263F80EA8] namespaceNameFromId:v18];
                [v5 addObject:v19];
              }
              else
              {
                [v5 addObject:v17];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v39 count:16];
          }
          while (v13);
          uint64_t v6 = v14;
          unint64_t v7 = 0x264CEA000;
          uint64_t v4 = v24;
        }
      }
      else
      {
        if (!v10) {
          goto LABEL_24;
        }
        v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v20 = objc_opt_class();
          *(_DWORD *)buf = v23;
          v34 = "+[UAFTrialConversions generateEntitledTrialNamespaces]";
          __int16 v35 = 2114;
          uint64_t v36 = v9;
          __int16 v37 = 2112;
          v38 = v20;
          id v21 = v20;
          _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@ is unexpected type: %@", buf, 0x20u);
        }
      }

LABEL_24:
      ++v8;
    }
    while (v8 != v4);
    uint64_t v4 = [&unk_26EAA1068 countByEnumeratingWithState:&v29 objects:v40 count:16];
  }
  while (v4);
LABEL_28:

  return v5;
}

+ (id)entitledTrialNamespaceNames
{
  if (qword_26AF0B9C0 != -1) {
    dispatch_once(&qword_26AF0B9C0, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)_MergedGlobals_3;

  return v2;
}

+ (id)assetTypeFromNamespaceName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v3 = [a3 componentsSeparatedByString:@"_"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    unint64_t v7 = &stru_26EA999B8;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isEqualToString:@"NL"])
        {
          [(__CFString *)v7 stringByAppendingString:v9];
          v10 = v7;
          unint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = [v9 capitalizedString];
          uint64_t v11 = [(__CFString *)v7 stringByAppendingString:v10];

          unint64_t v7 = (__CFString *)v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = &stru_26EA999B8;
  }

  return v7;
}

+ (id)namespaceNameFromAssetType:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= [@"com.apple.MobileAsset.Trial.Siri." length]
    && ([v3 substringFromIndex:objc_msgSend(@"com.apple.MobileAsset.Trial.Siri.", "length")],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (__CFString *)v5;
    unint64_t v7 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    if ([(__CFString *)v6 length])
    {
      uint64_t v8 = &stru_26EA999B8;
      uint64_t v9 = v6;
      while (1)
      {
        uint64_t v10 = [(__CFString *)v9 rangeOfCharacterFromSet:v7];
        if (!v10) {
          break;
        }
        uint64_t v11 = v10;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v13 = [(__CFString *)v9 substringToIndex:v10];
          uint64_t v6 = [(__CFString *)v9 substringFromIndex:v11];

          uint64_t v15 = [(__CFString *)v8 stringByAppendingString:v13];
LABEL_13:
          uint64_t v12 = (__CFString *)v15;
          uint64_t v9 = v13;
          goto LABEL_14;
        }
        uint64_t v12 = [(__CFString *)v8 stringByAppendingFormat:@"%@", v9];
        uint64_t v6 = &stru_26EA999B8;
LABEL_14:

        uint64_t v8 = v12;
        uint64_t v9 = v6;
        if (![(__CFString *)v6 length]) {
          goto LABEL_18;
        }
      }
      long long v13 = [(__CFString *)v9 substringToIndex:1];
      uint64_t v6 = [(__CFString *)v9 substringFromIndex:1];

      if ([(__CFString *)v13 isEqualToString:@"N"]
        && [(__CFString *)v6 hasPrefix:@"L"])
      {

        uint64_t v14 = [(__CFString *)v6 substringFromIndex:1];

        uint64_t v6 = (__CFString *)v14;
        long long v13 = @"NL";
      }
      uint64_t v15 = [(__CFString *)v8 stringByAppendingFormat:@"_%@", v13];
      goto LABEL_13;
    }
    uint64_t v12 = &stru_26EA999B8;
LABEL_18:
    if ([(__CFString *)v12 hasPrefix:@"_"])
    {
      uint64_t v17 = [(__CFString *)v12 substringFromIndex:1];

      uint64_t v12 = (__CFString *)v17;
    }
    long long v16 = [(__CFString *)v12 uppercaseString];
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

@end