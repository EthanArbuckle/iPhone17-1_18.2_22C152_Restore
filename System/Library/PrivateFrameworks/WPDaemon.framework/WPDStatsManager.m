@interface WPDStatsManager
+ (id)getStringFromActivity:(unint64_t)a3;
- (BOOL)PLLogAvailable;
- (NSDictionary)scanArray;
- (NSMutableArray)advertisingArray;
- (NSMutableArray)aggressiveScanArray;
- (NSMutableArray)regularScanArray;
- (NSString)name;
- (OS_dispatch_queue)reportQueue;
- (WPDStatsManager)initWithServer:(id)a3;
- (WPDaemonServer)server;
- (double)nextPushTime;
- (id)description;
- (id)generateStateDumpStrings;
- (id)getStatsDictionary;
- (unint64_t)resetAdvertisingArray;
- (unint64_t)resetScanArray;
- (void)dealloc;
- (void)generateStateDump;
- (void)reportPLStats;
- (void)resetActivity:(unint64_t)a3 forType:(unsigned __int8)a4;
- (void)resetActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4;
- (void)setAdvertisingArray:(id)a3;
- (void)setAggressiveScanArray:(id)a3;
- (void)setNextPushTime:(double)a3;
- (void)setRegularScanArray:(id)a3;
- (void)setReportQueue:(id)a3;
- (void)setResetAdvertisingArray:(unint64_t *)a3;
- (void)setResetScanArray:(unint64_t *)a3;
- (void)setScanArray:(id)a3;
- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4;
- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5;
- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4;
- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5;
- (void)stopActivity:(unint64_t)a3;
- (void)stopActivity:(unint64_t)a3 forType:(unsigned __int8)a4;
- (void)stopActivityAsync:(unint64_t)a3;
- (void)stopActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4;
@end

@implementation WPDStatsManager

uint64_t __32__WPDStatsManager_stopActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stopTime];
}

uint64_t __32__WPDStatsManager_stopActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopTime];
}

- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5
{
  unsigned int v5 = a4;
  if (a4 < 0x1Bu)
  {
    unsigned int v7 = a4;
    if (a3)
    {
      v8 = [(NSMutableArray *)self->_advertisingArray objectAtIndexedSubscript:a4];
    }
    else
    {
      v11 = [(WPDStatsManager *)self regularScanArray];
      v12 = [v11 objectAtIndexedSubscript:v7];
      [v12 stopTime];

      v13 = [(WPDStatsManager *)self aggressiveScanArray];
      v14 = [v13 objectAtIndexedSubscript:v7];
      [v14 stopTime];

      scanArray = self->_scanArray;
      v16 = [NSNumber numberWithInteger:a5];
      v17 = [(NSDictionary *)scanArray objectForKeyedSubscript:v16];
      id v18 = [v17 objectAtIndexedSubscript:v7];

      v8 = v18;
    }
    id v19 = v8;
    [v8 startTime];
  }
  else if (+[WPDaemonServer isInternalBuild])
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"WPClientType beyond bounds", @"Trying to start activity for type %ld when WPClientMax is %ld", v5, 27);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_3);
    }
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDStatsManager startActivity:forType:scanRate:](v5, v9);
    }
  }
}

- (NSMutableArray)regularScanArray
{
  return self->_regularScanArray;
}

- (NSMutableArray)aggressiveScanArray
{
  return self->_aggressiveScanArray;
}

- (void)stopActivity:(unint64_t)a3
{
  if (a3)
  {
    v4 = [(WPDStatsManager *)self advertisingArray];
    unsigned int v5 = &__block_literal_global_184_3;
  }
  else
  {
    v6 = [(WPDStatsManager *)self regularScanArray];
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_180_0];

    v4 = [(WPDStatsManager *)self aggressiveScanArray];
    unsigned int v5 = &__block_literal_global_182_0;
  }
  id v7 = v4;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (void)resetActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
  int v4 = a4;
  if (a3)
  {
    if (![(WPDStatsManager *)self resetAdvertisingArray]) {
      return;
    }
    v6 = [(WPDStatsManager *)self resetAdvertisingArray];
  }
  else
  {
    if (![(WPDStatsManager *)self resetScanArray]) {
      return;
    }
    v6 = [(WPDStatsManager *)self resetScanArray];
  }
  ++v6[v4];
}

