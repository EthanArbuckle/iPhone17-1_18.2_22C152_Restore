@interface NTKPlistPigmentEditOptionLoader
+ (BOOL)containsReservedKey:(id)a3 inDictionary:(id)a4;
+ (BOOL)containsSeasonNamePrefix:(id)a3;
+ (id)extractNameFromFullFileName:(id)a3 fileExtension:(id)a4;
+ (id)indexForSeasonName:(id)a3;
+ (id)modifyContentRootForImplicitCollectionsIfNeeded:(id)a3;
+ (id)seasonNames;
+ (id)sortedCollectionNamesFromCollections:(id)a3;
+ (id)sortedColorFileNames:(id)a3;
+ (id)sortedUniqueOptionNamesFromCollections:(id)a3;
+ (int64_t)compareColorFileNames:(id)a3 otherFileName:(id)a4 fileExtension:(id)a5;
+ (int64_t)compareSeasonName:(id)a3 otherSeasonName:(id)a4;
+ (int64_t)compareSeasonWithoutYear:(id)a3 otherSeasonNameWithoutYear:(id)a4;
+ (int64_t)extractYearFromSeasonName:(id)a3;
- (BOOL)hasFileLevelSensitiveUIConfig:(id)a3;
- (BOOL)ignoreSensitiveUIItems;
- (BOOL)includesAllDeviceSpecificColors;
- (BOOL)isValidPigment:(id)a3;
- (NSArray)additionalBundles;
- (NSArray)plistFiles;
- (NSArray)sortedAdditionalPlistFiles;
- (NSBundle)frameworkBundle;
- (NSDictionary)sharedConfigs;
- (NSMutableArray)bundlePlistsFromFacesWithoutBundle;
- (NSNumber)clhs;
- (NSNumber)family;
- (NSNumber)sku;
- (NTKPlistPigmentEditOptionLoader)init;
- (NTKPlistPigmentEditOptionLoader)initWithBundle:(id)a3;
- (NTKPlistPigmentEditOptionLoader)initWithPlistFiles:(id)a3;
- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4;
- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4 includesAllDeviceSpecificColors:(BOOL)a5;
- (id)colorOptionsFromItemsDictionary:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7;
- (id)colorOptionsFromPListItems:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7;
- (id)configurationFromNode:(id)a3;
- (id)configurationFromNode:(id)a3 collectionName:(id)a4;
- (id)configurationWithName:(id)a3 fromNode:(id)a4 collectionName:(id)a5;
- (id)copyItemsApplyingConfiguration:(id)a3 configuration:(id)a4;
- (id)discoverCollectionWithName:(id)a3 contentRoot:(id)a4 collectionsRoot:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependecies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12;
- (id)extractSuffixFromFileName:(id)a3;
- (id)importedCollectionsFromImports:(id)a3 propertyName:(id)a4 sharedCollectionsRoot:(id)a5 parent:(id)a6 discoveredCollections:(id)a7 privateDiscoveredCollections:(id)a8 discoveredInvalidCollections:(id)a9 invalidDependencies:(id)a10 hasCycle:(BOOL *)a11 plistSuffix:(id)a12 bundle:(id)a13;
- (id)importedCollectionsWithNode:(id)a3 sharedCollectionsRoot:(id)a4 parent:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependencies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12;
- (id)itemsFromNode:(id)a3 collectionName:(id)a4 applyingConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7;
- (id)loadFaceCollectionForAllSlotsForDomain:(id)a3 propertyList:(id)a4 bundle:(id)a5 sharedCollections:(id)a6;
- (id)loadFaceCollectionForDomain:(id)a3 contentRoot:(id)a4 faceCollectionsRoot:(id)a5 sharedCollections:(id)a6 plistSuffix:(id)a7 bundle:(id)a8;
- (id)loadFaceCollectionForDomain:(id)a3 mainBundle:(id)a4 faceBundle:(id)a5 additionalBundles:(id)a6 sharedCollections:(id)a7;
- (id)loadNestedCollectionsFromNode:(id)a3 parent:(id)a4 config:(id)a5 plistSuffix:(id)a6 bundle:(id)a7;
- (id)loadPropertyListFromFile:(id)a3;
- (id)loadSharedCollections;
- (id)loadSharedCollectionsInMainBundle:(id)a3 additionalBundles:(id)a4;
- (id)loadSharedCollectionsWithPropertyList:(id)a3 bundle:(id)a4;
- (id)loadSharedConfigWithPropertyList:(id)a3 bundle:(id)a4;
- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4;
- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4 sharedCollections:(id)a5;
- (id)plistFacesWithoutFaceBundle;
- (id)skuFileLevel:(id)a3;
- (id)sortedColorPListBundles:(id)a3;
- (id)sortedPlistFilesWithMainBundle:(id)a3 faceBundle:(id)a4 additionalBundles:(id)a5;
- (os_unfair_lock_s)lock;
- (void)applyConfigurationOnEditOption:(id)a3 configuration:(id)a4;
- (void)enumerateColorEditOptionFilesInBundle:(id)a3 sorted:(BOOL)a4 block:(id)a5;
- (void)mergeCollections:(id)a3 withCollections:(id)a4;
- (void)mergeConfigs:(id)a3 withConfigs:(id)a4;
- (void)setAdditionalBundles:(id)a3;
- (void)setBundlePlistsFromFacesWithoutBundle:(id)a3;
- (void)setClhs:(id)a3;
- (void)setFamily:(id)a3;
- (void)setFrameworkBundle:(id)a3;
- (void)setIgnoreSensitiveUIItems:(BOOL)a3;
- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPlistFiles:(id)a3;
- (void)setSharedConfigs:(id)a3;
- (void)setSku:(id)a3;
- (void)setSortedAdditionalPlistFiles:(id)a3;
@end

@implementation NTKPlistPigmentEditOptionLoader

- (NTKPlistPigmentEditOptionLoader)init
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(NTKPlistPigmentEditOptionLoader *)self initWithBundle:v3];

  return v4;
}

- (NTKPlistPigmentEditOptionLoader)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKPlistPigmentEditOptionLoader;
  v6 = [(NTKPlistPigmentEditOptionLoader *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frameworkBundle, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NTKPlistPigmentEditOptionLoader)initWithPlistFiles:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [(NTKPlistPigmentEditOptionLoader *)self initWithBundle:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_plistFiles, a3);
  }

  return v7;
}

- (NSDictionary)sharedConfigs
{
  sharedConfigs = self->_sharedConfigs;
  if (!sharedConfigs)
  {
    id v4 = [(NTKPlistPigmentEditOptionLoader *)self loadSharedCollections];
    sharedConfigs = self->_sharedConfigs;
  }
  return sharedConfigs;
}

- (id)loadSharedCollections
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#plist-loader Loading #shared pigment collections#", (uint8_t *)&v10, 2u);
  }

  frameworkBundle = self->_frameworkBundle;
  id v5 = [(NTKPlistPigmentEditOptionLoader *)self additionalBundles];
  v6 = [(NTKPlistPigmentEditOptionLoader *)self loadSharedCollectionsInMainBundle:frameworkBundle additionalBundles:v5];

  v7 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    int v10 = 134217984;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "#plist-loader Finished loading shared collections. Number of shared collections %lu", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NTKPlistPigmentEditOptionLoader *)self loadSharedCollections];
  objc_super v9 = [(NTKPlistPigmentEditOptionLoader *)self parseColorOptionsForDomain:v7 bundle:v6 sharedCollections:v8];

  return v9;
}

- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4 sharedCollections:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:]();
  }

  if ([v10 count])
  {
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:]();
    }

    if (!v9) {
      goto LABEL_10;
    }
  }
  if ([v9 isEqual:self->_frameworkBundle])
  {
LABEL_10:
    id v13 = 0;
    goto LABEL_12;
  }
  id v13 = v9;
LABEL_12:
  frameworkBundle = self->_frameworkBundle;
  v15 = [(NTKPlistPigmentEditOptionLoader *)self additionalBundles];
  v16 = [(NTKPlistPigmentEditOptionLoader *)self loadFaceCollectionForDomain:v8 mainBundle:frameworkBundle faceBundle:v13 additionalBundles:v15 sharedCollections:v10];

  if ([v16 count])
  {
    v17 = objc_alloc_init(NTKFacePigmentSet);
    [(NTKFacePigmentSet *)v17 setCollectionBySlots:v16];
  }
  else
  {
    v17 = 0;
  }
  [(NTKFacePigmentSet *)v17 setDomain:v8];

  return v17;
}

- (id)loadSharedCollectionsInMainBundle:(id)a3 additionalBundles:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30 = [MEMORY[0x1E4F1CA60] dictionary];
  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  v26 = v7;
  v27 = v6;
  [(NTKPlistPigmentEditOptionLoader *)self sortedPlistFilesWithMainBundle:v6 faceBundle:0 additionalBundles:v7];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v13 = [v12 plistFileName];
        v14 = [v12 bundle];
        v15 = [(NTKPlistPigmentEditOptionLoader *)self loadSharedConfigWithPropertyList:v13 bundle:v14];

        if ([v15 count]) {
          [(NTKPlistPigmentEditOptionLoader *)self mergeConfigs:v29 withConfigs:v15];
        }
        v16 = [v12 plistFileName];
        v17 = [v12 bundle];
        v18 = [(NTKPlistPigmentEditOptionLoader *)self loadSharedCollectionsWithPropertyList:v16 bundle:v17];

        if ([v18 count])
        {
          v19 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v21 = [v12 plistFileName];
            *(_DWORD *)buf = 138543618;
            v36 = v18;
            __int16 v37 = 2114;
            v38 = v21;
            _os_log_debug_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEBUG, "Merging collections %{public}@ from plist %{public}@", buf, 0x16u);
          }
          [(NTKPlistPigmentEditOptionLoader *)self mergeCollections:v30 withCollections:v18];
          v20 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v30;
            _os_log_debug_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEBUG, "Collections after merge %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }
  v22 = (NSDictionary *)[v29 copy];
  sharedConfigs = self->_sharedConfigs;
  self->_sharedConfigs = v22;

  v24 = (void *)[v30 copy];
  return v24;
}

