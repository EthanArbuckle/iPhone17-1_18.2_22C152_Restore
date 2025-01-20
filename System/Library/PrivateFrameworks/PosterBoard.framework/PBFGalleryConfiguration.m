@interface PBFGalleryConfiguration
- (NSDictionary)dynamicDescriptorsByExtensionIdentifier;
- (NSDictionary)extensionsByIdentifier;
- (NSDictionary)staticDescriptorsByExtensionIdentifier;
- (NSOrderedSet)sectionIdentifiers;
- (NSSet)posterPreviews;
- (PBFComplicationSnapshotProviding)complicationSnapshotProvider;
- (PBFGalleryConfiguration)init;
- (PBFGalleryConfiguration)initWithSuggestedLayout:(id)a3 dynamicDescriptorsByExtensionIdentifier:(id)a4 staticDescriptorsByExtensionIdentifier:(id)a5 extensionsByIdentifier:(id)a6;
- (PBFPosterSnapshotProviding)snapshotProvider;
- (PFPosterExtensionProvider)extensionProvider;
- (PRSPosterGalleryLayout)suggestedLayout;
- (id)_posterDescriptorLookupInfoForItem:(id)a3;
- (id)_posterDescriptorLookupInfoForPreviewItem:(id)a3;
- (id)complicationSnapshotRequests;
- (id)gallerySnapshotRequestsForDisplayContexts:(id)a3;
- (id)itemsForSectionWithIdentifier:(id)a3;
- (id)posterPreviewForUniqueIdentifier:(id)a3;
- (id)posterSnapshotRequestsForContext:(id)a3;
- (id)posterSnapshotRequestsForExtensionBundleIdentifier:(id)a3 context:(id)a4;
- (id)posterSnapshotRequestsForPreview:(id)a3 context:(id)a4;
- (id)previewForItem:(id)a3 section:(id)a4;
- (id)prewarmGallerySnapshotRequestsForDisplayContext:(id)a3;
- (id)sectionForSectionIdentifier:(id)a3;
- (id)snapshotURLsForContext:(id)a3;
- (id)snapshotURLsForPathIdentityForContext:(id)a3;
- (void)_hydrateSectionIdentifiersIfNeeded;
- (void)dealloc;
- (void)enumeratePreviews:(id)a3;
- (void)fetchComplicationsForPreview:(id)a3 completion:(id)a4;
- (void)prewarmGallerySnapshotsWithCompletion:(id)a3;
- (void)setComplicationSnapshotProvider:(id)a3;
- (void)setExtensionProvider:(id)a3;
- (void)setSnapshotProvider:(id)a3;
@end

@implementation PBFGalleryConfiguration

- (PBFGalleryConfiguration)init
{
  result = (PBFGalleryConfiguration *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (result)
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138413314;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    v15 = @"PBFGalleryConfiguration.m";
    __int16 v16 = 1024;
    int v17 = 118;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v8, 0x30u);
  }
  __break(0);
  return result;
}

- (PBFGalleryConfiguration)initWithSuggestedLayout:(id)a3 dynamicDescriptorsByExtensionIdentifier:(id)a4 staticDescriptorsByExtensionIdentifier:(id)a5 extensionsByIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  NSClassFromString(&cfstr_Prspostergalle.isa);
  if (!v14)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
