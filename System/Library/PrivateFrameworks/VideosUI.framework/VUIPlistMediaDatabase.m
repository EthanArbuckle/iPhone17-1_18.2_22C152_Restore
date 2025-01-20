@interface VUIPlistMediaDatabase
+ (id)_sortedEntitiesArray:(id)a3;
+ (void)_addItem:(id)a3 itemByIdentifier:(id)a4;
+ (void)_removeItem:(id)a3 itemByIdentifier:(id)a4;
- (BOOL)_parseDatabase;
- (BOOL)_saveWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveToFileURL:(id)a3 error:(id *)a4;
- (NSArray)episodes;
- (NSArray)homeVideos;
- (NSArray)movieRentals;
- (NSArray)movies;
- (NSArray)seasons;
- (NSArray)shows;
- (NSMutableDictionary)homeVideoByIdentifier;
- (NSMutableDictionary)movieByIdentifier;
- (NSMutableDictionary)movieRentalByIdentifier;
- (NSMutableDictionary)showByIdentifier;
- (NSURL)fileURL;
- (OS_dispatch_queue)serialDispatchQueue;
- (OS_dispatch_source)databaseFileDispatchSource;
- (VUIPlistMediaDatabase)init;
- (VUIPlistMediaDatabase)initWithURL:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_seasons;
- (id)entityForIdentifier:(id)a3;
- (id)itemForIdentifier:(id)a3;
- (unint64_t)hash;
- (void)_addEpisode:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5;
- (void)_addHomeVideo:(id)a3;
- (void)_addMovie:(id)a3;
- (void)_addMovieRental:(id)a3;
- (void)_addSeason:(id)a3 showIdentifier:(id)a4;
- (void)_addShow:(id)a3;
- (void)_parseDatabase;
- (void)_parseDatabaseAndSendNotification;
- (void)_removeEntityWithIdentifier:(id)a3;
- (void)_removeEpisode:(id)a3 fromSeason:(id)a4;
- (void)_removeHomeVideo:(id)a3;
- (void)_removeMovie:(id)a3;
- (void)_removeMovieRental:(id)a3;
- (void)_removeSeason:(id)a3 fromShow:(id)a4;
- (void)_removeShow:(id)a3;
- (void)_startMonitoringDatabaseFile;
- (void)addEntity:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5;
- (void)dealloc;
- (void)removeDownloadedMediaForIdentifier:(id)a3;
- (void)removeEntityWithIdentifier:(id)a3;
- (void)setDatabaseFileDispatchSource:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setHomeVideoByIdentifier:(id)a3;
- (void)setMovieByIdentifier:(id)a3;
- (void)setMovieRentalByIdentifier:(id)a3;
- (void)setSerialDispatchQueue:(id)a3;
- (void)setShowByIdentifier:(id)a3;
- (void)updateEntity:(id)a3 propertyName:(id)a4 propertyValue:(id)a5;
- (void)updateEntityWithIdentifier:(id)a3 propertyName:(id)a4 propertyValue:(id)a5;
@end

@implementation VUIPlistMediaDatabase

- (VUIPlistMediaDatabase)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(VUIPlistMediaDatabase *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    [(VUIPlistMediaDatabase *)v5 _parseDatabase];
    [(VUIPlistMediaDatabase *)v5 _startMonitoringDatabaseFile];
  }

  return v5;
}

