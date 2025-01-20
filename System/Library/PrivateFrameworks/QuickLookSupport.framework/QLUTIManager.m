@interface QLUTIManager
+ (BOOL)contentType:(id)a3 conformsToContentTypeInArray:(id)a4;
+ (BOOL)contentTypeIsIWorkType:(id)a3;
+ (BOOL)contentTypeIsInternallyClaimed:(id)a3;
+ (BOOL)externalGeneratorPreferredForType:(id)a3;
+ (id)_preferredParentUTIof:(id)a3 fromParents:(id)a4;
+ (id)_recursiveValueInDictionary:(id)a3 forType:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7;
+ (id)_searchParentTypesFor:(id)a3 fromDictionary:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7;
+ (id)_selectParentUTIForUTI:(id)a3 fromParentUTIs:(id)a4 dictionary:(id)a5 alreadySeenUTIs:(id)a6 matchedValueToTypeBlock:(id)a7 validationBlock:(id)a8;
+ (id)claimedAVTypes;
+ (id)claimedCSVTypes;
+ (id)claimedCalendarTypes;
+ (id)claimedContactTypes;
+ (id)claimedImageTypes;
+ (id)claimedLivePhotoTypes;
+ (id)claimedOfficeTypes;
+ (id)claimedPDFTypes;
+ (id)claimedTextTypes;
+ (id)claimedWebViewTypes;
+ (id)claimediWorkTypes;
+ (id)findAndStoreValueInTypeKeyedDictionary:(id)a3 forType:(id)a4 withDescription:(id)a5 withQueue:(id)a6 validationBlock:(id)a7;
+ (id)iWorkTypes;
+ (id)internallyClaimedTypes;
+ (id)screentimeiWorkBundleForUTI:(id)a3;
+ (id)textGeneratorSupportedTypes;
+ (id)typesForWhichExternalGeneratorsArePreferred;
+ (id)valueInTypeKeyedDictionary:(id)a3 forType:(id)a4;
@end

@implementation QLUTIManager

uint64_t __57__QLUTIManager_contentType_conformsToContentTypeInArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) conformsToType:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)contentType:(id)a3 conformsToContentTypeInArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__QLUTIManager_contentType_conformsToContentTypeInArray___block_invoke;
  v10[3] = &unk_2642F23C8;
  id v7 = v5;
  id v11 = v7;
  v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (BOOL)contentTypeIsIWorkType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  id v5 = [(id)objc_opt_class() iWorkTypes];
  LOBYTE(v4) = [v4 contentType:v3 conformsToContentTypeInArray:v5];

  return (char)v4;
}

+ (id)iWorkTypes
{
  if (iWorkTypes_once != -1) {
    dispatch_once(&iWorkTypes_once, &__block_literal_global_200);
  }
  v2 = (void *)iWorkTypes_iWorkTypes;
  return v2;
}

+ (BOOL)contentTypeIsInternallyClaimed:(id)a3
{
  id v4 = a3;
  id v5 = [a1 internallyClaimedTypes];
  id v6 = [v4 identifier];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (id)internallyClaimedTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__QLUTIManager_internallyClaimedTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internallyClaimedTypes_onceToken != -1) {
    dispatch_once(&internallyClaimedTypes_onceToken, block);
  }
  v2 = (void *)internallyClaimedTypes__internallyClaimedTypes;
  return v2;
}

+ (id)valueInTypeKeyedDictionary:(id)a3 forType:(id)a4
{
  return (id)[a1 _recursiveValueInDictionary:a3 forType:a4 alreadySeenUTIs:0 matchedValueToTypeBlock:0 validationBlock:0];
}