- (id)loadFaceCollectionForDomain:(id)a3 mainBundle:(id)a4 faceBundle:(id)a5 additionalBundles:(id)a6 sharedCollections:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v36 = a7;
  v35 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = v13;
  long long v32 = v12;
  v30 = v14;
  [(NTKPlistPigmentEditOptionLoader *)self sortedPlistFilesWithMainBundle:v12 faceBundle:v13 additionalBundles:v14];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v45;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1C1875BE0]();
        v21 = [v19 plistFileName];
        v22 = [v19 bundle];
        v23 = [(NTKPlistPigmentEditOptionLoader *)self loadFaceCollectionForAllSlotsForDomain:v34 propertyList:v21 bundle:v22 sharedCollections:v36];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke;
        v40[3] = &unk_1E62C69E0;
        id v41 = v35;
        v42 = v19;
        v43 = self;
        [v23 enumerateKeysAndObjectsUsingBlock:v40];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v16);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_115;
  v37[3] = &unk_1E62C6A08;
  id v38 = v34;
  id v25 = v24;
  id v39 = v25;
  id v26 = v34;
  [v35 enumerateKeysAndObjectsUsingBlock:v37];
  v27 = v39;
  id v28 = v25;

  return v28;
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_2((uint64_t)v6, a1, v8);
    }

    [*(id *)(a1 + 48) mergeCollections:v7 withCollections:v6];
    uint64_t v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)extractSuffixFromFileName:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [@".color.plist" length];
  if ([v3 length] >= v4)
  {
    id v6 = [v3 lastPathComponent];
    id v7 = [v6 substringToIndex:objc_msgSend(v6, "length") - objc_msgSend(@".color.plist", "length")];

    if ([v7 containsString:@"-"])
    {
      uint64_t v8 = [v7 componentsSeparatedByString:@"-"];
      id v5 = [v8 lastObject];

      id v7 = v8;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)mergeConfigs:(id)a3 withConfigs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v8 = [v6 allKeys];
    uint64_t v9 = [v7 setWithArray:v8];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke;
    v15[3] = &unk_1E62C6A30;
    id v10 = v6;
    id v16 = v10;
    id v17 = v9;
    id v11 = v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke_2;
    v12[3] = &unk_1E62C18C8;
    id v13 = v5;
    id v14 = v10;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (v6)
  {
    [*(id *)(a1 + 40) removeObject:v7];
    [v5 overridePropertiesFromConfig:v6];
  }
}

void __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

- (void)mergeCollections:(id)a3 withCollections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v8 = [v6 allKeys];
    uint64_t v9 = [v7 setWithArray:v8];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke;
    v15[3] = &unk_1E62C6A58;
    id v10 = v6;
    id v16 = v10;
    id v17 = v9;
    id v11 = v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke_2;
    v12[3] = &unk_1E62C18C8;
    id v13 = v5;
    id v14 = v10;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (v6)
  {
    [*(id *)(a1 + 40) removeObject:v7];
    [v5 mergeWithCollection:v6];
  }
}

void __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

- (id)loadFaceCollectionForAllSlotsForDomain:(id)a3 propertyList:(id)a4 bundle:(id)a5 sharedCollections:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(NTKPlistPigmentEditOptionLoader *)self loadPropertyListFromFile:v11];
  uint64_t v15 = [(NTKPlistPigmentEditOptionLoader *)self extractSuffixFromFileName:v11];
  id v16 = v14;
  id v17 = [v16 objectForKeyedSubscript:@"faces"];
  if (!v17)
  {
    uint64_t v18 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:]();
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:].cold.4();
    }
    goto LABEL_20;
  }
  uint64_t v18 = [v17 objectForKeyedSubscript:v10];
  if (!v18)
  {
    v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:]();
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:]();
    }
LABEL_19:

LABEL_20:
    id v20 = 0;
    goto LABEL_21;
  }
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke;
  v32[3] = &unk_1E62C6A80;
  v32[4] = &v33;
  [v18 enumerateKeysAndObjectsUsingBlock:v32];
  if ([(NTKPlistPigmentEditOptionLoader *)self hasFileLevelSensitiveUIConfig:v16]
    && self->_ignoreSensitiveUIItems)
  {
    v19 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v11;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist because sensitive UI is disabled %{public}@", buf, 0xCu);
    }
    id v20 = 0;
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (*((unsigned char *)v34 + 24))
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_122;
      v23[3] = &unk_1E62C6AA8;
      id v24 = v18;
      id v25 = self;
      id v26 = v10;
      id v27 = v17;
      id v28 = v13;
      id v29 = v15;
      id v30 = v12;
      id v20 = v20;
      id v31 = v20;
      [v24 enumerateKeysAndObjectsUsingBlock:v23];

      v19 = v24;
    }
    else
    {
      v19 = [(NTKPlistPigmentEditOptionLoader *)self loadFaceCollectionForDomain:v10 contentRoot:v18 faceCollectionsRoot:v17 sharedCollections:v13 plistSuffix:v15 bundle:v12];
      [v20 setObject:v19 forKeyedSubscript:@"slot-"];
    }
  }

  _Block_object_dispose(&v33, 8);
LABEL_21:

  return v20;
}

uint64_t __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPrefix:@"slot-"];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_122(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:@"slot-"])
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v5 = [*(id *)(a1 + 40) loadFaceCollectionForDomain:*(void *)(a1 + 48) contentRoot:v4 faceCollectionsRoot:*(void *)(a1 + 56) sharedCollections:*(void *)(a1 + 64) plistSuffix:*(void *)(a1 + 72) bundle:*(void *)(a1 + 80)];
    id v6 = [v3 substringFromIndex:objc_msgSend(@"slot-", "length")];
    [*(id *)(a1 + 88) setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_122_cold_1(v7);
    }
  }
}

- (id)loadFaceCollectionForDomain:(id)a3 contentRoot:(id)a4 faceCollectionsRoot:(id)a5 sharedCollections:(id)a6 plistSuffix:(id)a7 bundle:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = [(id)objc_opt_class() modifyContentRootForImplicitCollectionsIfNeeded:v19];

  v21 = [MEMORY[0x1E4F1CA60] dictionary];
  v22 = (void *)[v15 mutableCopy];
  char v28 = 0;
  v23 = [MEMORY[0x1E4F1CA80] setWithObject:v14];
  id v24 = [(NTKPlistPigmentEditOptionLoader *)self discoverCollectionWithName:v14 contentRoot:v20 collectionsRoot:v18 discoveredCollections:v22 privateDiscoveredCollections:0 discoveredInvalidCollections:0 invalidDependecies:v23 hasCycle:&v28 plistSuffix:v17 bundle:v16];

  if (v28)
  {
    id v25 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:]();
    }
  }
  else if (v24)
  {
    id v25 = [v24 collectionName];
    [v21 setObject:v24 forKey:v25];
  }
  else
  {
    id v25 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:]();
    }
  }

  id v26 = [v15 allKeys];
  [v22 removeObjectsForKeys:v26];

  [v21 addEntriesFromDictionary:v22];
  return v21;
}

+ (id)modifyContentRootForImplicitCollectionsIfNeeded:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  id v7 = v6;
  uint64_t v8 = v6;
  if (isKindOfClass)
  {
    uint64_t v8 = v6;
    if ([v6 count])
    {
      char v9 = [a1 containsReservedKey:@"imports" inDictionary:v7];
      char v10 = [a1 containsReservedKey:@"collections" inDictionary:v7];
      char v11 = [a1 containsReservedKey:@"items" inDictionary:v7];
      uint64_t v8 = v7;
      if ((v9 & 1) == 0)
      {
        uint64_t v8 = v7;
        if ((v10 & 1) == 0)
        {
          uint64_t v8 = v7;
          if ((v11 & 1) == 0)
          {
            id v12 = (void *)[v7 mutableCopy];
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v22 = MEMORY[0x1E4F143A8];
            uint64_t v23 = 3221225472;
            id v24 = __83__NTKPlistPigmentEditOptionLoader_modifyContentRootForImplicitCollectionsIfNeeded___block_invoke;
            id v25 = &unk_1E62C6AD0;
            id v15 = v13;
            id v26 = v15;
            id v16 = v14;
            id v27 = v16;
            [v7 enumerateKeysAndObjectsUsingBlock:&v22];
            uint64_t v8 = v7;
            if (objc_msgSend(v15, "count", v22, v23, v24, v25))
            {
              [v12 removeObjectsForKeys:v15];
              id v17 = [a1 sortedColorFileNames:v15];
              id v18 = (void *)[v17 copy];
              [v12 setObject:v18 forKeyedSubscript:@"imports"];

              id v19 = (void *)[v16 copy];
              [v12 setObject:v19 forKeyedSubscript:@"collections"];

              uint64_t v8 = (void *)[v12 copy];
              id v20 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                id v29 = v7;
                __int16 v30 = 2114;
                id v31 = v8;
                _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_INFO, "#plist-loader collection root content is being modified from %{public}@, to %{public}@", buf, 0x16u);
              }
            }
          }
        }
      }
    }
  }

  return v8;
}

