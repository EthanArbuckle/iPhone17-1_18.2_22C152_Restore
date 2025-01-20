@interface PGContextualOptions
- (NSDate)localToday;
- (NSDateComponents)localTodayComponents;
- (PGContextualOptions)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 options:(id)a6 loggingConnection:(id)a7;
- (id)availableContextualRules;
- (void)setLocalToday:(id)a3;
- (void)setLocalTodayComponents:(id)a3;
@end

@implementation PGContextualOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTodayComponents, 0);
  objc_storeStrong((id *)&self->_localToday, 0);
  objc_storeStrong((id *)&self->_contextualRules, 0);
}

- (void)setLocalTodayComponents:(id)a3
{
}

- (NSDateComponents)localTodayComponents
{
  return self->_localTodayComponents;
}

- (void)setLocalToday:(id)a3
{
}

- (NSDate)localToday
{
  return self->_localToday;
}

- (id)availableContextualRules
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_contextualRules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "canProvideContextualKeyAssetsWithOptions:", self, (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (PGContextualOptions)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 options:(id)a6 loggingConnection:(id)a7
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PGContextualOptions;
  v17 = [(PGContextualOptions *)&v34 init];
  if (v17)
  {
    v18 = [[PGBirthdayContextualRule alloc] initWithGraph:v12 photoLibrary:v13 curationManager:v14 loggingConnection:v16];
    v35[0] = v18;
    v19 = [[PGHolidayContextualRule alloc] initWithGraph:v12 photoLibrary:v13 loggingConnection:v16];
    v35[1] = v19;
    v20 = [[PGPublicEventContextualRule alloc] initWithGraph:v12 photoLibrary:v13 loggingConnection:v16];
    v35[2] = v20;
    v21 = objc_alloc_init(PGOnThisDayContextualRule);
    v35[3] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    contextualRules = v17->_contextualRules;
    v17->_contextualRules = (NSArray *)v22;

    v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v25 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8AEA8]];
    if (v25)
    {
      objc_storeStrong((id *)&v17->_localToday, v25);
      v26 = [v24 timeZone];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F76C68] currentLocalDate];
      localToday = v17->_localToday;
      v17->_localToday = (NSDate *)v27;

      v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v17->_localToday];
      v26 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)v30];
    }
    uint64_t v31 = [v24 componentsInTimeZone:v26 fromDate:v17->_localToday];
    localTodayComponents = v17->_localTodayComponents;
    v17->_localTodayComponents = (NSDateComponents *)v31;
  }
  return v17;
}

@end