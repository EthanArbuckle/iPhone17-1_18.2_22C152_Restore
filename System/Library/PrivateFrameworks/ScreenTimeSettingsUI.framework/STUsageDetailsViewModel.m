@interface STUsageDetailsViewModel
+ (id)keyPathsForValuesAffectingHasUsageData;
+ (id)keyPathsForValuesAffectingSelectedUsageReport;
+ (void)_enumerateDayReportStartDatesWithStartOfWeek:(id)a3 ascending:(BOOL)a4 block:(id)a5;
+ (void)_enumerateWeeklyReportStartDatesWithReferenceDate:(id)a3 ascending:(BOOL)a4 block:(id)a5;
- (BOOL)hasAggregateUsageData;
- (BOOL)hasDeviceActivityData;
- (BOOL)hasUsageData;
- (BOOL)isLocalDevice;
- (NSArray)dayUsageReportByWeekdays;
- (NSArray)rawUsageItems;
- (NSArray)weekUsageReports;
- (NSDate)lastUpdatedDate;
- (NSString)selectedCoreDuetIdentifier;
- (NSString)selectedItemDisplayName;
- (STUsageDetailsViewModel)init;
- (STUsageReport)selectedDayUsageReport;
- (STUsageReport)selectedUsageReport;
- (STUsageReport)selectedWeekUsageReport;
- (unint64_t)_mostRecentAvailableWeekday;
- (unint64_t)selectedDay;
- (unint64_t)selectedWeek;
- (void)_mostRecentAvailableWeekday;
- (void)selectToday;
- (void)setDayUsageReportByWeekdays:(id)a3;
- (void)setHasAggregateUsageData:(BOOL)a3;
- (void)setHasDeviceActivityData:(BOOL)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLocalDevice:(BOOL)a3;
- (void)setRawUsageItems:(id)a3;
- (void)setSelectedCoreDuetIdentifier:(id)a3;
- (void)setSelectedDay:(unint64_t)a3;
- (void)setSelectedDayUsageReport:(id)a3;
- (void)setSelectedItemDisplayName:(id)a3;
- (void)setSelectedWeek:(unint64_t)a3;
- (void)setSelectedWeek:(unint64_t)a3 selectedDay:(unint64_t)a4;
- (void)setSelectedWeekUsageReport:(id)a3;
- (void)setWeekReportUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5;
- (void)setWeekUsageReports:(id)a3;
@end

@implementation STUsageDetailsViewModel

- (STUsageDetailsViewModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)STUsageDetailsViewModel;
  result = [(STUsageDetailsViewModel *)&v3 init];
  result->_selectedWeek = 0;
  result->_selectedDay = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)setSelectedWeek:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = [(STUsageDetailsViewModel *)self weekUsageReports];
  v6 = v5;
  if (v5 && [v5 count] <= a3)
  {
    v7 = +[STUILog usage];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      selectedItemDisplayName = self->_selectedItemDisplayName;
      int v15 = 138543874;
      v16 = selectedItemDisplayName;
      __int16 v17 = 2048;
      uint64_t v18 = [v6 count];
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_fault_impl(&dword_225B06000, v7, OS_LOG_TYPE_FAULT, "STUsageDetailsViewModel: selectedWeek out of range, will reset for device: %{public}@, week usage report count: %lu, selectedWeek: %lus", (uint8_t *)&v15, 0x20u);
    }

    a3 = 0;
  }
  unint64_t v8 = [(STUsageDetailsViewModel *)self selectedDay];
  unint64_t v9 = v8;
  if (!a3 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [(STUsageDetailsViewModel *)self dayUsageReportByWeekdays];
    v11 = [v10 objectAtIndexedSubscript:0];
    v12 = [NSNumber numberWithUnsignedInteger:v9];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13) {
      unint64_t v9 = [(STUsageDetailsViewModel *)self _mostRecentAvailableWeekday];
    }
  }
  [(STUsageDetailsViewModel *)self setSelectedWeek:a3 selectedDay:v9];
}

- (void)setSelectedDay:(unint64_t)a3
{
  unint64_t v5 = [(STUsageDetailsViewModel *)self selectedWeek];

  [(STUsageDetailsViewModel *)self setSelectedWeek:v5 selectedDay:a3];
}

- (void)selectToday
{
  unint64_t v3 = [(STUsageDetailsViewModel *)self _mostRecentAvailableWeekday];

  [(STUsageDetailsViewModel *)self setSelectedWeek:0 selectedDay:v3];
}

