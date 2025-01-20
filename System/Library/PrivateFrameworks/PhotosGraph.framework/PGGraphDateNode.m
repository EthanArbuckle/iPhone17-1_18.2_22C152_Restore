@interface PGGraphDateNode
+ (MARelation)dayOfWeekOfDate;
+ (MARelation)momentOfDate;
+ (MARelation)monthDayOfDate;
+ (MARelation)seasonOfDate;
+ (MARelation)yearOfDate;
+ (id)dateNodeForDayNode:(id)a3 monthNode:(id)a4 yearNode:(id)a5;
+ (id)dayOfDate;
+ (id)filter;
+ (id)filterWithDateNames:(id)a3;
+ (id)holidayOfDate;
+ (id)monthOfDate;
+ (id)weekOfMonthOfDate;
+ (id)weekOfYearOfDate;
- (BOOL)hasProperties:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSString)name;
- (PGGraphCalendarUnitNode)dayNode;
- (PGGraphCalendarUnitNode)monthDayNode;
- (PGGraphCalendarUnitNode)monthNode;
- (PGGraphCalendarUnitNode)weekOfMonthNode;
- (PGGraphCalendarUnitNode)weekOfYearNode;
- (PGGraphCalendarUnitNode)yearNode;
- (PGGraphDateNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphDateNode)initWithName:(id)a3;
- (PGGraphDateNodeCollection)collection;
- (PGGraphSeasonNode)seasonNode;
- (id)associatedNodesForRemoval;
- (id)description;
- (id)label;
- (id)lastWeekDateNodes;
- (id)localDate;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)sameWeekDateNodes;
- (int64_t)day;
- (int64_t)month;
- (int64_t)monthDay;
- (int64_t)year;
- (unsigned)domain;
- (void)enumerateHolidayEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateHolidayNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
@end

@implementation PGGraphDateNode

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke;
  v14[3] = &unk_1E68EF038;
  id v4 = v3;
  id v15 = v4;
  [(PGGraphDateNode *)self enumerateHolidayNodesUsingBlock:v14];
  v5 = [(PGGraphDateNode *)self seasonNode];
  uint64_t v6 = [v5 edgesCount];

  if (v6 == 1)
  {
    v7 = [(PGGraphDateNode *)self seasonNode];
    [v4 addObject:v7];
  }
  if (associatedNodesForRemoval_onceToken != -1) {
    dispatch_once(&associatedNodesForRemoval_onceToken, &__block_literal_global_49126);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_3;
  v12[3] = &unk_1E68F1B78;
  id v8 = v4;
  id v13 = v8;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v12];
  v9 = v13;
  id v10 = v8;

  return v10;
}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 countOfEdgesWithLabel:@"HOLIDAY" domain:401] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 domain] == 400)
  {
    uint64_t v6 = (void *)associatedNodesForRemoval_sDateEdgeLabels;
    v7 = [v8 label];
    LODWORD(v6) = [v6 containsObject:v7];

    if (v6)
    {
      if ([v5 edgesCount] == 1) {
        [*(id *)(a1 + 32) addObject:v5];
      }
    }
  }
}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"YEAR", @"MONTH", @"WEEKMONTH", @"DAY", @"WEEKYEAR", 0);
  v1 = (void *)associatedNodesForRemoval_sDateEdgeLabels;
  associatedNodesForRemoval_sDateEdgeLabels = v0;
}

