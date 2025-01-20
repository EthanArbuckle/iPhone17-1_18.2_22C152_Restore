@interface CHSWidgetExtensionProvider(SBHUtilities)
- (id)sbh_controlDescriptorsByExtensionIdentifier;
- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities;
- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities gridSizeClassDomain:;
- (id)sbh_descriptorForWidgetIdentifiable:()SBHUtilities;
- (id)sbh_descriptorWithKind:()SBHUtilities extensionBundleIdentifier:containerBundleIdentifier:;
- (id)sbh_descriptors;
- (id)sbh_descriptorsByExtensionIdentifier;
- (id)sbh_extensionForWidget:()SBHUtilities;
- (id)sbh_extensions;
@end

@implementation CHSWidgetExtensionProvider(SBHUtilities)

- (id)sbh_descriptors
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "sbh_extensions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) orderedWidgetDescriptors];
        [v2 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_descriptorsByExtensionIdentifier
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a1, "sbh_extensions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 identity];
        long long v10 = [v9 extensionBundleIdentifier];
        long long v11 = [v8 orderedWidgetDescriptors];
        [v2 setObject:v11 forKey:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_descriptorForWidgetIdentifiable:()SBHUtilities
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = objc_msgSend(a1, "sbh_extensions");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v11 = objc_msgSend(v10, "orderedWidgetDescriptors", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v16 matches:v4])
              {
                id v17 = v16;

                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v17 = 0;
    }
    while (v7);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)sbh_extensions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "containers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) allExtensions];
        [v2 unionSet:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_extensionForWidget:()SBHUtilities
{
  uint64_t v4 = [a3 extensionIdentity];
  uint64_t v5 = [v4 extensionBundleIdentifier];
  uint64_t v6 = [a1 widgetExtensionContainerForExtensionBundleIdentifier:v5];

  uint64_t v7 = [v6 extensionForExtensionIdentity:v4];

  return v7;
}

- (id)sbh_descriptorWithKind:()SBHUtilities extensionBundleIdentifier:containerBundleIdentifier:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  id v30 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v9 = objc_msgSend(a1, "sbh_extensions");
  uint64_t v27 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v27)
  {
    uint64_t v10 = *(void *)v38;
    long long v11 = v31;
    uint64_t v29 = v9;
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v28 = v12;
        long long v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        obuint64_t j = [v13 orderedWidgetDescriptors];
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v34 != v16) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              long long v19 = [v18 extensionIdentity];
              long long v20 = [v18 kind];
              if ([v20 isEqualToString:v8])
              {
                long long v21 = [v19 extensionBundleIdentifier];
                if ([v21 isEqualToString:v11])
                {
                  long long v22 = [v19 containerBundleIdentifier];
                  char v23 = [v22 isEqualToString:v30];

                  long long v11 = v31;
                  if (v23)
                  {
                    id v24 = v18;

                    v9 = v29;
                    goto LABEL_22;
                  }
                }
                else
                {
                }
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v15);
        }

        uint64_t v12 = v28 + 1;
        v9 = v29;
        uint64_t v10 = v26;
      }
      while (v28 + 1 != v27);
      id v24 = 0;
      uint64_t v27 = [v29 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }
  else
  {
    id v24 = 0;
    long long v11 = v31;
  }
LABEL_22:

  return v24;
}

- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities
{
  id v4 = a3;
  uint64_t v5 = +[SBHIconGridSizeClassDomain globalDomain];
  uint64_t v6 = objc_msgSend(a1, "sbh_defaultDescriptorForContainerBundleIdentifier:gridSizeClassDomain:", v4, v5);

  return v6;
}

- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities gridSizeClassDomain:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 widgetExtensionContainerForContainerBundleIdentifier:a3];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 localExtensions];
    if ([v9 count])
    {
      uint64_t v10 = [v9 firstObject];
      [v10 orderedWidgetDescriptors];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v6, "filterKnownCHSWidgetFamilies:", objc_msgSend(v15, "supportedFamilies", (void)v17)))
            {
              id v12 = v15;
              goto LABEL_14;
            }
          }
          id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)sbh_controlDescriptorsByExtensionIdentifier
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a1, "sbh_extensions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 identity];
        uint64_t v10 = [v9 extensionBundleIdentifier];
        id v11 = [v8 orderedControlDescriptors];
        if ([v11 count]) {
          [v2 setObject:v11 forKey:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

@end