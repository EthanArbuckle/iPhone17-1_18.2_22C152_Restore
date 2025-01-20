@interface NCSInternalSettingsManager
- (BOOL)hasSettings;
- (NCSInternalSettingsManager)init;
- (NSString)selectedComplicationIdentifier;
- (OS_dispatch_queue)queue;
- (id)_localizedNameForComplication:(id)a3;
- (id)complicationDefinitionForAppBundleIdentifier:(id)a3;
- (id)complicationDefinitionForComplicationIdentifier:(id)a3;
- (id)complicationDefinitionForWatchKitIdentifier:(id)a3;
- (id)complicationIdentifierForComplicationDefinitionAtIndex:(unint64_t)a3;
- (unint64_t)_numberOfActiveComplications;
- (void)_saveSettings;
- (void)addComplicationDefinition:(id)a3;
- (void)enumerateAllComplicationDefinitionsUsingBlock:(id)a3;
- (void)enumerateComplicationDefinitionsUsingBlock:(id)a3;
- (void)loadSettings;
- (void)moveComplicationDefinitionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)removeComplicationDefinitionsInArray:(id)a3;
- (void)saveSettings;
- (void)setSelectedComplicationIdentifier:(id)a3;
@end

@implementation NCSInternalSettingsManager

- (NCSInternalSettingsManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCSInternalSettingsManager;
  v2 = [(NCSInternalSettingsManager *)&v8 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanocomplicationsettings.internalsettingsmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (NSString)selectedComplicationIdentifier
{
  selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
  if (!selectedComplicationIdentifier)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano-complications"];
    id v5 = (id)[v4 synchronize];
    v6 = [v4 stringForKey:@"SelectedComplicationIdentifier"];
    v7 = self->_selectedComplicationIdentifier;
    self->_selectedComplicationIdentifier = v6;

    selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
  }
  return selectedComplicationIdentifier;
}

- (void)setSelectedComplicationIdentifier:(id)a3
{
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_selectedComplicationIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)[v9 copy];
    selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
    self->_selectedComplicationIdentifier = v4;

    v6 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano-complications"];
    [v6 setObject:self->_selectedComplicationIdentifier forKey:@"SelectedComplicationIdentifier"];
    id v7 = (id)[v6 synchronize];
    objc_super v8 = [MEMORY[0x263EFFA08] setWithObject:@"SelectedComplicationIdentifier"];
    [(NPSManager *)self->_syncManager synchronizeNanoDomain:@"com.apple.nano-complications" keys:v8];
  }
}

- (BOOL)hasSettings
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__NCSInternalSettingsManager_hasSettings__block_invoke;
  v5[3] = &unk_264E1A010;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__NCSInternalSettingsManager_hasSettings__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)addComplicationDefinition:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__NCSInternalSettingsManager_addComplicationDefinition___block_invoke;
  v7[3] = &unk_264E1A038;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__NCSInternalSettingsManager_addComplicationDefinition___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeComplicationDefinitionsInArray:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NCSInternalSettingsManager_removeComplicationDefinitionsInArray___block_invoke;
  v7[3] = &unk_264E1A038;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __67__NCSInternalSettingsManager_removeComplicationDefinitionsInArray___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsInArray:*(void *)(a1 + 40)];
}

- (void)enumerateComplicationDefinitionsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__NCSInternalSettingsManager_enumerateComplicationDefinitionsUsingBlock___block_invoke;
  v6[3] = &unk_264E1A060;
  id v7 = v4;
  id v5 = v4;
  [(NCSInternalSettingsManager *)self enumerateAllComplicationDefinitionsUsingBlock:v6];
}

void __73__NCSInternalSettingsManager_enumerateComplicationDefinitionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInstalled]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateAllComplicationDefinitionsUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke;
  block[3] = &unk_264E1A010;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  id v6 = (void *)v12[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke_2;
  v8[3] = &unk_264E1A060;
  id v7 = v4;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v8];

  _Block_object_dispose(&v11, 8);
}

uint64_t __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)moveComplicationDefinitionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NCSInternalSettingsManager_moveComplicationDefinitionFromIndex_toIndex___block_invoke;
  block[3] = &unk_264E1A088;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  dispatch_async(queue, block);
}

void __74__NCSInternalSettingsManager_moveComplicationDefinitionFromIndex_toIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) insertObject:v2 atIndex:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _saveSettings];
}

