@interface PLSearchIndexingContext
- (BOOL)isSharedLibraryEnabled;
- (CSCustomAttributeKey)photosAlbumAssetCountsKey;
- (CSCustomAttributeKey)photosAlbumUUIDsKey;
- (CSCustomAttributeKey)photosEmbeddingCountKey;
- (CSCustomAttributeKey)photosHighlightAssetCountsKey;
- (CSCustomAttributeKey)photosHighlightUUIDsKey;
- (CSCustomAttributeKey)photosMemoryAssetCountsKey;
- (CSCustomAttributeKey)photosMemoryUUIDsKey;
- (CSCustomAttributeKey)photosReverseLocationDataIsValidKey;
- (CSCustomAttributeKey)photosSensitiveLocationKey;
- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore;
- (NSCalendar)calendar;
- (NSDictionary)seasonSynonymsBySeason;
- (NSDictionary)synonymsByIndexCategoryMask;
- (NSLocale)locale;
- (PLSearchIndexDateFormatter)searchIndexDateFormatter;
- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider;
- (PLSearchIndexingContext)initWithSceneTaxonomyProvider:(id)a3 csuTaxonomyObjectStore:(id)a4 locale:(id)a5 calendar:(id)a6 indexDateFormatter:(id)a7 delegate:(id)a8 seasonSynonyms:(id)a9 synonymsByIndexCategoryMask:(id)a10;
- (PLSearchIndexingContextDelegate)delegate;
- (PLUtilityAssetPool)utilityAssetPool;
- (id)description;
@end

@implementation PLSearchIndexingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosEmbeddingCountKey, 0);
  objc_storeStrong((id *)&self->_photosReverseLocationDataIsValidKey, 0);
  objc_storeStrong((id *)&self->_photosSensitiveLocationKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightUUIDsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryUUIDsKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumUUIDsKey, 0);
  objc_storeStrong((id *)&self->_utilityAssetPool, 0);
  objc_storeStrong((id *)&self->_synonymsByIndexCategoryMask, 0);
  objc_storeStrong((id *)&self->_seasonSynonymsBySeason, 0);
  objc_storeStrong((id *)&self->_searchIndexDateFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CSCustomAttributeKey)photosEmbeddingCountKey
{
  return self->_photosEmbeddingCountKey;
}

- (CSCustomAttributeKey)photosReverseLocationDataIsValidKey
{
  return self->_photosReverseLocationDataIsValidKey;
}

- (CSCustomAttributeKey)photosSensitiveLocationKey
{
  return self->_photosSensitiveLocationKey;
}

- (CSCustomAttributeKey)photosHighlightAssetCountsKey
{
  return self->_photosHighlightAssetCountsKey;
}

- (CSCustomAttributeKey)photosHighlightUUIDsKey
{
  return self->_photosHighlightUUIDsKey;
}

- (CSCustomAttributeKey)photosMemoryAssetCountsKey
{
  return self->_photosMemoryAssetCountsKey;
}

- (CSCustomAttributeKey)photosMemoryUUIDsKey
{
  return self->_photosMemoryUUIDsKey;
}

- (CSCustomAttributeKey)photosAlbumAssetCountsKey
{
  return self->_photosAlbumAssetCountsKey;
}

- (CSCustomAttributeKey)photosAlbumUUIDsKey
{
  return self->_photosAlbumUUIDsKey;
}

- (PLUtilityAssetPool)utilityAssetPool
{
  return self->_utilityAssetPool;
}

- (NSDictionary)synonymsByIndexCategoryMask
{
  return self->_synonymsByIndexCategoryMask;
}

- (NSDictionary)seasonSynonymsBySeason
{
  return self->_seasonSynonymsBySeason;
}

- (PLSearchIndexDateFormatter)searchIndexDateFormatter
{
  return self->_searchIndexDateFormatter;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  return self->_csuTaxonomyObjectStore;
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  return self->_sceneTaxonomyProvider;
}

- (PLSearchIndexingContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSearchIndexingContextDelegate *)WeakRetained;
}

- (BOOL)isSharedLibraryEnabled
{
  v2 = self;
  v3 = [(PLSearchIndexingContext *)self delegate];
  LOBYTE(v2) = [v3 isSharedLibraryEnabledForSearchIndexingContext:v2];

  return (char)v2;
}

- (id)description
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), self];
  v17[0] = v16;
  v3 = [NSString stringWithFormat:@"sceneTaxonomyProvider: %@", self->_sceneTaxonomyProvider];
  v17[1] = v3;
  v4 = [NSString stringWithFormat:@"csuTaxonomyObjectStore: %@", self->_csuTaxonomyObjectStore];
  v17[2] = v4;
  v5 = [NSString stringWithFormat:@"locale: %@", self->_locale];
  v17[3] = v5;
  v6 = [NSString stringWithFormat:@"calendar: %@", self->_calendar];
  v17[4] = v6;
  v7 = [NSString stringWithFormat:@"searchIndexDateFormatter: %@", self->_searchIndexDateFormatter];
  v17[5] = v7;
  v8 = [NSString stringWithFormat:@"seasonSynonymsBySeason: %@", self->_seasonSynonymsBySeason];
  v17[6] = v8;
  v9 = [NSString stringWithFormat:@"synonymsByIndexCategoryMask: %@", self->_synonymsByIndexCategoryMask];
  v17[7] = v9;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"isSharedLibraryEnabled: %d", -[PLSearchIndexingContext isSharedLibraryEnabled](self, "isSharedLibraryEnabled"));
  v17[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:9];

  v12 = NSString;
  v13 = [v11 componentsJoinedByString:@", "];
  v14 = [v12 stringWithFormat:@"<%@>", v13];

  return v14;
}