+ (id)findAndStoreValueInTypeKeyedDictionary:(id)a3 forType:(id)a4 withDescription:(id)a5 withQueue:(id)a6 validationBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = a6;
  id v15 = a7;
  char v16 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  if (v11 && v12)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke;
    v23[3] = &unk_2642F2338;
    v28 = &v29;
    id v24 = v11;
    id v25 = v12;
    id v26 = v13;
    id v27 = v15;
    v17 = (void (**)(void))MEMORY[0x21D45D660](v23);
    v18 = v17;
    if (v14)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_3;
      v21[3] = &unk_2642F2360;
      v22 = v17;
      dispatch_sync(v14, v21);
    }
    else
    {
      v17[2](v17);
    }

    char v16 = (void *)v30[5];
  }
  id v19 = v16;
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_2;
  v7[3] = &unk_2642F2310;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  uint64_t v4 = +[QLUTIManager _recursiveValueInDictionary:v2 forType:v3 alreadySeenUTIs:0 matchedValueToTypeBlock:v7 validationBlock:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = _qlsLogHandle;
  if (v7)
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v8 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_217F31000, v8, OS_LOG_TYPE_INFO, "Getting %@ for '%@' from UTI '%@' #UTI", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
  else
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v8 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_217F31000, v8, OS_LOG_TYPE_INFO, "Caching NSNULL as %@ for '%@' #UTI", (uint8_t *)&v14, 0x16u);
    }
    id v11 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v6];
  }
  objc_opt_class();
  id v12 = v7;
  if (objc_opt_isKindOfClass())
  {

    id v12 = 0;
  }

  return v12;
}

uint64_t __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_searchParentTypesFor:(id)a3 fromDictionary:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 lowercaseString];
  if ([v17 hasPrefix:@"dyn."])
  {
    __int16 v18 = (void *)_UTTypeCopyPedigreeSet();
    id v19 = (void *)[v18 mutableCopy];
    [v19 removeObject:v17];
    uint64_t v20 = [v19 allObjects];

    if (v20)
    {
LABEL_3:
      v21 = [a1 _selectParentUTIForUTI:v12 fromParentUTIs:v20 dictionary:v13 alreadySeenUTIs:v14 matchedValueToTypeBlock:v15 validationBlock:v16];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v20 = (void *)UTTypeCopyParentIdentifiers();
    if (v20) {
      goto LABEL_3;
    }
  }
  v21 = 0;
LABEL_6:

  return v21;
}

+ (id)_recursiveValueInDictionary:(id)a3 forType:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *, __CFString *))a6;
  id v16 = (unsigned int (**)(id, uint64_t, __CFString *))a7;
  id v17 = [v13 lowercaseString];
  if (!v14) {
    id v14 = (id)objc_opt_new();
  }
  if (![v14 containsObject:v17])
  {
    [v14 addObject:v17];
    uint64_t v18 = [(__CFString *)v12 objectForKeyedSubscript:v17];
    if (v18)
    {
      id v19 = (void *)v18;
      if (v16)
      {
        if (v16[2](v16, v18, v17)) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = v20;

        BOOL v22 = 1;
        id v19 = v21;
        if (!v15) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v23 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v23 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v43 = v12;
        __int16 v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_217F31000, v23, OS_LOG_TYPE_INFO, "No exact match found in type dictionary %p for '%@' #UTI", buf, 0x16u);
      }
      id v19 = [a1 _searchParentTypesFor:v13 fromDictionary:v12 alreadySeenUTIs:v14 matchedValueToTypeBlock:v15 validationBlock:v16];
    }
    BOOL v22 = 1;
    if (!v15) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v26 = QLSLogHandle();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

  if (v27)
  {
    v28 = (void *)UTTypeCopyParentIdentifiers();
    if (v28)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v36 = v28;
      id obj = v28;
      uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v39 != v31) {
              objc_enumerationMutation(obj);
            }
            CFStringRef v33 = *(const __CFString **)(*((void *)&v38 + 1) + 8 * i);
            if (UTTypeConformsTo(v33, v17))
            {
              id v34 = QLSLogHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v43 = v17;
                __int16 v44 = 2112;
                v45 = (__CFString *)v33;
                __int16 v46 = 2112;
                v47 = v17;
                _os_log_impl(&dword_217F31000, v34, OS_LOG_TYPE_DEBUG, "Infinite UTI tree loop (%@ conforms to %@ which conforms to %@) #UTI", buf, 0x20u);
              }

              goto LABEL_36;
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
LABEL_36:

      v28 = v36;
    }
  }
  v35 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"QLUTIErrorDomain", 0, 0, v36);

  id v19 = 0;
  BOOL v22 = v35 == 0;
  if (v15)
  {
LABEL_17:
    if (v22)
    {
      uint64_t v24 = v15[2](v15, v19, v17);

      id v19 = (void *)v24;
    }
  }
