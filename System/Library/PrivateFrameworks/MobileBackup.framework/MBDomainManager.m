@interface MBDomainManager
+ (id)_readDomainsFromPlist:(id)a3 accountType:(int64_t)a4 volumeMountPoint:(id)a5 error:(id *)a6;
- (BOOL)containsDomainName:(id)a3;
- (BOOL)isSystemDomainName:(id)a3;
- (MBDomainManager)initWithPersona:(id)a3;
- (MBDomainManager)initWithSystemDomains:(id)a3;
- (MBDomainManagerDelegate)delegate;
- (MBSystemDomainsVersions)systemDomainsVersions;
- (NSDictionary)systemDomainsByName;
- (NSMutableDictionary)domainsByName;
- (id)_initWithAccountType:(int64_t)a3 volumeMountPoint:(id)a4 plistPath:(id)a5 error:(id *)a6;
- (id)_initWithSystemDomains:(id)a3 versions:(id)a4;
- (id)allDomains;
- (id)domainForName:(id)a3;
- (id)domainForPath:(id)a3 relativePath:(id *)a4;
- (id)initForTestingWithDomains:(id)a3;
- (id)initForTestingWithPersona:(id)a3 systemDomainsPlistAtPath:(id)a4;
- (id)redirectDomain:(id)a3 forRelativePath:(id)a4;
- (void)addDomain:(id)a3;
- (void)addDomain:(id)a3 forName:(id)a4;
- (void)addDomainsToBackUpToiCloudWithAppManager:(id)a3 manager:(id)a4 account:(id)a5;
- (void)removeDomains:(id)a3;
- (void)removeDomainsNotMatchingRegex:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomainsByName:(id)a3;
- (void)setSystemDomainsByName:(id)a3;
- (void)setSystemDomainsVersions:(id)a3;
@end

@implementation MBDomainManager

- (id)_initWithSystemDomains:(id)a3 versions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MBDomainManager;
  v8 = [(MBDomainManager *)&v27 init];
  if (v8)
  {
    id v22 = v7;
    v9 = (NSMutableDictionary *)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 name];
          [(NSMutableDictionary *)v9 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [(NSMutableDictionary *)v9 copy];
    systemDomainsByName = v8->_systemDomainsByName;
    v8->_systemDomainsByName = (NSDictionary *)v17;

    domainsByName = v8->_domainsByName;
    v8->_domainsByName = v9;
    v20 = v9;

    objc_storeStrong((id *)&v8->_systemDomainsVersions, a4);
    id v7 = v22;
  }

  return v8;
}

- (MBDomainManager)initWithSystemDomains:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(MBDomainManager *)self _initWithSystemDomains:v4 versions:v5];

  return v6;
}

- (id)initForTestingWithDomains:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(MBDomainManager *)self _initWithSystemDomains:MEMORY[0x1E4F1CBF0] versions:v5];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = (void *)v6[3];
          v14 = objc_msgSend(v12, "name", (void)v16);
          [v13 setObject:v12 forKeyedSubscript:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

+ (id)_readDomainsFromPlist:(id)a3 accountType:(int64_t)a4 volumeMountPoint:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 0:
      +[MBDomainManager _readDomainsFromPlist:accountType:volumeMountPoint:error:]();
    case 1:
    case 3:
      uint64_t v11 = @"SystemDomains";
      break;
    case 2:
      uint64_t v11 = @"DataSeparatedDomains";
      break;
    default:
      uint64_t v11 = 0;
      break;
  }
  uint64_t v12 = [v9 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v30 = v12;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v20 = [v14 objectForKeyedSubscript:v19];
          uint64_t v21 = +[MBDomain nonContainerizedDomainWithName:v19 plist:v20 accountType:a4 volumeMountPoint:v10];
          if (v21) {
            [v13 addObject:v21];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    uint64_t v12 = v30;
  }
  else
  {
    id v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v11;
      __int16 v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_ERROR, "Domain plist value for key %@ is not a dictionary: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Domain plist value for key %@ is not a dictionary: %{public}@", v23, v24, v25, v26, v27, v28, (uint64_t)v11);
    }

    if (a6)
    {
      +[MBError errorWithCode:1, @"%@ value is not a dictionary", v11 format];
      uint64_t v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }

  return v13;
}