LABEL_35:
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3256550);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterGalleryLayoutClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32565B4);
  }

  id v15 = v11;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v15)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3256618);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325667CLL);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v16)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32566E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3256744);
  }

  id v17 = v13;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v17)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.4();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32567A8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryConfiguration initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:].cold.4();
    }
    goto LABEL_35;
  }

  v37.receiver = self;
  v37.super_class = (Class)PBFGalleryConfiguration;
  v18 = [(PBFGalleryConfiguration *)&v37 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    suggestedLayout = v18->_suggestedLayout;
    v18->_suggestedLayout = (PRSPosterGalleryLayout *)v19;

    uint64_t v21 = [v15 copy];
    dynamicDescriptorsByExtensionIdentifier = v18->_dynamicDescriptorsByExtensionIdentifier;
    v18->_dynamicDescriptorsByExtensionIdentifier = (NSDictionary *)v21;

    uint64_t v23 = [v16 copy];
    staticDescriptorsByExtensionIdentifier = v18->_staticDescriptorsByExtensionIdentifier;
    v18->_staticDescriptorsByExtensionIdentifier = (NSDictionary *)v23;

    uint64_t v25 = [v17 copy];
    extensionsByIdentifier = v18->_extensionsByIdentifier;
    v18->_extensionsByIdentifier = (NSDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    posterDescriptorLookupInfoForItemIdentifier = v18->_posterDescriptorLookupInfoForItemIdentifier;
    v18->_posterDescriptorLookupInfoForItemIdentifier = (NSMutableDictionary *)v27;
  }
  return v18;
}

- (void)dealloc
{
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = 0;

  sectionIdentifierToSectionMap = self->_sectionIdentifierToSectionMap;
  self->_sectionIdentifierToSectionMap = 0;

  sectionIdentifierToItems = self->_sectionIdentifierToItems;
  self->_sectionIdentifierToItems = 0;

  [(NSMutableDictionary *)self->_posterDescriptorLookupInfoForItemIdentifier removeAllObjects];
  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  self->_posterDescriptorLookupInfoForItemIdentifier = 0;

  previewIdentifierToPreview = self->_previewIdentifierToPreview;
  self->_previewIdentifierToPreview = 0;

  previews = self->_previews;
  self->_previews = 0;

  suggestedLayout = self->_suggestedLayout;
  self->_suggestedLayout = 0;

  dynamicDescriptorsByExtensionIdentifier = self->_dynamicDescriptorsByExtensionIdentifier;
  self->_dynamicDescriptorsByExtensionIdentifier = 0;

  staticDescriptorsByExtensionIdentifier = self->_staticDescriptorsByExtensionIdentifier;
  self->_staticDescriptorsByExtensionIdentifier = 0;

  extensionsByIdentifier = self->_extensionsByIdentifier;
  self->_extensionsByIdentifier = 0;

  v13.receiver = self;
  v13.super_class = (Class)PBFGalleryConfiguration;
  [(PBFGalleryConfiguration *)&v13 dealloc];
}

- (NSSet)posterPreviews
{
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  previews = self->_previews;
  return [(NSOrderedSet *)previews set];
}

- (NSOrderedSet)sectionIdentifiers
{
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  sectionIdentifiers = self->_sectionIdentifiers;
  return sectionIdentifiers;
}

- (id)itemsForSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  v5 = [(NSDictionary *)self->_sectionIdentifierToItems objectForKey:v4];

  return v5;
}

- (id)posterPreviewForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  v5 = [(NSDictionary *)self->_previewIdentifierToPreview objectForKey:v4];

  return v5;
}

- (id)sectionForSectionIdentifier:(id)a3
{
  id v4 = a3;
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  v5 = [(NSDictionary *)self->_sectionIdentifierToSectionMap objectForKeyedSubscript:v4];

  return v5;
}

- (id)posterSnapshotRequestsForPreview:(id)a3 context:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v5];
  int v8 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:v5 context:v6 definition:v7];

  if ([v5 galleryDisplayStyle] == 1)
  {
    v9 = +[PBFPosterSnapshotDefinition gallerySnapshotKeyFrameDefinition];
    id v10 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:v5 context:v6 definition:v9];

    v13[0] = v8;
    v13[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    v14[0] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }

  return v11;
}

- (id)posterSnapshotRequestsForContext:(id)a3
{
  id v4 = a3;
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  id v5 = [(NSOrderedSet *)self->_previews array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __60__PBFGalleryConfiguration_posterSnapshotRequestsForContext___block_invoke;
  objc_super v13 = &unk_1E6983288;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_map:", &v10);
  int v8 = objc_msgSend(v7, "bs_flatten", v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __60__PBFGalleryConfiguration_posterSnapshotRequestsForContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) posterSnapshotRequestsForPreview:a2 context:*(void *)(a1 + 40)];
}

