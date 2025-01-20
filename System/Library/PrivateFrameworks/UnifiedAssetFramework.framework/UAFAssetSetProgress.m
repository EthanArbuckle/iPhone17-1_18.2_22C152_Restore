@interface UAFAssetSetProgress
+ (id)getSerialQueue;
+ (id)validProgressTypes;
- (NSMutableDictionary)progresses;
- (NSMutableDictionary)statuses;
- (NSString)name;
- (UAFAssetSetProgress)initWithName:(id)a3 maxProgressBeforeComplete:(unint64_t)a4 progressWithStatus:(id)a5;
- (UAFAssetSetProgress)progressWithStatus;
- (UAFAssetSetProgress)setProgressWithStatus:(id)a3;
- (unint64_t)completed;
- (unint64_t)maxProgressBeforeComplete;
- (unint64_t)reportedComplete;
- (unint64_t)reportedPercent;
- (unint64_t)reportedStatus;
- (unint64_t)reportedTotal;
- (unint64_t)total;
- (void)progress:(id)a3 completed:(unint64_t)a4 total:(unint64_t)a5 status:(unint64_t)a6;
- (void)reportPercent:(unint64_t)a3 status:(unint64_t)a4 totalKnown:(BOOL)a5;
- (void)setCompleted:(unint64_t)a3;
- (void)setMaxProgressBeforeComplete:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setProgresses:(id)a3;
- (void)setReportedComplete:(unint64_t)a3;
- (void)setReportedPercent:(unint64_t)a3;
- (void)setReportedStatus:(unint64_t)a3;
- (void)setReportedTotal:(unint64_t)a3;
- (void)setStatuses:(id)a3;
- (void)setTotal:(unint64_t)a3;
- (void)summarize;
@end

@implementation UAFAssetSetProgress

- (UAFAssetSetProgress)initWithName:(id)a3 maxProgressBeforeComplete:(unint64_t)a4 progressWithStatus:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)UAFAssetSetProgress;
  v11 = [(UAFAssetSetProgress *)&v38 init];
  v12 = v11;
  if (v11)
  {
    id v32 = v10;
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_completed = 0;
    v12->_total = 0;
    v12->_maxProgressBeforeComplete = a4;
    uint64_t v13 = objc_opt_new();
    progresses = v12->_progresses;
    v12->_progresses = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    statuses = v12->_statuses;
    v12->_statuses = (NSMutableDictionary *)v15;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v39[0] = @"AutoAsset";
    v39[1] = @"Trial";
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v22 = objc_opt_new();
          [(NSMutableDictionary *)v12->_progresses setObject:v22 forKeyedSubscript:v21];

          v23 = [NSNumber numberWithUnsignedLongLong:0];
          v24 = [(NSMutableDictionary *)v12->_progresses objectForKeyedSubscript:v21];
          [v24 setObject:v23 forKeyedSubscript:@"Completed"];

          v25 = [NSNumber numberWithUnsignedLongLong:0];
          v26 = [(NSMutableDictionary *)v12->_progresses objectForKeyedSubscript:v21];
          [v26 setObject:v25 forKeyedSubscript:@"Total"];

          v27 = [NSNumber numberWithUnsignedInteger:0];
          [(NSMutableDictionary *)v12->_statuses setObject:v27 forKeyedSubscript:v21];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v18);
    }

    *(_OWORD *)&v12->_reportedStatus = 0u;
    *(_OWORD *)&v12->_reportedComplete = 0u;
    id v10 = v32;
    uint64_t v28 = MEMORY[0x237E26D50](v32);
    id progressWithStatus = v12->_progressWithStatus;
    v12->_id progressWithStatus = (id)v28;

    v30 = v12;
  }

  return v12;
}

