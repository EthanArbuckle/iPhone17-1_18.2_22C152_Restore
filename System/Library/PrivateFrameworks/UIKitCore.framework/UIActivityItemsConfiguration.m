@interface UIActivityItemsConfiguration
+ (UIActivityItemsConfiguration)activityItemsConfigurationWithItemProviders:(NSArray *)itemProviders;
+ (UIActivityItemsConfiguration)activityItemsConfigurationWithObjects:(NSArray *)objects;
+ (id)_itemsForSystemSharingFromActivityItemsConfiguration:(id)a3 wrapperBlock:(id)a4;
- (BOOL)_hasItemsForActivityItemsConfiguration;
- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3;
- (NSArray)_activityItems;
- (NSArray)_excludedActivityTypes;
- (NSArray)_excludedInteractions;
- (NSArray)applicationActivitiesForActivityItemsConfiguration;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (NSArray)supportedInteractions;
- (UIActivityItemsConfiguration)initWithItemProviders:(NSArray *)itemProviders;
- (UIActivityItemsConfiguration)initWithObjects:(NSArray *)objects;
- (id)_initWithActivityItemSources:(id)a3;
- (id)_initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4;
- (id)activityItemsConfigurationMetadataForKey:(id)a3;
- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5;
- (id)itemProviders;
- (id)localObject;
- (void)_commonInit;
- (void)_setExcludedActivityTypes:(id)a3;
- (void)_setExcludedInteractions:(id)a3;
- (void)applicationActivitiesProvider;
- (void)metadataProvider;
- (void)perItemMetadataProvider;
- (void)previewProvider;
- (void)setApplicationActivitiesProvider:(void *)applicationActivitiesProvider;
- (void)setLocalObject:(id)localObject;
- (void)setMetadataProvider:(void *)metadataProvider;
- (void)setPerItemMetadataProvider:(void *)perItemMetadataProvider;
- (void)setPreviewProvider:(void *)previewProvider;
- (void)setSupportedInteractions:(NSArray *)supportedInteractions;
@end

@implementation UIActivityItemsConfiguration

+ (UIActivityItemsConfiguration)activityItemsConfigurationWithObjects:(NSArray *)objects
{
  v4 = objects;
  v5 = (void *)[objc_alloc((Class)a1) initWithObjects:v4];

  return (UIActivityItemsConfiguration *)v5;
}

+ (UIActivityItemsConfiguration)activityItemsConfigurationWithItemProviders:(NSArray *)itemProviders
{
  v4 = itemProviders;
  v5 = (void *)[objc_alloc((Class)a1) initWithItemProviders:v4];

  return (UIActivityItemsConfiguration *)v5;
}

- (void)_commonInit
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"share";
  v5[1] = @"copy";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  supportedInteractions = self->_supportedInteractions;
  self->_supportedInteractions = v3;
}

- (UIActivityItemsConfiguration)initWithObjects:(NSArray *)objects
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = objects;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIActivityItemsConfiguration.m", 59, @"%s: objects parameter cannot be nil.", "-[UIActivityItemsConfiguration initWithObjects:]");
  }
  v22.receiver = self;
  v22.super_class = (Class)UIActivityItemsConfiguration;
  v6 = [(UIActivityItemsConfiguration *)&v22 init];
  v7 = v6;
  if (v6)
  {
    [(UIActivityItemsConfiguration *)v6 _commonInit];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = v5;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [(NSArray *)v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    itemProviders = v7->_itemProviders;
    v7->_itemProviders = v8;
  }
  return v7;
}

- (UIActivityItemsConfiguration)initWithItemProviders:(NSArray *)itemProviders
{
  v5 = itemProviders;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIActivityItemsConfiguration.m", 79, @"%s: itemProviders parameter cannot be nil.", "-[UIActivityItemsConfiguration initWithItemProviders:]");
  }
  v12.receiver = self;
  v12.super_class = (Class)UIActivityItemsConfiguration;
  v6 = [(UIActivityItemsConfiguration *)&v12 init];
  v7 = v6;
  if (v6)
  {
    [(UIActivityItemsConfiguration *)v6 _commonInit];
    uint64_t v8 = [(NSArray *)v5 copy];
    v9 = v7->_itemProviders;
    v7->_itemProviders = (NSArray *)v8;
  }
  return v7;
}