- (PLSearchIndexingContext)initWithSceneTaxonomyProvider:(id)a3 csuTaxonomyObjectStore:(id)a4 locale:(id)a5 calendar:(id)a6 indexDateFormatter:(id)a7 delegate:(id)a8 seasonSynonyms:(id)a9 synonymsByIndexCategoryMask:(id)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v59 = a5;
  id v60 = a6;
  id v58 = a7;
  id v57 = a8;
  id v19 = a9;
  id v20 = a10;
  v56 = v18;
  if (!v18)
  {
    v21 = PLSearchBackendIndexManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "CSU: csuTaxonomyObjectStore argument is nil", buf, 2u);
    }
  }
  if (!v17)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"PLSearchIndexingContext.m", 21, @"Invalid parameter not satisfying: %@", @"sceneTaxonomyProvider" object file lineNumber description];
  }
  v22 = v59;
  if (!v59)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"PLSearchIndexingContext.m", 22, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

    v22 = 0;
  }
  if (v60)
  {
    if (v19) {
      goto LABEL_11;
    }
  }
  else
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"PLSearchIndexingContext.m", 23, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];

    v22 = v59;
    if (v19) {
      goto LABEL_11;
    }
  }
  v53 = [MEMORY[0x1E4F28B00] currentHandler];
  [v53 handleFailureInMethod:a2, self, @"PLSearchIndexingContext.m", 24, @"Invalid parameter not satisfying: %@", @"seasonSynonymsBySeason" object file lineNumber description];

  v22 = v59;
LABEL_11:
  v61.receiver = self;
  v61.super_class = (Class)PLSearchIndexingContext;
  v23 = [(PLSearchIndexingContext *)&v61 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_sceneTaxonomyProvider, a3);
    objc_storeStrong((id *)&v24->_csuTaxonomyObjectStore, obj);
    objc_storeStrong((id *)&v24->_locale, a5);
    objc_storeStrong((id *)&v24->_calendar, a6);
    uint64_t v25 = [v19 copy];
    seasonSynonymsBySeason = v24->_seasonSynonymsBySeason;
    v24->_seasonSynonymsBySeason = (NSDictionary *)v25;

    uint64_t v27 = [v20 copy];
    synonymsByIndexCategoryMask = v24->_synonymsByIndexCategoryMask;
    v24->_synonymsByIndexCategoryMask = (NSDictionary *)v27;

    objc_storeStrong((id *)&v24->_searchIndexDateFormatter, a7);
    objc_storeWeak((id *)&v24->_delegate, v57);
    v29 = objc_alloc_init(PLUtilityAssetPool);
    utilityAssetPool = v24->_utilityAssetPool;
    v24->_utilityAssetPool = v29;

    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosAlbumUUIDs" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosAlbumUUIDsKey = v24->_photosAlbumUUIDsKey;
    v24->_photosAlbumUUIDsKey = (CSCustomAttributeKey *)v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosAlbumAssetCounts" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosAlbumAssetCountsKey = v24->_photosAlbumAssetCountsKey;
    v24->_photosAlbumAssetCountsKey = (CSCustomAttributeKey *)v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosMemoryUUIDs" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosMemoryUUIDsKey = v24->_photosMemoryUUIDsKey;
    v24->_photosMemoryUUIDsKey = (CSCustomAttributeKey *)v35;

    uint64_t v37 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosMemoryAssetCounts" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosMemoryAssetCountsKey = v24->_photosMemoryAssetCountsKey;
    v24->_photosMemoryAssetCountsKey = (CSCustomAttributeKey *)v37;

    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosHighlightUUIDs" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosHighlightUUIDsKey = v24->_photosHighlightUUIDsKey;
    v24->_photosHighlightUUIDsKey = (CSCustomAttributeKey *)v39;

    uint64_t v41 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosHighlightAssetCounts" searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    photosHighlightAssetCountsKey = v24->_photosHighlightAssetCountsKey;
    v24->_photosHighlightAssetCountsKey = (CSCustomAttributeKey *)v41;

    uint64_t v43 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosSensitiveLocation" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
    photosSensitiveLocationKey = v24->_photosSensitiveLocationKey;
    v24->_photosSensitiveLocationKey = (CSCustomAttributeKey *)v43;

    uint64_t v45 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosEmbeddingCount" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
    photosEmbeddingCountKey = v24->_photosEmbeddingCountKey;
    v24->_photosEmbeddingCountKey = (CSCustomAttributeKey *)v45;

    uint64_t v47 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"photosReverseLocationDataIsValid" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
    photosReverseLocationDataIsValidKey = v24->_photosReverseLocationDataIsValidKey;
    v24->_photosReverseLocationDataIsValidKey = (CSCustomAttributeKey *)v47;
  }
  return v24;
}

@end