@interface STAskForTimeApplicationResource
- (STAskForTimeApplicationResource)initWithBundleIdentifier:(id)a3 changeHandler:(id)a4;
- (id)_fetchParentBundleIdentifierForBundleIdentifier:(id)a3;
- (id)_fetchParentBundleIdentifiersForBundleIdentifier:(id)a3;
@end

@implementation STAskForTimeApplicationResource

- (STAskForTimeApplicationResource)initWithBundleIdentifier:(id)a3 changeHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F223C8];
  id v8 = a4;
  id v18 = 0;
  v9 = (void *)[[v7 alloc] initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v18];
  id v10 = v18;
  if (v9)
  {
    v11 = [v9 localizedName];
  }
  else
  {
    v12 = +[STLog ask];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_INFO, "Failed to get application record for %{public}@ %{public}@", buf, 0x16u);
    }

    v13 = [v6 componentsSeparatedByString:@"."];
    v11 = [v13 lastObject];
  }
  v14 = [(STAskForTimeApplicationResource *)self _fetchParentBundleIdentifierForBundleIdentifier:v6];

  v17.receiver = self;
  v17.super_class = (Class)STAskForTimeApplicationResource;
  v15 = [(STAskForTimeResource *)&v17 initWithResourceIdentifier:v14 resourceDisplayName:v11 usageType:0 changeHandler:v8];

  return v15;
}

- (id)_fetchParentBundleIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STAskForTimeApplicationResource *)self _fetchParentBundleIdentifiersForBundleIdentifier:v4];
  unint64_t v6 = [v5 count];
  id v7 = v4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  v16 = v7;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v7 = *(id *)(*((void *)&v17 + 1) + 8 * v12);

        if (v6 >= 2)
        {
          v14 = +[STLog ask];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v22 = v7;
            _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "Multiple Bundle Identifiers Found: %{public}@", buf, 0xCu);
          }
        }
        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_fetchParentBundleIdentifiersForBundleIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v24 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v24];
  id v6 = v24;
  id v7 = v6;
  if (v5)
  {
    id v19 = v6;
    id v8 = [v5 appClipMetadata];
    uint64_t v9 = [v8 parentApplicationIdentifiers];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
          {
            v16 = +[STLog ask];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v26 = v3;
              __int16 v27 = 2114;
              v28 = v15;
              _os_log_error_impl(&dword_1DA519000, v16, OS_LOG_TYPE_ERROR, "Failed looking up parent bundle identifier for app: %{public}@ with parent application identifier %{public}@", buf, 0x16u);
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v12);
    }

    id v7 = v19;
  }
  else
  {
    uint64_t v10 = +[STLog ask];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v3;
      __int16 v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "No application record for bundle identifier: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  long long v17 = (void *)[v4 copy];
  return v17;
}

@end