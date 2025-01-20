@interface NTKTimelineEntryModelCache
+ (id)_endOfDayForDate:(id)a3;
+ (id)_startOfDayAfterDate:(id)a3;
+ (id)_startOfDayBeforeDate:(id)a3;
+ (id)_startOfDayForDate:(id)a3;
- (BOOL)hasEntryModelForDate:(id)a3;
- (NSDate)cacheEndDate;
- (NSDate)cacheStartDate;
- (NTKTimelineEntryModelCache)init;
- (NTKTimelineEntryModelCacheDataSource)dataSource;
- (id)_cachedEntryModelAfterDate:(id)a3 limit:(unint64_t)a4;
- (id)_cachedEntryModelBeforeDate:(id)a3 limit:(unint64_t)a4;
- (id)_cachedEntryModelForDate:(id)a3;
- (id)calendar;
- (id)entryModelForDate:(id)a3;
- (id)entryModelsAfterDate:(id)a3 limit:(unint64_t)a4;
- (id)entryModelsBeforeDate:(id)a3 limit:(unint64_t)a4;
- (void)_extendCacheTowardDate:(id)a3;
- (void)invalidate;
- (void)setDataSource:(id)a3;
@end

@implementation NTKTimelineEntryModelCache

- (NTKTimelineEntryModelCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKTimelineEntryModelCache;
  v2 = [(NTKTimelineEntryModelCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    cachedEntryModels = v2->_cachedEntryModels;
    v2->_cachedEntryModels = (NSMutableArray *)v3;

    [(NTKTimelineEntryModelCache *)v2 invalidate];
  }
  return v2;
}

- (BOOL)hasEntryModelForDate:(id)a3
{
  uint64_t v3 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelForDate:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)entryModelForDate:(id)a3
{
  id v4 = a3;
  [(NTKTimelineEntryModelCache *)self _extendCacheTowardDate:v4];
  v5 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelForDate:v4];

  return v5;
}

- (id)entryModelsBeforeDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _startOfDayBeforeDate:v6];
  [(NTKTimelineEntryModelCache *)self _extendCacheTowardDate:v7];
  v8 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelBeforeDate:v6 limit:a4];

  return v8;
}

- (id)entryModelsAfterDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _startOfDayAfterDate:v6];
  [(NTKTimelineEntryModelCache *)self _extendCacheTowardDate:v7];
  v8 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelAfterDate:v6 limit:a4];

  return v8;
}

- (void)invalidate
{
  [(NSMutableArray *)self->_cachedEntryModels removeAllObjects];
  cachedEntryModels = self->_cachedEntryModels;
  self->_cachedEntryModels = 0;

  cacheStartDate = self->_cacheStartDate;
  self->_cacheStartDate = 0;

  cacheEndDate = self->_cacheEndDate;
  self->_cacheEndDate = 0;
}

- (void)_extendCacheTowardDate:(id)a3
{
  id v4 = a3;
  id v22 = v4;
  if (!self->_cachedEntryModels)
  {
    v15 = [(id)objc_opt_class() _startOfDayForDate:v4];
    cacheStartDate = self->_cacheStartDate;
    self->_cacheStartDate = v15;

    v17 = [(id)objc_opt_class() _endOfDayForDate:v22];
    cacheEndDate = self->_cacheEndDate;
    self->_cacheEndDate = v17;

    v14 = [(NTKTimelineEntryModelCache *)self dataSource];
    v19 = [v14 loadEntryModelsForDay:self->_cacheStartDate];
    v20 = (NSMutableArray *)[v19 mutableCopy];
    cachedEntryModels = self->_cachedEntryModels;
    self->_cachedEntryModels = v20;

    goto LABEL_7;
  }
  if ([v4 isBeforeDate:self->_cacheStartDate])
  {
    v5 = [(id)objc_opt_class() _startOfDayBeforeDate:self->_cacheStartDate];
    id v6 = self->_cacheStartDate;
    self->_cacheStartDate = v5;

    v7 = [(NTKTimelineEntryModelCache *)self dataSource];
    v8 = [v7 loadEntryModelsForDay:self->_cacheStartDate];
    v9 = (NSMutableArray *)[v8 mutableCopy];

    [(NSMutableArray *)v9 addObjectsFromArray:self->_cachedEntryModels];
    v10 = self->_cachedEntryModels;
    self->_cachedEntryModels = v9;
  }
  if ([v22 isAfterDate:self->_cacheEndDate])
  {
    v11 = [(id)objc_opt_class() _startOfDayAfterDate:self->_cacheEndDate];
    v12 = self->_cacheEndDate;
    self->_cacheEndDate = v11;

    v13 = [(NTKTimelineEntryModelCache *)self dataSource];
    v14 = [v13 loadEntryModelsForDay:self->_cacheEndDate];

    [(NSMutableArray *)self->_cachedEntryModels addObjectsFromArray:v14];
LABEL_7:
  }
}