- (VUIPlistMediaDatabase)init
{
  v14.receiver = self;
  v14.super_class = (Class)VUIPlistMediaDatabase;
  v2 = [(VUIPlistMediaDatabase *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    homeVideoByIdentifier = v2->_homeVideoByIdentifier;
    v2->_homeVideoByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    movieByIdentifier = v2->_movieByIdentifier;
    v2->_movieByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    movieRentalByIdentifier = v2->_movieRentalByIdentifier;
    v2->_movieRentalByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    showByIdentifier = v2->_showByIdentifier;
    v2->_showByIdentifier = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.videosui.VUIPlistMediaDatabase.serialDispatchQueue", 0);
    serialDispatchQueue = v2->_serialDispatchQueue;
    v2->_serialDispatchQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)dealloc
{
  databaseFileDispatchSource = self->_databaseFileDispatchSource;
  if (databaseFileDispatchSource) {
    dispatch_source_cancel(databaseFileDispatchSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaDatabase;
  [(VUIPlistMediaDatabase *)&v4 dealloc];
}

- (NSArray)movies
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__VUIPlistMediaDatabase_movies__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_super v4 = [(id)objc_opt_class() _sortedEntitiesArray:v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __31__VUIPlistMediaDatabase_movies__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) movieByIdentifier];
  v2 = [v6 allValues];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSArray)movieRentals
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__VUIPlistMediaDatabase_movieRentals__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = [(id)objc_opt_class() _sortedEntitiesArray:v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __37__VUIPlistMediaDatabase_movieRentals__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) movieRentalByIdentifier];
  v2 = [v6 allValues];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSArray)homeVideos
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VUIPlistMediaDatabase_homeVideos__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = [(id)objc_opt_class() _sortedEntitiesArray:v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__VUIPlistMediaDatabase_homeVideos__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) homeVideoByIdentifier];
  v2 = [v6 allValues];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSArray)shows
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__VUIPlistMediaDatabase_shows__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = [(id)objc_opt_class() _sortedEntitiesArray:v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __30__VUIPlistMediaDatabase_shows__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) showByIdentifier];
  v2 = [v6 allValues];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSArray)seasons
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__VUIPlistMediaDatabase_seasons__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __32__VUIPlistMediaDatabase_seasons__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _seasons];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)episodes
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__VUIPlistMediaDatabase_episodes__block_invoke;
  v6[3] = &unk_1E6DF4130;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)objc_opt_class() _sortedEntitiesArray:v8[5]];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__VUIPlistMediaDatabase_episodes__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _seasons];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) episodes];
        [v7 addObjectsFromArray:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)addEntity:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 identifier];
  uint64_t v12 = [v11 length];

  if (!v12) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"An entity must have an identifier to be added to the library"];
  }
  v13 = (void *)[v8 copy];
  uint64_t v14 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUIPlistMediaDatabase_addEntity_showIdentifier_seasonIdentifier___block_invoke;
  block[3] = &unk_1E6DF4B28;
  id v15 = v13;
  id v22 = v15;
  v23 = self;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  dispatch_sync((dispatch_queue_t)v14, block);

  id v20 = 0;
  LOBYTE(v14) = [(VUIPlistMediaDatabase *)self _saveWithError:&v20];
  id v18 = v20;
  if ((v14 & 1) == 0)
  {
    v19 = VUIDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:]();
    }
  }
}

uint64_t __67__VUIPlistMediaDatabase_addEntity_showIdentifier_seasonIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  switch(result)
  {
    case 0:
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(a1 + 40);
      uint64_t result = [v3 _addMovie:v4];
      break;
    case 1:
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t result = [v5 _addMovieRental:v6];
      break;
    case 2:
      if (![*(id *)(a1 + 48) length]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A show identifier must be provided to add an episode to the library"];
      }
      if (![*(id *)(a1 + 56) length]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A season identifier must be provided to add an episode to the library"];
      }
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t result = [v7 _addEpisode:v8 showIdentifier:v9 seasonIdentifier:v10];
      break;
    case 3:
      uint64_t v12 = *(void *)(a1 + 32);
      long long v11 = *(void **)(a1 + 40);
      uint64_t result = [v11 _addHomeVideo:v12];
      break;
    case 4:
      uint64_t v14 = *(void *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      uint64_t result = [v13 _addShow:v14];
      break;
    case 5:
      if (![*(id *)(a1 + 48) length]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A show identifier must be provided to add a season to the library"];
      }
      uint64_t v16 = *(void *)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t result = [v15 _addSeason:v16 showIdentifier:v17];
      break;
    default:
      return result;
  }
  return result;
}

- (void)removeEntityWithIdentifier:(id)a3
{
  id v4 = a3;
  [(VUIPlistMediaDatabase *)self removeDownloadedMediaForIdentifier:v4];
  uint64_t v5 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VUIPlistMediaDatabase_removeEntityWithIdentifier___block_invoke;
  block[3] = &unk_1E6DF3F68;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)v5, block);

  id v9 = 0;
  LOBYTE(v5) = [(VUIPlistMediaDatabase *)self _saveWithError:&v9];
  id v7 = v9;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:]();
    }
  }
}