- (unint64_t)resetAdvertisingArray
{
  return self->_resetAdvertisingArray;
}

- (unint64_t)resetScanArray
{
  return self->_resetScanArray;
}

- (void)stopActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
  uint64_t v5 = a4;
  if (a3)
  {
    [(WPDStatsManager *)self advertisingArray];
  }
  else
  {
    v6 = [(WPDStatsManager *)self regularScanArray];
    id v7 = [v6 objectAtIndexedSubscript:v5];
    [v7 stopTime];

    [(WPDStatsManager *)self aggressiveScanArray];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [v9 objectAtIndexedSubscript:v5];
  [v8 stopTime];
}

- (void)startActivity:(unint64_t)a3 forType:(unsigned __int8)a4
{
}

- (NSMutableArray)advertisingArray
{
  return self->_advertisingArray;
}

- (WPDStatsManager)initWithServer:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WPDStatsManager;
  uint64_t v5 = [(WPDStatsManager *)&v29 init];
  v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = (NSString *)@"StatsManager";

    objc_storeWeak((id *)&v6->_server, v4);
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:27];
    regularScanArray = v6->_regularScanArray;
    v6->_regularScanArray = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:27];
    aggressiveScanArray = v6->_aggressiveScanArray;
    v6->_aggressiveScanArray = (NSMutableArray *)v10;

    v30[0] = &unk_26D646EA8;
    v30[1] = &unk_26D646EC0;
    v12 = v6->_aggressiveScanArray;
    v31[0] = v6->_regularScanArray;
    v31[1] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    scanArray = v6->_scanArray;
    v6->_scanArray = (NSDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] arrayWithCapacity:27];
    advertisingArray = v6->_advertisingArray;
    v6->_advertisingArray = (NSMutableArray *)v15;

    v6->_resetScanArray = (unint64_t *)malloc_type_malloc(0xD8uLL, 0x100004000313F17uLL);
    uint64_t v17 = 0;
    v6->_resetAdvertisingArray = (unint64_t *)malloc_type_malloc(0xD8uLL, 0x100004000313F17uLL);
    do
    {
      id v18 = v6->_regularScanArray;
      id v19 = objc_opt_new();
      [(NSMutableArray *)v18 addObject:v19];

      v20 = v6->_aggressiveScanArray;
      v21 = objc_opt_new();
      [(NSMutableArray *)v20 addObject:v21];

      v22 = v6->_advertisingArray;
      v23 = objc_opt_new();
      [(NSMutableArray *)v22 addObject:v23];

      resetAdvertisingArray = v6->_resetAdvertisingArray;
      v6->_resetScanArray[v17] = 0;
      resetAdvertisingArray[v17++] = 0;
    }
    while (v17 != 27);
    reportQueue = v6->_reportQueue;
    v6->_reportQueue = 0;

    v6->_nextPushTime = 0.0;
    if (MEMORY[0x263F5F608]) {
      BOOL v26 = MEMORY[0x263F5F610] == 0;
    }
    else {
      BOOL v26 = 1;
    }
    char v27 = !v26;
    v6->_PLLogAvailable = v27;
  }

  return v6;
}

- (void)dealloc
{
  resetScanArray = self->_resetScanArray;
  if (resetScanArray)
  {
    free(resetScanArray);
    self->_resetScanArray = 0;
  }
  resetAdvertisingArray = self->_resetAdvertisingArray;
  if (resetAdvertisingArray)
  {
    free(resetAdvertisingArray);
    self->_resetAdvertisingArray = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WPDStatsManager;
  [(WPDStatsManager *)&v5 dealloc];
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x223CB05A0](self, a2);
  id v4 = [(WPDStatsManager *)self generateStateDumpStrings];
  uint64_t v5 = [v4 count] - 1;
  v6 = [MEMORY[0x263F089D8] stringWithFormat:@"%@\n", self->_name];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(v4, "subarrayWithRange:", 1, v5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 appendString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v12 = [NSString stringWithString:v6];

  return v12;
}

- (id)generateStateDumpStrings
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263F089D8] stringWithFormat:@"========= %@ =========\n", self->_name];
  [v3 addObject:v4];

  if (self->_PLLogAvailable)
  {
    [(WPDStatsManager *)self nextPushTime];
    uint64_t v5 = NSString;
    if (v6 <= 0.0)
    {
      [NSString stringWithFormat:@"Last pushed to PL log (%@) - never"], @"WirelessProximity", v12);
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(WPDStatsManager *)self nextPushTime];
      [v5 stringWithFormat:@"Last pushed to PL log (%@) - %f seconds ago"], @"WirelessProximity", Current - v8 + 1200.0);
    uint64_t v9 = };
    [v3 addObject:v9];
  }
  else
  {
    [v3 addObject:@"Push to PL log is not supported"];
  }
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v10;
}

