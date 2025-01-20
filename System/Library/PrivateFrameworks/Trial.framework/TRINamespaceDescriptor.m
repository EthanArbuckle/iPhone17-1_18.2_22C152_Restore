@interface TRINamespaceDescriptor
+ (BOOL)removeDescriptorWithNamespaceName:(id)a3 fromDirectory:(id)a4;
+ (id)descriptorPathForNamespaceName:(id)a3 fromDirectory:(id)a4;
+ (id)descriptorsForDirectory:(id)a3 filterBlock:(id)a4;
+ (id)loadFromFile:(id)a3;
+ (id)loadWithNamespaceName:(id)a3 fromDirectory:(id)a4;
+ (void)enumerateDescriptorsInDirectory:(id)a3 block:(id)a4;
- (BOOL)_isEqualToNamespaceDescriptor:(id)a3;
- (BOOL)_upgradeNCVsArePositiveIntegers:(id)a3;
- (BOOL)_upgradeNCVsIsValid:(id)a3;
- (BOOL)availableToRootUser;
- (BOOL)enableFetchDuringSetupAssistant;
- (BOOL)expensiveNetworkingAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeFromDirectory:(id)a3;
- (BOOL)saveToDirectory:(id)a3;
- (BOOL)writeToFile:(id)a3;
- (NSSet)upgradeNCVs;
- (NSString)namespaceName;
- (NSString)resourceAttributionIdentifier;
- (NSURL)factorsURL;
- (TRIAppContainer)appContainer;
- (TRINamespaceDescriptor)initWithDictionary:(id)a3;
- (TRINamespaceDescriptor)initWithNamespaceName:(id)a3 downloadNCV:(unsigned int)a4 optionalParams:(id)a5;
- (id)dictionary;
- (id)factorsAbsolutePathAsOwner:(BOOL)a3;
- (int)cloudKitContainerId;
- (int)purgeabilityLevel;
- (unint64_t)hash;
- (unsigned)downloadNCV;
@end

@implementation TRINamespaceDescriptor

- (id)factorsAbsolutePathAsOwner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [(TRINamespaceDescriptor *)self factorsURL];
  id v6 = [v5 triPathAsOwner:v3];

  if (!v6) {
    goto LABEL_9;
  }
  if ([v6 isAbsolutePath]) {
    goto LABEL_9;
  }
  v7 = [(TRINamespaceDescriptor *)self appContainer];

  if (!v7) {
    goto LABEL_9;
  }
  v8 = [(TRINamespaceDescriptor *)self appContainer];
  v9 = v8;
  if (v3) {
    [v8 containerURLAsOwner];
  }
  else {
  v10 = [v8 containerURL];
  }

  v11 = [v10 path];

  if (v11)
  {
    v12 = NSString;
    v13 = [v10 path];
    v20[0] = v13;
    v20[1] = v6;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v15 = [v12 pathWithComponents:v14];

    id v6 = (id)v15;
LABEL_9:
    id v6 = v6;
    v16 = v6;
    goto LABEL_10;
  }
  v18 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = [(TRINamespaceDescriptor *)self factorsURL];
    *(_DWORD *)buf = 138412290;
    v22 = v19;
    _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "factorsAbsolutePathAsOwner: can't resolve containerDir for factorsURL: %@", buf, 0xCu);
  }
  v16 = 0;
LABEL_10:

  return v16;
}

- (NSURL)factorsURL
{
  return self->_factorsURL;
}

- (unsigned)downloadNCV
{
  return self->_downloadNCV;
}

+ (id)loadWithNamespaceName:(id)a3 fromDirectory:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 descriptorPathForNamespaceName:v6 fromDirectory:a4];
  v8 = [a1 loadFromFile:v7];

  if (v8
    && ([v8 namespaceName],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v6 isEqualToString:v9],
        v9,
        (v10 & 1) == 0))
  {
    v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v8 namespaceName];
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "namespace descriptor loaded from file has unexpected namespace name: %@ != %@", (uint8_t *)&v15, 0x16u);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v7 = 0;
    goto LABEL_15;
  }
  BOOL v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  id v12 = 0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      v8 = [v5 domain];
      if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v9 = [v6 code];

        if (v9 == 260)
        {
LABEL_13:
          v7 = 0;
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    char v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "failed to parse dictionary from file: %@ (%@)", buf, 0x16u);
    }

    goto LABEL_13;
  }
  v7 = [[TRINamespaceDescriptor alloc] initWithDictionary:v4];