uint64_t __52__VUIPlistMediaDatabase_removeEntityWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeEntityWithIdentifier:*(void *)(a1 + 40)];
}

- (void)updateEntity:(id)a3 propertyName:(id)a4 propertyValue:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VUIPlistMediaDatabase_updateEntity_propertyName_propertyValue___block_invoke;
    block[3] = &unk_1E6DF45D8;
    id v12 = v8;
    id v23 = v12;
    id v13 = v10;
    id v24 = v13;
    id v14 = v9;
    id v25 = v14;
    dispatch_sync(v11, block);

    if (v14)
    {
      id v15 = v13;
      if (!v15)
      {
        id v15 = [MEMORY[0x1E4F1CA98] null];
      }
      v26[0] = VUIPlistMediaEntityPropertyDidChangePropertyNameKey;
      v26[1] = VUIPlistMediaEntityPropertyDidChangePropertyValueKey;
      v27[0] = v14;
      v27[1] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:VUIPlistMediaEntityPropertyDidChange object:v12 userInfo:v16];
    }
    id v21 = 0;
    BOOL v18 = [(VUIPlistMediaDatabase *)self _saveWithError:&v21];
    id v19 = v21;
    if (!v18)
    {
      id v20 = VUIDefaultLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:]();
      }
    }
  }
}

uint64_t __65__VUIPlistMediaDatabase_updateEntity_propertyName_propertyValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)updateEntityWithIdentifier:(id)a3 propertyName:(id)a4 propertyValue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(VUIPlistMediaDatabase *)self entityForIdentifier:a3];
  [(VUIPlistMediaDatabase *)self updateEntity:v10 propertyName:v9 propertyValue:v8];
}

- (id)entityForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v5 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke;
  block[3] = &unk_1E6DF4B78;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) movieByIdentifier];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) movieRentalByIdentifier];
    uint64_t v7 = [v6 objectForKey:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v10 = [*(id *)(a1 + 32) homeVideoByIdentifier];
      uint64_t v11 = [v10 objectForKey:*(void *)(a1 + 40)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v14 = [*(id *)(a1 + 32) showByIdentifier];
        uint64_t v15 = [v14 objectForKey:*(void *)(a1 + 40)];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          BOOL v18 = [*(id *)(a1 + 32) showByIdentifier];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke_2;
          v21[3] = &unk_1E6DF4B50;
          id v19 = *(id *)(a1 + 40);
          uint64_t v20 = *(void *)(a1 + 48);
          id v22 = v19;
          uint64_t v23 = v20;
          [v18 enumerateKeysAndObjectsUsingBlock:v21];
        }
      }
    }
  }
}

void __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id obj = [a3 seasonForIdentifier:*(void *)(a1 + 32)];
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    id v6 = obj;
    *a4 = 1;
  }
  else
  {
    uint64_t v7 = [0 episodeForIdentifier:*(void *)(a1 + 32)];
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
      *a4 = 1;
    }

    id v6 = 0;
  }
}

- (void)removeDownloadedMediaForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VUIPlistMediaDatabase *)self itemForIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 filePathURL];
    uint64_t v8 = VUIDefaultLogObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Deleting downloaded video at %@", buf, 0xCu);
      }

      id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      char v11 = [v10 removeItemAtURL:v7 error:&v15];
      uint64_t v8 = v15;

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = VUIDefaultLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[VUIPlistMediaDatabase removeDownloadedMediaForIdentifier:]();
        }
      }
      id v13 = VUIDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Removing local file path from database", buf, 2u);
      }

      [(VUIPlistMediaDatabase *)self updateEntity:v6 propertyName:@"filePathURL" propertyValue:0];
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "No file path exists for database item; not deleting downloaded video",
        buf,
        2u);
    }

    uint64_t v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database and setting state to NotDownloaded", buf, 2u);
    }

    [(VUIPlistMediaDatabase *)self updateEntity:v6 propertyName:@"offlineFPSKeys" propertyValue:0];
    [(VUIPlistMediaDatabase *)self updateEntity:v6 propertyName:@"downloadState" propertyValue:VUIPlistDatabaseItemDownloadStateNotDownloaded];
  }
  else
  {
    uint64_t v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VUIPlistMediaDatabase removeDownloadedMediaForIdentifier:]();
    }
  }
}

