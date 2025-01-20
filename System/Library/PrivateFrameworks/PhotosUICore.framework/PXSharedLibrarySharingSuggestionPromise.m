@interface PXSharedLibrarySharingSuggestionPromise
+ (BOOL)isNewWithSuggestedDate:(id)a3 considerNewAfterDate:(id)a4;
- (BOOL)isNew;
- (BOOL)isPlaceholder;
- (NSArray)locations;
- (NSDate)considerNewAfterDate;
- (NSDate)suggestedDate;
- (NSString)identifier;
- (NSString)title;
- (PHAssetCollection)containerCollection;
- (PXDisplayAsset)keyAsset;
- (PXDisplayCollection)displayCollection;
- (PXSharedLibrarySharingSuggestionPromise)init;
- (PXSharedLibrarySharingSuggestionPromise)initWithContainer:(id)a3 considerNewAfterDate:(id)a4 lightweightPlaceholder:(BOOL)a5;
- (PXSharedLibrarySharingSuggestionPromise)initWithPromise:(id)a3 considerNewAfterDate:(id)a4;
- (_PXSharedLibrarySharingSuggestionContainer)container;
- (id)copyIfNeededWithUpdatedConsiderNewAfterDate:(id)a3;
- (id)fetchAssetCollections;
- (void)_fulfill;
- (void)_loadLightweightProperties;
- (void)_updateIsNew;
- (void)markAsRead;
@end

@implementation PXSharedLibrarySharingSuggestionPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_suggestedDate, 0);
  objc_storeStrong((id *)&self->_considerNewAfterDate, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

- (_PXSharedLibrarySharingSuggestionContainer)container
{
  return self->_container;
}

- (NSDate)suggestedDate
{
  return self->_suggestedDate;
}

- (NSDate)considerNewAfterDate
{
  return self->_considerNewAfterDate;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)title
{
  return self->_title;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)markAsRead
{
  v2 = [(PXSharedLibrarySharingSuggestionPromise *)self containerCollection];
  id v4 = [v2 photoLibrary];

  v3 = objc_msgSend(v4, "px_sharedLibrarySharingSuggestionsCountsManager");
  [v3 markAnyNotificationsAsRead];
  [v3 markAllSuggestionsAsRead];
}

- (PXDisplayCollection)displayCollection
{
  v2 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  v3 = objc_msgSend(v2, "px_sl_containerCollection");

  return (PXDisplayCollection *)v3;
}

- (PHAssetCollection)containerCollection
{
  v2 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  v3 = objc_msgSend(v2, "px_sl_containerCollection");

  return (PHAssetCollection *)v3;
}

- (id)fetchAssetCollections
{
  v2 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  v3 = objc_msgSend(v2, "px_sl_fetchAssetCollections");

  return v3;
}

- (id)copyIfNeededWithUpdatedConsiderNewAfterDate:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibrarySharingSuggestionPromise *)self suggestedDate];
  BOOL v6 = +[PXSharedLibrarySharingSuggestionPromise isNewWithSuggestedDate:v5 considerNewAfterDate:v4];

  if (v6 == [(PXSharedLibrarySharingSuggestionPromise *)self isNew]) {
    v7 = 0;
  }
  else {
    v7 = [[PXSharedLibrarySharingSuggestionPromise alloc] initWithPromise:self considerNewAfterDate:v4];
  }

  return v7;
}

- (void)_updateIsNew
{
  id v4 = [(PXSharedLibrarySharingSuggestionPromise *)self suggestedDate];
  v3 = [(PXSharedLibrarySharingSuggestionPromise *)self considerNewAfterDate];
  self->_isNew = +[PXSharedLibrarySharingSuggestionPromise isNewWithSuggestedDate:v4 considerNewAfterDate:v3];
}

- (void)_fulfill
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  PLSharedLibraryGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXSharedLibrarySharingSuggestionPromise.fulfill", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  BOOL v6 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  objc_msgSend(v6, "px_sl_getKeyAsset:suggestedDate:locations:", &v18, &v17, &v16);
  id v7 = v18;
  id v8 = v18;
  id v9 = v17;
  id v10 = v17;
  v11 = (NSArray *)v16;
  objc_storeStrong((id *)&self->_keyAsset, v7);
  objc_storeStrong((id *)&self->_suggestedDate, v9);
  locations = self->_locations;
  self->_locations = v11;

  [(PXSharedLibrarySharingSuggestionPromise *)self _updateIsNew];
  PLSharedLibraryGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_END, v15, "PXSharedLibrarySharingSuggestionPromise.fulfill", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }
}

- (void)_loadLightweightProperties
{
  id v5 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  objc_msgSend(v5, "px_sl_title");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v3;
}

- (NSString)identifier
{
  v2 = [(PXSharedLibrarySharingSuggestionPromise *)self container];
  v3 = objc_msgSend(v2, "px_sl_identifier");

  return (NSString *)v3;
}

- (PXSharedLibrarySharingSuggestionPromise)initWithPromise:(id)a3 considerNewAfterDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXSharedLibrarySharingSuggestionPromise;
  id v8 = [(PXSharedLibrarySharingSuggestionPromise *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 container];
    container = v8->_container;
    v8->_container = (_PXSharedLibrarySharingSuggestionContainer *)v9;

    objc_storeStrong((id *)&v8->_considerNewAfterDate, a4);
    v8->_isPlaceholder = [v6 isPlaceholder];
    uint64_t v11 = [v6 title];
    title = v8->_title;
    v8->_title = (NSString *)v11;

    uint64_t v13 = [v6 keyAsset];
    keyAsset = v8->_keyAsset;
    v8->_keyAsset = (PXDisplayAsset *)v13;

    uint64_t v15 = [v6 suggestedDate];
    suggestedDate = v8->_suggestedDate;
    v8->_suggestedDate = (NSDate *)v15;

    uint64_t v17 = [v6 locations];
    locations = v8->_locations;
    v8->_locations = (NSArray *)v17;

    [(PXSharedLibrarySharingSuggestionPromise *)v8 _updateIsNew];
  }

  return v8;
}

- (PXSharedLibrarySharingSuggestionPromise)initWithContainer:(id)a3 considerNewAfterDate:(id)a4 lightweightPlaceholder:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibrarySharingSuggestionPromise;
  uint64_t v11 = [(PXSharedLibrarySharingSuggestionPromise *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a3);
    objc_storeStrong((id *)&v12->_considerNewAfterDate, a4);
    v12->_isPlaceholder = a5;
    [(PXSharedLibrarySharingSuggestionPromise *)v12 _loadLightweightProperties];
    if (!a5) {
      [(PXSharedLibrarySharingSuggestionPromise *)v12 _fulfill];
    }
  }

  return v12;
}

- (PXSharedLibrarySharingSuggestionPromise)init
{
  os_signpost_id_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibrarySharingSuggestionsDataSourceManager.m", 449, @"%s is not available as initializer", "-[PXSharedLibrarySharingSuggestionPromise init]");

  abort();
}

+ (BOOL)isNewWithSuggestedDate:(id)a3 considerNewAfterDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a4, "compare:") == -1;
    }
  }
  return result;
}

@end