- (id)lastWeekDateNodes
{
  id v3 = (void *)MEMORY[0x1E4F76C68];
  id v4 = [(PGGraphDateNode *)self localDate];
  id v5 = [v3 dateByAddingWeeksOfYear:-1 toDate:v4];

  uint64_t v6 = [MEMORY[0x1E4F76C68] components:25088 fromDate:v5];
  [v6 setWeekday:1];
  v7 = (void *)MEMORY[0x1E4F76C68];
  id v8 = [MEMORY[0x1E4F76C68] dateFromComponents:v6 inTimeZone:0];
  uint64_t v9 = [v7 yearFromDate:v8];

  if ([v6 weekOfYear] < 2 || (uint64_t v10 = v9, objc_msgSend(v6, "weekOfYear") >= 52))
  {
    [v6 setWeekday:7];
    v11 = (void *)MEMORY[0x1E4F76C68];
    v12 = [MEMORY[0x1E4F76C68] dateFromComponents:v6 inTimeZone:0];
    uint64_t v10 = [v11 yearFromDate:v12];
  }
  id v13 = [(MANode *)self graph];
  if (v9 == v10)
  {
    v14 = (void *)MEMORY[0x1E4F1CA80];
    id v15 = objc_msgSend(v13, "dateNodesForWeekOfYear:", objc_msgSend(v6, "weekOfYear"));
    v16 = [v14 setWithSet:v15];

    v17 = [v13 dateNodesForYear:v9];
    [v16 intersectSet:v17];
  }
  else
  {
    v17 = objc_msgSend(v13, "dateNodesForWeekOfYear:", objc_msgSend(v6, "weekOfYear"));
    v16 = [MEMORY[0x1E4F1CA80] setWithSet:v17];
    v18 = [v13 dateNodesForYear:v9];
    [v16 intersectSet:v18];

    v19 = [v13 dateNodesForMonth:12];
    [v16 intersectSet:v19];

    v20 = [MEMORY[0x1E4F1CA80] setWithSet:v17];
    v21 = [v13 dateNodesForYear:v10];
    [v20 intersectSet:v21];

    v22 = [v13 dateNodesForMonth:1];
    [v20 intersectSet:v22];

    [v16 unionSet:v20];
  }

  return v16;
}

- (id)sameWeekDateNodes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(MANode *)self siblingNodesThroughEdgesWithLabel:@"WEEKYEAR" domain:400];
  id v4 = [MEMORY[0x1E4F1CA80] setWithSet:v3];
  id v5 = [(PGGraphDateNode *)self weekOfYearNode];
  uint64_t v6 = [v5 calendarUnitValue];
  if (v6 == 1 || v6 > 51)
  {
    uint64_t v9 = [(PGGraphDateNode *)self localDate];
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "localDate", (void)v19);
          [v9 timeIntervalSinceDate:v16];
          if (v17 < 0.0) {
            double v17 = -v17;
          }
          if (v17 <= 604800.0) {
            [v8 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v7 = [(MANode *)self siblingNodesThroughEdgesWithLabel:@"YEAR" domain:400];
    [v4 intersectSet:v7];

    id v8 = v4;
  }

  return v8;
}

- (id)localDate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGGraphDateNode *)self dayNode];
  id v4 = [(PGGraphDateNode *)self monthNode];
  uint64_t v5 = [(PGGraphDateNode *)self yearNode];
  uint64_t v6 = (void *)v5;
  if (v3 && v4 && v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    objc_msgSend(v7, "setDay:", objc_msgSend(v3, "calendarUnitValue"));
    objc_msgSend(v7, "setMonth:", objc_msgSend(v4, "calendarUnitValue"));
    objc_msgSend(v7, "setYear:", objc_msgSend(v6, "calendarUnitValue"));
    id v8 = [MEMORY[0x1E4F76C68] dateFromComponents:v7 inTimeZone:0];
  }
  else
  {
    uint64_t v9 = +[PGLogging sharedLogging];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [(PGGraphDateNode *)self description];
      int v13 = 138413058;
      v14 = v12;
      __int16 v15 = 2048;
      v16 = v3;
      __int16 v17 = 2048;
      v18 = v4;
      __int16 v19 = 2048;
      long long v20 = v6;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Cannot create localDate from DateNode \"%@\". dayNode %p, monthNode %p, yearNode %p", (uint8_t *)&v13, 0x2Au);
    }
    id v8 = 0;
  }

  return v8;
}

- (PGGraphSeasonNode)seasonNode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__49134;
  int v13 = __Block_byref_object_dispose__49135;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__PGGraphDateNode_seasonNode__block_invoke;
  v8[3] = &unk_1E68EAF10;
  v8[4] = &v9;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"SEASON" domain:400 usingBlock:v8];
  id v3 = (void *)v10[5];
  if (!v3)
  {
    id v4 = +[PGLogging sharedLogging];
    uint64_t v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Date Node %@ is not linked to any season node", buf, 0xCu);
    }

    id v3 = (void *)v10[5];
  }
  id v6 = v3;
  _Block_object_dispose(&v9, 8);

  return (PGGraphSeasonNode *)v6;
}

void __29__PGGraphDateNode_seasonNode__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateHolidayNodesUsingBlock:(id)a3
{
}