- (id)itemForIdentifier:(id)a3
{
  uint64_t v3 = [(VUIPlistMediaDatabase *)self entityForIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_saveWithError:(id *)a3
{
  uint64_t v5 = [(VUIPlistMediaDatabase *)self fileURL];
  LOBYTE(a3) = [(VUIPlistMediaDatabase *)self saveToFileURL:v5 error:a3];

  return (char)a3;
}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v7 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__VUIPlistMediaDatabase_saveToFileURL_error___block_invoke;
  v11[3] = &unk_1E6DF4BA0;
  v11[4] = self;
  id v13 = &v15;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v21;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__VUIPlistMediaDatabase_saveToFileURL_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _dictionaryRepresentation];
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:100 options:0 error:&obj];
  objc_storeStrong(v3, obj);
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    [v5 removeItemAtURL:*(void *)(a1 + 40) error:0];
    id v6 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(id *)(v7 + 40);
    char v8 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v9];
    objc_storeStrong((id *)(v7 + 40), v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 writeToURL:*(void *)(a1 + 40) atomically:1];
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
  uint64_t v4 = [v3 hash];

  id v5 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
  uint64_t v8 = [v7 hash];

  id v9 = [(VUIPlistMediaDatabase *)self showByIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIPlistMediaDatabase *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
        uint64_t v8 = [(VUIPlistMediaDatabase *)v6 homeVideoByIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          char v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_29;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_22;
          }
        }
        uint64_t v14 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
        uint64_t v15 = [(VUIPlistMediaDatabase *)v6 movieByIdentifier];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {
        }
        else
        {
          char v11 = v16;
          char v12 = 0;
          if (!v9 || !v16) {
            goto LABEL_29;
          }
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_22;
          }
        }
        uint64_t v18 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
        id v19 = [(VUIPlistMediaDatabase *)v6 movieRentalByIdentifier];
        id v9 = v18;
        id v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          id v22 = [(VUIPlistMediaDatabase *)self showByIdentifier];
          uint64_t v23 = [(VUIPlistMediaDatabase *)v6 showByIdentifier];
          id v9 = v22;
          id v24 = v23;
          char v11 = v24;
          if (v9 == v24)
          {
            char v12 = 1;
          }
          else
          {
            char v12 = 0;
            if (v9 && v24) {
              char v12 = [v9 isEqual:v24];
            }
          }
          goto LABEL_29;
        }
        char v11 = v20;
        char v12 = 0;
        if (v9 && v20)
        {
          char v21 = [v9 isEqual:v20];

          if ((v21 & 1) == 0)
          {
LABEL_22:
            char v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v12 = 0;
  }
LABEL_31:

  return v12;
}