- (id)complicationSnapshotRequests
{
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  v3 = [(NSOrderedSet *)self->_previews array];
  id v4 = objc_msgSend(v3, "bs_compactMap:", &__block_literal_global_17);

  id v5 = objc_msgSend(v4, "bs_flatten");

  return v5;
}

id __55__PBFGalleryConfiguration_complicationSnapshotRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PBFComplicationSnapshotRequest requestsForPreview:a2];
}

- (id)snapshotURLsForPathIdentityForContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E10];
  id v5 = a3;
  id v6 = [v4 strongToStrongObjectsMapTable];
  v7 = [(PBFGalleryConfiguration *)self posterSnapshotRequestsForContext:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PBFGalleryConfiguration_snapshotURLsForPathIdentityForContext___block_invoke;
  v10[3] = &unk_1E69832B0;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __65__PBFGalleryConfiguration_snapshotURLsForPathIdentityForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "definitions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v9 = [v3 snapshotURLForDefinition:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
        uint64_t v10 = *(void **)(a1 + 32);
        id v11 = [v3 path];
        id v12 = [v11 serverIdentity];
        [v10 setObject:v9 forKey:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)snapshotURLsForContext:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(PBFGalleryConfiguration *)self snapshotURLsForPathIdentityForContext:a3];
  uint64_t v5 = [v4 objectEnumerator];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = [v3 setWithArray:v6];

  return v7;
}

- (id)posterSnapshotRequestsForExtensionBundleIdentifier:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PBFGalleryConfiguration *)self posterPreviews];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__PBFGalleryConfiguration_posterSnapshotRequestsForExtensionBundleIdentifier_context___block_invoke;
  v23[3] = &unk_1E69832D8;
  id v9 = v6;
  id v24 = v9;
  uint64_t v10 = objc_msgSend(v8, "bs_filter:", v23);

  id v11 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = -[PBFGalleryConfiguration posterSnapshotRequestsForPreview:context:](self, "posterSnapshotRequestsForPreview:context:", *(void *)(*((void *)&v19 + 1) + 8 * i), v7, (void)v19);
        [v11 addObjectsFromArray:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }

  return v11;
}

uint64_t __86__PBFGalleryConfiguration_posterSnapshotRequestsForExtensionBundleIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 posterDescriptorLookupInfo];
  id v4 = [v3 posterDescriptorExtension];
  uint64_t v5 = [v4 posterExtensionBundleIdentifier];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (id)gallerySnapshotRequestsForDisplayContexts:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PBFGalleryConfiguration_gallerySnapshotRequestsForDisplayContexts___block_invoke;
  v6[3] = &unk_1E6983300;
  v6[4] = self;
  id v3 = objc_msgSend(a3, "bs_compactMap:", v6);
  id v4 = objc_msgSend(v3, "bs_flatten");

  return v4;
}

uint64_t __69__PBFGalleryConfiguration_gallerySnapshotRequestsForDisplayContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) posterSnapshotRequestsForContext:a2];
}

- (id)prewarmGallerySnapshotRequestsForDisplayContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PBFGalleryConfiguration *)self _hydrateSectionIdentifiersIfNeeded];
  uint64_t v5 = [(PBFGalleryConfiguration *)self sectionIdentifiers];
  if ([v5 count])
  {
    long long v22 = v5;
    uint64_t v6 = [(PBFGalleryConfiguration *)self sectionIdentifiers];
    id v7 = (void *)[v6 mutableCopy];

    [v7 removeObjectAtIndex:0];
    uint64_t v8 = PFCurrentDeviceClass();
    if (v8 == 1) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 3;
    }
    uint64_t v10 = 6;
    if (v8 == 1) {
      uint64_t v10 = 16;
    }
    unint64_t v27 = v10;
    unint64_t v28 = v9;
    id v11 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v7;
    uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v31;
      uint64_t v25 = self;