- (void)enumerateHolidayEdgesAndNodesUsingBlock:(id)a3
{
}

- (int64_t)day
{
  v2 = [(PGGraphDateNode *)self dayNode];
  int64_t v3 = [v2 calendarUnitValue];

  return v3;
}

- (int64_t)month
{
  v2 = [(PGGraphDateNode *)self monthNode];
  int64_t v3 = [v2 calendarUnitValue];

  return v3;
}

- (int64_t)monthDay
{
  v2 = [(PGGraphDateNode *)self monthDayNode];
  int64_t v3 = [v2 calendarUnitValue];

  return v3;
}

- (int64_t)year
{
  v2 = [(PGGraphDateNode *)self yearNode];
  int64_t v3 = [v2 calendarUnitValue];

  return v3;
}

- (PGGraphCalendarUnitNode)weekOfMonthNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 weekOfMonthNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)weekOfYearNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 weekOfYearNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)dayNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 dayNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)monthNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 monthNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)monthDayNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 monthDayNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)yearNode
{
  v2 = [(PGGraphDateNode *)self collection];
  int64_t v3 = [v2 yearNodes];
  id v4 = [v3 anyNode];

  return (PGGraphCalendarUnitNode *)v4;
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"Date";
  return @"Date";
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v4 = [(PGGraphDateNode *)self propertyDictionary];
  uint64_t v5 = (void *)[v3 initWithLabel:@"Date" domain:400 properties:v4];

  return (MANodeFilter *)v5;
}

- (PGGraphDateNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphDateNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PGGraphDateNode (%@)", self->_name];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    uint64_t v5 = self->_name;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphDateNode.", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  uint64_t v5 = @"name";
  v6[0] = name;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 objectForKeyedSubscript:@"name"];
    int v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_name];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphDateNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"name", a4);
  int v7 = [(PGGraphDateNode *)self initWithName:v6];

  return v7;
}

- (PGGraphDateNode)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphDateNode;
  id v6 = [(PGGraphNode *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

+ (id)holidayOfDate
{
  v2 = +[PGGraphHolidayEdge filter];
  id v3 = [v2 outRelation];

  return v3;
}

+ (MARelation)momentOfDate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphDateEdge filter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  BOOL v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (id)weekOfMonthOfDate
{
  v2 = +[PGGraphCalendarUnitEdge weekOfMonthFilter];
  id v3 = [v2 outRelation];

  return v3;
}

+ (id)weekOfYearOfDate
{
  v2 = +[PGGraphCalendarUnitEdge weekOfYearFilter];
  id v3 = [v2 outRelation];

  return v3;
}

+ (MARelation)dayOfWeekOfDate
{
  v2 = +[PGGraphDayOfWeekEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)dayOfDate
{
  v2 = +[PGGraphCalendarUnitEdge dayFilter];
  id v3 = [v2 outRelation];

  return v3;
}

+ (id)monthOfDate
{
  v2 = +[PGGraphCalendarUnitEdge monthFilter];
  id v3 = [v2 outRelation];

  return v3;
}

+ (MARelation)monthDayOfDate
{
  v2 = +[PGGraphCalendarUnitEdge monthDayFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)yearOfDate
{
  v2 = +[PGGraphCalendarUnitEdge yearFilter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)seasonOfDate
{
  v2 = +[PGGraphSeasonEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)filterWithDateNames:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v9 = @"name";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  int v7 = (void *)[v5 initWithLabel:@"Date" domain:400 properties:v6];
  return v7;
}

+ (id)dateNodeForDayNode:(id)a3 monthNode:(id)a4 yearNode:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__49134;
  long long v22 = __Block_byref_object_dispose__49135;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PGGraphDateNode_dateNodeForDayNode_monthNode_yearNode___block_invoke;
  v14[3] = &unk_1E68EAEE8;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  uint64_t v17 = &v18;
  [v7 enumerateNeighborNodesThroughEdgesWithLabel:@"DAY" domain:400 usingBlock:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __57__PGGraphDateNode_dateNodeForDayNode_monthNode_yearNode___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 monthNode];
  int v7 = [v6 isSameNodeAsNode:a1[4]];

  if (v7)
  {
    id v8 = [v10 yearNode];
    int v9 = [v8 isSameNodeAsNode:a1[5]];

    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Date" domain:400];
  return v2;
}

@end