@interface LSPropertyList(PBFAdditions)
- (BOOL)pbf_refreshDescriptorsFrequency;
- (id)_infoForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_displayNameLocalizationKeyForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_posterBoardPosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_roleForDynamicDescriptorIdentifier:()PBFAdditions;
- (id)pbf_roleForStaticDescriptorIdentifier:()PBFAdditions;
- (id)pbf_staticDescriptorIdentifiers;
- (id)pbf_staticDescriptorsDictionary;
- (id)pbf_staticSnapshotKeyForIdentifier:()PBFAdditions definition:;
- (id)pbf_userInfoForStaticDescriptorIdentifier:()PBFAdditions;
- (uint64_t)pbf_hasStaticSnapshotMapping;
- (uint64_t)pbf_supportsDynamicDescriptors;
- (uint64_t)pbf_supportsGallery;
@end

@implementation LSPropertyList(PBFAdditions)

- (uint64_t)pbf_supportsGallery
{
  uint64_t v2 = *MEMORY[0x1E4F92548];
  v3 = self;
  v4 = [a1 objectForKey:v2 ofClass:v3];

  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

- (uint64_t)pbf_supportsDynamicDescriptors
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PBFPosterRolesSupportedForDataStoreCurrentDeviceClass();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a1, "pf_supportedRoles", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        if (PFPosterRoleSupportsDynamicDescriptors()
          && ([v2 containsObject:v8] & 1) != 0)
        {

          uint64_t v10 = *MEMORY[0x1E4F92520];
          v11 = self;
          v3 = [a1 objectForKey:v10 ofClass:v11];

          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = [v3 BOOLValue];
          }
          else {
            uint64_t v9 = 1;
          }
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)pbf_refreshDescriptorsFrequency
{
  if ((objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled") & 1) != 0
    || !objc_msgSend(a1, "pbf_supportsDynamicDescriptors"))
  {
    return 0;
  }
  uint64_t v2 = *MEMORY[0x1E4F92518];
  v3 = self;
  uint64_t v4 = [a1 objectForKey:v2 ofClass:v3];

  BOOL v5 = ![v4 length] || objc_msgSend(v4, "caseInsensitiveCompare:", @"NEVER");
  return v5;
}

- (id)pbf_staticDescriptorsDictionary
{
  uint64_t v2 = *MEMORY[0x1E4F92540];
  v3 = self;
  uint64_t v4 = [a1 objectForKey:v2 ofClass:v3];

  return v4;
}

- (id)pbf_staticDescriptorIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
  uint64_t v2 = [v1 allKeys];
  v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = [v2 sortedArrayUsingComparator:&__block_literal_global_138];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v1 objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:@"sort_relative_index"];

        if (v10)
        {

          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke_2;
          v12[3] = &unk_1E69838B8;
          id v13 = v1;
          id v14 = v4;
          id v5 = v4;
          uint64_t v4 = [v5 sortedArrayUsingComparator:v12];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)pbf_displayNameLocalizationKeyForStaticDescriptorIdentifier:()PBFAdditions
{
  v1 = objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  uint64_t v2 = objc_msgSend(v1, "bs_safeStringForKey:", *MEMORY[0x1E4F92528]);

  return v2;
}

- (id)pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  id v4 = a3;
  id v5 = [a1 _infoForStaticDescriptorIdentifier:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F92530]];
  id v11 = 0;
  uint64_t v7 = [MEMORY[0x1E4F4B270] galleryOptionsFromDictionaryRepresentation:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    uint64_t v9 = PBFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(LSPropertyList(PBFAdditions) *)(uint64_t)v4 pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:v9];
    }
  }
  return v7;
}

- (id)pbf_posterBoardPosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  v1 = objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F92530]];
  v3 = [MEMORY[0x1E4F92660] galleryOptionsFromDictionaryRepresentation:v2];

  return v3;
}

- (id)pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions
{
  v1 = objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  uint64_t v2 = [v1 objectForKeyedSubscript:@"PRStaticDescriptorSnapshot"];
  v3 = [v2 objectForKey:@"Hero"];

  if (v3)
  {
    id v4 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F92530]];
    id v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = [MEMORY[0x1E4F92658] lookUpInfoForAssetCatalogIdentifier:v3];
    uint64_t v7 = [MEMORY[0x1E4F92660] galleryOptionsFromDictionaryRepresentation:v5];
    id v8 = objc_msgSend(MEMORY[0x1E4F92660], "galleryOptionsWithAssetLookupInfo:galleryPresentationStyle:", v6, objc_msgSend(v7, "presentationStyle"));
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)pbf_userInfoForStaticDescriptorIdentifier:()PBFAdditions
{
  v1 = objc_msgSend(a1, "_infoForStaticDescriptorIdentifier:");
  uint64_t v2 = objc_msgSend(v1, "bs_safeDictionaryForKey:", *MEMORY[0x1E4F92538]);

  return v2;
}

- (id)pbf_roleForStaticDescriptorIdentifier:()PBFAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "pf_supportedRoles");
  if ([v5 count] == 1)
  {
    id v6 = [v5 anyObject];
  }
  else
  {
    uint64_t v7 = [a1 _infoForStaticDescriptorIdentifier:v4];
    id v8 = [v7 objectForKeyedSubscript:@"PRStaticDescriptorRole"];
    if (PFPosterRoleIsValid() && [v5 containsObject:v8])
    {
      id v6 = v8;
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F1CFF8];
      uint64_t v10 = self;
      id v11 = [a1 objectForKey:v9 ofClass:v10];

      PRPosterRoleLookupForExtensionBundleIdentifier(v11, v4);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)pbf_roleForDynamicDescriptorIdentifier:()PBFAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "pf_supportedRoles");
  if ([v5 count] == 1)
  {
    id v6 = [v5 anyObject];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F1CFF8];
    id v8 = self;
    uint64_t v9 = [a1 objectForKey:v7 ofClass:v8];

    id v6 = PRPosterRoleLookupForExtensionBundleIdentifier(v9, v4);
  }
  return v6;
}

- (id)_infoForStaticDescriptorIdentifier:()PBFAdditions
{
  uint64_t v4 = *MEMORY[0x1E4F92540];
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = [a1 objectForKey:v4 ofClass:v6];
  id v8 = [v7 objectForKey:v5];

  return v8;
}

- (uint64_t)pbf_hasStaticSnapshotMapping
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(a1, "pbf_staticDescriptorIdentifiers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
        uint64_t v9 = [v8 objectForKey:v7];

        uint64_t v10 = [v9 objectForKey:@"PRStaticDescriptorSnapshot"];

        if (v10)
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (id)pbf_staticSnapshotKeyForIdentifier:()PBFAdditions definition:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(a1, "pbf_hasStaticSnapshotMapping"))
  {
    id v8 = objc_msgSend(a1, "pbf_staticDescriptorsDictionary");
    uint64_t v9 = [v8 objectForKey:v6];

    uint64_t v10 = [v9 objectForKey:@"PRStaticDescriptorSnapshot"];
    if (v10)
    {
      uint64_t v11 = [v7 uniqueIdentifier];
      v12 = PBFPlistKeyForSnapshotDefinitionIdentifier(v11);

      long long v13 = [v10 objectForKey:v12];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          long long v16 = v15;
        }
        else {
          long long v16 = 0;
        }
      }
      else
      {
        long long v16 = 0;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:()PBFAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "error converting gallery options dictionary for descriptor identifier (%@) to proactive gallery options: %@", (uint8_t *)&v3, 0x16u);
}

@end