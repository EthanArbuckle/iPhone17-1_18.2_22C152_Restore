@interface RETimeline
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeline:(id)a3;
- (NSArray)transitionDates;
- (NSDate)endDate;
- (NSDate)startDate;
- (RETimeline)init;
- (RETimeline)initWithStartDate:(id)a3 values:(id)a4 durations:(id)a5;
- (RETimeline)initWithTimeline:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForDate:(id)a3;
- (unint64_t)hash;
@end

@implementation RETimeline

- (RETimeline)init
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)RETimeline;
  v2 = [(RETimeline *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF910] distantFuture];
    v9[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    transitionDates = v2->_transitionDates;
    v2->_transitionDates = (NSArray *)v4;

    values = v2->_values;
    v2->_values = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (RETimeline)initWithStartDate:(id)a3 values:(id)a4 durations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 count];
  if (v11 != [v10 count])
  {
    v12 = (void *)*MEMORY[0x263EFF4A0];
    uint64_t v13 = [v9 count];
    [v10 count];
    RERaiseInternalException(v12, @"Number of values (%lu) must match number of durations (%lu)", v14, v15, v16, v17, v18, v19, v13);
  }
  v35.receiver = self;
  v35.super_class = (Class)RETimeline;
  v20 = [(RETimeline *)&v35 init];
  if (v20)
  {
    v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);
    v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    [v21 addObject:v8];
    if ([v9 count])
    {
      unint64_t v23 = 0;
      do
      {
        v24 = [v10 objectAtIndexedSubscript:v23];
        [v24 doubleValue];
        double v26 = v25;

        if (v26 > 0.0)
        {
          v27 = [v21 lastObject];
          v28 = [v27 dateByAddingTimeInterval:v26];
          [v21 addObject:v28];

          v29 = [v9 objectAtIndexedSubscript:v23];
          [v22 addObject:v29];
        }
        ++v23;
      }
      while (v23 < [v9 count]);
    }
    uint64_t v30 = [v21 copy];
    transitionDates = v20->_transitionDates;
    v20->_transitionDates = (NSArray *)v30;

    uint64_t v32 = [v22 copy];
    values = v20->_values;
    v20->_values = (NSArray *)v32;
  }
  return v20;
}

- (NSArray)transitionDates
{
  return self->_transitionDates;
}

- (id)valueForDate:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSArray *)self->_transitionDates count] >= 2)
  {
    v6 = [(RETimeline *)self startDate];
    uint64_t v7 = [(RETimeline *)self endDate];
    uint64_t v14 = (void *)v7;
    if (v6 && v7)
    {
      id v15 = objc_alloc(MEMORY[0x263F08798]);
      uint64_t v16 = [(RETimeline *)self startDate];
      uint64_t v17 = [(RETimeline *)self endDate];
      uint64_t v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];

      if ([v18 containsDate:v4]
        && ([(RETimeline *)self endDate],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            char v20 = [v4 isEqual:v19],
            v19,
            (v20 & 1) == 0))
      {
        NSUInteger v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_transitionDates, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSArray *)self->_transitionDates count], 256, &__block_literal_global_84);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_transitionDates, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSArray *)self->_transitionDates count], 1024, &__block_literal_global_9_1)- 1;
        }
        v5 = [(NSArray *)self->_values objectAtIndexedSubscript:v21];
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"startDate(%@) and endDate(%@) must be non-nil.", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __27__RETimeline_valueForDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __27__RETimeline_valueForDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSDate)startDate
{
  v2 = [(RETimeline *)self transitionDates];
  v3 = [v2 firstObject];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  v2 = [(RETimeline *)self transitionDates];
  v3 = [v2 lastObject];

  return (NSDate *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[RETimeline allocWithZone:a3];
  return [(RETimeline *)v4 initWithTimeline:self];
}

- (unint64_t)hash
{
  v2 = [(RETimeline *)self transitionDates];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RETimeline *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RETimeline *)self isEqualToTimeline:v4];
  }

  return v5;
}

