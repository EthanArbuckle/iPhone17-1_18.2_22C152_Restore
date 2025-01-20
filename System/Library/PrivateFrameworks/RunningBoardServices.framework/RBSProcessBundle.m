@interface RBSProcessBundle
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)bundleWithDataSource:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSString)identifier;
- (NSString)path;
- (RBSProcessBundle)initWithRBSXPCCoder:(id)a3;
- (RBSProcessInstance)instance;
- (id)bundleInfoValueForKey:(id)a3;
- (id)bundleInfoValuesForKeys:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setInstance:(id)a3;
@end

@implementation RBSProcessBundle

- (NSString)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)setInstance:(id)a3
{
}

- (RBSProcessBundle)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RBSProcessBundle;
  v5 = [(RBSProcessBundle *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeStringForKey:@"_path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"_executablePath"];
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v10;

    uint64_t v12 = [v4 decodeStringForKey:@"_extensionPointIdentifier"];
    extensionPointIdentifier = v5->_extensionPointIdentifier;
    v5->_extensionPointIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v9 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"_identifier"];
    id v4 = v9;
  }
  path = self->_path;
  if (path)
  {
    [v9 encodeObject:path forKey:@"_path"];
    id v4 = v9;
  }
  executablePath = self->_executablePath;
  if (executablePath)
  {
    [v9 encodeObject:executablePath forKey:@"_executablePath"];
    id v4 = v9;
  }
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (extensionPointIdentifier)
  {
    [v9 encodeObject:extensionPointIdentifier forKey:@"_extensionPointIdentifier"];
    id v4 = v9;
  }
}

- (id)bundleInfoValueForKey:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"RBSProcessBundle.m", 43, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"RBSProcessBundle.m", 43, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v7 = [(RBSProcessBundle *)self bundleInfoValuesForKeys:v6];
  uint64_t v8 = [v7 objectForKey:v5];

  return v8;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if ([v35 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v34 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = [WeakRetained bundleInfoValuesForKeys:v35];
    }
    else if (self->_instance)
    {
      uint64_t v6 = self;
      objc_sync_enter(v6);
      v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v35];
      v33 = (void *)[v32 mutableCopy];
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = [(NSDictionary *)v6->_plistValues allKeys];
      id v9 = [v7 setWithArray:v8];
      [v33 minusSet:v9];

      if ([v33 count])
      {
        uint64_t v10 = +[RBSConnection sharedInstance];
        v11 = [v10 infoPlistResultForInstance:self->_instance forKeys:v35 error:0];

        uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6->_plistValues];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v13 = v33;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              v18 = [v11 objectForKey:v17];
              if (v18)
              {
                [v12 setObject:v18 forKey:v17];
              }
              else
              {
                v19 = [MEMORY[0x1E4F1CA98] null];
                [v12 setObject:v19 forKey:v17];
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v47 count:16];
          }
          while (v14);
        }

        uint64_t v20 = [v12 copy];
        plistValues = v6->_plistValues;
        v6->_plistValues = (NSDictionary *)v20;
      }
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v22 = v32;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            v27 = [(NSDictionary *)v6->_plistValues objectForKey:v26];
            if (v27)
            {
              v28 = [MEMORY[0x1E4F1CA98] null];
              BOOL v29 = v27 == v28;

              if (!v29) {
                [v5 setObject:v27 forKey:v26];
              }
            }
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }
        while (v23);
      }

      objc_sync_exit(v6);
    }
    else
    {
      v30 = rbs_process_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = self;
        _os_log_impl(&dword_191FE8000, v30, OS_LOG_TYPE_DEFAULT, "Cannot fetch info.plist values: no data source found for bundle: %{public}@", buf, 0xCu);
      }

      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

+ (id)bundleWithDataSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(RBSProcessBundle);
  objc_storeWeak((id *)&v4->_dataSource, v3);
  uint64_t v5 = [v3 bundleIdentifier];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [v3 bundlePath];
  path = v4->_path;
  v4->_path = (NSString *)v7;

  uint64_t v9 = [v3 executablePath];
  executablePath = v4->_executablePath;
  v4->_executablePath = (NSString *)v9;

  uint64_t v11 = [v3 extensionPointIdentifier];

  extensionPointIdentifier = v4->_extensionPointIdentifier;
  v4->_extensionPointIdentifier = (NSString *)v11;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plistValues, 0);
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| id:\"%@\" path:\"%@\">", v4, self->_identifier, self->_path];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  long long v10 = *(_OWORD *)&self->_identifier;
  executablePath = self->_executablePath;
  extensionPointIdentifier = self->_extensionPointIdentifier;
  uint64_t v7 = [(NSDictionary *)self->_plistValues entriesToStringWithIndent:0 debug:1];
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@| id:\"%@\" path:\"%@\" executablePath:\"%@\" extensionPoint:\"%@\" Info.plist values:\n%@\n    >", v4, v10, executablePath, extensionPointIdentifier, v7];

  return (NSString *)v8;
}

- (RBSProcessInstance)instance
{
  return self->_instance;
}

@end