void __83__NTKPlistPigmentEditOptionLoader_modifyContentRootForImplicitCollectionsIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqual:@"config"] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (BOOL)containsReservedKey:(id)a3 inDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  BOOL v20 = 0;
  id v7 = [v6 objectForKeyedSubscript:v5];
  BOOL v8 = v7 != 0;

  BOOL v20 = v8;
  if (*((unsigned char *)v18 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    char v10 = [NSString stringWithFormat:@"%@%@", v5, @"-"];
    char v11 = [v6 allKeys];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__NTKPlistPigmentEditOptionLoader_containsReservedKey_inDictionary___block_invoke;
    v14[3] = &unk_1E62C6AF8;
    id v16 = &v17;
    id v12 = v10;
    id v15 = v12;
    [v11 enumerateObjectsUsingBlock:v14];

    BOOL v9 = *((unsigned char *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __68__NTKPlistPigmentEditOptionLoader_containsReservedKey_inDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 hasPrefix:*(void *)(a1 + 32)];
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)loadSharedConfigWithPropertyList:(id)a3 bundle:(id)a4
{
  id v5 = -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:](self, "loadPropertyListFromFile:", a3, a4);
  id v6 = [v5 objectForKeyedSubscript:@"shared-config"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __75__NTKPlistPigmentEditOptionLoader_loadSharedConfigWithPropertyList_bundle___block_invoke;
      v20[3] = &unk_1E62C6B20;
      v20[4] = self;
      id v8 = v7;
      id v21 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v20];
      BOOL v9 = v21;
      char v10 = v8;

      char v11 = v10;
      goto LABEL_9;
    }
    char v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadSharedConfigWithPropertyList:bundle:]();
    }
  }
  else
  {
    char v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadSharedConfigWithPropertyList:bundle:](v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  char v11 = 0;
LABEL_9:

  return v11;
}

void __75__NTKPlistPigmentEditOptionLoader_loadSharedConfigWithPropertyList_bundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) configurationFromNode:a3];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)loadSharedCollectionsWithPropertyList:(id)a3 bundle:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKPlistPigmentEditOptionLoader *)self loadPropertyListFromFile:v6];
  BOOL v9 = [(NTKPlistPigmentEditOptionLoader *)self extractSuffixFromFileName:v6];
  id v10 = v8;
  char v11 = [v10 objectForKeyedSubscript:@"shared-collections"];
  if (!v11)
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsWithPropertyList:bundle:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsWithPropertyList:bundle:]();
    }
    goto LABEL_11;
  }
  if ([(NTKPlistPigmentEditOptionLoader *)self hasFileLevelSensitiveUIConfig:v10]
    && self->_ignoreSensitiveUIItems)
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v6;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist because sensitive UI is disabled %{public}@", buf, 0xCu);
    }
LABEL_11:
    id v20 = 0;
    goto LABEL_23;
  }
  id v21 = [(NTKPlistPigmentEditOptionLoader *)self skuFileLevel:v10];
  uint64_t v12 = v21;
  if (!self->_ignoreSensitiveUIItems
    && v21
    && self->_sku
    && -[NSObject isEqualToNumber:](v21, "isEqualToNumber:"))
  {
    uint64_t v22 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v12;
      _os_log_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist file because it is sku specific %{public}@", buf, 0xCu);
    }
    id v20 = 0;
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v25 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v6;
      _os_log_impl(&dword_1BC5A9000, v25, OS_LOG_TYPE_INFO, "#plist-loader Loading shared collections from plist %{public}@", buf, 0xCu);
    }

    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke;
    uint64_t v32 = &unk_1E62C6B48;
    id v26 = v23;
    id v33 = v26;
    id v34 = v24;
    uint64_t v35 = self;
    id v36 = v11;
    id v37 = v9;
    id v38 = v7;
    uint64_t v22 = v24;
    [v36 enumerateKeysAndObjectsUsingBlock:&v29];
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_120, v29, v30, v31, v32);
    id v27 = v38;
    id v20 = v26;
  }
LABEL_23:

  return v20;
}

void __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (!v7 && ([*(id *)(a1 + 40) containsObject:v5] & 1) == 0)
  {
    id v8 = [(id)objc_opt_class() modifyContentRootForImplicitCollectionsIfNeeded:v6];
    char v15 = 0;
    BOOL v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
    uint64_t v14 = [v9 discoverCollectionWithName:v5 contentRoot:v8 collectionsRoot:v10 discoveredCollections:v11 privateDiscoveredCollections:0 discoveredInvalidCollections:v12 invalidDependecies:v13 hasCycle:&v15 plistSuffix:*(void *)(a1 + 64) bundle:*(void *)(a1 + 72)];

    if (v14) {
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v5];
    }
  }
}

uint64_t __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setShared:1];
}

- (id)discoverCollectionWithName:(id)a3 contentRoot:(id)a4 collectionsRoot:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependecies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  id v25 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:].cold.4();
  }

  if (!v18)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    id v26 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:]();
    }
    goto LABEL_25;
  }
  id v71 = v19;
  v72 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      id v26 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR)) {
        -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:]();
      }
      goto LABEL_25;
    }
  }
  v70 = v21;
  id v26 = [[NTKPigmentCollection alloc] initWithName:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = (void *)MEMORY[0x1E4F1CA70];
    char v28 = [(NTKPlistPigmentEditOptionLoader *)self colorOptionsFromPListItems:v18 collectionName:v17 applyConfig:0 plistSuffix:v23 bundle:v24];
    uint64_t v29 = [v27 orderedSetWithArray:v28];
    [(NTKPigmentCollection *)v26 setItems:v29];

LABEL_37:
    v62 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v77 = v26;
      _os_log_impl(&dword_1BC5A9000, v62, OS_LOG_TYPE_INFO, "#plist-loader Collection discovered: %{public}@", buf, 0xCu);
    }

    id v26 = v26;
    long long v46 = v26;
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  id v30 = v18;
  [v22 addObject:v17];
  v69 = v30;
  id v31 = [(NTKPlistPigmentEditOptionLoader *)self configurationFromNode:v30 collectionName:v17];
  [(NTKPigmentCollection *)v26 setConfig:v31];

  uint64_t v32 = [(NTKPigmentCollection *)v26 config];
  id v33 = [v32 featureFlag];

  if (v33)
  {
    id v34 = [(NTKPigmentCollection *)v26 config];
    id v35 = [v34 featureFlag];
    [v35 cStringUsingEncoding:1];
    char v36 = _os_feature_enabled_impl();

    if ((v36 & 1) == 0)
    {
      v42 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [(NTKPigmentCollection *)v26 config];
        long long v44 = [v43 featureFlag];
        *(_DWORD *)buf = 138543618;
        v77 = v44;
        __int16 v78 = 2114;
        id v79 = v17;
        long long v45 = "#plist-loader Feature flag %{public}@ is disabled. Ignoring collection %{public}@";
        goto LABEL_23;
      }
LABEL_24:
      id v19 = v71;
      id v20 = v72;
      id v21 = v70;

LABEL_25:
      long long v46 = 0;
      goto LABEL_41;
    }
  }
  if (!self->_includesAllDeviceSpecificColors)
  {
    id v37 = [(NTKPigmentCollection *)v26 config];
    id v38 = [v37 sku];
    if (v38 && self->_sku)
    {
      v65 = v38;
      [(NTKPigmentCollection *)v26 config];
      uint64_t v39 = v67 = v37;
      uint64_t v40 = [v39 sku];
      char v41 = [v40 isEqualToNumber:self->_sku];

      if ((v41 & 1) == 0)
      {
        v42 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = [(NTKPigmentCollection *)v26 config];
          long long v44 = [v43 sku];
          *(_DWORD *)buf = 138543618;
          v77 = v44;
          __int16 v78 = 2114;
          id v79 = v17;
          long long v45 = "#plist-loader Collection is sku only %{public}@. Ignoring %{public}@";
LABEL_23:
          _os_log_impl(&dword_1BC5A9000, v42, OS_LOG_TYPE_DEFAULT, v45, buf, 0x16u);

          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else
    {
    }
  }
  v68 = v22;
  long long v47 = [(NTKPigmentCollection *)v26 collectionName];
  v48 = [(NTKPigmentCollection *)v26 config];
  uint64_t v49 = [(NTKPlistPigmentEditOptionLoader *)self loadNestedCollectionsFromNode:v69 parent:v47 config:v48 plistSuffix:v23 bundle:v24];

  v66 = v49;
  if (v49)
  {
    v50 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v72];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __217__NTKPlistPigmentEditOptionLoader_discoverCollectionWithName_contentRoot_collectionsRoot_discoveredCollections_privateDiscoveredCollections_discoveredInvalidCollections_invalidDependecies_hasCycle_plistSuffix_bundle___block_invoke;
    v73[3] = &unk_1E62C6B90;
    id v74 = v72;
    id v51 = v50;
    id v75 = v51;
    [v49 enumerateObjectsUsingBlock:v73];
  }
  else
  {
    id v51 = 0;
  }
  v52 = [(NTKPigmentCollection *)v26 config];
  uint64_t v64 = [(NTKPlistPigmentEditOptionLoader *)self itemsFromNode:v69 collectionName:v17 applyingConfig:v52 plistSuffix:v23 bundle:v24];

  v53 = (void *)[v68 mutableCopy];
  v54 = [(NTKPlistPigmentEditOptionLoader *)self importedCollectionsWithNode:v69 sharedCollectionsRoot:v71 parent:v17 discoveredCollections:v72 privateDiscoveredCollections:v51 discoveredInvalidCollections:v70 invalidDependencies:v53 hasCycle:a10 plistSuffix:v23 bundle:v24];
  [(NTKPigmentCollection *)v26 setCollections:v54];

  BOOL v55 = *a10;
  if (*a10)
  {
    v56 = (void *)v64;
    v57 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:]();
    }

    [v70 addObject:v17];
    id v20 = v72;
  }
  else
  {
    v58 = [(NTKPigmentCollection *)v26 config];
    [v58 removeExcludedItemsFromList:v64];

    v59 = [(NTKPigmentCollection *)v26 config];
    [v59 applyCollectionOverrideNameOnItems:v64];

    [(NTKPigmentCollection *)v26 setItems:v64];
    v60 = [(NTKPigmentCollection *)v26 config];
    v61 = [v60 defaultGalleryColorNames];
    [(NTKPigmentCollection *)v26 setDefaultGalleryColorWithNames:v61];

    id v20 = v72;
    v56 = (void *)v64;
  }

  id v22 = v68;
  if (!v55) {
    goto LABEL_37;
  }
  long long v46 = 0;