- (BOOL)_parseDatabase
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_movieByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_movieRentalByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_homeVideoByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_showByIdentifier removeAllObjects];
  uint64_t v3 = [(VUIPlistMediaDatabase *)self fileURL];
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  if (v4)
  {
    id v66 = 0;
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v66];
    uint64_t v6 = v66;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v45 = v6;
      v46 = v4;
      v47 = v3;
      v43 = v5;
      uint64_t v8 = v5;
      [v8 objectForKey:@"Movies"];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v63 != v11) {
              objc_enumerationMutation(obj);
            }
            char v13 = [[VUIPlistMediaDatabaseItem alloc] initWithDictionary:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            movieByIdentifier = self->_movieByIdentifier;
            uint64_t v15 = [(VUIPlistMediaDatabaseEntity *)v13 identifier];
            [(NSMutableDictionary *)movieByIdentifier vui_setObjectIfNotNil:v13 forKey:v15];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v10);
      }
      char v44 = isKindOfClass;
      id v16 = [v8 objectForKey:@"MovieRentals"];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(v16);
            }
            char v21 = [[VUIPlistMediaDatabaseItem alloc] initWithDictionary:*(void *)(*((void *)&v58 + 1) + 8 * j)];
            movieRentalByIdentifier = self->_movieRentalByIdentifier;
            uint64_t v23 = [(VUIPlistMediaDatabaseEntity *)v21 identifier];
            [(NSMutableDictionary *)movieRentalByIdentifier vui_setObjectIfNotNil:v21 forKey:v23];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
        }
        while (v18);
      }
      v48 = v8;
      id v24 = [v8 objectForKey:@"HomeVideos", v16];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v55 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = [[VUIPlistMediaDatabaseItem alloc] initWithDictionary:*(void *)(*((void *)&v54 + 1) + 8 * k)];
            homeVideoByIdentifier = self->_homeVideoByIdentifier;
            v31 = [(VUIPlistMediaDatabaseEntity *)v29 identifier];
            [(NSMutableDictionary *)homeVideoByIdentifier vui_setObjectIfNotNil:v29 forKey:v31];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
        }
        while (v26);
      }
      v32 = [v48 objectForKey:@"Shows"];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v67 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v51;
        do
        {
          for (uint64_t m = 0; m != v34; ++m)
          {
            if (*(void *)v51 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = [[VUIPlistMediaDatabaseShow alloc] initWithDictionary:*(void *)(*((void *)&v50 + 1) + 8 * m)];
            showByIdentifier = self->_showByIdentifier;
            v39 = [(VUIPlistMediaDatabaseEntity *)v37 identifier];
            [(NSMutableDictionary *)showByIdentifier vui_setObjectIfNotNil:v37 forKey:v39];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v67 count:16];
        }
        while (v34);
      }

      uint64_t v4 = v46;
      uint64_t v3 = v47;
      uint64_t v6 = v45;
      char isKindOfClass = v44;
      id v5 = v43;
      v40 = v48;
    }
    else
    {
      v40 = VUIDefaultLogObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[VUIPlistMediaDatabase _parseDatabase]();
      }
    }
  }
  else
  {
    uint64_t v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VUIPlistMediaDatabase _parseDatabase]();
    }
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_parseDatabaseAndSendNotification
{
  [(VUIPlistMediaDatabase *)self _parseDatabase];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"VUIPlistMediaDatabaseContentsDidChangeNotification" object:self];
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__0;
  uint64_t v35 = __Block_byref_object_dispose__0;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke;
  v30[3] = &unk_1E6DF4BC8;
  v30[4] = &v31;
  [v4 enumerateKeysAndObjectsUsingBlock:v30];

  [v3 setObject:v32[5] forKey:@"Movies"];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_2;
  v23[3] = &unk_1E6DF4BC8;
  v23[4] = &v24;
  [v5 enumerateKeysAndObjectsUsingBlock:v23];

  [v3 setObject:v25[5] forKey:@"MovieRentals"];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  char v21 = __Block_byref_object_dispose__0;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_3;
  v16[3] = &unk_1E6DF4BC8;
  v16[4] = &v17;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];

  [v3 setObject:v18[5] forKey:@"HomeVideos"];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(VUIPlistMediaDatabase *)self showByIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_4;
  v9[3] = &unk_1E6DF4BF0;
  v9[4] = &v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  [v3 setObject:v11[5] forKey:@"Shows"];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
  return v3;
}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 dictionaryRepresentation];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 dictionaryRepresentation];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 dictionaryRepresentation];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 dictionaryRepresentation];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

- (id)_seasons
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(VUIPlistMediaDatabase *)self showByIdentifier];
  id v5 = [v4 allValues];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "seasons", (void)v14);
        [v3 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(id)objc_opt_class() _sortedEntitiesArray:v3];

  return v12;
}

- (void)_addShow:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = [v4 identifier];
  -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v4;
  id v5 = [v4 seasons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        [(VUIPlistMediaDatabase *)self _removeEntityWithIdentifier:v11];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = [v10 episodes];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [*(id *)(*((void *)&v21 + 1) + 8 * j) identifier];
              [(VUIPlistMediaDatabase *)self _removeEntityWithIdentifier:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v14);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  uint64_t v18 = [(VUIPlistMediaDatabase *)self showByIdentifier];
  [v18 setObject:v20 forKey:v19];
}

