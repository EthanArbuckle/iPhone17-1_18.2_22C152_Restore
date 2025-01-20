@interface WKWallpaperRepresentingCollection
+ (BOOL)shouldLoadWallpaperCollectionAtURL:(id)a3;
+ (id)_loadCollectionMetadataWithURL:(id)a3;
+ (id)_loadWallpaperRepresentingContentFromURL:(id)a3 collectionMetadata:(id)a4;
+ (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3 collectionURL:(id)a4;
- (BOOL)containsWallpaperRepresentingWithIdentifier:(id)a3;
- (BOOL)disableRotation;
- (BOOL)hiddenFromPicker;
- (BOOL)supportsDownloading;
- (BOOL)wallpapersShareBaseAppearance;
- (NSMapTable)_wallpaperLookupTable;
- (NSMutableArray)_wallpaperBundles;
- (NSString)displayName;
- (NSString)wallpaperCollectionIdentifier;
- (NSUUID)identifier;
- (WKWallpaperBundleDownloadManager)downloadManager;
- (WKWallpaperRepresenting)previewWallpaperRepresenting;
- (WKWallpaperRepresentingCollection)initWithURL:(id)a3 downloadManager:(id)a4;
- (WKWallpaperRepresentingCollection)initWithWallpaperCollectionIdentifier:(id)a3 displayName:(id)a4 previewWallpaperRepresenting:(id)a5 wallpapersShareBaseAppearance:(BOOL)a6 hiddenFromPicker:(BOOL)a7 disableRotation:(BOOL)a8 wallpaperRepresentingCollection:(id)a9 downloadManager:(id)a10;
- (id)deviceColor;
- (id)deviceEnclosureColor;
- (id)wallpaperBundleAtIndex:(int64_t)a3;
- (id)wallpaperRepresentingWithIdentifier:(id)a3;
- (int64_t)numberOfWallpapers;
- (void)cancelDownloadForWallpaperRepresentingWithIdentifier:(id)a3 completion:(id)a4;
- (void)downloadWallpaperRepresentingWithIdentifier:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)setDownloadManager:(id)a3;
- (void)setWallpaperCollectionIdentifier:(id)a3;
- (void)set_wallpaperBundles:(id)a3;
- (void)set_wallpaperLookupTable:(id)a3;
@end

@implementation WKWallpaperRepresentingCollection

- (WKWallpaperRepresentingCollection)initWithWallpaperCollectionIdentifier:(id)a3 displayName:(id)a4 previewWallpaperRepresenting:(id)a5 wallpapersShareBaseAppearance:(BOOL)a6 hiddenFromPicker:(BOOL)a7 disableRotation:(BOOL)a8 wallpaperRepresentingCollection:(id)a9 downloadManager:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v31 = a5;
  id v19 = a9;
  id v30 = a10;
  v35.receiver = self;
  v35.super_class = (Class)WKWallpaperRepresentingCollection;
  v20 = [(WKWallpaperRepresentingCollection *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    wallpaperBundles = v20->__wallpaperBundles;
    v20->__wallpaperBundles = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    wallpaperLookupTable = v20->__wallpaperLookupTable;
    v20->__wallpaperLookupTable = (NSMapTable *)v23;

    v20->_wallpapersShareBaseAppearance = a6;
    v20->_hiddenFromPicker = a7;
    v20->_disableRotation = a8;
    objc_storeStrong((id *)&v20->_wallpaperCollectionIdentifier, a3);
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v25;

    objc_storeStrong((id *)&v20->_previewWallpaperRepresenting, a5);
    uint64_t v27 = [v18 copy];
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    objc_storeStrong((id *)&v20->_downloadManager, a10);
    objc_initWeak(&location, v20);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __227__WKWallpaperRepresentingCollection_initWithWallpaperCollectionIdentifier_displayName_previewWallpaperRepresenting_wallpapersShareBaseAppearance_hiddenFromPicker_disableRotation_wallpaperRepresentingCollection_downloadManager___block_invoke;
    v32[3] = &unk_1E6376B10;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v19, "na_each:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v20;
}

void __227__WKWallpaperRepresentingCollection_initWithWallpaperCollectionIdentifier_displayName_previewWallpaperRepresenting_wallpapersShareBaseAppearance_hiddenFromPicker_disableRotation_wallpaperRepresentingCollection_downloadManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v14 = v3;
  id v5 = v14;
  if ([v14 isOffloaded])
  {
    v6 = [WeakRetained downloadManager];
    v7 = [v14 identifierString];
    v8 = [v14 name];
    v9 = [v6 localWallpaperRepresentingWithIdentifier:v7 wallpaperName:v8];
    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v14;
    }
    id v5 = v10;
  }
  v11 = [WeakRetained _wallpaperBundles];
  [v11 addObject:v5];

  v12 = [WeakRetained _wallpaperLookupTable];
  v13 = [v5 identifierString];
  [v12 setObject:v5 forKey:v13];
}

