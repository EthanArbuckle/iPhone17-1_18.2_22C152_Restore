@interface PRSMLManager
+ (id)createPathToSpotlightPrefFile;
+ (id)getSPMLSharedInstance;
- (NSArray)categoryList;
- (NSMutableDictionary)combinedBottomScoreOrder;
- (NSMutableDictionary)combinedTopScoreOrder;
- (NSMutableDictionary)dictCoreDuetInfo;
- (NSMutableDictionary)mapPredictionEnginesToClasses;
- (NSMutableDictionary)mapPredictionEnginesToCountFiles;
- (NSMutableDictionary)mapPredictionEnginesToCounts;
- (NSMutableDictionary)mapPredictionEnginesToPredictedTopHit;
- (PRSCoreDuet)coreDuet;
- (id)getLastSavedCategoryRankings;
- (id)getRankedCategoriesAsDictionaryForDays:(int64_t)a3;
- (id)initManager;
- (unint64_t)getCountForCategory:(id)a3;
- (unint64_t)getTotalResultsUsedCountForDuet;
- (void)addCategoryAndGroupNameToTrainCategories:(id)a3 groupName:(id)a4;
- (void)dumpPredictionStatsToFlatFiles;
- (void)saveLastRankingForCategories:(id)a3;
- (void)setCategoryList:(id)a3;
- (void)setCombinedBottomScoreOrder:(id)a3;
- (void)setCombinedTopScoreOrder:(id)a3;
- (void)setCoreDuet:(id)a3;
- (void)setDictCoreDuetInfo:(id)a3;
- (void)setMapPredictionEnginesToClasses:(id)a3;
- (void)setMapPredictionEnginesToCountFiles:(id)a3;
- (void)setMapPredictionEnginesToCounts:(id)a3;
- (void)setMapPredictionEnginesToPredictedTopHit:(id)a3;
@end

@implementation PRSMLManager

+ (id)getSPMLSharedInstance
{
  v2 = (void *)SPMLSharedInstance;
  if (!SPMLSharedInstance)
  {
    if (getSPMLSharedInstance_onceToken != -1) {
      dispatch_once(&getSPMLSharedInstance_onceToken, &__block_literal_global_17);
    }
    v2 = (void *)SPMLSharedInstance;
  }
  id v3 = v2;
  return v3;
}

uint64_t __37__PRSMLManager_getSPMLSharedInstance__block_invoke()
{
  SPMLSharedInstance = [[PRSMLManager alloc] initManager];
  return MEMORY[0x1F41817F8]();
}

+ (id)createPathToSpotlightPrefFile
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v3];
  [v4 appendString:@"/com.apple.spotlight/"];

  return v4;
}

- (id)initManager
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  char v21 = 0;
  v4 = +[PRSMLManager createPathToSpotlightPrefFile];
  if ([v3 fileExistsAtPath:v4 isDirectory:&v21]) {
    BOOL v5 = v21 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v20 = 0;
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v6 = v20;
  }
  else
  {
    id v6 = 0;
  }
  v7 = [[PRSCoreDuet alloc] initWithStreamName:@"com.apple.spotlightviewer.events"];
  coreDuet = self->_coreDuet;
  self->_coreDuet = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  self->_dictCoreDuetInfo = v9;

  uint64_t v11 = [v4 mutableCopy];
  v12 = (void *)pathToCoreDuetFlatFile;
  pathToCoreDuetFlatFile = v11;

  v13 = (void *)pathToCoreDuetFlatFile;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v13 appendString:v15];

  if ([v3 fileExistsAtPath:pathToCoreDuetFlatFile])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v17 = (NSMutableDictionary *)[v16 initWithContentsOfFile:pathToCoreDuetFlatFile];
    v18 = self->_dictCoreDuetInfo;
    self->_dictCoreDuetInfo = v17;
  }
  return self;
}

- (void)addCategoryAndGroupNameToTrainCategories:(id)a3 groupName:(id)a4
{
}