- (id)_initWithAccountType:(int64_t)a3 volumeMountPoint:(id)a4 plistPath:(id)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (!a6) {
    -[MBDomainManager _initWithAccountType:volumeMountPoint:plistPath:error:]();
  }
  uint64_t v12 = v11;
  uint64_t v13 = (void *)MEMORY[0x1E01C2AA0]();
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v58 = v12;
    __int16 v59 = 2048;
    int64_t v60 = a3;
    _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_DEFAULT, "Loading system domains from %{public}@ %ld", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"Loading system domains from %{public}@ %ld", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
  }

  uint64_t v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
  id v56 = 0;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v21 error:&v56];
  uint64_t v23 = v56;
  if (v22)
  {
    +[MBDomain doubleFromStringValueForKey:@"MinSupportedVersion" plist:v22];
    double v25 = v24;
    +[MBDomain doubleFromStringValueForKey:@"Version" plist:v22];
    double v27 = v26;
    +[MBDomain doubleFromStringValueForKey:@"MaxSupportedVersion" plist:v22];
    double v29 = v28;
    v55 = v23;
    v30 = [(id)objc_opt_class() _readDomainsFromPlist:v22 accountType:a3 volumeMountPoint:v10 error:&v55];
    long long v31 = v23;
    uint64_t v23 = v55;
  }
  else
  {
    long long v31 = MBGetDefaultLog();
    double v29 = -1.0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v58 = v12;
      __int16 v59 = 2114;
      int64_t v60 = (int64_t)v23;
      _os_log_impl(&dword_1DD9AE000, v31, OS_LOG_TYPE_ERROR, "Failed to load the system domains plist at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to load the system domains plist at %{public}@: %{public}@", v32, v33, v34, v35, v36, v37, (uint64_t)v12);
    }
    v30 = 0;
    double v27 = -1.0;
    double v25 = -1.0;
  }

  __int16 v38 = MBGetDefaultLog();
  v39 = v38;
  if (!v30 || v23)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v58 = v12;
      __int16 v59 = 2114;
      int64_t v60 = (int64_t)v23;
      _os_log_impl(&dword_1DD9AE000, v39, OS_LOG_TYPE_ERROR, "Failed to load the system domains at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to load the system domains at %{public}@: %{public}@", v48, v49, v50, v51, v52, v53, (uint64_t)v12);
    }

    v47 = 0;
    *a6 = v23;
  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v58 = v12;
      __int16 v59 = 2048;
      int64_t v60 = *(void *)&v27;
      __int16 v61 = 2048;
      double v62 = v25;
      __int16 v63 = 2048;
      double v64 = v29;
      __int16 v65 = 2114;
      v66 = v30;
      _os_log_impl(&dword_1DD9AE000, v39, OS_LOG_TYPE_DEFAULT, "Loaded system domains from %{public}@ (%.1f,%.1f,%.1f): %{public}@", buf, 0x34u);
      _MBLog(@"DEFAULT", (uint64_t)"Loaded system domains from %{public}@ (%.1f,%.1f,%.1f): %{public}@", v40, v41, v42, v43, v44, v45, (uint64_t)v12);
    }

    v46 = [[MBSystemDomainsVersions alloc] initWithVersion:v27 minSupportedVersion:v25 maxSupportedVersion:v29];
    self = (MBDomainManager *)[(MBDomainManager *)self _initWithSystemDomains:v30 versions:v46];

    v47 = self;
  }

  return v47;
}

- (MBDomainManager)initWithPersona:(id)a3
{
  id v4 = a3;
  v5 = _systemDomainsPlistPath();
  uint64_t v6 = [v4 accountType];
  id v7 = [v4 volumeMountPoint];
  id v11 = 0;
  uint64_t v8 = [(MBDomainManager *)self _initWithAccountType:v6 volumeMountPoint:v7 plistPath:v5 error:&v11];
  id v9 = v11;

  if (!v8)
  {
    if (+[MBError isTooManyOpenFilesError:v9]) {
      MBDumpLsofOutputToLogDir();
    }
    objc_exception_throw([[MBException alloc] initWithCode:11, @"Failed to load system domains from %@: %@", v5, v9 format]);
  }

  return v8;
}

- (id)initForTestingWithPersona:(id)a3 systemDomainsPlistAtPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 accountType];
  id v9 = [v6 volumeMountPoint];
  id v13 = 0;
  id v10 = [(MBDomainManager *)self _initWithAccountType:v8 volumeMountPoint:v9 plistPath:v7 error:&v13];
  id v11 = v13;

  if (!v10) {
    objc_exception_throw([[MBException alloc] initWithCode:11, @"Failed to load system domains from %@: %@", v7, v11 format]);
  }

  return v10;
}

