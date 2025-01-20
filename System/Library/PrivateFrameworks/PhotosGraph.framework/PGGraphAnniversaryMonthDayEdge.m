@interface PGGraphAnniversaryMonthDayEdge
+ (id)filter;
- (PGGraphAnniversaryMonthDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPersonNode:(id)a3 toMonthDayNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphAnniversaryMonthDayEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"ANNIVERSARY_MONTH_DAY";
  return @"ANNIVERSARY_MONTH_DAY";
}

- (PGGraphAnniversaryMonthDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphAnniversaryMonthDayEdge *)[(PGGraphAnniversaryMonthDayEdge *)self initFromPersonNode:a4 toMonthDayNode:a5];
}

- (id)initFromPersonNode:(id)a3 toMonthDayNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphAnniversaryMonthDayEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"ANNIVERSARY_MONTH_DAY" domain:400];
  return v2;
}

@end