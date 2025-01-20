@interface PGGraphHolidayMetricEvent
+ (id)celebratedHolidayMetricEventsWithGraphManager:(id)a3;
- (BOOL)shouldReportMetrics;
- (NSString)holidayName;
- (PGGraphHolidayMetricEvent)initWithHolidayName:(id)a3 numberOfCelebrations:(unint64_t)a4;
- (id)identifier;
- (id)payload;
- (unint64_t)numberOfCelebrations;
- (void)setHolidayName:(id)a3;
- (void)setNumberOfCelebrations:(unint64_t)a3;
@end

@implementation PGGraphHolidayMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayName, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)setNumberOfCelebrations:(unint64_t)a3
{
  self->_numberOfCelebrations = a3;
}

- (unint64_t)numberOfCelebrations
{
  return self->_numberOfCelebrations;
}

- (void)setHolidayName:(id)a3
{
}

- (NSString)holidayName
{
  return self->_holidayName;
}

- (id)payload
{
  v7[2] = *MEMORY[0x1E4F143B8];
  holidayName = self->_holidayName;
  v6[0] = @"holiday";
  v6[1] = @"numberOfCelebrations";
  v7[0] = holidayName;
  v3 = [NSNumber numberWithUnsignedInteger:self->_numberOfCelebrations];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.Graph.CelebratedHoliday";
}

- (PGGraphHolidayMetricEvent)initWithHolidayName:(id)a3 numberOfCelebrations:(unint64_t)a4
{
  v6 = (__CFString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphHolidayMetricEvent;
  v7 = [(PGGraphHolidayMetricEvent *)&v10 init];
  if (v7)
  {
    if ([(__CFString *)v6 length]) {
      v8 = v6;
    }
    else {
      v8 = &stru_1F283BC78;
    }
    objc_storeStrong((id *)&v7->_holidayName, v8);
    v7->_numberOfCelebrations = a4;
  }

  return v7;
}

+ (id)celebratedHolidayMetricEventsWithGraphManager:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 isReady])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke;
    v6[3] = &unk_1E68F0848;
    id v7 = v4;
    [v3 performSynchronousConcurrentGraphReadUsingBlock:v6];
  }
  return v4;
}

void __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F28BD0] set];
  v5 = [v3 graph];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke_2;
  v17[3] = &unk_1E68EF038;
  id v6 = v4;
  id v18 = v6;
  [v5 enumerateCelebratedHolidayNodesUsingBlock:v17];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PGGraphHolidayMetricEvent initWithHolidayName:numberOfCelebrations:]([PGGraphHolidayMetricEvent alloc], "initWithHolidayName:numberOfCelebrations:", *(void *)(*((void *)&v13 + 1) + 8 * v11), objc_msgSend(v7, "countForObject:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13));
        if (v12) {
          [*(id *)(a1 + 32) addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v9);
  }
}

void __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end