- (void)generateStateDump
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(WPDStatsManager *)self generateStateDumpStrings];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
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
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
        }
        double v8 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v7;
          _os_log_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __32__WPDStatsManager_stopActivity___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stopTime];
}

- (id)getStatsDictionary
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  uint64_t v4 = (void *)MEMORY[0x223CB05A0]();
  uint64_t v5 = [(WPDStatsManager *)self regularScanArray];
  uint64_t v6 = timeArrayFromArray(v5);
  [v3 setObject:v6 forKeyedSubscript:@"Scan"];

  uint64_t v7 = [(WPDStatsManager *)self advertisingArray];
  double v8 = timeArrayFromArray(v7);
  [v3 setObject:v8 forKeyedSubscript:@"Advertise"];

  long long v9 = [(WPDStatsManager *)self aggressiveScanArray];
  long long v10 = timeArrayFromArray(v9);
  [v3 setObject:v10 forKeyedSubscript:@"AggressiveScan"];

  long long v11 = counterArrayFromCounters((uint64_t)[(WPDStatsManager *)self resetScanArray]);
  [v3 setObject:v11 forKeyedSubscript:@"ResetScan"];

  long long v12 = counterArrayFromCounters((uint64_t)[(WPDStatsManager *)self resetAdvertisingArray]);
  [v3 setObject:v12 forKeyedSubscript:@"ResetAdvertise"];

  return v3;
}

- (void)reportPLStats
{
  if (self->_PLLogAvailable)
  {
    reportQueue = self->_reportQueue;
    if (!reportQueue)
    {
      uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);

      uint64_t v6 = (OS_dispatch_queue *)dispatch_queue_create("WPStatsQueue", v5);
      uint64_t v7 = self->_reportQueue;
      self->_reportQueue = v6;

      id location = 0;
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __32__WPDStatsManager_reportPLStats__block_invoke;
      v10[3] = &unk_26469ABC0;
      objc_copyWeak(&v11, &location);
      uint64_t v8 = MEMORY[0x223CB07B0](v10);
      long long v9 = (void *)reportPLStats_reportBlock;
      reportPLStats_reportBlock = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

      reportQueue = self->_reportQueue;
    }
    dispatch_async(reportQueue, (dispatch_block_t)reportPLStats_reportBlock);
  }
}

void __32__WPDStatsManager_reportPLStats__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x223CB05A0]();
    [WeakRetained nextPushTime];
    if (v3 <= CFAbsoluteTimeGetCurrent())
    {
      if (PLShouldLogRegisteredEvent())
      {
        uint64_t v5 = [WeakRetained getStatsDictionary];
        PLLogRegisteredEvent();
        [WeakRetained setNextPushTime:CFAbsoluteTimeGetCurrent() + 1200.0];
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_209_1);
        }
        uint64_t v6 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          __32__WPDStatsManager_reportPLStats__block_invoke_cold_3((uint64_t)v5, v6);
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_206_1);
        }
        uint64_t v7 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          __32__WPDStatsManager_reportPLStats__block_invoke_cold_2(v7);
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_203_0);
      }
      uint64_t v4 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        __32__WPDStatsManager_reportPLStats__block_invoke_cold_1(v4);
      }
    }
  }
}

+ (id)getStringFromActivity:(unint64_t)a3
{
  if (a3) {
    return @"WPDStatActivityAdvertise";
  }
  else {
    return @"WPDStatActivityScan";
  }
}

- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4 scanRate:(int64_t)a5
{
  id location = 0;
  objc_initWeak(&location, self);
  long long v9 = [(WPDStatsManager *)self server];
  long long v10 = [v9 serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WPDStatsManager_startActivityAsync_forType_scanRate___block_invoke;
  block[3] = &unk_26469B8D0;
  objc_copyWeak(v12, &location);
  unsigned __int8 v13 = a4;
  v12[1] = (id)a3;
  v12[2] = (id)a5;
  dispatch_async(v10, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __55__WPDStatsManager_startActivityAsync_forType_scanRate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained startActivity:*(void *)(a1 + 40) forType:*(unsigned __int8 *)(a1 + 56) scanRate:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)startActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = [(WPDStatsManager *)self server];
  uint64_t v8 = [v7 serverQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__WPDStatsManager_startActivityAsync_forType___block_invoke;
  v9[3] = &unk_26469B8F8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  unsigned __int8 v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __46__WPDStatsManager_startActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained startActivity:*(void *)(a1 + 40) forType:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)stopActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = [(WPDStatsManager *)self server];
  uint64_t v8 = [v7 serverQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__WPDStatsManager_stopActivityAsync_forType___block_invoke;
  v9[3] = &unk_26469B8F8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  unsigned __int8 v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __45__WPDStatsManager_stopActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained stopActivity:*(void *)(a1 + 40) forType:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)stopActivityAsync:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WPDStatsManager *)self server];
  uint64_t v6 = [v5 serverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WPDStatsManager_stopActivityAsync___block_invoke;
  block[3] = &unk_26469B920;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __37__WPDStatsManager_stopActivityAsync___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained stopActivity:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)resetActivityAsync:(unint64_t)a3 forType:(unsigned __int8)a4
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = [(WPDStatsManager *)self server];
  uint64_t v8 = [v7 serverQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__WPDStatsManager_resetActivityAsync_forType___block_invoke;
  v9[3] = &unk_26469B8F8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  unsigned __int8 v11 = a4;
  dispatch_async(v8, v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __46__WPDStatsManager_resetActivityAsync_forType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained resetActivity:*(void *)(a1 + 40) forType:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)scanArray
{
  return self->_scanArray;
}

- (void)setScanArray:(id)a3
{
}

- (void)setRegularScanArray:(id)a3
{
}

- (void)setAggressiveScanArray:(id)a3
{
}

- (void)setAdvertisingArray:(id)a3
{
}

- (void)setResetScanArray:(unint64_t *)a3
{
  self->_resetScanArray = a3;
}

- (void)setResetAdvertisingArray:(unint64_t *)a3
{
  self->_resetAdvertisingArray = a3;
}

- (OS_dispatch_queue)reportQueue
{
  return self->_reportQueue;
}

- (void)setReportQueue:(id)a3
{
}

- (double)nextPushTime
{
  return self->_nextPushTime;
}

- (void)setNextPushTime:(double)a3
{
  self->_nextPushTime = a3;
}

- (BOOL)PLLogAvailable
{
  return self->_PLLogAvailable;
}

- (WPDaemonServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (WPDaemonServer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_advertisingArray, 0);
  objc_storeStrong((id *)&self->_aggressiveScanArray, 0);
  objc_storeStrong((id *)&self->_regularScanArray, 0);
  objc_storeStrong((id *)&self->_scanArray, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)startActivity:(unsigned __int8)a1 forType:(NSObject *)a2 scanRate:.cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 27;
  _os_log_error_impl(&dword_22316D000, a2, OS_LOG_TYPE_ERROR, "WPClientType %ld beyond bounds WPClientMax = %ld", (uint8_t *)&v2, 0x16u);
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138477827;
  int v2 = @"WirelessProximity";
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPStatsManager skipped write to PL log (%{private}@)", (uint8_t *)&v1, 0xCu);
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138477827;
  int v2 = @"WirelessProximity";
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPStatsManager denied write to PL log (%{private}@)", (uint8_t *)&v1, 0xCu);
}

void __32__WPDStatsManager_reportPLStats__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138478083;
  uint64_t v3 = @"WirelessProximity";
  __int16 v4 = 2113;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "WPStatsManager did write to PL log %{private}@ info:%{private}@", (uint8_t *)&v2, 0x16u);
}

@end