- (void)_addSeason:(id)a3 showIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(VUIPlistMediaDatabase *)self showByIdentifier];
    uint64_t v9 = [v8 objectForKey:v7];

    if (v9)
    {
      uint64_t v10 = [v6 identifier];
      [(VUIPlistMediaDatabase *)self _removeEntityWithIdentifier:v10];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = objc_msgSend(v6, "episodes", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) identifier];
            [(VUIPlistMediaDatabase *)self _removeEntityWithIdentifier:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      long long v17 = [v9 seasons];
      uint64_t v18 = (void *)[v17 mutableCopy];

      [v18 addObject:v6];
      [v9 setSeasons:v18];
    }
  }
}

- (void)_addEpisode:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5
{
  id v8 = a3;
  if (a4)
  {
    if (a5)
    {
      id v17 = v8;
      id v9 = a5;
      id v10 = a4;
      uint64_t v11 = [(VUIPlistMediaDatabase *)self showByIdentifier];
      uint64_t v12 = [v11 objectForKey:v10];

      uint64_t v13 = [v12 seasonForIdentifier:v9];

      id v8 = v17;
      if (v13)
      {
        uint64_t v14 = [v17 identifier];
        [(VUIPlistMediaDatabase *)self _removeEntityWithIdentifier:v14];

        uint64_t v15 = [v13 episodes];
        long long v16 = (void *)[v15 mutableCopy];

        [v16 addObject:v17];
        [v13 setEpisodes:v16];

        id v8 = v17;
      }
    }
  }
}

- (void)_addHomeVideo:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
  [v5 _addItem:v4 itemByIdentifier:v6];
}

- (void)_addMovie:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
  [v5 _addItem:v4 itemByIdentifier:v6];
}

- (void)_addMovieRental:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
  [v5 _addItem:v4 itemByIdentifier:v6];
}

+ (void)_addItem:(id)a3 itemByIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 _removeItem:v7 itemByIdentifier:v6];
  id v8 = [v7 identifier];
  [v6 setObject:v7 forKey:v8];
}

- (void)_removeShow:(id)a3
{
  id v4 = a3;
  id v6 = [(VUIPlistMediaDatabase *)self showByIdentifier];
  id v5 = [v4 identifier];

  [v6 removeObjectForKey:v5];
}

- (void)_removeSeason:(id)a3 fromShow:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 seasons];
  id v8 = (id)[v7 mutableCopy];

  [v8 removeObject:v6];
  [v5 setSeasons:v8];
}

- (void)_removeEpisode:(id)a3 fromSeason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 episodes];
  id v8 = (id)[v7 mutableCopy];

  [v8 removeObject:v6];
  [v5 setEpisodes:v8];
}

- (void)_removeHomeVideo:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
  [v5 _removeItem:v4 itemByIdentifier:v6];
}

- (void)_removeMovie:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
  [v5 _removeItem:v4 itemByIdentifier:v6];
}

- (void)_removeMovieRental:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
  [v5 _removeItem:v4 itemByIdentifier:v6];
}

+ (void)_removeItem:(id)a3 itemByIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [a3 identifier];
  [v5 removeObjectForKey:v6];
}

- (void)_removeEntityWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIPlistMediaDatabase *)self movieByIdentifier];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    [(VUIPlistMediaDatabase *)self _removeMovie:v6];
  }
  else
  {
    id v7 = [(VUIPlistMediaDatabase *)self movieRentalByIdentifier];
    id v6 = [v7 objectForKey:v4];

    if (v6)
    {
      [(VUIPlistMediaDatabase *)self _removeMovieRental:v6];
    }
    else
    {
      id v8 = [(VUIPlistMediaDatabase *)self homeVideoByIdentifier];
      id v6 = [v8 objectForKey:v4];

      if (v6)
      {
        [(VUIPlistMediaDatabase *)self _removeHomeVideo:v6];
      }
      else
      {
        id v9 = [(VUIPlistMediaDatabase *)self showByIdentifier];
        id v6 = [v9 objectForKey:v4];

        if (v6)
        {
          [(VUIPlistMediaDatabase *)self _removeShow:v6];
        }
        else
        {
          id v10 = [(VUIPlistMediaDatabase *)self showByIdentifier];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __53__VUIPlistMediaDatabase__removeEntityWithIdentifier___block_invoke;
          v11[3] = &unk_1E6DF4C18;
          id v12 = v4;
          uint64_t v13 = self;
          id v14 = 0;
          [v10 enumerateKeysAndObjectsUsingBlock:v11];
        }
      }
    }
  }
}

