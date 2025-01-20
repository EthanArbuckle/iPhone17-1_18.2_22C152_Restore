@interface PowerUICECGridDataManager
+ (id)cleanIntervalsStringFromDates:(id)a3;
+ (id)sharedInstance;
- (BOOL)enoughVariationForForecast:(id)a3;
- (BOOL)shouldChargeNow;
- (BOOL)shouldEngageForPluggedInTime:(double)a3;
- (BOOL)tChargeNow;
- (BOOL)tSavingOpportunity;
- (NSMutableArray)cleanIntervals;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUICECGridDataManager)init;
- (_GDSEmissionForecast)currentForecast;
- (_GDSManager)gridManager;
- (double)refetchPeriod;
- (id)fetchForecast;
- (id)forecastMapFrom:(id)a3 ofInterval:(double)a4;
- (id)valuesFromForecast:(id)a3 forInterval:(double)a4;
- (unint64_t)thresholdFromForecast:(id)a3 forChargeTime:(double)a4;
- (void)resetState;
- (void)setCurrentForecast:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setGridManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRefetchPeriod:(double)a3;
- (void)setTChargeNow:(BOOL)a3;
- (void)setTSavingOpportunity:(BOOL)a3;
- (void)setupChargingTime:(double)a3 forPluggedInTime:(double)a4;
@end

@implementation PowerUICECGridDataManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PowerUICECGridDataManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __43__PowerUICECGridDataManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (PowerUICECGridDataManager)init
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)PowerUICECGridDataManager;
  id v2 = [(PowerUICECGridDataManager *)&v36 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.cec", "GridDataManager");
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.cec"];
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.powerui.cecgriddatamanager.queue", v7);
    v9 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v8;

    uint64_t v10 = [MEMORY[0x263F41D58] managerWithID:@"com.apple.PowerUIAgent.gridManager" locationBundlePath:@"/System/Library/LocationBundles/SystemCustomization.bundle"];
    v11 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v10;

    *((void *)v2 + 5) = 0x40CC200000000000;
    v12 = [*((id *)v2 + 2) objectForKey:@"cleanIntervals"];
    v13 = v12;
    if (v12)
    {
      v31 = v12;
      uint64_t v14 = [v12 mutableCopy];
      v15 = (void *)*((void *)v2 + 8);
      *((void *)v2 + 8) = v14;

      v16 = *((void *)v2 + 4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Loaded cleaner intervals:", buf, 2u);
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = *((id *)v2 + 8);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *((void *)v2 + 4);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x263F08790];
              v25 = v22;
              v26 = [v24 localizedStringFromDate:v23 dateStyle:0 timeStyle:1];
              *(_DWORD *)buf = 138412290;
              v38 = v26;
              _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v19);
      }

      v13 = v31;
    }
    v27 = [*((id *)v2 + 2) objectForKey:@"testSavingOpportunity"];
    v28 = v27;
    if (v27) {
      *((unsigned char *)v2 + 8) = [v27 BOOLValue];
    }
    v29 = [*((id *)v2 + 2) objectForKey:@"testChargeNow"];

    if (v29) {
      *((unsigned char *)v2 + 9) = [v29 BOOLValue];
    }
  }
  return (PowerUICECGridDataManager *)v2;
}

- (BOOL)shouldEngageForPluggedInTime:(double)a3
{
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    uint64_t v5 = [(NSUserDefaults *)self->_defaults objectForKey:@"testSavingOpportunity"];
    v6 = v5;
    if (v5)
    {
      int v7 = [v5 BOOLValue];
      self->_tSavingOpportunity = v7;
      if (v7)
      {
LABEL_4:
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Saving Mode set", buf, 2u);
        }

        return 1;
      }
    }
    else if (self->_tSavingOpportunity)
    {
      goto LABEL_4;
    }
  }
  if (a3 >= 3600.0)
  {
    *(void *)buf = 0;
    v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PowerUICECGridDataManager_shouldEngageForPluggedInTime___block_invoke;
    block[3] = &unk_2645A6800;
    block[4] = self;
    void block[5] = buf;
    *(double *)&block[6] = a3;
    dispatch_sync(queue, block);
    BOOL v9 = v15[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v10 = self->_log;
    BOOL v9 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Predicted pluggedIn time is short. Not engaging", buf, 2u);
      return 0;
    }
  }
  return v9;
}