LABEL_9:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v12;
        uint64_t v13 = [(PBFGalleryConfiguration *)self itemsForSectionWithIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * v12)];
        unint64_t v14 = [v13 count];
        if (v28 >= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v28;
        }
        if (v15)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            id v17 = [v13 objectAtIndexedSubscript:i];
            uint64_t v18 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v17];
            long long v19 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:v17 context:v4 definition:v18];

            objc_msgSend(v11, "bs_safeAddObject:", v19);
          }
        }
        unint64_t v20 = [v11 count];

        self = v25;
        if (v20 >= v27) {
          break;
        }
        uint64_t v12 = v29 + 1;
        if (v29 + 1 == v26)
        {
          uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v26) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    uint64_t v5 = v22;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)prewarmGallerySnapshotsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v6 = objc_opt_new();
  id v7 = [(PBFGalleryConfiguration *)self complicationSnapshotProvider];
  uint64_t v8 = (void *)MEMORY[0x1D9433EF0]();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6981B50;
  id v9 = v6;
  id v23 = v9;
  uint64_t v10 = v5;
  uint64_t v24 = v10;
  id v11 = _Block_copy(aBlock);
  if (v7)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAA0];
    uint64_t v13 = [(PBFGalleryConfiguration *)self complicationSnapshotRequests];
    unint64_t v14 = [v12 orderedSetWithArray:v13];
    unint64_t v15 = [v14 array];

    if ([v15 count])
    {
      dispatch_group_enter(v10);
      long long v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      [v7 trimCachedSnapshotsToRequests:v16];

      [v7 fetchComplicationSnapshotsForRequests:v15 complicationSnapshotReceivedHandler:0 errorHandler:0 completionHandler:v11];
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke_2;
  v19[3] = &unk_1E6982420;
  id v20 = v9;
  id v21 = v4;
  id v17 = v4;
  id v18 = v9;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v19);
}

void __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__PBFGalleryConfiguration_prewarmGallerySnapshotsWithCompletion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4F28750];
    v8[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    dispatch_group_t v5 = [v2 errorWithDomain:@"com.apple.PosterBoard.galleryConfiguration.snapshotPrewarm" code:-1 userInfo:v4];
  }
  else
  {
    dispatch_group_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

- (void)enumeratePreviews:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    dispatch_group_t v5 = [(PBFGalleryConfiguration *)self sectionIdentifiers];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke;
    v6[3] = &unk_1E6983350;
    v6[4] = self;
    id v7 = v4;
    uint64_t v8 = v9;
    [v5 enumerateObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
}

void __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [*(id *)(a1 + 32) itemsForSectionWithIdentifier:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke_2;
  v10[3] = &unk_1E6983328;
  uint64_t v13 = a3;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __45__PBFGalleryConfiguration_enumeratePreviews___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v8 = a1[6];
  id v9 = a2;
  id v10 = [v7 indexPathForItem:a3 inSection:v8];
  (*(void (**)(void))(a1[4] + 16))();

  *a4 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
}

- (void)fetchComplicationsForPreview:(id)a3 completion:(id)a4
{
}

- (void)_hydrateSectionIdentifiersIfNeeded
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sectionIdentifiers)
  {
    long long v33 = v2;
    objc_super v37 = objc_opt_new();
    long long v30 = objc_opt_new();
    long long v31 = objc_opt_new();
    uint64_t v3 = objc_opt_new();
    long long v32 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v4 = [(PBFGalleryConfiguration *)v2 suggestedLayout];
    dispatch_group_t v5 = [v4 sections];

    uint64_t v36 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v45;
      id obj = v5;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(obj);
          }
          id v7 = NSString;
          id v8 = *(id *)(*((void *)&v44 + 1) + 8 * i);
          id v9 = [v8 localizedTitle];
          uint64_t v10 = [v8 type];
          id v11 = [v8 unityDescription];

          uint64_t v12 = [v7 stringWithFormat:@"'%@'-%lu-'%@'", v9, v10, v11];

          if (([v37 containsObject:v12] & 1) == 0)
          {
            uint64_t v13 = [v8 items];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __61__PBFGalleryConfiguration__hydrateSectionIdentifiersIfNeeded__block_invoke;
            v43[3] = &unk_1E6983378;
            v43[4] = v33;
            v43[5] = v8;
            v38 = objc_msgSend(v13, "bs_mapNoNulls:", v43);

            if ([v38 count])
            {
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v14 = v38;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v40;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v40 != v16) {
                      objc_enumerationMutation(v14);
                    }
                    id v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                    long long v19 = [v18 previewUniqueIdentifier];
                    [v3 setObject:v18 forKey:v19];
                  }
                  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
                }
                while (v15);
              }

              [v32 addObjectsFromArray:v14];
              [v37 addObject:v12];
              [v31 setObject:v8 forKeyedSubscript:v12];
              [v30 setObject:v14 forKeyedSubscript:v12];
            }
          }
        }
        dispatch_group_t v5 = obj;
        uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v36);
    }

    uint64_t v20 = [v32 copy];
    previews = v33->_previews;
    v33->_previews = (NSOrderedSet *)v20;

    uint64_t v22 = [v37 copy];
    sectionIdentifiers = v33->_sectionIdentifiers;
    v33->_sectionIdentifiers = (NSOrderedSet *)v22;

    uint64_t v24 = [v31 copy];
    sectionIdentifierToSectionMap = v33->_sectionIdentifierToSectionMap;
    v33->_sectionIdentifierToSectionMap = (NSDictionary *)v24;

    uint64_t v26 = [v30 copy];
    sectionIdentifierToItems = v33->_sectionIdentifierToItems;
    v33->_sectionIdentifierToItems = (NSDictionary *)v26;

    uint64_t v28 = [v3 copy];
    previewIdentifierToPreview = v33->_previewIdentifierToPreview;
    v33->_previewIdentifierToPreview = (NSDictionary *)v28;

    v2 = v33;
  }
  objc_sync_exit(v2);
}