- (WKWallpaperRepresentingCollection)initWithURL:(id)a3 downloadManager:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _loadCollectionMetadataWithURL:v6];
  objc_opt_class();
  v9 = [v8 objectForKeyedSubscript:@"identifier"];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (!v11) {
    [(id)objc_opt_class() _raiseInvalidMetadataExceptionForMetadataKeypath:@"identifier" collectionURL:v6];
  }
  objc_opt_class();
  v12 = [v8 objectForKeyedSubscript:@"name"];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v65 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
  v66 = v14;
  v64 = [v65 localizedStringForKey:v14 value:0 table:0];
  v15 = [(id)objc_opt_class() _loadWallpaperRepresentingContentFromURL:v6 collectionMetadata:v8];
  objc_opt_class();
  v16 = [v8 objectForKeyedSubscript:@"wallpapersShareBaseAppearance"];
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v63 = v17;

  objc_opt_class();
  id v18 = [v8 objectForKeyedSubscript:@"hiddenFromPicker"];
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  v62 = v20;
  v67 = v15;
  if ([v20 BOOLValue])
  {
    uint64_t v21 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
      __int16 v72 = 2114;
      id v73 = v11;
      _os_log_impl(&dword_1BE13A000, v21, OS_LOG_TYPE_DEFAULT, "%s: Hiding Wallpaper '%{public}@': Explicitly hidden", buf, 0x16u);
    }
    unsigned int v61 = 1;
  }
  else
  {
    objc_opt_class();
    v22 = [v8 objectForKeyedSubscript:@"supportedDeviceClasses"];
    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v21 = v23;

    v24 = (void *)MGCopyAnswer();
    if (v21 && ([v21 na_safeContainsObject:v24] & 1) == 0)
    {
      uint64_t v25 = WKLogForCategory(4uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
        __int16 v72 = 2114;
        id v73 = v11;
        __int16 v74 = 2114;
        v75 = v24;
        _os_log_impl(&dword_1BE13A000, v25, OS_LOG_TYPE_DEFAULT, "%s: Hiding Wallpaper '%{public}@': Device class '%{public}@' not in supported list", buf, 0x20u);
      }

      unsigned int v61 = 1;
    }
    else
    {
      unsigned int v61 = 0;
    }
    v15 = v67;
  }
  objc_opt_class();
  v26 = [v8 objectForKeyedSubscript:@"disableRotation"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 0;
  }
  id v28 = v27;

  v60 = v28;
  unsigned int v59 = [v28 BOOLValue];
  objc_opt_class();
  v29 = [v8 objectForKeyedSubscript:@"previewWallpaperMatchesDeviceTraits"];
  if (objc_opt_isKindOfClass()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;

  if (![v31 BOOLValue]) {
    goto LABEL_61;
  }
  id v58 = v11;
  id v56 = v7;
  objc_opt_class();
  id v32 = [v8 objectForKeyedSubscript:@"previewWallpaperDeviceTraitsLookup"];
  if (v32)
  {
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }
    id v34 = v33;
  }
  else
  {
    id v34 = 0;
  }

  if (!v34) {
    [(id)objc_opt_class() _raiseInvalidMetadataExceptionForMetadataKeypath:@"previewWallpaperDeviceTraitsLookup" collectionURL:v6];
  }
  id v57 = v6;
  uint64_t v35 = [(WKWallpaperRepresentingCollection *)self deviceColor];
  v36 = [(WKWallpaperRepresentingCollection *)self deviceEnclosureColor];
  objc_opt_class();
  v55 = (void *)v35;
  v37 = [v34 objectForKeyedSubscript:v35];
  v38 = (objc_opt_isKindOfClass() & 1) != 0 ? v37 : 0;
  id v39 = v38;

  objc_opt_class();
  v40 = [v39 objectForKeyedSubscript:v36];
  v41 = (objc_opt_isKindOfClass() & 1) != 0 ? v40 : 0;
  id v42 = v41;

  if (v42)
  {
    objc_opt_class();
    v43 = [v42 objectForKeyedSubscript:@"wallpaperIdentifier"];
    if (objc_opt_isKindOfClass()) {
      v44 = v43;
    }
    else {
      v44 = 0;
    }
    id v45 = v44;

    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __65__WKWallpaperRepresentingCollection_initWithURL_downloadManager___block_invoke;
    v68[3] = &unk_1E6376B38;
    id v46 = v45;
    id v69 = v46;
    v47 = objc_msgSend(v67, "na_firstObjectPassingTest:", v68);
    if (v47)
    {
      v48 = WKLogForCategory(4uLL);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v54 = [v47 identifierString];
        *(_DWORD *)buf = 136315650;
        v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
        __int16 v72 = 2114;
        id v73 = v54;
        __int16 v74 = 2114;
        v75 = v58;
        _os_log_impl(&dword_1BE13A000, v48, OS_LOG_TYPE_DEFAULT, "%s: Using Preview Wallpaper Representing '%{public}@' for collection identifier '%{public}@' based on device traits.", buf, 0x20u);
      }
    }
  }
  else
  {
    v47 = 0;
  }

  id v7 = v56;
  id v6 = v57;
  id v11 = v58;
  v15 = v67;
  if (!v47)
  {
LABEL_61:
    v49 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [v15 firstObject];
      v51 = [v50 identifierString];
      *(_DWORD *)buf = 136315650;
      v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
      __int16 v72 = 2114;
      id v73 = v11;
      __int16 v74 = 2114;
      v75 = v51;
      _os_log_impl(&dword_1BE13A000, v49, OS_LOG_TYPE_DEFAULT, "%s: Preview Wallpaper Representing for collection identifier '%{public}@' not set, defaulting to first wallpaper '%{public}@'.", buf, 0x20u);

      v15 = v67;
    }

    v47 = [v15 firstObject];
  }
  v52 = -[WKWallpaperRepresentingCollection initWithWallpaperCollectionIdentifier:displayName:previewWallpaperRepresenting:wallpapersShareBaseAppearance:hiddenFromPicker:disableRotation:wallpaperRepresentingCollection:downloadManager:](self, "initWithWallpaperCollectionIdentifier:displayName:previewWallpaperRepresenting:wallpapersShareBaseAppearance:hiddenFromPicker:disableRotation:wallpaperRepresentingCollection:downloadManager:", v11, v64, v47, [v63 BOOLValue], v61, v59, v15, v7);

  return v52;
}