LABEL_40:
  id v19 = v71;
  id v21 = v70;
LABEL_41:

  return v46;
}

void __217__NTKPlistPigmentEditOptionLoader_discoverCollectionWithName_contentRoot_collectionsRoot_discoveredCollections_privateDiscoveredCollections_discoveredInvalidCollections_invalidDependecies_hasCycle_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 collectionName];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v11 collectionName];
    [v4 setObject:v11 forKeyedSubscript:v5];

    id v6 = *(void **)(a1 + 40);
    id v7 = [v11 collectionName];
    [v6 setObject:v11 forKeyedSubscript:v7];

    id v8 = [v11 collectionName];
    BOOL v9 = [v8 componentsSeparatedByString:@"."];
    uint64_t v10 = [v9 lastObject];

    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];
  }
}

- (id)loadNestedCollectionsFromNode:(id)a3 parent:(id)a4 config:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 objectForKeyedSubscript:@"collections"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [MEMORY[0x1E4F1CA48] array];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke;
      v24[3] = &unk_1E62C6BB8;
      id v25 = v12;
      id v26 = v13;
      id v27 = self;
      id v28 = v15;
      id v29 = v16;
      id v30 = v14;
      id v19 = v18;
      id v31 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v24];
      id v20 = v31;
      id v21 = v19;

      id v22 = v21;
      goto LABEL_9;
    }
    id v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:]();
    }
  }
  else
  {
    id v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:](v21);
    }
  }
  id v22 = 0;
LABEL_9:

  return v22;
}

void __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = [NSString stringWithFormat:@"%@%@%@", *(void *)(a1 + 40), @".", v5];
    char v13 = 0;
    id v8 = [*(id *)(a1 + 48) discoverCollectionWithName:v7 contentRoot:v6 collectionsRoot:0 discoveredCollections:0 privateDiscoveredCollections:0 discoveredInvalidCollections:0 invalidDependecies:0 hasCycle:&v13 plistSuffix:*(void *)(a1 + 56) bundle:*(void *)(a1 + 64)];
    BOOL v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 items];
      id v11 = (void *)[v10 mutableCopy];

      if (v11)
      {
        id v12 = (void *)[*(id *)(a1 + 48) copyItemsApplyingConfiguration:v11 configuration:*(void *)(a1 + 72)];

        [*(id *)(a1 + 72) applyCollectionOverrideNameOnItems:v12];
        [v9 setItems:v12];
      }
      [*(id *)(a1 + 80) addObject:v9];
    }
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke_cold_1((uint64_t)v6, a1, v7);
    }
  }
}

- (id)importedCollectionsWithNode:(id)a3 sharedCollectionsRoot:(id)a4 parent:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependencies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v41 = a4;
  id v40 = a5;
  id v39 = a6;
  id v38 = a7;
  id v37 = a8;
  id v36 = a9;
  id v18 = a11;
  id v19 = a12;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = v17;
  id v20 = [(NTKPlistPigmentEditOptionLoader *)self alternativePropertyNamesForProperty:@"imports" inNode:v17];
  [v20 addObject:@"imports"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v27 = [v35 objectForKeyedSubscript:v26];
        id v28 = [(NTKPlistPigmentEditOptionLoader *)self importedCollectionsFromImports:v27 propertyName:v26 sharedCollectionsRoot:v41 parent:v40 discoveredCollections:v39 privateDiscoveredCollections:v38 discoveredInvalidCollections:v37 invalidDependencies:v36 hasCycle:a10 plistSuffix:v18 bundle:v19];

        if (v28) {
          [v34 addObjectsFromArray:v28];
        }
        BOOL v29 = *a10;

        if (v29)
        {

          id v31 = 0;
          id v30 = v34;
          goto LABEL_13;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  id v30 = v34;
  id v31 = v34;
LABEL_13:

  return v31;
}

- (id)importedCollectionsFromImports:(id)a3 propertyName:(id)a4 sharedCollectionsRoot:(id)a5 parent:(id)a6 discoveredCollections:(id)a7 privateDiscoveredCollections:(id)a8 discoveredInvalidCollections:(id)a9 invalidDependencies:(id)a10 hasCycle:(BOOL *)a11 plistSuffix:(id)a12 bundle:(id)a13
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v18 = a4;
  id v54 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v53 = a9;
  id v22 = a10;
  id v56 = a12;
  id v23 = a13;
  uint64_t v24 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[NTKPlistPigmentEditOptionLoader importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:]();
  }
  BOOL v55 = v23;

  if (v21)
  {
    id v25 = v21;

    id v20 = v25;
  }
  uint64_t v26 = v52;
  if (!v52)
  {
    log = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:]();
    }
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    log = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v67 = (uint64_t)v18;
      __int16 v68 = 2048;
      id v69 = v19;
      __int16 v70 = 2114;
      uint64_t v71 = objc_opt_class();
      _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "#plist-loader '%{public}@' for %public}@ found with incorrect type - It should be an array but it was %{public}@. Returning empty items for dependencies", buf, 0x20u);
    }