LABEL_14:

LABEL_15:
  return v7;
}

+ (id)descriptorPathForNamespaceName:(id)a3 fromDirectory:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x19F3AD060]();
  id location = 0;
  v8 = [v5 triSanitizedPathComponentWithMaxLength:128 addHash:1 error:&location];
  if (!v8)
  {
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v5;
      __int16 v41 = 2112;
      id v42 = location;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "could not sanitize namespace %@ -- %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  uint64_t v9 = [NSString stringWithFormat:@"NamespaceDescriptor.%@.plist", v8];
  uint64_t v10 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:v5];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v6 stringByAppendingPathComponent:v9];
    if (([v12 fileExistsAtPath:v13] & 1) != 0
      || (char v36 = 0, ![v12 fileExistsAtPath:v6 isDirectory:&v36]))
    {
LABEL_25:

      goto LABEL_26;
    }
    if (v36)
    {
      id obj = location;
      v14 = [v12 contentsOfDirectoryAtPath:v6 error:&obj];
      objc_storeStrong(&location, obj);
      if (v14)
      {
        v30 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.Trial.NamespaceDescriptor.%d.", v11);
        v29 = [NSString stringWithFormat:@"com.apple.Trial.NamespaceDescriptor.%@.", v5];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v28 = v14;
        uint64_t v15 = [v28 countByEnumeratingWithState:&v31 objects:v38 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          v27 = v13;
          uint64_t v17 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v28);
              }
              uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if (([v19 hasPrefix:v30] & 1) != 0 || objc_msgSend(v19, "hasPrefix:", v29))
              {
                v25 = v19;

                uint64_t v9 = v25;
                goto LABEL_23;
              }
            }
            uint64_t v16 = [v28 countByEnumeratingWithState:&v31 objects:v38 count:16];
            if (v16) {
              continue;
            }
            break;
          }
LABEL_23:
          v13 = v27;
        }

        goto LABEL_25;
      }
      v21 = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412546;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = location;
      v22 = "cannot access files in directory: %@ -- %@";
      uint64_t v23 = v21;
      uint32_t v24 = 22;
    }
    else
    {
      v21 = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

LABEL_19:
        v20 = 0;
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138412290;
      id v40 = v6;
      v22 = "file exists at path but is not a directory: %@";
      uint64_t v23 = v21;
      uint32_t v24 = 12;
    }
    _os_log_error_impl(&dword_19D909000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    goto LABEL_31;
  }
LABEL_26:
  v20 = [v6 stringByAppendingPathComponent:v9];