void __53__VUIPlistMediaDatabase__removeEntityWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = [a3 seasonForIdentifier:*(void *)(a1 + 32)];
  if (v8)
  {
    [*(id *)(a1 + 40) _removeSeason:v8 fromShow:*(void *)(a1 + 48)];
    id v6 = v8;
    *a4 = 1;
  }
  else
  {
    id v7 = [0 episodeForIdentifier:*(void *)(a1 + 32)];
    if (v7)
    {
      [*(id *)(a1 + 40) _removeEpisode:v7 fromSeason:0];
      *a4 = 1;
    }

    id v6 = 0;
  }
}

+ (id)_sortedEntitiesArray:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  id v5 = [v3 sortDescriptorWithKey:@"title" ascending:1];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  id v8 = (void *)[v7 copy];
  return v8;
}

- (void)_startMonitoringDatabaseFile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIPlistMediaDatabase *)self fileURL];
  id v4 = [v3 path];
  [v4 getCString:v15 maxLength:1024 encoding:4];
  int v5 = open(v15, 0x8000);
  if (v5 != -1)
  {
    int v6 = v5;
    uintptr_t v7 = v5;
    id v8 = [(VUIPlistMediaDatabase *)self serialDispatchQueue];
    id v9 = dispatch_source_create(MEMORY[0x1E4F144A8], v7, 0x23uLL, v8);

    if (v9)
    {
      [(VUIPlistMediaDatabase *)self setDatabaseFileDispatchSource:v9];
      objc_initWeak(&location, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke;
      handler[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v9, handler);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke_2;
      v10[3] = &__block_descriptor_36_e5_v8__0l;
      int v11 = v6;
      dispatch_source_set_cancel_handler(v9, v10);
      dispatch_resume(v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      close(v6);
    }
  }
}

void __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _parseDatabaseAndSendNotification];
}

uint64_t __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (void)setSerialDispatchQueue:(id)a3
{
}

- (OS_dispatch_source)databaseFileDispatchSource
{
  return self->_databaseFileDispatchSource;
}

- (void)setDatabaseFileDispatchSource:(id)a3
{
}

- (NSMutableDictionary)homeVideoByIdentifier
{
  return self->_homeVideoByIdentifier;
}

- (void)setHomeVideoByIdentifier:(id)a3
{
}

- (NSMutableDictionary)movieByIdentifier
{
  return self->_movieByIdentifier;
}

- (void)setMovieByIdentifier:(id)a3
{
}

- (NSMutableDictionary)movieRentalByIdentifier
{
  return self->_movieRentalByIdentifier;
}

- (void)setMovieRentalByIdentifier:(id)a3
{
}

- (NSMutableDictionary)showByIdentifier
{
  return self->_showByIdentifier;
}

- (void)setShowByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showByIdentifier, 0);
  objc_storeStrong((id *)&self->_movieRentalByIdentifier, 0);
  objc_storeStrong((id *)&self->_movieByIdentifier, 0);
  objc_storeStrong((id *)&self->_homeVideoByIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseFileDispatchSource, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)addEntity:showIdentifier:seasonIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to save database: %@", v2, v3, v4, v5, v6);
}

- (void)removeDownloadedMediaForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "Unable to remove media for databaseID %@ since it doesn't exist in database", v2, v3, v4, v5, v6);
}

- (void)removeDownloadedMediaForIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "Unable to delete contents at %@: %@");
}

- (void)_parseDatabase
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "Error deserializing database file! Database URL: %@, Error: %@");
}

@end