- (id)_initWithActivityItemSources:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIActivityItemsConfiguration.m", 102, @"%s: activityItemSources parameter cannot be nil.", "-[UIActivityItemsConfiguration _initWithActivityItemSources:]");
  }
  v14.receiver = self;
  v14.super_class = (Class)UIActivityItemsConfiguration;
  v6 = [(UIActivityItemsConfiguration *)&v14 init];
  v7 = v6;
  if (v6)
  {
    [(UIActivityItemsConfiguration *)v6 _commonInit];
    uint64_t v8 = [v5 copy];
    activityItems = v7->_activityItems;
    v7->_activityItems = (NSArray *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:v5 applicationActivities:0];
    vc = v7->_vc;
    v7->_vc = (UIActivityViewController *)v10;
  }
  return v7;
}

- (id)_initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIActivityItemsConfiguration;
  uint64_t v8 = [(UIActivityItemsConfiguration *)&v19 init];
  v9 = v8;
  if (v8)
  {
    [(UIActivityItemsConfiguration *)v8 _commonInit];
    uint64_t v10 = [v6 copy];
    activityItems = v9->_activityItems;
    v9->_activityItems = (NSArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:v6 applicationActivities:v7];
    vc = v9->_vc;
    v9->_vc = (UIActivityViewController *)v12;

    if ([v7 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__UIActivityItemsConfiguration__initWithActivityItems_applicationActivities___block_invoke;
      aBlock[3] = &unk_1E52DD3B8;
      id v18 = v7;
      objc_super v14 = _Block_copy(aBlock);
      id applicationActivitiesProvider = v9->_applicationActivitiesProvider;
      v9->_id applicationActivitiesProvider = v14;
    }
  }

  return v9;
}

id __77__UIActivityItemsConfiguration__initWithActivityItems_applicationActivities___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(UIActivityItemsConfiguration *)self supportedInteractions];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  metadataProvider = (void (**)(void, void))self->_metadataProvider;
  if (metadataProvider)
  {
    ((void (**)(void, id))metadataProvider)[2](metadataProvider, a3);
    metadataProvider = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return metadataProvider;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  perItemMetadataProvider = (void (**)(void, void, void))self->_perItemMetadataProvider;
  if (perItemMetadataProvider)
  {
    ((void (**)(void, int64_t, id))perItemMetadataProvider)[2](perItemMetadataProvider, a3, a4);
    perItemMetadataProvider = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  }
  return perItemMetadataProvider;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  previewProvider = (void (**)(void, void, void, __n128, __n128))self->_previewProvider;
  if (previewProvider)
  {
    ((void (**)(void, int64_t, id, __n128, __n128))previewProvider)[2](previewProvider, a3, a4, (__n128)a5, *(__n128 *)&a5.height);
    previewProvider = (void (**)(void, void, void, __n128, __n128))objc_claimAutoreleasedReturnValue();
  }
  return previewProvider;
}

- (NSArray)applicationActivitiesForActivityItemsConfiguration
{
  uint64_t v2 = [(UIActivityItemsConfiguration *)self applicationActivitiesProvider];
  v3 = (void *)v2;
  if (v2)
  {
    id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  uint64_t v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    id v4 = (void *)[(NSArray *)itemProviders copy];
    goto LABEL_27;
  }
  if ([(NSArray *)v2->_activityItems count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v2->_activityItems, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = v2->_activityItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    uint64_t v24 = (void *)*MEMORY[0x1E4F9F380];
    long long v20 = v26;
    v9 = &protocolRef_NSObject;
    long long v21 = v2;
    v23 = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 addObject:v11];
          continue;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1ED525A20, v20))
        {
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v11];
          [v4 addObject:v12];

          continue;
        }
        if ([v11 conformsToProtocol:v9[106]])
        {
          id v13 = v11;
          id v14 = v24;
          v15 = v2;
          v16 = [v13 activityViewController:v2->_vc itemForActivityType:v14];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v4 addObject:v16];
