@interface PowerUIBatteryData
+ (id)batteryLevelByTimeSlot:(unint64_t)a3 dayType:(unint64_t)a4;
+ (id)log;
+ (id)sharedInstance;
- (NSMutableDictionary)dateToWeekdayMedian;
- (NSMutableDictionary)dateToWeekendMedian;
- (NSMutableDictionary)yesterdayReference;
- (PowerUIBatteryData)init;
- (id)medianBatteryLevelByTimeSlot:(unint64_t)a3 dayType:(unint64_t)a4;
- (id)midnightDateFrom:(id)a3;
- (void)setDateToWeekdayMedian:(id)a3;
- (void)setDateToWeekendMedian:(id)a3;
- (void)setYesterdayReference:(id)a3;
@end

@implementation PowerUIBatteryData

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PowerUIBatteryData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __36__PowerUIBatteryData_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PowerUIBatteryData)init
{
  v10.receiver = self;
  v10.super_class = (Class)PowerUIBatteryData;
  v2 = [(PowerUIBatteryData *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    dateToWeekdayMedian = v2->_dateToWeekdayMedian;
    v2->_dateToWeekdayMedian = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    dateToWeekendMedian = v2->_dateToWeekendMedian;
    v2->_dateToWeekendMedian = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    yesterdayReference = v2->_yesterdayReference;
    v2->_yesterdayReference = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (id)log
{
  v2 = (void *)log_log_0;
  if (!log_log_0)
  {
    os_log_t v3 = os_log_create("com.apple.powerui", "batteryData");
    v4 = (void *)log_log_0;
    log_log_0 = (uint64_t)v3;

    v2 = (void *)log_log_0;
  }
  return v2;
}

- (id)medianBatteryLevelByTimeSlot:(unint64_t)a3 dayType:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  v9 = v8;
  if (a4 == 2)
  {
    uint64_t v11 = 16;
    objc_super v10 = [v8 dateBySettingUnit:16 value:2 ofDate:v7 options:4];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    objc_super v10 = [(PowerUIBatteryData *)self midnightDateFrom:v7];
    uint64_t v11 = 8;
LABEL_5:
    id v12 = *(id *)((char *)&self->super.isa + v11);
    goto LABEL_7;
  }
  objc_super v10 = 0;
  id v12 = 0;
LABEL_7:
  v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    v14 = [v12 objectForKeyedSubscript:v10];
  }
  else
  {
    v15 = +[PowerUIBatteryData batteryLevelByTimeSlot:a3 dayType:a4];
    v14 = [MEMORY[0x263EFF980] array];
    if ([v15 count])
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v15 objectAtIndexedSubscript:v16];
        v18 = NSNumber;
        [v17 percentile:0.5];
        v19 = objc_msgSend(v18, "numberWithDouble:");
        [v14 setObject:v19 atIndexedSubscript:v16];

        ++v16;
      }
      while ([v15 count] > v16);
    }
    if ([v14 count])
    {
      uint64_t v20 = 0;
      while (1)
      {
        v21 = [v14 objectAtIndexedSubscript:v20];
        uint64_t v22 = [v21 integerValue];

        if (v22) {
          break;
        }
        if ([v14 count] <= (unint64_t)++v20) {
          goto LABEL_18;
        }
      }
      v23 = (void *)[v14 copy];
      [v12 setObject:v23 forKeyedSubscript:v10];
    }
LABEL_18:
  }
  return v14;
}

- (id)midnightDateFrom:(id)a3
{
  os_log_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  v6 = [v5 components:540 fromDate:v4];

  uint64_t v7 = [v5 dateFromComponents:v6];

  return v7;
}