LABEL_27:

  return v20;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (TRINamespaceDescriptor)initWithDictionary:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"Namespace Compatibility Version"];
  unsigned int v81 = [v6 unsignedIntValue];

  v7 = [v5 objectForKeyedSubscript:@"Namespace Name"];
  if (!v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"Namespace Id"];
    if (!v8)
    {
      uint64_t v9 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "failed to instantiate namespace descriptor: missing namespace", buf, 2u);
      }

      v8 = &unk_1EEFCBED0;
    }
    v7 = objc_msgSend(MEMORY[0x1E4FB05B8], "namespaceNameFromId:", objc_msgSend(v8, "unsignedIntValue"));
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"App Container Id"];
  if (v10)
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"App Container Type"];
    if (!v11)
    {
      v72 = [MEMORY[0x1E4F28B00] currentHandler];
      [v72 handleFailureInMethod:a2 object:self file:@"TRINamespaceDescriptor.m" lineNumber:157 description:@"app container id provided but unspecified container type"];
    }
    id v12 = +[TRIAppContainer containerWithIdentifier:type:](TRIAppContainer, "containerWithIdentifier:type:", v10, [v11 integerValue]);
  }
  else
  {
    id v12 = 0;
  }
  v13 = [v5 objectForKeyedSubscript:@"Factor Path"];
  id v14 = v13;
  v82 = self;
  if (v13)
  {
    if ([v13 hasPrefix:@"/"])
    {
      uint64_t v15 = +[TRIStandardPaths resolveHardCodedPath:v14];

      id v14 = (id)v15;
    }
    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v17 = [v16 fileExistsAtPath:v14];

    if ((v17 & 1) == 0)
    {
      uint64_t v19 = [v14 lastPathComponent];
      id v20 = [NSString alloc];
      v21 = v14;
      v22 = [v14 stringByDeletingLastPathComponent];
      uint64_t v23 = (void *)[v20 initWithFormat:@"%@/Resources", v22];
      uint32_t v24 = [v23 stringByAppendingPathComponent:v19];

      v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      LODWORD(v23) = [v25 fileExistsAtPath:v24];

      if (v23)
      {
        v26 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v94 = v7;
          __int16 v95 = 2112;
          v96 = v21;
          __int16 v97 = 2112;
          v98 = v24;
          _os_log_impl(&dword_19D909000, v26, OS_LOG_TYPE_DEFAULT, "Found invalid factors path for %@: %@. Changing it to be %@", buf, 0x20u);
        }

        id v14 = v24;
      }
      else
      {
        id v14 = v21;
      }
    }
    uint64_t v18 = [MEMORY[0x1E4F1CB10] triParseURLFromString:v14 isDirectory:0];
  }
  else
  {
    uint64_t v18 = 0;
  }
  v27 = [v5 objectForKeyedSubscript:@"ResourceAttributionBundleIdentifier"];
  objc_opt_class();
  v79 = v27;
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = v27;
      v30 = [v29 objectForKeyedSubscript:@"iOS"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (id v31 = v30) == 0)
      {
        [v29 objectForKeyedSubscript:@"default"];
        v33 = id v32 = v14;

        id v34 = v33;
        id v14 = v32;
        id v31 = v34;
      }

      id v28 = v31;
    }
    else
    {
      id v28 = 0;
    }
  }
  v35 = [v5 objectForKeyedSubscript:@"Namespace Upgrade Compatibility Versions"];
  objc_opt_class();
  v80 = v14;
  v78 = v35;
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = v28;
      uint64_t v38 = v18;
      v74 = v10;
      v76 = v7;
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v40 = v35;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v88 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * i), "integerValue"));
            [v39 addObject:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v87 objects:v92 count:16];
        }
        while (v42);
      }

      id v36 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v39];
      uint64_t v10 = v74;
      v7 = v76;
      uint64_t v18 = v38;
      id v28 = v37;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [v35 componentsSeparatedByString:@","];
        if (v46)
        {
          id v73 = v28;
          uint64_t v47 = v18;
          v75 = v10;
          v77 = v7;
          v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          v49 = v46;
          id v50 = v46;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v83 objects:v91 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v84;
            do
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v84 != v53) {
                  objc_enumerationMutation(v50);
                }
                v55 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * j), "integerValue"));
                [v48 addObject:v55];
              }
              uint64_t v52 = [v50 countByEnumeratingWithState:&v83 objects:v91 count:16];
            }
            while (v52);
          }

          id v36 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v48];
          uint64_t v10 = v75;
          v7 = v77;
          uint64_t v18 = v47;
          id v28 = v73;
          v46 = v49;
        }
        else
        {
          id v36 = 0;
        }
      }
      else
      {
        id v36 = 0;
      }
    }
  }
  v56 = objc_opt_new();
  [v56 setFactorsURL:v18];
  [v56 setAppContainer:v12];
  [v56 setUpgradeNCVs:v36];
  v57 = v28;
  [v56 setResourceAttributionIdentifier:v28];
  v58 = [v5 objectForKeyedSubscript:@"CloudKit Container Id"];
  v59 = v58;
  v60 = (void *)v18;
  if (v58) {
    uint64_t v61 = [v58 unsignedIntValue];
  }
  else {
    uint64_t v61 = 0;
  }
  [v56 setCloudKitContainerId:v61];
  v62 = [v5 objectForKeyedSubscript:@"Expensive Networking Allowed"];

  if (v62)
  {
    v63 = [v5 objectForKeyedSubscript:@"Expensive Networking Allowed"];
    objc_msgSend(v56, "setExpensiveNetworkingAllowed:", objc_msgSend(v63, "BOOLValue"));
  }
  v64 = [v5 objectForKeyedSubscript:@"Enable Fetch During Setup Assistant"];

  if (v64)
  {
    v65 = [v5 objectForKeyedSubscript:@"Enable Fetch During Setup Assistant"];
    objc_msgSend(v56, "setEnableFetchDuringSetupAssistant:", objc_msgSend(v65, "BOOLValue"));
  }
  v66 = [v5 objectForKeyedSubscript:@"Purgeability Level"];

  if (v66)
  {
    v67 = [v5 objectForKeyedSubscript:@"Purgeability Level"];
    objc_msgSend(v56, "setPurgeabilityLevel:", objc_msgSend(v67, "unsignedIntValue"));
  }
  v68 = [v5 objectForKeyedSubscript:@"Available To Root User"];

  if (v68)
  {
    v69 = [v5 objectForKeyedSubscript:@"Available To Root User"];
    objc_msgSend(v56, "setAvailableToRootUser:", objc_msgSend(v69, "BOOLValue"));
  }
  v70 = [(TRINamespaceDescriptor *)v82 initWithNamespaceName:v7 downloadNCV:v81 optionalParams:v56];

  return v70;
}