- (BOOL)isEqualToTimeline:(id)a3
{
  id v4 = (RETimeline *)a3;
  BOOL v5 = v4;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    if (v4)
    {
      v6 = [(RETimeline *)self transitionDates];
      uint64_t v7 = [(RETimeline *)v5 transitionDates];
      uint64_t v8 = [v6 count];
      if (v8 == [v7 count])
      {
        if (![v6 count])
        {
LABEL_12:
          BOOL v16 = 1;
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v10 = [v6 objectAtIndexedSubscript:v9];
          uint64_t v11 = [v7 objectAtIndexedSubscript:v9];
          if (![v10 isEqualToDate:v11]) {
            break;
          }
          id v12 = [(RETimeline *)self valueForDate:v10];
          id v13 = [(RETimeline *)v5 valueForDate:v11];
          if (v12 == v13)
          {
          }
          else
          {
            uint64_t v14 = v13;
            char v15 = [v12 isEqual:v13];

            if ((v15 & 1) == 0) {
              goto LABEL_16;
            }
          }
          if (++v9 >= (unint64_t)[v6 count]) {
            goto LABEL_12;
          }
        }
      }
LABEL_16:
      BOOL v16 = 0;
      goto LABEL_17;
    }
    BOOL v16 = 0;
  }
LABEL_18:

  return v16;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  id v4 = [(RETimeline *)self transitionDates];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __25__RETimeline_description__block_invoke;
  v10[3] = &unk_2644BD670;
  id v11 = v4;
  id v12 = self;
  id v5 = v3;
  id v13 = v5;
  id v6 = v4;
  [v6 enumerateObjectsUsingBlock:v10];
  uint64_t v7 = v13;
  id v8 = v5;

  return v8;
}

void __25__RETimeline_description__block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  if ([a1[4] count] - 1 > a3)
  {
    id v5 = [a1[4] objectAtIndexedSubscript:a3 + 1];
    id v6 = [a1[5] valueForDate:v7];
    [a1[6] appendFormat:@"\t%@ - %@ : %@\n", v7, v5, v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_transitionDates, 0);
}

- (RETimeline)initWithTimeline:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  if (v5)
  {
    id v6 = [v4 transitionDates];
    id v7 = (void *)MEMORY[0x263EFF980];
    unint64_t v8 = [v6 count];
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [v7 arrayWithCapacity:v9 - 1];
    id v11 = (void *)MEMORY[0x263EFF980];
    unint64_t v12 = [v6 count];
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    uint64_t v14 = [v11 arrayWithCapacity:v13 - 1];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __51__RETimeline_REExtendedTimeline__initWithTimeline___block_invoke;
    unint64_t v23 = &unk_2644C08E8;
    id v24 = v6;
    id v25 = v4;
    id v26 = v10;
    id v27 = v14;
    id v15 = v14;
    id v16 = v10;
    id v17 = v6;
    [v17 enumerateObjectsUsingBlock:&v20];
    uint64_t v18 = -[RETimeline initWithStartDate:values:durations:](self, "initWithStartDate:values:durations:", v5, v15, v16, v20, v21, v22, v23);
  }
  else
  {
    uint64_t v18 = [(RETimeline *)self init];
  }

  return v18;
}

void __51__RETimeline_REExtendedTimeline__initWithTimeline___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if ([*(id *)(a1 + 32) count] - 1 != a3)
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
    [v5 timeIntervalSinceDate:v12];
    double v7 = v6;
    unint64_t v8 = [v12 dateByAddingTimeInterval:v6 * 0.5];
    uint64_t v9 = [*(id *)(a1 + 40) valueForDate:v8];
    uint64_t v10 = *(void **)(a1 + 48);
    id v11 = [NSNumber numberWithDouble:v7];
    [v10 addObject:v11];

    [*(id *)(a1 + 56) addObject:v9];
  }
}

@end