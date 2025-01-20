@interface PUEditPluginManager
+ (id)sharedManagerForMediaType:(unint64_t)a3;
- (BOOL)hasMarkupPlugin;
- (BOOL)hasNonMarkupPlugins;
- (BOOL)hasPlugins;
- (NSArray)plugins;
- (id)_allowedPluginTypes;
- (id)_initWithMediaType:(unint64_t)a3;
- (id)pluginActivities;
- (id)pluginActivitiesExceptMarkup;
- (unint64_t)mediaType;
- (void)_discoveredAvailableExtensions:(id)a3;
- (void)rediscoverAvailablePlugins;
- (void)setPlugins:(id)a3;
@end

@implementation PUEditPluginManager

- (void).cxx_destruct
{
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setPlugins:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_plugins != v4)
  {
    v10 = v4;
    BOOL v6 = -[NSArray isEqualToArray:](v4, "isEqualToArray:");
    v5 = v10;
    if (!v6)
    {
      v7 = (NSArray *)[(NSArray *)v10 copy];
      plugins = self->_plugins;
      self->_plugins = v7;

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"PUEditPluginManagerPluginsDidChangeNotification" object:self userInfo:0];

      v5 = v10;
    }
  }
}

- (id)pluginActivitiesExceptMarkup
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PUEditPluginManager *)self plugins];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "pu_isMarkupExtension", (void)v13) & 1) == 0)
        {
          v10 = [[PUEditPluginActivity alloc] initWithPlugin:v9];
          if (v10)
          {
            v11 = v10;
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)pluginActivities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PUEditPluginManager *)self plugins];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "pu_isMarkupExtension", (void)v13)) {
          v10 = [[PUEditPluginActionActivity alloc] initWithPlugin:v9 systemImageName:@"pencil.tip.crop.circle"];
        }
        else {
          v10 = [[PUEditPluginActivity alloc] initWithPlugin:v9];
        }
        v11 = v10;
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_discoveredAvailableExtensions:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v10 = [v9 _plugIn];
        v11 = [v10 containingUrl];

        if (!v11)
        {
          v12 = (void *)MEMORY[0x1E4F1CB10];
          long long v13 = NSString;
          long long v14 = [MEMORY[0x1E4F29128] UUID];
          long long v15 = [v14 UUIDString];
          long long v16 = [v13 stringWithFormat:@"appLessExtension://%@", v15];
          v11 = [v12 URLWithString:v16];
        }
        v17 = [v4 objectForKey:v11];
        if (!v17
          || ([v9 identifier],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              [v17 identifier],
              v19 = objc_claimAutoreleasedReturnValue(),
              uint64_t v20 = [v18 compare:v19],
              v19,
              v18,
              v20 == -1))
        {
          [v4 setObject:v9 forKey:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v6);
  }

  v21 = [v4 allValues];
  v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v29 = [v28 identifier];
        uint64_t v30 = +[PUEditPlugin pu_isMarkupExtensionIdentifier:v29] ^ 1;

        v31 = [[PUEditPlugin alloc] initWithExtension:v28 pluginCategoryType:v30];
        [v22 addObject:v31];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PUEditPluginManager__discoveredAvailableExtensions___block_invoke;
  block[3] = &unk_1E5F2ECC8;
  block[4] = self;
  id v36 = v22;
  id v32 = v22;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PUEditPluginManager__discoveredAvailableExtensions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlugins:*(void *)(a1 + 40)];
}

- (void)rediscoverAvailablePlugins
{
  id v3 = [(PUEditPluginManager *)self _allowedPluginTypes];
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 allowAnyPlugin];

  id v5 = (void *)MEMORY[0x1E4F28C70];
  if (v4)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_2;
    v15[3] = &unk_1E5F24F68;
    uint64_t v6 = (id *)v16;
    uint64_t v7 = *(void *)(a1 + 32);
    v16[0] = v2;
    v16[1] = v7;
    id v8 = v2;
    [v5 extensionsWithMatchingAttributes:0 completion:v15];
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4F282B0];
    v18[0] = @"com.apple.photo-editing";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_3;
    v11[3] = &unk_1E5F24F90;
    uint64_t v6 = &v12;
    id v12 = *(id *)(a1 + 40);
    id v13 = v2;
    uint64_t v14 = *(void *)(a1 + 32);
    id v10 = v2;
    [v5 extensionsWithMatchingAttributes:v9 completion:v11];
  }
}