+ (id)batteryLevelByTimeSlot:(unint64_t)a3 dayType:(unint64_t)a4
{
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  id v42 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  if (a3 <= 0x5A0)
  {
    if (0x5A0 / a3 <= 1) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = 0x5A0 / a3;
    }
    do
    {
      v9 = [MEMORY[0x263EFF980] array];
      [(id)v38[5] addObject:v9];

      --v8;
    }
    while (v8);
  }
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__4;
  v35[4] = __Block_byref_object_dispose__4;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__4;
  v33[4] = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x263EFF980], "array", v7);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = -1;
  objc_super v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v11 = BiomeLibrary();
  id v12 = [v11 Device];
  v13 = [v12 Power];
  v14 = [v13 BatteryLevel];
  v15 = [v14 publisher];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke;
  v31[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v31[4] = a1;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10;
  v21[3] = &unk_2645A6670;
  id v27 = a1;
  id v16 = v10;
  id v22 = v16;
  v23 = v35;
  v24 = v33;
  v25 = v32;
  unint64_t v28 = a4;
  unint64_t v29 = a3;
  v26 = &v37;
  unint64_t v30 = 0x5A0 / a3;
  id v17 = (id)[v15 sinkWithCompletion:v31 receiveInput:v21];

  id v18 = (id)v38[5];
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_cold_1(v3);
    }
  }
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = [v4 eventBody];
  [v5 batteryPercentage];
  uint64_t v7 = (uint64_t)v6;

  if ((unint64_t)v7 < 0x65)
  {
    v9 = (void *)MEMORY[0x263EFF910];
    [v4 timestamp];
    unint64_t v8 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    objc_super v10 = [*(id *)(a1 + 32) components:540 fromDate:v8];
    if (!*(void *)(a1 + 80)) {
      goto LABEL_8;
    }
    BOOL v11 = +[PowerUISmartChargeUtilities isWeekend:v8];
    uint64_t v12 = 1;
    if (!v11) {
      uint64_t v12 = 2;
    }
    if (*(void *)(a1 + 80) != v12)
    {
LABEL_8:
      v13 = [*(id *)(a1 + 32) dateFromComponents:v10];
      [v8 timeIntervalSinceDate:v13];
      unint64_t v15 = (unint64_t)(v14 / (double)(unint64_t)(60 * *(void *)(a1 + 88)));
      id v16 = [*(id *)(a1 + 72) log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_3();
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        v45 = v13;
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != v15)
        {
          id v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v17)
          {
            id v18 = objc_msgSend(v17, "objectAtIndexedSubscript:");

            if (!v18)
            {
              v19 = [MEMORY[0x263EFF980] array];
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v19 atIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
            }
          }
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) median];
          unint64_t v21 = (unint64_t)v20;
          id v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
          v23 = [NSNumber numberWithUnsignedInteger:v21];
          [v22 addObject:v23];

          v24 = [*(id *)(a1 + 72) log];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_2();
          }

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
          unint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          unint64_t v26 = v15 - v25;
          if (v15 < v25) {
            v26 += *(void *)(a1 + 96);
          }
          if (v26 != 1)
          {
            id v27 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
            [v27 batteryPercentage];
            double v29 = v28;

            unint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1;
            if (v31 < v15)
            {
              double v32 = ((double)v7 - v29) / (double)v26;
              *(void *)&long long v30 = 134218240;
              long long v44 = v30;
              do
              {
                unint64_t v33 = v31 % *(void *)(a1 + 96);
                id v34 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                if (v34)
                {
                  v35 = [v34 objectAtIndexedSubscript:v33];

                  if (!v35)
                  {
                    id v36 = [MEMORY[0x263EFF980] array];
                    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v36 atIndexedSubscript:v33];
                  }
                }
                uint64_t v37 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", v33, v44);
                v38 = [NSNumber numberWithUnsignedInteger:(unint64_t)v29];
                [v37 addObject:v38];

                uint64_t v39 = [*(id *)(a1 + 72) log];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v44;
                  unint64_t v47 = v15;
                  __int16 v48 = 2048;
                  uint64_t v49 = v7;
                  _os_log_debug_impl(&dword_22135E000, v39, OS_LOG_TYPE_DEBUG, "Added Slot %ld, battery level %ld", buf, 0x16u);
                }

                double v29 = v32 + v29;
                ++v31;
              }
              while (v15 != v31);
            }
          }
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
        v40 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v41 = [NSNumber numberWithInteger:v7];
        [v40 addObject:v41];

        v13 = v45;
      }
      else
      {
        id v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v43 = [NSNumber numberWithInteger:v7];
        [v42 addObject:v43];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
      }
    }
  }
  else
  {
    unint64_t v8 = [*(id *)(a1 + 72) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_1(v7);
    }
  }
}

- (NSMutableDictionary)dateToWeekdayMedian
{
  return self->_dateToWeekdayMedian;
}

- (void)setDateToWeekdayMedian:(id)a3
{
}

- (NSMutableDictionary)dateToWeekendMedian
{
  return self->_dateToWeekendMedian;
}

- (void)setDateToWeekendMedian:(id)a3
{
}

- (NSMutableDictionary)yesterdayReference
{
  return self->_yesterdayReference;
}

- (void)setYesterdayReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yesterdayReference, 0);
  objc_storeStrong((id *)&self->_dateToWeekendMedian, 0);
  objc_storeStrong((id *)&self->_dateToWeekdayMedian, 0);
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting battery stream in batteryLevelDurations: %s", v5, v6, v7, v8, 2u);
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_1(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v2, v3, "Skipping battery level %@", v4, v5, v6, v7, 2u);
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_2()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_1(&dword_22135E000, v0, v1, "Added Slot %ld, battery level %ld", v2, v3);
}

void __53__PowerUIBatteryData_batteryLevelByTimeSlot_dayType___block_invoke_10_cold_3()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_1(&dword_22135E000, v0, v1, "Slot %ld, battery level %ld", v2, v3);
}

@end