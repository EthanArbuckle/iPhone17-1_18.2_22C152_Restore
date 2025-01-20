@interface PLSearchIndexConfiguration
+ (BOOL)shouldIndexFilenames;
+ (NSCalendar)calendar;
+ (NSLocale)locale;
+ (unint64_t)currentEmbeddingModelVersion;
+ (unint64_t)currentSearchIndexVersion;
+ (unint64_t)currentUtilityTypeClassifierVersion;
+ (unint64_t)featureSettings;
+ (void)setShouldIndexFilenames:(BOOL)a3;
- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3;
- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore;
- (PLPhotoLibraryPathManager)pathManager;
- (PLSearchIndexConfiguration)initWithPathManager:(id)a3;
- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider;
- (PLSearchIndexingContext)indexingContext;
- (void)inLibraryPerform_refreshSharedLibraryEnabledWithManagedObjectContext:(id)a3;
- (void)setCsuTaxonomyObjectStore:(id)a3;
- (void)setIndexingContext:(id)a3;
- (void)setPathManager:(id)a3;
- (void)setSceneTaxonomyProvider:(id)a3;
@end

@implementation PLSearchIndexConfiguration

+ (BOOL)shouldIndexFilenames
{
  v2 = (void *)_shouldIndexFilenamesNumber;
  if (!_shouldIndexFilenamesNumber)
  {
    if (shouldIndexFilenames_pred != -1) {
      dispatch_once(&shouldIndexFilenames_pred, &__block_literal_global_35542);
    }
    uint64_t v3 = [NSNumber numberWithBool:shouldIndexFilenames_shouldIndexFilenames];
    v4 = (void *)_shouldIndexFilenamesNumber;
    _shouldIndexFilenamesNumber = v3;

    v2 = (void *)_shouldIndexFilenamesNumber;
  }
  return [v2 BOOLValue];
}

void __50__PLSearchIndexConfiguration_shouldIndexFilenames__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v2 objectForKey:@"PLSearchIndexIncludeFilenames"];
  v1 = v0;
  if (v0) {
    shouldIndexFilenames_shouldIndexFilenames = [v0 BOOLValue];
  }
}

+ (NSLocale)locale
{
  return (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_indexingContext, 0);
}

- (void)setCsuTaxonomyObjectStore:(id)a3
{
}

- (void)setPathManager:(id)a3
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setSceneTaxonomyProvider:(id)a3
{
}

- (void)setIndexingContext:(id)a3
{
}

- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3
{
  return self->_isSharedLibraryEnabled;
}

- (void)inLibraryPerform_refreshSharedLibraryEnabledWithManagedObjectContext:(id)a3
{
  v4 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:a3];
  self->_isSharedLibraryEnabled = v4 != 0;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  if (!csuTaxonomyObjectStore)
  {
    v4 = [(PLSearchIndexConfiguration *)self pathManager];
    id v13 = 0;
    v5 = [v4 internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:0 error:&v13];
    id v6 = v13;

    id v12 = v6;
    v7 = (CSUSearchableKnowledgeObjectStore *)[objc_alloc(MEMORY[0x1E4F5D0B0]) initExistingDB:v5 error:&v12];
    id v8 = v12;

    v9 = self->_csuTaxonomyObjectStore;
    self->_csuTaxonomyObjectStore = v7;

    if (!self->_csuTaxonomyObjectStore || v8)
    {
      v10 = PLSearchBackendSceneTaxonomyGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "CSU: Failed to load CSU EntityStore. Error: %@", buf, 0xCu);
      }
    }
    csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  }
  return csuTaxonomyObjectStore;
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  if (!sceneTaxonomyProvider)
  {
    v4 = objc_alloc_init(PLSearchIndexSceneTaxonomyProvider);
    v5 = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v4;

    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  }
  return sceneTaxonomyProvider;
}

- (PLSearchIndexingContext)indexingContext
{
  indexingContext = self->_indexingContext;
  if (!indexingContext)
  {
    v4 = objc_alloc_init(PLSearchIndexDateFormatter);
    v5 = [PLSearchIndexingContext alloc];
    id v6 = [(PLSearchIndexConfiguration *)self sceneTaxonomyProvider];
    v7 = [(PLSearchIndexConfiguration *)self csuTaxonomyObjectStore];
    id v8 = +[PLSearchIndexConfiguration locale];
    v9 = +[PLSearchIndexConfiguration calendar];
    v10 = [(PLSearchIndexingContext *)v5 initWithSceneTaxonomyProvider:v6 csuTaxonomyObjectStore:v7 locale:v8 calendar:v9 indexDateFormatter:v4 delegate:self seasonSynonyms:MEMORY[0x1E4F1CC08] synonymsByIndexCategoryMask:MEMORY[0x1E4F1CC08]];
    v11 = self->_indexingContext;
    self->_indexingContext = v10;

    indexingContext = self->_indexingContext;
  }
  return indexingContext;
}

- (PLSearchIndexConfiguration)initWithPathManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLSearchIndexConfiguration.m", 38, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PLSearchIndexConfiguration;
  v7 = [(PLSearchIndexConfiguration *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_pathManager, a3);
  }

  return v8;
}

+ (void)setShouldIndexFilenames:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  v4 = (void *)_shouldIndexFilenamesNumber;
  _shouldIndexFilenamesNumber = v3;
}

+ (unint64_t)featureSettings
{
  return 0;
}

+ (NSCalendar)calendar
{
  return (NSCalendar *)[MEMORY[0x1E4F1C9A8] currentCalendar];
}

+ (unint64_t)currentUtilityTypeClassifierVersion
{
  return [MEMORY[0x1E4F8EB68] latestVersion];
}

+ (unint64_t)currentEmbeddingModelVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getVCPMediaAnalyzerClass_softClass;
  uint64_t v9 = getVCPMediaAnalyzerClass_softClass;
  if (!getVCPMediaAnalyzerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getVCPMediaAnalyzerClass_block_invoke;
    v5[3] = &unk_1E5875840;
    v5[4] = &v6;
    __getVCPMediaAnalyzerClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 getUnifiedEmbeddingVersion];
}

+ (unint64_t)currentSearchIndexVersion
{
  return 18007;
}

@end