LABEL_19:

  return v19;
}

+ (id)_preferredParentUTIof:(id)a3 fromParents:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1D920], "typeWithIdentifier:", a3, a4);
  id v5 = (void *)*MEMORY[0x263F1D940];
  if ([v4 conformsToType:*MEMORY[0x263F1D940]])
  {
    id v6 = [v5 identifier];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_selectParentUTIForUTI:(id)a3 fromParentUTIs:(id)a4 dictionary:(id)a5 alreadySeenUTIs:(id)a6 matchedValueToTypeBlock:(id)a7 validationBlock:(id)a8
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (uint64_t (**)(id, uint64_t, void *))a8;
  CFStringRef v33 = v14;
  uint64_t v20 = [a1 _preferredParentUTIof:v14 fromParents:v15];
  if (!v20
    || ([a1 _recursiveValueInDictionary:v16 forType:v20 alreadySeenUTIs:v17 matchedValueToTypeBlock:v18 validationBlock:v19], (id v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v15;
    uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v35;
      id v31 = v15;
      uint64_t v30 = v20;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v27 = [a1 _recursiveValueInDictionary:v16 forType:v26 alreadySeenUTIs:v17 matchedValueToTypeBlock:v18 validationBlock:v19];
          if (v27)
          {
            id v21 = (void *)v27;
            if (!v19 || (v19[2](v19, v27, v33) & 1) != 0) {
              goto LABEL_17;
            }
            uint64_t v28 = [a1 _searchParentTypesFor:v26 fromDictionary:v16 alreadySeenUTIs:v17 matchedValueToTypeBlock:v18 validationBlock:v19];

            if (v28)
            {
              id v21 = (void *)v28;
LABEL_17:
              uint64_t v20 = v30;
              id v15 = v31;
              goto LABEL_18;
            }
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        id v21 = 0;
        uint64_t v20 = v30;
        id v15 = v31;
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v21 = 0;
    }
LABEL_18:
  }
  return v21;
}

+ (id)claimedLivePhotoTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(id)*MEMORY[0x263F1DB60] identifier];
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

+ (id)claimedContactTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(id)*MEMORY[0x263F1DD50] identifier];
  uint64_t v4 = [v2 setWithObject:v3];

  return v4;
}

+ (id)claimedCalendarTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(id)*MEMORY[0x263F1DA18] identifier];
  uint64_t v4 = [v2 setWithObject:v3];

  return v4;
}

+ (id)claimedTextTypes
{
  if (claimedTextTypes_onceToken != -1) {
    dispatch_once(&claimedTextTypes_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = (void *)claimedTextTypes__claimedTextTypes;
  return v2;
}

void __32__QLUTIManager_claimedTextTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v8 = [(id)*MEMORY[0x263F1DC20] identifier];
  v1 = [(id)*MEMORY[0x263F1DC68] identifier];
  uint64_t v2 = [(id)*MEMORY[0x263F1DC70] identifier];
  uint64_t v3 = [(id)*MEMORY[0x263F1DAA8] identifier];
  uint64_t v4 = [(id)*MEMORY[0x263F1DD88] identifier];
  id v5 = [(id)*MEMORY[0x263F1DB48] identifier];
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  id v7 = (void *)claimedTextTypes__claimedTextTypes;
  claimedTextTypes__claimedTextTypes = v6;
}

+ (id)claimedPDFTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(id)*MEMORY[0x263F1DBF0] identifier];
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, @"com.apple.localized-pdf-bundle", 0);

  return v4;
}

