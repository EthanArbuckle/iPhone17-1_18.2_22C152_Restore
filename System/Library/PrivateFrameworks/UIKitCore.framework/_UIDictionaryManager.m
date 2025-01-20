@interface _UIDictionaryManager
+ (id)assetManager;
- (BOOL)_hasDefinitionForTerm:(id)a3;
- (BOOL)_isTTYEnabled;
- (NSArray)availableDefinitionDictionaries;
- (_UIDictionaryManager)init;
- (id)_allAvailableDefinitionDictionaries;
- (id)_availableDictionaryAssets;
- (id)_definitionValuesForTerm:(id)a3;
- (id)_dictionaryAssetType;
- (void)_downloadDictionaryAssetCatalog:(id)a3;
@end

@implementation _UIDictionaryManager

- (_UIDictionaryManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDictionaryManager;
  v2 = [(_UIDictionaryManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(_UIDictionaryManager *)v2 _allAvailableDefinitionDictionaries];
    availableDefinitionDictionaries = v3->_availableDefinitionDictionaries;
    v3->_availableDefinitionDictionaries = (NSArray *)v4;
  }
  return v3;
}

+ (id)assetManager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_availableDefinitionDictionaries;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_hasDefinitionForTerm:", v5, (void)v11))
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_definitionValuesForTerm:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = self->_availableDefinitionDictionaries;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "activated", (void)v16))
        {
          long long v12 = [v11 _definitionValueForTerm:v4];
          long long v13 = v12;
          if (v12)
          {
            long long v14 = [v12 definition];

            if (v14) {
              [v5 addObject:v13];
            }
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {

    v5 = 0;
  }

  return v5;
}

- (id)_dictionaryAssetType
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v2 = (void (*)(void))getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr;
  long long v11 = getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr;
  if (!getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr)
  {
    v3 = DictionaryServicesLibrary_0();
    v9[3] = (uint64_t)dlsym(v3, "DCSDictionaryAssetGetAssetType");
    getDCSDictionaryAssetGetAssetTypeSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    id v2 = (void (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    id v4 = v2();
    return v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"CFStringRef _DCSDictionaryAssetGetAssetType(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UIDictionaryManager.m", 38, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (void)_downloadDictionaryAssetCatalog:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setAllowsCellularAccess:1];
  [v5 setAllowsExpensiveAccess:1];
  [v5 setDiscretionary:0];
  v6 = (void *)MEMORY[0x1E4F77FB0];
  uint64_t v7 = [(_UIDictionaryManager *)self _dictionaryAssetType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56___UIDictionaryManager__downloadDictionaryAssetCatalog___block_invoke;
  v9[3] = &unk_1E52E5E20;
  id v10 = v4;
  id v8 = v4;
  [v6 startCatalogDownload:v7 options:v5 then:v9];
}

- (id)_availableDictionaryAssets
{
  id v3 = objc_alloc(MEMORY[0x1E4F77FB8]);
  id v4 = [(_UIDictionaryManager *)self _dictionaryAssetType];
  v5 = (void *)[v3 initWithType:v4];

  [v5 returnTypes:2];
  [v5 setDoNotBlockBeforeFirstUnlock:1];
  uint64_t v6 = [v5 queryMetaDataSync];
  if (v6)
  {
    NSLog(&cfstr_Uidictionaryma_0.isa, v6);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 results];
  }

  return v7;
}

- (id)_allAvailableDefinitionDictionaries
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v39 = [(_UIDictionaryManager *)self _availableDictionaryAssets];
  unint64_t v2 = 0x1E4F1C000uLL;
  if (v39)
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 objectForKey:@"AppleLanguages"];
    v43 = [v4 objectAtIndex:0];

    id v45 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v5 = v39;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v64 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v10 = [v9 _formatVersion];
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2020000000;
          long long v11 = (uint64_t (*)(void))getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr;
          v75 = getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr;
          if (!getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_block_invoke;
            v70 = &unk_1E52D9900;
            v71 = &v72;
            long long v12 = DictionaryServicesLibrary_0();
            long long v13 = dlsym(v12, "DCSDictionaryAssetGetCompatibilityVersion");
            *(void *)(v71[1] + 24) = v13;
            getDCSDictionaryAssetGetCompatibilityVersionSymbolLoc_ptr = *(_UNKNOWN **)(v71[1] + 24);
            long long v11 = (uint64_t (*)(void))v73[3];
          }
          _Block_object_dispose(&v72, 8);
          if (!v11)
          {
            v37 = [MEMORY[0x1E4F28B00] currentHandler];
            v38 = [NSString stringWithUTF8String:"NSInteger _DCSDictionaryAssetGetCompatibilityVersion(void)"];
            objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"_UIDictionaryManager.m", 37, @"%s", dlerror());

            __break(1u);
          }
          if (v10 == v11())
          {
            long long v14 = [[_UIDefinitionDictionary alloc] initWithAsset:v9];
            v15 = v14;
            if (v14
              && (![(_UIDefinitionDictionary *)v14 _isTTYDictionary]
               || [(_UIDictionaryManager *)self _isTTYEnabled]))
            {
              if (-[_UIDefinitionDictionary assetIsLocal](v15, "assetIsLocal") || [v9 state] == 4) {
                [(_UIDefinitionDictionary *)v15 setActivated:1];
              }
              [v45 addObject:v15];
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v79 count:16];
      }
      while (v6);
    }

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke;
    v61[3] = &unk_1E52E9418;
    id v62 = v43;
    id v16 = v43;
    [v45 sortUsingComparator:v61];

    long long v17 = v45;
    unint64_t v2 = 0x1E4F1C000;
  }
  else
  {
    long long v17 = 0;
  }
  id v46 = v17;
  v40 = objc_msgSend(*(id *)(v2 + 2632), "arrayWithCapacity:", objc_msgSend(v17, "count"));
  long long v18 = [v46 _filteredArrayOfObjectsPassingTest:&__block_literal_global_421];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v42 = [v18 countByEnumeratingWithState:&v57 objects:v78 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v58;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v58 != v41)
        {
          uint64_t v20 = v19;
          objc_enumerationMutation(v18);
          uint64_t v19 = v20;
        }
        uint64_t v44 = v19;
        uint64_t v21 = *(void **)(*((void *)&v57 + 1) + 8 * v19);
        v48 = [v21 rawAsset];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v22 = v46;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v77 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v54;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v54 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              if ([v18 indexOfObjectIdenticalTo:v26] == 0x7FFFFFFFFFFFFFFFLL)
              {
                v27 = [v21 localizedDictionaryName];
                v28 = [v26 localizedDictionaryName];
                int v29 = [v27 isEqual:v28];

                if (v29)
                {
                  v30 = [v26 rawAsset];
                  if ([v48 state] == 3
                    || (uint64_t v31 = [v30 _contentVersion], v31 > objc_msgSend(v48, "_contentVersion")))
                  {
                    [v21 setAssetToUpgrade:v30];
                  }
                  [v40 addObject:v26];

                  goto LABEL_43;
                }
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v77 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        if ([v48 state] == 3)
        {
          [v40 addObject:v21];
          [v48 purgeSync];
        }
LABEL_43:

        uint64_t v19 = v44 + 1;
      }
      while (v44 + 1 != v42);
      uint64_t v42 = [v18 countByEnumeratingWithState:&v57 objects:v78 count:16];
    }
    while (v42);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v32 = v40;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v76 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v32);
        }
        [v46 removeObject:*(void *)(*((void *)&v49 + 1) + 8 * k)];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v76 count:16];
    }
    while (v33);
  }

  return v46;
}

- (BOOL)_isTTYEnabled
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  unint64_t v2 = (void *)qword_1EB260050;
  uint64_t v11 = qword_1EB260050;
  if (!qword_1EB260050)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getRTTSettingsClass_block_invoke;
    v7[3] = &unk_1E52D9900;
    v7[4] = &v8;
    __getRTTSettingsClass_block_invoke((uint64_t)v7);
    unint64_t v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 sharedInstance];
  char v5 = [v4 TTYSoftwareEnabled];

  return v5;
}

- (NSArray)availableDefinitionDictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end