- (unint64_t)_mostRecentAvailableWeekday
{
  unint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = objc_opt_new();
  unint64_t v5 = [v3 component:512 fromDate:v4];
  v6 = [(STUsageDetailsViewModel *)self dayUsageReportByWeekdays];
  v7 = [v6 objectAtIndexedSubscript:0];

  if (v7)
  {
    unint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    unint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      v10 = [v3 dateByAddingUnit:16 value:-1 toDate:v4 options:512];
      unint64_t v5 = [v3 component:512 fromDate:v10];
      v11 = [NSNumber numberWithUnsignedInteger:v5];
      v12 = [v7 objectForKeyedSubscript:v11];

      if (!v12) {
        goto LABEL_5;
      }
    }
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v13 = +[STUILog usage];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[STUsageDetailsViewModel _mostRecentAvailableWeekday]();
    }

    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)setSelectedWeek:(unint64_t)a3 selectedDay:(unint64_t)a4
{
  self->_selectedWeek = a3;
  self->_selectedDay = a4;
  v7 = [(STUsageDetailsViewModel *)self weekUsageReports];
  unint64_t v8 = v7;
  if (v7)
  {
    unint64_t v9 = [v7 objectAtIndexedSubscript:a3];
    [(STUsageDetailsViewModel *)self setSelectedWeekUsageReport:v9];
  }
  v10 = [(STUsageDetailsViewModel *)self dayUsageReportByWeekdays];
  v11 = v10;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || !v10)
  {
    [(STUsageDetailsViewModel *)self setSelectedDayUsageReport:0];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__STUsageDetailsViewModel_setSelectedWeek_selectedDay___block_invoke;
    v12[3] = &unk_264768850;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    [v10 enumerateObjectsUsingBlock:v12];
  }
}

void __55__STUsageDetailsViewModel_setSelectedWeek_selectedDay___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 40) == a3)
  {
    v4 = NSNumber;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = a2;
    id v8 = [v4 numberWithUnsignedInteger:v5];
    v7 = [v6 objectForKeyedSubscript:v8];

    [*(id *)(a1 + 32) setSelectedDayUsageReport:v7];
  }
}

- (void)setWeekReportUsageItems:(id)a3 weekStartDate:(id)a4 lastUpdatedDate:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(STUsageDetailsViewModel *)self setRawUsageItems:v10];
  [(STUsageDetailsViewModel *)self setLastUpdatedDate:v8];
  v11 = [[STUsageReport alloc] initWithReportType:0 startDate:v9 lastUpdatedDate:v8 firstPickup:0 usageItems:v10];

  [(STUsageDetailsViewModel *)self setSelectedWeekUsageReport:v11];
  v13[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(STUsageDetailsViewModel *)self setWeekUsageReports:v12];
}

+ (id)keyPathsForValuesAffectingSelectedUsageReport
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"selectedWeekUsageReport", @"selectedDayUsageReport", 0);

  return v2;
}

- (STUsageReport)selectedUsageReport
{
  unint64_t v3 = [(STUsageDetailsViewModel *)self selectedDayUsageReport];
  if ([(STUsageDetailsViewModel *)self selectedDay] == 0x7FFFFFFFFFFFFFFFLL || v3)
  {
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(STUsageDetailsViewModel *)self selectedWeekUsageReport];
    }
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }

  return (STUsageReport *)v4;
}

+ (id)keyPathsForValuesAffectingHasUsageData
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"weekUsageReports", @"selectedWeekUsageReport", 0);

  return v2;
}

- (BOOL)hasUsageData
{
  unint64_t v3 = [(STUsageDetailsViewModel *)self selectedWeekUsageReport];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v15 = 0;
  [v3 totalScreenTime];
  if (v4 > 0.0)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v5 = [v3 appAndWebUsages];
    if ([v5 count])
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [v3 categoryUsages];
      BOOL v6 = [v7 count] != 0;
    }
  }
  BOOL v15 = v6;
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(STUsageDetailsViewModel *)self weekUsageReports];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__STUsageDetailsViewModel_hasUsageData__block_invoke;
    v11[3] = &unk_264768878;
    v11[4] = &v12;
    [v9 enumerateObjectsUsingBlock:v11];

    BOOL v8 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __39__STUsageDetailsViewModel_hasUsageData__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  [v14 totalScreenTime];
  if (v6 > 0.0)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
  }
  else
  {
    v7 = [v14 appAndWebUsages];
    if ([v7 count])
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = a1 + 32;
      *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
    }
    else
    {
      v11 = [v14 categoryUsages];
      BOOL v12 = [v11 count] != 0;
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v8 = a1 + 32;
      *(unsigned char *)(*(void *)(v13 + 8) + 24) = v12;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24)) {
    *a4 = 1;
  }
}