void __58__PowerUICECGridDataManager_shouldEngageForPluggedInTime___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
    v4 = v2;
    uint64_t v5 = [v3 fetchDate];
    int v18 = 138412290;
    uint64_t v19 = v5;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Current forecast fetch date %@", (uint8_t *)&v18, 0xCu);
  }
  v6 = [*(id *)(*(void *)(a1 + 32) + 48) fetchDate];
  [v6 timeIntervalSinceNow];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v8 >= -*(double *)(v7 + 40))
  {
    uint64_t v9 = *(void *)(v7 + 48);

    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v10 = (id)[*(id *)(a1 + 32) fetchForecast];
LABEL_7:
  v11 = *(void **)(a1 + 32);
  if (v11[6])
  {
    v12 = objc_msgSend(v11, "valuesFromForecast:forInterval:", *(double *)(a1 + 48));
    v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Relavant forecast is  %@", (uint8_t *)&v18, 0xCu);
    }
    if ([*(id *)(a1 + 32) enoughVariationForForecast:v12])
    {
      char v14 = 1;
    }
    else
    {
      uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      char v14 = 0;
      if (v17)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast. Not engaging", (uint8_t *)&v18, 2u);
        char v14 = 0;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
  }
  else
  {
    v15 = v11[4];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "Empty forecast. Not engaging", (uint8_t *)&v18, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (id)cleanIntervalsStringFromDates:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_log_t v25 = os_log_create("com.apple.powerui.cec", "GridDataManager");
  v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    id v9 = 0;
    uint64_t v28 = *(void *)v31;
    unint64_t v10 = 0x263F08000uLL;
    do
    {
      uint64_t v11 = 0;
      int v26 = v8;
      uint64_t v27 = v8 + 1;
      v12 = v5;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        [v13 timeIntervalSinceDate:v12];
        if (v14 > 900.0 || v27 + v11 == [obj count])
        {
          v15 = [MEMORY[0x263F08790] localizedStringFromDate:v4 dateStyle:0 timeStyle:1];
          uint64_t v16 = (void *)MEMORY[0x263F08790];
          BOOL v17 = [MEMORY[0x263EFF910] dateWithTimeInterval:v12 sinceDate:900.0];
          int v18 = [v16 localizedStringFromDate:v17 dateStyle:0 timeStyle:1];

          uint64_t v19 = [*(id *)(v10 + 2880) stringWithFormat:@"%@-%@", v15, v18];
          uint64_t v20 = v19;
          if (v9)
          {
            uint64_t v21 = [*(id *)(v10 + 2880) stringWithFormat:@"%@, %@", v9, v19];

            id v9 = (id)v21;
          }
          else
          {
            id v9 = v19;
          }
          id v22 = v13;

          v4 = v22;
          unint64_t v10 = 0x263F08000;
        }
        id v5 = v13;

        ++v11;
        v12 = v5;
      }
      while (v7 != v11);
      int v8 = v7 + v26;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    id v9 = 0;
  }

  id v23 = v9;
  return v23;
}

- (BOOL)enoughVariationForForecast:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (void *)[a3 mutableCopy];
  [v4 sortUsingComparator:&__block_literal_global_13];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 doubleValue];
  double v7 = v6;
  int v8 = [v4 lastObject];
  [v8 doubleValue];
  double v10 = vabdd_f64(v7, v9);

  if (v10 < 75.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      v13 = [v4 objectAtIndexedSubscript:0];
      [v13 doubleValue];
      uint64_t v15 = v14;
      uint64_t v16 = [v4 lastObject];
      [v16 doubleValue];
      int v19 = 134218240;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast values (%lf - %lf)", (uint8_t *)&v19, 0x16u);
    }
  }

  return v10 >= 75.0;
}