uint64_t __61__PBFGalleryConfiguration__hydrateSectionIdentifiersIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) previewForItem:a2 section:*(void *)(a1 + 40)];
}

- (id)_posterDescriptorLookupInfoForItem:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_group_t v5 = self->_posterDescriptorLookupInfoForItemIdentifier;
  objc_sync_enter(v5);
  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  id v7 = [v4 identifier];
  id v8 = [(NSMutableDictionary *)posterDescriptorLookupInfoForItemIdentifier objectForKey:v7];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v28 = [v4 extensionBundleIdentifier];
    unint64_t v27 = -[NSDictionary objectForKey:](self->_extensionsByIdentifier, "objectForKey:");
    if (v27)
    {
      uint64_t v26 = [v4 descriptorIdentifier];
      uint64_t v10 = [v26 stringByDeletingPathExtension];
      if (v26)
      {
        id v11 = [v26 pathExtension];
        int v12 = [v11 isEqual:@"STATIC"];

        if (v12)
        {
          long long v35 = 0uLL;
          long long v36 = 0uLL;
          long long v33 = 0uLL;
          long long v34 = 0uLL;
          uint64_t v13 = [(NSDictionary *)self->_staticDescriptorsByExtensionIdentifier objectForKey:v28];
          id v14 = (void *)[v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v34;
            while (2)
            {
              for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v34 != v15) {
                  objc_enumerationMutation(v13);
                }
                id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                id v18 = [v17 descriptorIdentifier];
                if (v18 && [v10 isEqualToString:v18])
                {
                  id v14 = +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:v17 extension:v27];
                  uint64_t v22 = self->_posterDescriptorLookupInfoForItemIdentifier;
                  id v23 = [v4 identifier];
                  [(NSMutableDictionary *)v22 setObject:v14 forKey:v23];
                  goto LABEL_30;
                }
              }
              id v14 = (void *)[v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          long long v31 = 0uLL;
          long long v32 = 0uLL;
          long long v29 = 0uLL;
          long long v30 = 0uLL;
          uint64_t v13 = [(NSDictionary *)self->_dynamicDescriptorsByExtensionIdentifier objectForKey:v28];
          id v14 = (void *)[v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v14)
          {
            uint64_t v19 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v30 != v19) {
                  objc_enumerationMutation(v13);
                }
                id v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
                id v18 = [v21 descriptorIdentifier];
                if (v18 && [v10 isEqualToString:v18])
                {
                  id v14 = +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:v21 extension:v27];
                  uint64_t v24 = self->_posterDescriptorLookupInfoForItemIdentifier;
                  id v23 = [v4 identifier];
                  [(NSMutableDictionary *)v24 setObject:v14 forKey:v23];
LABEL_30:

                  goto LABEL_31;
                }
              }
              id v14 = (void *)[v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
LABEL_31:

        id v9 = v14;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  objc_sync_exit(v5);

  return v9;
}

- (id)_posterDescriptorLookupInfoForPreviewItem:(id)a3
{
  posterDescriptorLookupInfoForItemIdentifier = self->_posterDescriptorLookupInfoForItemIdentifier;
  id v4 = [a3 previewUniqueIdentifier];
  dispatch_group_t v5 = [(NSMutableDictionary *)posterDescriptorLookupInfoForItemIdentifier objectForKey:v4];

  return v5;
}

- (id)previewForItem:(id)a3 section:(id)a4
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v87 = a4;
  v88 = [(PBFGalleryConfiguration *)self _posterDescriptorLookupInfoForItem:v6];
  if (!v88)
  {
    uint64_t v19 = 0;
    goto LABEL_57;
  }
  if (v87 && [v87 type] == 2)
  {
    v81 = [v87 unityDescription];
  }
  else
  {
    v81 = 0;
  }
  id v7 = [v6 modeUUID];
  if (v7
    && (id v8 = objc_alloc(MEMORY[0x1E4F29128]),
        [v6 modeUUID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = (void *)[v8 initWithUUIDString:v9],
        v9,
        v7,
        v10))
  {
    id v11 = [MEMORY[0x1E4F62278] sharedActivityManager];
    int v12 = [v11 availableActivities];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __50__PBFGalleryConfiguration_previewForItem_section___block_invoke;
    v89[3] = &unk_1E6980808;
    id v75 = v10;
    id v90 = v75;
    uint64_t v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v89);

    v85 = [v13 activityIdentifier];
    v82 = [v13 activitySymbolImageName];

    char v67 = 1;
  }
  else
  {
    char v67 = 0;
    id v75 = 0;
    v82 = 0;
    v85 = 0;
  }
  id v14 = [v6 subtitleComplication];
  v80 = complicationLookupInfoForPBFComplication(v14);

  uint64_t v15 = [v6 complications];
  v79 = objc_msgSend(v15, "bs_mapNoNulls:", &__block_literal_global_56);

  uint64_t v16 = [v6 landscapeComplications];
  v78 = objc_msgSend(v16, "bs_mapNoNulls:", &__block_literal_global_58);

  uint64_t v17 = [v6 layoutType];
  if ((unint64_t)(v17 - 1) > 2) {
    id v18 = &PBFComplicationLayoutTypeEmpty;
  }
  else {
    id v18 = off_1E69833D0[v17 - 1];
  }
  v77 = *v18;
  v84 = [v6 extensionBundleIdentifier];
  v83 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v84 error:0];
  v86 = [v83 URL];
  if (v86)
  {
    v74 = [v6 displayNameLocalizationKey];
    if (v74)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28B50], "pf_uniqueBundleWithURL:", v86);
      v70 = [v20 localizedStringForKey:v74 value:0 table:0];
    }
    else
    {
      v70 = [v6 localizedDisplayName];
    }
    id v21 = objc_alloc(MEMORY[0x1E4F92650]);
    uint64_t v22 = [v88 posterDescriptorPath];
    id v23 = (void *)[v21 _initWithPath:v22];

    v69 = [v23 displayNameLocalizationKey];
    uint64_t v24 = [v23 preferredTitleColors];
    uint64_t v25 = v24;
    if (v24)
    {
      id v72 = v24;
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F926E8] defaultTitleColor];
      v96[0] = v26;
      id v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
    }
    v76 = [v6 titleFontName];
    if (v76
      && (PRTimeFontIdentifiers(),
          unint64_t v27 = objc_claimAutoreleasedReturnValue(),
          int v28 = [v27 containsObject:v76],
          v27,
          v28)
      && (long long v29 = (void *)[objc_alloc(MEMORY[0x1E4F92710]) initWithTimeFontIdentifier:v76]) != 0)
    {
      id v66 = v29;
      id v73 = v66;
      [MEMORY[0x1E4F926E0] configurationWithTimeFontConfiguration:v66 extensionBundleURL:v86 systemItem:1];
    }
    else
    {
      long long v30 = [v23 preferredTimeFontConfigurationsWithExtensionBundleURL:v86];
      long long v31 = [v30 firstObject];
      long long v32 = v31;
      if (v31) {
        id v73 = v31;
      }
      else {
        id v73 = objc_alloc_init(MEMORY[0x1E4F92710]);
      }

      id v66 = 0;
      [MEMORY[0x1E4F926E0] configurationWithTimeFontConfiguration:v73 extensionBundleURL:v86 systemItem:1];
    v71 = };
    long long v33 = [MEMORY[0x1E4F926F8] sharedPreferences];
    char v34 = [v33 isAlternateCalendarEnabled];

    id v35 = objc_alloc(MEMORY[0x1E4F926E8]);
    long long v36 = [v72 firstObject];
    [v23 luminance];
    LOBYTE(v65) = v34;
    v68 = objc_msgSend(v35, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v71, 0, 0, v36, 0, 0, v65, 0);

    objc_super v37 = [v23 preferredHomeScreenConfiguration];
    v38 = v37;
    if (v37)
    {
      uint64_t v39 = [v37 allowsModifyingLegibilityBlur];
      uint64_t v40 = [v38 preferredStyle];
      if (v40 == 2) {
        uint64_t v41 = 1;
      }
      else {
        uint64_t v41 = 2 * (v40 == 3);
      }
      id v42 = objc_alloc(MEMORY[0x1E4F92680]);
      v43 = (void *)[objc_alloc(MEMORY[0x1E4F92690]) initWithLegibilityBlurEnabled:v40 == 1 allowsModifyingLegibilityBlur:v39];
      id v44 = objc_alloc_init(MEMORY[0x1E4F926D0]);
      id v45 = objc_alloc_init(MEMORY[0x1E4F92670]);
      id v46 = objc_alloc_init(MEMORY[0x1E4F92678]);
      id v47 = objc_alloc_init(MEMORY[0x1E4F92688]);
      v48 = (void *)[v42 initWithSelectedAppearanceType:v41 lockPosterAppearance:v43 solidColorAppearance:v44 gradientAppearance:v45 homePosterAppearance:v46 customizationConfiguration:v47];
    }
    else
    {
      v48 = [MEMORY[0x1E4F92680] defaultHomeScreenConfigurationForProvider:v84 role:*MEMORY[0x1E4F92790]];
    }
    char v49 = v67 ^ 1;
    if (!v85) {
      char v49 = 1;
    }
    if (v49) {
      uint64_t v50 = 0;
    }
    else {
      uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F92668]) initWithActivityIdentifier:v85 activityUUID:v75];
    }
    v51 = PBFPreviewTypeDefault;
    if (v87 && [v87 type] == 3)
    {
      v52 = &PBFPreviewTypeHero;
    }
    else
    {
      if (![v6 shouldShowAsShuffleStack]) {
        goto LABEL_47;
      }
      v52 = &PBFPreviewTypeSmartAlbum;
    }
    v53 = *v52;

    v51 = v53;
