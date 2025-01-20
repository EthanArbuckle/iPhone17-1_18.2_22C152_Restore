@interface UISceneConnectionOptions
- (CKShareMetadata)cloudKitShareMetadata;
- (FBSScene)_fbsScene;
- (FBSSceneSpecification)_specification;
- (NSDictionary)_launchOptionsDictionary;
- (NSSet)URLContexts;
- (NSSet)_bluetoothCentralRestorationIdentifiers;
- (NSSet)_bluetoothPeripheralRestorationIdentifiers;
- (NSSet)_itemProviderCollections;
- (NSSet)userActivities;
- (NSString)handoffUserActivityType;
- (NSString)sourceApplication;
- (UIApplicationShortcutItem)shortcutItem;
- (UNNotificationResponse)notificationResponse;
- (id)_initWithConnectionOptionsContext:(id)a3 fbsScene:(id)a4 specification:(id)a5;
- (id)description;
- (uint64_t)_definitionPayloadStorage;
- (void)performPostConnectionCleanup;
@end

@implementation UISceneConnectionOptions

- (uint64_t)_definitionPayloadStorage
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)performPostConnectionCleanup
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_cleanupBlocks;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  cleanupBlocks = self->_cleanupBlocks;
  self->_cleanupBlocks = 0;
}

- (FBSSceneSpecification)_specification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specification);
  return (FBSSceneSpecification *)WeakRetained;
}

- (UIApplicationShortcutItem)shortcutItem
{
  v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsShortcutItemKey"];
  v3 = [v2 anyObject];

  return (UIApplicationShortcutItem *)v3;
}

- (NSSet)URLContexts
{
  return (NSSet *)[(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsURLContextKey"];
}

- (id)_initWithConnectionOptionsContext:(id)a3 fbsScene:(id)a4 specification:(id)a5
{
  v8 = (id *)a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)UISceneConnectionOptions;
  long long v11 = [(UISceneConnectionOptions *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 launchOptionsDictionary];
    launchOptionsDictionary = v11->_launchOptionsDictionary;
    v11->_launchOptionsDictionary = (NSDictionary *)v12;

    if (v8)
    {
      objc_storeStrong((id *)&v11->_cleanupBlocks, v8[3]);
      objc_storeWeak((id *)&v11->_fbsScene, v9);
      objc_storeWeak((id *)&v11->_specification, v10);
      id v14 = v8[4];
    }
    else
    {
      objc_storeStrong((id *)&v11->_cleanupBlocks, 0);
      objc_storeWeak((id *)&v11->_fbsScene, v9);
      objc_storeWeak((id *)&v11->_specification, v10);
      id v14 = 0;
    }
    objc_storeStrong((id *)&v11->_definitionPayloadStorage, v14);
  }

  return v11;
}

- (FBSScene)_fbsScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbsScene);
  return (FBSScene *)WeakRetained;
}

- (id)description
{
  return [(NSDictionary *)self->_launchOptionsDictionary description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionPayloadStorage, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_destroyWeak((id *)&self->_specification);
  objc_destroyWeak((id *)&self->_fbsScene);
  objc_storeStrong((id *)&self->_launchOptionsDictionary, 0);
}

- (UNNotificationResponse)notificationResponse
{
  v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsNotificationResponsesKey"];
  v3 = [v2 anyObject];

  return (UNNotificationResponse *)v3;
}

- (NSSet)userActivities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKey:@"_UISceneConnectionOptionsUserActivityDictionariesKey"];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", @"_UISceneConnectionOptionsUserActivityKey", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];
  return (NSSet *)v10;
}

- (NSString)sourceApplication
{
  v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsSourceApplicationKey"];
  v3 = [v2 anyObject];

  return (NSString *)v3;
}

- (NSSet)_itemProviderCollections
{
  return (NSSet *)[(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsItemProvidersKey"];
}

- (CKShareMetadata)cloudKitShareMetadata
{
  v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsCloudKitShareMetadataKey"];
  v3 = [v2 anyObject];

  return (CKShareMetadata *)v3;
}

- (NSString)handoffUserActivityType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSDictionary *)self->_launchOptionsDictionary objectForKey:@"_UISceneConnectionOptionsUserActivityDictionariesKey"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "objectForKey:", @"_UISceneConnectionOptionsUserActivityKey", (void)v12);
        if (!v8)
        {
          uint64_t v9 = [v7 objectForKey:@"_UISceneConnectionOptionsUserActivityTypeKey"];
          if (v9)
          {
            id v10 = (void *)v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return (NSString *)v10;
}

- (NSSet)_bluetoothCentralRestorationIdentifiers
{
  id v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsBluetoothCentralsKey"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  uint64_t v5 = v4;

  return (NSSet *)v5;
}

- (NSSet)_bluetoothPeripheralRestorationIdentifiers
{
  id v2 = [(NSDictionary *)self->_launchOptionsDictionary objectForKeyedSubscript:@"_UISceneConnectionOptionsBluetoothPeripheralsKey"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  uint64_t v5 = v4;

  return (NSSet *)v5;
}

- (NSDictionary)_launchOptionsDictionary
{
  return self->_launchOptionsDictionary;
}

@end