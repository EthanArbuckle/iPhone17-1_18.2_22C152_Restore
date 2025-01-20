@interface PGMemoryTrigger
+ (id)dateNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7;
+ (id)localDateIntervalFromLocalDate:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 inTimeZone:(id)a6;
+ (id)memoryTriggerResultsForMemoryNodes:(id)a3 withValidityInterval:(id)a4;
+ (id)memoryTriggerResultsForMemoryNodesArray:(id)a3 withValidityInterval:(id)a4;
+ (id)monthDayCalendarUnitValuesForLocalDateInterval:(id)a3;
+ (id)monthDayNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7;
+ (id)singleDayValidityIntervalWithContext:(id)a3;
+ (id)stringFromTriggerType:(unint64_t)a3;
+ (id)validityIntervalForLocalStartDate:(id)a3 localEndDate:(id)a4 timeZone:(id)a5;
+ (unint64_t)triggerTypeFromString:(id)a3;
- (BOOL)supportsFutureLookup;
- (OS_os_log)loggingConnection;
- (PGMemoryTrigger)init;
- (PGMemoryTrigger)initWithLoggingConnection:(id)a3;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTrigger

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  id v5 = a3;
  PGAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  PGAbstractMethodException(self, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (unint64_t)triggerType
{
  PGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)supportsFutureLookup
{
  return 1;
}

- (PGMemoryTrigger)initWithLoggingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMemoryTrigger;
  id v6 = [(PGMemoryTrigger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_loggingConnection, a3);
  }

  return v7;
}

- (PGMemoryTrigger)init
{
  v3 = +[PGLogging sharedLogging];
  v4 = [v3 loggingConnection];
  id v5 = [(PGMemoryTrigger *)self initWithLoggingConnection:v4];

  return v5;
}

+ (id)monthDayNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7
{
  id v12 = a3;
  v13 = [a1 localDateIntervalFromLocalDate:a6 startDayOffset:a4 endDayOffset:a5 inTimeZone:a7];
  v14 = [a1 monthDayCalendarUnitValuesForLocalDateInterval:v13];
  v15 = +[PGGraphCalendarUnitNodeCollection calendarUnitNodesForUnitValues:v14 inGraph:v12];

  return v15;
}

+ (id)monthDayCalendarUnitValuesForLocalDateInterval:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 startDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  v8 = [v3 endDate];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  while (v7 <= v10)
  {
    id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
    id v12 = [MEMORY[0x1E4F76C68] dateComponentsWithLocalDate:v11];
    int64_t v13 = +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", [v12 month], objc_msgSend(v12, "day"));
    v14 = [NSNumber numberWithInteger:v13];
    [v4 addObject:v14];

    double v7 = v7 + 86400.0;
  }

  return v4;
}

+ (id)dateNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7
{
  id v12 = a3;
  int64_t v13 = [a1 localDateIntervalFromLocalDate:a6 startDayOffset:a4 endDayOffset:a5 inTimeZone:a7];
  v14 = [v12 dateNodesForLocalDateInterval:v13];

  return v14;
}

+ (id)localDateIntervalFromLocalDate:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 inTimeZone:(id)a6
{
  double v9 = (void *)MEMORY[0x1E4F76C68];
  id v10 = a6;
  id v11 = [v9 universalDateFromLocalDate:a3 inTimeZone:v10];
  id v12 = [MEMORY[0x1E4F76C68] dateByAddingDays:a4 toDate:v11];
  int64_t v13 = [MEMORY[0x1E4F76C68] dateByAddingDays:a5 toDate:v11];
  v14 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v12 inTimeZone:v10];
  v15 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v13 inTimeZone:v10];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
  return v16;
}

+ (id)stringFromTriggerType:(unint64_t)a3
{
  if (a3 - 1 > 0x1A) {
    return @"PGMemoryTriggerTypeUnknown";
  }
  else {
    return off_1E68E4910[a3 - 1];
  }
}

+ (unint64_t)triggerTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PGMemoryTriggerTypeHoliday"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypePersonBirthday"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeFeatureCentricHoliday"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeSameDayInHistory"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeEndOfYear"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeBeginningOfMonth"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeSameWeekInHistory"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeBeginningOfSeason"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeSeasonInHistory"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentMomentWithPerson"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeThrowbackWeekInHistory"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentHolidayCelebration"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentMomentWithSocialGroup"])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentTrip"])
  {
    unint64_t v4 = 14;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypePersonAnniversary"])
  {
    unint64_t v4 = 15;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentHighlights"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentSyndicatedAssets"])
  {
    unint64_t v4 = 18;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeUpcomingHoliday"])
  {
    unint64_t v4 = 17;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentMeaningfulEvent"])
  {
    unint64_t v4 = 19;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeUpcomingCalendarEvent"])
  {
    unint64_t v4 = 26;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeLastWeekend"])
  {
    unint64_t v4 = 20;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeLastWeek"])
  {
    unint64_t v4 = 21;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentBreakoutOfRoutine"])
  {
    unint64_t v4 = 22;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeUpcomingPersonCentricHoliday"])
  {
    unint64_t v4 = 23;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeUpcomingBirthday"])
  {
    unint64_t v4 = 24;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeUpcomingAnniversary"])
  {
    unint64_t v4 = 25;
  }
  else if ([v3 isEqualToString:@"PGMemoryTriggerTypeRecentTrendsMoment"])
  {
    unint64_t v4 = 27;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)memoryTriggerResultsForMemoryNodesArray:(id)a3 withValidityInterval:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [PGMemoryTriggerResult alloc];
        v15 = -[PGMemoryTriggerResult initWithMemoryNode:validityInterval:](v14, "initWithMemoryNode:validityInterval:", v13, v6, (void)v17);
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)memoryTriggerResultsForMemoryNodes:(id)a3 withValidityInterval:(id)a4
{
  id v6 = a4;
  id v7 = [a3 array];
  id v8 = [a1 memoryTriggerResultsForMemoryNodesArray:v7 withValidityInterval:v6];

  return v8;
}

+ (id)singleDayValidityIntervalWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localDate];
  id v6 = [MEMORY[0x1E4F76C68] startOfDayForDate:v5];
  id v7 = [MEMORY[0x1E4F76C68] endOfDayForDate:v5];
  id v8 = [v4 timeZone];

  uint64_t v9 = [a1 validityIntervalForLocalStartDate:v6 localEndDate:v7 timeZone:v8];

  return v9;
}

+ (id)validityIntervalForLocalStartDate:(id)a3 localEndDate:(id)a4 timeZone:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[PGMemoryDate alloc] initWithLocalDate:v9];

  uint64_t v11 = [(PGMemoryDate *)v10 universalDateInTimeZone:v7];
  id v12 = [[PGMemoryDate alloc] initWithLocalDate:v8];

  uint64_t v13 = [(PGMemoryDate *)v12 universalDateInTimeZone:v7];

  v14 = [v13 laterDate:v11];
  int v15 = [v14 isEqualToDate:v11];

  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v19 = 138412546;
      long long v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[PGMemoryTrigger] Start date %@ cannot be later in time than end date %@. Setting universalEndDate = universalStartDate", (uint8_t *)&v19, 0x16u);
    }
    id v16 = v11;

    uint64_t v13 = v16;
  }
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v13];

  return v17;
}

@end