LABEL_22:

            v9 = &protocolRef_NSObject;
            uint64_t v2 = v15;
            id v5 = v23;
            continue;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [v13 activityViewController:v15->_vc dataTypeIdentifierForActivityType:v14];
            if ([v17 length])
            {
              objc_super v22 = v17;
              id v18 = objc_alloc_init(MEMORY[0x1E4F28D78]);
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v26[0] = __74__UIActivityItemsConfiguration_itemProvidersForActivityItemsConfiguration__block_invoke;
              v26[1] = &unk_1E52DD3E0;
              id v27 = v16;
              [v18 registerDataRepresentationForTypeIdentifier:v22 visibility:0 loadHandler:v25];
              [v4 addObject:v18];

              v17 = v22;
            }
          }
          else
          {
            if (![v16 conformsToProtocol:&unk_1ED525A20]) {
              goto LABEL_22;
            }
            v17 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v16];
            [v4 addObject:v17];
          }

          v15 = v21;
          goto LABEL_22;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v7)
      {
LABEL_25:

        goto LABEL_27;
      }
    }
  }
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_27:
  return (NSArray *)v4;
}

uint64_t __74__UIActivityItemsConfiguration_itemProvidersForActivityItemsConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_itemsForSystemSharingFromActivityItemsConfiguration:(id)a3 wrapperBlock:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, id, void))a4;
  char v16 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = [v5 itemProvidersForActivityItemsConfiguration];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(2 * v9) | 1];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v12 = v6[2](v6, v5, i);
      [v10 addObject:v12];

      if (v7)
      {
        id v13 = [v5 activityItemsConfigurationMetadataForItemAtIndex:i key:@"messageBody"];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            [v10 addObject:v13];
          }
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  if (v16)
  {
    id v14 = [v5 activityItemsConfigurationMetadataForKey:@"messageBody"];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        [v10 addObject:v14];
      }
    }
  }
  return v10;
}

- (BOOL)_hasItemsForActivityItemsConfiguration
{
  if ([(NSArray *)self->_activityItems count]) {
    return 1;
  }
  id v4 = [(UIActivityItemsConfiguration *)self itemProvidersForActivityItemsConfiguration];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (NSArray)_activityItems
{
  uint64_t v2 = (void *)[(NSArray *)self->_activityItems copy];
  return (NSArray *)v2;
}

- (NSArray)_excludedActivityTypes
{
  uint64_t v2 = (void *)[(NSArray *)self->_excludedActivityTypes copy];
  return (NSArray *)v2;
}

- (void)_setExcludedActivityTypes:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  excludedActivityTypes = self->_excludedActivityTypes;
  self->_excludedActivityTypes = v4;
}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)localObject
{
}

- (NSArray)supportedInteractions
{
  return self->_supportedInteractions;
}

- (void)setSupportedInteractions:(NSArray *)supportedInteractions
{
}

- (void)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(void *)metadataProvider
{
}

- (void)perItemMetadataProvider
{
  return self->_perItemMetadataProvider;
}

- (void)setPerItemMetadataProvider:(void *)perItemMetadataProvider
{
}

- (void)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(void *)previewProvider
{
}

- (void)applicationActivitiesProvider
{
  return self->_applicationActivitiesProvider;
}

- (void)setApplicationActivitiesProvider:(void *)applicationActivitiesProvider
{
}

- (NSArray)_excludedInteractions
{
  return self->__excludedInteractions;
}

- (void)_setExcludedInteractions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__excludedInteractions, 0);
  objc_storeStrong(&self->_applicationActivitiesProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_perItemMetadataProvider, 0);
  objc_storeStrong(&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_supportedInteractions, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end