+ (void)_enumerateWeeklyReportStartDatesWithReferenceDate:(id)a3 ascending:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x263EFF8F0];
  id v9 = a3;
  uint64_t v10 = [v8 currentCalendar];
  uint64_t v11 = [v10 firstWeekday];
  BOOL v12 = [v10 startOfDayForDate:v9];

  if ([v10 component:512 fromDate:v12] == v11)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [v10 nextDateAfterDate:v12 matchingUnit:512 value:v11 options:260];
  }
  id v14 = v13;
  BOOL v15 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, 4);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__STUsageDetailsViewModel__enumerateWeeklyReportStartDatesWithReferenceDate_ascending_block___block_invoke;
  v20[3] = &unk_2647688A0;
  if (v5) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 0;
  }
  id v21 = v10;
  id v22 = v14;
  id v23 = v7;
  id v17 = v7;
  id v18 = v14;
  id v19 = v10;
  [v15 enumerateIndexesWithOptions:v16 usingBlock:v20];
}

void __93__STUsageDetailsViewModel__enumerateWeeklyReportStartDatesWithReferenceDate_ascending_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) dateByAddingUnit:0x2000 value:-a2 toDate:*(void *)(a1 + 40) options:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)_enumerateDayReportStartDatesWithStartOfWeek:(id)a3 ascending:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v10 = [v9 firstWeekday];
  uint64_t v11 = [v9 maximumRangeOfUnit:512];
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__STUsageDetailsViewModel__enumerateDayReportStartDatesWithStartOfWeek_ascending_block___block_invoke;
  v18[3] = &unk_2647688C8;
  if (v6) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 2;
  }
  id v19 = v7;
  id v20 = v9;
  id v21 = v8;
  uint64_t v22 = v10;
  id v15 = v8;
  id v16 = v9;
  id v17 = v7;
  [v13 enumerateIndexesWithOptions:v14 usingBlock:v18];
}

void __88__STUsageDetailsViewModel__enumerateDayReportStartDatesWithStartOfWeek_ascending_block___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 56) == a2)
  {
    id v3 = *(id *)(a1 + 32);
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) nextDateAfterDate:*(void *)(a1 + 32) matchingUnit:512 value:a2 options:256];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (unint64_t)selectedWeek
{
  return self->_selectedWeek;
}

- (STUsageReport)selectedWeekUsageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelectedWeekUsageReport:(id)a3
{
}

- (NSArray)weekUsageReports
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWeekUsageReports:(id)a3
{
}

- (unint64_t)selectedDay
{
  return self->_selectedDay;
}

- (STUsageReport)selectedDayUsageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSelectedDayUsageReport:(id)a3
{
}

- (NSArray)dayUsageReportByWeekdays
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDayUsageReportByWeekdays:(id)a3
{
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (NSString)selectedItemDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelectedItemDisplayName:(id)a3
{
}

- (NSString)selectedCoreDuetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelectedCoreDuetIdentifier:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (BOOL)hasDeviceActivityData
{
  return self->_hasDeviceActivityData;
}

- (void)setHasDeviceActivityData:(BOOL)a3
{
  self->_hasDeviceActivityData = a3;
}

- (BOOL)hasAggregateUsageData
{
  return self->_hasAggregateUsageData;
}

- (void)setHasAggregateUsageData:(BOOL)a3
{
  self->_hasAggregateUsageData = a3;
}

- (NSArray)rawUsageItems
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRawUsageItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawUsageItems, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_selectedCoreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedItemDisplayName, 0);
  objc_storeStrong((id *)&self->_dayUsageReportByWeekdays, 0);
  objc_storeStrong((id *)&self->_selectedDayUsageReport, 0);
  objc_storeStrong((id *)&self->_weekUsageReports, 0);

  objc_storeStrong((id *)&self->_selectedWeekUsageReport, 0);
}

- (void)_mostRecentAvailableWeekday
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, v0, OS_LOG_TYPE_FAULT, "Usage data has been loaded with no daily reports for today or yesterday: %{public}@", v1, 0xCu);
}

@end