+ (id)claimedImageTypes
{
  if (claimedImageTypes_onceToken != -1) {
    dispatch_once(&claimedImageTypes_onceToken, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)claimedImageTypes__claimedImageTypes;
  return v2;
}

void __33__QLUTIManager_claimedImageTypes__block_invoke()
{
  v9[12] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [(id)*MEMORY[0x263F1DCE0] identifier];
  v9[0] = v1;
  uint64_t v2 = [(id)*MEMORY[0x263F1DB40] identifier];
  uint64_t v3 = *MEMORY[0x263F01A88];
  v9[1] = v2;
  v9[2] = v3;
  uint64_t v4 = [(id)*MEMORY[0x263F1DC08] identifier];
  v9[3] = v4;
  id v5 = [(id)*MEMORY[0x263F1DAD0] identifier];
  v9[4] = v5;
  v9[5] = @"public.heif";
  v9[6] = @"public.heics";
  v9[7] = @"public.heic";
  v9[8] = @"public.avci";
  v9[9] = @"com.apple.icns";
  v9[10] = @"com.apple.pict";
  v9[11] = @"com.apple.atx";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:12];
  uint64_t v7 = [v0 setWithArray:v6];
  id v8 = (void *)claimedImageTypes__claimedImageTypes;
  claimedImageTypes__claimedImageTypes = v7;
}

+ (id)claimedAVTypes
{
  if (claimedAVTypes_onceToken != -1) {
    dispatch_once(&claimedAVTypes_onceToken, &__block_literal_global_40);
  }
  uint64_t v2 = (void *)claimedAVTypes__claimedAVTypes;
  return v2;
}

void __30__QLUTIManager_claimedAVTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v5 = [MEMORY[0x263EFA8D0] audiovisualTypes];
  v1 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_45];
  uint64_t v2 = [v5 filteredArrayUsingPredicate:v1];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)claimedAVTypes__claimedAVTypes;
  claimedAVTypes__claimedAVTypes = v3;
}

BOOL __30__QLUTIManager_claimedAVTypes__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [(id)*MEMORY[0x263F1D9B8] identifier];
  if (UTTypeConformsTo(v2, v3))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(id)*MEMORY[0x263F1DBC8] identifier];
    BOOL v4 = UTTypeConformsTo(v2, v5) != 0;
  }
  return v4;
}

+ (id)claimedOfficeTypes
{
  if (claimedOfficeTypes_onceToken != -1) {
    dispatch_once(&claimedOfficeTypes_onceToken, &__block_literal_global_47);
  }
  uint64_t v2 = (void *)claimedOfficeTypes__claimedOfficeTypes;
  return v2;
}

uint64_t __34__QLUTIManager_claimedOfficeTypes__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.microsoft.powerpoint.ppt", @"com.microsoft.powerpoint.pot", @"com.microsoft.powerpoint.pps", @"org.openxmlformats.presentationml.presentation", @"org.openxmlformats.presentationml.presentation.macroenabled", @"org.openxmlformats.presentationml.template", @"org.openxmlformats.presentationml.template.macroenabled", @"org.openxmlformats.presentationml.slideshow", @"org.openxmlformats.presentationml.slideshow.macroenabled", @"com.microsoft.excel.xls", @"com.microsoft.excel.xlt", @"com.microsoft.excel.xla", @"org.openxmlformats.spreadsheetml.sheet", @"org.openxmlformats.spreadsheetml.sheet.macroenabled", @"org.openxmlformats.spreadsheetml.template", @"org.openxmlformats.spreadsheetml.template.macroenabled", @"com.microsoft.word.doc",
    @"com.microsoft.word.dot",
    @"org.openxmlformats.wordprocessingml.document",
    @"org.openxmlformats.wordprocessingml.document.macroenabled",
    @"org.openxmlformats.wordprocessingml.template",
    @"org.openxmlformats.wordprocessingml.template.macroenabled",
  claimedOfficeTypes__claimedOfficeTypes = 0);
  return MEMORY[0x270F9A758]();
}

