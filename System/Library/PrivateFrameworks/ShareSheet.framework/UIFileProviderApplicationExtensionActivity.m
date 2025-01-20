@interface UIFileProviderApplicationExtensionActivity
- (BOOL)_sharesGroupContainerWithURL:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (LSPlugInKitProxy)pluginProxy;
- (NSArray)groupContainerURLs;
- (UIFileProviderApplicationExtensionActivity)initWithApplicationExtension:(id)a3;
- (void)setGroupContainerURLs:(id)a3;
- (void)setPluginProxy:(id)a3;
@end

@implementation UIFileProviderApplicationExtensionActivity

- (UIFileProviderApplicationExtensionActivity)initWithApplicationExtension:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIFileProviderApplicationExtensionActivity;
  v5 = [(UIApplicationExtensionActivity *)&v17 initWithApplicationExtension:v4];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F22458];
      v8 = [v4 identifier];
      uint64_t v9 = [v7 pluginKitProxyForIdentifier:v8];
      pluginProxy = v5->_pluginProxy;
      v5->_pluginProxy = (LSPlugInKitProxy *)v9;

      v11 = v5->_pluginProxy;
      if (v11)
      {
        v12 = [(LSPlugInKitProxy *)v11 groupContainerURLs];
        uint64_t v13 = [v12 allValues];
        groupContainerURLs = v5->_groupContainerURLs;
        v5->_groupContainerURLs = (NSArray *)v13;
      }
    }
    v15 = v5;
  }

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UIFileProviderApplicationExtensionActivity *)self pluginProxy];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v11, "ui_isFileProviderURL", (void)v14)
            && [(UIFileProviderApplicationExtensionActivity *)self _sharesGroupContainerWithURL:v11])
          {
            BOOL v12 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_15:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_sharesGroupContainerWithURL:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(UIFileProviderApplicationExtensionActivity *)self groupContainerURLs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v7 = 138543874;
    long long v15 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v17 = 0;
        v11 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v15);
        id v16 = 0;
        [v11 getRelationship:&v17 ofDirectoryAtURL:v10 toItemAtURL:v4 error:&v16];
        id v12 = v16;

        if (v12)
        {
          uint64_t v13 = share_sheet_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            id v23 = v4;
            __int16 v24 = 2114;
            uint64_t v25 = v10;
            __int16 v26 = 2112;
            id v27 = v12;
            _os_log_error_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_ERROR, "error getting relationship for url:%{public}@ containerURL:%{public}@ error:%@", buf, 0x20u);
          }
        }
        else if (!v17)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

- (LSPlugInKitProxy)pluginProxy
{
  return self->_pluginProxy;
}

- (void)setPluginProxy:(id)a3
{
}

- (NSArray)groupContainerURLs
{
  return self->_groupContainerURLs;
}

- (void)setGroupContainerURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContainerURLs, 0);
  objc_storeStrong((id *)&self->_pluginProxy, 0);
}

@end