uint64_t __65__WKWallpaperRepresentingCollection_initWithURL_downloadManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifierString];
  v4 = [*(id *)(a1 + 32) stringValue];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (BOOL)shouldLoadWallpaperCollectionAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]";
    _os_log_impl(&dword_1BE13A000, v4, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  char v15 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v3 path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v15];
  if (v15) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }

  if (v8)
  {
    v9 = [v3 URLByAppendingPathComponent:@"WallpaperCollection.plist"];
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = [v9 path];
    char v12 = [v10 fileExistsAtPath:v11 isDirectory:0];

    if ((v12 & 1) == 0)
    {
      v13 = WKLogForCategory(4uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v9 path];
        objc_claimAutoreleasedReturnValue();
        +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]();
      }
    }
  }
  else
  {
    v9 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v3 path];
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]();
    }
    char v12 = 0;
  }

  __72__WKWallpaperRepresentingCollection_shouldLoadWallpaperCollectionAtURL___block_invoke();
  return v12;
}

void __72__WKWallpaperRepresentingCollection_shouldLoadWallpaperCollectionAtURL___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (int64_t)numberOfWallpapers
{
  v2 = [(WKWallpaperRepresentingCollection *)self _wallpaperBundles];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)supportsDownloading
{
  v2 = [(WKWallpaperRepresentingCollection *)self downloadManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)wallpaperBundleAtIndex:(int64_t)a3
{
  v4 = [(WKWallpaperRepresentingCollection *)self _wallpaperBundles];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (BOOL)containsWallpaperRepresentingWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WKWallpaperRepresentingCollection *)self _wallpaperLookupTable];
  id v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)wallpaperRepresentingWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WKWallpaperRepresentingCollection *)self _wallpaperLookupTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)downloadWallpaperRepresentingWithIdentifier:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WKWallpaperRepresentingCollection *)self wallpaperRepresentingWithIdentifier:v8];
  objc_initWeak(&location, self);
  char v12 = [(WKWallpaperRepresentingCollection *)self downloadManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__WKWallpaperRepresentingCollection_downloadWallpaperRepresentingWithIdentifier_progress_completion___block_invoke;
  v15[3] = &unk_1E6376B60;
  objc_copyWeak(&v18, &location);
  id v13 = v11;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  [v12 downloadWallpaperRepresentingIfNeeded:v13 progress:v9 withCompletion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __101__WKWallpaperRepresentingCollection_downloadWallpaperRepresentingWithIdentifier_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v7 = WeakRetained;
  if (v13)
  {
    id v8 = [WeakRetained _wallpaperBundles];
    uint64_t v9 = [v8 indexOfObject:*(void *)(a1 + 32)];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [v7 _wallpaperBundles];
      [v10 replaceObjectAtIndex:v9 withObject:v13];

      id v11 = [v7 _wallpaperLookupTable];
      char v12 = [v13 identifierString];
      [v11 setObject:v13 forKey:v12];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelDownloadForWallpaperRepresentingWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(WKWallpaperRepresentingCollection *)self wallpaperRepresentingWithIdentifier:a3];
  char v7 = [(WKWallpaperRepresentingCollection *)self downloadManager];
  [v7 cancelDownloadForWallpaperRepresenting:v8 withCompletion:v6];
}

- (id)deviceColor
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)deviceEnclosureColor
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)_loadCollectionMetadataWithURL:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v47 = "+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]";
    _os_log_impl(&dword_1BE13A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", buf, 0xCu);
  }

  char v45 = 0;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v3 path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v45];
  if (v45) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F1C3C8];
  if ((v8 & 1) == 0)
  {
    id v10 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [v3 path];
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]();
    }

    id v11 = (void *)MEMORY[0x1E4F1CA00];
    char v12 = NSString;
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    char v15 = [v3 path];
    id v16 = [v12 stringWithFormat:@"%@: Wallpaper collection does not exist at URL '%@'.", v14, v15];
    id v17 = [v11 exceptionWithName:*v9 reason:v16 userInfo:0];

    [v17 raise];
  }
  id v18 = [v3 URLByAppendingPathComponent:@"WallpaperCollection.plist"];
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = [v18 path];
  char v21 = [v19 fileExistsAtPath:v20 isDirectory:0];

  if ((v21 & 1) == 0)
  {
    v22 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [v18 path];
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]();
    }

    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    v24 = NSString;
    uint64_t v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v18 path];
    id v28 = [v24 stringWithFormat:@"%@: Wallpaper collection does not contain a metadata file at path '%@'.", v26, v27];
    v29 = [v23 exceptionWithName:*v9 reason:v28 userInfo:0];

    [v29 raise];
  }
  id v44 = 0;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v18 error:&v44];
  id v31 = v44;
  if (v31)
  {
    id v32 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v43 = (char *)(id)objc_claimAutoreleasedReturnValue();
      id v42 = [v18 path];
      *(_DWORD *)buf = 138543874;
      v47 = v43;
      __int16 v48 = 2114;
      v49 = v42;
      __int16 v50 = 2114;
      id v51 = v31;
      _os_log_error_impl(&dword_1BE13A000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error in loading Wallpaper Collection metadata file '%{public}@', error '%{public}@'", buf, 0x20u);
    }
    id v33 = (void *)MEMORY[0x1E4F1CA00];
    id v34 = NSString;
    uint64_t v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    v37 = [v18 path];
    v38 = [v34 stringWithFormat:@"%@: Encountered error in loading metadata file (path: '%@') (error: '%@').", v36, v37, v31];
    id v39 = [v33 exceptionWithName:*v9 reason:v38 userInfo:0];

    [v39 raise];
  }

  __68__WKWallpaperRepresentingCollection__loadCollectionMetadataWithURL___block_invoke();
  return v30;
}