uint64_t __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setArray:a2];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 _discoveredAvailableExtensions:v4];
}

void __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_4;
        v10[3] = &unk_1E5F2BCD0;
        v10[4] = v8;
        v9 = *(void **)(a1 + 32);
        id v11 = *(id *)(a1 + 40);
        [v9 enumerateIndexesUsingBlock:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 48) _discoveredAvailableExtensions:*(void *)(a1 + 40)];
}

uint64_t __49__PUEditPluginManager_rediscoverAvailablePlugins__block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "pu_supportsMediaType:", a2);
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
    *a3 = 1;
  }
  return result;
}

- (id)_allowedPluginTypes
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  unint64_t v4 = [(PUEditPluginManager *)self mediaType];
  unint64_t v5 = v4;
  if (v4 - 2 >= 2 && v4 != 0)
  {
    if (v4 != 1) {
      goto LABEL_8;
    }
    [v3 addIndex:0];
  }
  [v3 addIndex:v5];
LABEL_8:
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)hasMarkupPlugin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(PUEditPluginManager *)self plugins];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "pu_isMarkupExtension", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasNonMarkupPlugins
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(PUEditPluginManager *)self plugins];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "pu_isMarkupExtension", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasPlugins
{
  id v2 = [(PUEditPluginManager *)self plugins];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_initWithMediaType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUEditPluginManager;
  id result = [(PUEditPluginManager *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (id)sharedManagerForMediaType:(unint64_t)a3
{
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  switch(a3)
  {
    case 0uLL:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke;
      v11[3] = &__block_descriptor_48_e5_v8__0l;
      void v11[4] = a1;
      v11[5] = 0;
      if (sharedManagerForMediaType__onceToken != -1) {
        dispatch_once(&sharedManagerForMediaType__onceToken, v11);
      }
      objc_super v5 = &sharedManagerForMediaType__sharedManager;
      goto LABEL_17;
    case 1uLL:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_2;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a1;
      void block[5] = 1;
      if (sharedManagerForMediaType__onceToken_195 != -1) {
        dispatch_once(&sharedManagerForMediaType__onceToken_195, block);
      }
      objc_super v5 = &sharedManagerForMediaType__sharedManager_194;
      goto LABEL_17;
    case 2uLL:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_3;
      v9[3] = &__block_descriptor_48_e5_v8__0l;
      v9[4] = a1;
      v9[5] = 2;
      if (sharedManagerForMediaType__onceToken_197 != -1) {
        dispatch_once(&sharedManagerForMediaType__onceToken_197, v9);
      }
      objc_super v5 = &sharedManagerForMediaType__sharedManager_196;
      goto LABEL_17;
    case 3uLL:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_4;
      v8[3] = &__block_descriptor_48_e5_v8__0l;
      v8[4] = a1;
      v8[5] = 3;
      if (sharedManagerForMediaType__onceToken_199 != -1) {
        dispatch_once(&sharedManagerForMediaType__onceToken_199, v8);
      }
      objc_super v5 = &sharedManagerForMediaType__sharedManager_198;
LABEL_17:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithMediaType:*(void *)(a1 + 40)];
  id v2 = (void *)sharedManagerForMediaType__sharedManager;
  sharedManagerForMediaType__sharedManager = v1;
}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithMediaType:*(void *)(a1 + 40)];
  id v2 = (void *)sharedManagerForMediaType__sharedManager_194;
  sharedManagerForMediaType__sharedManager_194 = v1;
}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithMediaType:*(void *)(a1 + 40)];
  id v2 = (void *)sharedManagerForMediaType__sharedManager_196;
  sharedManagerForMediaType__sharedManager_196 = v1;
}

void __49__PUEditPluginManager_sharedManagerForMediaType___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithMediaType:*(void *)(a1 + 40)];
  id v2 = (void *)sharedManagerForMediaType__sharedManager_198;
  sharedManagerForMediaType__sharedManager_198 = v1;
}

@end