- (TRINamespaceDescriptor)initWithNamespaceName:(id)a3 downloadNCV:(unsigned int)a4 optionalParams:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  v24.receiver = self;
  v24.super_class = (Class)TRINamespaceDescriptor;
  uint64_t v11 = [(TRINamespaceDescriptor *)&v24 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_namespaceName, a3);
    uint64_t v13 = [v10 factorsURL];
    factorsURL = v12->_factorsURL;
    v12->_factorsURL = (NSURL *)v13;

    uint64_t v15 = [v10 appContainer];
    appContainer = v12->_appContainer;
    v12->_appContainer = (TRIAppContainer *)v15;

    v12->_downloadNCV = a4;
    char v17 = [v10 upgradeNCVs];
    if (v17 && ![(TRINamespaceDescriptor *)v12 _upgradeNCVsIsValid:v17])
    {
      id v20 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = @"Namespace Upgrade Compatibility Versions";
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_error_impl(&dword_19D909000, v20, OS_LOG_TYPE_ERROR, "%@ %@ is not valid. Setting it to nil", buf, 0x16u);
      }

      upgradeNCVs = v12->_upgradeNCVs;
      v12->_upgradeNCVs = 0;
    }
    else
    {
      uint64_t v18 = v17;
      upgradeNCVs = v12->_upgradeNCVs;
      v12->_upgradeNCVs = v18;
    }

    v12->_cloudKitContainerId = [v10 cloudKitContainerId];
    uint64_t v21 = [v10 resourceAttributionIdentifier];
    resourceAttributionIdentifier = v12->_resourceAttributionIdentifier;
    v12->_resourceAttributionIdentifier = (NSString *)v21;

    v12->_expensiveNetworkingAllowed = [v10 expensiveNetworkingAllowed];
    v12->_enableFetchDuringSetupAssistant = [v10 enableFetchDuringSetupAssistant];
    v12->_purgeabilityLevel = [v10 purgeabilityLevel];
    v12->_availableToRootUser = [v10 availableToRootUser];
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_upgradeNCVs, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_factorsURL, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