void __68__WKWallpaperRepresentingCollection__loadCollectionMetadataWithURL___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

+ (id)_loadWallpaperRepresentingContentFromURL:(id)a3 collectionMetadata:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char v8 = [v7 objectForKeyedSubscript:@"order"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    [a1 _raiseInvalidMetadataExceptionForMetadataKeypath:@"order" collectionURL:v6];
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  char v12 = [v6 URLByAppendingPathComponent:@"Wallpapers"];
  unsigned __int8 v47 = 0;
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v40 = v12;
  id v14 = [v12 path];
  int v15 = [v13 fileExistsAtPath:v14 isDirectory:&v47];
  int v16 = v47;

  if (v15 && v16)
  {
    id v38 = v7;
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v46 = 0;
    id v18 = [v17 contentsOfDirectoryAtURL:v40 includingPropertiesForKeys:0 options:0 error:&v46];
    id v19 = v46;

    if (v19)
    {
      id v20 = WKLogForCategory(4uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperRepresentingCollection _loadWallpaperRepresentingContentFromURL:collectionMetadata:](v6, (uint64_t)v19, v20);
      }

      char v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      uint64_t v23 = NSString;
      v24 = NSStringFromClass((Class)a1);
      uint64_t v25 = [v40 path];
      v26 = [v23 stringWithFormat:@"%@: Encountered error in loading contents of directory for system wallpape collection (path: '%@') (error: '%@').", v24, v25, v19];
      uint64_t v27 = [v21 exceptionWithName:v22 reason:v26 userInfo:0];

      [v27 raise];
    }
    id v39 = v6;
    id v28 = [MEMORY[0x1E4F1CA60] dictionary];
    v37 = v18;
    v29 = objc_msgSend(v18, "na_filter:", &__block_literal_global_76);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke_2;
    v45[3] = &unk_1E6376BA8;
    v45[4] = v28;
    objc_msgSend(v29, "na_each:", v45);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v30 = v10;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = [v28 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          objc_msgSend(v11, "na_safeAddObject:", v35);
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v32);
    }

    id v7 = v38;
    id v6 = v39;
  }
  else
  {
    id v19 = WKLogForCategory(4uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      +[WKWallpaperRepresentingCollection _loadWallpaperRepresentingContentFromURL:collectionMetadata:](v6, v19);
    }
  }

  return v11;
}