- (BOOL)isSystemDomainName:(id)a3
{
  id v4 = a3;
  v5 = [(MBDomainManager *)self systemDomainsByName];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (id)allDomains
{
  v2 = [(NSMutableDictionary *)self->_domainsByName allValues];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (BOOL)containsDomainName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_domainsByName objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)domainForName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"MBDomainManager.m" lineNumber:223 description:@"Null name"];
  }
  id v6 = [(NSMutableDictionary *)self->_domainsByName objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = +[MBDomain containerIDWithName:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v11 = [WeakRetained domainForName:v5 containerID:v8 domainManager:self];
    }
    else
    {
      if (!v8) {
        objc_exception_throw([[MBException alloc] initWithCode:11, @"Unknown domain: %@", v5 format]);
      }
      uint64_t v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v8;
        _os_log_impl(&dword_1DD9AE000, v12, OS_LOG_TYPE_INFO, "Creating domain for uninstalled container %@", buf, 0xCu);
        _MBLog(@"INFO", (uint64_t)"Creating domain for uninstalled container %@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
      }

      uint64_t v11 = +[MBDomain uninstalledDomainWithName:v5];
    }
    uint64_t v19 = (void *)v11;
    [(NSMutableDictionary *)self->_domainsByName setObject:v11 forKeyedSubscript:v5];
    id v7 = v19;
  }
  return v7;
}

- (id)domainForPath:(id)a3 relativePath:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = [(NSMutableDictionary *)self->_domainsByName objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v42;
    v39 = v7;
    uint64_t v40 = (uint64_t)v6;
    uint64_t v37 = *(void *)v42;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v38 = v9;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        uint64_t v13 = [v12 rootPath];
        uint64_t v14 = objc_msgSend(v13, "mb_stringByAppendingSlash");
        int v15 = [v6 hasPrefix:v14];

        if (v15)
        {
          uint64_t v16 = [v12 rootPath];
          uint64_t v17 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v16, "length") + 1);

          uint64_t v18 = [v17 pathComponents];
          if ([v18 count])
          {
            uint64_t v19 = 1;
            while (1)
            {
              uint64_t v20 = NSString;
              uint64_t v21 = objc_msgSend(v18, "subarrayWithRange:", 0, v19);
              id v22 = [v20 pathWithComponents:v21];

              uint64_t v23 = [v12 relativePathsToRestore];
              if ([v23 containsObject:v22]) {
                break;
              }
              uint64_t v24 = [v12 relativePathsToRestoreOnlyFromService];
              int v25 = [v24 containsObject:v22];

              if (v25) {
                goto LABEL_18;
              }

              if (++v19 > (unint64_t)[v18 count]) {
                goto LABEL_12;
              }
            }

LABEL_18:
            double v27 = MBGetDefaultLog();
            id v6 = (id)v40;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              double v28 = [v12 name];
              *(_DWORD *)buf = 138412802;
              uint64_t v46 = v40;
              __int16 v47 = 2112;
              uint64_t v48 = v28;
              __int16 v49 = 2112;
              uint64_t v50 = v17;
              _os_log_impl(&dword_1DD9AE000, v27, OS_LOG_TYPE_DEBUG, "Domain for path \"%@\": domain=\"%@\", relativePath=\"%@\"", buf, 0x20u);

              uint64_t v36 = [v12 name];
              _MBLog(@"DEBUG", (uint64_t)"Domain for path \"%@\": domain=\"%@\", relativePath=\"%@\"", v29, v30, v31, v32, v33, v34, v40);
            }
            if (a4) {
              *a4 = v17;
            }
            id v26 = v12;

            id v7 = v39;
            goto LABEL_23;
          }
LABEL_12:

          id v7 = v39;
          id v6 = (id)v40;
          uint64_t v10 = v37;
          uint64_t v9 = v38;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
      id v26 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v26 = 0;
  }
LABEL_23:

  return v26;
}

- (id)redirectDomain:(id)a3 forRelativePath:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = [v7 relativePathDomainRedirects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ([v8 hasPrefix:v14])
        {
          uint64_t v16 = [v7 relativePathDomainRedirects];
          uint64_t v17 = [v16 objectForKeyedSubscript:v14];

          uint64_t v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = [v7 name];
            *(_DWORD *)buf = 138412802;
            uint64_t v34 = v19;
            __int16 v35 = 2112;
            uint64_t v36 = v17;
            __int16 v37 = 2112;
            id v38 = v8;
            _os_log_impl(&dword_1DD9AE000, v18, OS_LOG_TYPE_INFO, "Redirecting from %@ to %@: %@", buf, 0x20u);

            uint64_t v20 = [v7 name];
            _MBLog(@"INFO", (uint64_t)"Redirecting from %@ to %@: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
          }
          id v15 = [(MBDomainManager *)self domainForName:v17];
          if (!v15)
          {
            double v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:a2, self, @"MBDomainManager.m", 270, @"Domain not found for redirect: %@", v17 object file lineNumber description];
          }
          goto LABEL_15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_15:

  return v15;
}