LABEL_38:
    long long v46 = MEMORY[0x1E4F1CBF0];
    goto LABEL_46;
  }
  id v48 = v21;
  id v49 = v18;
  log = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v52;
  uint64_t v27 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  id v28 = v55;
  id v29 = v56;
  if (v27)
  {
    uint64_t v30 = v27;
    uint64_t v60 = *(void *)v62;
    id v50 = v22;
    id v51 = v19;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v62 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = [(NTKPlistPigmentEditOptionLoader *)self colorOptionsFromPListItems:v32 collectionName:v19 applyConfig:0 plistSuffix:v29 bundle:v28];
          if (v33)
          {
            id v34 = [[NTKPigmentCollection alloc] initWithName:v19];
            id v35 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v33];
            [(NTKPigmentCollection *)v34 setItems:v35];

            [log addObject:v34];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = v32;
            id v36 = [v20 objectForKeyedSubscript:v33];
            if ([v22 containsObject:v33]) {
              BOOL v37 = v36 == 0;
            }
            else {
              BOOL v37 = 0;
            }
            if (v37)
            {
              *a11 = 1;
LABEL_41:

              goto LABEL_42;
            }
            if (v36)
            {
              [log addObject:v36];
            }
            else
            {
              id v39 = [v54 objectForKeyedSubscript:v33];
              uint64_t v40 = [v22 mutableCopy];
              id v41 = v20;
              long long v42 = (void *)v40;
              long long v43 = v41;
              long long v44 = -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:](self, "discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:", v33, v39, v54, v40, a11, v29, v28);

              if (*a11)
              {

                id v20 = v43;
                id v22 = v50;
                id v19 = v51;
                goto LABEL_41;
              }
              if (v44)
              {
                [log addObject:v44];
                long long v45 = [v44 collectionName];
                [v43 setObject:v44 forKeyedSubscript:v45];
              }
              else
              {
                long long v45 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v67 = (uint64_t)v33;
                  _os_log_error_impl(&dword_1BC5A9000, v45, OS_LOG_TYPE_ERROR, "#plist-loader %{public}@ collection does not exist.", buf, 0xCu);
                }
              }

              id v20 = v43;
              id v22 = v50;
              id v19 = v51;
              id v28 = v55;
              id v29 = v56;
            }
          }
          else
          {
            id v33 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v38 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              uint64_t v67 = v38;
              __int16 v68 = 2114;
              id v69 = v19;
              _os_log_error_impl(&dword_1BC5A9000, v33, OS_LOG_TYPE_ERROR, "#plist-loader dependency entry should be either String or Array - %{public}@ - Parent: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }
LABEL_42:

  if (*a11)
  {
    long long v46 = 0;
  }
  else
  {
    long long v46 = log;
    log = v46;
  }
  uint64_t v26 = v52;
  id v21 = v48;
  id v18 = v49;
LABEL_46:

  return v46;
}

- (id)configurationFromNode:(id)a3 collectionName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKPlistPigmentEditOptionLoader *)self configurationWithName:@"config" fromNode:v6 collectionName:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v9 = [(NTKPlistPigmentEditOptionLoader *)self alternativePropertyNamesForProperty:@"config", v6, 0 inNode];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(NTKPlistPigmentEditOptionLoader *)self configurationWithName:*(void *)(*((void *)&v16 + 1) + 8 * i) fromNode:v6 collectionName:v7];
        [v8 overridePropertiesFromConfig:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)configurationWithName:(id)a3 fromNode:(id)a4 collectionName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 objectForKeyedSubscript:v8];
  if (v10)
  {
    uint64_t v11 = [(NTKPlistPigmentEditOptionLoader *)self configurationFromNode:v10];
  }
  else
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[NTKPlistPigmentEditOptionLoader configurationWithName:fromNode:collectionName:]();
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)configurationFromNode:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"shared-config"];
    if (![v5 length]
      || ([(NTKPlistPigmentEditOptionLoader *)self sharedConfigs],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v6 objectForKeyedSubscript:v5],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v7)
      || (id v8 = (NTKPigmentCollectionConfig *)[v7 copy], v7, !v8))
    {
      id v8 = objc_alloc_init(NTKPigmentCollectionConfig);
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"sensitivity"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setSensitivity:v9];
      }
      else
      {
        uint64_t v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:]2(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"isAddable"];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setIsAddable:v20];
      }
      else
      {
        uint64_t v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:]1(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
    }
    uint64_t v29 = [v4 objectForKeyedSubscript:@"supports-slider"];
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setSupportsSlider:v29];
      }
      else
      {
        uint64_t v30 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:]0(v30, v31, v32, v33, v34, v35, v36, v37);
        }
      }
    }
    uint64_t v38 = (void *)v9;
    id v39 = [v4 objectForKeyedSubscript:@"default"];
    uint64_t v40 = self;
    id v41 = [(NTKPlistPigmentEditOptionLoader *)self alternativePropertyNamesForProperty:@"default" inNode:v4 includesAllDeviceSpecificColors:0];
    v118 = v41;
    if ([v41 count])
    {
      v122 = [v41 lastObject];
      long long v42 = objc_msgSend(v4, "objectForKeyedSubscript:");
      long long v43 = v42;
      if (v42)
      {
        id v44 = v42;
        long long v45 = v39;
        id v39 = v44;
      }
      long long v46 = v40;
      id v120 = v39;
    }
    else
    {
      id v120 = v39;
      v122 = @"default";
      long long v46 = v40;
    }
    uint64_t v47 = v5;
    v115 = (void *)v29;
    id v48 = [(NTKPigmentCollectionConfig *)v8 defaultConfigAttributeName];
    id v49 = v38;
    v116 = (void *)v20;
    if (v48)
    {
      id v50 = [(NTKPigmentCollectionConfig *)v8 defaultConfigAttributeName];
      id v51 = v122;
      int v52 = [(__CFString *)v122 isEqual:v50];
    }
    else
    {
      int v52 = 1;
      id v51 = v122;
    }

    [(NTKPigmentCollectionConfig *)v8 setDefaultConfigAttributeName:v51];
    id v53 = v120;
    if (v120)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v52) {
          [(NTKPigmentCollectionConfig *)v8 setDefaultColorOptionName:v120];
        }
        else {
          [(NTKPigmentCollectionConfig *)v8 setFallbackDefaultColorOptionName:v120];
        }
      }
      else
      {
        id v54 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.9(v54, v55, v56, v57, v58, v59, v60, v61);
        }
      }
    }
    long long v62 = [v4 objectForKeyedSubscript:@"migration"];
    if (v62)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setMigration:v62];
      }
      else
      {
        long long v63 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.8();
        }
      }
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"feature-flag"];
    if (v64)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setFeatureFlag:v64];
      }
      else
      {
        v65 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.7();
        }
      }
    }
    uint64_t v121 = [v4 objectForKeyedSubscript:@"sku"];
    if (v121)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setSku:v121];
      }
      else
      {
        v66 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.6();
        }
      }
    }
    uint64_t v67 = [v4 objectForKeyedSubscript:@"sortedByHue"];
    v113 = (void *)v67;
    if (v67)
    {
      uint64_t v68 = v67;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setSortedByHue:v68];
      }
      else
      {
        id v69 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.5();
        }
      }
    }
    __int16 v70 = @"exclusions";
    v119 = [(NTKPlistPigmentEditOptionLoader *)v46 alternativePropertyNamesForProperty:@"exclusions" inNode:v4 includesAllDeviceSpecificColors:0];
    if ([v119 count] == 1)
    {
      uint64_t v71 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v129 = @"exclusions";
        __int16 v130 = 2114;
        id v131 = v4;
        _os_log_impl(&dword_1BC5A9000, v71, OS_LOG_TYPE_DEFAULT, "#plist-loader Retrieving alternative property for %{public}@ - %{public}@", buf, 0x16u);
      }

      __int16 v70 = [v119 firstObject];
    }
    v112 = v70;
    v114 = (void *)v64;
    uint64_t v72 = [v4 objectForKeyedSubscript:v70];
    v117 = (void *)v72;
    if (v72)
    {
      uint64_t v73 = v72;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setExclusions:v73];
      }
      else
      {
        id v74 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.4();
        }
      }
    }
    uint64_t v75 = [v4 objectForKeyedSubscript:@"excludes-duotone"];
    v111 = (void *)v75;
    if (v75)
    {
      uint64_t v76 = v75;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setExcludesDuotone:v76];
      }
      else
      {
        v77 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:](v77, v78, v79, v80, v81, v82, v83, v84);
        }
      }
    }
    uint64_t v85 = [v4 objectForKeyedSubscript:@"collectionOverride"];
    if (v85)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(NTKPigmentCollectionConfig *)v8 setCollectionOverride:v85];
      }
      else
      {
        v86 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:]();
        }
      }
    }
    v110 = (void *)v85;
    v87 = [v4 objectForKeyedSubscript:@"gallery-default"];
    v88 = [(NTKPlistPigmentEditOptionLoader *)v46 alternativePropertyNamesForProperty:@"gallery-default" inNode:v4];
    v109 = v88;
    if ([v88 count] == 1)
    {
      v89 = [v88 firstObject];
      uint64_t v90 = [v4 objectForKeyedSubscript:v89];

      v87 = (void *)v90;
      id v53 = v120;
    }
    v91 = v118;
    v92 = (void *)v121;
    if (v87)
    {
      v108 = v62;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v104 = v8;
        v105 = v49;
        v106 = v47;
        id v107 = v4;
        v93 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v87, "count"));
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        v103 = v87;
        id v94 = v87;
        uint64_t v95 = [v94 countByEnumeratingWithState:&v123 objects:v127 count:16];
        if (v95)
        {
          uint64_t v96 = v95;
          uint64_t v97 = *(void *)v124;
          do
          {
            for (uint64_t i = 0; i != v96; ++i)
            {
              if (*(void *)v124 != v97) {
                objc_enumerationMutation(v94);
              }
              v99 = *(__CFString **)(*((void *)&v123 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v100 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v129 = v99;
                  _os_log_error_impl(&dword_1BC5A9000, v100, OS_LOG_TYPE_ERROR, "config.gallery-default Ignoring one gallery option because is it not a string type. %{public}@", buf, 0xCu);
                }
              }
              -[NSObject addObject:](v93, "addObject:", v99, v103);
            }
            uint64_t v96 = [v94 countByEnumeratingWithState:&v123 objects:v127 count:16];
          }
          while (v96);
        }

        id v8 = v104;
        [(NTKPigmentCollectionConfig *)v104 setDefaultGalleryColorNames:v93];
        uint64_t v47 = v106;
        id v4 = v107;
        id v49 = v105;
        id v53 = v120;
        v92 = (void *)v121;
        v91 = v118;
        v87 = v103;
      }
      else
      {
        v93 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:]();
        }
      }

      long long v62 = v108;
    }
    v101 = v87;
    uint64_t v10 = v8;

    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader configurationFromNode:]3();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)hasFileLevelSensitiveUIConfig:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"sensitivity"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [v3 integerValue];
    id v5 = [MEMORY[0x1E4F19A98] sharedMonitor];
    char v6 = [v5 considersUISensitivitySensitive:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)skuFileLevel:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"sku"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)itemsFromNode:(id)a3 collectionName:(id)a4 applyingConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v30 = a5;
  id v29 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v16 = self;
  id obj = [(NTKPlistPigmentEditOptionLoader *)self alternativePropertyNamesForProperty:@"items" inNode:v12];
  uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v22 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v21;
          __int16 v37 = 2114;
          id v38 = v13;
          __int16 v39 = 2114;
          id v40 = v12;
          _os_log_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_DEFAULT, "#plist-loader Retrieving alternative property for %{public}@ - collection name: %{public}@, node: %{public}@", buf, 0x20u);
        }

        uint64_t v23 = [v12 objectForKeyedSubscript:v21];
        uint64_t v24 = [(NTKPlistPigmentEditOptionLoader *)v16 colorOptionsFromPListItems:v23 collectionName:v13 applyConfig:v30 plistSuffix:v29 bundle:v14];
        [v15 addObjectsFromArray:v24];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v18);
  }

  uint64_t v25 = [v12 objectForKeyedSubscript:@"items"];
  uint64_t v26 = [(NTKPlistPigmentEditOptionLoader *)v16 colorOptionsFromPListItems:v25 collectionName:v13 applyConfig:v30 plistSuffix:v29 bundle:v14];
  [v15 addObjectsFromArray:v26];

  return v15;
}

- (BOOL)isValidPigment:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock(&isValidPigment____lock);
  id WeakRetained = objc_loadWeakRetained(&isValidPigment____cachedDevice);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = [MEMORY[0x1E4F19A30] currentDevice];
    id v7 = objc_loadWeakRetained(&isValidPigment____cachedDevice);
    if (v6 == v7)
    {
      id v8 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v9 = [v8 version];
      uint64_t v10 = isValidPigment____previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F19A30] currentDevice];
  objc_storeWeak(&isValidPigment____cachedDevice, v11);

  id v12 = objc_loadWeakRetained(&isValidPigment____cachedDevice);
  isValidPigment____previousCLKDeviceVersion = [v12 version];

  id v13 = [MEMORY[0x1E4F19A30] currentDevice];
  isValidPigment____isOfTheBear = NTKGizmoOrCompanionAreRussian(v13);