BOOL __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:a2];
}

void __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [[WKWallpaperBundle alloc] initWithURL:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKWallpaperBundle identifier](v6, "identifier"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, v5);
}

+ (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3 collectionURL:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  char v8 = NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = NSStringFromClass((Class)a1);
  char v12 = [v9 path];

  id v13 = [v8 stringWithFormat:@"%@: (path: '%@') metadata does not contain valid value for keypath: '%@'", v11, v12, v10];

  id v14 = [v6 exceptionWithName:v7 reason:v13 userInfo:0];

  [v14 raise];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)wallpapersShareBaseAppearance
{
  return self->_wallpapersShareBaseAppearance;
}

- (BOOL)hiddenFromPicker
{
  return self->_hiddenFromPicker;
}

- (BOOL)disableRotation
{
  return self->_disableRotation;
}

- (WKWallpaperRepresenting)previewWallpaperRepresenting
{
  return self->_previewWallpaperRepresenting;
}

- (NSString)wallpaperCollectionIdentifier
{
  return self->_wallpaperCollectionIdentifier;
}

- (void)setWallpaperCollectionIdentifier:(id)a3
{
}

- (WKWallpaperBundleDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (NSMutableArray)_wallpaperBundles
{
  return self->__wallpaperBundles;
}

- (void)set_wallpaperBundles:(id)a3
{
}

- (NSMapTable)_wallpaperLookupTable
{
  return self->__wallpaperLookupTable;
}

- (void)set_wallpaperLookupTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperLookupTable, 0);
  objc_storeStrong((id *)&self->__wallpaperBundles, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_wallpaperCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_previewWallpaperRepresenting, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)shouldLoadWallpaperCollectionAtURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  *int v1 = 136315394;
  OUTLINED_FUNCTION_0_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]");
  OUTLINED_FUNCTION_1_0(&dword_1BE13A000, v3, v4, "%s: Wallpaper Collection metadata file does not exist at URL '%{public}@'", v5);
}