uint64_t __55__UAFAssetSetProgress_progress_completed_total_status___block_invoke(uint64_t a1)
{
  v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) progresses];
  v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v4 setObject:v2 forKeyedSubscript:@"Completed"];

  v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v6 = [*(id *)(a1 + 32) progresses];
  v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v7 setObject:v5 forKeyedSubscript:@"Total"];

  v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v9 = [*(id *)(a1 + 32) statuses];
  [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  id v10 = *(void **)(a1 + 32);

  return [v10 summarize];
}

- (NSMutableDictionary)progresses
{
  return self->_progresses;
}

- (NSMutableDictionary)statuses
{
  return self->_statuses;
}

- (void)progress:(id)a3 completed:(unint64_t)a4 total:(unint64_t)a5 status:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = +[UAFAssetSetProgress validProgressTypes];
  char v12 = [v11 containsObject:v10];

  if (v12)
  {
    uint64_t v13 = +[UAFAssetSetProgress getSerialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__UAFAssetSetProgress_progress_completed_total_status___block_invoke;
    block[3] = &unk_264CEC1D8;
    block[4] = self;
    id v17 = v10;
    unint64_t v18 = a4;
    unint64_t v19 = a5;
    unint64_t v20 = a6;
    dispatch_async(v13, block);
  }
  else
  {
    v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      *(_DWORD *)buf = 136315650;
      v22 = "-[UAFAssetSetProgress progress:completed:total:status:]";
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      v26 = name;
      _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Invalid progress type %{public}@ used for %{public}@", buf, 0x20u);
    }
  }
}

- (void)summarize
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = +[UAFAssetSetProgress validProgressTypes];
  uint64_t v23 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v23)
  {
    char v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    id obj = v3;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_progresses objectForKeyedSubscript:v8];
        id v10 = [v9 objectForKeyedSubscript:@"Completed"];
        uint64_t v11 = [v10 unsignedLongLongValue];

        char v12 = [(NSMutableDictionary *)self->_progresses objectForKeyedSubscript:v8];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"Total"];
        uint64_t v14 = [v13 unsignedLongLongValue];

        if (v14)
        {
          BOOL v15 = 0;
        }
        else
        {
          v16 = [(NSMutableDictionary *)self->_statuses objectForKeyedSubscript:v8];
          if ([v16 unsignedIntegerValue] == 4)
          {
            BOOL v15 = 0;
          }
          else
          {
            id v17 = [(NSMutableDictionary *)self->_statuses objectForKeyedSubscript:v8];
            BOOL v15 = [v17 unsignedIntegerValue] != 5;
          }
        }
        v6 += v11;
        v5 += v14;
        v4 |= v15;
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v23);

    if (v6 > self->_completed) {
      self->_completed = v6;
    }
    p_total = &self->_total;
    if (v5 > self->_total) {
      unint64_t *p_total = v5;
    }
  }
  else
  {

    char v4 = 0;
    p_total = &self->_total;
  }
  if ((+[UAFAssetSetManager coalesceDownloadStatus:self->_statuses] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    unint64_t reportedPercent = 100;
  }
  else if ((*p_total == 0) | v4 & 1)
  {
    unint64_t reportedPercent = 0;
  }
  else
  {
    double v20 = (double)self->_completed * (double)self->_maxProgressBeforeComplete / (double)*p_total;
    if (self->_reportedPercent <= (unint64_t)v20) {
      unint64_t reportedPercent = (unint64_t)v20;
    }
    else {
      unint64_t reportedPercent = self->_reportedPercent;
    }
  }
  self->_unint64_t reportedPercent = reportedPercent;
  -[UAFAssetSetProgress reportPercent:status:totalKnown:](self, "reportPercent:status:totalKnown:");
}