- (id)getLastSavedCategoryRankings
{
  id v3 = self->_dictCoreDuetInfo;
  objc_sync_enter(v3);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:0];
  id v6 = [v5 stringValue];
  v7 = [(NSMutableDictionary *)dictCoreDuetInfo objectForKey:v6];

  objc_sync_exit(v3);
  return v7;
}

- (unint64_t)getTotalResultsUsedCountForDuet
{
  id v3 = self->_dictCoreDuetInfo;
  objc_sync_enter(v3);
  dictCoreDuetInfo = self->_dictCoreDuetInfo;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:1];
  id v6 = [v5 stringValue];
  v7 = [(NSMutableDictionary *)dictCoreDuetInfo objectForKey:v6];
  unint64_t v8 = [v7 integerValue];

  objc_sync_exit(v3);
  return v8;
}

- (unint64_t)getCountForCategory:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_dictCoreDuetInfo;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_dictCoreDuetInfo objectForKey:v4];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_dictCoreDuetInfo objectForKey:v4];
    unint64_t v8 = [v7 integerValue];
  }
  else
  {
    unint64_t v8 = 0;
  }
  objc_sync_exit(v5);

  return v8;
}

- (id)getRankedCategoriesAsDictionaryForDays:(int64_t)a3
{
  return [(PRSCoreDuet *)self->_coreDuet getRankedCategoriesDictionaryWithPredictionWindow:86400.0 predictionInterval:(double)a3 * 86400.0];
}

- (void)saveLastRankingForCategories:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = self->_dictCoreDuetInfo;
    objc_sync_enter(v5);
    dictCoreDuetInfo = self->_dictCoreDuetInfo;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:0];
    unint64_t v8 = [v7 stringValue];
    [(NSMutableDictionary *)dictCoreDuetInfo setObject:v9 forKey:v8];

    objc_sync_exit(v5);
    id v4 = v9;
  }
}

- (void)dumpPredictionStatsToFlatFiles
{
  id v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PRSMLManager_dumpPredictionStatsToFlatFiles__block_invoke;
  block[3] = &unk_1E634C270;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__PRSMLManager_dumpPredictionStatsToFlatFiles__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v6, (void)v13);
        unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v6];
        id v9 = v8;
        if (v8) {
          BOOL v10 = v7 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          id v11 = v8;
          objc_sync_enter(v11);
          [v11 writeToFile:v7 atomically:1];
          objc_sync_exit(v11);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }

  id v12 = *(id *)(*(void *)(a1 + 32) + 48);
  objc_sync_enter(v12);
  [*(id *)(*(void *)(a1 + 32) + 48) writeToFile:pathToCoreDuetFlatFile atomically:1];
  objc_sync_exit(v12);
}

- (PRSCoreDuet)coreDuet
{
  return (PRSCoreDuet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoreDuet:(id)a3
{
}

- (NSMutableDictionary)mapPredictionEnginesToClasses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMapPredictionEnginesToClasses:(id)a3
{
}

- (NSMutableDictionary)mapPredictionEnginesToCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMapPredictionEnginesToCounts:(id)a3
{
}

- (NSMutableDictionary)mapPredictionEnginesToCountFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMapPredictionEnginesToCountFiles:(id)a3
{
}

- (NSMutableDictionary)mapPredictionEnginesToPredictedTopHit
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMapPredictionEnginesToPredictedTopHit:(id)a3
{
}

- (NSMutableDictionary)dictCoreDuetInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDictCoreDuetInfo:(id)a3
{
}

- (NSArray)categoryList
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCategoryList:(id)a3
{
}

- (NSMutableDictionary)combinedTopScoreOrder
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCombinedTopScoreOrder:(id)a3
{
}

- (NSMutableDictionary)combinedBottomScoreOrder
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCombinedBottomScoreOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedBottomScoreOrder, 0);
  objc_storeStrong((id *)&self->_combinedTopScoreOrder, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_dictCoreDuetInfo, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToPredictedTopHit, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToCountFiles, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToCounts, 0);
  objc_storeStrong((id *)&self->_mapPredictionEnginesToClasses, 0);
  objc_storeStrong((id *)&self->_coreDuet, 0);
}

@end