uint64_t __56__PowerUICECGridDataManager_enoughVariationForForecast___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1) {
    return -1;
  }
  else {
    return 1;
  }
}

- (void)setupChargingTime:(double)a3 forPluggedInTime:(double)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  double v7 = [(_GDSEmissionForecast *)self->_currentForecast fetchDate];
  [v7 timeIntervalSinceNow];
  if (v8 < -self->_refetchPeriod)
  {

LABEL_4:
    id v10 = [(PowerUICECGridDataManager *)self fetchForecast];
    goto LABEL_5;
  }
  currentForecast = self->_currentForecast;

  if (!currentForecast) {
    goto LABEL_4;
  }
LABEL_5:
  if (!self->_currentForecast)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "No forecast available. Skipping", buf, 2u);
    }
  }
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v54 = a3 / 60.0;
    __int16 v55 = 2048;
    double v56 = a4 / 60.0;
    _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Figuring out cleanest %.02lf mins from %.02lf mins", buf, 0x16u);
  }
  v41 = [(PowerUICECGridDataManager *)self valuesFromForecast:self->_currentForecast forInterval:a4];
  uint64_t v13 = -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:](self, "thresholdFromForecast:forChargeTime:", a3);
  uint64_t v14 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = [(PowerUICECGridDataManager *)self forecastMapFrom:self->_currentForecast ofInterval:a4];
  uint64_t v16 = [v15 allKeys];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v47;
    double v20 = (double)v13;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v23 = [v15 objectForKeyedSubscript:v22];
        [v23 doubleValue];
        double v25 = v24;

        if (v25 <= v20) {
          [v14 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v18);
  }
  v39 = v16;
  v38 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
  v51 = v38;
  int v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  [v14 sortUsingDescriptors:v26];

  uint64_t v40 = v14;
  objc_storeStrong((id *)&self->_cleanIntervals, v14);
  uint64_t v27 = self->_log;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v27, OS_LOG_TYPE_DEFAULT, "Cleaner intervals:", buf, 2u);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v28 = self->_cleanIntervals;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = self->_log;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          uint64_t v35 = (void *)MEMORY[0x263F08790];
          objc_super v36 = v33;
          double v37 = [v35 localizedStringFromDate:v34 dateStyle:0 timeStyle:1];
          *(_DWORD *)buf = 138412290;
          double v54 = v37;
          _os_log_impl(&dword_22135E000, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v30);
  }

  [(NSUserDefaults *)self->_defaults setObject:self->_cleanIntervals forKey:@"cleanIntervals"];
}

- (unint64_t)thresholdFromForecast:(id)a3 forChargeTime:(double)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      double v8 = (void *)[v7 mutableCopy];
      double v9 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
      v31[0] = v9;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      [v8 sortUsingDescriptors:v10];

      unint64_t v11 = (unint64_t)(a4 / 900.0) + 1;
      if (v11 >= [v8 count]) {
        unint64_t v11 = [v8 count] - 1;
      }
      v12 = [v8 objectAtIndex:v11];
      unint64_t v13 = [v12 unsignedIntegerValue];
    }
    else
    {
      unint64_t v13 = 99999;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:](log, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    unint64_t v13 = 99999;
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  return v13;
}