- (void)reportPercent:(unint64_t)a3 status:(unint64_t)a4 totalKnown:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_reportedStatus == a4
    && (!a5 || self->_reportedComplete == self->_completed && self->_reportedTotal == self->_total))
  {
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t reportedComplete = self->_reportedComplete;
      unint64_t reportedTotal = self->_reportedTotal;
      unint64_t completed = self->_completed;
      unint64_t total = self->_total;
      int v20 = 136316418;
      uint64_t v21 = "-[UAFAssetSetProgress reportPercent:status:totalKnown:]";
      __int16 v22 = 2048;
      unint64_t v23 = reportedComplete;
      __int16 v24 = 2048;
      unint64_t v25 = completed;
      __int16 v26 = 2048;
      unint64_t v27 = reportedTotal;
      __int16 v28 = 2048;
      unint64_t v29 = total;
      __int16 v30 = 1024;
      LODWORD(v31) = a4;
      _os_log_debug_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEBUG, "%s Progress and status has not changed, suppressing update: %llu/%llu %llu/%llu %u", (uint8_t *)&v20, 0x3Au);
    }
  }
  else
  {
    id v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      unint64_t v11 = self->_completed;
      unint64_t v12 = self->_total;
      uint64_t v13 = UAFSubscriptionDownloadStatusDescription(a4);
      int v20 = 136316418;
      uint64_t v21 = "-[UAFAssetSetProgress reportPercent:status:totalKnown:]";
      __int16 v22 = 2114;
      unint64_t v23 = (unint64_t)name;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      __int16 v26 = 2048;
      unint64_t v27 = v11;
      __int16 v28 = 2048;
      unint64_t v29 = v12;
      __int16 v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %lu percent (%llu / %llu) . Status: %{public}@", (uint8_t *)&v20, 0x3Eu);
    }
    unint64_t v14 = self->_total;
    self->_unint64_t reportedComplete = self->_completed;
    self->_unint64_t reportedTotal = v14;
    self->_reportedStatus = a4;
    id progressWithStatus = (void (**)(double))self->_progressWithStatus;
    if (progressWithStatus) {
      progressWithStatus[2]((double)a3);
    }
  }
}

+ (id)getSerialQueue
{
  if (_MergedGlobals_16 != -1) {
    dispatch_once(&_MergedGlobals_16, &__block_literal_global_18);
  }
  v2 = (void *)qword_26AF0BB28;

  return v2;
}

+ (id)validProgressTypes
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"AutoAsset";
  v4[1] = @"Trial";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

void __37__UAFAssetSetProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAssetSetProgress.Serial", 0);
  v1 = (void *)qword_26AF0BB28;
  qword_26AF0BB28 = (uint64_t)v0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)completed
{
  return self->_completed;
}

- (void)setCompleted:(unint64_t)a3
{
  self->_unint64_t completed = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_unint64_t total = a3;
}

- (unint64_t)maxProgressBeforeComplete
{
  return self->_maxProgressBeforeComplete;
}

- (void)setMaxProgressBeforeComplete:(unint64_t)a3
{
  self->_maxProgressBeforeComplete = a3;
}

- (void)setProgresses:(id)a3
{
}

- (void)setStatuses:(id)a3
{
}

- (unint64_t)reportedComplete
{
  return self->_reportedComplete;
}

- (void)setReportedComplete:(unint64_t)a3
{
  self->_unint64_t reportedComplete = a3;
}

- (unint64_t)reportedTotal
{
  return self->_reportedTotal;
}

- (void)setReportedTotal:(unint64_t)a3
{
  self->_unint64_t reportedTotal = a3;
}

- (unint64_t)reportedStatus
{
  return self->_reportedStatus;
}

- (void)setReportedStatus:(unint64_t)a3
{
  self->_reportedStatus = a3;
}

- (unint64_t)reportedPercent
{
  return self->_reportedPercent;
}

- (void)setReportedPercent:(unint64_t)a3
{
  self->_unint64_t reportedPercent = a3;
}

- (UAFAssetSetProgress)progressWithStatus
{
  return (UAFAssetSetProgress *)self->_progressWithStatus;
}

- (UAFAssetSetProgress)setProgressWithStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressWithStatus, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_progresses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end