LABEL_6:
  os_unfair_lock_unlock(&isValidPigment____lock);
  if (v3)
  {
    if (isValidPigment____isOfTheBear) {
      int v14 = [v3 isPrideOption] ^ 1;
    }
    else {
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (id)colorOptionsFromPListItems:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v49 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v34 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:](v34, v40, v41, v42, v43, v44, v45, v46);
        }
        goto LABEL_56;
      }
    }
    objc_opt_class();
    id v51 = v14;
    if (objc_opt_isKindOfClass())
    {
      id v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v48 = v12;
      id obj = v12;
      uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      id v18 = v49;
      if (!v17) {
        goto LABEL_41;
      }
      uint64_t v19 = v17;
      uint64_t v54 = *(void *)v64;
      id v53 = v15;
      while (1)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v22 = [[NTKPigmentEditOption alloc] initWithOptionName:v21 collectionName:v13];
            if (![(NTKPlistPigmentEditOptionLoader *)self isValidPigment:v22])
            {
              long long v33 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v70 = v21;
                _os_log_impl(&dword_1BC5A9000, v33, OS_LOG_TYPE_DEFAULT, "#plist-loader Edit option item found but failed to create NTKPigmentEditOption. Could be locale related. Ignoring it. %{public}@", buf, 0xCu);
              }

LABEL_36:
              id v15 = v53;
              goto LABEL_39;
            }
            [(NTKPigmentEditOption *)v22 setFromStore:1];
            if (v14) {
              [(NTKPigmentEditOption *)v22 setAlternativeLocalizedStringTableName:v14];
            }
            uint64_t v23 = [v15 bundlePath];
            uint64_t v24 = [v50 bundlePath];
            char v25 = [v23 isEqualToString:v24];

            id v15 = v53;
            if ((v25 & 1) == 0 && [v53 principalClass])
            {
              uint64_t v26 = NSStringFromClass((Class)[v53 principalClass]);
              [(NTKPigmentEditOption *)v22 setBundlePrincipalClassName:v26];
            }
            [(NTKPlistPigmentEditOptionLoader *)self applyConfigurationOnEditOption:v22 configuration:v18];
            if (![(NTKPigmentEditOption *)v22 isSensitiveUI] || !self->_ignoreSensitiveUIItems) {
              [v16 addObject:v22];
            }
            id v14 = v51;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v22 = [(NTKPlistPigmentEditOptionLoader *)self colorOptionsFromItemsDictionary:v21 collectionName:v13 applyConfig:v18 plistSuffix:v14 bundle:v15];
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              uint64_t v27 = [(NTKPigmentEditOption *)v22 countByEnumeratingWithState:&v59 objects:v68 count:16];
              if (!v27) {
                goto LABEL_39;
              }
              uint64_t v28 = v27;
              id v29 = v13;
              uint64_t v30 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v60 != v30) {
                    objc_enumerationMutation(v22);
                  }
                  long long v32 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                  if (![v32 isSensitiveUI] || !self->_ignoreSensitiveUIItems) {
                    [v16 addObject:v32];
                  }
                }
                uint64_t v28 = [(NTKPigmentEditOption *)v22 countByEnumeratingWithState:&v59 objects:v68 count:16];
              }
              while (v28);
              id v13 = v29;
              id v18 = v49;
              id v14 = v51;
              goto LABEL_36;
            }
            _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
            uint64_t v22 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v22->super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v70 = v21;
              _os_log_error_impl(&dword_1BC5A9000, &v22->super.super, OS_LOG_TYPE_ERROR, "#plist-loader Edit option item found with incorrect type -  It should be a string or a dictionary. Ignoring it. %{public}@", buf, 0xCu);
            }
          }
LABEL_39:
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (!v19)
        {
LABEL_41:

          id v12 = v48;
          long long v34 = v50;
          goto LABEL_56;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = [(NTKPlistPigmentEditOptionLoader *)self colorOptionsFromItemsDictionary:v12 collectionName:v13 applyConfig:v49 plistSuffix:v14 bundle:v15];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v56 != v37) {
              objc_enumerationMutation(v34);
            }
            __int16 v39 = *(void **)(*((void *)&v55 + 1) + 8 * k);
            if (![v39 isSensitiveUI] || !self->_ignoreSensitiveUIItems) {
              [v16 addObject:v39];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
        }
        while (v36);
        id v14 = v51;
      }
LABEL_56:
    }
  }

  return v16;
}

- (id)colorOptionsFromItemsDictionary:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v17 = a3;
  id v18 = objc_alloc_init(v16);
  uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke;
  v29[3] = &unk_1E62C6BE0;
  id v30 = v12;
  long long v31 = self;
  id v32 = v14;
  id v33 = v15;
  id v34 = v19;
  id v35 = v13;
  id v20 = v18;
  id v36 = v20;
  id v21 = v13;
  id v22 = v19;
  id v23 = v15;
  id v24 = v14;
  id v25 = v12;
  [v17 enumerateKeysAndObjectsUsingBlock:v29];

  [v20 sortUsingComparator:&__block_literal_global_154];
  uint64_t v26 = v36;
  id v27 = v20;

  return v27;
}

void __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[NTKPigmentEditOption alloc] initWithOptionName:v5 collectionName:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 40) isValidPigment:v6])
    {
      [(NTKPigmentEditOption *)v6 setFromStore:1];
      if (*(void *)(a1 + 48)) {
        -[NTKPigmentEditOption setAlternativeLocalizedStringTableName:](v6, "setAlternativeLocalizedStringTableName:");
      }
      id v7 = [*(id *)(a1 + 56) bundlePath];
      id v8 = [*(id *)(a1 + 64) bundlePath];
      char v9 = [v7 isEqualToString:v8];

      if ((v9 & 1) == 0 && [*(id *)(a1 + 56) principalClass])
      {
        uint64_t v10 = NSStringFromClass((Class)[*(id *)(a1 + 56) principalClass]);
        [(NTKPigmentEditOption *)v6 setBundlePrincipalClassName:v10];
      }
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      [(NTKPigmentEditOption *)v6 setDesiredPosition:v11];

      [*(id *)(a1 + 40) applyConfigurationOnEditOption:v6 configuration:*(void *)(a1 + 72)];
      [*(id *)(a1 + 80) addObject:v6];
    }
  }
}

uint64_t __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 desiredPosition];
  id v6 = [v4 desiredPosition];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)copyItemsApplyingConfiguration:(id)a3 configuration:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copy", (void)v16);
        [(NTKPlistPigmentEditOptionLoader *)self applyConfigurationOnEditOption:v14 configuration:v7];
        if (![v14 isSensitiveUI] || !self->_ignoreSensitiveUIItems) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)applyConfigurationOnEditOption:(id)a3 configuration:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  id v6 = [v5 sensitivity];
  uint64_t v7 = [v6 integerValue];

  id v8 = [MEMORY[0x1E4F19A98] sharedMonitor];
  LODWORD(v7) = [v8 considersUISensitivitySensitive:v7];

  if (v7) {
    [v17 setIsSensitiveUI:1];
  }
  id v9 = [v5 sortedByHue];

  if (v9)
  {
    uint64_t v10 = [v5 sortedByHue];
    objc_msgSend(v17, "setSortedByHue:", objc_msgSend(v10, "BOOLValue"));
  }
  uint64_t v11 = [v5 isAddable];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = [v5 isAddable];
    objc_msgSend(v17, "setIsAddable:", objc_msgSend(v13, "BOOLValue"));
  }
  id v14 = [v5 supportsSlider];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    long long v16 = [v5 supportsSlider];
    objc_msgSend(v17, "setSupportsSlider:", objc_msgSend(v16, "BOOLValue"));
  }
}

- (id)loadPropertyListFromFile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
  if (!v4)
  {
    id v5 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:]();
    }
  }
  return v4;
}

- (id)sortedPlistFilesWithMainBundle:(id)a3 faceBundle:(id)a4 additionalBundles:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v40 = a4;
  id v39 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  uint64_t v37 = v8;
  if (v9->_plistFiles)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    plistFiles = v9->_plistFiles;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke;
    v56[3] = &unk_1E62C0160;
    id v12 = v10;
    id v57 = v12;
    id v58 = v8;
    [(NSArray *)plistFiles enumerateObjectsUsingBlock:v56];
    id v13 = (id)[v12 copy];
    id v38 = v12;

    id v14 = v57;
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = [v8 pathForResource:@"FaceColors" ofType:@".color.plist"];
    if (v16)
    {
      id v17 = [[NTKPlistBundle alloc] initWithPlist:v16 bundle:v8];
      [v15 addObject:v17];
    }
    id v38 = v16;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_2;
    v53[3] = &unk_1E62C6C28;
    id v19 = v18;
    id v54 = v19;
    id v55 = v40;
    [(NTKPlistPigmentEditOptionLoader *)v9 enumerateColorEditOptionFilesInBundle:v55 sorted:1 block:v53];
    [v15 addObjectsFromArray:v19];
    id v36 = v15;
    if (!v9->_sortedAdditionalPlistFiles)
    {
      if (!v9->_bundlePlistsFromFacesWithoutBundle)
      {
        id v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        bundlePlistsFromFacesWithoutBundle = v9->_bundlePlistsFromFacesWithoutBundle;
        v9->_bundlePlistsFromFacesWithoutBundle = v20;
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_3;
      v48[3] = &unk_1E62C6C50;
      id v49 = v16;
      id v50 = v9;
      id v51 = v37;
      id v23 = v22;
      id v52 = v23;
      [(NTKPlistPigmentEditOptionLoader *)v9 enumerateColorEditOptionFilesInBundle:v51 sorted:0 block:v48];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v24 = v39;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v60 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_4;
            v41[3] = &unk_1E62C6C28;
            id v42 = v23;
            uint64_t v43 = v28;
            [(NTKPlistPigmentEditOptionLoader *)v9 enumerateColorEditOptionFilesInBundle:v28 sorted:0 block:v41];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v60 count:16];
        }
        while (v25);
      }

      uint64_t v29 = [(NTKPlistPigmentEditOptionLoader *)v9 sortedColorPListBundles:v23];
      sortedAdditionalPlistFiles = v9->_sortedAdditionalPlistFiles;
      v9->_sortedAdditionalPlistFiles = (NSArray *)v29;

      id v15 = v36;
    }
    objc_msgSend(v15, "addObjectsFromArray:", v9->_bundlePlistsFromFacesWithoutBundle, v19);
    [v15 addObjectsFromArray:v9->_sortedAdditionalPlistFiles];
    long long v31 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v32 = objc_msgSend(v36, "ntk_flatDescription");
      -[NTKPlistPigmentEditOptionLoader sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:](v32, buf, v31);
    }

    id v33 = v55;
    id v13 = v36;

    id v14 = v35;
  }

  objc_sync_exit(v9);
  return v13;
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [[NTKPlistBundle alloc] initWithPlist:v4 bundle:*(void *)(a1 + 40)];

  [v3 addObject:v5];
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [[NTKPlistBundle alloc] initWithPlist:v4 bundle:*(void *)(a1 + 40)];

  [v3 addObject:v5];
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 40) plistFacesWithoutFaceBundle];
    id v4 = objc_msgSend(v9, "ntk_extractFileName");
    int v5 = [v3 containsObject:v4];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) bundlePlistsFromFacesWithoutBundle];
      uint64_t v7 = [[NTKPlistBundle alloc] initWithPlist:v9 bundle:*(void *)(a1 + 48)];
      [(NTKPlistBundle *)v6 addObject:v7];
    }
    else
    {
      id v8 = *(void **)(a1 + 56);
      id v6 = [[NTKPlistBundle alloc] initWithPlist:v9 bundle:*(void *)(a1 + 48)];
      [v8 addObject:v6];
    }
  }
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [[NTKPlistBundle alloc] initWithPlist:v4 bundle:*(void *)(a1 + 40)];

  [v3 addObject:v5];
}