- (void)addDomain:(id)a3
{
  id v8 = a3;
  id v5 = [v8 name];
  id v6 = [(NSMutableDictionary *)self->_domainsByName objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MBDomainManager.m", 279, @"Domain already exists: %@", v5 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_domainsByName setObject:v8 forKeyedSubscript:v5];
}

- (void)addDomain:(id)a3 forName:(id)a4
{
}

- (void)removeDomains:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableDictionary *)self->_domainsByName setObject:0 forKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeDomainsNotMatchingRegex:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v4;
      _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_DEFAULT, "Removing domains not matching regex (%@)", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"Removing domains not matching regex (%@)", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    }

    id v37 = 0;
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v4 options:0 error:&v37];
    id v13 = v37;
    if (v13)
    {
      uint64_t v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v13;
        _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_ERROR, "Failed to compile regex: %@", buf, 0xCu);
        _MBLog(@"ERROR", (uint64_t)"Failed to compile regex: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v14 = [(NSMutableDictionary *)self->_domainsByName copy];
      uint64_t v21 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v14);
            }
            uint64_t v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (!objc_msgSend(v12, "numberOfMatchesInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length")))
            {
              uint64_t v26 = MBGetDefaultLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v39 = v25;
                __int16 v40 = 2112;
                id v41 = v4;
                _os_log_impl(&dword_1DD9AE000, v26, OS_LOG_TYPE_DEFAULT, "Removing domain %@ not matching regex (%@)", buf, 0x16u);
                _MBLog(@"DEFAULT", (uint64_t)"Removing domain %@ not matching regex (%@)", v27, v28, v29, v30, v31, v32, (uint64_t)v25);
              }

              [(NSMutableDictionary *)self->_domainsByName setObject:0 forKeyedSubscript:v25];
            }
          }
          uint64_t v22 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v22);
        id v13 = 0;
      }
    }
  }
}