- (id)dictionary
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v27[0] = @"Namespace Name";
  BOOL v3 = [(TRINamespaceDescriptor *)self namespaceName];
  v28[0] = v3;
  v27[1] = @"Namespace Compatibility Version";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TRINamespaceDescriptor downloadNCV](self, "downloadNCV"));
  v28[1] = v4;
  v27[2] = @"CloudKit Container Id";
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[TRINamespaceDescriptor cloudKitContainerId](self, "cloudKitContainerId"));
  v28[2] = v5;
  v27[3] = @"Purgeability Level";
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[TRINamespaceDescriptor purgeabilityLevel](self, "purgeabilityLevel"));
  v28[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v8 = (void *)[v7 mutableCopy];

  id v9 = [(TRINamespaceDescriptor *)self factorsURL];

  if (v9)
  {
    id v10 = [(TRINamespaceDescriptor *)self factorsURL];
    uint64_t v11 = [v10 absoluteString];
    [v8 setObject:v11 forKeyedSubscript:@"Factor Path"];
  }
  id v12 = [(TRINamespaceDescriptor *)self appContainer];

  if (v12)
  {
    uint64_t v13 = [(TRINamespaceDescriptor *)self appContainer];
    id v14 = [v13 identifier];
    [v8 setObject:v14 forKeyedSubscript:@"App Container Id"];

    uint64_t v15 = NSNumber;
    uint64_t v16 = [(TRINamespaceDescriptor *)self appContainer];
    char v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "type"));
    [v8 setObject:v17 forKeyedSubscript:@"App Container Type"];
  }
  uint64_t v18 = [(TRINamespaceDescriptor *)self resourceAttributionIdentifier];

  if (v18)
  {
    uint64_t v19 = [(TRINamespaceDescriptor *)self resourceAttributionIdentifier];
    [v8 setObject:v19 forKeyedSubscript:@"ResourceAttributionBundleIdentifier"];
  }
  id v20 = [(TRINamespaceDescriptor *)self upgradeNCVs];

  if (v20)
  {
    uint64_t v21 = [(TRINamespaceDescriptor *)self upgradeNCVs];
    v22 = [v21 allObjects];
    [v8 setObject:v22 forKeyedSubscript:@"Namespace Upgrade Compatibility Versions"];
  }
  if ([(TRINamespaceDescriptor *)self expensiveNetworkingAllowed])
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[TRINamespaceDescriptor expensiveNetworkingAllowed](self, "expensiveNetworkingAllowed"));
    [v8 setObject:v23 forKeyedSubscript:@"Expensive Networking Allowed"];
  }
  if ([(TRINamespaceDescriptor *)self enableFetchDuringSetupAssistant])
  {
    objc_super v24 = objc_msgSend(NSNumber, "numberWithBool:", -[TRINamespaceDescriptor enableFetchDuringSetupAssistant](self, "enableFetchDuringSetupAssistant"));
    [v8 setObject:v24 forKeyedSubscript:@"Enable Fetch During Setup Assistant"];
  }
  if ([(TRINamespaceDescriptor *)self availableToRootUser])
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[TRINamespaceDescriptor availableToRootUser](self, "availableToRootUser"));
    [v8 setObject:v25 forKeyedSubscript:@"Available To Root User"];
  }
  return v8;
}

- (BOOL)writeToFile:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringByDeletingLastPathComponent];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  char v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v8 = v19;

  if (v7)
  {
    id v9 = (void *)MEMORY[0x1E4F28F98];
    id v10 = [(TRINamespaceDescriptor *)self dictionary];
    id v18 = 0;
    uint64_t v11 = [v9 dataWithPropertyList:v10 format:100 options:0 error:&v18];
    id v12 = v18;

    if (v11)
    {
      id v17 = v12;
      char v13 = [v11 writeToFile:v4 options:268435457 error:&v17];
      id v8 = v17;

      if (v13)
      {
        BOOL v14 = 1;
        goto LABEL_14;
      }
      uint64_t v15 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v4;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "failed to write namespace descriptor to file: %@ -- %@", buf, 0x16u);
      }
      id v12 = v8;
    }
    else
    {
      uint64_t v15 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v12;
        _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "failed to serialize namespace descriptor -- %@", buf, 0xCu);
      }
    }

    BOOL v14 = 0;
    id v8 = v12;
    goto LABEL_14;
  }
  uint64_t v11 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "failed to create directory for namespace descriptor: %@ -- %@", buf, 0x16u);
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)saveToDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(TRINamespaceDescriptor *)self namespaceName];
  id v6 = +[TRINamespaceDescriptor descriptorPathForNamespaceName:v5 fromDirectory:v4];

  if (v6)
  {
    BOOL v7 = [(TRINamespaceDescriptor *)self writeToFile:v6];
  }
  else
  {
    id v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "cannot save namespace descriptor: path is nil", v10, 2u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)removeFromDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(TRINamespaceDescriptor *)self namespaceName];
  BOOL v6 = +[TRINamespaceDescriptor removeDescriptorWithNamespaceName:v5 fromDirectory:v4];

  return v6;
}

- (BOOL)_upgradeNCVsIsValid:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TRINamespaceDescriptor *)self _upgradeNCVsArePositiveIntegers:v4];
  if (!v5)
  {
    BOOL v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = @"Namespace Upgrade Compatibility Versions";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "%@ %@ must consist of positive integers", (uint8_t *)&v8, 0x16u);
    }
  }
  return v5;
}

