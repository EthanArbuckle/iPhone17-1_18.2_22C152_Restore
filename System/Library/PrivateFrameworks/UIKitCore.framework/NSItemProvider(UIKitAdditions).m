@interface NSItemProvider(UIKitAdditions)
+ (id)_uikit_bestMatchConformingToTypes:()UIKitAdditions availableTypes:;
- (BOOL)hasDerivedRepresentations;
- (double)preferredPresentationSize;
- (id)_highestFidelityClassForLoading:()UIKitAdditions;
- (id)_loadObjectOfClass:()UIKitAdditions userInfo:completionHandler:;
- (id)dataAvailabilityByTypeIdentifier;
- (id)derivedRepresentationByTypeIdentfier;
- (id)teamData;
- (uint64_t)isDataAvailableImmediatelyForTypeIdentifier:()UIKitAdditions;
- (uint64_t)isDerivedRepresentationForTypeIdentifier:()UIKitAdditions;
- (uint64_t)preferredPresentationStyle;
- (void)_NSItemProviderDidRegisterObject:()UIKitAdditions;
- (void)registerFileProviderItemForTypeIdentifier:()UIKitAdditions visibility:loadHandler:;
- (void)registerFileRepresentationForTypeIdentifier:()UIKitAdditions dataAvailableImmediately:visibility:loadHandler:;
- (void)setDataAvailability:()UIKitAdditions forTypeIdentifier:;
- (void)setDerivedRepresentation:()UIKitAdditions forTypeIdentifier:;
- (void)setPreferredPresentationSize:()UIKitAdditions;
- (void)setPreferredPresentationStyle:()UIKitAdditions;
- (void)setTeamData:()UIKitAdditions;
@end

@implementation NSItemProvider(UIKitAdditions)

- (void)setTeamData:()UIKitAdditions
{
  id v6 = a3;
  if ((unint64_t)[v6 length] > 0x2000)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSItemProvider+UIKitAdditions.m", 44, @"teamData may not exceed %lu bytes in length.", 0x2000);
  }
  [a1 _setMetadataValue:v6 forKey:*MEMORY[0x1E4F88230]];
}

- (id)teamData
{
  v1 = [a1 _metadataValueForKey:*MEMORY[0x1E4F88230]];
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v1 = 0;
    }
  }
  return v1;
}

- (double)preferredPresentationSize
{
  v1 = [a1 _metadataValueForKey:*MEMORY[0x1E4F88218]];
  [v1 CGSizeValue];
  double v3 = v2;

  return v3;
}

- (void)setPreferredPresentationSize:()UIKitAdditions
{
  if (a2 == *MEMORY[0x1E4F1DB30] && a3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v5 = *MEMORY[0x1E4F88218];
    [a1 _setMetadataValue:0 forKey:v5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [a1 _setMetadataValue:v6 forKey:*MEMORY[0x1E4F88218]];
  }
}

- (void)_NSItemProviderDidRegisterObject:()UIKitAdditions
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 preferredPresentationSizeForItemProvider];
    objc_msgSend(a1, "setPreferredPresentationSize:");
  }
}

- (uint64_t)preferredPresentationStyle
{
  v1 = [a1 _metadataValueForKey:*MEMORY[0x1E4F88220]];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setPreferredPresentationStyle:()UIKitAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setMetadataValue:v2 forKey:*MEMORY[0x1E4F88220]];
}

- (void)registerFileProviderItemForTypeIdentifier:()UIKitAdditions visibility:loadHandler:
{
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F881E8] instancesRespondToSelector:sel_initWithFPItem_])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke;
    v9[3] = &unk_1E52FF388;
    id v10 = v8;
    objc_msgSend(a1, "_addRepresentationType_v2:preferredRepresentation:loader:", v7, 1, v9);
  }
}

- (void)registerFileRepresentationForTypeIdentifier:()UIKitAdditions dataAvailableImmediately:visibility:loadHandler:
{
  id v6 = a3;
  objc_msgSend(a1, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:");
  if (a4) {
    [a1 setDataAvailability:1 forTypeIdentifier:v6];
  }
}

- (uint64_t)isDataAvailableImmediatelyForTypeIdentifier:()UIKitAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 dataAvailabilityByTypeIdentifier];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

- (void)setDataAvailability:()UIKitAdditions forTypeIdentifier:
{
  id v10 = a4;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSItemProvider+UIKitAdditions.m", 131, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  uint64_t v7 = [a1 dataAvailabilityByTypeIdentifier];
  if (!v7)
  {
    uint64_t v7 = objc_opt_new();
    objc_setAssociatedObject(a1, &kDataAvailableImmediately, v7, (void *)0x301);
  }
  id v8 = [NSNumber numberWithBool:a3];
  [v7 setObject:v8 forKeyedSubscript:v10];
}

- (id)dataAvailabilityByTypeIdentifier
{
  return objc_getAssociatedObject(a1, &kDataAvailableImmediately);
}

- (uint64_t)isDerivedRepresentationForTypeIdentifier:()UIKitAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 derivedRepresentationByTypeIdentfier];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