- (void)addDomainsToBackUpToiCloudWithAppManager:(id)a3 manager:(id)a4 account:(id)a5
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v81 = a4;
  id v80 = a5;
  v83 = [v80 persona];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v82 = v8;
  obuint64_t j = [v8 allApps];
  uint64_t v87 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
  if (v87)
  {
    id v85 = *(id *)v109;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(id *)v109 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        v89 = v10;
        uint64_t v11 = [v10 containers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v104 objects:v119 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v105;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v105 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v104 + 1) + 8 * j);
              uint64_t v17 = (void *)MEMORY[0x1E01C2AA0]();
              uint64_t v18 = [v16 domain];
              uint64_t v19 = [v18 name];
              BOOL v20 = [(MBDomainManager *)self containsDomainName:v19];

              if (!v20) {
                [(MBDomainManager *)self addDomain:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v104 objects:v119 count:16];
          }
          while (v13);
        }

        if (([v89 isSystemApp] & 1) == 0)
        {
          uint64_t v21 = (void *)MEMORY[0x1E01C2AA0]();
          uint64_t v22 = [v83 appPlaceholderArchiveDirectory];
          uint64_t v23 = [v83 personaIdentifier];
          id v103 = 0;
          uint64_t v24 = [v89 archivePlaceholderDomainWithPersonaIdentifier:v23 intoDirectory:v22 error:&v103];
          id v25 = v103;
          if (v24)
          {
            uint64_t v26 = [v24 name];
            BOOL v27 = [(MBDomainManager *)self containsDomainName:v26];

            if (!v27) {
              [(MBDomainManager *)self addDomain:v24];
            }
          }

          if (v25)
          {
            uint64_t v28 = MBGetDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = [v89 identifier];
              *(_DWORD *)buf = 138412546;
              v116 = v29;
              __int16 v117 = 2112;
              id v118 = v25;
              _os_log_impl(&dword_1DD9AE000, v28, OS_LOG_TYPE_ERROR, "Placeholder: Failed to archive placeholder for: %@ %@", buf, 0x16u);

              uint64_t v30 = [v89 identifier];
              _MBLog(@"ERROR", (uint64_t)"Placeholder: Failed to archive placeholder for: %@ %@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
            }
          }
        }
      }
      uint64_t v87 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
    }
    while (v87);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v86 = [v82 allPlugins];
  uint64_t v90 = [v86 countByEnumeratingWithState:&v99 objects:v114 count:16];
  if (v90)
  {
    uint64_t v88 = *(void *)v100;
    do
    {
      for (uint64_t k = 0; k != v90; ++k)
      {
        if (*(void *)v100 != v88) {
          objc_enumerationMutation(v86);
        }
        id v38 = *(void **)(*((void *)&v99 + 1) + 8 * k);
        id v39 = (void *)MEMORY[0x1E01C2AA0]();
        __int16 v40 = [v38 domain];
        id v41 = [v40 name];
        BOOL v42 = [(MBDomainManager *)self containsDomainName:v41];

        if (!v42) {
          [(MBDomainManager *)self addDomain:v40];
        }

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v43 = [v38 allAppGroupContainers];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v95 objects:v113 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = 0;
          uint64_t v47 = *(void *)v96;
          do
          {
            uint64_t v48 = 0;
            __int16 v49 = v46;
            do
            {
              if (*(void *)v96 != v47) {
                objc_enumerationMutation(v43);
              }
              uint64_t v46 = [*(id *)(*((void *)&v95 + 1) + 8 * v48) domain];

              uint64_t v50 = [v46 name];
              BOOL v51 = [(MBDomainManager *)self containsDomainName:v50];

              if (!v51) {
                [(MBDomainManager *)self addDomain:v46];
              }
              ++v48;
              __int16 v49 = v46;
            }
            while (v45 != v48);
            uint64_t v45 = [v43 countByEnumeratingWithState:&v95 objects:v113 count:16];
          }
          while (v45);
        }
      }
      uint64_t v90 = [v86 countByEnumeratingWithState:&v99 objects:v114 count:16];
    }
    while (v90);
  }

  if ([v83 isPersonalPersona])
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v52 = [v82 allSystemContainers];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v91 objects:v112 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v92;
      do
      {
        for (uint64_t m = 0; m != v54; ++m)
        {
          if (*(void *)v92 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = [*(id *)(*((void *)&v91 + 1) + 8 * m) domain];
          v58 = [v57 name];
          BOOL v59 = [(MBDomainManager *)self containsDomainName:v58];

          if (!v59) {
            [(MBDomainManager *)self addDomain:v57];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v91 objects:v112 count:16];
      }
      while (v54);
    }
  }
  int64_t v60 = [v82 allDisabledDomainNamesForPersona:v83];
  [(MBDomainManager *)self removeDomains:v60];
  __int16 v61 = MBGetDefaultLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    double v62 = MBStringWithSet(v60);
    *(_DWORD *)buf = 138412290;
    v116 = v62;
    _os_log_impl(&dword_1DD9AE000, v61, OS_LOG_TYPE_DEFAULT, "Disabled domains: %@", buf, 0xCu);

    __int16 v63 = MBStringWithSet(v60);
    _MBLog(@"DEFAULT", (uint64_t)"Disabled domains: %@", v64, v65, v66, v67, v68, v69, (uint64_t)v63);
  }
  v70 = [v81 allRestrictedDomainNames:v82 account:v80];
  [(MBDomainManager *)self removeDomains:v70];
  v71 = MBGetDefaultLog();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    v72 = MBStringWithSet(v70);
    *(_DWORD *)buf = 138412290;
    v116 = v72;
    _os_log_impl(&dword_1DD9AE000, v71, OS_LOG_TYPE_DEFAULT, "Restricted domains: %@", buf, 0xCu);

    v73 = MBStringWithSet(v70);
    _MBLog(@"DEFAULT", (uint64_t)"Restricted domains: %@", v74, v75, v76, v77, v78, v79, (uint64_t)v73);
  }
}

- (MBSystemDomainsVersions)systemDomainsVersions
{
  return self->_systemDomainsVersions;
}

- (void)setSystemDomainsVersions:(id)a3
{
}

- (NSDictionary)systemDomainsByName
{
  return self->_systemDomainsByName;
}

- (void)setSystemDomainsByName:(id)a3
{
}

- (NSMutableDictionary)domainsByName
{
  return self->_domainsByName;
}

- (void)setDomainsByName:(id)a3
{
}

- (MBDomainManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBDomainManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainsByName, 0);
  objc_storeStrong((id *)&self->_systemDomainsByName, 0);
  objc_storeStrong((id *)&self->_systemDomainsVersions, 0);
}

+ (void)_readDomainsFromPlist:accountType:volumeMountPoint:error:.cold.1()
{
  __assert_rtn("+[MBDomainManager _readDomainsFromPlist:accountType:volumeMountPoint:error:]", "MBDomainManager.m", 122, "accountType != MBAccountTypeUnspecified");
}

- (void)_initWithAccountType:volumeMountPoint:plistPath:error:.cold.1()
{
}

@end