- (BOOL)_upgradeNCVsArePositiveIntegers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((int)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "intValue", (void)v10) < 1)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (BOOL)removeDescriptorWithNamespaceName:(id)a3 fromDirectory:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v5 defaultManager];
  id v9 = +[TRINamespaceDescriptor descriptorPathForNamespaceName:v7 fromDirectory:v6];

  if (v9)
  {
    char v16 = 0;
    if ([v8 fileExistsAtPath:v9 isDirectory:&v16])
    {
      if (v16)
      {
        long long v10 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v9;
          _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "expected file not directory at path %@", buf, 0xCu);
        }
      }
      id v15 = 0;
      char v11 = [v8 removeItemAtPath:v9 error:&v15];
      id v12 = v15;
      if (v12)
      {
        long long v13 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v9;
          __int16 v19 = 2112;
          id v20 = v12;
          _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "failed to delete file %@ -- %@", buf, 0x16u);
        }
      }
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)descriptorsForDirectory:(id)a3 filterBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__14;
  id v18 = __Block_byref_object_dispose__14;
  id v19 = 0;
  id v7 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__TRINamespaceDescriptor_descriptorsForDirectory_filterBlock___block_invoke;
  v11[3] = &unk_1E596BAB0;
  id v8 = v6;
  id v12 = v8;
  long long v13 = &v14;
  [v7 enumerateDescriptorsInDirectory:v5 block:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __62__TRINamespaceDescriptor_descriptorsForDirectory_filterBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(void))(v4 + 16))(), id v6 = v14, v5))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    if (v8)
    {
      id v9 = v8;
      long long v10 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v9;
    }
    else
    {
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v10 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];
    id v6 = v14;
  }
  return MEMORY[0x1F41817F8](v5, v6);
}

+ (void)enumerateDescriptorsInDirectory:(id)a3 block:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, uint8_t *))a4;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  id v8 = [v7 contentsOfDirectoryAtPath:v5 error:&v24];
  id v9 = v24;
  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v18 = v9;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x19F3AD060]();
          uint64_t v16 = [v5 stringByAppendingPathComponent:v14];
          id v17 = +[TRINamespaceDescriptor loadFromFile:v16];
          if (v17)
          {
            buf[0] = 0;
            v6[2](v6, v17, buf);
            if (buf[0])
            {

              goto LABEL_15;
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_15:
      id v9 = v18;
    }
  }
  else
  {
    id obj = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_error_impl(&dword_19D909000, obj, OS_LOG_TYPE_ERROR, "failed to read contents of directory %@: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_isEqualToNamespaceDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(TRINamespaceDescriptor *)self namespaceName];
  id v6 = [v4 namespaceName];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(TRINamespaceDescriptor *)self factorsURL];
    id v8 = [v4 factorsURL];
    if (v7 != v8)
    {
      uint64_t v9 = [v4 factorsURL];
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_41;
      }
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [(TRINamespaceDescriptor *)self factorsURL];
      uint64_t v12 = [v4 factorsURL];
      if (![v11 triIsEqual:v12])
      {
        LOBYTE(v13) = 0;
LABEL_40:

        goto LABEL_41;
      }
      id v40 = v10;
      uint64_t v41 = v12;
      uint64_t v42 = v11;
    }
    uint64_t v14 = [(TRINamespaceDescriptor *)self appContainer];
    id v15 = [v4 appContainer];
    if (v14 == v15)
    {
      uint64_t v43 = v14;
    }
    else
    {
      uint64_t v16 = [v4 appContainer];
      if (!v16)
      {
        LOBYTE(v13) = 0;
        goto LABEL_22;
      }
      id v17 = (void *)v16;
      uint64_t v43 = v14;
      id v18 = [(TRINamespaceDescriptor *)self appContainer];
      id v19 = [v4 appContainer];
      if (([v18 isEqualToContainer:v19] & 1) == 0)
      {

        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      id v37 = v19;
      uint64_t v38 = v18;
      v39 = v17;
    }
    unsigned int v20 = [(TRINamespaceDescriptor *)self downloadNCV];
    if (v20 != [v4 downloadNCV]) {
      goto LABEL_35;
    }
    long long v21 = [(TRINamespaceDescriptor *)self upgradeNCVs];
    long long v22 = [v4 upgradeNCVs];
    if (v21 == v22)
    {
      v26 = v21;
    }
    else
    {
      uint64_t v23 = [v4 upgradeNCVs];
      if (!v23)
      {
LABEL_34:

LABEL_35:
        char v32 = 0;
        LOBYTE(v13) = 0;
LABEL_36:
        if (v43 != v15)
        {

          LOBYTE(v13) = v32;
        }

LABEL_39:
        uint64_t v12 = v41;
        uint64_t v11 = v42;
        uint64_t v10 = v40;
        if (v7 != v8) {
          goto LABEL_40;
        }
LABEL_41:

        goto LABEL_42;
      }
      id v36 = (void *)v23;
      id v24 = [(TRINamespaceDescriptor *)self upgradeNCVs];
      id v34 = [v4 upgradeNCVs];
      int v25 = objc_msgSend(v24, "isEqualToSet:");
      v35 = v24;
      v26 = v21;
      if (!v25)
      {
        LOBYTE(v13) = 0;
LABEL_18:

        uint64_t v14 = v43;
        if (v43 == v15)
        {

          goto LABEL_23;
        }

LABEL_22:
LABEL_23:

        goto LABEL_39;
      }
    }
    int v27 = [(TRINamespaceDescriptor *)self cloudKitContainerId];
    if (v27 == [v4 cloudKitContainerId])
    {
      int v28 = [(TRINamespaceDescriptor *)self expensiveNetworkingAllowed];
      if (v28 == [v4 expensiveNetworkingAllowed])
      {
        int v29 = [(TRINamespaceDescriptor *)self enableFetchDuringSetupAssistant];
        if (v29 == [v4 enableFetchDuringSetupAssistant])
        {
          int v30 = [(TRINamespaceDescriptor *)self purgeabilityLevel];
          if (v30 == [v4 purgeabilityLevel])
          {
            BOOL v31 = [(TRINamespaceDescriptor *)self availableToRootUser];
            int v13 = v31 ^ [v4 availableToRootUser] ^ 1;
            char v32 = v13;
            if (v26 != v22) {
              goto LABEL_18;
            }
            goto LABEL_44;
          }
        }
      }
    }
    long long v21 = v26;
    if (v26 == v22)
    {
      char v32 = 0;
      LOBYTE(v13) = 0;
LABEL_44:

      goto LABEL_36;
    }

    goto LABEL_34;
  }
  LOBYTE(v13) = 0;