- (BOOL)hasDerivedRepresentations
{
  v1 = [a1 derivedRepresentationByTypeIdentfier];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (void)setDerivedRepresentation:()UIKitAdditions forTypeIdentifier:
{
  id v10 = a4;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSItemProvider+UIKitAdditions.m", 158, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  uint64_t v7 = [a1 derivedRepresentationByTypeIdentfier];
  if (!v7)
  {
    uint64_t v7 = objc_opt_new();
    objc_setAssociatedObject(a1, &kDataDerivedRepresentation, v7, (void *)0x301);
  }
  id v8 = [NSNumber numberWithBool:a3];
  [v7 setObject:v8 forKeyedSubscript:v10];
}

- (id)derivedRepresentationByTypeIdentfier
{
  return objc_getAssociatedObject(a1, &kDataDerivedRepresentation);
}

- (id)_highestFidelityClassForLoading:()UIKitAdditions
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F881B8] defaultRegistry];
  id v6 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v56;
    v36 = a1;
    v37 = v5;
    v42 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v56 != v39)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v41 = v7;
        v9 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
        if (objc_msgSend(a1, "canLoadObjectOfClass:", v9, v36, v37))
        {
          long long v53 = 0uLL;
          long long v54 = 0uLL;
          long long v51 = 0uLL;
          long long v52 = 0uLL;
          id v46 = [a1 registeredTypeIdentifiers];
          uint64_t v10 = [v46 countByEnumeratingWithState:&v51 objects:v66 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = *(void *)v52;
            uint64_t v43 = *(void *)v52;
            v44 = v9;
            do
            {
              uint64_t v14 = 0;
              uint64_t v45 = v11;
              do
              {
                if (*(void *)v52 != v13) {
                  objc_enumerationMutation(v46);
                }
                id v15 = *(id *)(*((void *)&v51 + 1) + 8 * v14);
                if (objc_opt_respondsToSelector())
                {
                  v16 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v15 allowUndeclared:1];
                  long long v59 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v62 = 0u;
                  v17 = [v9 readableTypeIdentifiersForItemProvider];
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v68 count:16];
                  if (v18)
                  {
                    uint64_t v19 = v18;
                    uint64_t v20 = *(void *)v60;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v19; ++i)
                      {
                        if (*(void *)v60 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        v22 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:*(void *)(*((void *)&v59 + 1) + 8 * i) allowUndeclared:1];
                        char v23 = [v16 conformsToType:v22];

                        if (v23)
                        {

                          v9 = v44;
                          v65[0] = v44;
                          v24 = [NSNumber numberWithInteger:v12];
                          v65[1] = v24;
                          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
                          [v42 addObject:v25];

                          goto LABEL_24;
                        }
                      }
                      uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v68 count:16];
                      if (v19) {
                        continue;
                      }
                      break;
                    }
                  }

                  v9 = v44;
LABEL_24:
                  uint64_t v13 = v43;
                  uint64_t v11 = v45;
                }
                else
                {
                }
                ++v12;
                ++v14;
              }
              while (v14 != v11);
              uint64_t v11 = [v46 countByEnumeratingWithState:&v51 objects:v66 count:16];
            }
            while (v11);
            a1 = v36;
            uint64_t v5 = v37;
            id v6 = v42;
          }
        }
        else
        {
          long long v49 = 0uLL;
          long long v50 = 0uLL;
          long long v47 = 0uLL;
          long long v48 = 0uLL;
          id v46 = [a1 registeredTypeIdentifiers];
          uint64_t v26 = [v46 countByEnumeratingWithState:&v47 objects:v64 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v48;
            uint64_t v29 = 0x10000;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v48 != v28) {
                  objc_enumerationMutation(v46);
                }
                if ([v5 canCoerceFromRepresentationConformingToType:*(void *)(*((void *)&v47 + 1) + 8 * j) toObjectOfClass:v9])
                {
                  v63[0] = v9;
                  v31 = [NSNumber numberWithInteger:v29 + j];
                  v63[1] = v31;
                  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
                  [v6 addObject:v32];
                }
              }
              uint64_t v27 = [v46 countByEnumeratingWithState:&v47 objects:v64 count:16];
              v29 += j;
            }
            while (v27);
          }
        }

        uint64_t v7 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v40);
  }

  if ([v6 count])
  {
    [v6 sortUsingComparator:&__block_literal_global_408];
    v33 = [v6 firstObject];
    v34 = [v33 firstObject];
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)_uikit_bestMatchConformingToTypes:()UIKitAdditions availableTypes:
{
  return _bestMatchConformingToTypes(a3, a4);
}

- (id)_loadObjectOfClass:()UIKitAdditions userInfo:completionHandler:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 registeredTypeIdentifiers];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [a3 readableTypeIdentifiersForItemProvider];
  uint64_t v13 = _bestMatchConformingToTypes(v12, v11);
  if (v13)
  {
    id v14 = (id)v13;
    id v15 = 0;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F881B8] defaultRegistry];
    v16 = [v15 acceptableRepresentationTypesForCreatingObjectOfClass:a3];
    _bestMatchConformingToTypes(v16, v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14) {
      goto LABEL_11;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v18 = objc_opt_respondsToSelector();
    if (v15) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [a3 _preferredRepresentationForItemProviderReadableTypeIdentifier:v14];
  char v18 = objc_opt_respondsToSelector();
  if (v17)
  {
LABEL_11:
    uint64_t v19 = [a1 loadObjectOfClass:a3 completionHandler:v9];
    goto LABEL_13;
  }
  if (v15) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v18 & 1) == 0)
  {
    id v15 = 0;
    goto LABEL_11;
  }
LABEL_12:
  char v20 = v18 & 1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__NSItemProvider_UIKitAdditions___loadObjectOfClass_userInfo_completionHandler___block_invoke;
  v22[3] = &unk_1E52FF3D0;
  id v15 = v15;
  id v23 = v15;
  uint64_t v27 = a3;
  id v14 = v14;
  id v24 = v14;
  char v28 = v20;
  id v25 = v8;
  id v26 = v9;
  uint64_t v19 = [a1 loadDataRepresentationForTypeIdentifier:v14 completionHandler:v22];

LABEL_13:
  return v19;
}

@end