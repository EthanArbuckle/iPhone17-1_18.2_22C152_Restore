@interface PGGraphCalendarUnitEdge
+ (MAEdgeFilter)dayFilter;
+ (MAEdgeFilter)dayOfWeekFilter;
+ (MAEdgeFilter)monthDayFilter;
+ (MAEdgeFilter)monthFilter;
+ (MAEdgeFilter)weekOfMonthFilter;
+ (MAEdgeFilter)weekOfYearFilter;
+ (MAEdgeFilter)yearFilter;
- (PGGraphCalendarUnitEdge)initWithCalendarUnit:(unint64_t)a3 fromDateNode:(id)a4 toCalendarUnitNode:(id)a5;
- (PGGraphCalendarUnitEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphCalendarUnitEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  if (*((unsigned __int8 *)self + 40) - 1 > 5) {
    v2 = 0;
  }
  else {
    v2 = *off_1E68ED620[(*((unsigned char *)self + 40) - 1)];
  }
  return v2;
}

- (PGGraphCalendarUnitEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([v10 isEqualToString:@"DAY"])
  {
    uint64_t v13 = 1;
  }
  else if ([v10 isEqualToString:@"MONTH"])
  {
    uint64_t v13 = 2;
  }
  else if ([v10 isEqualToString:@"MONTH_DAY"])
  {
    uint64_t v13 = 3;
  }
  else if ([v10 isEqualToString:@"YEAR"])
  {
    uint64_t v13 = 4;
  }
  else if ([v10 isEqualToString:@"WEEKMONTH"])
  {
    uint64_t v13 = 5;
  }
  else if ([v10 isEqualToString:@"WEEKYEAR"])
  {
    uint64_t v13 = 6;
  }
  else
  {
    uint64_t v13 = 0;
  }

  v14 = [(PGGraphCalendarUnitEdge *)self initWithCalendarUnit:v13 fromDateNode:v12 toCalendarUnitNode:v11];
  return v14;
}

- (PGGraphCalendarUnitEdge)initWithCalendarUnit:(unint64_t)a3 fromDateNode:(id)a4 toCalendarUnitNode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3) {
    __assert_rtn("-[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]", "PGGraphCalendarUnitEdge.m", 53, "calendarUnit != PGGraphCalendarUnitUnitUnknown");
  }
  id v10 = v9;
  v14.receiver = self;
  v14.super_class = (Class)PGGraphCalendarUnitEdge;
  id v11 = [(PGGraphEdge *)&v14 initWithSourceNode:v8 targetNode:v9];
  id v12 = v11;
  if (v11) {
    *((unsigned char *)v11 + 40) = a3;
  }

  return v12;
}

+ (MAEdgeFilter)dayOfWeekFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"DAYOFWEEK" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)weekOfMonthFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"WEEKMONTH" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)weekOfYearFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"WEEKYEAR" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)yearFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"YEAR" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)monthDayFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MONTH_DAY" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)monthFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MONTH" domain:400];
  return (MAEdgeFilter *)v2;
}

+ (MAEdgeFilter)dayFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"DAY" domain:400];
  return (MAEdgeFilter *)v2;
}

@end