- (id)_cachedEntryModelForDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  id v17 = 0;
  cachedEntryModels = self->_cachedEntryModels;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__NTKTimelineEntryModelCache__cachedEntryModelForDate___block_invoke;
  v9[3] = &unk_1E62C8AD0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(NSMutableArray *)cachedEntryModels enumerateObjectsWithOptions:2 usingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__NTKTimelineEntryModelCache__cachedEntryModelForDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [v8 entryDate];
  if (([*(id *)(a1 + 32) isBeforeDate:v7] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_cachedEntryModelBeforeDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelForDate:v6];
  unint64_t v8 = [(NSMutableArray *)self->_cachedEntryModels indexOfObject:v7];
  unint64_t v9 = v8;
  if (v8 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v8;
  }
  unint64_t v11 = v8 - v10;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  while (v9 > v11)
  {
    v13 = [(NSMutableArray *)self->_cachedEntryModels objectAtIndexedSubscript:v9];
    uint64_t v14 = [v13 entryDate];
    uint64_t v15 = [v14 compare:v6];

    if (v15 == -1) {
      [v12 addObject:v13];
    }

    --v9;
  }

  return v12;
}

- (id)_cachedEntryModelAfterDate:(id)a3 limit:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NTKTimelineEntryModelCache *)self _cachedEntryModelForDate:v6];
  if (!v7)
  {
    unint64_t v9 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKTimelineEntryModelCache _cachedEntryModelAfterDate:limit:]((uint64_t)v6, (uint64_t)self, v9);
    }
    goto LABEL_7;
  }
  uint64_t v8 = [(NSMutableArray *)self->_cachedEntryModels indexOfObject:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      cachedEntryModels = self->_cachedEntryModels;
      int v19 = 138412802;
      v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = cachedEntryModels;
      _os_log_error_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_ERROR, "NTKTimelineEntryModelCache: Failed to find entryForDate %@ for date %@ in models: %@.", (uint8_t *)&v19, 0x20u);
    }
LABEL_7:

    unint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_8;
  }
  unint64_t v13 = v8;
  uint64_t v14 = [(NSMutableArray *)self->_cachedEntryModels count];
  if (v14 - v13 >= a4) {
    unint64_t v15 = a4;
  }
  else {
    unint64_t v15 = v14 - v13;
  }
  unint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
  if (v13 < v15 + v13)
  {
    do
    {
      v16 = [(NSMutableArray *)self->_cachedEntryModels objectAtIndexedSubscript:v13];
      id v17 = [v16 entryDate];
      uint64_t v18 = [v17 compare:v6];

      if (v18 == 1) {
        [v11 addObject:v16];
      }

      ++v13;
      --v15;
    }
    while (v15);
  }
LABEL_8:

  return v11;
}

- (id)calendar
{
  return (id)[MEMORY[0x1E4F1C9A8] currentCalendar];
}

+ (id)_startOfDayForDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  id v6 = [v5 startOfDayForDate:v4];

  return v6;
}

+ (id)_startOfDayBeforeDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v7 = [v6 dateByAddingUnit:16 value:-1 toDate:v5 options:0];

  uint64_t v8 = [a1 _startOfDayForDate:v7];

  return v8;
}

+ (id)_startOfDayAfterDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v7 = [v6 dateByAddingUnit:16 value:1 toDate:v5 options:0];

  uint64_t v8 = [a1 _startOfDayForDate:v7];

  return v8;
}

+ (id)_endOfDayForDate:(id)a3
{
  return NTKEndOfDayForDate(a3);
}

- (NSDate)cacheStartDate
{
  return self->_cacheStartDate;
}

- (NSDate)cacheEndDate
{
  return self->_cacheEndDate;
}

- (NTKTimelineEntryModelCacheDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NTKTimelineEntryModelCacheDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cacheEndDate, 0);
  objc_storeStrong((id *)&self->_cacheStartDate, 0);
  objc_storeStrong((id *)&self->_cachedEntryModels, 0);
}

- (void)_cachedEntryModelAfterDate:(os_log_t)log limit:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 8);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKTimelineEntryModelCache: entryForDate is nil for date: %@. Models: %@", (uint8_t *)&v4, 0x16u);
}

@end