- (id)complicationDefinitionForAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__NCSInternalSettingsManager_complicationDefinitionForAppBundleIdentifier___block_invoke;
  v8[3] = &unk_264E1A0B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NCSInternalSettingsManager *)self enumerateAllComplicationDefinitionsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__NCSInternalSettingsManager_complicationDefinitionForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 appBundleIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)complicationDefinitionForComplicationIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__NCSInternalSettingsManager_complicationDefinitionForComplicationIdentifier___block_invoke;
  v8[3] = &unk_264E1A0B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NCSInternalSettingsManager *)self enumerateAllComplicationDefinitionsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__NCSInternalSettingsManager_complicationDefinitionForComplicationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 complicationIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)complicationDefinitionForWatchKitIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__NCSInternalSettingsManager_complicationDefinitionForWatchKitIdentifier___block_invoke;
  v8[3] = &unk_264E1A0B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NCSInternalSettingsManager *)self enumerateAllComplicationDefinitionsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __74__NCSInternalSettingsManager_complicationDefinitionForWatchKitIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 sockPuppetIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)saveSettings
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NCSInternalSettingsManager_saveSettings__block_invoke;
  block[3] = &unk_264E1A0D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__NCSInternalSettingsManager_saveSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveSettings];
}

- (void)_saveSettings
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_complicationDefinitions, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_complicationDefinitions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(NSDictionary, "dictionaryWithComplication:", *(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if (![(NSArray *)self->_storedSettings isEqualToArray:v3])
  {
    objc_storeStrong((id *)&self->_storedSettings, v3);
    v10 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano-complications"];
    [v10 setObject:v3 forKey:@"ComplicationDefinitions"];
    id v11 = (id)[v10 synchronize];
    v12 = [MEMORY[0x263EFFA08] setWithObject:@"ComplicationDefinitions"];
    [(NPSManager *)self->_syncManager synchronizeNanoDomain:@"com.apple.nano-complications" keys:v12];
  }
}

- (id)complicationIdentifierForComplicationDefinitionAtIndex:(unint64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  long long v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NCSInternalSettingsManager_complicationIdentifierForComplicationDefinitionAtIndex___block_invoke;
  block[3] = &unk_264E1A100;
  block[4] = self;
  void block[5] = &v9;
  void block[6] = a3;
  dispatch_sync(queue, block);
  uint64_t v6 = [(id)v10[5] complicationIdentifier];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __85__NCSInternalSettingsManager_complicationIdentifierForComplicationDefinitionAtIndex___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 8) objectAtIndexedSubscript:a1[6]];
  return MEMORY[0x270F9A758]();
}

- (void)loadSettings
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NCSInternalSettingsManager_loadSettings__block_invoke;
  block[3] = &unk_264E1A0D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__NCSInternalSettingsManager_loadSettings__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nano-complications"];
  id v3 = (id)[v2 synchronize];
  uint64_t v4 = [v2 arrayForKey:@"ComplicationDefinitions"];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  uint64_t v7 = [v2 stringForKey:@"SelectedComplicationIdentifier"];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  uint64_t v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = v10;

  long long v13 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [[NCSComplication alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        v19 = [*(id *)(a1 + 32) _localizedNameForComplication:v18];
        if (v19) {
          [(NCSComplication *)v18 setName:v19];
        }
        v20 = [(NCSComplication *)v18 sockPuppetIdentifier];

        if (!v20) {
          goto LABEL_10;
        }
        v21 = [(NCSComplication *)v18 sockPuppetIdentifier];
        v22 = [v13 objectForKeyedSubscript:v21];

        v23 = [(NCSComplication *)v18 sockPuppetIdentifier];
        [v13 setObject:v18 forKeyedSubscript:v23];

        if (!v22) {
LABEL_10:
        }
          [*(id *)(*(void *)(a1 + 32) + 8) addObject:v18];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }
}

- (unint64_t)_numberOfActiveComplications
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__NCSInternalSettingsManager__numberOfActiveComplications__block_invoke;
  v5[3] = &unk_264E1A128;
  v5[4] = &v6;
  [(NCSInternalSettingsManager *)self enumerateComplicationDefinitionsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__NCSInternalSettingsManager__numberOfActiveComplications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isActive];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_localizedNameForComplication:(id)a3
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_selectedComplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_storedSettings, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_complicationDefinitions, 0);
}

@end