+ (id)claimediWorkTypes
{
  if (claimediWorkTypes_onceToken != -1) {
    dispatch_once(&claimediWorkTypes_onceToken, &__block_literal_global_115);
  }
  uint64_t v2 = (void *)claimediWorkTypes__claimediWorkTypes;
  return v2;
}

uint64_t __33__QLUTIManager_claimediWorkTypes__block_invoke()
{
  claimediWorkTypes__claimediWorkTypes = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.iwork.keynote.key", @"com.apple.iwork.numbers.numbers", @"com.apple.iwork.pages.pages", @"com.apple.iwork.keynote.sffkey", @"com.apple.iwork.numbers.sffnumbers", @"com.apple.iwork.pages.sffpages", @"com.apple.iwork.numbers.template", @"com.apple.iwork.numbers.sfftemplate", @"com.apple.iwork.pages.template", @"com.apple.iwork.pages.sfftemplate", @"com.apple.iwork.keynote.kth", @"com.apple.iwork.keynote.sffkth", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)claimedCSVTypes
{
  if (claimedCSVTypes_onceToken != -1) {
    dispatch_once(&claimedCSVTypes_onceToken, &__block_literal_global_153);
  }
  uint64_t v2 = (void *)claimedCSVTypes__claimedCSVTypes;
  return v2;
}

uint64_t __31__QLUTIManager_claimedCSVTypes__block_invoke()
{
  claimedCSVTypes__claimedCSVTypes = [MEMORY[0x263EFFA08] setWithObject:@"public.comma-separated-values-text"];
  return MEMORY[0x270F9A758]();
}

+ (id)claimedWebViewTypes
{
  if (claimedWebViewTypes_onceToken != -1) {
    dispatch_once(&claimedWebViewTypes_onceToken, &__block_literal_global_158);
  }
  uint64_t v2 = (void *)claimedWebViewTypes__claimedWebViewTypes;
  return v2;
}

uint64_t __35__QLUTIManager_claimedWebViewTypes__block_invoke()
{
  claimedWebViewTypes__claimedWebViewTypes = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"public.svg-image", @"public.html", @"com.apple.web-internet-location", 0);
  return MEMORY[0x270F9A758]();
}

void __38__QLUTIManager_internallyClaimedTypes__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = [*(id *)(a1 + 32) claimedTextTypes];
  BOOL v4 = [v2 setWithSet:v3];

  id v5 = [*(id *)(a1 + 32) claimedLivePhotoTypes];
  uint64_t v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [*(id *)(a1 + 32) claimedContactTypes];
  id v8 = [v7 allObjects];
  [v4 addObjectsFromArray:v8];

  id v9 = [*(id *)(a1 + 32) claimedCalendarTypes];
  v10 = [v9 allObjects];
  [v4 addObjectsFromArray:v10];

  id v11 = [*(id *)(a1 + 32) claimedPDFTypes];
  id v12 = [v11 allObjects];
  [v4 addObjectsFromArray:v12];

  id v13 = [*(id *)(a1 + 32) claimedImageTypes];
  id v14 = [v13 allObjects];
  [v4 addObjectsFromArray:v14];

  id v15 = [*(id *)(a1 + 32) claimedAVTypes];
  id v16 = [v15 allObjects];
  [v4 addObjectsFromArray:v16];

  id v17 = [*(id *)(a1 + 32) claimedOfficeTypes];
  id v18 = [v17 allObjects];
  [v4 addObjectsFromArray:v18];

  id v19 = [*(id *)(a1 + 32) claimediWorkTypes];
  uint64_t v20 = [v19 allObjects];
  [v4 addObjectsFromArray:v20];

  id v21 = [*(id *)(a1 + 32) claimedCSVTypes];
  uint64_t v22 = [v21 allObjects];
  [v4 addObjectsFromArray:v22];

  uint64_t v23 = [*(id *)(a1 + 32) claimedWebViewTypes];
  uint64_t v24 = [v23 allObjects];
  [v4 addObjectsFromArray:v24];

  id v25 = (void *)internallyClaimedTypes__internallyClaimedTypes;
  internallyClaimedTypes__internallyClaimedTypes = (uint64_t)v4;
}