- (id)plistFacesWithoutFaceBundle
{
  if (plistFacesWithoutFaceBundle_onceToken != -1) {
    dispatch_once(&plistFacesWithoutFaceBundle_onceToken, &__block_literal_global_160);
  }
  v2 = (void *)plistFacesWithoutFaceBundle_plists;
  return v2;
}

void __62__NTKPlistPigmentEditOptionLoader_plistFacesWithoutFaceBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F16EA150];
  v1 = (void *)plistFacesWithoutFaceBundle_plists;
  plistFacesWithoutFaceBundle_plists = v0;
}

- (void)enumerateColorEditOptionFilesInBundle:(id)a3 sorted:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void))a5;
  id v8 = [a3 pathsForResourcesOfType:@".color.plist" inDirectory:@"."];
  if (v5)
  {
    uint64_t v9 = [(id)objc_opt_class() sortedColorFileNames:v8];

    id v8 = (void *)v9;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        v7[2](v7, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (id)sortedColorFileNames:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NTKPlistPigmentEditOptionLoader_sortedColorFileNames___block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v5[4] = a1;
  id v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __56__NTKPlistPigmentEditOptionLoader_sortedColorFileNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareColorFileNames:v5 otherFileName:v4 fileExtension:@".color.plist"];

  return v6;
}

- (id)sortedColorPListBundles:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NTKPlistPigmentEditOptionLoader_sortedColorPListBundles___block_invoke;
  v5[3] = &unk_1E62C6C98;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __59__NTKPlistPigmentEditOptionLoader_sortedColorPListBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v5 plistFileName];

  id v8 = [v4 plistFileName];

  uint64_t v9 = [v6 compareColorFileNames:v7 otherFileName:v8 fileExtension:@".color.plist"];
  return v9;
}

+ (id)sortedCollectionNamesFromCollections:(id)a3
{
  id v3 = [a3 allKeys];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_182];

  id v5 = (void *)[v4 copy];
  return v5;
}

uint64_t __72__NTKPlistPigmentEditOptionLoader_sortedCollectionNamesFromCollections___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)sortedUniqueOptionNamesFromCollections:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v5;
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v7 = [v6 allItems];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v13 = [v12 fullname];
              if ([v12 isMultitoneOption])
              {
                uint64_t v14 = [v12 fullname];
                long long v15 = +[NTKPigmentEditOption multitoneColorNames:v14];
                v21[0] = MEMORY[0x1E4F143A8];
                v21[1] = 3221225472;
                v21[2] = __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke;
                v21[3] = &unk_1E62C0188;
                id v22 = v4;
                [v15 enumerateObjectsUsingBlock:v21];
              }
              else
              {
                [v4 addObject:v13];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v19);
  }

  [v4 sortUsingComparator:&__block_literal_global_184];
  return v4;
}

uint64_t __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (int64_t)compareColorFileNames:(id)a3 otherFileName:(id)a4 fileExtension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v9;
  uint64_t v13 = v12;
  uint64_t v14 = v11;
  if (v10)
  {
    uint64_t v14 = [a1 extractNameFromFullFileName:v11 fileExtension:v10];

    uint64_t v13 = [a1 extractNameFromFullFileName:v12 fileExtension:v10];
  }
  if (v14 && v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__NTKPlistPigmentEditOptionLoader_compareColorFileNames_otherFileName_fileExtension___block_invoke;
    aBlock[3] = &unk_1E62C6CC0;
    id v15 = v14;
    id v31 = v15;
    id v16 = v13;
    id v32 = v16;
    id v33 = a1;
    long long v28 = (uint64_t (**)(void *, id, id))_Block_copy(aBlock);
    long long v17 = [v15 componentsSeparatedByString:@"-"];
    uint64_t v18 = [v16 componentsSeparatedByString:@"-"];
    long long v27 = [v17 firstObject];
    uint64_t v29 = [v18 firstObject];
    if ([v17 count] == 1 && objc_msgSend(v18, "count") == 1)
    {
      int64_t v19 = v28[2](v28, v15, v16);
      uint64_t v20 = v27;
    }
    else
    {
      uint64_t v20 = v27;
      uint64_t v21 = (void *)v29;
      if (![v27 isEqualToString:v29])
      {
        int64_t v19 = [a1 compareColorFileNames:v27 otherFileName:v29 fileExtension:0];
LABEL_21:

        goto LABEL_22;
      }
      if ((unint64_t)[v17 count] < 2)
      {
        long long v26 = &stru_1F1635E90;
      }
      else
      {
        id v22 = (void *)[v17 mutableCopy];
        [v22 removeObjectAtIndex:0];
        long long v26 = [v22 componentsJoinedByString:@"-"];
      }
      if ((unint64_t)[v18 count] < 2)
      {
        long long v24 = &stru_1F1635E90;
      }
      else
      {
        long long v23 = (void *)[v18 mutableCopy];
        [v23 removeObjectAtIndex:0];
        long long v24 = [v23 componentsJoinedByString:@"-"];

        uint64_t v20 = v27;
      }
      int64_t v19 = [a1 compareColorFileNames:v26 otherFileName:v24 fileExtension:0];
    }
    uint64_t v21 = (void *)v29;
    goto LABEL_21;
  }
  if (v14) {
    int64_t v19 = 1;
  }
  else {
    int64_t v19 = -1;
  }
LABEL_22:

  return v19;
}

uint64_t __85__NTKPlistPigmentEditOptionLoader_compareColorFileNames_otherFileName_fileExtension___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isEqualToString:@"FaceColors"])
  {
    uint64_t v7 = -1;
    goto LABEL_14;
  }
  if ([a1[5] isEqualToString:@"FaceColors"])
  {
    uint64_t v7 = 1;
    goto LABEL_14;
  }
  int v8 = [a1[6] containsSeasonNamePrefix:v5];
  int v9 = [a1[6] containsSeasonNamePrefix:v6];
  if ((v8 & 1) == 0 && !v9)
  {
    uint64_t v10 = [v5 compare:v6];
LABEL_10:
    uint64_t v7 = v10;
    goto LABEL_14;
  }
  if ((v8 & v9) == 1)
  {
    uint64_t v10 = [a1[6] compareSeasonName:v5 otherSeasonName:v6];
    goto LABEL_10;
  }
  if (v9) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_14:

  return v7;
}

+ (int64_t)compareSeasonName:(id)a3 otherSeasonName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 extractYearFromSeasonName:v6];
  uint64_t v9 = [a1 extractYearFromSeasonName:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = -1;
    }
  }
  else if (v8 == v9)
  {
    uint64_t v10 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 4);
    id v11 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 4);
    int64_t v12 = [a1 compareSeasonWithoutYear:v10 otherSeasonNameWithoutYear:v11];
  }
  else if (v8 < v9)
  {
    int64_t v12 = -1;
  }
  else
  {
    int64_t v12 = 1;
  }

  return v12;
}

+ (int64_t)extractYearFromSeasonName:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 4)
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v4 = objc_msgSend(v3, "substringWithRange:", objc_msgSend(v3, "length") - 4, 4);
    int64_t v5 = [v4 integerValue];
  }
  return v5;
}

+ (int64_t)compareSeasonWithoutYear:(id)a3 otherSeasonNameWithoutYear:(id)a4
{
  id v6 = a4;
  id v7 = [a1 indexForSeasonName:a3];
  uint64_t v8 = [a1 indexForSeasonName:v6];

  int64_t v9 = [v7 compare:v8];
  return v9;
}

+ (id)indexForSeasonName:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 seasonNames];
  id v6 = [v4 lowercaseString];

  uint64_t v7 = [v5 indexOfObject:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = &unk_1F16E2718;
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithInteger:v7];
  }
  return v8;
}

+ (BOOL)containsSeasonNamePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int64_t v5 = [a1 seasonNames];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NTKPlistPigmentEditOptionLoader_containsSeasonNamePrefix___block_invoke;
  v8[3] = &unk_1E62C6CE8;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __60__NTKPlistPigmentEditOptionLoader_containsSeasonNamePrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 lowercaseString];
  int v9 = [v8 hasPrefix:v7];

  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)seasonNames
{
  if (seasonNames_onceToken != -1) {
    dispatch_once(&seasonNames_onceToken, &__block_literal_global_190);
  }
  v2 = (void *)seasonNames_seasons;
  return v2;
}

void __46__NTKPlistPigmentEditOptionLoader_seasonNames__block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v4[0] = @"spring";
  v4[1] = @"summer";
  v4[2] = @"ss";
  v4[3] = @"fall";
  v4[4] = @"winter";
  v4[5] = @"fw";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)seasonNames_seasons;
  seasonNames_seasons = v2;
}

