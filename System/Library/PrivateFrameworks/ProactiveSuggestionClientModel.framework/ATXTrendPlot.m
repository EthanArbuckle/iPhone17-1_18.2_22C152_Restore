@interface ATXTrendPlot
- (ATXTrendPlot)initWithStartDate:(id)a3 endDate:(id)a4 granularity:(int64_t)a5 binInitialDataProvider:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTrendPlot:(id)a3;
- (NSArray)bins;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)_dateComponentsForGranularity:(int64_t)a3;
- (id)binAtDate:(id)a3;
- (int64_t)granularity;
- (unint64_t)_binIndexForDate:(id)a3;
- (unint64_t)hash;
@end

@implementation ATXTrendPlot

- (ATXTrendPlot)initWithStartDate:(id)a3 endDate:(id)a4 granularity:(int64_t)a5 binInitialDataProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)ATXTrendPlot;
  v13 = [(ATXTrendPlot *)&v33 init];
  v14 = v13;
  if (v13)
  {
    v13->_granularity = a5;
    v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v16 = [(ATXTrendPlot *)v14 _dateComponentsForGranularity:v14->_granularity];
    v17 = (void *)MEMORY[0x1E4F1CA48];
    v18 = [[ATXTrendPlotBin alloc] initWithStartDate:v10];
    v19 = [v17 arrayWithObject:v18];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke;
    v30[3] = &unk_1E5F01AF8;
    id v20 = v11;
    id v31 = v20;
    id v21 = v19;
    id v32 = v21;
    [v15 enumerateDatesStartingAfterDate:v10 matchingComponents:v16 options:2 usingBlock:v30];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke_2;
    v26[3] = &unk_1E5F01B20;
    v22 = (NSArray *)v21;
    v27 = v22;
    id v28 = v20;
    id v29 = v12;
    [(NSArray *)v22 enumerateObjectsUsingBlock:v26];
    bins = v14->_bins;
    v14->_bins = v22;
    v24 = v22;
  }
  return v14;
}

void __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 laterDate:*(void *)(a1 + 32)];

  v7 = v10;
  if (v6 == v10)
  {
    *a4 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = [[ATXTrendPlotBin alloc] initWithStartDate:v10];
    [v8 addObject:v9];

    v7 = v10;
  }
}

void __77__ATXTrendPlot_initWithStartDate_endDate_granularity_binInitialDataProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  unint64_t v5 = a3 + 1;
  if (v5 >= [*(id *)(a1 + 32) count])
  {
    [v10 setEndDate:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
    [v10 setNext:v6];

    v7 = [v10 next];
    v8 = [v7 startDate];
    [v10 setEndDate:v8];
  }
  v9 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v10 setData:v9];
}

- (NSDate)startDate
{
  v2 = [(NSArray *)self->_bins firstObject];
  v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  v2 = [(NSArray *)self->_bins lastObject];
  v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (id)binAtDate:(id)a3
{
  unint64_t v4 = [(ATXTrendPlot *)self _binIndexForDate:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_bins objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (unint64_t)_binIndexForDate:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->_bins count]) {
    goto LABEL_7;
  }
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [(ATXTrendPlot *)self startDate];
  [v7 timeIntervalSinceReferenceDate];
  if (v6 < v8)
  {

LABEL_7:
    unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  [v4 timeIntervalSinceReferenceDate];
  double v10 = v9;
  id v11 = [(ATXTrendPlot *)self endDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (v10 >= v13) {
    goto LABEL_7;
  }
  [v4 timeIntervalSinceReferenceDate];
  double v15 = v14;
  v16 = [(NSArray *)self->_bins lastObject];
  v17 = [v16 startDate];
  [v17 timeIntervalSinceReferenceDate];
  double v19 = v18;

  if (v15 >= v19)
  {
    unint64_t v25 = [(NSArray *)self->_bins count] - 1;
  }
  else
  {
    id v20 = [[ATXTrendPlotBin alloc] initWithStartDate:v4];
    NSUInteger v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_bins, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, [(NSArray *)self->_bins count] - 1, 1024, &__block_literal_global_20);
    v22 = [(NSArray *)self->_bins objectAtIndexedSubscript:v21];
    v23 = [v22 startDate];
    int v24 = [v23 isEqualToDate:v4];

    unint64_t v25 = v21 - (v24 ^ 1u);
  }
LABEL_8:

  return v25;
}

uint64_t __33__ATXTrendPlot__binIndexForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 startDate];
  double v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_dateComponentsForGranularity:(int64_t)a3
{
  id v4 = objc_opt_new();
  double v5 = v4;
  switch(a3)
  {
    case 3:
      [v4 setWeekday:2];
      break;
    case 2:
      [v4 setHour:0];
      break;
    case 1:
      [v4 setMinute:0];
      break;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXTrendPlot *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTrendPlot *)self isEqualToATXTrendPlot:v5];

  return v6;
}

- (BOOL)isEqualToATXTrendPlot:(id)a3
{
  id v4 = (id *)a3;
  if (self->_granularity == v4[1]
    && (NSUInteger v5 = -[NSArray count](self->_bins, "count"), v5 == [v4[2] count]))
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    bins = self->_bins;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__ATXTrendPlot_isEqualToATXTrendPlot___block_invoke;
    v9[3] = &unk_1E5F01B68;
    double v10 = v4;
    id v11 = &v12;
    [(NSArray *)bins enumerateObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __38__ATXTrendPlot_isEqualToATXTrendPlot___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a3];
  double v8 = [v13 startDate];
  double v9 = [v7 startDate];
  if (([v8 isEqualToDate:v9] & 1) == 0)
  {

    goto LABEL_5;
  }
  double v10 = [v13 data];
  id v11 = [v7 data];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t granularity = self->_granularity;
  v3 = self->_bins;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "startDate", (void)v13);
        uint64_t v10 = [v9 hash] - granularity + 32 * granularity;

        id v11 = [v8 data];
        unint64_t granularity = [v11 hash] - v10 + 32 * v10;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return granularity;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (NSArray)bins
{
  return self->_bins;
}

- (void).cxx_destruct
{
}

@end