+ (id)textGeneratorSupportedTypes
{
  if (textGeneratorSupportedTypes_onceToken != -1) {
    dispatch_once(&textGeneratorSupportedTypes_onceToken, &__block_literal_global_169);
  }
  uint64_t v2 = (void *)textGeneratorSupportedTypes__textTypes;
  return v2;
}

void __43__QLUTIManager_textGeneratorSupportedTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F1DC20];
  uint64_t v2 = *MEMORY[0x263F1DC68];
  uint64_t v3 = *MEMORY[0x263F1DC70];
  uint64_t v6 = [MEMORY[0x263F1D920] typeWithIdentifier:@"org.oasis-open.opendocument.text"];
  uint64_t v4 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v6, *MEMORY[0x263F1DC40], *MEMORY[0x263F1DD88], *MEMORY[0x263F1DB48], 0);
  id v5 = (void *)textGeneratorSupportedTypes__textTypes;
  textGeneratorSupportedTypes__textTypes = v4;
}

+ (id)typesForWhichExternalGeneratorsArePreferred
{
  if (typesForWhichExternalGeneratorsArePreferred_onceToken != -1) {
    dispatch_once(&typesForWhichExternalGeneratorsArePreferred_onceToken, &__block_literal_global_174);
  }
  uint64_t v2 = (void *)typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes;
  return v2;
}

void __59__QLUTIManager_typesForWhichExternalGeneratorsArePreferred__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v5 = [(id)*MEMORY[0x263F1DB48] identifier];
  uint64_t v1 = [(id)*MEMORY[0x263F1DD88] identifier];
  uint64_t v2 = [(id)*MEMORY[0x263F1DC40] identifier];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v5, v1, v2, @"com.adobe.illustrator.ai-image", @"org.xiph.flac", 0);
  uint64_t v4 = (void *)typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes;
  typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes = v3;
}

+ (BOOL)externalGeneratorPreferredForType:(id)a3
{
  id v4 = a3;
  id v5 = [a1 typesForWhichExternalGeneratorsArePreferred];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v6 lowercaseString];
  char v8 = [v5 containsObject:v7];

  return v8;
}

+ (id)screentimeiWorkBundleForUTI:(id)a3
{
  id v3 = a3;
  if (v3
    && (+[QLUTIManager claimediWorkTypes],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsObject:v3],
        v4,
        v5))
  {
    [v3 rangeOfString:@"pages" options:1];
    if (v6)
    {
      uint64_t v7 = @"com.apple.Pages";
    }
    else
    {
      [v3 rangeOfString:@"numbers" options:1];
      if (v9)
      {
        uint64_t v7 = @"com.apple.Numbers";
      }
      else
      {
        [v3 rangeOfString:@"keynote" options:1];
        if (v10) {
          uint64_t v7 = @"com.apple.Keynote";
        }
        else {
          uint64_t v7 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __26__QLUTIManager_iWorkTypes__block_invoke()
{
  v14[12] = *MEMORY[0x263EF8340];
  id v13 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.keynote.key"];
  v14[0] = v13;
  id v12 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.numbers.numbers"];
  v14[1] = v12;
  v0 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.pages.pages"];
  v14[2] = v0;
  uint64_t v1 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.keynote.sffkey"];
  v14[3] = v1;
  uint64_t v2 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.numbers.sffnumbers"];
  v14[4] = v2;
  id v3 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.pages.sffpages"];
  v14[5] = v3;
  id v4 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.numbers.template"];
  v14[6] = v4;
  int v5 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.numbers.sfftemplate"];
  v14[7] = v5;
  uint64_t v6 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.pages.template"];
  v14[8] = v6;
  uint64_t v7 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.pages.sfftemplate"];
  v14[9] = v7;
  char v8 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.keynote.kth"];
  v14[10] = v8;
  uint64_t v9 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.apple.iwork.keynote.sffkth"];
  v14[11] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:12];
  id v11 = (void *)iWorkTypes_iWorkTypes;
  iWorkTypes_iWorkTypes = v10;
}

@end