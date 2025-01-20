@interface STUsageReportGraphDataSet
- (NSArray)dataPoints;
- (NSNumber)average;
- (NSNumber)max;
- (NSNumber)total;
- (STUsageReportGraphDataSet)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 total:(id)a5 max:(id)a6 average:(id)a7 averageAsPercentageOfMax:(double)a8 dataPoints:(id)a9;
- (double)averageAsPercentageOfMax;
- (id)initEmptyDataSetWithTimePeriod:(unint64_t)a3 referenceDate:(id)a4;
- (unint64_t)itemType;
- (unint64_t)timePeriod;
- (void)setAverage:(id)a3;
- (void)setAverageAsPercentageOfMax:(double)a3;
- (void)setDataPoints:(id)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMax:(id)a3;
- (void)setTimePeriod:(unint64_t)a3;
- (void)setTotal:(id)a3;
@end

@implementation STUsageReportGraphDataSet

- (STUsageReportGraphDataSet)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 total:(id)a5 max:(id)a6 average:(id)a7 averageAsPercentageOfMax:(double)a8 dataPoints:(id)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)STUsageReportGraphDataSet;
  v20 = [(STUsageReportGraphDataSet *)&v31 init];
  v21 = v20;
  if (v20)
  {
    v20->_timePeriod = a3;
    v20->_itemType = a4;
    uint64_t v22 = [v16 copy];
    total = v21->_total;
    v21->_total = (NSNumber *)v22;

    uint64_t v24 = [v17 copy];
    max = v21->_max;
    v21->_max = (NSNumber *)v24;

    uint64_t v26 = [v18 copy];
    average = v21->_average;
    v21->_average = (NSNumber *)v26;

    v21->_averageAsPercentageOfMax = a8;
    uint64_t v28 = [v19 copy];
    dataPoints = v21->_dataPoints;
    v21->_dataPoints = (NSArray *)v28;
  }
  return v21;
}

- (id)initEmptyDataSetWithTimePeriod:(unint64_t)a3 referenceDate:(id)a4
{
  id v7 = a4;
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__8;
  v35 = __Block_byref_object_dispose__8;
  id v36 = [v8 startOfDayForDate:v7];
  if (!a3)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"STUsageReportGraphDataSet.m", 66, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

    uint64_t v14 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    uint64_t v18 = 16;
    uint64_t v17 = 1;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      uint64_t v9 = [v8 firstWeekday];
      if ([v8 component:512 fromDate:v32[5]] != v9)
      {
        uint64_t v10 = [v8 nextDateAfterDate:v32[5] matchingUnit:512 value:v9 options:516];
        v11 = (void *)v32[5];
        v32[5] = v10;
      }
      uint64_t v12 = [v8 rangeOfUnit:512 inUnit:0x2000 forDate:v7];
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v12 = 0;
    }
    goto LABEL_10;
  }
  uint64_t v12 = [v8 rangeOfUnit:32 inUnit:16 forDate:v7];
  uint64_t v14 = v16;
  uint64_t v17 = 0;
  uint64_t v18 = 32;
LABEL_11:
  id v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v14];
  v20 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v12, v14);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__STUsageReportGraphDataSet_initEmptyDataSetWithTimePeriod_referenceDate___block_invoke;
  v25[3] = &unk_264768DD8;
  id v21 = v8;
  id v26 = v21;
  uint64_t v28 = &v31;
  uint64_t v29 = v18;
  uint64_t v30 = v17;
  id v22 = v19;
  id v27 = v22;
  [v20 enumerateIndexesUsingBlock:v25];
  v23 = [(STUsageReportGraphDataSet *)self initWithTimePeriod:a3 itemType:1 total:&unk_26D967540 max:&unk_26D967540 average:&unk_26D967540 averageAsPercentageOfMax:v22 dataPoints:0.0];

  _Block_object_dispose(&v31, 8);
  return v23;
}

void __74__STUsageReportGraphDataSet_initEmptyDataSetWithTimePeriod_referenceDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dateByAddingUnit:*(void *)(a1 + 56) value:1 toDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) options:0];
  id v7 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) endDate:v2];
  v3 = [STUsageReportGraphDataPoint alloc];
  v4 = [(STUsageReportGraphDataPoint *)v3 initWithTimePeriod:*(void *)(a1 + 64) itemType:1 dateInterval:v7 total:&unk_26D967540 totalAsPercentageOfMax:MEMORY[0x263EFFA68] segments:0.0];
  [*(id *)(a1 + 40) addObject:v4];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v2;
}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSNumber)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
}

- (NSNumber)average
{
  return self->_average;
}

- (void)setAverage:(id)a3
{
}

- (double)averageAsPercentageOfMax
{
  return self->_averageAsPercentageOfMax;
}

- (void)setAverageAsPercentageOfMax:(double)a3
{
  self->_averageAsPercentageOfMax = a3;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_max, 0);

  objc_storeStrong((id *)&self->_total, 0);
}

@end