+ (id)extractNameFromFullFileName:(id)a3 fileExtension:(id)a4
{
  id v5 = a4;
  id v6 = [a3 pathComponents];
  id v7 = [v6 lastObject];

  unint64_t v8 = [v5 length];
  if ([v7 length] >= v8)
  {
    uint64_t v9 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - v8);

    id v7 = (void *)v9;
  }
  return v7;
}

- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4
{
  return [(NTKPlistPigmentEditOptionLoader *)self alternativePropertyNamesForProperty:a3 inNode:a4 includesAllDeviceSpecificColors:self->_includesAllDeviceSpecificColors];
}

- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4 includesAllDeviceSpecificColors:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke;
  v36[3] = &unk_1E62C6D10;
  id v12 = v8;
  id v37 = v12;
  id v13 = v11;
  id v38 = v13;
  id v14 = v10;
  id v39 = v14;
  [v9 enumerateKeysAndObjectsUsingBlock:v36];
  if (v5)
  {
    id v15 = (uint64_t *)v13;
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sku = self->_sku;
    if (sku)
    {
      uint64_t v18 = [NSString stringWithFormat:@"%@%lu", @"sku", -[NSNumber integerValue](sku, "integerValue")];
      [v16 addObject:v18];
    }
    clhs = self->_clhs;
    if (clhs)
    {
      uint64_t v20 = [NSString stringWithFormat:@"%@%lu", @"clhs", -[NSNumber integerValue](clhs, "integerValue")];
      [v16 addObject:v20];
    }
    family = self->_family;
    if (family)
    {
      id v22 = [NSString stringWithFormat:@"%@%lu", @"family", -[NSNumber integerValue](family, "integerValue")];
      [v16 addObject:v22];
    }
    if (![v16 count]) {
      goto LABEL_13;
    }
    id v15 = &v30;
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__38;
    id v34 = __Block_byref_object_dispose__38;
    id v35 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke_194;
    v25[3] = &unk_1E62C6D38;
    id v26 = v16;
    long long v27 = v29;
    long long v28 = &v30;
    [v14 enumerateKeysAndObjectsUsingBlock:v25];
    uint64_t v23 = v31[5];
    if (v23)
    {
      id v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v31[5]];
    }

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v30, 8);

    if (!v23) {
LABEL_13:
    }
      id v15 = (uint64_t *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  }
  return v15;
}

void __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 hasPrefix:*(void *)(a1 + 32)]
    && ([v6 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v3 = [v6 componentsSeparatedByString:@"-"];
    id v4 = (void *)[v3 mutableCopy];

    if ((unint64_t)[v4 count] >= 2)
    {
      [v4 removeObjectAtIndex:0];
      BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
      [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
    }
  }
}

void __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 += objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  if (v12 == v8)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v8 > *(void *)(v15 + 24))
    {
      *(void *)(v15 + 24) = v8;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

- (BOOL)includesAllDeviceSpecificColors
{
  return self->_includesAllDeviceSpecificColors;
}

- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3
{
  self->_includesAllDeviceSpecificColors = a3;
}

- (BOOL)ignoreSensitiveUIItems
{
  return self->_ignoreSensitiveUIItems;
}

- (void)setIgnoreSensitiveUIItems:(BOOL)a3
{
  self->_ignoreSensitiveUIItems = a3;
}

- (NSNumber)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
}

- (NSNumber)clhs
{
  return self->_clhs;
}

- (void)setClhs:(id)a3
{
}

- (NSNumber)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
}

- (NSArray)additionalBundles
{
  return self->_additionalBundles;
}

- (void)setAdditionalBundles:(id)a3
{
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
}

- (void)setSharedConfigs:(id)a3
{
}

- (NSArray)sortedAdditionalPlistFiles
{
  return self->_sortedAdditionalPlistFiles;
}

- (void)setSortedAdditionalPlistFiles:(id)a3
{
}

- (NSMutableArray)bundlePlistsFromFacesWithoutBundle
{
  return self->_bundlePlistsFromFacesWithoutBundle;
}

- (void)setBundlePlistsFromFacesWithoutBundle:(id)a3
{
}

- (NSArray)plistFiles
{
  return self->_plistFiles;
}

- (void)setPlistFiles:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_locuint64_t k = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistFiles, 0);
  objc_storeStrong((id *)&self->_bundlePlistsFromFacesWithoutBundle, 0);
  objc_storeStrong((id *)&self->_sortedAdditionalPlistFiles, 0);
  objc_storeStrong((id *)&self->_sharedConfigs, 0);
  objc_storeStrong((id *)&self->_frameworkBundle, 0);
  objc_storeStrong((id *)&self->_additionalBundles, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_clhs, 0);
  objc_storeStrong((id *)&self->_sku, 0);
}

- (void)parseColorOptionsForDomain:bundle:sharedCollections:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#plist-loader No shared collection. Pigment parser needs it to fulfill collection dependencies %{public}@", v2, v3, v4, v5, v6);
}

- (void)parseColorOptionsForDomain:bundle:sharedCollections:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3(&dword_1BC5A9000, v0, v1, "#plist-loader Started Loading Pigment Options for domain #%{public}@#", v2, v3, v4, v5, v6);
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3(&dword_1BC5A9000, v0, v1, "Collections after merge %{public}@", v2, v3, v4, v5, v6);
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a2 + 40) plistFileName];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_DEBUG, "Merging collections %{public}@ from plist %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 138543874;
  OUTLINED_FUNCTION_5_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEBUG, "#plist-loader '%{public}@' root domain not found. Returning empty options for domain %{public}@ in plist %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7(&dword_1BC5A9000, v0, v1, "#plist-loader contentRoot empty. Returning empty options for domain %{public}@ in plist %{public}@");
}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.3()
{
  objc_opt_class();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v0, v1, "#plist-loader contentRoot found with incorrect type - It should be a dictionary but it was %{public}@. Returning empty options for domain %{public}@", v2, v3, v4, v5, v6);
}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.4()
{
  objc_opt_class();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v0, v1, "#plist-loader 'faces' root found with incorrect type - It should be a dictionary but it was %{public}@. Returning empty options for domain %{public}@", v2, v3, v4, v5, v6);
}

void __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_122_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "#plist-loader slot property not found", v1, 2u);
}

- (void)loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3(&dword_1BC5A9000, v0, v1, "#plist-loader Collection for domain %{domain}@ not found", v2, v3, v4, v5, v6);
}

- (void)loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#plist-loader Collection for domain %{domain}@ has cycle. Returning empty collection", v2, v3, v4, v5, v6);
}

- (void)loadSharedConfigWithPropertyList:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadSharedConfigWithPropertyList:bundle:.cold.2()
{
  objc_opt_class();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v0, v1, "#plist-loader '%{public}@' root found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for shared configs", v2, v3, v4, v5, 2u);
}

- (void)loadSharedCollectionsWithPropertyList:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadSharedCollectionsWithPropertyList:bundle:.cold.2()
{
  objc_opt_class();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v0, v1, "#plist-loader '%{public}@' root found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for shared collections", v2, v3, v4, v5, 2u);
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "#plist-loader '%{public}@' not found. Returning empty options for it %{public}@");
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#plist-loader Cycle found in dependencies of [%{public}@]. Returning empty collection.", v2, v3, v4, v5, v6);
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.3()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "#plist-loader '%{public}@' found with incorrect type - It should be a dictionary or array but was %{public}@. Returning empty options for it");
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3(&dword_1BC5A9000, v0, v1, "#plist-loader Discoverying [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)loadNestedCollectionsFromNode:(os_log_t)log parent:config:plistSuffix:bundle:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_DEBUG, "#plist-loader private collections not found. Returning empty options for it", v1, 2u);
}

- (void)loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#plist-loader private 'collections' found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for it", v2, v3, v4, v5, v6);
}

void __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "#plist-loader 'collectionItem' found with incorrect type - It should be an array or dic but was %{public}@ - %{public}@ - %{public}@. Returning empty options for it", v6, 0x20u);
}

- (void)importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7(&dword_1BC5A9000, v0, v1, "#plist-loader property '%{public}@' not found for [%{public}@].");
}

- (void)importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_3(&dword_1BC5A9000, v0, v1, "#plist-loader Starting retrieving items from dependencies of [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)configurationWithName:fromNode:collectionName:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7(&dword_1BC5A9000, v0, v1, "#plist-loader property '%{public}@' not found for collection %{public}@");
}

- (void)configurationFromNode:.cold.1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.gallery-default node found with incorrect type - It should be a Array but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:.cold.2()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.collectionOverride node found with incorrect type - It should be a String but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationFromNode:.cold.4()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.exclusions node found with incorrect type - It should be an array but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:.cold.5()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.sortedByHue node found with incorrect type - It should be a Number but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:.cold.6()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.sku node found with incorrect type - It should be a Number but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:.cold.7()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.feature_flag node found with incorrect type - It should be a String but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:.cold.8()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "#plist-loader config.migration node found with incorrect type - It should be a dictionary but was %{public}@. Ignoring it.", v4, v5, v6, v7, v8);
}

- (void)configurationFromNode:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationFromNode:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationFromNode:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationFromNode:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configurationFromNode:.cold.13()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138543618;
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_ERROR, "#plist-loader '%{public}@' found with incorrect type -  It should be an dictionary. %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)colorOptionsFromPListItems:(uint64_t)a3 collectionName:(uint64_t)a4 applyConfig:(uint64_t)a5 plistSuffix:(uint64_t)a6 bundle:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadPropertyListFromFile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "#plist-loader Could not find file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)sortedPlistFilesWithMainBundle:(void *)a1 faceBundle:(uint8_t *)buf additionalBundles:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_DEBUG, "#plist-loader Color property list files loaded in the following order: %{public}@", buf, 0xCu);
}

@end