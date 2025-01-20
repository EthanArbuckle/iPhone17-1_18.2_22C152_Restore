@interface PGGraphDateNodeCollection
+ (Class)nodeClass;
+ (id)dateNodesForLocalDates:(id)a3 inGraph:(id)a4;
- (NSArray)dateNames;
- (NSDateInterval)localDateInterval;
- (PGGraphDayNodeCollection)dayNodes;
- (PGGraphHolidayNodeCollection)holidayNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphMonthDayNodeCollection)monthDayNodes;
- (PGGraphMonthNodeCollection)monthNodes;
- (PGGraphSeasonNodeCollection)seasonNodes;
- (PGGraphWeekOfMonthNodeCollection)weekOfMonthNodes;
- (PGGraphWeekOfYearNodeCollection)weekOfYearNodes;
- (PGGraphYearNodeCollection)yearNodes;
@end

@implementation PGGraphDateNodeCollection

- (NSArray)dateNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphDateNodeCollection_dateNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSArray *)v4;
}

uint64_t __38__PGGraphDateNodeCollection_dateNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSDateInterval)localDateInterval
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(MAElementCollection *)self array];
  if ([v2 count])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        v10 = v4;
        v11 = v3;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "localDate", (void)v15);
          id v3 = [v11 earlierDate:v12];

          id v4 = [v10 laterDate:v12];

          ++v9;
          v10 = v4;
          v11 = v3;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
  }
  else
  {
    v13 = 0;
  }

  return (NSDateInterval *)v13;
}

- (PGGraphHolidayNodeCollection)holidayNodes
{
  id v3 = +[PGGraphDateNode holidayOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHolidayNodeCollection *)v4;
}

- (PGGraphSeasonNodeCollection)seasonNodes
{
  id v3 = +[PGGraphDateNode seasonOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphSeasonNodeCollection *)v4;
}

- (PGGraphWeekOfMonthNodeCollection)weekOfMonthNodes
{
  id v3 = +[PGGraphDateNode weekOfMonthOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphWeekOfMonthNodeCollection *)v4;
}

- (PGGraphWeekOfYearNodeCollection)weekOfYearNodes
{
  id v3 = +[PGGraphDateNode weekOfYearOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphWeekOfYearNodeCollection *)v4;
}

- (PGGraphDayNodeCollection)dayNodes
{
  id v3 = +[PGGraphDateNode dayOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphDayNodeCollection *)v4;
}

- (PGGraphMonthNodeCollection)monthNodes
{
  id v3 = +[PGGraphDateNode monthOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMonthNodeCollection *)v4;
}

- (PGGraphMonthDayNodeCollection)monthDayNodes
{
  id v3 = +[PGGraphDateNode monthDayOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMonthDayNodeCollection *)v4;
}

- (PGGraphYearNodeCollection)yearNodes
{
  id v3 = +[PGGraphDateNode yearOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphYearNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphDateNode momentOfDate];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)dateNodesForLocalDates:(id)a3 inGraph:(id)a4
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
        v13 = objc_msgSend(v6, "dateNodeNameWithLocalDate:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v14 = +[PGGraphDateNode filterWithDateNames:v7];
  long long v15 = +[MANodeCollection nodesMatchingFilter:v14 inGraph:v6];

  return v15;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end