LABEL_47:
    v54 = objc_alloc_init(PBFGalleryOptions);
    v55 = [v6 proactiveRepresentation];
    [(PBFGalleryOptions *)v54 setSuggestedGalleryItem:v55];

    if (v85
      || ([v6 modeSemanticType],
          v56 = objc_claimAutoreleasedReturnValue(),
          BOOL v57 = v56 == 0,
          v56,
          v57))
    {
      if (v82) {
        [(PBFGalleryOptions *)v54 setModeSymbolImageName:v82];
      }
    }
    else
    {
      v58 = [v6 modeSemanticType];
      [(PBFGalleryOptions *)v54 setModeSemanticTypeToCreate:v58];

      v59 = [v6 modeSemanticType];
      uint64_t v60 = [v59 integerValue];
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x2020000000;
      v61 = (void (*)(uint64_t))getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr;
      v95 = getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr;
      if (!getDNDSystemImageNameForModeSemanticTypeSymbolLoc_ptr)
      {
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __getDNDSystemImageNameForModeSemanticTypeSymbolLoc_block_invoke;
        v91[3] = &unk_1E6980C98;
        v91[4] = &v92;
        __getDNDSystemImageNameForModeSemanticTypeSymbolLoc_block_invoke((uint64_t)v91);
        v61 = (void (*)(uint64_t))v93[3];
      }
      _Block_object_dispose(&v92, 8);
      if (!v61) {
        -[PBFGalleryConfiguration previewForItem:section:]();
      }
      v62 = v61(v60);
      [(PBFGalleryOptions *)v54 setModeSymbolImageName:v62];
    }
    v63 = [v6 identifier];
    uint64_t v19 = +[PBFGenericPosterPreview posterPreviewWithUniqueIdentifier:v63 displayNameLocalizationKey:v69 galleryLocalizedTitle:v70 galleryLocalizedDescription:v81 posterDescriptorLookupInfo:v88 titleStyleConfiguration:v68 focusConfiguration:v50 subtitleComplication:v80 suggestedComplications:v79 suggestedLandscapeComplications:v78 complicationLayoutType:v77 renderingConfiguration:0 homeScreenConfiguration:v48 previewType:v51 galleryOptions:v54];

    goto LABEL_56;
  }
  uint64_t v19 = 0;
