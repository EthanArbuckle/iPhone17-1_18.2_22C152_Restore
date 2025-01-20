@interface AEPluginRegistry
+ (id)sharedInstance;
- (AEPluginRegistry)init;
- (id)pluginForAssetType:(id)a3;
- (id)pluginForExtension:(id)a3;
- (id)pluginForURL:(id)a3;
- (void)prewarmSharedResourcesWithCompletion:(id)a3;
- (void)registerAssetEnginePlugin:(id)a3;
- (void)registerAssetEnginePlugin:(id)a3 forExtension:(id)a4;
@end

@implementation AEPluginRegistry

+ (id)sharedInstance
{
  if (qword_349440 != -1) {
    dispatch_once(&qword_349440, &stru_2CA3A8);
  }
  v2 = (void *)qword_349438;

  return v2;
}

- (AEPluginRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)AEPluginRegistry;
  v2 = [(AEPluginRegistry *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    extensionPlugins = v2->_extensionPlugins;
    v2->_extensionPlugins = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    schemePlugins = v2->_schemePlugins;
    v2->_schemePlugins = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    assetTypePlugins = v2->_assetTypePlugins;
    v2->_assetTypePlugins = v7;
  }
  return v2;
}

- (void)registerAssetEnginePlugin:(id)a3 forExtension:(id)a4
{
  id v12 = a3;
  assetTypePlugins = self->_assetTypePlugins;
  id v7 = a4;
  v8 = [v12 associatedAssetType];
  [(NSMutableDictionary *)assetTypePlugins setObject:v12 forKey:v8];

  v9 = [v7 lowercaseString];

  objc_super v10 = [(NSMutableDictionary *)self->_extensionPlugins objectForKey:v9];
  if (v10)
  {
    objc_opt_class();
    BUDynamicCast();
    v11 = (AEAggregationPlugin *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = [[AEAggregationPlugin alloc] initWithFileExtension:v9];
      [(AEAggregationPlugin *)v11 addPlugin:v10];
      [(NSMutableDictionary *)self->_extensionPlugins setValue:v11 forKey:v9];
    }
    [(AEAggregationPlugin *)v11 addPlugin:v12];
  }
  else
  {
    [(NSMutableDictionary *)self->_extensionPlugins setValue:v12 forKey:v9];
  }
}

- (void)registerAssetEnginePlugin:(id)a3
{
  id v4 = a3;
  v5 = [v4 supportedFileExtensions];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AEPluginRegistry *)self registerAssetEnginePlugin:v4 forExtension:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  v18 = v5;
  objc_super v10 = [v4 supportedUrlSchemes];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
        v16 = [(NSMutableDictionary *)self->_schemePlugins objectForKey:v15];
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = v16;
          }
          else
          {
            v17 = [[AEAggregationPlugin alloc] initWithUrlScheme:v15];
            [(AEAggregationPlugin *)v17 addPlugin:v16];
            [(NSMutableDictionary *)self->_schemePlugins setValue:v17 forKey:v15];
          }
          [(AEAggregationPlugin *)v17 addPlugin:v4];
        }
        else
        {
          [(NSMutableDictionary *)self->_schemePlugins setValue:v4 forKey:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)prewarmSharedResourcesWithCompletion:(id)a3
{
  id v14 = a3;
  id v4 = dispatch_group_create();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(NSMutableDictionary *)self->_assetTypePlugins allValues];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v10 description];
          *(_DWORD *)buf = 138412290;
          long long v24 = v11;
          _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin AEBookPlugin prewarm for %@", buf, 0xCu);
        }
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v4);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_15B0D0;
          v17[3] = &unk_2C3AF8;
          v17[4] = v10;
          v18 = v4;
          [v10 prewarmSharedResourcesWithCompletion:v17];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v10 description];
          *(_DWORD *)buf = 138543362;
          long long v24 = v12;
          _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipped AEBookPlugin prewarm for %{public}@", buf, 0xCu);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15B18C;
  block[3] = &unk_2C4280;
  id v16 = v14;
  id v13 = v14;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)pluginForExtension:(id)a3
{
  id v4 = a3;
  if (-[NSMutableDictionary count](self->_extensionPlugins, "count") && [v4 length])
  {
    v5 = [v4 lowercaseString];
    id v6 = [(NSMutableDictionary *)self->_extensionPlugins objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pluginForURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  id v6 = [(AEPluginRegistry *)self pluginForExtension:v5];

  if (!v6)
  {
    if ([(NSMutableDictionary *)self->_schemePlugins count])
    {
      id v7 = [v4 scheme];
      if ([v7 length])
      {
        id v6 = [(NSMutableDictionary *)self->_schemePlugins objectForKey:v7];
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)pluginForAssetType:(id)a3
{
  return [(NSMutableDictionary *)self->_assetTypePlugins objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTypePlugins, 0);
  objc_storeStrong((id *)&self->_schemePlugins, 0);

  objc_storeStrong((id *)&self->_extensionPlugins, 0);
}

@end