+ (void)shouldLoadWallpaperCollectionAtURL:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  *int v1 = 136315394;
  OUTLINED_FUNCTION_0_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]");
  OUTLINED_FUNCTION_1_0(&dword_1BE13A000, v3, v4, "%s: No wallpaper collection found at path '%{public}@'.", v5);
}

+ (void)_loadCollectionMetadataWithURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  *int v1 = 136446466;
  OUTLINED_FUNCTION_0_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]");
  OUTLINED_FUNCTION_1_0(&dword_1BE13A000, v3, v4, "%{public}s: Wallpaper Collection metadata file does not exist at URL '%{public}@'", v5);
}

+ (void)_loadCollectionMetadataWithURL:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  *int v1 = 136446466;
  OUTLINED_FUNCTION_0_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]");
  OUTLINED_FUNCTION_1_0(&dword_1BE13A000, v3, v4, "%{public}s: No wallpaper collection found at URL '%{public}@.", v5);
}

+ (void)_loadWallpaperRepresentingContentFromURL:(NSObject *)a3 collectionMetadata:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 path];
  v7[0] = 136446722;
  OUTLINED_FUNCTION_0();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BE13A000, a3, OS_LOG_TYPE_ERROR, "%{public}s: Encountered error in retrieving contents of collection at path '%{public}@', error '%{public}@'", (uint8_t *)v7, 0x20u);
}

+ (void)_loadWallpaperRepresentingContentFromURL:(void *)a1 collectionMetadata:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 path];
  v4[0] = 136446466;
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1BE13A000, a2, OS_LOG_TYPE_FAULT, "%{public}s: No 'Wallpapers' directory found in wallpaper collection at path '%{public}@'.", (uint8_t *)v4, 0x16u);
}

@end