- (BOOL)shouldChargeNow
{
  if (+[PowerUISmartChargeUtilities isInternalBuild]
    && self->_tChargeNow)
  {
    log = self->_log;
    BOOL v4 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Charge Now set", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(void *)buf = 0;
    double v9 = buf;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke;
    v7[3] = &unk_2645A6848;
    v7[4] = self;
    v7[5] = buf;
    dispatch_sync(queue, v7);
    BOOL v4 = v9[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

void __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "timeIntervalSinceNow", (void)v20);
          if (v8 < 0.0 && v8 > -900.0)
          {
            char v11 = *(NSObject **)(*(void *)(a1 + 32) + 32);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v25 = v7;
              _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Current time within clean window startin at %@", buf, 0xCu);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

            return;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    double v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Current time NOT in clean window intervals %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v12 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)fetchForecast
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(_GDSManager *)self->_gridManager latestMarginalEmissionForecast];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = log;
    id v6 = [v3 forecastMap];
    int v8 = 138412290;
    double v9 = v6;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Emission Forecast: %@", (uint8_t *)&v8, 0xCu);
  }
  objc_storeStrong((id *)&self->_currentForecast, v3);
  return v3;
}

- (id)valuesFromForecast:(id)a3 forInterval:(double)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 forecastMap];
  if ([v5 count])
  {
    double v6 = a4 / 900.0;
    if (a4 > 86400.0) {
      double v6 = 96.0;
    }
    unint64_t v7 = v6;
    int v8 = [MEMORY[0x263EFF980] array];
    double v9 = [v5 allKeys];
    uint64_t v10 = (void *)[v9 mutableCopy];

    char v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
    v19[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    [v10 sortUsingDescriptors:v12];

    unint64_t v13 = [v10 count];
    if (v13 >= v7) {
      unint64_t v14 = v7;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = [v10 objectAtIndexedSubscript:i];
        uint64_t v17 = [v5 objectForKeyedSubscript:v16];

        [v8 addObject:v17];
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)forecastMapFrom:(id)a3 ofInterval:(double)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 forecastMap];
  if ([v5 count])
  {
    double v6 = a4 / 900.0;
    if (a4 > 86400.0) {
      double v6 = 96.0;
    }
    uint64_t v7 = v6;
    int v8 = [MEMORY[0x263EFF9A0] dictionary];
    double v9 = [v5 allKeys];
    uint64_t v10 = (void *)[v9 mutableCopy];

    char v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
    v18[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [v10 sortUsingDescriptors:v12];

    if (v7)
    {
      for (unint64_t i = 0; i != v7; ++i)
      {
        if ([v10 count] <= i) {
          break;
        }
        unint64_t v14 = [v10 objectAtIndexedSubscript:i];
        uint64_t v15 = [v5 objectForKeyedSubscript:v14];
        uint64_t v16 = [v10 objectAtIndexedSubscript:i];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)resetState
{
  currentForecast = self->_currentForecast;
  self->_currentForecast = 0;

  cleanIntervals = self->_cleanIntervals;
  self->_cleanIntervals = 0;

  defaults = self->_defaults;
  [(NSUserDefaults *)defaults removeObjectForKey:@"cleanIntervals"];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (double)refetchPeriod
{
  return self->_refetchPeriod;
}

- (void)setRefetchPeriod:(double)a3
{
  self->_refetchPeriod = a3;
}

- (BOOL)tSavingOpportunity
{
  return self->_tSavingOpportunity;
}

- (void)setTSavingOpportunity:(BOOL)a3
{
  self->_tSavingOpportunity = a3;
}

- (BOOL)tChargeNow
{
  return self->_tChargeNow;
}

- (void)setTChargeNow:(BOOL)a3
{
  self->_tChargeNow = a3;
}

- (_GDSEmissionForecast)currentForecast
{
  return self->_currentForecast;
}

- (void)setCurrentForecast:(id)a3
{
}

- (_GDSManager)gridManager
{
  return self->_gridManager;
}

- (void)setGridManager:(id)a3
{
}

- (NSMutableArray)cleanIntervals
{
  return self->_cleanIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanIntervals, 0);
  objc_storeStrong((id *)&self->_gridManager, 0);
  objc_storeStrong((id *)&self->_currentForecast, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)thresholdFromForecast:(uint64_t)a3 forChargeTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)thresholdFromForecast:(uint64_t)a3 forChargeTime:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end