LABEL_56:

LABEL_57:
  return v19;
}

uint64_t __50__PBFGalleryConfiguration_previewForItem_section___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 activityUniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __50__PBFGalleryConfiguration_previewForItem_section___block_invoke_2(uint64_t a1, void *a2)
{
  return complicationLookupInfoForPBFComplication(a2);
}

id __50__PBFGalleryConfiguration_previewForItem_section___block_invoke_3(uint64_t a1, void *a2)
{
  return complicationLookupInfoForPBFComplication(a2);
}

- (PBFPosterSnapshotProviding)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
}

- (PRSPosterGalleryLayout)suggestedLayout
{
  return self->_suggestedLayout;
}

- (NSDictionary)dynamicDescriptorsByExtensionIdentifier
{
  return self->_dynamicDescriptorsByExtensionIdentifier;
}

- (NSDictionary)staticDescriptorsByExtensionIdentifier
{
  return self->_staticDescriptorsByExtensionIdentifier;
}

- (NSDictionary)extensionsByIdentifier
{
  return self->_extensionsByIdentifier;
}

- (PBFComplicationSnapshotProviding)complicationSnapshotProvider
{
  return self->_complicationSnapshotProvider;
}

- (void)setComplicationSnapshotProvider:(id)a3
{
}

- (PFPosterExtensionProvider)extensionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);
  return (PFPosterExtensionProvider *)WeakRetained;
}

- (void)setExtensionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_extensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_staticDescriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicDescriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedLayout, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_previews, 0);
  objc_storeStrong((id *)&self->_previewIdentifierToPreview, 0);
  objc_storeStrong((id *)&self->_posterDescriptorLookupInfoForItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItems, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSuggestedLayout:dynamicDescriptorsByExtensionIdentifier:staticDescriptorsByExtensionIdentifier:extensionsByIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)previewForItem:section:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  SEL v1 = [NSString stringWithUTF8String:"NSString *soft_DNDSystemImageNameForModeSemanticType(DNDModeSemanticType)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFGalleryConfiguration.m", 50, @"%s", dlerror());

  __break(1u);
}

@end