LABEL_42:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRINamespaceDescriptor *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRINamespaceDescriptor *)self _isEqualToNamespaceDescriptor:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(TRINamespaceDescriptor *)self namespaceName];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(TRINamespaceDescriptor *)self factorsURL];
  if (v5)
  {
    id v6 = [(TRINamespaceDescriptor *)self factorsURL];
    uint64_t v7 = [v6 hash];
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v8 = [(TRINamespaceDescriptor *)self appContainer];
  if (v8)
  {
    uint64_t v9 = [(TRINamespaceDescriptor *)self appContainer];
    uint64_t v10 = [v9 hash];
  }
  else
  {
    uint64_t v10 = 0;
  }

  unsigned int v11 = [(TRINamespaceDescriptor *)self downloadNCV];
  uint64_t v12 = [(TRINamespaceDescriptor *)self upgradeNCVs];
  if (v12)
  {
    int v13 = [(TRINamespaceDescriptor *)self upgradeNCVs];
    uint64_t v14 = [v13 hash];
  }
  else
  {
    uint64_t v14 = 0;
  }

  uint64_t v15 = 37
      * (37 * (v14 + 37 * (37 * (v10 + 37 * (v7 + 37 * v4)) + v11))
       + [(TRINamespaceDescriptor *)self cloudKitContainerId]);
  uint64_t v16 = 37 * (v15 + [(TRINamespaceDescriptor *)self expensiveNetworkingAllowed]);
  uint64_t v17 = 37 * (v16 + [(TRINamespaceDescriptor *)self enableFetchDuringSetupAssistant]);
  uint64_t v18 = 37 * (v17 + [(TRINamespaceDescriptor *)self purgeabilityLevel]);
  return v18 + [(TRINamespaceDescriptor *)self availableToRootUser] + 0x111561CB63F539;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (NSSet)upgradeNCVs
{
  return self->_upgradeNCVs;
}

- (int)cloudKitContainerId
{
  return self->_cloudKitContainerId;
}

- (NSString)resourceAttributionIdentifier
{
  return self->_resourceAttributionIdentifier;
}

- (BOOL)expensiveNetworkingAllowed
{
  return self->_expensiveNetworkingAllowed;
}

- (BOOL)enableFetchDuringSetupAssistant
{
  return self->_enableFetchDuringSetupAssistant;
}

- (int)purgeabilityLevel
{
  return self->_purgeabilityLevel;
}

- (BOOL)availableToRootUser
{
  return self->_availableToRootUser;
}

@end